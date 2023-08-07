class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :images, presence: true, blob: { content_type: :image } # supported options: :web_image, :image, :audio, :video, :text
  

  has_many :likes
  has_many :likers, through: :likes, source: :user
  # the post has many likers through the likes model and give the user ID from the source of user model
  # (the  user which is inside the like model )

end
