class BlogsController < ApplicationController
    def index
        @blogs=Blog.all
    end

    def show
        @show_blog = Blog.find(params[:id])
        @all_comments_for_blog = @show_blog.comments.order(created_at: "desc")
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
