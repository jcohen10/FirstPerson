class RewardsController < ApplicationController

  def show
    @rewards = Reward.all
    render partial: "rewards/show"
  end

end
