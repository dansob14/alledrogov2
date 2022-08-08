class MembersController < ApplicationController
    before_action :authenticate_user!, only: %i[show]
  
    def show
      render json: { message: "If you see this, you're in!" }
    end
  end