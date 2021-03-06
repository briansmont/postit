class TopicsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :authorize_user, except: [:index, :show]
  
  
  
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new
    @topic.title = params[:topic][:title]
    @topic.body = params[:topic][:body]
    
    @topic.user = current_user
    
    
    if @topic.save
      flash[:notice] = "Topic was created, thanks!"
      redirect_to @topic
    else 
      flash.now[:alert] = "Error creating topic :( please try again."
      render :new
    
    end
  end


  def edit
    @topic = Topic.find(params[:id])
  end
  
  def update
    @topic = Topic.find(params[:id])
    @topic.title = params[:topic][:title]
    @topic.body = params[:topic][:body]
    
    if @topic.save
      flash[:notice] = "Topic details have been updated."
      redirect_to @topic
    else
      flash.now[:alert] = "There was an error updating the topic, please try again."
      render :edit
    end
  end
  
  
  def destroy 
    @topic = Topic.find(params[:id])
    
    if @topic.destroy
      flash[:notice] = "\"#{@topic.title}\" was deleted succesfully!"
      redirect_to topics_path
    else
      flash.now[:alert] = "There was an error deleting the topic, please try again."
      render :show
    end
  end
  
  
  private
  
  def authorize_user
    unless current_user.premium? || current_user.admin?
      flash[:alert] = "You must be a premium member to perform this action. Upgrade and check out all the new things :)"
      redirect_to topics_path
    end
    
  end
  
  
  
end
