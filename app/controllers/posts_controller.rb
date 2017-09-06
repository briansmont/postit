class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]
    @topic = Topic.find(params[:topic_id])
    
    @post.topic = @topic
    @post.user = current_user
    
    if @post.save
      flash[:notice] = "Post was created, thanks!"
      redirect_to [@topic, @post]
    else
      flash.now[:alert] = "Error creating post :( please try again."
      render :new
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post.title = params[:topic][:title]
    @post.body = params[:topic][:body]
    
    if @post.save
      flash[:notice] = "Topic details have been updated."
      redirect_to [@post.topic, @post]
    else
      flash.now[:alert] = "There was an error updating the topic, please try again."
      render :edit
    end
  end
  
  
  def destroy 
    @post = Post.find(params[:id])
    
    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted succesfully!"
      redirect_to @post.topic
    else
      flash.now[:alert] = "There was an error deleting the post, please try again."
      render :show
    end
  end
  

  
  
end
