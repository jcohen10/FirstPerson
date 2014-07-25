require 'rails_helper'

RSpec.describe UsersController, :type => :controller do


  describe "GET #create" do
  let(:user) {FactoryGirl.build :user}
    it "saves a new user to the database" do
      expect {post :create, :user => @user}.to change(User, :count).by(1)
    end
  end


# login a user who exists

# deny login permission w/o valid name/username/password

# deny signup permission w/o valid name/username/password





end
