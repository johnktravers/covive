class Errand < ApplicationRecord
  validates_presence_of :name, :category, :urgency, :notes
  validates_inclusion_of :completed?, in: [true, false]

  enum category: %w(grocery pharmacy other)
  enum urgency:  %w(low medium high critical)

  belongs_to :user
  has_many :addresses
end
