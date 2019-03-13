/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 * @lint-ignore-every XPLATJSCOPYRIGHT1
 */

// 'use strict';
// import React, {Component} from 'react';
// import { Platform, StyleSheet, Text, View, TextInput, NativeModules } from 'react-native';

// const instructions = Platform.select({
//   ios: 'Press Cmd+R to reload,\n' + 'Cmd+D or shake for dev menu',
//   android:
//     'Double tap R on your keyboard to reload,\n' +
//     'Shake or press menu button for dev menu',
// });

// const MyClass = NativeModules.MyClass;
// export default class App extends Component {
  
//   constructor(props) {
//     super(props);
//     this.state = {
//       num : 0
//     }
//   }

//   squareMe(num) {
//     if (num == '') {
//       return;
//     }
//     MyClass.squareMe(+num, (error, result) => {
//       if (error) {
//         console.error(error);
//       } else {
//         this.setState({num: result})
//       }
//     });
//   }

//   render() {
//     return (
//       <View style={styles.container}>
//         <Text style={styles.welcome}>
//           {MyClass.greeting}
//         </Text>
//         <TextInput style={styles.input} onChangeText={(text) => this.squareMe(text)} />
//         <Text style={styles.result}>
//           {this.state.num}
//         </Text>
//       </View>
//     );
//   }
  
// }

// const styles = StyleSheet.create({
//   container: {
//     flex: 1,
//     justifyContent: 'center',
//     alignItems: 'center',
//     backgroundColor: '#F5FCFF',
//   },
//   welcome: {
//     fontSize: 20,
//     textAlign: 'center',
//     margin: 10,
//   },
//   instructions: {
//     textAlign: 'center',
//     color: '#333333',
//     marginBottom: 5,
//   },
//   result: {
//     textAlign: 'center',
//     color: '#333333',
//     fontSize: 30,
//     fontWeight: 'bold',
//     margin: 20,
//   },
//   input: {
//     width: 100,
//     height: 40,
//     borderColor: 'red',
//     borderWidth: 1,
//     alignSelf: 'center',
//   }

// });
import React, { Component } from 'react';
import { StyleSheet, View, Button, Text, NativeModules } from 'react-native';
 
const GSManager = NativeModules.GSManager;
export default class App extends Component {
 
    uri1 = "http://mirrors.standaloneinstaller.com/video-sample/jellyfish-25-mbps-hd-hevc.mp4"
 
    constructor(props, context) {
        super(props, context)
        this.state = { uri: this.uri1 }
    }

    handleButtonPress = () => {
        console.log("hi");
        GSManager.presentGS();
    }
 
    render() {
        return (
            <View style={styles.container}>
                <Text>
                    GS test
                </Text>
                <Button
                    onPress={this.handleButtonPress}
                    title="show"
                    color="black"
                    accessibilityLabel="Learn more about this purple button"
                    borderColor="black"
                />
                
            </View>
        )
    }
}
 
const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: "white",
        justifyContent: 'center',
    },
    controlBar: {
        flexDirection: "row",
        justifyContent: "space-between"
    },
    videoPlayer: { flex: 1 }
})