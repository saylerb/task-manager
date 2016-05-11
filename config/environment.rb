require "bundler"

Bundler.require

# get the path of the root of the project

APP_ROOT = File.expand_path("..", __dir__)

# require the controller(s):

Dir.glob(File.join(APP_ROOT, "app", "controllers", "*.rb")).each do |file| 
  require file
end

# require the model(s):

Dir.glob(File.join(APP_ROOT, "app", "models", "*.rb")).each do |file|
  require file
end

class TaskManagerApp < Sinatra::Base

  set :root, File.join("..", __dir__)
  set :method_override, true
  set :views, File.join(APP_ROOT, "app", "views")
  set :public_folder, File.join(APP_ROOT, "app", "public")

end
