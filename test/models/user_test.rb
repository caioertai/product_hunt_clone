require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "#full_name returns first and last name" do
    # SETUP
    user = User.new(first_name: "John", last_name: "Lennon")
    # EXERCISE
    actual_full_name = user.full_name
    # VERIFY
    assert_equal("John Lennon", actual_full_name) # rspec reverses this
    # TEARDOWN
    # ---
  end

  test "#full_name returns capitalized name" do
    user = User.new(first_name: "jOhn", last_name: "leNNon")
    actual_full_name = user.full_name
    assert_equal("John Lennon", actual_full_name)
  end

  test "#full_name works without last name" do
    user = User.new(first_name: "John", last_name: nil)
    actual_full_name = user.full_name
    assert_equal("John", actual_full_name)
  end
end
