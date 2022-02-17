Rails.application.routes.draw do
  get("/", { :controller => "user", :action => "homepage" })
  
  get("/users", { :controller => "user", :action => "landing_page" })
  get("/users/:path_id", { :controller => "user", :action => "user_details" })
  get("/insert_user_record", { :controller => "user", :action => "add" })
  get("/update_user/:path_id", { :controller => "user", :action => "update" })

  get("/photos", { :controller => "photo", :action => "landing_page" })
  get("/photos/:path_id", { :controller => "photo", :action => "photo_details" })
  get("/delete_photo/:path_id", { :controller => "photo", :action => "delete" })
  get("/insert_photo", { :controller => "photo", :action => "add"})
  get("/update_photo/:path_id", { :controller => "photo", :action => "update"})
end
