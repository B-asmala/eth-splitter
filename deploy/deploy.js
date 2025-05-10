require("dotenv").config();
const { Wallet } = require("zksync-web3");
const { Deployer } = require("@matterlabs/hardhat-zksync-deploy");
const hre = require("hardhat");

async function main() {
  const wallet = new zk.Wallet(process.env.PRIVATE_KEY);// From .env
    
  const deployer = new Deployer(hre, wallet);

  const artifact = await deployer.loadArtifact("EthSplitter");

  const user1 = "0x23D62657b2c4264dF89b4a3C20b82A5f6aE943a2"; // same account for testing 
  const user2 = "0x23D62657b2c4264dF89b4a3C20b82A5f6aE943a2"; // same account for testing 

  const contract = await deployer.deploy(artifact, [user1, user2]);

  console.log(`✅ EthSplitter deployed to: ${contract.address}`);
}

main();
