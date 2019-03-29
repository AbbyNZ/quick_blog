class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.published

    respond_to do |format|
      format.html #index.html.erb
      format.json { render json: @posts }
      format.atom
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.published.find(params[:id])

    respond_to do |format|
      format.html #show.html.erb
      format.json { render json: @post }
    end
  end
end
