//
//  GSEKTForceUpdateView.swift
//  pruebasRemoteConfig
//
//  Created by Whiz on 25/09/23.
//

import SwiftUI

struct GSEKTForceUpdateView: View {
    @State var generalConfig : GeneralConfig

    var body: some View {
        ZStack{
            Color.backgroundGrayLight
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("force_update")
                    .frame(width: 200, height: 200, alignment: .center)
                    .scaledToFit()
                    .padding(.bottom,16)

                let message = "Tenemos una actualización para ti.\nDescárgala para seguir utilizando tu\n app."

                Text(message + ".")
                    .foregroundColor(.grayColor)
                    .font(.semibold(size: 16))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.bottom,16)
                
                Button(action: {
                    GSEktRCHelper.openAppStoreEkt()
                }, label: {
                    Text("Actualizar aplicacion")
                        .frame(width: Dimension.paddinWidthPercent(percent: 16), height: 38)
                        .foregroundColor(Color.white)
                        .font(.semibold(size: 17))
                        .disabled(false)
                        .padding(.horizontal)
                        .background(
                            RoundedRectangle(
                                cornerRadius: 8,
                                style: .continuous
                            )
                            .fill(Color.customRed))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .strokeBorder(Color.customRed, lineWidth: 1)
                        )
                        .padding(.top, 8)
                        .contentShape(Rectangle())
                    
                })
                
            }
        }
    }
}

class Dimension {
    static func sizeWidthPercent(percent: CGFloat) -> CGFloat{
        return (deviceWidth * percent) / 100
    }
    
    static func sizeHeightPercent(percent: CGFloat) -> CGFloat{
        return (deviceHeight * percent) / 100
    }
    
    static func paddinWidthPercent(percent: CGFloat) -> CGFloat {
        return deviceWidth - sizeWidthPercent(percent: percent)
    }
    
    static func paddingHeightPercent(percent: CGFloat) -> CGFloat{
        return deviceHeight  - sizeHeightPercent(percent: percent)
    }
    
    // Horizontal es para leading y trailing
    static func paddingHorizontalPercent(value: CGFloat) -> CGFloat{
        let width = 100 - value
        return deviceWidth - sizeWidthPercent(percent: width)
    }
    
    // Vertical es para Top y Bottom
    static func paddingVerticalPercent(value: CGFloat) -> CGFloat{
        let height = 100 - value
        return deviceHeight - sizeHeightPercent(percent: height)
    }
    
}


var deviceWidth: CGFloat {
    UIScreen.main.bounds.width
}

var deviceHeight: CGFloat {
    UIScreen.main.bounds.height
}
