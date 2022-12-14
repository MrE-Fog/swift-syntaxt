//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2022 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

import Foundation
import SwiftSyntax
import SyntaxSupport
import SwiftSyntaxBuilder
import Utils

let resultBuildersFile = SourceFile {
  ImportDecl(
    leadingTrivia: .docLineComment(copyrightHeader),
    path: "SwiftSyntax"
  )
  for node in SYNTAX_NODES where node.isSyntaxCollection {
    let type = SyntaxBuildableType(syntaxKind: node.syntaxKind)
    let elementType = node.collectionElementType
    
    StructDecl(
      attributes: Token.identifier("@resultBuilder").withLeadingTrivia(.newlines(1)).withTrailingTrivia(.newlines(1)),
      modifiers: Token.public,
      identifier: "\(type.syntaxKind)Builder") {
        
        TypealiasDecl(
          """
          /// The type of individual statement expressions in the transformed function,
          /// which defaults to Component if buildExpression() is not provided.
          public typealias Expression = \(elementType.expressibleAsBaseName)
          """
        )
        
        TypealiasDecl(
          """
          /// The type of a partial result, which will be carried through all of the
          /// build methods.
          public typealias Component = [\(elementType.expressibleAs)]
          """
        )
        
        TypealiasDecl(
          """
          /// The type of the final returned result, which defaults to Component if
          /// buildFinalResult() is not provided.
          public typealias FinalResult = \(type.buildable)
          """
        )
        
        FunctionDecl(
          """
          /// Required by every result builder to build combined results from
          /// statement blocks.
          public static func buildBlock(_ components: Component...) -> Component {
            return components.flatMap { $0 }
          }
          """
        )
        
        FunctionDecl(
          """
          /// If declared, provides contextual type information for statement
          /// expressions to translate them into partial results.
          public static func buildExpression(_ expression: Expression) -> Component {
            return [expression]
          }
          """
        )
        
        FunctionDecl(
          """
          /// Add all the elements of `expression` to this result builder, effectively flattening them.
          public static func buildExpression(_ expression: \(type.expressibleAs)) -> Component {
            return expression.create\(type.buildable)().elements
          }
          """
        )
        
        FunctionDecl(
          """
          /// Enables support for `if` statements that do not have an `else`.
          public static func buildOptional(_ component: Component?) -> Component {
            return component ?? []
          }
          """
        )
                
        FunctionDecl(
          """
          /// With buildEither(second:), enables support for 'if-else' and 'switch'
          /// statements by folding conditional results into a single result.
          public static func buildEither(first component: Component) -> Component {
            return component
          }
          """
        )
        
        FunctionDecl(
          """
          /// With buildEither(first:), enables support for 'if-else' and 'switch'
          /// statements by folding conditional results into a single result.
          public static func buildEither(second component: Component) -> Component {
            return component
          }
          """
        )
                
        FunctionDecl(
          """
          /// Enables support for 'for..in' loops by combining the
          /// results of all iterations into a single result.
          public static func buildArray(_ components: [Component]) -> Component {
            return components.flatMap { $0 }
          }
          """
        )
        
        FunctionDecl(
          """
          /// If declared, this will be called on the partial result of an 'if'
          /// #available' block to allow the result builder to erase type
          /// information.
          public static func buildLimitedAvailability(_ component: Component) -> Component {
            return component
          }
          """
        )
        
        FunctionDecl(
          leadingTrivia: [
            .newlines(1),
            .docLineComment("/// If declared, this will be called on the partial result from the outermost"),
            .newlines(1),
            .docLineComment("/// block statement to produce the final returned result."),
            .newlines(1)],
          modifiers: [Token.public, Token.static],
          identifier: .identifier("buildFinalResult"),
          signature: FunctionSignature(
            input: ParameterClause {
              FunctionParameter(
                firstName: .wildcard,
                secondName: .identifier("component"),
                colon: .colon,
                type: "Component")
            },
            output: "FinalResult")) {
              if elementType.isToken {
                ReturnStmt(
                  """
                  return .init(component)
                  """
                )
              } else if elementType.hasWithTrailingCommaTrait {
                VariableDecl(
                  """
                  let lastIndex = component.count - 1
                  """
                )
                
                ReturnStmt(
                  """
                  return .init(component.enumerated().map { index, source in
                    let element = source.create\(elementType.buildableBaseName)()
                    return index < lastIndex ? element.ensuringTrailingComma() : element
                  })
                  """
                )
              } else {
                ReturnStmt(
                  """
                  return .init(component.map { $0.create\(elementType.buildableBaseName)() })
                  """
                )
              }
            }
      }
      
    ExtensionDecl(
      """
      public extension \(type.buildableBaseName) {
        init(@\(type.resultBuilderBaseName) itemsBuilder: () -> \(type.buildableBaseName)) {
          self = itemsBuilder()
        }
      }
      """
    )
  }
}
