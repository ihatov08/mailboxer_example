Rails.application.routes.draw do
  resources :users
  root to: "users#index"

  resources :users do
    resources :conversations do
      post "reply_to_conversation"
    end
    resources :inboxes
    resources :sentboxes
  end
end
