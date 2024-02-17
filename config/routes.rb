Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index"})
  get("/users", { :controller => "users", :action => "index"})
  get("/users/:username", { :controller => "users", :action => "show"})
  post("/insert_user", { :controller => "users", :action => "create"})
  post("/update_user/:path_id", { :controller => "users", :action => "update"})

  get("/photos", { :controller => "photos", :action => "index"})
  get("/photos/:photo_id", { :controller => "photos", :action => "show"})
  get("/delete_photo/:destroy_id", { :controller => "photos", :action => "destroy"})
  post("/insert_photo", { :controller => "photos", :action => "create"})
  post("/update_photo/:path_id", { :controller => "photos", :action => "update"})
  post("/new_comment", { :controller => "photos", :action => "comment"})
end
