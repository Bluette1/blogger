# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    if logged_in?
      @comment.author_name = current_user.username
    end
    
    @comment.save

    redirect_to article_path(@comment.article)
  end

  def comment_params
    params.require(:comment).permit(:body, :author_name)
  end

  before_action :require_login, except: [:create]
end
