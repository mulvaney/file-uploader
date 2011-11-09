require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  context "Without a user" do
    should "redirect to sign in" do
      get :index
      assert_redirected_to user_session_path
    end
  end

  context "with an unconfirmed user" do
    setup do
      sign_in users(:unconfirmed)
    end

    should "redirect to sign in" do
      get :index
      assert_redirected_to user_session_path
    end
  end

  context "with a logged in user" do
    setup do
      sign_in users(:testuser)
    end

    should "show index" do
      get :index
      assert_response :success
    end
  end

end
