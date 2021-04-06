const commandLineArgs = require('command-line-args');

const options = parseOptions([
   { name: 'input', alias: 'i', type: String },
   { name: 'output', alias: 'o', type: String },   
   { name: 'graph', alias: 'g', type: Boolean },  
   //{ name: 'noheader', alias: 'n', type: Boolean },
   //{ name: 'invert', type: Boolean },
   //{ name: 'baud', alias: 'b', type: Number },   
   //{ name: 'debug', type: Boolean },   
]);

function parseOptions(optionDefinitions) {
   try {       
      return commandLineArgs(optionDefinitions);
   } catch(ex) {
      console.log(ex.message);
      process.exit(-1);
   }
}

module.exports = options;

