class LakesController < ApplicationController
  require 'fuzzy_match'

  def index
    @categories = Category.all
    @selected_category = params[:category_id]
    
    if params[:search].present?
      search_term = params[:search].downcase
      if params[:fuzzy].present?
        per_page = 10
        matcher = FuzzyMatch.new(Lake.all.to_a, read: :name)
        search_results = matcher.find_all_with_score(search_term).sort_by { |_lake, score| -score }.map(&:first)
        total_pages = (search_results.size.to_f / per_page).ceil
        page_number = (params[:page] || 1).to_i
        @lakes = search_results.slice((page_number - 1) * per_page, per_page)
        @pagination_info = {
          current_page: page_number,
          total_pages: total_pages
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
