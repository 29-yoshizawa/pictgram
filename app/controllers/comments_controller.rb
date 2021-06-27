class CommentsController < ApplicationController
    def index
        @comment_topics = current_user.comment_topics
    end

    def new
        @comment = Comment.new
        @comment.topic_id = params[:topic_id]
        @comment.user_id = current_user.id
        #binding.pry
        respond_to do | format |
            format.html
            format.js
        end
    end
    
    def create
        @comment = current_user.comments.new(comment_params)
       # binding.pry

        if @comment.save
            redirect_to topics_path, success: 'コメントをしました'
        else
            redirect_to topics_path, danger: 'コメントに失敗しました'
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:user_id, :topic_id, :content)
    end
    
end
    