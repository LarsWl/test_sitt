require 'test_helper'

class TestControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get test_new_url
    assert_response :success
  end

  test "should get index" do
    get test_index_url
    assert_response :success
  end

end
