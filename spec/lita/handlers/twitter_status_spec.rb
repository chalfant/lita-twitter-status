require "spec_helper"

describe Lita::Handlers::TwitterStatus, lita_handler: true do
  it { is_expected.to route_command("twitter foobar").to(:status) }
  it { is_expected.to route_command("twitter foobar 1").to(:status) }

  describe '#status' do
    let(:tweet) { double(text: 'foo') }

    context 'with only username' do
      it 'calls twitter with the correct username and count' do
        expect(subject).to receive(:get_tweets).with('foobar', "1").and_return([tweet])
        send_command("twitter foobar")
      end
    end

    context 'with username and count' do
      it 'calls twitter with the correct username and count' do
        expect(subject).to receive(:get_tweets).with('foobar', "2").and_return([tweet])
        send_command("twitter foobar 2")
      end
    end
  end
end
