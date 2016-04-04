class CommentsController < ApplicationController
  # authenticate current user first
  before_action :authenticate_user!

  # @post finds post id
  # @comment creates new comment that takes in comment id and passes it the content
  # @comment.user_id stores current user id
  # @comment.post_id stores post.id
	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.create(params[:comment].permit(:content))
		@comment.user_id = current_user.id
		@comment.post_id = @post.id

    # after save, redirects to the post page
		if @comment.save
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end
end
