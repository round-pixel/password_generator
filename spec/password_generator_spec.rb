require_relative '../generator'

describe 'password_geneartor' do
  it 'password must contain 2 nums in the end' do
    password, status, _ = password_generator(10)

    expect(password[-2..-1].to_i).to be > 9
    expect(status).to eq "success"
  end

  it 'password length must be greater than 5 chars' do
    password, status, _ = password_generator(4)
    expect(status).to eq "error"
  end

  it 'password length must be less than 18 chars' do
    password, status, _ = password_generator(19)
    expect(status).to eq "error"
  end
end
