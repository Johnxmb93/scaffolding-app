class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.all
   
    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @posts }
    end
  end
  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def new
    @post = Post.new
   
    respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @post }
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:name, :title, :content)
    end
end
