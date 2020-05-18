class TestsController < ApplicationController
  before_action :cursor, only: [:index]
  before_action :max_pages, only: [:index]
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
    @test.save
    puts @test.errors
    if @test.save
      redirect_to '/tests/pages/1'
    end
  end

  private
 # Не работает не знаю почему
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

  def max_pages
    @max = Test.all.length / Test.page_limit + 1
  end
end
