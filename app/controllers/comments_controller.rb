class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  
  def create
    @topic = Topic.find(params[:topic_id])
    @comments = @topic.comments

    @comment = current_user.comments.build(comment_params)
    @comment.topic = @topic

    if @comment.save
      flash[:notice] = "Comment was created."
      redirect_to topic_path(@topic)
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      redirect_to topic_path(@topic)
    end

    #@comment = @topic.comments.create(comment_params)
    #redirect_to topic_path(@topic)
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.find(params[:id])
    @comment.destroy
    redirect_to topic_path(@topic) 
  end

  def upvote
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.find(params[:id])
    @comment.votes.create
    redirect_to topic_path(@topic)
  end

  def downvote
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.find(params[:id])
    @comment.votes.last.destroy
    redirect_to topic_path(@topic)
  end
  
  private
  def comment_params
    params.require(:comment).permit(:text, :topic_id)
  end
end
