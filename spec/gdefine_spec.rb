require_relative '../lib/gdefine'

HTML = <<DEFINITION
<table class="ts"><tbody><tr>
<td valign="top" width="80px">Noun:</td><td valign="top">
<table class="ts"><tbody><tr><td>An intense feeling of deep affection:  "their <b>love for</b> their country".</td></tr></tbody></table></td></tr><tr height="1px" bgcolor="#ddd"><td height="1px" colspan="2"></td></tr><tr><td valign="top" width="80px">Verb:</td><td valign="top"><table class="ts"><tbody><tr><td>Feel a deep romantic or sexual attachment to (someone):  "do you love me?".</td></tr></tbody></table></td></tr><tr height="1px" bgcolor="#ddd"><td height="1px" colspan="2"></td></tr><tr><td valign="top" width="80px">Synonyms:</td><td valign="top"><div><span><i>noun</i>.&nbsp;&nbsp;</span>affection - fondness - darling - passion</div><div><span><i>verb</i>.&nbsp;&nbsp;</span>like - be fond of - fancy - adore</div></td></tr></tbody></table>
DEFINITION

describe Gdefine do

  describe 'parse' do
    it 'should correctly return key value definitions' do
      parsed = Gdefine.parse(HTML)
      parsed.should have(3).items 
      parsed.first.should be_a(Hash)
    end
  end

  describe 'format' do
    it 'should return string of definitions' do
      entries = [
        { type: 'Noun:', definition: 'an intense feeling of deep affection' },
        { type: 'Verb:', definition: 'feel a deep romantic or sexual attachment to' }
      ]
      Gdefine.format(entries).should be_a(String)
    end
  end

end
