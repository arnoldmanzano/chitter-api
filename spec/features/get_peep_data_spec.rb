describe 'Getting peeps' do
  let(:user) { user = create(:user) }

  it 'allows user to get peeps' do
    create(:peep, user: user)
    create(:peep, user: user)
    get '/peeps'
    expect_json_types('*', :array_of_objects)
    expect_json_types('*.', id: :int, message: :string)
  end
end
