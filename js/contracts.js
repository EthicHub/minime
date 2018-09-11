const generateClass = require('eth-contract-class').default;

const MiniMeTokenArtifact = require('../build/MiniMeToken.json');
const MiniMeTokenFactoryArtifact = require('../build/MiniMeTokenFactory.json');
const MockFutureMiniMeTokenArtifact = require('../build/MockFutureMiniMeToken.json');
const MockFutureMiniMeTokenFactoryArtifact = require('../build/MockFutureMiniMeTokenFactory.json');

module.exports = {
  MiniMeToken: generateClass(
    MiniMeTokenArtifact.compilerOutput.abi,
    MiniMeTokenArtifact.compilerOutput.evm.bytecode.object,
  ),
  MiniMeTokenFactory: generateClass(
    MiniMeTokenFactoryArtifact.compilerOutput.abi,
    MiniMeTokenFactoryArtifact.compilerOutput.evm.bytecode.object,
  ),
  MockFutureMiniMeToken: generateClass(
    MockFutureMiniMeTokenArtifact.compilerOutput.abi,
    MockFutureMiniMeTokenArtifact.compilerOutput.evm.bytecode.object,
  ),
  MockFutureMiniMeTokenFactory: generateClass(
    MockFutureMiniMeTokenFactoryArtifact.compilerOutput.abi,
    MockFutureMiniMeTokenFactoryArtifact.compilerOutput.evm.bytecode.object,
  )
};
