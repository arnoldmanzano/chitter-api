describe 'Getting users' do
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
    get '/users/3'
    expect_status(404)
  end
end
