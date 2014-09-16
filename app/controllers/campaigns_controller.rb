class CampaignsController < ApplicationController

  def index
    campaigns = Campaign.by_user_id(:key => current_user.id)
    @c_today = []
    @c_future = []
    @c_past = []
    today = Date.today
    campaigns.each do |c|
      if c.scheduled_date == today
        @c_today << c
      elsif c.scheduled_date < today
        @c_past << c
      else
        @c_future << c
      end
    end
  end

  def new
    @campaign = Campaign.new
    @campaign.user_id = current_user.id
  end

  def create
    @campaign = Campaign.new(params[:campaign])
    y= params[:campaign]["scheduled_date(1i)"].to_i
    m= params[:campaign]["scheduled_date(2i)"].to_i
    d= params[:campaign]["scheduled_date(3i)"].to_i
    @campaign.scheduled_date = Date.new(y,m,d)

    if @campaign.save
      redirect_to @campaign
    else
      render "new"
    end
  end

  def edit
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def destroy
  end

  def update
  end

end
