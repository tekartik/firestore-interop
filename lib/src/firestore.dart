@JS()
library firestore;

import "package:js/js.dart";
import "package:func/func.dart";
import "package:node_interop/node_interop.dart";

/// @fileoverview Firestore Server API.
/// Copyright 2017 Google Inc. All Rights Reserved.
/// Licensed under the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at
/// http://www.apache.org/licenses/LICENSE-2.0
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.

/// tslint:disable

/// Declare a global (ambient) namespace
/// (used when not using import statement, but just script include).

// Module FirebaseFirestore
/// Document data (for use with `DocumentReference.set()`) consists of fields
/// mapped to values.
@anonymous
@JS()
abstract class DocumentData {
  /* Index signature is not yet supported by JavaScript interop. */
}

/// Update data (for use with `DocumentReference.update()`) consists of field
/// paths (e.g. 'foo' or 'foo.baz') mapped to values. Fields that contain dots
/// reference nested fields within the document.
@anonymous
@JS()
abstract class UpdateData {
  /* Index signature is not yet supported by JavaScript interop. */
}

/// Sets the log function for all active Firestore instances.
@JS("FirebaseFirestore.setLogFunction")
external void setLogFunction(void logger(String msg));

/// `Firestore` represents a Firestore Database and is the entry point for all
/// Firestore operations.
@JS("FirebaseFirestore.Firestore")
class Firestore {
  // @Ignore
  Firestore.fakeConstructor$();

  /// [https://firebase.google.com/docs/firestore/]
  external factory Firestore([dynamic options]);

  /// Gets a `CollectionReference` instance that refers to the collection at
  /// the specified path.
  external CollectionReference collection(String collectionPath);

  /// Gets a `DocumentReference` instance that refers to the document at the
  /// specified path.
  external DocumentReference doc(String documentPath);

  /// Retrieves multiple documents from Firestore.
  /// snapshots.
  external Promise<List<DocumentSnapshot>> getAll(
      [DocumentReference documentRef1,
      DocumentReference documentRef2,
      DocumentReference documentRef3,
      DocumentReference documentRef4,
      DocumentReference documentRef5]);

  /// Executes the given updateFunction and commits the changes applied within
  /// the transaction.
  /// You can use the transaction object passed to 'updateFunction' to read and
  /// modify Firestore documents under lock. Transactions are committed once
  /// 'updateFunction' resolves and attempted up to five times on failure.
  /// context.
  /// aborted (by the updateFunction returning a failed Promise), the Promise
  /// returned by the updateFunction will be returned here. Else if the
  /// transaction failed, a rejected Promise with the corresponding failure
  /// error will be returned.
  external Promise<dynamic/*=T*/ > runTransaction/*<T>*/(
      Promise<dynamic/*=T*/ > updateFunction(Transaction transaction));

  /// Creates a write batch, used for performing multiple writes as a single
  /// atomic operation.
  external WriteBatch batch();
}

/// An immutable object representing a geo point in Firestore. The geo point
/// is represented as latitude/longitude pair.
/// Latitude values are in the range of [-90, 90].
/// Longitude values are in the range of [-180, 180].
@JS("FirebaseFirestore.GeoPoint")
class GeoPoint {
  // @Ignore
  GeoPoint.fakeConstructor$();

  /// Creates a new immutable GeoPoint object with the provided latitude and
  /// longitude values.
  external factory GeoPoint(num latitude, num longitude);
  external num get latitude;
  external set latitude(num v);
  external num get longitude;
  external set longitude(num v);
}

/// A reference to a transaction.
/// The `Transaction` object passed to a transaction's updateFunction provides
/// the methods to read and write data within the transaction context. See
/// `Firestore.runTransaction()`.
@JS("FirebaseFirestore.Transaction")
class Transaction {
  // @Ignore
  Transaction.fakeConstructor$();
  external factory Transaction();

  /// Reads the document referenced by the provided `DocumentReference.`
  /// Holds a pessimistic lock on the returned document.
  /*external Promise<DocumentSnapshot> get(DocumentReference documentRef);*/
  /// Retrieves a query result. Holds a pessimistic lock on the returned
  /// documents.
  /*external Promise<QuerySnapshot> get(Query query);*/
  external Promise /*Promise<DocumentSnapshot>|Promise<QuerySnapshot>*/ get(
      dynamic /*DocumentReference|Query*/ documentRef_query);

