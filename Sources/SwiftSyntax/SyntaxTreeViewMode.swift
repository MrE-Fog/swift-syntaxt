//===--- SyntaxTreeViewMode.swift ----------------------------------------------===//
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

/// Specifies how missing and garbage nodes should be handled when traversing
/// a syntax tree.
public enum SyntaxTreeViewMode {
  /// Visit the tree in a way that reproduces the original source code.
  /// Missing nodes will not be visited, garbage nodes will be visited.
  /// This mode is useful for source code transformations like a formatter.
  case sourceAccurate

  /// Views the syntax tree with fixes applied, that is missing nodes will be
  /// visited but garbage nodes will be skipped.
  /// This views the tree in a way that's closer to being syntactical correct
  /// and should be used for structural analysis of the syntax tree.
  case fixedUp

  /// Both missing and garbage nodes will be traversed.
  /// Mostly useful for SwiftSyntax internal verifiers that verify the integrity
  /// of the entire tree
  case _all

  /// Returns whether this traversal node should visit `node` or ignore it.
  func shouldTraverse(node: RawSyntax) -> Bool {
    switch self {
    case .sourceAccurate:
      return node.presence == .present
    case .fixedUp:
      return node.kind != .garbageNodes
    case ._all:
      return true
    }
  }
}
