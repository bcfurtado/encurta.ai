class HomeController < ApplicationController

  def index
    @link = Link.new  
  end

  def create
    @link = Link.create(create_params)

    if @link.save
      redirect_to :action => :success, :id => @link.id
    else
      render :index
    end
        
  end

  def success
    @link = Link.find_by_id(params[:id])
    redirect_to :index if @link.nil?
  end

  def redirect
    @link = Link.find_by_key(params[:key])
    if @link
      redirect_to @link.url
    else
      redirect_to root_path
    end
  end

  private
    def create_params
      params.require(:link).permit(:url)
    end

end
