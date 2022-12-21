import * as React from 'react';

import { StyleSheet, View, Text } from 'react-native';
import { HDWallet } from '../../lib/typescript/hdwallet';
import { AnyAddress } from '../../lib/typescript/address';
import { Hash } from '../../lib/typescript/hash'

export default function App() {
  const testAddres = '0x03671B7c11cb749DE612bB460cEF8bc3f6E6Db06';
  const [result, setResult] = React.useState<boolean | undefined>();

  React.useEffect(() => {
    AnyAddress.validateAddress(testAddres, 60).then(setResult);
    HDWallet.createWallet(256, "").then(console.log);
    Hash.sha256("hello").then((data) => {
      console.log("sha256 hash: ", data, data == '2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824');
    })
    Hash.keccak256("0xdeadbeef").then((data) => {
      console.log("keccak256 hash: ", data, data == 'd4fd4e189132273036449fc9e11198c739161b4c0116a9a2dccdfa1c492006f1');
    })
  }, []);

  return (
    <View style={styles.container}>
      <Text>{testAddres} is a valid Ethereum address: {result ? "true": "false"}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    padding: 10
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
