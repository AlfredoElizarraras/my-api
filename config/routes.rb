Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    devise_for :users, controllers: { sessions: :sessions },
                       path_names: { sign_in: :login,
                                     sign_out: :logout }

    resource :user, only: [:update, :show]
  end
end
