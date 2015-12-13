Datastore = require 'nedb'

module.exports = class MyDatastore extends Datastore
	constructor: (options) ->
		@afterDeserialization = options.afterDeserialization
		delete options.afterDeserialization
		return super options

	find: ->
		cursor = super
		exec = cursor._exec
		afterDeserialization = @afterDeserialization

		cursor._exec = (callback) ->
			exec.call cursor, (error, result) ->
				if afterDeserialization and result
					result = result.map afterDeserialization
				callback error, result

		cursor
