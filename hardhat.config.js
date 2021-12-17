require('@nomiclabs/hardhat-waffle');

module.exports = {
  solidity: '0.8.0',
  networks: {
    rinkeby: {
      url: 'https://eth-rinkeby.alchemyapi.io/v2/bnsmnh6sxiHTQuW5xTk4_eHMx7KCZagq',
      accounts: ['a9b69b79f8b68ababbf5698b6e3bbb736ddeaedc843ca2376537c0ded30e787d'],
    },
  },
};