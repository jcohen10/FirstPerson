require 'rails_helper'

RSpec.describe UserQuest, :type => :model do
  let(:user_quest) {FactoryGirl.create :user_quest}

  it {should belong_to(:quest)}
  it {should belong_to(:user)}



  it "should attribute XP to user when a quest is completed via the #complete! method" do
    # greg = FactoryGirl.build(:user)
    # greg.save!
    # bar = FactoryGirl.build(:location)
    # bar.save!
    # quest = FactoryGirl.build(:quest)
    # quest.save!
    # user_point = FactoryGirl.build(:user_checkpoint)
    # user_point.save!
    # beer = FactoryGirl.build(:reward)
    # beer.save!
    # checkpoint = FactoryGirl.build(:checkpoint)
    # checkpoint.save!
    # greg_gets_a_beer = FactoryGirl.build(:user_quest)
    # greg_gets_a_beer.save!
    # greg_gets_a_reward = FactoryGirl.build(:user_reward)
    # greg_gets_a_reward.save!
    # gregs_checkin = FactoryGirl.build(:check_in)
    # gregs_checkin.save!

    business = User.new
    business.firstname = "DBC"
    business.email = "dishes@dbc.com"
    business.foursquare_id = 1
    business.save!

    bar = Location.new
    bar.name = "Awesome Bar"
    bar.venue_type = "Bar"
    bar.latitude = 40.7903
    bar.longitude = -73.9597
    bar.address = "48 Wall St, New York, NY 10005"
    bar.save!

    checkin_loc = Location.new
    checkin_loc.name = "CheckIn"
    checkin_loc.venue_type = "checkin_loc"
    checkin_loc.latitude = 40.7703
    checkin_loc.longitude = -73.9997
    checkin_loc.save!

    player = User.new
    player.firstname = "Greg"
    player.email = "greg@dbc.com"
    player.gender = "male"
    player.total_xp = 0
    player.foursquare_id = 2
    player.save!

    quest = Quest.new
    quest.title = "Come Get A Beer!"
    quest.creator_id = business.id
    quest.category = "bar"
    quest.description = "The search for beer commences"
    quest.end_date = Time.now + 1.day
    quest.save!

    beer = Reward.new
    beer.quest_id = quest.id
    # beer.xp = 500
    beer.save!

    checkpoint = Checkpoint.new
    checkpoint.instructions = "Receive beer"
    checkpoint.quest_id = quest.id
    checkpoint.location_id = bar.id
    checkpoint.step_num = 1
    checkpoint.save!

    greg_gets_a_beer = UserQuest.new
    greg_gets_a_beer.quest_id = quest.id
    greg_gets_a_beer.user_id = player.id
    greg_gets_a_beer.complete!


    expect(player.total_xp).to eq(500)
  end

  #-*_*_*_*_* When we comment out the above test, we GAIN 5% on test coverage ********

  # pending "the complete method should update a user's total xp."


  # pending "validates presence of certain attributes."

end
