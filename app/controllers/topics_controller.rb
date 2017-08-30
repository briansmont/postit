class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
  end

  def new
    @topic = Topic.new
  end

  def created
    @topic = Topic.new
    @topic.title = params[:topic][:title]
    @topic.body = params[:topic][:body]
    
    if @topic.save
      flash[:notice] = "Topic was created, thanks!"
      redirect_to @topic
    else 
      flash.now[:alert] = "Error creating topic :( please try again."
      render :new
    
    end
  end


  def edit
  end
end
