class TestController < ApplicationController


  def new
  end

  def index
    @tests = Test.all
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
        :text
    )
  end

end
