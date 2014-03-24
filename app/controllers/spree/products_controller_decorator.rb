Spree::ProductsController.class_eval do
  def index
    @view = 'grid'
    if params.has_key?( :view_type )
      @view = params[:view_type].keys[0]
    elsif params.has_key?( :locals ) && params[:locals].has_key?(:view)
      @view = params[:locals][:view]
    end

    @searcher = build_searcher(params)
    @products = @searcher.retrieve_products
  end
end
