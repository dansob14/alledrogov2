class Users::RegistrationsController < Devise::RegistrationsController
    respond_to :json
    before_action :configure_permitted_parameters, if: :devise_controller?

    
    private
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :address])
    end
    
    def respond_with(resource, _opts = {})
      register_success && return if resource.persisted?
  
      register_failed
    end
  
    def register_success
      render json: { message: 'Signed up sucessfully.' }
    end
  
    def register_failed
      render json: { message: "Something went wrong." }
    end
  end