//
//  BluetoothMgr.swift
//  Sensor Output
//
//  Created by Vishnu Kunnummal on 10/10/22.
//

import Foundation
import CoreBluetooth
struct Peripheral: Identifiable {
    let id: Int
    let name: String
    let rssi: Int
}

class BluetoothMgr: NSObject, ObservableObject, CBCentralManagerDelegate {
    @Published var on = false
    @Published var periphs = [Peripheral]()
    var myCentral: CBCentralManager!
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn{
            on = true
        }
        else {
            on = false
        }
    }
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        var periphName: String!
        if let name = advertisementData[CBAdvertisementDataLocalNameKey] as? String {
            periphName = name
        }
        else {
            periphName = "Unknown"
        }
        let newPeriph = Peripheral(id: periphs.count, name: periphName, rssi: RSSI.intValue)
        periphs.append(newPeriph)
        
        
    }
    func startScanning() {
             print("startScanning")
             myCentral.scanForPeripherals(withServices: nil, options: nil)
         }
        
        func stopScanning() {
            print("stopScanning")
            myCentral.stopScan()
        }
    
    override init(){
        super.init()
        myCentral = CBCentralManager(delegate: self, queue: nil)
        myCentral.delegate = self
    }
}
