class CommentsController < ApplicationController
    def index
        article = Article.find(params[:article_id])
        comment=article.comments
        respond_to do |format|
            format.json { render json: comment}
        end
    end
    

    def create
        article = Article.find(params[:article_id])
        comment = article.comments.create(comment_params)
        p "padma"
        # p comment
        # comment.save
        respond_to do |format|
            format.json { render json: {status: true}}
        end
    end


    def update
        article = Article.find(params[:article_id])
        comment=article.comments.find(params[:id])
        comment.update(comment_params)
        respond_to do |format|
            format.json { render json: comment}
        end
    end


    def destroy
        article = Article.find(params[:article_id])
        comment = article.comments.find(params[:id])
        comment.destroy
        respond_to do |format|
            format.json { render json: comment, status: :created}
        end
    end


    private
        def comment_params
          params.permit(:commenter, :descr)
        end
    
end