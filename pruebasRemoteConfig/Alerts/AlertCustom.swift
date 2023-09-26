//
//  Alert.swift
//  GSEKTWorkSpace
//
//  Created by Edgar Elias Gonzalez Lira on 05/04/22.
//

import SwiftUI

enum styleAlert {
    case info
    case danger
    case warning
    case success
}

struct AlertCustom: View {
    var style: styleAlert
    var title: String
    var message: String
    var tap2AppStore = false
    var systemImage: String
    @Binding var showingAlert: Bool
    var textColor : Color = Color.black
    var isImage: Bool = false
    @State private var offset = CGSize.zero
    @State private var timer: Timer?
    var seconds = 5.0
    
    //MARK: Gestures
    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
            .onChanged({ value in
                if value.translation.height < -40 {
                    withAnimation {
                        offset = CGSize.init(width: CGSize.zero.width , height: value.translation.height - 1000 )
                    }
                } else if value.translation.height < 0 {
                    offset = CGSize.init(width: CGSize.zero.width , height: value.translation.height )
                }
                
            })
            .onEnded { value in
                if value.translation.height < -40 {
                    showingAlert = false
                    timer?.invalidate()
                    timer = nil
                    offset = CGSize.zero
                } else {
                    withAnimation {
                        offset = CGSize.zero
                    }
                }
            }
    }
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    if isImage { // In the project assets
                        Image(systemImage)
                            .resizable()
                            .aspectRatio(contentMode: ContentMode.fill)
                            .frame(width: 30, height: 30)
                            .cornerRadius(25)
                            .foregroundColor(textColor)
                            .padding(.leading, 12)
                    } else { // With system images
                        Image(systemName: systemImage)
                            .resizable()
                            .aspectRatio(contentMode: ContentMode.fill)
                            .frame(width: 30, height: 30)
                            .cornerRadius(25)
                            .foregroundColor(textColor)
                            .padding(.leading, 12)
                    }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        if title != "" {
                            HStack {
                                Text("\(title)")
                                    .foregroundColor(textColor)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                        }
                        
                        Text("\(message)")
                            .font(.system(size: message.count <= 68 ? 14 : 12))
                            .foregroundColor(textColor)
                            .onTapGesture {
                                if tap2AppStore {
                                    GSEktRCHelper.openAppStoreEkt()
                                }
                            }
                    }
                    .padding()
                    .padding(.leading, 12)
                    
                }
            }
            .frame(width: Dimension.sizeWidthPercent(percent: 88), alignment: .center)
            .padding([.leading,.trailing], 2)
            .background(
                RoundedRectangle(
                    cornerRadius: 12,
                    style: .continuous
                )
                .fill(getBackgroundColor(style: self.style))
            )
        }
        .offset(offset)
        .onAppear(perform: {
            timer = Timer.scheduledTimer(withTimeInterval: seconds, repeats: false) { timer in
                self.showingAlert = false
                timer.invalidate()
            }
        })
        .contentShape(Rectangle())
        .gesture(dragGesture)
    }
}

private func getBackgroundColor(style: styleAlert ) -> Color {
    switch style {
    case .info:
        return .alertInfo
    case .warning:
        return .backgroundYellowLight
    case .danger:
        return .alertError
    case .success:
        return .alertSuccess
    }
}
