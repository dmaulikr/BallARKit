//
//  ViewController+ARKit.swift
//  CubeARKit
//
//  Created by Zsolt Pete on 2017. 08. 01..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

extension ViewController {
    func placeBox() -> SCNNode{
        let boxGeometry: SCNBox = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.0)
        let boxNode: SCNNode = SCNNode(geometry: boxGeometry)
        boxNode.position = SCNVector3(x: 0,y: 0,z: -0.5)
        return boxNode
        
    }
    
    func initScene(){
        let scene: SCNScene = SCNScene()
        //scene.rootNode.addChildNode(self.placeBox())
        sceneView.scene = scene
        self.sceneView.autoenablesDefaultLighting = true
        self.sceneView.delegate = self
        self.sceneView.showsStatistics = true
        
    }
    
    func debugVisualization(){
        self.sceneView.debugOptions = [
            ARSCNDebugOptions.showWorldOrigin,
            ARSCNDebugOptions.showFeaturePoints
        ]
        
    }
    
}
