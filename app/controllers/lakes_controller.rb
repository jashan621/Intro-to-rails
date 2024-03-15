class LakesController < ApplicationController
  require 'fuzzy_match'

  def index
    @categories = Category.all
    @selected_category = params[:category_id]

    if params[:search].present?
      search_term = params[:search].downcase
      if params[:category_id].present?
        @lakes = Category.find(@selected_category).lakes.paginate(page: params[:page])
        @pagination_info = {
          current_page: @lakes.current_page,
          total_pages: @lakes.total_pages
        }
      else
        @lakes = Lake.where("LOWER(name) LIKE ?", "%#{search_term}%").paginate(page: params[:page])
        @pagination_info = {
          current_page: @lakes.current_page,
          total_pages: @lakes.total_pages
        }
      end
    elsif @selected_category
      @lakes = Category.find(@selected_category).lakes.paginate(page: params[:page])
      @pagination_info = {
        current_page: @lakes.current_page,
        total_pages: @lakes.total_pages
      }
    else
      @lakes = Lake.paginate(page: params[:page])
      @pagination_info = {
        current_page: @lakes.current_page,
        total_pages: @lakes.total_pages
      }
    end
  end


  def show
    puts @data_sources.inspect
    @lake = Lake.find(params[:id])
    @data_sources = DataSource.where(MonitoringLocationName: @lake.name)
    if @data_sources.blank?
      flash[:notice] = "No data sources found for this lake."
    end
  end
end
