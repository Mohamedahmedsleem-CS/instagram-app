class HomeController < ApplicationController
  before_action :set_suggestions
  before_action :set_feeds
  def index
  end

  private
    def set_feeds
      @feeds = Post.where(user: [current_user, current_user.followings].flatten).order(created_at: :desc)
    end

  def set_suggestions
    @suggestions = []
    @suggestions = [current_user.followers]
    [current_user.followers, current_user.followings].flatten.uniq.each do |f|
      @suggestions.append([f.followers, f.followings])
    end
    @suggestions = [@suggestions, User.all.sample(10)].flatten.uniq - [current_user.followings, current_user].flatten 
    @suggestions = @suggestions.sample(5)
  end
end

# class HomeController <  ApplicationController
#   before_action :set_suggestions
#   
#   def index
#   end



#  
#   # fuction has 2 parts
#   # part1: 
#   #   1- get the user followers and followings and represnt each one of them  as (f) variabel then save it in the main array @suggestions
#   # part2:  
#   #   Add 10 random User records to the existing @suggestions array
#   #   Flatten it to a single array
#   #   Make the array unique to remove duplicates
#   # This gives us the existing suggestions plus 10 random ones.
#     # then 
#   #   Subtract the current user's followings
#   #   Also remove the current user
#   #   Flatten again in case these are arrays
#   #   This filters out any suggestions that are already being followed by 
#   #   the current user or the user themselves.
    
  
#   def set_suggestions
#     # part 1
#     @suggestions = [current_user.followers]
#     [current_user.followers, current_user.followings].flatten.uniq.each do |f|
#       @suggestions.append([f.followers, f.followings])
#     end
#     # part 2
#     @suggestions = [@suggestions, User.all.sample(10)].flatten.uniq - [current_user.followings, current_user].flatten 
#     @suggestions = @suggestions.sample(5)
#   end

# end
