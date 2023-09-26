//
//  ContentView.swift
//  pruebasRemoteConfig
//
//  Created by Whiz on 20/09/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var managerConfig: ManaganerCofig
    @State private var maintenance: Bool = false
    @State private var forceUpdate: Bool = false
    @State var optionalUpdate = false
    
    
    var body: some View {
        VStack {
            if managerConfig.config.mantenimiento.enable {
                GSEktBrokenAppView(generalConfig: managerConfig.config)
            } else if forceUpdate {
                //GSEKTForceUpdateView(generalConfig: managerConfig.config)
            } else {
                //GSEKTMainNavView()
                Text("Home")
            }
            
        }
        .onAppear(perform: {
            //maintenance = generalConfig.mantenimiento.enable
           // forceUpdate = generalConfig.actualizacionGlobal()
        })
        
    }
    
    /*func showMaintenanceView()  -> Bool{
        return maintenance
    }
    
    func showUpdateView()  -> Bool{
        return forceUpdate
    }*/
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}
