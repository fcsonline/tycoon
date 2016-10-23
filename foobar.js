module.exports = function(callback) {
  console.log('Sending money...');

  var account_one = "0x90f8bf6a479f320ead074411a4b0e7944ea8c9c1"; // an address
  var account_two = "0xffcf8fdee72ac11b5c542428b35eef5769c409f0"; // another address

  var meta = MetaCoin.deployed();

  meta.sendCoin(account_two, 10, {from: account_one}).then(function(tx_id) {
    // If this callback is called, the transaction was successfully processed.
    // Note that Ether Pudding takes care of watching the network and triggering
    // this callback.
    console.log("Transaction successful!")
    callback();
  }).catch(function(e) {
    // There was an error! Handle it.
  });
}
