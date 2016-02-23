describe 'Getting peeps' do

  before(:all) do
    user = create(:user)
    create(:peep, user: user)
    create(:peep, user: user)
  end

  it 'allows user to get peeps' do
    get '/peeps'
    expect_json_types('*', :array_of_objects)
    expect_json_types('*.', id: :int, message: :string)
  end

  it 'allows user to get specific peep' do
    get '/peeps/2'
    expect_json(id: 2)
  end

  it 'receives status 404 if peep does not exist' do
    get '/peeps/3'
    expect_status(404)
  end
end
