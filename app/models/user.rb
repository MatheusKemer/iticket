class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true

  def self.find_or_create params
    binding.pry
    user = User.find_by(email: params[:email])
    return user if user.present?
    User.create params #not cool
  end
end
