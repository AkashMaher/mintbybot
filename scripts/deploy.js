
const { ethers } = require("hardhat")

async function main() {

  // const AkNFT = await ethers.getContractFactory("The_Art_Code");
  // const akNFT = await AkNFT.deploy();

  // await akNFT.deployed();
  // console.log("Success! Contract was deployed to", akNFT.address);

  const contractAddress = "0xc0264E9A3acBd60Db19ff24BD3a6c468c204ecb8";
  const akNFT = await hre.ethers.getContractAt("The_Art_Code", contractAddress);

  await akNFT.mintById("0x2F1b87C0EE11e810b8Bf9B5D78e70D400eb3f645","2","ipfs://ahabhvavasdvgvddcvhscvhdcdc");

  // console.log("Trx hash:", mintToken.hash);

  // await akNFT.setBeneficiary("0x81CcBB87535864eD9F511f5196fc22deEd77a272", { gasLimit: 4100000 });
  //     console.log('beneficiary settled')

  // await akNFT.setPrice("0", { gasLimit: 4100000 });

  // console.log('sale started')

  // await akNFT.mint(1, { value: ethers.utils.parseEther("0") });
  console.log("NFT Successfully Minted!");
}


main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
