class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all

    render json: @tweets
  end

  def show
    @tweet = Tweet.find(params[:id])

    render json: @tweet
  end

  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      render json: @tweet, status: :created, location: @tweet
    else
      render json: @tweet.errors, status: :unprocessable_entity
    end
  end

  def update
    @tweet = Tweet.find(params[:id])

    if @tweet.update(tweet_params)
      head :no_content
    else
      render json: @tweet.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy

    head :no_content
  end

  private

    def tweet_params
      params.require(:tweet).permit(:content, :poster_id)
    end
end
