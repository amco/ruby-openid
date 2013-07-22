RailsOpenid::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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

  root 'login#index'

  get  'consumer' => 'consumer#index'
  get  'consumer/complete' => 'consumer#complete'
  post 'consumer/start' => 'consumer#start'

  get  'logout' => 'login#logout'
  post 'login/submit' => 'login#submit'

  get  'server' => 'server#index'
  post 'server' => 'server#index'
  #map.connect 'server/xrds', :controller => 'server', :action => 'idp_xrds'
  get "server/xrds" => 'server#idp_xrds'

  #map.connect 'user/:username', :controller => 'server', :action => 'user_page'
  get 'user/:username' => 'server#user_page', as: :server_user_page

  #map.connect 'user/:username/xrds', :controller => 'server', :action => 'user_xrds'
  get 'user/:username/xrds' => 'server#user_xrds', as: :server_user_xrds

  # Allow downloading Web Service WSDL as a file with an extension
  # instead of a file named 'wsdl'
  #map.connect ':controller/service.wsdl', :action => 'wsdl'

  # Install the default route as the lowest priority.
  #map.connect ':controller/:action/:id'
end
