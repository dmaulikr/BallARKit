//
//  Plane.swift
//  CubeARKit
//
//  Created by Zsolt Pete on 2017. 08. 01..
//  Copyright © 2017. Zsolt Pete. All rights reserved.
//

import UIKit
import ARKit

class Plane: SCNNode {
    
    var anchor: ARPlaneAnchor = ARPlaneAnchor()
    var planeGeometry: SCNPlane = SCNPlane()
    init(anchor: ARPlaneAnchor) {
        super.init()
        self.anchor = anchor
        self.planeGeometry = SCNPlane(width: CGFloat(anchor.extent.x), height: CGFloat(anchor.extent.z))
        
        let material: SCNMaterial = SCNMaterial()
        let img: UIImage = UIImage(named: "tron")!
        material.diffuse.contents = img
        self.planeGeometry.materials = [material]
        
        let planeNode: SCNNode = SCNNode(geometry: self.planeGeometry)
        planeNode.position = SCNVector3(x: anchor.center.x, y: 0, z: anchor.center.z)
        
        planeNode.transform = SCNMatrix4MakeRotation(Float(-M_PI_2), 1.0, 0.0, 0.0)
        
        self.setTextureScale()
        self.addChildNode(planeNode)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTextureScale(){
        let width: CGFloat = self.planeGeometry.width
        let height: CGFloat = self.planeGeometry.height
        
        let material = self.planeGeometry.materials.first
        material?.diffuse.contentsTransform = SCNMatrix4MakeScale(Float(width), Float(height), 1)
        material?.diffuse.wrapS = .repeat
        material?.diffuse.wrapT = .repeat
        
    }
    
    func update(anchor: ARPlaneAnchor){
        self.planeGeometry.width = CGFloat(anchor.extent.x)
        self.planeGeometry.height = CGFloat(anchor.extent.z)
        
        self.position = SCNVector3Make(anchor.center.x, 0, anchor.center.z)
        self.setTextureScale()
        
    }
    
    func hide(){
        let transparentMaterial: SCNMaterial = SCNMaterial()
        transparentMaterial.diffuse.contents = [UIColor(white: 1.0, alpha: 0.0)]
        self.planeGeometry.materials = [transparentMaterial, transparentMaterial, transparentMaterial, transparentMaterial, transparentMaterial, transparentMaterial]
    }
    
}
