//
//  GSEktBrokenAppView.swift
//  pruebasRemoteConfig
//
//  Created by Whiz on 25/09/23.
//

import SwiftUI

struct GSEktBrokenAppView: View {
    var generalConfig : GeneralConfig

    var body: some View {
        ZStack{
            Color.backgroundGrayLight
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("Maintenance")
                    .frame(width: 200, height: 200, alignment: .center)
                    .scaledToFit()
                    .padding(.bottom,16)

                //let textArray = generalConfig.mantenimiento.message.components(separatedBy: ".")
                
                let textArray = "Nos encontramos trabajando en nuevas y mejores funcionalidades. Gracias por tu paciencia.".components(separatedBy: ".")

                ForEach(textArray, id: \.self) { text in
                    Text(text + ".")
                        .foregroundColor(.grayLineColor)
                        .font(.semibold(size: 16))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.bottom,16)
                }
            }
        }
    }
}


struct GSEktBrokenAppView_Previews: PreviewProvider {
    static var previews: some View {
        GSEktBrokenAppView(generalConfig: GeneralConfig())
    }
}

extension Font{
    static func regular(size : CGFloat) -> Font {
        return Font.system(size: size).weight(.regular)
    }

    static func bold(size : CGFloat) -> Font {
        return Font.system(size: size).weight(.bold)
    }

    static func semibold(size : CGFloat) -> Font {
        return Font.system(size: size).weight(.semibold)
    }

    static func medium(size : CGFloat) -> Font {
        return Font.system(size: size).weight(.medium)
    }
    
    static func thin(size : CGFloat) -> Font {
        return Font.system(size: size).weight(.thin)
    }
}

