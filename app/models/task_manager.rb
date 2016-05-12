require_relative "task"

class TaskManager
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def table
    database.from(:tasks).order(:id)
  end

  def create(task)
    table.insert(title: task[:title], description: task[:description])
  end

  def raw_tasks
    database.transaction do
      database["tasks"] || []
    end
  end

  def all
    table.to_a.map { |data| Task.new(data) }

  end

  def raw_task(id)
    table.where(:id => id).to_a.first
  end

  def find(id)
    Task.new(raw_task(id))
  end

  def update(id, task)
    database.transaction do 
      target_task = database["tasks"].find { |data| data["id"] == id }
      target_task["title"] = task[:title]
      target_task["description"] = task[:description]
    end
  end

  def destroy(id)
    database.transaction do 
      database["tasks"].delete_if { |task| task["id"] == id }
    end
  end

  def delete_all
    table.delete
  end

end
