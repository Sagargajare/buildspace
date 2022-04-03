const main = async () => {
  const [owner, randomPerson] = await hre.ethers.getSigners();
  const waveContractFactory = await hre.ethers.getContractFactory("WavePortal");
  const waveContract = await waveContractFactory.deploy();
  await waveContract.deployed();

  console.log("Contract deployed to:", waveContract.address);
  console.log("Contract deployed by:", owner.address);

  let waveCount;
  waveCount = await waveContract.getTotalWaves();

  let waveTxn = await waveContract.wave("A message!");
  await waveTxn.wait();

  waveTxn = await waveContract.connect(randomPerson).wave("Another message!");
  await waveTxn.wait();

  waveCount = await waveContract.getTotalWaves();

  

  waveCount = await waveContract.getTotalWaves();
  const allAddress = await waveContract.getAllSendersAddress();
  console.log("all Waves:", allAddress);
  let allWaves = await waveContract.getAllWaves();
  console.log(allWaves);
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};
runMain();
