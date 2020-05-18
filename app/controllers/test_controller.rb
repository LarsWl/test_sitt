class TestController < ApplicationController
  before_action :cursor, only: [:index]

  def new
  end

  def index
    @tests = Test.after(cursor)
    respond_to do |format|
      format.html
      format.json { render json: @tests }
    end
  end

  def create
    @test = Test.create(test_params)
    if @test.save
      redirect_to test_index_url
    end
  end

  private

  def test_params
    params[:test].permit(
        :name,
        :param_1,
        :param_2
    )
  end

  def cursor
    (params[:page_id].to_i - 1)*Test.page_limit
  end

end
