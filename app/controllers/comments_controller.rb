class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  # GET /comments/new
  def new
    post = Post.find(params[:post_id])
    @comment = Comment.new(post: post)
  end

  # GET /comments/1/edit
  def edit; end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to @comment.post, notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      redirect_to @comment.post, notice: 'Comment was successfully updated.'
    else
      render :new
    end
  end

  # DELETE /comments/1
  def destroy
    if @comment.destroy
      redirect_to @comment.post, notice: 'Comment was successfully deleted.'
    else
      render :new
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:post_id, :body)
  end
end
