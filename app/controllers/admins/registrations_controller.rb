class Admins::RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication, only: [:new, :create, :cancel]
  prepend_before_action :authenticate_super_admin!, only: [:new, :create, :cancel]

  protected
    def sign_up(resource_name, resource)
      #
    end

    def authenticate_super_admin!
      authenticate_scope!
      unless resource.super_admin?
        redirect_to root_path
      end
    end
end
