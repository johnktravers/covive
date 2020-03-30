class User < ApplicationRecord
  validates_presence_of :name, :email, :role
  validates_uniqueness_of :email
  validates :phone,
    presence: true,
    length: { is: 10 },
    numericality: { only_integer: true }

  has_secure_password

  enum role: %w(quarantined helper)

  has_many :addresses
  has_many :errands
end
