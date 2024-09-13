# frozen_string_literal: true

class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = User.first
    if @tweet.save
      redirect_to tweets_path, notice: 'Tweet created successfully!'
    else
      render :new
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
