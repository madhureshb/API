class ArticlesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @article = Article.all
    render json: @article
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      render json: @article, status: :created 
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def show
    @article = Article.find(params[:id])
    render json: @article
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    render json: @article
  end


  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

end
