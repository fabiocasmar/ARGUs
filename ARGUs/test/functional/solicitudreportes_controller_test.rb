require File.dirname(__FILE__) + '/../test_helper'
require 'solicitudreportes_controller'

# Re-raise errors caught by the controller.
class SolicitudreportesController; def rescue_action(e) raise e end; end

class SolicitudreportesControllerTest < Test::Unit::TestCase
  fixtures :solicitudreportes

  def setup
    @controller = SolicitudreportesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = solicitudreportes(:first).id
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:solicitudreportes)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:solicitudreporte)
    assert assigns(:solicitudreporte).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:solicitudreporte)
  end

  def test_create
    num_solicitudreportes = Solicitudreporte.count

    post :create, :solicitudreporte => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_solicitudreportes + 1, Solicitudreporte.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:solicitudreporte)
    assert assigns(:solicitudreporte).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Solicitudreporte.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Solicitudreporte.find(@first_id)
    }
  end
end
