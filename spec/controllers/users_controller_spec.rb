require 'rails_helper'
# are we also going to use capybara to simulate
RSpec.describe UsersController, :type => :controller do

  describe 'GET #new' do
    it 'assigns a new user to @user' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let(:user) {FactoryGirl.build :user}
      it 'saves the new user to the database' do
        expect {post :create, :user => @user}.to change(User, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      let(:user) {FactoryGirl.build :invalid_user}
      it 'does not save the new user to the database' do
        expect {post :create, :user => @user}.to change(User, :count).by(0)
      end
    end
  end

  describe 'POST #login' do
    context 'with valid attributes' do
      let(:user) {FactoryGirl.build :user}
      it 'logs in a valid user' do
        expect {assigns(:user)}.to eq user
      end
    end

    context 'with invalid attributes' do
      let(:user) {FactoryGirl.build :invalid_user}
      it 'does not log in an invalid user' do
        expect {assigns(:invalid_user)}.to not_eq user
      end
    end

  end



end




#************************** other comments

# login a user who exists

# deny login permission w/o valid name/username/password
  #do we need to add validations to active record models to enable this?

# deny signup permission w/o valid name/username/password
  #do we need to add validations to active record models to enable this?

