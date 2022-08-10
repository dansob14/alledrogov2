module Api
    module V1
      class UsersController < ApplicationController
        before_action :set_user, only: %i[show]
        def index
            render json: { data: ActiveModel::SerializableResource.new(User.all, each_serializer: UserSerializer) }
        end
    
        def show
            render json: UserShowSerializer.new(@user).to_h
        end

        private
        def recipe_params
          params.require(:recipe).permit(%i[name last_name email address post_code city])
        end

        def set_user
          @user = User.find(params[:id])
        end
      end
    end
end