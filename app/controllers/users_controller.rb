class UsersController < ApplicationController
    def index
        users=User.all
        respond_to do |format|
            format.json { render json: users}
        end
    end

    def show
        user=User.find(params[:id])
        respond_to do |format|
            format.json { render json: user, status: :created}
        end
    end


    def create
        user = User.create(user_params)
        respond_to do |format|
            format.json { render json: user, status: :created}
        end
    end
    
    def destroy
        user=User.find(params[:id])
        user.destroy
        respond_to do |format|
            format.json { render json: user, status: :created}
        end
    end

    private
        def user_params
          params.require(:user).permit(:name)
        end
end
