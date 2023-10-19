class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :images, presence: true, blob: { content_type: :image } # supported options: :web_image, :image, :audio, :video, :text
  

  has_many :likes, dependent: :destroy
  #if we try to delete this post, ther is some likes and comments, which depends on this post.
  # if we deleted the post then the dependdency is to destroy also the likes and destroy also the comments.
  has_many :likers, through: :likes, source: :user
  # the post has many likers through the likes model and give the user ID from the source of user model
  # (the  user which is inside the like model )
  has_many :comments, dependent: :destroy
end
