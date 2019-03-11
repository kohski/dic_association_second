class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    if params[:back]
      @blog = Blog.new(set_blog)
    else
      @blog = Blog.new
    end
  end

  def create
    @blog = Blog.new(set_blog)
    if @blog.save
      redirect_to blogs_path
    else
      render 'new'
    end
  end

  def edit
    @blog = Blog.find(params[:id])

  end

  def update
    if @blog.update(set_blog)
      redirect_to blogs_path
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy(set_blog)
  end

  def confirm
    @blog = Blog.new(set_blog)
    render 'new' if @blog.invalid?
  end

  def show
    @blog = Blog.find(params[:id])
  end

  private

  def set_blog
    params.require(:blog).permit(:title,:content)
  end


end
