var request = require('request');
var _ = require('underscore');

module.exports = function(callback) {
  var amount = _.random(1, 100);
  console.log('Sending money $' + amount + '...');

  var account_one = "0x90f8bf6a479f320ead074411a4b0e7944ea8c9c1"; // an address
  var account_two = "0xffcf8fdee72ac11b5c542428b35eef5769c409f0"; // another address

  var meta = MetaCoin.deployed();

  request('https://opensky-network.org/api/states/all', function(error, response, body) {
    if (!error && response.statusCode == 200) {
      var content = JSON.parse(body);
      console.log('Records:', content.states.length);
      _.each(content.states, (state) => {
        console.log('fcs', state[0]);
      });

      meta.sendCoin(account_two, amount, {from: account_one}).then(function(tx_id) {
        // If this callback is called, the transaction was successfully processed.
        // Note that Ether Pudding takes care of watching the network and triggering
        // this callback.
        console.log("Transaction successful!")
        callback();
      }).catch(function(e) {
        // There was an error! Handle it.
      });

      callback();
    }
  });
}
