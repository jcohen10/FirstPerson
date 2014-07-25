require 'rails_helper'
# are we also going to use capybara to simulate
RSpec.describe UsersController, :type => :controller do

  describe 'GET registrations#edit' do
    it "renders the user's edit page" do
      expect(response).to render_template(:new)
    end
  end


  describe 'PATCH registrations#edit' do
    before :each do
      @user = create(:user)
    end

    # let(:user) {FactoryGirl.build :user}
    context 'valid attributes' do
      it "locates the user" do
        patch :update, id: @user, user: attributes_for(:user)
        expect(assigns(:user)).to eq(@user)
      end

      it "changes user's attributes" do
        patch :update, id: @user,
          user: attributes_for(:user, name: "Bob")
          @user.reload
          expect(@user.name).to eq("Bob")
      end
    end
  end
end
