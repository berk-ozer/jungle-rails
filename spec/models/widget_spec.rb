require 'rails_helper'

describe '#id' do
  it 'should not exist for new records' do
    @widget = Widget.new
    expect(@widget.id).to be_nil
  end

  it 'should be auto-assigned by AR for saved records' do
    @widget = Widget.new
    # we use bang here b/c we want our spec to fail if save fails (due to validations)
    # we are not testing for successful save so we have to assume it will be successful
    @widget.save!

    expect(@widget.id).to be_present
  end
end