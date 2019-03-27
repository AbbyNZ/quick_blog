require 'rails_helper'

describe Post do
  describe 'validations' do
    subject(:post) { Post.new } #sets the subject of this describe block
    before { post.valid? } #runs a precondition for the test/s

    [:title, :body].each do |attribute|
      it "should validate presence of #{attribute}" do
        expect(post.errors[attribute].size).to be >= 1
        expect(post.errors.messages[attribute]).to include "can't be blank"
      end
    end
end

  describe '#content' do
    #create a double of the MarkdownService
    let(:markdown_service) { double('MarkdownService') }

    before do
      #We don't want to use the actual MarkdownService
      #since it's tested elsewhere!
      allow(MarkdownService).to receive(:new).and_return(markdown_service)
    end

    it 'should convert its body to markdown' do
      expect(markdown_service).to receive(:render).with('post body')
      Post.new(body: 'post body').content
    end
  end
end
