require 'test_helper'

class AliquotsControllerTest < ActionController::TestCase
  setup do
    @aliquot = aliquots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aliquots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aliquot" do
    assert_difference('Aliquot.count') do
      post :create, aliquot: {  }
    end

    assert_redirected_to aliquot_path(assigns(:aliquot))
  end

  test "should show aliquot" do
    get :show, id: @aliquot
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aliquot
    assert_response :success
  end

  test "should update aliquot" do
    patch :update, id: @aliquot, aliquot: {  }
    assert_redirected_to aliquot_path(assigns(:aliquot))
  end

  test "should destroy aliquot" do
    assert_difference('Aliquot.count', -1) do
      delete :destroy, id: @aliquot
    end

    assert_redirected_to aliquots_path
  end
end
