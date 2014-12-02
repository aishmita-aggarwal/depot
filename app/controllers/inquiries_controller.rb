class InquiriesController < ApplicationController
  skip_before_action :authorize

  def index
    @inquiries = Inquiry.all
  end

  def show
    @inquiry = Inquiry.find(params[:id])
  end

  def new
    @inquiry = Inquiry.new
  end

  def edit
    @inquiry = Inquiry.find(params[:id])
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    respond_to do |format|
      if @inquiry.save
        InquiryNotifier.registered(@inquiry).deliver
        InquiryNotifier.new_query_added(@inquiry).deliver
        format.html { redirect_to inquiries_path, notice: 'Your query has been registered.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    @inquiry = Inquiry.find(params[:id])
    respond_to do |format|
      if @inquiry.update(inquiry_params)
        InquiryNotifier.answered(@inquiry).deliver
        format.html { redirect_to @inquiry, notice: 'Your query has been successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end  
  end

  def destroy
    @inquiry = Inquiry.find(params[:id])
    @inquiry.destroy
    respond_to do |format|
      format.html { redirect_to inquiries_url }
    end
  end

  private
    def inquiry_params
      params.require(:inquiry).permit(:question, :answer, :user_email, :user_name)
    end
end
