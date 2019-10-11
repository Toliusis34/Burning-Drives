class Article < ApplicationRecord
  belongs_to :game
  has_many :photos
  belongs_to :user
end
