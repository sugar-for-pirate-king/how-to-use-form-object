# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrganizationForm do
  it 'is valid with name, user_name and user_email' do
    form = OrganizationForm.new(
      name: 'Ruby Conf',
      user_name: 'Philip Lambok',
      user_email: 'philiplambok@gmail.com'
    )
    form.valid?
    expect(form.errors.full_messages).to be_blank
  end

  it 'is invalid without name' do
    form = OrganizationForm.new(name: nil)
    form.valid?
    expect(form.errors[:name]).to include "can't be blank"
  end

  it 'is invalid without user_name' do
    form = OrganizationForm.new(user_name: nil)
    form.valid?
    expect(form.errors[:user_name]).to include "can't be blank"
  end

  it 'is invalid without user_email' do
    form = OrganizationForm.new(user_email: nil)
    form.valid?
    expect(form.errors[:user_email]).to include "can't be blank"
  end

  it 'creates new organization and new user' do
    form = OrganizationForm.new(
      name: 'Ruby Conf',
      user_name: 'Philip Lambok',
      user_email: 'philiplambok@gmail.com'
    )
    form.save
    organization = Organization.find_by(name: 'Ruby Conf')
    user = User.find_by(name: 'Philip Lambok')
    expect(organization).to be_present
    expect(user).to be_present
    expect(organization.user).to eq user
  end
end
