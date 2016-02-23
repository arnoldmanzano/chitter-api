module TestHelpers
  def TestHelpers.fill_database
    user1 = FactoryGirl.create(:user, username: 'user1', email: 'user1@email.com')
    user2 = FactoryGirl.create(:user, username: 'user2', email: 'user2@gmail.com')
    FactoryGirl.create(:peep, user: user1)
    FactoryGirl.create(:peep, user: user1)
    FactoryGirl.create(:peep, user: user2)
    FactoryGirl.create(:peep, user: user2)
  end
end
