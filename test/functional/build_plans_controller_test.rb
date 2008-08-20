require 'test_helper'

class BuildPlansControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:build_plans)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_build_plan
    assert_difference('BuildPlan.count') do
      post :create, :build_plan => { }
    end

    assert_redirected_to build_plan_path(assigns(:build_plan))
  end

  def test_should_show_build_plan
    get :show, :id => build_plans(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => build_plans(:one).id
    assert_response :success
  end

  def test_should_update_build_plan
    put :update, :id => build_plans(:one).id, :build_plan => { }
    assert_redirected_to build_plan_path(assigns(:build_plan))
  end

  def test_should_destroy_build_plan
    assert_difference('BuildPlan.count', -1) do
      delete :destroy, :id => build_plans(:one).id
    end

    assert_redirected_to build_plans_path
  end
end
