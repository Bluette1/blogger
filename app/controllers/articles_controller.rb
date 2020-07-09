class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    @articles = Article.all
    respond_to do |format|
      format.html
      format.xml { render xml: @articles }
      format.json { render json: @articles }
      format.rss
    end
  end

  def show
    @article = Article.find(params[:id])
    @article.count_views
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.author_id = current_user.id
    @article.view_count = 0
    @article.save
    flash.notice = "Article '#{@article.title}' Created!"
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "Article '#{@article.title}' Destroyed!"
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    flash.notice = "Article '#{@article.title}' Updated!"
    redirect_to article_path(@article)
  end

  before_action :require_login, except: %i[show index most_popular]

  before_action :check_user, only: %i[edit update destroy]

  def check_user
    @article = Article.find(params[:id])
    unless current_user.id == @article.author_id
      redirect_to root_path
      false
    end
  end

  def most_popular
    @articles = Article.order('view_count desc').first(3)
  end
end
