Rails.application.routes.draw do
root to: "memos#top"
get "/new",to: "memos#new"
post "/create",to:"memos#create"
delete "/memos/:id",to:"memos#destroy"
get "/memos/:id/edit",to:"memos#edit"
patch "/memos/:id",to:"memos#update"
get "/categories/:id",to:"categories#show"
get "/all",to:"memos#index"
get "/memos/:id/details",to: "memos#details"
post "/search",to:"memos#search"

 
end
