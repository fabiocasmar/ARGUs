require File.dirname(__FILE__) + '/../test_helper'
require 'consulta_controller'

# Re-raise errors caught by the controller.
class ConsultaController; def rescue_action(e) raise e end; end

class ConsultaControllerTest < Test::Unit::TestCase
  fixtures :consultas

  def setup
    @controller = ConsultaController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = consultas(:first).id
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

    assert_not_nil assigns(:consultas)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:consulta)
    assert assigns(:consulta).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:consulta)
  end

  def test_create
    num_consultas = Consulta.count

    post :create, :consulta => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_consultas + 1, Consulta.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:consulta)
    assert assigns(:consulta).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Consulta.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Consulta.find(@first_id)
    }
  end
end
