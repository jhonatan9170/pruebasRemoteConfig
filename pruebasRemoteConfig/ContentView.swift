//
//  ContentView.swift
//  pruebasRemoteConfig
//
//  Created by Whiz on 20/09/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var managerConfig: ManaganerCofig
    private var maintenance: Bool { managerConfig.config.mantenimiento.enable}
    private var forceUpdate: Bool { managerConfig.config.actualizacion}
    //private var optionalUpdate: Bool { managerConfig.config.actualizacion_opcional}
    
    var body: some View {
        
        
        VStack {
            if maintenance {
                GSEktBrokenAppView(generalConfig: managerConfig.config)
            } else if forceUpdate {
                GSEKTForceUpdateView(generalConfig: managerConfig.config)
            } else {
                //GSEKTMainNavView()
                
                if managerConfig.optionalUpdate {
                    AlertCustom(style: .info, title: "", message: "Tu App Elektra tiene novedades para ti. Actualízala para no perdértelas. Actualizar mi App.", tap2AppStore: true , systemImage: "iconInfo", showingAlert: $managerConfig.optionalUpdate, textColor: .alertSuccessText, isImage: true)
                   
                }
                Text("Home")
            }
          
        }
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
