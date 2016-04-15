class TopicsController < ApplicationController
  #has_many :comments
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  
  def new
    @topic = Topic.new
  end

  def create
    #render plain: params[:topic].inspect
    #@topic = Topic.new(topic_params)
    @topic = current_user.topics.build(topic_params)
    if @topic.save
      #redirect_to @topic
      flash[:success] = "Dicscussion topics created!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])

    if @topic.update(topic_params)
      redirect_to @topic
    else
      render 'edit'
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_path
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def index
    @topics = Topic.all
  end

  private
  def topic_params
    params.require(:topic).permit(:title, :content)
  end

  def correct_user
    @topic = current_user.topics.find_by(id: params[:id])
    redirect_to root_url if @topic.nil?
  end

end