  /// Create the document referred to by the provided `DocumentReference`.
  /// The operation will fail the transaction if a document exists at the
  /// specified location.
  external Transaction create(DocumentReference documentRef, DocumentData data);

  /// Writes to the document referred to by the provided `DocumentReference`.
  /// If the document does not exist yet, it will be created. If you pass
  /// `SetOptions`, the provided data can be merged into the existing document.
  external Transaction set(DocumentReference documentRef, DocumentData data,
      [SetOptions options]);

  /// Updates fields in the document referred to by the provided
  /// `DocumentReference`. The update will fail if applied to a document that
  /// does not exist.
  /// Nested fields can be updated by providing dot-separated field path
  /// strings.
  /// update the document.
  /*external Transaction update(DocumentReference documentRef, UpdateData data,
    [Precondition precondition]);*/
  /// Updates fields in the document referred to by the provided
  /// `DocumentReference`. The update will fail if applied to a document that
  /// does not exist.
  /// Nested fields can be updated by providing dot-separated field path
  /// strings or by providing FieldPath objects.
  /// A `Precondition` restricting this update can be specified as the last
  /// argument.
  /// to update, optionally followed by a `Precondition` to enforce on this
  /// update.
  /*external Transaction update(DocumentReference documentRef, String|FieldPath field, dynamic value, [dynamic fieldsOrPrecondition1, dynamic fieldsOrPrecondition2, dynamic fieldsOrPrecondition3, dynamic fieldsOrPrecondition4, dynamic fieldsOrPrecondition5]);*/
  external Transaction update(
      DocumentReference documentRef, dynamic /*String|FieldPath*/ data_field,
      [dynamic /*Precondition|dynamic*/ precondition_value,
      List<dynamic> fieldsOrPrecondition]);

  /// Deletes the document referred to by the provided `DocumentReference`.
  external Transaction delete(DocumentReference documentRef,
      [Precondition precondition]);
}

/// A write batch, used to perform multiple writes as a single atomic unit.
/// A `WriteBatch` object can be acquired by calling `Firestore.batch()`. It
/// provides methods for adding writes to the write batch. None of the
/// writes will be committed (or visible locally) until `WriteBatch.commit()`
/// is called.
/// Unlike transactions, write batches are persisted offline and therefore are
/// preferable when you don't need to condition your writes on read data.
@JS("FirebaseFirestore.WriteBatch")
class WriteBatch {
  // @Ignore
  WriteBatch.fakeConstructor$();
  external factory WriteBatch();

  /// Create the document referred to by the provided `DocumentReference`. The
  /// operation will fail the batch if a document exists at the specified
  /// location.
  external WriteBatch create(DocumentReference documentRef, DocumentData data);

  /// Write to the document referred to by the provided `DocumentReference`.
  /// If the document does not exist yet, it will be created. If you pass
  /// `SetOptions`, the provided data can be merged into the existing document.
  external WriteBatch set(DocumentReference documentRef, DocumentData data,
      [SetOptions options]);

  /// Update fields of the document referred to by the provided
  /// `DocumentReference`. If the document doesn't yet exist, the update fails
  /// and the entire batch will be rejected.
  /// Nested fields can be updated by providing dot-separated field path
  /// strings.
  /// update the document.
  /*external WriteBatch update(DocumentReference documentRef, UpdateData data,
    [Precondition precondition]);*/
  /// Updates fields in the document referred to by the provided
  /// `DocumentReference`. The update will fail if applied to a document that
  /// does not exist.
  /// Nested fields can be updated by providing dot-separated field path
  /// strings or by providing FieldPath objects.
  /// A `Precondition` restricting this update can be specified as the last
  /// argument.
  /// to update, optionally followed a `Precondition` to enforce on this update.
  /*external WriteBatch update(DocumentReference documentRef, String|FieldPath field, dynamic value, [dynamic fieldsOrPrecondition1, dynamic fieldsOrPrecondition2, dynamic fieldsOrPrecondition3, dynamic fieldsOrPrecondition4, dynamic fieldsOrPrecondition5]);*/
  external WriteBatch update(
      DocumentReference documentRef, dynamic /*String|FieldPath*/ data_field,
      [dynamic /*Precondition|dynamic*/ precondition_value,
      List<dynamic> fieldsOrPrecondition]);

