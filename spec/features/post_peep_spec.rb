describe 'Post / creating new peeps' do
  it 'allows API user to create new peeps through post request' do
    peep_count = User.get(1).peeps.count
    post '/peeps', {
      message: 'New peep from post request',
      user_id: 1
    }
    expect_status(201)
    expect(User.get(1).peeps.count).to eq (peep_count + 1)
  end

  it 'returns status 500 error if unsuccessful, e.g. wrong user' do
    peep_count = Peep.all.count
    post '/peeps', {
      message: 'New peep from post request',
      user_id: 5
    }
    expect_status(500)
    expect(Peep.all.count).to eq peep_count
  end
end
