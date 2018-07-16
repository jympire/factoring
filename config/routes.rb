Rails.application.routes.draw do
  root 'pages#home'
  
  get 'about' , to: 'pages#about'

  get 'careers' , to: 'pages#careers'

  get 'client-stories', to: 'pages#client_stories'

  get '/support/faq' , to: 'pages#faq'

  get 'invoice-factoring' , to: 'pages#invoice_factoring'

  get 'line-of-credit' , to: 'pages#line_of_credit'
  
  get 'how-it-works' , to: 'pages#how_it_works'

  get 'partner' , to: 'pages#partner'

  get 'press' , to: 'pages#press'

  get 'privacy' , to: 'pages#privacy'

  get 'support' , to: 'pages#support'

  get 'terms' , to: 'pages#terms'

  devise_for :users,
             path: '',
             path_names: {sign_in: 'login', sign_out: 'logout', edit: 'edit', sign_up: 'register'},
             controllers: {registrations: 'registrations'}
  
  resources :users, only: [:show] do
    member do
      post '/verify_phone_number' => 'users#verify_phone_number'
      patch '/update_phone_number' => 'users#update_phone_number'
    end
  end
  
  get 'dashboard' => 'dashboards#index'
end
