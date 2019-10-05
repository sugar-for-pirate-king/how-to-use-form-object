# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Organization, type: :model do
  it 'is valid with name and user' do
    user = create(:user)
    organization = build(:organization, name: 'Ruby Conf', user: user)
    organization.valid?
    expect(organization.errors.full_messages).to be_blank
  end

  describe '#user' do
    it 'returns user' do
      user = create(:user)
      organization = create(:organization, name: 'Ruby Conf', user: user)
      expect(organization.user).to eq user
    end
  end
end
