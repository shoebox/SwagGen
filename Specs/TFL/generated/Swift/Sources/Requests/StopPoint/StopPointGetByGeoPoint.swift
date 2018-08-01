//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension TFL.StopPoint {

    public enum StopPointGetByGeoPoint {

        public static let service = APIService<Response>(id: "StopPoint_GetByGeoPoint", tag: "StopPoint", method: "GET", path: "/StopPoint", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** a list of stopTypes that should be returned (a list of valid stop types can be obtained from the StopPoint/meta/stoptypes endpoint) */
                public var stopTypes: [String]

                /** the radius of the bounding circle in metres (default : 200) */
                public var radius: Int?

                /** Re-arrange the output into a parent/child hierarchy */
                public var useStopPointHierarchy: Bool?

                /** the list of modes to search (comma separated mode names e.g. tube,dlr) */
                public var modes: [String]?

                /** an optional list of comma separated property categories to return in the StopPoint's property bag. If null or empty, all categories of property are returned. Pass the keyword "none" to return no properties (a valid list of categories can be obtained from the /StopPoint/Meta/categories endpoint) */
                public var categories: [String]?

                /** true to return the lines that each stop point serves as a nested resource */
                public var returnLines: Bool?

                public var locationLat: Double

                public var locationLon: Double

                public init(stopTypes: [String], radius: Int? = nil, useStopPointHierarchy: Bool? = nil, modes: [String]? = nil, categories: [String]? = nil, returnLines: Bool? = nil, locationLat: Double, locationLon: Double) {
                    self.stopTypes = stopTypes
                    self.radius = radius
                    self.useStopPointHierarchy = useStopPointHierarchy
                    self.modes = modes
                    self.categories = categories
                    self.returnLines = returnLines
                    self.locationLat = locationLat
                    self.locationLon = locationLon
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: StopPointGetByGeoPoint.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(stopTypes: [String], radius: Int? = nil, useStopPointHierarchy: Bool? = nil, modes: [String]? = nil, categories: [String]? = nil, returnLines: Bool? = nil, locationLat: Double, locationLon: Double) {
                let options = Options(stopTypes: stopTypes, radius: radius, useStopPointHierarchy: useStopPointHierarchy, modes: modes, categories: categories, returnLines: returnLines, locationLat: locationLat, locationLon: locationLon)
                self.init(options: options)
            }

            public override var parameters: [String: Any] {
                var params: [String: Any] = [:]
                params["stopTypes"] = options.stopTypes.joined(separator: ",")
                if let radius = options.radius {
                  params["radius"] = radius
                }
                if let useStopPointHierarchy = options.useStopPointHierarchy {
                  params["useStopPointHierarchy"] = useStopPointHierarchy
                }
                if let modes = options.modes?.joined(separator: ",") {
                  params["modes"] = modes
                }
                if let categories = options.categories?.joined(separator: ",") {
                  params["categories"] = categories
                }
                if let returnLines = options.returnLines {
                  params["returnLines"] = returnLines
                }
                params["location.lat"] = options.locationLat
                params["location.lon"] = options.locationLon
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = StopPointsResponse

            /** OK */
            case status200(StopPointsResponse)

            public var success: StopPointsResponse? {
                switch self {
                case .status200(let response): return response
                }
            }

            public var response: Any {
                switch self {
                case .status200(let response): return response
                }
            }

            public var statusCode: Int {
                switch self {
                case .status200: return 200
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                }
            }

            public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
                switch statusCode {
                case 200: self = try .status200(decoder.decode(StopPointsResponse.self, from: data))
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
