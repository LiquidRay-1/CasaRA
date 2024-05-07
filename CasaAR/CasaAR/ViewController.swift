//
//  ViewController.swift
//  CasaAR
//
//  Created by Liquid on 7/5/24.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration)
        
        self.sceneView.autoenablesDefaultLighting = true
    }

    @IBAction func Crear(_ sender: Any) {
        let node = SCNNode()
        node.geometry = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow
        node.position = SCNVector3(-0.3, 0, -0.3)
        self.sceneView.scene.rootNode.addChildNode(node)
        
        let node2 = SCNNode()
        node2.geometry = SCNPyramid(width: 0.2, height: 0.2, length: 0.2)
        node2.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
        node2.position = SCNVector3(0, 0.1, 0)
        node.addChildNode(node2)
        
        let puertaNode = SCNNode()
        puertaNode.geometry = SCNPlane(width: 0.03, height: 0.07)
        puertaNode.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
        puertaNode.position = SCNVector3(0, -0.05, 0.105)
        node.addChildNode(puertaNode)
    }
    
    
    @IBAction func Borrar(_ sender: Any) {
        self.restartSession()
    }
    
    func restartSession (){
        self.sceneView.session.pause()
        self.sceneView.scene.rootNode.enumerateChildNodes{ (node, _) in
            node.removeFromParentNode()
        }
        self.sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
}

