class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :images, presence: true, blob: { content_type: :image } # supported options: :web_image, :image, :audio, :video, :text
end
