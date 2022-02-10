class CaesarCipher
  def initialize(key:)
    @key = key
  end

  def encrypt_file(from_file:, to_file:)
    process_file(from_file, to_file, :encrypt)
  end

  def decrypt_file(from_file:, to_file:)
    process_file(from_file, to_file, :decrypt)
  end

  private

  def process_file(from_file, to_file, processing)
    content = read_file(from_file)

    new_content = process_content(content: content, processing: processing)

    write_file(to_file, new_content)
  end

  def key(processing:)
    if processing == :encrypt
      @key
    else
      -@key
    end
  end

  def process_content(content:, processing:)
    new_content = []
    content.each do |string|
      new_string = ''
      string.chars.each do |char|
        new_char = (char.ord + key(processing: processing)).chr
        new_string << new_char
      end
      new_content << new_string
    end

    new_content
  end

  def read_file(from_file)
    file = File.new(from_file, 'r+')
    file.readlines.map(&:chomp)
  end

  def write_file(to_file, new_content)
    File.open(to_file, 'w') do |file|
      file.puts(*new_content)
    end
  end
end

cipher = CaesarCipher.new(key: 2)
cipher.encrypt_file(
  from_file: 'file_name.txt',
  to_file: 'encrypted_file.txt'
)

cipher.decrypt_file(
  from_file: 'encrypted_file.txt',
  to_file: 'decrypted_file.txt'
)
