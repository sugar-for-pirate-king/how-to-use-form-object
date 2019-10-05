# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create new organization', type: :system do
  context 'with valid params' do
    it 'returns success message' do
      visit new_organization_path
      fill_in :organization_form_name, with: 'Ruby conf'
      fill_in :organization_form_user_name, with: 'Philip Lambok'
      fill_in :organization_form_user_email, with: 'philiplambok@gmail.com'
      click_on 'Submit'
      expect(page).to have_content 'Organization has been created'
    end
  end

  context 'with invalid params' do
    it 'returns error message' do
      visit new_organization_path
      click_on 'Submit'
      expect(page).to have_content "Name can't be blank"
      expect(page).to have_content "User name can't be blank"
      expect(page).to have_content "User email can't be blank"
    end
  end
end
