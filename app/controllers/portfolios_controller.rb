class PortfoliosController < ApplicationController

def index
  @portfolio_items = Portfolio.all
end

def new
  @f = Portfolio.new
end

def create
  @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :body))

  respond_to do |format|
    if @portfolio_item.save
      format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
    else
      format.html { render :new }
    end
  end
end

def edit
  @f = Portfolio.find(params[:id])
end

def update
    @f = Portfolio.find(params[:id])

    respond_to do |format|
      if @f.update(params.require(:portfolio).permit(:title, :body))
        format.html { redirect_to portfolios_path, notice: 'The record successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @f = Portfolio.find(params[:id])
  end

  def destroy
      # Perform the lookup
      @portfolio_item = Portfolio.find(params[:id])

      # Destroy/delete the record
      @portfolio_item.destroy

      # Redirect
      respond_to do |format|
        format.html { redirect_to portfolios_url, notice: 'Record was removed.' }
      end
    end



end
