import * as React from 'react';

import { StyleSheet, View, Text } from 'react-native';
import { validateAddress, createWallet } from '../../lib/typescript';

export default function App() {
  const testAddres = '0x03671B7c11cb749DE612bB460cEF8bc3f6E6Db06';
  const [result, setResult] = React.useState<boolean | undefined>();

  React.useEffect(() => {
    validateAddress(testAddres, 60).then(setResult);
    createWallet(256, "").then(console.log);
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
