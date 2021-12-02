Rails.application.routes.draw do
  resources :users do
    member do
      post :sign_in
      post :sign_out
    end
  end

  resources :welcome, only:[:index]
  root 'welcome#index'
end
