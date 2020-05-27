class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  attr_accessor :title, :photographer, :shutter, :iso, :aperture

  # GET /posts
  def index
    @posts = Post.all

    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    image = Cloudinary::Uploader.upload(params[:image])
    @post = Post.new(title: "New Post", image: image["url"], photographer: "Matt Holmberg", shutter: "125", iso: "400", aperture: "9")
    
    if @post.save
      render json: @post, status: :created, location: @post
      
    else
      render json: @post.errors, status: :unprocessable_entity
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

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:title, :image, :photographer, :shutter, :iso, :aperture)
    end
end
