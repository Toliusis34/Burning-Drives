class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

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

  def edit
    @article = Article.find(params[:id])
    if @article.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
    @article.update_attributes(article_params)
    redirect_to article_path
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
    @article.destroy
    redirect_to root_path
  end

  private

  def article_params
    params.require(:article).permit(:article_name, :tagline, :article)
  end

end
