//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension TestSpec {

    /** operation without a tag */
    public enum GetUntagged {

        public static let service = APIService<Response>(id: "getUntagged", tag: "", method: "GET", path: "/untagged", hasBody: false)

        public final class Request: APIRequest<Response> {

            public init() {
                super.init(service: GetUntagged.service)
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = Void

            /** Empty response */
            case status201

            public var success: Void? {
                switch self {
                case .status201: return ()
                }
            }

            public var response: Any {
                switch self {
                default: return ()
                }
            }

            public var statusCode: Int {
                switch self {
                case .status201: return 201
                }
            }

            public var successful: Bool {
                switch self {
                case .status201: return true
                }
            }

            public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
                switch statusCode {
                case 201: self = .status201
                default: throw APIClientError.unexpectedStatusCode(statusCode: statusCode, data: data)
                }
            }

            public var description: String {
                return "\(statusCode) \(successful ? "success" : "failure")"
            }

            public var debugDescription: String {
                var string = description
                let responseString = "\(response)"
                if responseString != "()" {
                    string += "\n\(responseString)"
                }
                return string
            }
        }
    }
}
