class Article < ApplicationRecord
  mount_uploader :picture, PictureUploader
  
  belongs_to :user
  validates :picture, presence: true
  validates :article_name, presence: true
  validates :tagline, presence: true
  validates :article, presence: true
end
