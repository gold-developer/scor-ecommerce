require 'test_helper'
include Devise::TestHelpers

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  test "should get new" do
    sign_in users(:admin)
    get :new
    assert_response :success
  end

  test "should create category" do
    sign_in users(:admin)
    assert_difference('Category.count') do
      post :create, category: { desc: @category.desc, name: @category.name }
    end

    assert_redirected_to category_path(assigns(:category))
  end

  test "should show category" do
    get :show, id: @category
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:admin)
    get :edit, id: @category
    assert_response :success
  end

  test "should update category" do
    sign_in users(:admin)
    patch :update, id: @category, category: { desc: @category.desc, name: @category.name }
    assert_redirected_to category_path(assigns(:category))
  end

  test "should destroy category" do
    sign_in users(:admin)
    assert_difference('Category.count', -1) do
      delete :destroy, id: @category
    end

    assert_redirected_to categories_path
  end
end
