module ApplicationHelper
  def date_brazil(data_us)
    data_us.strftime('%d/%m/%Y')
  end
end
