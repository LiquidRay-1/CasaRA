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
        
        // self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration)
        
        self.sceneView.autoenablesDefaultLighting = true
    }

    @IBAction func Crear(_ sender: Any) {
        
        // Casa
        
        let node = SCNNode()
        node.geometry = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow
        node.position = SCNVector3(-0.3, 0, -0.3)
        self.sceneView.scene.rootNode.addChildNode(node)
        
        // Tejado
        
        let node2 = SCNNode()
        node2.geometry = SCNPyramid(width: 0.2, height: 0.2, length: 0.2)
        node2.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
        node2.position = SCNVector3(0, 0.1, 0)
        node.addChildNode(node2)
        
        // Puerta
        
        let puertaNode = SCNNode()
        puertaNode.geometry = SCNPlane(width: 0.03, height: 0.07)
        puertaNode.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
        puertaNode.position = SCNVector3(0, -0.05, 0.105)
        node.addChildNode(puertaNode)
        
        // Suelo
        
        let planoNode = SCNNode()
        planoNode.geometry = SCNPlane(width: 5, height: 5)
        planoNode.geometry?.firstMaterial?.diffuse.contents = UIColor.green
        planoNode.position = SCNVector3(0, -0.1, 0)
        planoNode.eulerAngles.x = -.pi / 2
        self.sceneView.scene.rootNode.addChildNode(planoNode)
        
        // Ventana 1
        
        let ventana1Node = SCNNode()
        ventana1Node.geometry = SCNPlane(width: 0.02, height: 0.02)
        ventana1Node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        ventana1Node.position = SCNVector3(-0.05, -0.05, 0.105)
        node.addChildNode(ventana1Node)
        
        // Ventana 2

        let ventana2Node = SCNNode()
        ventana2Node.geometry = SCNPlane(width: 0.02, height: 0.02)
        ventana2Node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        ventana2Node.position = SCNVector3(0.05, -0.05, 0.105)
        node.addChildNode(ventana2Node)
        
        // Tronco
        
        let troncoNode = SCNNode()
        troncoNode.geometry = SCNCylinder(radius: 0.01, height: 0.2)
        troncoNode.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
        troncoNode.position = SCNVector3(1, -0.1, 0)
        self.sceneView.scene.rootNode.addChildNode(troncoNode)
        
        // Copa

        let copaNode = SCNNode()
        copaNode.geometry = SCNSphere(radius: 0.05)
        copaNode.geometry?.firstMaterial?.diffuse.contents = UIColor.green
        copaNode.position = SCNVector3(1, 0.15, 0)
        troncoNode.addChildNode(copaNode)

        // Piscina
        
        let piscinaNode = SCNNode()
        piscinaNode.geometry = SCNCylinder(radius: 0.3, height: 0.1)
        piscinaNode.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        piscinaNode.position = SCNVector3(-1, -0.05, 0)
        self.sceneView.scene.rootNode.addChildNode(piscinaNode)

        // Flotador
        
        let flotadorNode = SCNNode()
        flotadorNode.geometry = SCNTorus(ringRadius: 0.1, pipeRadius: 0.03)
        flotadorNode.geometry?.firstMaterial?.diffuse.contents = UIColor.systemPink
        flotadorNode.position = SCNVector3(-1, 0.05, 0)
        piscinaNode.addChildNode(flotadorNode)

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

