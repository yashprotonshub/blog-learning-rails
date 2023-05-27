class BlogsController < ApplicationController
    def index
        @blogs=Blog.all
    end

    def show
        @show_blog = Blog.find(params[:id])
    end


    def create
        @new_blog = Blog.new(blog_params)
        if @new_blog.save
            redirect_to root_path
        end
    end

    private
        def blog_params
            params.require(:blog).permit(:title, :body)
        end
end
