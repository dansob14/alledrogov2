# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user.admin?
  end

  def show?
    @user = User.find(params[:id])
    authorize @user 
    if @user || current_user == user.admin?
      render json: :user
    else
      puts "U don't have authorization"
    end
  end
end
