describe Fastlane::Actions::GoogleServicesAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The google_services plugin is working!")

      Fastlane::Actions::GoogleServicesAction.run(nil)
    end
  end
end
