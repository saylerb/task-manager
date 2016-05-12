require 'minitest/autorun'
require 'minitest/pride'
require_relative 'senator'

class SenatorTest < Minitest::Test

def test_senator_object_exists
  assert_kind_of Senator, Senator.new
end

end
