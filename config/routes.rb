Sandbox::Application.routes.draw do
  
  match '*re' => 'sandbox#index'
  root :to => 'sandbox#index'

end
