class ApplicationController < ActionController::Base
    # after_action :update_user_online, if: :user_signed_in?
    # before_action :set_status, if: :user_signed_in?
 
    # private

    # def set_status
    #     current_user.update(status: "offline") if current_user    
    # end
end
