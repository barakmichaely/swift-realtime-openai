import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public protocol Connector: Sendable {
	var events: AsyncThrowingStream<ServerEvent, Error> { get }
	@MainActor var onDisconnect: (@Sendable () -> Void)? { get }

	init(connectingTo request: URLRequest) async throws

	func send(event: ClientEvent) async throws
     
     func send(customEvent: Encodable) async throws
     
     func disconnect()

	@MainActor func onDisconnect(_ action: (@Sendable () -> Void)?)
}
