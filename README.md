# Connect SDK Flutter

Connect SDK is an open source framework that connects your mobile apps with multiple TV platforms. Because most TV platforms support a variety of protocols, Connect SDK integrates and abstracts the discovery and connectivity between all supported protocols.

To discover supported platforms and protocols, Connect SDK uses SSDP to discover services such as DIAL, DLNA, UDAP, and Roku’s External Control Guide (ECG). Connect SDK also supports ZeroConf to discover devices such as Chromecast and Apple TV. Even while supporting multiple discovery protocols, Connect SDK is able to generate one unified list of discovered devices from the same network.

To communicate with discovered devices, Connect SDK integrates support for protocols such as DLNA, DIAL, SSAP, ECG, AirPlay, Chromecast, UDAP, and webOS second screen protocol. Connect SDK intelligently picks which protocol to use depending on the feature being used.

For example, when connecting to a 2013 LG Smart TV, Connect SDK uses DLNA for media playback, DIAL for YouTube launching, and UDAP for system controls. On Roku, media playback and system controls are made available through ECG, and YouTube launching through DIAL. On Chromecast, media playback occurs through the Cast protocol and YouTube is launched via DIAL.

To support the aforementioned use case without Connect SDK, a developer would need to implement DIAL, ECG, Chromecast, and DLNA in their app. With Connect SDK, discovering the three devices is handled for you. Furthermore, the method calls between each protocol is abstracted. That means you can use one method call to beam a video to Roku, 3 generations of LG Smart TVs, Apple TV, and Chromecast.

## Setup - Android

### Permissions to include in manifest

- Required for SSDP & Chromecast/Zeroconf discovery
  - `android.permission.INTERNET`
  - `android.permission.CHANGE_WIFI_MULTICAST_STATE`
- Required for interacting with devices
  - `android.permission.ACCESS_NETWORK_STATE`
  - `android.permission.ACCESS_WIFI_STATE`
- Required for storing device pairing information
  - `android.permission.WRITE_EXTERNAL_STORAGE`
- Required for Screen Mirroring and Remote Camera
  - `android.permission.RECORD_AUDIO`
  - `android.permission.FOREGROUND_SERVICE`
  - `android.permission.CAMERA`

```
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE"/>
<uses-permission android:name="android.permission.CHANGE_WIFI_MULTICAST_STATE"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.RECORD_AUDIO" />
<uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
<uses-permission android:name="android.permission.CAMERA" />
```

### Metadata for application tag

Add the following line to your proguard configuration file (otherwise `DiscoveryManager` won't be able to set any `DiscoveryProvider`).

```
-keep class com.connectsdk.**       { * ; }
```
