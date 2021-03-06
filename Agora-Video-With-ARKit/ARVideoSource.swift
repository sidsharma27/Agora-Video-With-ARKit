//
//  ARVideoSource.swift
//  Agora-Video-With-ARKit
//
//  Created by GongYuhua on 2018/1/11.
//  Copyright © 2018年 Agora. All rights reserved.
//

import UIKit
import AgoraRtcEngineKit

class ARVideoSource: NSObject, AgoraVideoSourceProtocol {
    var consumer: AgoraVideoFrameConsumer?
    
    func shouldInitialize() -> Bool { return true }
    
    func shouldStart() { }
    
    func shouldStop() { }
    
    func shouldDispose() { }
    
    func bufferType() -> AgoraVideoBufferType {
        return .pixelBuffer
    }
    
    func sendBuffer(_ buffer: CVPixelBuffer, timestamp: TimeInterval) {
        let time = CMTime(seconds: timestamp, preferredTimescale: 10000)
        consumer?.consumePixelBuffer(buffer, withTimestamp: time, rotation: .rotation90)
    }
}
