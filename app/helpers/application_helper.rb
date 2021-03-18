module ApplicationHelper

  # Get natural text based in +atual_locale+
  def locale(atual_locale)
    I18n.locale == :en ?
      'Estados Unidos' :
      'Português do Brasil'
  end

  def date_brazil(data_us)
    data_us.strftime('%d/%m/%Y')
  end
end
