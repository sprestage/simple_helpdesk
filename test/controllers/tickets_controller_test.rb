require "test_helper"

class TicketsControllerTest < ActionController::TestCase

  before do
    @ticket = tickets(:one)
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:tickets)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Ticket.count') do
      post :create, ticket: {  }
    end

    assert_redirected_to ticket_path(assigns(:ticket))
  end

  def test_show
    get :show, id: @ticket
    assert_response :success
  end

  def test_edit
    get :edit, id: @ticket
    assert_response :success
  end

  def test_update
    put :update, id: @ticket, ticket: {  }
    assert_redirected_to ticket_path(assigns(:ticket))
  end

  def test_destroy
    assert_difference('Ticket.count', -1) do
      delete :destroy, id: @ticket
    end

    assert_redirected_to tickets_path
  end
end
