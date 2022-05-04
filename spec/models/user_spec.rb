require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
  end
  
  describe 'sincronization' do
    let(:username){'dillon'}
    before do
      #WebMock.disable_net_connect!(:allow => 'api.twitter.com')
      stub_request(:get, /api.twitter.com/).
        with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(status: 200, body: "{data: {id: '123', attrs: {text: 'hello world'}}}", headers: {})
      create(:user, username: username)
    end

    it 'should create TwitterMessage with twitter api response' do
      User.sync_all
    end
  end
end
