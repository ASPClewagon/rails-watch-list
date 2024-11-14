class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :lists
  validates_associated :bookmarks
  validates :name, presence: true, uniqueness: true
  validates :overview, presence: true
end
