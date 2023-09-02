class CommentsController < ApplicationController
  before_action :set_post, only: [:create]
    # set the post and then put the comment parameter which has the user_id and comment_body
  def create 
    @comment = @post.comments.create(user: current_user, body: params[:comment_body])

 
      # if there is a new comment created
          respond_to do |format|
            format.turbo_stream do 
              # to refresh all the comments as we need to show on the last five comments 
              render turbo_stream: turbo_stream.replace(
                # and refresh the counter of comments  ( View all 6 comments )
                "post#{@post.id}comments",
                # replace this in the partial (post_comments) 
                partial: "posts/post_comments",
                # send locals of the post to be our post 
                locals: {post: @post}
              )
            end
          end
  end

  def destroy 
    @comment = Comment.find(params[:id])
    if(@comment.user == current_user)
      @comment.destroy

      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.remove(
            "post#{@comment.post_id}ModalComment#{@comment.id}"
          )
        end
      end
    end
  end

  private
  def set_post 
    @post = Post.find(params[:post_id])
  end
end


# 1- after reading this post 
# 2- let's respond to 


