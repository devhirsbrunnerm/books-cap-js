const cds = require('@sap/cds');

module.exports = cds.service.impl (async function() {
  this.before ('NEW','Authors', req => req.data.ID = uuidv4());
  this.before ('NEW','Books', req => req.data.ID = uuidv4());
})


function uuidv4() {
  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
    var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
    return v.toString(16);
  });
}