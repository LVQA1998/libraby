class Users::SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for user
    return user_path(id: current_user.id)
  end
end
