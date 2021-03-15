namespace :dev do
  desc 'Config dev environment'
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Apagando banco de dados'){ %x(rails db:drop) }
      show_spinner('Criando banco de dados'){ %x(rails db:create) }
      show_spinner('Executando migrates') { %x(rails db:migrate) }
      show_spinner('Executando seeds') { %x(rails db:seed) }
    else
      puts 'Você não está em modo de desenvolvimento!'
    end
  end

  private

  def show_spinner(msg_start, msg_end = "(concluído)")
    spinner = TTY::Spinner.new(":spinner  #{msg_start}", format: :dots)
    spinner.auto_spin
    yield
    spinner.success("#{msg_end}")
  end

end
