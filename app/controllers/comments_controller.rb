class CommentsController < ApplicationController
  
  before_action :authenticate_user!
  
  def create
    @post = Post.find(params[:post_id])
    comment = @post.comments.new(comment_params)
    comment.user = current_user
    
    if comment.save
      flash[:notice] = "Comment saved, thanks for contributing!"
      redirect_to [@post.topic, @post]
    else
      flash[:alert] = "Comment failed to save, try again."
      redirect_to [@post.topic, @post]
    end
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    comment = @post.comments.find(params[:id])
    
    if comment.destroy
      flash[:notice] = "Comment deleted."
      redirect_to [@post.topic, @post]
    else
      flash[:alert] = "Comment couldn't be deleted, try again."
      redirect_to [@post.topic, @post]
    end
  end
  
  
  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end
  
end
