class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_one :account, dependent: :destroy

  after_create :create_default_account

  private

  def create_default_account
    self.create_account(name: "#{username}'s Account")
  end
end
