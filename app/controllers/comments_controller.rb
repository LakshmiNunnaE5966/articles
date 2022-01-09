class CommentsController < ApplicationController
    def index
        article = Article.find(params[:article_id])
        comment=article.comments
        render json: comment
    end
    

    def create
        article = Article.find(params[:article_id])
        comment = article.comments.create(comment_params)
        p "padma"
        render text: "comment created"
    end


    def update
        article = Article.find(params[:article_id])
        comment=article.comments.find(params[:id])
        comment.update(comment_params)
        render json: comment
    end


    def destroy
        article = Article.find(params[:article_id])
        comment = article.comments.find(params[:id])
        comment.destroy
        render text: "Comment deleted" 
    end


    private
        def comment_params
          params.permit(:commenter, :descr)
        end
    
end