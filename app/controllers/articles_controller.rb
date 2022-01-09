class ArticlesController < ApplicationController
    def index
        user = User.find(params[:user_id])
        articles = user.articles
        render json: articles
    end

    def create
        user = User.find(params[:user_id])
        article = user.articles.create(article_params)
        p "padma"
        p article
        if article.save
            render json: article
        else
            render json: article.errors
        end
    end

    def article_list
        articles=Article.all
        render json: articles
    end



    def show
        user=User.find(params[:user_id])
        article=user.articles.find(params[:id])
        render json: article
    end

    

    def update
        user=User.find(params[:user_id])
        article = user.articles.find(params[:id])
        article.update(article_params)
        # article.save
        if article.save
            render json: article
        else
            render json: article.errors
        end
    end

    def destroy
        user = User.find(params[:user_id])
        article=user.articles.find(params[:id])
        article.destroy
        render text: "Article deleted successfully"  
    end

       
    private
        def article_params
          params.permit(:title, :text)
        end
      
end
