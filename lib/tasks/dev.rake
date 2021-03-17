namespace :dev do
  desc 'Config dev environment'
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Dropping database'){ %x(rails db:drop) }
      show_spinner('Create database'){ %x(rails db:create) }
      show_spinner('Running migrates') { %x(rails db:migrate) }
      show_spinner('Seeding MiningTypes') { %x(rails dev:add_mining_types) }
      show_spinner('Seeding Coins') { %x(rails dev:add_coins) }
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

  desc 'Seed MiningTypes'
  task add_mining_types: :environment do
    mining_types =
      [
        {description: "Proof of Work", acronym: "PoW"},
        {description: "Proof of Stake", acronym: "PoS"},
        {description: "Proof of Capacity", acronym: "PoC"},
      ]
    mining_types.each do |mining_type|
      MiningType.find_or_create_by!(mining_type)
    end

  end
  desc 'Seed Coins'
  task add_coins: :environment do
    coins =
      [
        {
          description: 'Bitcoin',
          acronym: 'BTC',
          url_image: 'http://pngimg.com/uploads/bitcoin/bitcoin_PNG47.png',
          mining_type: MiningType.find_by(acronym: 'PoW')
        },
        {
          description: 'Ethereum',
          acronym: 'ETH',
          url_image: 'https://upload.wikimedia.org/wikipedia/commons/0/05/Ethereum_logo_2014.svg',
          mining_type: MiningType.all.sample,
        },
        {
          description: 'Dash',
          acronym: 'DASH',
          url_image: 'https://ih1.redbubble.net/image.565893629.7574/st,small,845x845-pad,1000x1000,f8f8f8.u2.jpg',
          mining_type: MiningType.all.sample,
        },
        {
          description: 'Iota',
          acronym: 'IOT',
          url_image: 'https://z.cash/wp-content/uploads/2018/10/zcash-logo-fullcolor-512sq.png',
          mining_type: MiningType.all.sample,
        },
        {
          description: 'ZCash',
          acronym: 'ZEC',
          url_image: 'https://s2.coinmarketcap.com/static/img/coins/200x200/1720.png',
          mining_type: MiningType.all.sample,
        }
      ]

    coins.each do |coin|
      Coin.find_or_create_by!(coin)
    end
  end

  end
