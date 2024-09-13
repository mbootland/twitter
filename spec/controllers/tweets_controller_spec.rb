require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
  describe 'GET #index' do
    let(:user) { User.create(username: 'Boots') }
    let!(:tweet) { Tweet.create(content: 'This is a test tweet', user: user) }

    it 'returns a successful response with tweets' do
      get :index
      expect(response).to be_successful
      expect(Tweet.all.count).to eq(1)
    end
  end
end
