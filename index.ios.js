/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';

var React = require('react-native');
var {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  Image,
  NativeModules,
  TouchableHighlight
} = React;

var AdmobTest = React.createClass({
   onPress: function(){
      React.NativeModules.MyViewController.gameOver();
   },
  render: function() {
    
       
    return (
      <View style={styles.container}>
        <Image source={{uri: 'http://facebook.github.io/react/img/logo_og.png'}}
          style={styles.image} />
        <TouchableHighlight onPress={this.onPress}>
        <Text style={styles.welcome}>
          Welcome to React Native!
        </Text>
        </TouchableHighlight>
        <Text style={styles.instructions}>
          To get started, edit index.ios.js{'\n'}
          Press Cmd+R to reload
        </Text>
      </View>
    );
  }
});

var styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
  },
  image: {width: 40, height: 40, marginRight: 10},
});

AppRegistry.registerComponent('AdmobTest', () => AdmobTest);
