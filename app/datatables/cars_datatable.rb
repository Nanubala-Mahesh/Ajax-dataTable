class CarsDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    puts "as_json"
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Car.count,
      iTotalDisplayRecords: cars.total_entries,
      aaData: data
    }
  end

  private

  def data
    puts "data"
    cars.map do |car|

      # puts "car.as_json: #{car.as_json}"

      [
        link_to(car.make, car),
        ERB::Util.h(car.model),
        ERB::Util.h(car.year.strftime("%B %e, %Y")),
        ERB::Util.h(car.color)
      ]

      # [
      #   link_to(car.make, car),
      #   h(car.model),
      #   h(car.year),
      #   number_to_currency(car.color)
      # ]
    end
  end

  def cars
    @cars ||= fetch_cars
  end

  def fetch_cars
    cars = Car.order("#{sort_column} #{sort_direction}")
    cars = cars.page(page).per_page(per_page)
    if params[:sSearch].present?
      cars = cars.where("make like :search or model like :search or year like :search or color like :search", search: "%#{params[:sSearch]}%")
    end
    cars
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[make model year color]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end