require_relative "../test_helper"

class TaskManagerTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_task
    task_manager.create({title: "TDD", description: "Learn to test"})
    task = task_manager.find(1)

    assert_equal "TDD", task.title
    assert_equal "Learn to test", task.description
    assert_equal 1, task.id
  end

  def test_it_can_return_all_tasks
    task_manager.create({title: "TDD", description: "Learn to test"})
    task_manager.create({title: "Write Tests", description: "Write the all test"})
    all_tasks = task_manager.all

    assert 2, all_tasks.length
    assert_kind_of Task, all_tasks[0]
    assert_kind_of Task, all_tasks[1]
  end

  def test_it_can_find_a_single_task
    task_manager.create({title: "Write Test", description: "Write the find test"})
    task = task_manager.find(1)

    assert "Write Test", task.title
    assert "Write the find test", task.description
  end

  def test_it_can_update_a_single_task
  end

  def test_if_can_destroy_a_single_task
  end

end
