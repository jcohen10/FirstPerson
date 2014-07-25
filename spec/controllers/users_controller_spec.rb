require 'rails_helper'
# are we also going to use capybara to simulate
RSpec.describe UsersController, :type => :controller do

  describe "GET #new" do
    it "renders the new user page" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    let(:user) {FactoryGirl.build :user}
    it "saves a new user to the database" do
      expect {post :create, :user => @user}.to change(User, :count).by(1)
    end
  end

  describe "POST #create" do
    let(:user) {FactoryGirl.build(:user, email: nil)}
    it "does not save a new user to the database with invalid attributes" do
      expect {post :create, :user => @user}.to change(User, :count).by(0)
    end
  end

# login a user who exists

# deny login permission w/o valid name/username/password
  #do we need to add validations to active record models to enable this?

# deny signup permission w/o valid name/username/password
  #do we need to add validations to active record models to enable this?

end