  /// Deletes the document referred to by the provided `DocumentReference`.
  external WriteBatch delete(DocumentReference documentRef,
      [Precondition precondition]);

  /// Commits all of the writes in this write batch as a single atomic unit.
  /// successfully written to the backend as an atomic unit.
  external Promise<List<WriteResult>> commit();
}

/// An options object that configures conditional behavior of `update()` and
/// `delete()` calls in `DocumentReference`, `WriteBatch`, and `Transaction`.
/// Using Preconditions, these calls can be restricted to only apply to
/// documents that match the specified restrictions.
@anonymous
@JS()
abstract class Precondition {
  /// If set, the last update time to enforce (specified as an ISO 8601
  /// string).
  external String get lastUpdateTime;
  external set lastUpdateTime(String v);
  external factory Precondition({String lastUpdateTime});
}

/// An options object that configures the behavior of `set()` calls in
/// `DocumentReference`, `WriteBatch` and `Transaction`. These calls can be
/// configured to perform granular merges instead of overwriting the target
/// documents in their entirety by providing a `SetOptions` with `merge: true`.
@anonymous
@JS()
abstract class SetOptions {
  /// Changes the behavior of a set() call to only replace the values specified
  /// in its data argument. Fields omitted from the set() call remain
  /// untouched.
  external bool get merge;
  external set merge(bool v);
  external factory SetOptions({bool merge});
}

/// A WriteResult wraps the write time set by the Firestore servers on `sets()`,
/// `updates()`, and `creates()`.
@JS("FirebaseFirestore.WriteResult")
class WriteResult {
  // @Ignore
  WriteResult.fakeConstructor$();
  external factory WriteResult();

  /// The write time as set by the Firestore servers. Formatted as an ISO-8601
  /// string.
  external String get writeTime;
  external set writeTime(String v);
}

/// A `DocumentReference` refers to a document location in a Firestore database
/// and can be used to write, read, or listen to the location. The document at
/// the referenced location may or may not exist. A `DocumentReference` can
/// also be used to create a `CollectionReference` to a subcollection.
@JS("FirebaseFirestore.DocumentReference")
class DocumentReference {
  // @Ignore
  DocumentReference.fakeConstructor$();
  external factory DocumentReference();

  /// The identifier of the document within its collection.
  external String get id;
  external set id(String v);

  /// The `Firestore` for the Firestore database (useful for performing
  /// transactions, etc.).
  external Firestore get firestore;
  external set firestore(Firestore v);

  /// A reference to the Collection to which this DocumentReference belongs.
  external CollectionReference get parent;
  external set parent(CollectionReference v);

  /// A string representing the path of the referenced document (relative
  /// to the root of the database).
  external String get path;
  external set path(String v);

  /// Gets a `CollectionReference` instance that refers to the collection at
  /// the specified path.
  external CollectionReference collection(String collectionPath);

  /// Creates a document referred to by this `DocumentReference` with the
  /// provided object values. The write fails if the document already exists
  external Promise<WriteResult> create(DocumentData data);

  /// Writes to the document referred to by this `DocumentReference`. If the
  /// document does not yet exist, it will be created. If you pass
  /// `SetOptions`, the provided data can be merged into an existing document.
  external Promise<WriteResult> set(DocumentData data, [SetOptions options]);

