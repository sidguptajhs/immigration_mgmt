class VisaTypesController < ApplicationController
  def index
    @visa_types= VisaType.all( :order=> :created_at)
  end

  def new
    @visa_type = VisaType.new
  end

  def create
    @visa_type=VisaType.new(params[:visa_type])
    if  params[:name]==""|| params[:name]==nil
      flash[:alert]="Please Enter a Visa Type Name !!!"
      render :new
    else
      @visa_type.save
      flash[:success]="Your Visa Type was created !!!"
      redirect_to :action => 'index'
    end
  end

  def show
    @visa_type=VisaType.find(params[:id])
  end

  def destroy
    @visa_type=VisaType.find(params[:id])
    @visa_type.destroy
    redirect_to :action => 'index'
  end

  def edit
    @visa_type=VisaType.find(params[:id])
  end

  def update
    @visa_type=VisaType.find(params[:id])
    @visa_type.update_attributes(params[:visa_type])
    redirect_to :action => 'index'
  end
end