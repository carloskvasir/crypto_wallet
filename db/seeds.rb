puts 'Cadastrando as moedas...'
Coin.create!(
  description: 'Bitcoin',
  acronym: 'BTC',
  url_image: 'http://pngimg.com/uploads/bitcoin/bitcoin_PNG47.png'
)

Coin.create!(
  description: 'Ethereum',
  acronym: 'ETH',
  url_image: 'https://upload.wikimedia.org/wikipedia/commons/0/05/Ethereum_logo_2014.svg'
)

Coin.create!(
  description: 'Dash',
  acronym: 'DASH',
  url_image: 'https://ih1.redbubble.net/image.565893629.7574/st,small,845x845-pad,1000x1000,f8f8f8.u2.jpg'
)

puts 'Moedas cadastradas com sucesso!'
