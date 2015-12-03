require 'spec_helper'

feature 'An employee signs up with single-sign-on' do
  visit '/home'
  click_on 'Sign Up'
  mock_single_sign_on
  expect(page).to have_content 'Welcome!'
end

feature 'An employee signs in with signle-sign-on' do
  visit '/home'
  click_on 'Sign In'
  mock_single_sign_on, with: existing_user
  expect(page).to have_content 'Your Contacts'
end
