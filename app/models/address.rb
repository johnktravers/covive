class Address < ApplicationRecord
  validates_presence_of :address, :city, :state, :zip
  validate :user_id_xor_errand_id

  belongs_to :user, optional: true
  belongs_to :errand, optional: true

  private

  def user_id_xor_errand_id
    unless user_id.blank? ^ errand_id.blank?
      errors.add(:base, 'Specify a user or an errand, not both')
    end
  end
end
