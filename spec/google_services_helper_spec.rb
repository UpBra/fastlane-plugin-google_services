describe Fastlane::Helper::GoogleServicesHelper do
	describe '#show_message' do
		it 'prints a message' do
			expect(Fastlane::UI).to receive(:message).with("Hello from the google_services plugin helper!")

			Fastlane::Helper::GoogleServicesHelper.show_message
		end
	end
end
