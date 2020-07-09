Rails.application.routes.draw do
  get 'recruitments/index'
  get 'recruitments/new'
  get 'recruitments/create'
  get 'recruitments/edit'
  get 'recruitments/update'
  get 'recruitments/destroy'
  get 'recruitments/show'
  resources :companies, except: :index

  root "companies#index"
end
