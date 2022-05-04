require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
  end

  describe 'associations' do
    it { should have_many(:twitter_messages) }
  end

  describe 'sincronization' do
    let(:username){'rails'}
    before do
      create(:user, username: username)
    end

    it 'should create TwitterMessage with twitter api response' do
      VCR.use_cassette("twitter_api") do
        User.sync_all
        user = User.find_by(username: username)
        expect(user).to have(20).twitter_messages
      end
    end
  end
end
