<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1350956694251" ID="ID_1706067230" MODIFIED="1350956702130" TEXT="REGEX">
<node CREATED="1350956703789" FOLDED="true" ID="ID_1944924178" MODIFIED="1350960872076" POSITION="right" TEXT="Metacharacters">
<node CREATED="1350956728984" ID="ID_1434073408" MODIFIED="1350960868953" TEXT="represents start of a line">
<node CREATED="1350956718718" ID="ID_543474681" MODIFIED="1350958139540" TEXT="^"/>
<node CREATED="1350956745420" FOLDED="true" ID="ID_922263246" MODIFIED="1350960870188" TEXT="e.g ^i think">
<node CREATED="1350956760170" ID="ID_1583636539" MODIFIED="1350956775770" TEXT="will match: &quot;i think so&quot;"/>
<node CREATED="1350956776221" ID="ID_1410743951" MODIFIED="1350956792937" TEXT="not match: &quot;think i not&quot;"/>
<node CREATED="1350956793237" ID="ID_988205064" MODIFIED="1350956805803" TEXT="not match: &quot;doing what i think&quot;"/>
</node>
</node>
<node CREATED="1350956834073" FOLDED="true" ID="ID_246416916" MODIFIED="1350960867983" TEXT="represents the end of a line">
<node CREATED="1350956824835" ID="ID_1174424470" MODIFIED="1350958145934" TEXT="$"/>
<node CREATED="1350956841145" FOLDED="true" ID="ID_1226226463" MODIFIED="1350958155319" TEXT="e.g. morning$">
<node CREATED="1350956868326" ID="ID_218816077" MODIFIED="1350956888732" TEXT="will match: &quot;I had something this morning&quot;"/>
<node CREATED="1350956889424" ID="ID_401121740" MODIFIED="1350956943630" TEXT="not match: &quot;good morning pakistan&quot;"/>
</node>
</node>
<node CREATED="1350957205580" FOLDED="true" ID="ID_759827457" MODIFIED="1350958270171" TEXT="list a set of characters we will accept at a given point in the match">
<node CREATED="1350957085865" FOLDED="true" ID="ID_78816803" MODIFIED="1350958266267" TEXT="Character Class:    []">
<node CREATED="1350957432985" FOLDED="true" ID="ID_1764443577" MODIFIED="1350958112405" TEXT="Ranges: can specify a range of characters">
<node CREATED="1350957476915" ID="ID_381764538" MODIFIED="1350957736875" TEXT="e.g. [a-z]">
<node CREATED="1350957510483" ID="ID_542581409" MODIFIED="1350957581671" TEXT="will match: Any alphabet that is lowercase"/>
</node>
<node CREATED="1350957742070" FOLDED="true" ID="ID_1631559246" MODIFIED="1350957777445" TEXT="e.g. [a-zA-Z]">
<node CREATED="1350957755706" ID="ID_912838668" MODIFIED="1350957775829" TEXT="will match: any alphabet whether lowercase or uppercase"/>
</node>
</node>
<node CREATED="1350957678120" FOLDED="true" ID="ID_644322147" MODIFIED="1350958115202" TEXT="^">
<node CREATED="1350957829404" ID="ID_299792227" MODIFIED="1350957927179" TEXT="if used at the beginning of character class then it indicates the matching characters should NOT be accepted at that point"/>
<node CREATED="1350957930488" ID="ID_245810757" MODIFIED="1350957981181" TEXT="e.g. [^?.]">
<node CREATED="1350957982251" ID="ID_1525454160" MODIFIED="1350958005356" TEXT="will match: &quot;Happy, Birthday!!!&quot;"/>
<node CREATED="1350958006544" ID="ID_1865376820" MODIFIED="1350958068706" TEXT="not match: any text containing a question mark or period"/>
</node>
</node>
</node>
<node CREATED="1350957155221" FOLDED="true" ID="ID_1526721925" MODIFIED="1350958171812" TEXT="e.g. [Bb][Uu][Ss][Hh]">
<node CREATED="1350957267933" ID="ID_202797744" MODIFIED="1350957292807" TEXT="will accept: &quot;George W Bush&quot;"/>
<node CREATED="1350957293344" ID="ID_1466532584" MODIFIED="1350957318228" TEXT="will accept: &quot;down by the bushes...&quot;"/>
</node>
</node>
<node CREATED="1350958270921" FOLDED="true" ID="ID_1445884378" MODIFIED="1350958490341" TEXT="refer to any character">
<node CREATED="1350958283620" ID="ID_1160885003" MODIFIED="1350958285370" TEXT="."/>
<node CREATED="1350958286696" FOLDED="true" ID="ID_74034277" MODIFIED="1350958458583" TEXT="e.g. 9.11">
<node CREATED="1350958305049" ID="ID_411670462" MODIFIED="1350958333605" TEXT="will match: 9/11"/>
<node CREATED="1350958305049" ID="ID_719278219" MODIFIED="1350958339326" TEXT="will match: 9911"/>
<node CREATED="1350958305049" ID="ID_1952282870" MODIFIED="1350958350389" TEXT="will match: 9s11"/>
<node CREATED="1350958305049" ID="ID_897248235" MODIFIED="1350958440391" TEXT="will match: 911"/>
<node CREATED="1350958305049" ID="ID_1757625764" MODIFIED="1350958454596" TEXT="will match: 9.11"/>
</node>
</node>
<node CREATED="1350958490906" FOLDED="true" ID="ID_180041136" MODIFIED="1350958660057" TEXT="OR logic operator">
<node CREATED="1350958509400" ID="ID_1973056251" MODIFIED="1350958514326" TEXT="|"/>
</node>
<node CREATED="1350958660625" FOLDED="true" ID="ID_1411733079" MODIFIED="1350960736153" TEXT="AND logic operator">
<node CREATED="1350958667880" ID="ID_1440829056" MODIFIED="1350958680834" TEXT="( )"/>
<node CREATED="1350960169932" FOLDED="true" ID="ID_1000783820" MODIFIED="1350960735210" TEXT="remember text matched by the subexpression enclosed">
<node CREATED="1350960240862" ID="ID_688082138" MODIFIED="1350960253680" TEXT="\1, \2, \3, ...."/>
<node CREATED="1350960333178" FOLDED="true" ID="ID_1245180795" MODIFIED="1350960462528" TEXT="e.g.    +( +[a-zA-Z]+)  +\1 + ">
<node CREATED="1350960374294" ID="ID_31990535" MODIFIED="1350960425050" TEXT="will match: blah blah blah"/>
<node CREATED="1350960429344" ID="ID_1804065205" MODIFIED="1350960451451" TEXT="will match: time for bed, night night twitter!"/>
</node>
</node>
</node>
<node CREATED="1350958703038" FOLDED="true" ID="ID_398243317" MODIFIED="1350958862639" TEXT="expression is optional (zero or one)">
<node CREATED="1350958722278" ID="ID_896740516" MODIFIED="1350958724336" TEXT="?"/>
<node CREATED="1350958739553" FOLDED="true" ID="ID_1494830591" MODIFIED="1350958829336" TEXT="e.g. George ([Ww]\.)? Bush">
<node CREATED="1350958780516" ID="ID_1747443043" MODIFIED="1350958794807" TEXT="will match: George Bush"/>
<node CREATED="1350958795055" ID="ID_1449918317" MODIFIED="1350958807279" TEXT="will match: George W. Bush"/>
<node CREATED="1350958808000" ID="ID_1083616097" MODIFIED="1350958817098" TEXT="not match: George W Bush"/>
</node>
</node>
<node CREATED="1350959025599" FOLDED="true" ID="ID_1016192597" MODIFIED="1350960864556" TEXT="repetition of expression that precedes the metacharacater">
<node CREATED="1350959031941" FOLDED="true" ID="ID_1810023055" MODIFIED="1350959067745" TEXT="One or more times">
<node CREATED="1350959054530" ID="ID_1783814518" MODIFIED="1350959056741" TEXT="+"/>
</node>
<node CREATED="1350959047976" FOLDED="true" ID="ID_1352548033" MODIFIED="1350960863612" TEXT="Zero or more times">
<node CREATED="1350959060489" ID="ID_778320448" MODIFIED="1350959061524" TEXT="*"/>
<node CREATED="1350960742121" ID="ID_1317662544" MODIFIED="1350960826400" TEXT="&apos; * &apos; is greedy so it tries to get the longest possible match, this greediness can be turned of by &apos; ? &apos;"/>
</node>
</node>
<node CREATED="1350959587027" FOLDED="true" ID="ID_755818480" MODIFIED="1350960167448" TEXT="Minimum and Maximum number of matches of an expression">
<node CREATED="1350959622269" FOLDED="true" ID="ID_1310491544" MODIFIED="1350960131975" TEXT="Interval Quantifiers:     {}">
<node CREATED="1350960035186" ID="ID_118265602" MODIFIED="1350960072436" TEXT="m,n at least m but not more than n times"/>
<node CREATED="1350960075695" ID="ID_7455301" MODIFIED="1350960098460" TEXT="m exactly m matches"/>
<node CREATED="1350960102268" ID="ID_601586476" MODIFIED="1350960109093" TEXT="m, atleast m matches"/>
</node>
</node>
</node>
<node CREATED="1350956714451" FOLDED="true" ID="ID_1985623931" MODIFIED="1350958938547" POSITION="left" TEXT="Literals">
<node CREATED="1350956919689" ID="ID_135217848" MODIFIED="1350956927316" TEXT="The literals are case sensetive"/>
<node CREATED="1350958834992" FOLDED="true" ID="ID_107586417" MODIFIED="1350958933205" TEXT="escape metacharacters so they are treated literals">
<node CREATED="1350958843255" ID="ID_1806280022" MODIFIED="1350958845157" TEXT="\"/>
</node>
</node>
</node>
</map>
