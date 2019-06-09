require 'random-word'

def password_generator size
  return ["Password size must less than 18 char or great than 5 char. Try later!", "error", "red"] \
    if size < 5 or size > 18

  nums = rand(10..100)
  rest_size = size - 2

  if rest_size < 6
    noun = RandomWord.adjs(not_shorter_than: rest_size, not_longer_than: rest_size).next

    password = "#{noun.capitalize}#{nums}"
    [password, "success", "green"]
  else
    random_adjective_size = rand(rest_size/2-1..rest_size/2+1)
    adjective = RandomWord.adjs(not_shorter_than: random_adjective_size,
                                not_longer_than: random_adjective_size).next

    noun_size = rest_size - random_adjective_size
    noun = RandomWord.adjs(not_shorter_than: noun_size, not_longer_than: noun_size).next

    password = "#{adjective.capitalize}#{noun.capitalize}#{nums}"
    [password, "success", "green"]
  end
end
