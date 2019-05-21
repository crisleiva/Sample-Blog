# config/initializers/user_devise.rb
Rails.application.config.to_prepare do
  CamaleonCms::SessionHelper.module_eval do
    def cama_current_user
      @cama_current_user ||= current_blogger.try(:decorate)
    end

    def cama_admin_login_path
      new_blogger_session_path
    end
    alias_method :cama_admin_login_url, :cama_admin_login_path

    def cama_admin_register_path
      new_blogger_registration_path
    end
    alias_method :cama_admin_register_url, :cama_admin_register_path

    def cama_admin_logout_path
      destroy_blogger_session_path
    end
    alias_method :cama_admin_logout_url, :cama_admin_logout_path
  end
end
