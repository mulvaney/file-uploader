require 'test_helper'


class DocumentsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  context "Without a user" do
    should "redirect to sign in" do
      get :index
      assert_redirected_to user_session_path
    end
  end

  context "with an unconfirmed user" do
    should "redirect to sign in" do
      get :index
      assert_response 302
    end

    should "redirect with out creating document" do
      assert_no_difference('Document.count') do
        @document = documents(:one)
        post :create, document: @document.attributes
      end
      
      assert_redirected_to user_session_path
    end

  end

  context "with a signed in user" do
    setup do
      sign_in users(:testuser)
      @document = documents(:one)
    end

    should "get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:documents)
    end

    should "get new" do
      get :new
      assert_response :success
    end

    should "create document" do
      assert_difference('Document.count') do
        post :create, document: @document.attributes
      end
      
      assert_redirected_to document_path(assigns(:document))
    end

    should " show document" do
      get :show, id: @document.to_param
      assert_response :success
    end

    should " get edit" do
      get :edit, id: @document.to_param
      assert_response :success
    end

    should " update document" do
      put :update, id: @document.to_param, document: @document.attributes
      assert_redirected_to document_path(assigns(:document))
    end

    should "destroy document" do
      assert_difference('Document.count', -1) do
        delete :destroy, id: @document.to_param
      end

      assert_redirected_to documents_path
    end
  end
end
