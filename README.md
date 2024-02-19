# google_services plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-google_services)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-google_services`, add it to your project by running:

```bash
fastlane add_plugin google_services
```

## About google_services

Access values from google services json files.

## Example

```ruby
# Get values from google services plist
result = google_services_plist_values(
	path: 'path/to/GoogleServices-Info.plist'
)

# Read values directly from returned hash
client_id = result['CLIENT_ID']

# Access common values stored in lane_context
google_app_id = lane_context[SharedValues::GOOGLE_SERVICES_PLIST_VALUES_GOOGLE_APP_ID]
bundle_id = lane_context[SharedValues::GOOGLE_SERVICES_PLIST_VALUES_BUNDLE_ID]
project_id = lane_context[SharedValues::GOOGLE_SERVICES_PLIST_VALUES_PROJECT_ID]
```

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
