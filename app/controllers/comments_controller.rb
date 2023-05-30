class CommentsController < ApplicationController
    def create
        @new_comment= Blog.find(params[:blog_id]).comments.new(comment_params)
        if @new_comment.save
            redirect_to blog_path(params[:blog_id].to_i)
        end
    end


    private
        def comment_params
            params.require(:comment).permit(:body)
        end
end
