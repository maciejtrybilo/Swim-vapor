import Swim
import Vapor

// This struct allows replying with HTML for non-200 status codes.
// This is especially important in HTMX where all responses from the
// server should be HTML rather than the { error: true, reason: "..." }
// JSON response that Vapor issues on throw Abort().
public struct NodeResponse: AsyncResponseEncodable {
    
    let node: Node
    let status: HTTPStatus
    
    public func encodeResponse(for request: Vapor.Request) async throws -> Vapor.Response {
        var headers = HTTPHeaders()
        headers.add(name: .contentType, value: "text/html")
        return .init(status: .ok, headers: headers, body: .init(string: node.render()))
    }
    
    init(node: Node, status: HTTPStatus = .ok) {
        self.node = node
        self.status = status
    }
}
