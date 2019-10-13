require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe "articles#index action" do
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end


  describe "articles#new action" do
    it "should successfully show the new form" do
      user = User.create(
        email:                 'fakeuser@gmail.com',
        password:              'secretPassword',
        password_confirmation: 'secretPassword'
      )
      sign_in user

      get :new
      expect(response).to have_http_status(:success)
    end
  end


  describe "articles#create action" do
    it "should require users to be logged in" do
    post :create, params: { article: { article_name: "Article Name", tagline: "Tagline", article: "Article" } }
    expect(response).to redirect_to new_user_session_path
  end

  it "should successfully create a new article in our database" do
    user = User.create(
    email:                 'fakeuser@gmail.com',
    password:              'secretPassword',
    password_confirmation: 'secretPassword'
    )
    sign_in user

    post :create, params: { article: { article_name: "Article Name", tagline: "Tagline", article: "Article" } }
    expect(response).to redirect_to root_path

    article = Article.last
    expect(article.article_name).to eq("Article Name")
    expect(article.tagline).to eq("Tagline")
    expect(article.article).to eq("Article")
    expect(article.user).to eq(user)
  end

  it "should properly deal with validation errors" do
    user = User.create(
    email:                 'fakeuser@gmail.com',
    password:              'secretPassword',
    password_confirmation: 'secretPassword'
    )
    sign_in user

    article_count = Article.count
    post :create, params: { article: { article_name: "", tagline: "Tagline", article: "Article"} }
    expect(response).to have_http_status(:unprocessable_entity)
    expect(article_count).to eq Article.count
  end

  end
end