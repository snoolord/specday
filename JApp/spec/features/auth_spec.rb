require 'rails_helper'

feature 'the sign up process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content "Sign Up"
  end

    feature 'signing up user' do
      before(:each) do
        visit new_user_url
        fill_in 'Username', with: 'testing_username'
        fill_in 'Password', with: 'biscuits'
        click_on 'Sign Up'
      end

      scenario 'redirects to user show page after signup' do
        expect(page).to have_content(User.last.username)
      end
    end
end
