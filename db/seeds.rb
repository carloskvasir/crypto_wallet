spinner = TTY::Spinner.new(':spinner  Executando seeds', format: :dots)
spinner.auto_spin
coins =
  [
    {
      description: 'Bitcoin',
      acronym: 'BTC',
      url_image: 'http://pngimg.com/uploads/bitcoin/bitcoin_PNG47.png'
    },
    {
      description: 'Ethereum',
      acronym: 'ETH',
      url_image: 'https://upload.wikimedia.org/wikipedia/commons/0/05/Ethereum_logo_2014.svg'
    },
    {
      description: 'Dash',
      acronym: 'DASH',
      url_image: 'https://ih1.redbubble.net/image.565893629.7574/st,small,845x845-pad,1000x1000,f8f8f8.u2.jpg'
    },
    {
      description: 'Iota',
      acronym: 'IOT'
      url_image: 'https://s2.coinmarketcap.com/static/img/coins/200x200/1720.png'
    },
    {
      description: 'ZCash',
      acronym: 'ZEC'
      url_image: 'https://s2.coinmarketcap.com/static/img/coins/200x200/1720.png'
    }
    }
  ]

coins.each do |coin|
  Coin.find_or_create_by!(coin)
end

spinner.success('(concluído)')
