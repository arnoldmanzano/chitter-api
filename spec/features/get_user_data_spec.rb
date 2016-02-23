describe 'Getting users' do

  before(:all) do
    user1 = create(:user, username: 'user1', email: 'user1@email.com')
    user2 = create(:user, username: 'user2', email: 'user2@gmail.com')
    create(:peep, user: user1)
    create(:peep, user: user2)
  end

  it 'allows API user to get users' do
    get '/users'
    expect_json_types('*', :array_of_objects)
    expect_json_types('*.', id: :int, username: :string, email: :string)
  end

  it 'allows API user to get specific user' do
    get '/users/2'
    expect_json(id: 2)
  end

  it 'receives status 404 if peep does not exist' do
    get '/users/10'
    expect_status(404)
  end
end
