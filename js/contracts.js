const generateClass = require('eth-contract-class').default;

const MiniMeTokenArtifact = require('../build/MiniMeToken.json');
const MiniMeTokenFactoryArtifact = require('../build/MiniMeTokenFactory.json');

module.exports = {
  MiniMeToken: generateClass(
    MiniMeTokenArtifact.compilerOutput.abi,
    MiniMeTokenArtifact.compilerOutput.evm.bytecode.object,
  ),
  MiniMeTokenFactory: generateClass(
    MiniMeTokenFactoryArtifact.compilerOutput.abi,
    MiniMeTokenFactoryArtifact.compilerOutput.evm.bytecode.object,
  ),
};
