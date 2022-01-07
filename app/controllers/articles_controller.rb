class ArticlesController < ApplicationController
    def index
        user = User.find(params[:user_id])
        articles = user.articles
        respond_to do |format|
            format.json { render json: articles}
        end
    end

    def create
        user = User.find(params[:user_id])
        article = user.articles.create(article_params)
        p "padma"
        p article
        article.save!
        respond_to do |format|
            format.json { render json: article}
        end
    end

    def article_list
        articles=Article.all
        respond_to do |format|
            format.json { render json: articles}
        end
    end



    def show
        user=User.find(params[:user_id])
        article=user.articles.find(params[:id])
        respond_to do |format|
            format.json { render json: article, status: :created, serializer: ArticleSerializer}
        end
    end

    

    def update
        user=User.find(params[:user_id])
        article = user.articles.find(params[:id])
        article.update(article_params)
        # article.save
        respond_to do |format|
            format.json { render json: article}
        end
    end

    def destroy
        user = User.find(params[:user_id])
        article=user.articles.find(params[:id])
        article.destroy
        respond_to do |format|
            format.json { render json: article, status: :created}
        end
    end

       
    private
        def article_params
          params.permit(:title, :text)
        end
      
end
