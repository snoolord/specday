require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it 'renders new user page' do
      get :new, user: {}
      expect(response).to render_template("new")
    end
  end

  describe 'POST #create' do
    context "with invalid params" do
      it 'validates the presence of a password and username' do
        post :create, user: { username: "bill" }
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
    end

    context 'with valid params' do
      it 'redirects to user\'s profile' do
        post :create, user: { username: "bill", password: "password" }
        expect(response).to redirect_to(user_url(User.find_by(username: "bill")))
      end

      it 'logs in user after successful sign up' do
        post :create, user: { username: "bill", password: "password" }
        expect(session[:session_token]).to eq(User.find_by(username: "bill").session_token)
      end
    end
  end
end
