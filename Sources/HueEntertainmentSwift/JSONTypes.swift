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

public struct HueEntertainmentArea: Codable, Hashable {
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
		self.id_v1 = id_v1
		self.type = type
		self.metadata = metadata
		self.configurationType = configurationType
		self.channels = channels
		self.status = status
	}
	
}

public struct HueEntertainmentAreaChannel: Codable, Hashable, Identifiable {
	public let id: UUID = UUID()
	public let channel_id: UInt8
	public let position: HueEntertainmentAreaPosition?
	
	public init(channel_id: UInt8, position: HueEntertainmentAreaPosition?) {
		self.id = id
		self.channel_id = channel_id
		self.position = position
	}
}

// MARK: - Position

public struct HueEntertainmentAreaPosition: Codable, Hashable {
	let x: Double?
	let y: Double?
	let z: Double?
}

// MARK: - Metadata

public struct HueEntertainmentAreaMetadata: Codable, Hashable {
	public let name: String?
	
	public init (name: String? = String()) { self.name = name }
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
