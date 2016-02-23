describe 'Post / creating new users' do
  it 'allows API user to create new users through post request' do
    post '/users', {
      username: 'user_good',
      email: 'user_good@email.com',
      name: 'User Good',
      password: 'mypassword',
      password_confirmation: 'mypassword'
    }
    expect_status(201)
    expect(User.first(username: 'user_good')).not_to be_nil
  end

  it 'returns status 500 error if unsuccessful, e.g. wrong password' do
    post '/users', {
      username: 'user_bad',
      email: 'user_bad@email.com',
      name: 'User Bad',
      password: 'mypassword',
      password_confirmation: 'wrongpassword'
    }
    expect_status(500)
    expect(User.first(username: 'user_bad')).to be_nil
  end
end
