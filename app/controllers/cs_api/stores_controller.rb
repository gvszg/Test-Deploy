class CsApi::StoresController < CsApiController
  before_action :find_county, only: [:index]
  before_action :find_town, only: [:index]
  before_action :find_road, only: [:index]

  def index
    @stores = @road.stores

    render json: @stores, only: [:id, :store_code, :name, :address, :phone]

    # respond_to do |format|
    #   format.json { render json: @stores }
    # end
  end
end