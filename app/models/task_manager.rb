class TaskManager
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(task)
    database.transaction do
      database["tasks"] ||= []
      database["total"] ||= 0
      database["total"] += 1
      # require "pry"; binding.pry
      database['tasks'] << { "id" => database['total'],
                             "title" => task[:title],
                             "description" => task[:description] }
    end
  end
end
