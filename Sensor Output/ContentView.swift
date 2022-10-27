//
//  ContentView.swift
//  Sensor Output
//
//  Created by Vishnu Kunnummal on 10/2/22.
//

import SwiftUI
import CoreBluetooth

struct ContentView: View {
    
    
    var body: some View{
    NavigationView{
        ZStack {
            VStack (alignment: .leading) {
                Spacer()
                Text("Road Safety Suite")
                    .font(.largeTitle).foregroundColor(.white).fontWeight(.bold).shadow(color: Color.black, radius: 1)
                HStack (alignment: .bottom){
                    Text("Advanced technology made accessible")
                        .font(.subheadline).foregroundColor(.white).fontWeight(.semibold).shadow(color: Color.black, radius: 1)
                }
                Spacer()
                Spacer()
            }.background(Image("highway").resizable().aspectRatio(contentMode: .fill)).edgesIgnoringSafeArea(.all)
            NavigationLink(
                destination: /*Features()*/ MainView(),
                label: {
                    Text("Get Started").bold().foregroundColor(.white)
                        .padding(10)
                        .background(Color.blue)
                        .cornerRadius(40)
                        .shadow(color: Color.black, radius: 1)
                })
            }
    
    
    }
}
}

struct MainView: View {
    @ObservedObject var ble = BluetoothMgr()
    var body: some View {
        VStack(spacing: 10){
            Text("Bluetooth Devices")
                            .font(.largeTitle)
                            .frame(maxWidth: .infinity, alignment: .center)
            List(ble.periphs) { peripheral in
                HStack {
                    Text(peripheral.name)
                    Spacer()
                    Text(String(peripheral.rssi))
                }
            }.frame(height: 300)
            Spacer()
            HStack {
                            VStack (spacing: 10) {
                                Button(action: {
                                    self.ble.startScanning()
                                }) {
                                    Text("Start Scanning")
                                }
                                Button(action: {
                                    self.ble.stopScanning()
                                }) {
                                    Text("Stop Scanning")
                                }
                            }.padding()
             
                            Spacer()
             
                            VStack (spacing: 10) {
                                Button(action: {
                                    print("Start Advertising")
                                }) {
                                    Text("Start Advertising")
                                }
                                Button(action: {
                                    print("Stop Advertising")
                                }) {
                                    Text("Stop Advertising")
                                }
                            }.padding()
                        }

//            if ble.on {
//                Image("car")
//            }
//            else {
//                Text("Bluetooth disabled").foregroundColor(.red)
//            }
        }
    }
}


//    struct FeatCard: View {
//        let geometry: GeometryProxy
//        let featureName: String
//        var body: some View {
//            ZStack(alignment: .bottom){
//                Image(featureName).resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: geometry.size.width * 0.45,                     height: geometry.size.width * 0.55)
//                Text(featureName).font(.headline)
//                    .foregroundColor(Color.white)
//                    .padding(12)
//                    .shadow(color: Color.black, radius: 1)
//            }.clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
//        }
//    }
//
//    struct Features: View {
//        var body: some View {
//            GeometryReader{ geometry in
//            ScrollView(){
//                VStack(){
//                    FeatureRow(geometry: geometry, featureNameLeft: "Cross-Traffic Alert", featureNameRight: "Blindspot Monitoring")
//                    FeatureRow(geometry: geometry, featureNameLeft: "Proximity Sensing", featureNameRight: "Support")
//                }.padding()
//            }.navigationBarTitle("Services")
//        }
//        }
//    }
//
//    struct FeatureRow: View {
//        let geometry: GeometryProxy
//        let featureNameLeft: String
//        let featureNameRight: String
//        var body: some View {
//            HStack{
//                if featureNameLeft == "Cross-Traffic Alert"{
//                    NavigationLink(destination: CrossTraffic(featureName: featureNameLeft)){
//                    FeatCard(geometry: geometry, featureName: featureNameLeft)
//                }
//                }
//                else if featureNameLeft == "Proximity Sensing"{
//                    NavigationLink(destination: Blindspot(featureName: featureNameLeft)){
//                        FeatCard(geometry: geometry, featureName: featureNameLeft)
//                    }
//                    }
//                if featureNameRight == "Blindspot Monitoring"{
//                NavigationLink(destination: ProxSensing(featureName: featureNameRight)){
//                    FeatCard(geometry: geometry, featureName: featureNameRight)
//                }
//                }
//            }.buttonStyle(PlainButtonStyle())
//        }
//    }
//
//    struct CrossTraffic: View {
//        @ObservedObject var ble = BluetoothMgr()
//        let featureName: String
//        var body: some View {
//            if ble.on {
//                Image("car")
//            }
//            else {
//                Text("Bluetooth disabled").foregroundColor(.red)
//            }
//        }
//    }
//
//    struct Blindspot: View {
//        @ObservedObject var ble = BluetoothMgr()
//        let featureName: String
//        var body: some View {
//            if ble.on {
//                Image("car")
//            }
//            else {
//                Text("Bluetooth disabled").foregroundColor(.red)
//            }
//        }
//    }
//
//    struct ProxSensing: View {
//        @ObservedObject var ble = BluetoothMgr()
//        let featureName: String
//        var body: some View {
//            if ble.on {
//                Image("car")
//            }
//            else {
//                Text("Bluetooth disabled").foregroundColor(.red)
//            }
//        }
//    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

    

