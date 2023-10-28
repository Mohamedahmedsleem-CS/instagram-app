class Follow < ApplicationRecord


  # belongs_to :follower, class_name: "User", foreign_key: "follower_id"
  # # make this follow belongs to follower, and it need to link to a user.
  # # and the foriegn key which will link the follower tothe user is the follower_id. 
  # # user can have many follower.
  # belongs_to :followed, class_name: "User", foreign_key: "followed_id"
  # # user can follow many users


  # def accept
  #   self.update(accepted: true)
  # end

  before_create :check_privacy

  belongs_to :follower, class_name: "User", foreign_key: "follower_id"
  belongs_to :followed, class_name: "User", foreign_key: "followed_id"

  def accept
    self.update(accepted: true)
  end

  private
  def check_privacy
    self.accepted = true unless self.followed.private
  end


end
