class MonstersController < ApplicationController
  def index
    @monsters = Monster.all.order(name: :desc)
  end

  def show
    @monster = Monster.find(params[:id])
    if Tweet.where(monster_id: @monster).count ==0
      redirect_to new_tweet_path
    end
  end
end
