ENV["RACK_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require "minitest/autorun"
require "minitest/emoji"
require "tilt/erb"
require "capybara"

module TestHelpers
  def teardown
    task_manager.delete_all
    super
  end

  def task_manager
    database = YAML::Store.new('db/task_manager_test')
    @task_manager ||= TaskManager.new(database)
  end
end

Capybara.app = TaskManagerApp

class FeatureTest < Minitst::Test
  include Capybara::DSL
end
