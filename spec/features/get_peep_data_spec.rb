describe 'Getting peeps' do
  let(:user) { user = create(:user) }

  it 'allows user to get peeps' do
    peep = create(:peep, user: user)
    get '/peeps'
    expect_json_types(message: :string)
  end
end