  /// Updates fields in the document referred to by this `DocumentReference`.
  /// The update will fail if applied to a document that does not exist.
  /// Nested fields can be updated by providing dot-separated field path
  /// strings.
  /// update the document.
  /*external Promise<WriteResult> update(UpdateData data,
    [Precondition precondition]);*/
  /// Updates fields in the document referred to by this `DocumentReference`.
  /// The update will fail if applied to a document that does not exist.
  /// Nested fields can be updated by providing dot-separated field path
  /// strings or by providing FieldPath objects.
  /// A `Precondition` restricting this update can be specified as the last
  /// argument.
  /// values to update, optionally followed by a `Precondition` to enforce on
  /// this update.
  /*external Promise<WriteResult> update(String|FieldPath field, dynamic value, [dynamic moreFieldsOrPrecondition1, dynamic moreFieldsOrPrecondition2, dynamic moreFieldsOrPrecondition3, dynamic moreFieldsOrPrecondition4, dynamic moreFieldsOrPrecondition5]);*/
  external Promise<WriteResult> update(dynamic /*String|FieldPath*/ data_field,
      [dynamic /*Precondition|dynamic*/ precondition_value,
      List<dynamic> moreFieldsOrPrecondition]);

  /// Deletes the document referred to by this `DocumentReference`.
  external Promise<WriteResult> delete([Precondition precondition]);

  /// Reads the document referred to by this `DocumentReference`.
  /// current document contents.
  external Promise<DocumentSnapshot> get();

  /// Attaches a listener for DocumentSnapshot events.
  /// is available.
  /// cancelled. No further callbacks will occur.
  /// the snapshot listener.
  external VoidFunc0 onSnapshot(void onNext(DocumentSnapshot snapshot),
      [void onError(Error error)]);
}

/// A `DocumentSnapshot` contains data read from a document in your Firestore
/// database. The data can be extracted with `.data()` or `.get(<field>)` to
/// get a specific field.
@JS("FirebaseFirestore.DocumentSnapshot")
class DocumentSnapshot {
  // @Ignore
  DocumentSnapshot.fakeConstructor$();
  external factory DocumentSnapshot();

  /// True if the document exists.
  external bool get exists;
  external set exists(bool v);

  /// A `DocumentReference` to the document location.
  external DocumentReference get ref;
  external set ref(DocumentReference v);

  /// The ID of the document for which this `DocumentSnapshot` contains data.
  external String get id;
  external set id(String v);

  /// The time the document was created. Not set for documents that don't
  /// exist.
  external String get createTime;
  external set createTime(String v);

  /// The time the document was last updated (at the time the snapshot was
  /// generated). Not set for documents that don't exist.
  external String get updateTime;
  external set updateTime(String v);

  /// The time this snapshot was read.
  external String get readTime;
  external set readTime(String v);

  /// Retrieves all fields in the document as an Object.
  external DocumentData data();

  /// Retrieves the field specified by `fieldPath`.
  /// field exists in the document.
  external dynamic get(dynamic /*String|FieldPath*/ fieldPath);
}

/// The direction of a `Query.orderBy()` clause is specified as 'desc' or 'asc'
/// (descending or ascending).
/*export type OrderByDirection = 'desc' | 'asc';*/
/// Filter conditions in a `Query.where()` clause are specified using the
/// strings '<', '<=', '==', '>=', and '>'.
/*export type WhereFilterOp = '<' | '<=' | '==' | '>=' | '>';*/
/// A `Query` refers to a Query which you can read or listen to. You can also
/// construct refined `Query` objects by adding filters and ordering.
@JS("FirebaseFirestore.Query")
class Query {
  // @Ignore
  Query.fakeConstructor$();
  external factory Query();

  /// The `Firestore` for the Firestore database (useful for performing
  /// transactions, etc.).
  external Firestore get firestore;
  external set firestore(Firestore v);

  /// Creates and returns a new Query with the additional filter that documents
  /// must contain the specified field and the value should satisfy the
  /// relation constraint provided.
  /// This function returns a new (immutable) instance of the Query (rather
  /// than modify the existing instance) to impose the filter.
  external Query where(dynamic /*String|FieldPath*/ fieldPath,
      String /*'<'|'<='|'=='|'>='|'>'*/ opStr, dynamic value);

  /// Creates and returns a new Query that's additionally sorted by the
  /// specified field, optionally in descending order instead of ascending.
  /// This function returns a new (immutable) instance of the Query (rather
  /// than modify the existing instance) to impose the order.
  /// not specified, order will be ascending.
  external Query orderBy(dynamic /*String|FieldPath*/ fieldPath,
      [String /*'desc'|'asc'*/ directionStr]);

