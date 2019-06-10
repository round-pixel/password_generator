# frozen_string_literal: true

require 'colorize'
require_relative 'generator'

memory_size = 0

loop do
  puts "Enter new password length. Press \'R\' to repeat password length. Press \'Q\' to exit"
  input = gets.chomp

  if input.downcase == 'q'
    puts 'Bye'.red
    break
  end

  if input.downcase == 'r'
    password, _status, color = password_generator(memory_size)
    puts password.public_send(color)
    next
  end

  size = input.to_i
  memory_size = size

  password, _status, color = password_generator(size)
  puts password.public_send(color)
end
