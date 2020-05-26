# frozen_string_literal: true

Spina::Engine.routes.draw do
  namespace :admin, path: Spina.config.backend_path do
    namespace :blog do
      resources :categories
      resources :posts, except: :show do
        collection do
          get :live
          get :draft
          get :future
        end
      end
    end
  end
end
