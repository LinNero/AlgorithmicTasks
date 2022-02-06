# require 'debug'

class CaesarCipher
  def encrypt_file(file_name, key)
    @file = File.new(file_name, 'r+')
    content = @file.readlines.map(&:chomp)
    new_content = []
    content.each do |string|
      new_string = ''
      string.chars.each do |char|
        new_char = (char.ord + key).chr
        new_string << new_char
      end
      new_content << new_string
    end

    File.open('encrypted_file.txt', 'w') do |file|
      file.puts(*new_content)
    end
  end

  def decrypt_file(file_name, key)
    @file = File.new(file_name, 'r+')
    content = @file.readlines.map(&:chomp)
    new_content = []
    content.each do |string|
      new_string = ''
      string.chars.each do |char|
        new_char = (char.ord - key).chr
        new_string << new_char
      end
      new_content << new_string
    end

    File.open('decrypted_file.txt', 'w') do |file|
      file.puts(*new_content)
    end
  end
end

cipher = CaesarCipher.new
cipher.encrypt_file('file_name.txt', 2)
cipher.decrypt_file('encrypted_file.txt', 2)

