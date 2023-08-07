class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user_id, uniqueness: {scope: :post_id}
  # validate that the user ID is unique uniqueness under the scope of the post ID and that will make sure that our user ID is unique within the scope if the post ID , so it will make sure that posts are unique 
  # (the user ID and post ID are unique)
end
