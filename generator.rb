# frozen_string_literal: true

require 'random-word'

def password_generator(size)
  return ['Password size must less than 18 char or great than 5 char. Try later!', 'error', 'red'] \
    if (size < 5) || (size > 18)

  nums = rand(10..100)
  rest_size = size - 2

  password = rest_size < 6 ? simple_pass(rest_size, nums) : harder_pass(rest_size, nums)

  [password, 'success', 'green']
end

def simple_pass(size, nums)
  noun = RandomWord.adjs(not_shorter_than: size, not_longer_than: size).next

  "#{noun.capitalize}#{nums}"
end

def harder_pass(size, nums)
  random_adjective_size = rand(size / 2 - 1..size / 2 + 1)
  adjective = RandomWord.adjs(not_shorter_than: random_adjective_size,
                              not_longer_than: random_adjective_size).next

  noun_size = size - random_adjective_size
  noun = RandomWord.adjs(not_shorter_than: noun_size, not_longer_than: noun_size).next

  "#{adjective.capitalize}#{noun.capitalize}#{nums}"
end