  /// Creates and returns a new Query that's additionally limited to only
  /// return up to the specified number of documents.
  /// This function returns a new (immutable) instance of the Query (rather
  /// than modify the existing instance) to impose the limit.
  external Query limit(num limit);

  /// Specifies the offset of the returned results.
  /// This function returns a new (immutable) instance of the Query (rather
  /// than modify the existing instance) to impose the offset.
  external Query offset(num offset);

  /// Creates and returns a new Query instance that applies a field mask to
  /// the result and returns only the specified subset of fields. You can
  /// specify a list of field paths to return, or use an empty list to only
  /// return the references of matching documents.
  /// This function returns a new (immutable) instance of the Query (rather
  /// than modify the existing instance) to impose the field mask.
  external Query select(
      [dynamic /*String|FieldPath*/ field1,
      dynamic /*String|FieldPath*/ field2,
      dynamic /*String|FieldPath*/ field3,
      dynamic /*String|FieldPath*/ field4,
      dynamic /*String|FieldPath*/ field5]);

  /// Creates and returns a new Query that starts at the provided fields
  /// relative to the order of the query. The order of the field values
  /// must match the order of the order by clauses of the query.
  /// of the query's order by.
  external Query startAt(
      [dynamic fieldValues1,
      dynamic fieldValues2,
      dynamic fieldValues3,
      dynamic fieldValues4,
      dynamic fieldValues5]);

  /// Creates and returns a new Query that starts after the provided fields
  /// relative to the order of the query. The order of the field values
  /// must match the order of the order by clauses of the query.
  /// of the query's order by.
  external Query startAfter(
      [dynamic fieldValues1,
      dynamic fieldValues2,
      dynamic fieldValues3,
      dynamic fieldValues4,
      dynamic fieldValues5]);

  /// Creates and returns a new Query that ends before the provided fields
  /// relative to the order of the query. The order of the field values
  /// must match the order of the order by clauses of the query.
  /// of the query's order by.
  external Query endBefore(
      [dynamic fieldValues1,
      dynamic fieldValues2,
      dynamic fieldValues3,
      dynamic fieldValues4,
      dynamic fieldValues5]);

  /// Creates and returns a new Query that ends at the provided fields
  /// relative to the order of the query. The order of the field values
  /// must match the order of the order by clauses of the query.
  /// of the query's order by.
  external Query endAt(
      [dynamic fieldValues1,
      dynamic fieldValues2,
      dynamic fieldValues3,
      dynamic fieldValues4,
      dynamic fieldValues5]);

  /// Executes the query and returns the results as a `QuerySnapshot`.
  external Promise<QuerySnapshot> get();

  /// Executes the query and returns the results as Node Stream.
  external Readable stream();

  /// Attaches a listener for `QuerySnapshot `events.
  /// is available.
  /// cancelled. No further callbacks will occur.
  /// the snapshot listener.
  external VoidFunc0 onSnapshot(void onNext(QuerySnapshot snapshot),
      [void onError(Error error)]);
}

/// A `QuerySnapshot` contains zero or more `DocumentSnapshot` objects
/// representing the results of a query. The documents can be accessed as an
/// array via the `docs` property or enumerated using the `forEach` method. The
/// number of documents can be determined via the `empty` and `size`
/// properties.
@JS("FirebaseFirestore.QuerySnapshot")
class QuerySnapshot {
  // @Ignore
  QuerySnapshot.fakeConstructor$();
  external factory QuerySnapshot();

  /// The query on which you called `get` or `onSnapshot` in order to get this
  /// `QuerySnapshot`.
  external Query get query;
  external set query(Query v);

  /// An array of the documents that changed since the last snapshot. If this
  /// is the first snapshot, all documents will be in the list as added
  /// changes.
  external List<DocumentChange> get docChanges;
  external set docChanges(List<DocumentChange> v);

  /// An array of all the documents in the QuerySnapshot.
  external List<DocumentSnapshot> get docs;
  external set docs(List<DocumentSnapshot> v);

  /// The number of documents in the QuerySnapshot.
  external num get size;
  external set size(num v);

  /// True if there are no documents in the QuerySnapshot.
  external bool get empty;
  external set empty(bool v);

