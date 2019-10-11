class Article < ApplicationRecord
  belongs_to :user
  validates :article_name, presence: true
  validates :tagline, presence: true
  validates :article, presence: true
end
