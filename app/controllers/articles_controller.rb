class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @articles = Article.all
    @articles = Article.paginate(page: params[:page], per_page: 10)
  end

  def new
    @article= Article.new
  end

  def create
    current_user.articles.create(article_params)
    redirect_to root_path
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:article_name, :tagline, :article)
  end

end
