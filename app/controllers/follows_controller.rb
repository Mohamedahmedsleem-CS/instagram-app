class FollowsController < ApplicationController
  before_action :set_user, only: [:follow, :unfollow, :cancel_request]
  before_action :set_follow_req, only: [:accept_follow, :decline_follow]
  def follow
    current_user.follow(@user)
    redirect_back(fallback_location: root_path)
    # that is the direct function just to refresh the page or return to the last page befor calling this action

    # redirect_to @user, notice: 'You are now following this user.'
  end

  def cancel_request
    current_user.cancel_request(@user)
    redirect_back(fallback_location: root_path)
  end


  def unfollow
    current_user.unfollow(@user)
    redirect_back(fallback_location: root_path)
  end

  def accept_follow
  @follow_req.accept
  redirect_back(fallback_location: root_path)
  
  # flash[:notice] = "Follow request accepted."
  end
  
  def decline_follow
    @follow_req.destroy
    redirect_back(fallback_location: root_path)    
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end

  def set_follow_req
    @follow_req = Follow.find(params[:follow_id])
  end

end