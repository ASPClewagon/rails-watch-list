class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  validates_associated :bookmarks
  has_many :movies, through: :bookmark
  validates_associated :movies
  validates :name, presence: true, uniqueness: true
end