  /// The time this query snapshot was obtained.
  external String get readTime;
  external set readTime(String v);

  /// Enumerates all of the documents in the QuerySnapshot.
  /// each document in the snapshot.
  external void forEach(void callback(DocumentSnapshot result),
      [dynamic thisArg]);
}

/// The type of of a `DocumentChange` may be 'added', 'removed', or 'modified'.
/*export type DocumentChangeType = 'added' | 'removed' | 'modified';*/
/// A `DocumentChange` represents a change to the documents matching a query.
/// It contains the document affected and the type of change that occurred.
@anonymous
@JS()
abstract class DocumentChange {
  /// The type of change ('added', 'modified', or 'removed').
  external String /*'added'|'removed'|'modified'*/ get type;
  external set type(String /*'added'|'removed'|'modified'*/ v);

  /// The document affected by this change.
  external DocumentSnapshot get doc;
  external set doc(DocumentSnapshot v);

  /// The index of the changed document in the result set immediately prior to
  /// this DocumentChange (i.e. supposing that all prior DocumentChange objects
  /// have been applied). Is -1 for 'added' events.
  external num get oldIndex;
  external set oldIndex(num v);

  /// The index of the changed document in the result set immediately after
  /// this DocumentChange (i.e. supposing that all prior DocumentChange
  /// objects and the current DocumentChange object have been applied).
  /// Is -1 for 'removed' events.
  external num get newIndex;
  external set newIndex(num v);
  external factory DocumentChange(
      {String /*'added'|'removed'|'modified'*/ type,
      DocumentSnapshot doc,
      num oldIndex,
      num newIndex});
}

/// A `CollectionReference` object can be used for adding documents, getting
/// document references, and querying for documents (using the methods
/// inherited from `Query`).
@JS("FirebaseFirestore.CollectionReference")
class CollectionReference extends Query {
  // @Ignore
  CollectionReference.fakeConstructor$() : super.fakeConstructor$();
  external factory CollectionReference();

  /// The identifier of the collection.
  external String get id;
  external set id(String v);

  /// A reference to the containing Document if this is a subcollection, else
  /// null.
  external DocumentReference /*DocumentReference|Null*/ get parent;
  external set parent(DocumentReference /*DocumentReference|Null*/ v);

  /// A string representing the path of the referenced collection (relative
  /// to the root of the database).
  external String get path;
  external set path(String v);

  /// Get a `DocumentReference` for the document within the collection at the
  /// specified path. If no path is specified, an automatically-generated
  /// unique ID will be used for the returned DocumentReference.
  external DocumentReference doc([String documentPath]);

  /// Add a new document to this collection with the specified data, assigning
  /// it a document ID automatically.
  /// newly created document after it has been written to the backend.
  external Promise<DocumentReference> add(DocumentData data);
}

/// Sentinel values that can be used when writing document fields with set()
/// or update().
@JS("FirebaseFirestore.FieldValue")
class FieldValue {
  // @Ignore
  FieldValue.fakeConstructor$();
  external factory FieldValue();

  /// Returns a sentinel used with set() or update() to include a
  /// server-generated timestamp in the written data.
  external static FieldValue serverTimestamp();

  /// Returns a sentinel for use with update() to mark a field for deletion.
  external static FieldValue delete();
}

/// A FieldPath refers to a field in a document. The path may consist of a
/// single field name (referring to a top-level field in the document), or a
/// list of field names (referring to a nested field in the document).
@JS("FirebaseFirestore.FieldPath")
class FieldPath {
  // @Ignore
  FieldPath.fakeConstructor$();

  /// Creates a FieldPath from the provided field names. If more than one field
  /// name is provided, the path will point to a nested field in a document.
  external factory FieldPath(
      [String fieldNames1,
      String fieldNames2,
      String fieldNames3,
      String fieldNames4,
      String fieldNames5]);

  /// Returns a special sentinel FieldPath to refer to the ID of a document.
  /// It can be used in queries to sort or filter by the document ID.
  external static FieldPath documentId();
}

// End module FirebaseFirestore

// Module @google-cloud/firestore
/* WARNING: export assignment not yet supported. */

// End module @google-cloud/firestore
