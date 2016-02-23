describe 'Getting peeps' do
  it 'allows API user to get peeps' do
    get '/peeps'
    expect_json_types('*', :array_of_objects)
    expect_json_types('*.', id: :int, message: :string, datetime: :date)
  end

  it 'allows API user to get specific peep' do
    get '/peeps/2'
    expect_status(200)
    expect_json(id: 2)
  end

  it 'receives status 404 if peep does not exist' do
    get '/peeps/5'
    expect_status(404)
  end

  it 'allows API user to get peeps from specific user' do
    get '/peeps/user/2'
    expect_status(200)
    expect_json_types('*', :array_of_objects)
    expect_json('*.', user_id: 2)
  end
end
