# frozen_string_literal: true

require_relative '../generator'

describe 'password_geneartor' do
  it 'password must contain 2 nums in the end' do
    password, status, _color = password_generator(10)

    expect(password).to match(/\w+\d{2}$/)
    expect(status).to eq 'success'
  end

  it 'password length must be greater than 5 chars' do
    _password, status, _color = password_generator(4)
    expect(status).to eq 'error'
  end

  it 'password length must be less than 18 chars' do
    _password, status, _color = password_generator(19)
    expect(status).to eq 'error'
  end
end

describe 'simple_pass' do
  it 'password must starting with 1 word and ends with 2 nums' do
    password = simple_pass(6, 23)

    expect(password).to match(/^[A-Z]\w+\d{2}$/)
  end
end

describe 'harder_pass' do
  it 'password must starting with 2 word and ends with 2 nums' do
    password = harder_pass(12, 34)

    expect(password).to match(/^[A-Z]\w+[A-Z]\w+\d{2}$/)
  end
end
