class Photo < ApplicationRecord

  belongs_to :article
  belongs_to :game
  belongs_to :user
end
