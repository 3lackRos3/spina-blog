# frozen_string_literal: true

Spina::Engine.routes.draw do
  namespace :blog, path: Spina.config.blog_path do
    root to: 'posts#index'

    get ':id', to: 'posts#show', as: :post

    get 'feed.atom', to: 'posts#index', as: :rss_feed, defaults: { format: :atom }
    get 'categories/:id', to: 'categories#show', as: :category
    get 'archive/:year(/:month)', to: 'posts#archive', as: :archive_posts
  end

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
