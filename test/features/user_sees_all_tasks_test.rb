require_relative "../test_helper"

class UserSeesAllTasksTest < FeatureTest

  def test_user_sees_all_tasks
    task_manager.create({title: "Title1", description: "Description1"})
    task_manager.create({title: "Title2", description: "Description2"})

    visit "/tasks"

    assert page.has_content?("(1)")

  end

end
