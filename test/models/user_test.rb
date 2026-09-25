require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "user cannot be saved without a name and password" do
    user = User.new

    assert_not user.save
    assert_includes user.errors[:name], "can't be blank"
    assert_includes user.errors[:password], "can't be blank"
  end

  test "user can be saved with a name and password" do
    user = User.new(name: "Maya", password: "password")

    assert user.save
    assert user.password_digest.present?
  end
end
