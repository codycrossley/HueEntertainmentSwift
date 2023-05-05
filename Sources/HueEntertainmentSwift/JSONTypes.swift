//
//  JSONTypes.swift
//
//
//  Created by Pat Nakajima on 8/20/22.
//

import Foundation

public struct HueBridgeResponse: Codable {
	var id: String?
	var internalipaddress: String
	var port: Int
	var macaddress: String?
	var name: String?
}

public struct HueEntertainmentAreaResponse: Codable {
	let errors: [String]
	let data: [HueEntertainmentArea]
}

public struct HueEntertainmentArea: Codable {
	public let id: String
	public let id_v1: String?
	public let type: String? 
	public let metadata: HueEntertainmentAreaMetadata?
	public let configurationType: String?
	public let channels: [HueEntertainmentAreaChannel]?
	public let status: String?
	
	public init(id: String,
		    id_v1: String? = String(),
		    type: String? = String(),
		    metadata: HueEntertainmentAreaMetadata? = HueEntertainmentAreaMetadata(),
		    configurationType: String? = String(),
		    channels: [HueEntertainmentAreaChannel]? = [],
		    status: String? = String()
		   ) {
		self.id = id
	}
	
}

public struct HueEntertainmentAreaChannel: Codable {
	let channel_id: UInt8
	let position: HueEntertainmentAreaPosition?
}

// MARK: - Position

public struct HueEntertainmentAreaPosition: Codable {
	let x: Double?
	let y: Double?
	let z: Double?
}

// MARK: - Metadata

public struct HueEntertainmentAreaMetadata: Codable {
	public let name: String?
	
	public init (name: String?) {
		self.name = name
	}
}

public struct HueBridgeCheck: Codable {
	let name: String
	let swversion: String
	let apiversion: String
	let mac: String
	let bridgeid: String
	let factorynew: Bool
	let replacesbridgeid: String?
	let modelid: String
}

public struct BridgeKeyRequest: Codable {
	let devicetype: String
	let generateclientkey: Bool
}

public struct BridgeKey: Codable {
	let username: String
	let clientkey: String
}

public struct BridgeError: Codable {
	let type: Int?
	let address: String?
	let description: String?
}

public struct BridgeKeyResponse: Codable {
	let success: BridgeKey?
	let error: BridgeError?
}

public struct BridgeAction: Codable {
	let action: String
}
