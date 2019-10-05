# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with name and email' do
    user = User.new(name: 'Philip Lambok', email: 'philiplambok@gmail.com')
    user.valid?
    expect(user.errors.full_messages).to be_blank
  end

  describe '#organizations' do
    it 'returns organizations' do
      user = create(:user)
      ruby_conf = create(:organization, name: 'Ruby conf', user: user)
      rails_conf = create(:organization, name: 'Rails conf', user: user)
      organizations = [ruby_conf, rails_conf]
      organizations.each do |organization|
        expect(user.organizations).to include organization
      end
    end
  end
end
