class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @topic = current_user.topics.build
      @comment = current_user.comments.build
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
