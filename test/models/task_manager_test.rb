require_relative "../test_helper"

class TaskManagerTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_task
    task_id = task_manager.create({title: "TDD", description: "Learn to test"})
    task = task_manager.find(task_id)

    assert_equal "TDD", task.title
    assert_equal "Learn to test", task.description
    assert_equal task_id, task.id
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
    task_id_1 = task_manager.create({title: "TDD", description: "Learn to test"})
    task_id_2 = task_manager.create({title: "Write Test", description: "Write the find test"})
    task = task_manager.find(task_id_2)

    assert "Write Test", task.title
    assert "Write the find test", task.description
  end

  def test_it_can_update_a_single_task
    task_id = task_manager.create({title: "TDD", description: "Learn to test"})
    task_manager.update(task_id, {title: "Write Test", description: "Write the find test"})

    task = task_manager.find(task_id)

    assert "Write Test", task.title
    assert "Write the find test", task.description
  end

  def test_if_can_destroy_a_single_task
    task_id = task_manager.create({title: "TDD", description: "Learn to test"})

    assert_equal 1, task_manager.all.size

    task_manager.destroy(task_id)

    assert_equal 0, task_manager.all.size
  end

end
