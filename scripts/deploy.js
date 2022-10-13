
const hre = require("hardhat");
const ethers = hre.ethers


async function main() {
  const url = "http://127.0.0.1:8545/";
  const provider = new ethers.providers.JsonRpcProvider(url)

  let sender = '0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266'

  let signer = provider.getSigner(sender)

  const balance = await signer.getBalance()

  console.log(ethers.utils.formatEther(balance))
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
