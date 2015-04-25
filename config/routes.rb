Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'home#index'

  devise_for :users
  devise_scope :user do
    post 'users/add_sign_in_time' => "users#add_sign_in_time"
  end

  post "site_state/sign_in_user" => "site_state#add_sign_in_user"
  delete "site_state/sign_in_user" => "site_state#delete_sign_in_user"
  post "site_state/unsign_in_user" => "site_state#add_unsign_in_user"
  delete "site_state/unsign_in_user" => "site_state#delete_unsign_in_user"

  resource :api do
    get "site_state/current_sign_in_user_count" => "site_state#current_sign_in_user_count"
    get "site_state/current_unsign_in_user_count" => "site_state#current_unsign_in_user_count"
  end

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
