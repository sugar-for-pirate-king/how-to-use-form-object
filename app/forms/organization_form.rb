# frozen_string_literal: true

class OrganizationForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :user_name, :string
  attribute :user_email, :string

  validates :name, presence: true
  validates :user_name, presence: true
  validates :user_email, presence: true

  def save
    return false if invalid?

    user = User.new(name: user_name, email: user_email)
    user.save
    organization = user.organizations.build(name: name)
    organization.save

    true
  end
end
