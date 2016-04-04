class PostsController < ApplicationController
  # def find_post is activated for the following
  before_action :find_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  # only index and show will be visisble for no logged in users
  before_action :authenticate_user!, except: [:index, :show]

  # post ordered by date created
  def index
    @posts = Post.all.order('created_at DESC')
  end

  # shows comments associated with post_id
  # is equal to the current post
  def show
    @comments = Comment.where(post_id: @post)
  end

  def new
    # @post = Post.new
    @post = current_user.posts.build
  end

  # creates post by passing in current_user info
  # then redirects to the newly created post
  def create
    # @post = Post.new(post_params)
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  # updates the post by id
  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  # deletes the post
  def destroy
    @post.destroy
    redirect_to root_path
  end

  # acts_as_votable gem
  # for upvoting post and storing vote from current user
  def upvote
    @post.upvote_by current_user
    redirect_to :back
  end
  # acts_as_votable gem
  # for downvoting post and storing vote from current user
  def downvote
    @post.downvote_by current_user
    redirect_to :back
  end

  private

  # finds post based in id
  def find_post
    @post = Post.find(params[:id])
  end

  # permits the following params
  def post_params
    params.require(:post).permit(:title, :description, :image)
  end

end
