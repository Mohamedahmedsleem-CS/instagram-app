class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_one_attached :profile_pic

  
  has_many :likes

  has_many :comments

  has_many :follow_requests, -> {where(accepted: false) }, class_name: "Follow", foreign_key: "followed_id"

  has_many :accepted_recieved_requests, -> {where(accepted: true) }, class_name: "Follow", foreign_key: "followed_id"

  has_many :accepted_sent_requests, -> {where(accepted: true) }, class_name: "Follow", foreign_key: "follower_id"

  has_many :followers, through: :accepted_recieved_requests, source: :follower
  has_many :followings, through: :accepted_sent_requests, source: :followed

  
  def follow(user)
    Follow.create(follower: self, followed: user)
  end

  def unfollow(user)
    self.accepted_sent_requests.find_by(followed: user)&.destroy
  end




  # # only recieved (followers) request
  # has_many :accepted_recieved_requests, ->{where(accepted: true)}, class_name: "follow", foreign_key: "followed_id" # my followers
  # has_many :follow_requests, ->{where(accepted: false)}, class_name: "follow", foreign_key: "followed_id" # waiting requests

  # # only sent (followings) request
  # has_many :accepted_sent_requests, ->{where(accepted: true)}, class_name: "follow", foreign_key: "follower_id" # send follow request

  # has_many :followers, through: :accepted_recieved_requests, source: :follower
  # has_many :followings, through: :accepted_sent_requests, source: :followed

  # # helping function

  # def follow(user)
  #   Follow.create(follower: self,followed: user )
  # end

  # def unfollow(user)
  #   self.accepted_sent_requests.find_by(followed: user)&.destroy
  #   # self to find me and 
  # end

  # # all recievd and sent request
  # has_many :recieved_requests, class_name: "follow", foreign_key: "followed_id" # follow me 
  # has_many :sent_requests, class_name: "follow", foreign_key: "follower_id" # who i'm  following

  # has_many :waiting_sent_requests, ->{where(accepted: false)}, class_name: "follow", foreign_key: "follower_id"

end
