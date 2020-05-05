Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
     root  'welcome#home'
     get '/about', to: 'welcome#about'

    resources :articles

    #add the route so that when type /signup and not new it will display a new page
    get '/signup', to: 'users#new'
    #post 'users', to: 'users#create'
    resources :users, except: [:new]
    #alternatively you could do resources :users, except: [:new]

    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
end
