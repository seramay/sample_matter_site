Rails.application.routes.draw do
  resources :companies, except: :index

  root "companies#index"
end
