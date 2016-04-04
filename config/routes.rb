Rails.application.routes.draw do

  # requirement for devise gem
  devise_for :users

  # adding member route because ir requires and ID to
  # post to acts_as_votable gem
  # comments is nested in post for references
  resources :posts do
    member do
      get "like", to: "posts#upvote"
      get "dislike", to: "posts#downvote"
    end
    resources :comments
  end

  # root goes to post.html.erb
  root 'posts#index'
end

#                   Prefix Verb   URI Pattern                                 Controller#Action
#         new_user_session GET    /users/sign_in(.:format)                    devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                    devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                   devise/sessions#destroy
#            user_password POST   /users/password(.:format)                   devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)               devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)              devise/passwords#edit
#                          PATCH  /users/password(.:format)                   devise/passwords#update
#                          PUT    /users/password(.:format)                   devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                     devise/registrations#cancel
#        user_registration POST   /users(.:format)                            devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                    devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                       devise/registrations#edit
#                          PATCH  /users(.:format)                            devise/registrations#update
#                          PUT    /users(.:format)                            devise/registrations#update
#                          DELETE /users(.:format)                            devise/registrations#destroy
#                like_post GET    /posts/:id/like(.:format)                   posts#upvote
#             dislike_post GET    /posts/:id/dislike(.:format)                posts#downvote
#            post_comments GET    /posts/:post_id/comments(.:format)          comments#index
#                          POST   /posts/:post_id/comments(.:format)          comments#create
#         new_post_comment GET    /posts/:post_id/comments/new(.:format)      comments#new
#        edit_post_comment GET    /posts/:post_id/comments/:id/edit(.:format) comments#edit
#             post_comment GET    /posts/:post_id/comments/:id(.:format)      comments#show
#                          PATCH  /posts/:post_id/comments/:id(.:format)      comments#update
#                          PUT    /posts/:post_id/comments/:id(.:format)      comments#update
#                          DELETE /posts/:post_id/comments/:id(.:format)      comments#destroy
#                    posts GET    /posts(.:format)                            posts#index
#                          POST   /posts(.:format)                            posts#create
#                 new_post GET    /posts/new(.:format)                        posts#new
#                edit_post GET    /posts/:id/edit(.:format)                   posts#edit
#                     post GET    /posts/:id(.:format)                        posts#show
#                          PATCH  /posts/:id(.:format)                        posts#update
#                          PUT    /posts/:id(.:format)                        posts#update
#                          DELETE /posts/:id(.:format)                        posts#destroy
#                     root GET    /                                           posts#index
