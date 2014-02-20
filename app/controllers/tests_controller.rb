class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  def index
    # render :text => "Hello World!"
    @tests = Test.order(note: :asc)
  end

  def show
    # render :text => "Hello World!"
    # @test = Test.new
    # @test.name = "Nakabayashi"
    # @test.note = "錦織がんばれ"

    # @test = Test.find(params[:id])
  end

  def new
    # render :text => "Hello World!"
    @test = Test.new
    @test.name = 'にしこり'

    @items = Item.all
  end

  def create
    # render :text => "Hello World!"
    @test = Test.new(test_params)

    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: '登録しました'}
      else
        format.html { render action: 'new'}
      end
    end
  end

  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: '更新しました' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url }
      format.json { head :no_content }
    end
  end

 private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(:name, :note)
    end
end
