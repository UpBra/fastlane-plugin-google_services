require 'fastlane/action'
require_relative '../helper/google_services_helper'

module Fastlane

	module Actions

		module SharedValues
			GS_PLIST_VALUES_GOOGLE_APP_ID = :GS_PLIST_VALUES_GOOGLE_APP_ID
			GS_PLIST_VALUES_BUNDLE_ID = :GS_PLIST_VALUES_BUNDLE_ID
			GS_PLIST_VALUES_PROJECT_ID = :GS_PLIST_VALUES_PROJECT_ID
		end

		class GsPlistValuesAction < Action

			module Key
				PATH = :path
				PRINT = :print
			end

			def self.run(params)
				require "plist"
				require "terminal-table"

				begin
					path = File.expand_path(params[Key::PATH])
					plist = File.open(path) { |f| Plist.parse_xml(f) }

					lane_context[SharedValues::GS_PLIST_VALUES_GOOGLE_APP_ID] = plist['GOOGLE_APP_ID']
					lane_context[SharedValues::GS_PLIST_VALUES_BUNDLE_ID] = plist['BUNDLE_ID']
					lane_context[SharedValues::GS_PLIST_VALUES_PROJECT_ID] = plist['PROJECT_ID']
				rescue StandardError => e
					UI.error(e)
				end

				if params[Key::PRINT]
					table = Terminal::Table.new
					table.title = "Google Services Plist Values"
					table.rows = plist.map { |key, value| [key, value] }

					puts("")
					puts(table)
				end
				
				plist
			end

			#####################################################
			# @!group Documentation
			#####################################################

			def self.description
				'Read values from google services plist file'
			end

			def self.available_options
				[
					FastlaneCore::ConfigItem.new(
						key: Key::PATH,
						env_name: 'GS_PLIST_VALUES_PATH',
						description: 'Path to google services plist file'
					),
					FastlaneCore::ConfigItem.new(
						key: Key::PRINT,
						env_name: 'GS_PLIST_VALUES_PRINT',
						description: 'Print the values from the google services plist file?',
						type: Boolean,
						default_value: true
					)
				]
			end

			def self.output
				[
					['GS_PLIST_VALUES_GOOGLE_APP_ID', 'The GOOGLE_APP_ID from the google services file'],
					['GS_PLIST_VALUES_BUNDLE_ID', 'The BUNDLE_ID from the google services file'],
					['GS_PLIST_VALUES_PROJECT_ID', 'The PROJECT_ID from the google services file']
				]
			end

			def self.return_value
				'Ruby hash representation of the google services plist file'
			end

			def self.authors
				['UpBra']
			end

			def self.is_supported?(_)
				true
			end
		end
	end
end
