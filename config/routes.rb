Rails.application.routes.draw do
  root 'visitors#index'
  devise_for :users
  resources :students, :teachers do
    get :subjects
  end
  get '/reports/subjects', to: 'reports#subjects' do
    get :subjects
  end
end
