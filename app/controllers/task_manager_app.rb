require "models/task_manager"
require "yaml/store"

class TaskManagerApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get "/" do
    erb :dashboard
  end

  get "/tasks" do
    @tasks = ["task1", "task2", "task3"]
    erb :index
  end

  get "/tasks/new" do
    erb :new
  end

  post "/tasks" do
    task_manager.create(params[:task])
    redirect "/tasks"
  end

  def task_manager
    database = YAML::Store.new('db/task_manager')
    @task_manager ||= TaskManager.new(database)
  end
end
