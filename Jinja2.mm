<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1336924040822" ID="ID_425195013" LINK="pythonzzz.mm" MODIFIED="1348774407596" TEXT="Jinja">
<node CREATED="1336924059053" FOLDED="true" MODIFIED="1348157878971" POSITION="right" TEXT="Example">
<node CREATED="1336924060742" MODIFIED="1336924063199" TEXT="&lt;!DOCTYPE HTML PUBLIC &quot;-//W3C//DTD HTML 4.01//EN&quot;&gt;&#xa;&lt;html lang=&quot;en&quot;&gt;&#xa;&lt;head&gt;&#xa;    &lt;title&gt;My Webpage&lt;/title&gt;&#xa;&lt;/head&gt;&#xa;&lt;body&gt;&#xa;    &lt;ul id=&quot;navigation&quot;&gt;&#xa;    {% for item in navigation %}&#xa;        &lt;li&gt;&lt;a href=&quot;{{ item.href }}&quot;&gt;{{ item.caption }}&lt;/a&gt;&lt;/li&gt;&#xa;    {% endfor %}&#xa;    &lt;/ul&gt;&#xa;&#xa;    &lt;h1&gt;My Webpage&lt;/h1&gt;&#xa;    {{ a_variable }}&#xa;&lt;/body&gt;&#xa;&lt;/html&gt;"/>
</node>
<node CREATED="1336924070405" FOLDED="true" MODIFIED="1338323268559" POSITION="right" TEXT="Variables">
<node CREATED="1336924076627" MODIFIED="1336924164941" TEXT="{{ foo.bar }}&#xa;{{ foo[&apos;bar&apos;] }}&#xa;&#xa;Both of the above do the same thing. It&#x2019;s important to know that the curly braces are not part of the variable but the print statement. If you access variables inside tags don&#x2019;t put the braces around.&#xa;&#xa;e.g. &lt;a href=foo.bar&gt;&#xa;&#xa;If a variable or attribute does not exist you will get back an undefined value. What you can do with that kind of value depends on the application configuration, the default behavior is that it evaluates to an empty string if printed and that you can iterate over it, but every other operation fails."/>
</node>
<node CREATED="1336924185736" FOLDED="true" MODIFIED="1337718486823" POSITION="right" TEXT="Implementation">
<node CREATED="1336924193559" MODIFIED="1336924225462" TEXT="For convenience sake foo.bar in Jinja2 does the following things on the Python layer:&#xa;&#xa;- check if there is an attribute called bar on foo.&#xa;- if there is not, check if there is an item &apos;bar&apos; in foo.&#xa;- if there is not, return an undefined object.&#xa;&#xa;foo[&apos;bar&apos;] on the other hand works mostly the same with the a small difference in the order:&#xa;&#xa;- check if there is an item &apos;bar&apos; in foo.&#xa;- if there is not, check if there is an attribute called bar on foo.&#xa;- if there is not, return an undefined object.&#xa;&#xa;This is important if an object has an item or attribute with the same name. Additionally there is the attr() filter that just looks up attributes."/>
</node>
<node CREATED="1336924296660" FOLDED="true" MODIFIED="1337229652005" POSITION="right" TEXT="Filters">
<node CREATED="1336924304699" MODIFIED="1336924313028" TEXT="Variables can be modified by filters. Filters are separated from the variable by a pipe symbol (|) and may have optional arguments in parentheses. Multiple filters can be chained. The output of one filter is applied to the next.&#xa;&#xa;{{ name|striptags|title }} for example will remove all HTML Tags from the name and title-cases it. Filters that accept arguments have parentheses around the arguments, like a function call. This example will join a list by commas: {{ list|join(&apos;, &apos;) }}.&#xa;&#xa;The List of Builtin Filters below describes all the builtin filters.&#xa;&#xa;"/>
</node>
<node CREATED="1336926039951" FOLDED="true" MODIFIED="1337229652973" POSITION="right" TEXT="Tests">
<node CREATED="1336926041215" MODIFIED="1336926047746" TEXT="To test a variable or expression you add is plus the name of the test after the variable. For example to find out if a variable is defined you can do name is defined which will then return true or false depending on if name is defined.&#xa;&#xa;Tests can accept arguments too. If the test only takes one argument you can leave out the parentheses to group them. For example the following two expressions do the same:&#xa;&#xa;{% if loop.index is divisibleby 3 %}&#xa;{% if loop.index is divisibleby(3) %}&#xa;&#xa;The List of Builtin Tests below describes all the builtin tests."/>
</node>
<node CREATED="1336926066798" FOLDED="true" MODIFIED="1336926145012" POSITION="right" TEXT="Comments">
<node CREATED="1336926075541" MODIFIED="1336926141038" TEXT="Syntax by default is set to {# ... #}&#xa;&#xa;{# note: disabled template because we no longer use this&#xa;    {% for user in users %}&#xa;        ...&#xa;    {% endfor %}&#xa;#}"/>
</node>
<node CREATED="1336926898890" FOLDED="true" MODIFIED="1338702265046" POSITION="right" TEXT="Whitespace Control">
<node CREATED="1337093137693" MODIFIED="1337093146055" TEXT="In the default configuration whitespace is not further modified by the template engine, so each whitespace (spaces, tabs, newlines etc.) is returned unchanged. If the application configures Jinja to trim_blocks the first newline after a a template tag is removed automatically (like in PHP).&#xa;&#xa;But you can also strip whitespace in templates by hand. If you put an minus sign (-) to the start or end of an block (for example a for tag), a comment or variable expression you can remove the whitespaces after or before that block:&#xa;&#xa;{% for item in seq -%}&#xa;    {{ item }}&#xa;{%- endfor %}&#xa;&#xa;This will yield all elements without whitespace between them. If seq was a list of numbers from 1 to 9 the output would be 123456789.&#xa;&#xa;If Line Statements are enabled they strip leading whitespace automatically up to the beginning of the line."/>
<node CREATED="1337093020570" MODIFIED="1337093043590" TEXT="You must not use a whitespace between the tag and the minus sign.&#xa;&#xa;valid: {%- if foo -%}...{% endif %}&#xa;&#xa;invalid: {% - if foo - %}...{% endif %}"/>
</node>
<node CREATED="1337093156379" FOLDED="true" MODIFIED="1337227560624" POSITION="right" TEXT="Escaping">
<node CREATED="1337093172219" MODIFIED="1337093179008" TEXT="It is sometimes desirable or even necessary to have Jinja ignore parts it would otherwise handle as variables or blocks. For example if the default syntax is used and you want to use {{ as raw string in the template and not start a variable you have to use a trick.&#xa;&#xa;The easiest way is to output the variable delimiter ({{) by using a variable expression:&#xa;&#xa;{{ &apos;{{&apos; }}&#xa;&#xa;For bigger sections it makes sense to mark a block raw. For example to put Jinja syntax as example into a template you can use this snippet:&#xa;&#xa;{% raw %}&#xa;    &lt;ul&gt;&#xa;    {% for item in seq %}&#xa;        &lt;li&gt;{{ item }}&lt;/li&gt;&#xa;    {% endfor %}&#xa;    &lt;/ul&gt;&#xa;{% endraw %}"/>
</node>
<node CREATED="1337093183283" FOLDED="true" MODIFIED="1337097959985" POSITION="right" TEXT="Line Statements">
<node CREATED="1337093262975" MODIFIED="1337093272180" TEXT="If line statements are enabled by the application it&#x2019;s possible to mark a line as a statement. For example if the line statement prefix is configured to # the following two examples are equivalent:&#xa;&#xa;&lt;ul&gt;&#xa;# for item in seq&#xa;    &lt;li&gt;{{ item }}&lt;/li&gt;&#xa;# endfor&#xa;&lt;/ul&gt;&#xa;&#xa;&lt;ul&gt;&#xa;{% for item in seq %}&#xa;    &lt;li&gt;{{ item }}&lt;/li&gt;&#xa;{% endfor %}&#xa;&lt;/ul&gt;&#xa;&#xa;The line statement prefix can appear anywhere on the line as long as no text precedes it. For better readability statements that start a block (such as for, if, elif etc.) may end with a colon:&#xa;&#xa;# for item in seq:&#xa;    ...&#xa;# endfor"/>
<node CREATED="1337093317084" MODIFIED="1337093320586" TEXT="Line statements can span multiple lines if there are open parentheses, braces or brackets:&#xa;&#xa;&lt;ul&gt;&#xa;# for href, caption in [(&apos;index.html&apos;, &apos;Index&apos;),&#xa;                        (&apos;about.html&apos;, &apos;About&apos;)]:&#xa;    &lt;li&gt;&lt;a href=&quot;{{ href }}&quot;&gt;{{ caption }}&lt;/a&gt;&lt;/li&gt;&#xa;# endfor&#xa;&lt;/ul&gt;"/>
</node>
<node CREATED="1337093327556" FOLDED="true" ID="ID_1891926586" MODIFIED="1339629822716" POSITION="right" TEXT="Template Inheritance">
<node CREATED="1337093375226" FOLDED="true" MODIFIED="1337229659957" TEXT="Block tags: A child may override this part of template">
<node CREATED="1337093363995" MODIFIED="1337093373696" TEXT="This template, which we&#x2019;ll call base.html, defines a simple HTML skeleton document that you might use for a simple two-column page. It&#x2019;s the job of &#x201c;child&#x201d; templates to fill the empty blocks with content:&#xa;&#xa;&lt;!DOCTYPE HTML PUBLIC &quot;-//W3C//DTD HTML 4.01//EN&quot;&gt;&#xa;&lt;html lang=&quot;en&quot;&gt;&#xa;&lt;html xmlns=&quot;http://www.w3.org/1999/xhtml&quot;&gt;&#xa;&lt;head&gt;&#xa;    {% block head %}&#xa;    &lt;link rel=&quot;stylesheet&quot; href=&quot;style.css&quot; /&gt;&#xa;    &lt;title&gt;{% block title %}{% endblock %} - My Webpage&lt;/title&gt;&#xa;    {% endblock %}&#xa;&lt;/head&gt;&#xa;&lt;body&gt;&#xa;    &lt;div id=&quot;content&quot;&gt;{% block content %}{% endblock %}&lt;/div&gt;&#xa;    &lt;div id=&quot;footer&quot;&gt;&#xa;        {% block footer %}&#xa;        &amp;copy; Copyright 2008 by &lt;a href=&quot;http://domain.invalid/&quot;&gt;you&lt;/a&gt;.&#xa;        {% endblock %}&#xa;    &lt;/div&gt;&#xa;&lt;/body&gt;&#xa;&#xa;In this example, the {% block %} tags define four blocks that child templates can fill in. All the block tag does is to tell the template engine that a child template may override those portions of the template."/>
</node>
<node CREATED="1337093440775" FOLDED="true" MODIFIED="1337229675436" TEXT="Child template: extends base template">
<node CREATED="1337093466902" MODIFIED="1337093476587" TEXT="A child template might look like this:&#xa;&#xa;{% extends &quot;base.html&quot; %}&#xa;{% block title %}Index{% endblock %}&#xa;{% block head %}&#xa;    {{ super() }}&#xa;    &lt;style type=&quot;text/css&quot;&gt;&#xa;        .important { color: #336699; }&#xa;    &lt;/style&gt;&#xa;{% endblock %}&#xa;{% block content %}&#xa;    &lt;h1&gt;Index&lt;/h1&gt;&#xa;    &lt;p class=&quot;important&quot;&gt;&#xa;      Welcome on my awesome homepage.&#xa;    &lt;/p&gt;&#xa;{% endblock %}&#xa;&#xa;The {% extends %} tag is the key here. It tells the template engine that this template &#x201c;extends&#x201d; another template. When the template system evaluates this template, first it locates the parent. The extends tag should be the first tag in the template. Everything before it is printed out normally and may cause confusion. For details about this behavior and how to take advantage of it, see Null-Master Fallback.&#xa;&#xa;The filename of the template depends on the template loader. For example the FileSystemLoader allows you to access other templates by giving the filename. You can access templates in subdirectories with an slash:&#xa;&#xa;{% extends &quot;layout/default.html&quot; %}&#xa;But this behavior can depend on the application embedding Jinja. Note that since the child template doesn&#x2019;t define the footer block, the value from the parent template is used instead.&#xa;&#xa;You can&#x2019;t define multiple {% block %} tags with the same name in the same template. This limitation exists because a block tag works in &#x201c;both&#x201d; directions. That is, a block tag doesn&#x2019;t just provide a hole to fill - it also defines the content that fills the hole in the parent. If there were two similarly-named {% block %} tags in a template, that template&#x2019;s parent wouldn&#x2019;t know which one of the blocks&#x2019; content to use.&#xa;&#xa;If you want to print a block multiple times you can however use the special self variable and call the block with that name:&#xa;&#xa;&lt;title&gt;{% block title %}{% endblock %}&lt;/title&gt;&#xa;&lt;h1&gt;{{ self.title() }}&lt;/h1&gt;&#xa;{% block body %}{% endblock %}"/>
</node>
<node CREATED="1337093751050" FOLDED="true" MODIFIED="1339629822269" TEXT="Super: gives back results of parent block">
<node CREATED="1337093763409" MODIFIED="1337093766407" TEXT="It&#x2019;s possible to render the contents of the parent block by calling super. This gives back the results of the parent block:&#xa;&#xa;{% block sidebar %}&#xa;    &lt;h3&gt;Table Of Contents&lt;/h3&gt;&#xa;    ...&#xa;    {{ super() }}&#xa;{% endblock %}"/>
</node>
<node CREATED="1337093781169" FOLDED="true" MODIFIED="1337093797790" TEXT="Named end-block tags: for better readability">
<node CREATED="1337093792096" MODIFIED="1337093796493" TEXT="Jinja2 allows you to put the name of the block after the end tag for better readability:&#xa;&#xa;{% block sidebar %}&#xa;    {% block inner_sidebar %}&#xa;        ...&#xa;    {% endblock inner_sidebar %}&#xa;{% endblock sidebar %}&#xa;&#xa;However the name after the endblock word must match the block name."/>
</node>
<node CREATED="1337093891116" FOLDED="true" MODIFIED="1337093984880" TEXT="Block Nesting and Scope">
<node CREATED="1337093964785" MODIFIED="1337093983397" TEXT="Blocks can be nested for more complex layouts. However per default blocks may not access variables from outer scopes:&#xa;&#xa;{% for item in seq %}&#xa;    &lt;li&gt;{% block loop_item %}{{ item }}{% endblock %}&lt;/li&gt;&#xa;{% endfor %}&#xa;&#xa;This example would output empty &lt;li&gt; items because item is unavailable inside the block. The reason for this is that if the block is replaced by a child template a variable would appear that was not defined in the block or passed to the context.&#xa;&#xa;Starting with Jinja 2.2 you can explicitly specify that variables are available in a block by setting the block to &#x201c;scoped&#x201d; by adding the scoped modifier to a block declaration:&#xa;&#xa;{% for item in seq %}&#xa;    &lt;li&gt;{% block loop_item scoped %}{{ item }}{% endblock %}&lt;/li&gt;&#xa;{% endfor %}&#xa;&#xa;When overriding a block the scoped modifier does not have to be provided."/>
</node>
</node>
<node CREATED="1337095037482" FOLDED="true" MODIFIED="1338327470468" POSITION="right" TEXT="IF / FOR">
<node CREATED="1337095054713" FOLDED="true" MODIFIED="1338327470164" TEXT="FOR">
<node CREATED="1337095057361" MODIFIED="1337095074854" TEXT="Loop over each item in a sequence. For example, to display a list of users provided in a variable called users:&#xa;&#xa;&lt;h1&gt;Members&lt;/h1&gt;&#xa;&lt;ul&gt;&#xa;{% for user in users %}&#xa;  &lt;li&gt;{{ user.username|e }}&lt;/li&gt;&#xa;{% endfor %}&#xa;&lt;/ul&gt;"/>
<node CREATED="1337095085344" MODIFIED="1337095228335" TEXT="Inside of a for loop block you can access some special variables:&#xa;&#xa;Variable&#x9;&#x9;Description&#xa;loop.index&#x9;      The current iteration of the loop. (1 indexed)&#xa;loop.index0&#x9;    The current iteration of the loop. (0 indexed)&#xa;loop.revindex&#x9;  The number of iterations from the end of the loop (1 indexed)&#xa;loop.revindex0&#x9;The number of iterations from the end of the loop (0 indexed)&#xa;loop.first&#x9;&#x9;True if first iteration.&#xa;loop.last&#x9;&#x9; True if last iteration.&#xa;loop.length&#x9;      The number of items in the sequence.&#xa;loop.cycle&#x9;        A helper function to cycle between a list of sequences. See the explanation below."/>
<node CREATED="1337095252416" MODIFIED="1337095269773" TEXT="Within a for-loop, it&#x2019;s possible to cycle among a list of strings/variables each time through the loop by using the special loop.cycle helper:&#xa;&#xa;{% for row in rows %}&#xa;    &lt;li class=&quot;{{ loop.cycle(&apos;odd&apos;, &apos;even&apos;) }}&quot;&gt;{{ row }}&lt;/li&gt;&#xa;{% endfor %}"/>
</node>
<node CREATED="1337095348788" FOLDED="true" MODIFIED="1338324660688" TEXT="IF">
<node CREATED="1337095375907" MODIFIED="1337095378801" TEXT="The if statement in Jinja is comparable with the if statements of Python. In the simplest form you can use it to test if a variable is defined, not empty or not false:&#xa;&#xa;{% if users %}&#xa;&lt;ul&gt;&#xa;{% for user in users %}&#xa;    &lt;li&gt;{{ user.username|e }}&lt;/li&gt;&#xa;{% endfor %}&#xa;&lt;/ul&gt;&#xa;{% endif %}"/>
<node CREATED="1337095388306" MODIFIED="1337095394016" TEXT="For multiple branches elif and else can be used like in Python. You can use more complex Expressions there too:&#xa;&#xa;{% if kenny.sick %}&#xa;    Kenny is sick.&#xa;{% elif kenny.dead %}&#xa;    You killed Kenny!  You bastard!!!&#xa;{% else %}&#xa;    Kenny looks okay --- so far&#xa;{% endif %}&#xa;&#xa;If can also be used as inline expression and for loop filtering."/>
</node>
<node CREATED="1337098126804" FOLDED="true" MODIFIED="1338324604252" TEXT="Inline IF">
<node CREATED="1337098128956" MODIFIED="1337098137281" TEXT="It is also possible to use inline if expressions. These are useful in some situations. For example you can use this to extend from one template if a variable is defined, otherwise from the default layout template:&#xa;&#xa;{% extends layout_template if layout_template is defined else &apos;master.html&apos; %}&#xa;&#xa;The general syntax is &lt;do something&gt; if &lt;something is true&gt; else &lt;do something else&gt;.&#xa;&#xa;The else part is optional. If not provided the else block implicitly evaluates into an undefined object:&#xa;&#xa;{{ &apos;[%s]&apos; % page.title if page.title }}"/>
</node>
</node>
<node CREATED="1337095455944" FOLDED="true" MODIFIED="1337096402444" POSITION="right" TEXT="Macros (functions)">
<node CREATED="1337095460439" MODIFIED="1337095491156" TEXT="Macros are comparable with functions in regular programming languages. They are useful to put often used idioms into reusable functions to not repeat yourself.&#xa;&#xa;Here a small example of a macro that renders a form element:&#xa;&#xa;{% macro input(name, value=&apos;&apos;, type=&apos;text&apos;, size=20) -%}&#xa;    &lt;input type=&quot;{{ type }}&quot; name=&quot;{{ name }}&quot; value=&quot;{{&#xa;        value|e }}&quot; size=&quot;{{ size }}&quot;&gt;&#xa;{%- endmacro %}&#xa;&#xa;The macro can then be called like a function in the namespace:&#xa;&#xa;&lt;p&gt;{{ input(&apos;username&apos;) }}&lt;/p&gt;&#xa;&lt;p&gt;{{ input(&apos;password&apos;, type=&apos;password&apos;) }}&lt;/p&gt;&#xa;&#xa;If the macro was defined in a different template you have to import it first.&#xa;&#xa;"/>
<node CREATED="1337095559185" FOLDED="true" MODIFIED="1337095612722" TEXT="Special variables for macros">
<node CREATED="1337095566123" MODIFIED="1337095574312" TEXT="varargs&#xa;If more positional arguments are passed to the macro than accepted by the macro they end up in the special varargs variable as list of values.&#xa;&#xa;kwargs&#xa;Like varargs but for keyword arguments. All unconsumed keyword arguments are stored in this special variable.&#xa;&#xa;caller&#xa;If the macro was called from a call tag the caller is stored in this variable as macro which can be called."/>
</node>
<node CREATED="1337095613265" FOLDED="true" MODIFIED="1337095633752" TEXT="Attributes for macros">
<node CREATED="1337095616977" MODIFIED="1337095632174" TEXT="Macros also expose some of their internal details. The following attributes are available on a macro object:&#xa;&#xa;name&#xa;The name of the macro. {{ input.name }} will print input.&#xa;arguments&#xa;A tuple of the names of arguments the macro accepts.&#xa;&#xa;defaults&#xa;A tuple of default values.&#xa;&#xa;catch_kwargs&#xa;This is true if the macro accepts extra keyword arguments (ie: accesses the special kwargs variable).&#xa;&#xa;catch_varargs&#xa;This is true if the macro accepts extra positional arguments (ie: accesses the special varargs variable).&#xa;&#xa;caller&#xa;This is true if the macro accesses the special caller variable and may be called from a call tag."/>
</node>
</node>
<node CREATED="1337096279060" FOLDED="true" MODIFIED="1338702217640" POSITION="right" TEXT="Filters">
<node CREATED="1337096280524" MODIFIED="1337096283513" TEXT="Filter sections allow you to apply regular Jinja2 filters on a block of template data. Just wrap the code in the special filter section:&#xa;&#xa;{% filter upper %}&#xa;    This text becomes uppercase&#xa;{% endfilter %}"/>
</node>
<node CREATED="1337096396254" FOLDED="true" MODIFIED="1338702216008" POSITION="right" TEXT="Assignments">
<node CREATED="1337096398295" MODIFIED="1337096400732" TEXT="Inside code blocks you can also assign values to variables. Assignments at top level (outside of blocks, macros or loops) are exported from the template like top level macros and can be imported by other templates.&#xa;&#xa;Assignments use the set tag and can have multiple targets:&#xa;&#xa;{% set navigation = [(&apos;index.html&apos;, &apos;Index&apos;), (&apos;about.html&apos;, &apos;About&apos;)] %}&#xa;{% set key, value = call_something() %}"/>
</node>
<node CREATED="1337097933660" FOLDED="true" MODIFIED="1337098237736" POSITION="right" TEXT="Include / Import">
<node CREATED="1337096460612" FOLDED="true" MODIFIED="1337096468414" TEXT="Include">
<node CREATED="1337096462132" MODIFIED="1337096467001" TEXT="The include statement is useful to include a template and return the rendered contents of that file into the current namespace:&#xa;&#xa;{% include &apos;header.html&apos; %}&#xa;    Body&#xa;{% include &apos;footer.html&apos; %}&#xa;Included templates have access to the variables of the active context by default. For more details about context behavior of imports and includes see Import Context Behavior.&#xa;&#xa;From Jinja 2.2 onwards you can mark an include with ignore missing in which case Jinja will ignore the statement if the template to be ignored does not exist. When combined with with or without context it has to be placed before the context visibility statement. Here some valid examples:&#xa;&#xa;{% include &quot;sidebar.html&quot; ignore missing %}&#xa;{% include &quot;sidebar.html&quot; ignore missing with context %}&#xa;{% include &quot;sidebar.html&quot; ignore missing without context %}"/>
</node>
<node CREATED="1337096928671" FOLDED="true" MODIFIED="1337097945337" TEXT="Import">
<node CREATED="1337096930304" MODIFIED="1337096940885" TEXT="Jinja2 supports putting often used code into macros. These macros can go into different templates and get imported from there. This works similar to the import statements in Python. It&#x2019;s important to know that imports are cached and imported templates don&#x2019;t have access to the current template variables, just the globals by defualt. For more details about context behavior of imports and includes see Import Context Behavior.&#xa;&#xa;There are two ways to import templates. You can import the complete template into a variable or request specific macros / exported variables from it.&#xa;&#xa;Imagine we have a helper module that renders forms (called forms.html):&#xa;&#xa;{% macro input(name, value=&apos;&apos;, type=&apos;text&apos;) -%}&#xa;    &lt;input type=&quot;{{ type }}&quot; value=&quot;{{ value|e }}&quot; name=&quot;{{ name }}&quot;&gt;&#xa;{%- endmacro %}&#xa;&#xa;{%- macro textarea(name, value=&apos;&apos;, rows=10, cols=40) -%}&#xa;    &lt;textarea name=&quot;{{ name }}&quot; rows=&quot;{{ rows }}&quot; cols=&quot;{{ cols&#xa;        }}&quot;&gt;{{ value|e }}&lt;/textarea&gt;&#xa;{%- endmacro %}&#xa;&#xa;The easiest and most flexible is importing the whole module into a variable. That way you can access the attributes:&#xa;&#xa;{% import &apos;forms.html&apos; as forms %}&#xa;&lt;dl&gt;&#xa;    &lt;dt&gt;Username&lt;/dt&gt;&#xa;    &lt;dd&gt;{{ forms.input(&apos;username&apos;) }}&lt;/dd&gt;&#xa;    &lt;dt&gt;Password&lt;/dt&gt;&#xa;    &lt;dd&gt;{{ forms.input(&apos;password&apos;, type=&apos;password&apos;) }}&lt;/dd&gt;&#xa;&lt;/dl&gt;&#xa;&lt;p&gt;{{ forms.textarea(&apos;comment&apos;) }}&lt;/p&gt;"/>
<node CREATED="1337096980101" MODIFIED="1337097922627" TEXT="Alternatively you can import names from the template into the current namespace:&#xa;&#xa;{% from &apos;forms.html&apos; import input as input_field, textarea %}&#xa;&lt;dl&gt;&#xa;    &lt;dt&gt;Username&lt;/dt&gt;&#xa;    &lt;dd&gt;{{ input_field(&apos;username&apos;) }}&lt;/dd&gt;&#xa;    &lt;dt&gt;Password&lt;/dt&gt;&#xa;    &lt;dd&gt;{{ input_field(&apos;password&apos;, type=&apos;password&apos;) }}&lt;/dd&gt;&#xa;&lt;/dl&gt;&#xa;&lt;p&gt;{{ textarea(&apos;comment&apos;) }}&lt;/p&gt;&#xa;&#xa;Macros and variables starting with one or more underscores are private and cannot be imported."/>
</node>
<node CREATED="1337097904115" FOLDED="true" MODIFIED="1337097915565" TEXT="Import Context Behaviour">
<node CREATED="1337097911605" MODIFIED="1337097914466" TEXT="Per default included templates are passed the current context and imported templates not. The reason for this is that imports unlike includes are cached as imports are often used just as a module that holds macros.&#xa;&#xa;This however can be changed of course explicitly. By adding with context or without context to the import/include directive the current context can be passed to the template and caching is disabled automatically.&#xa;&#xa;Here two examples:&#xa;&#xa;{% from &apos;forms.html&apos; import input with context %}&#xa;{% include &apos;header.html&apos; without context %}"/>
</node>
</node>
<node CREATED="1337098185385" FOLDED="true" MODIFIED="1337227564272" POSITION="right" TEXT="Example printing a list of links">
<node CREATED="1337098190616" MODIFIED="1337098193903" TEXT="[&#x2018;list&#x2019;, &#x2018;of&#x2019;, &#x2018;objects&#x2019;]:&#xa;Everything between two brackets is a list. Lists are useful to store sequential data in or to iterate over them. For example you can easily create a list of links using lists and tuples with a for loop:&#xa;&#xa;&lt;ul&gt;&#xa;{% for href, caption in [(&apos;index.html&apos;, &apos;Index&apos;), (&apos;about.html&apos;, &apos;About&apos;),&#xa;                         (&apos;downloads.html&apos;, &apos;Downloads&apos;)] %}&#xa;    &lt;li&gt;&lt;a href=&quot;{{ href }}&quot;&gt;{{ caption }}&lt;/a&gt;&lt;/li&gt;&#xa;{% endfor %}&#xa;&lt;/ul&gt;"/>
</node>
<node CREATED="1337098238262" FOLDED="true" MODIFIED="1337227566761" POSITION="right" TEXT="Built-in Filters">
<node CREATED="1337098249742" FOLDED="true" MODIFIED="1337098285957" TEXT="abs(number)">
<node CREATED="1337098259070" MODIFIED="1337098259642" TEXT="Return the absolute value of the argument.  "/>
</node>
<node CREATED="1337098272836" FOLDED="true" MODIFIED="1337098285741" TEXT="attr(obj, name)">
<node CREATED="1337098280845" MODIFIED="1337098284522" TEXT="Get an attribute of an object. foo|attr(&quot;bar&quot;) works like foo[&quot;bar&quot;] just that always an attribute is returned and items are not looked up.&#xa;&#xa;See Notes on subscriptions for more details."/>
</node>
<node CREATED="1337098293116" FOLDED="true" MODIFIED="1337098350330" TEXT="batch(value, linecount, fill_with=None)">
<node CREATED="1337098300436" MODIFIED="1337098304545" TEXT="A filter that batches items. It works pretty much like slice just the other way round. It returns a list of lists with the given number of items. If you provide a second parameter this is used to fill missing items. See this example:&#xa;&#xa;&lt;table&gt;&#xa;{%- for row in items|batch(3, &apos;&amp;nbsp;&apos;) %}&#xa;  &lt;tr&gt;&#xa;  {%- for column in row %}&#xa;    &lt;td&gt;{{ column }}&lt;/td&gt;&#xa;  {%- endfor %}&#xa;  &lt;/tr&gt;&#xa;{%- endfor %}&#xa;&lt;/table&gt;"/>
</node>
<node CREATED="1337098357689" FOLDED="true" MODIFIED="1337098372465" TEXT="capitalize(s)">
<node CREATED="1337098361985" MODIFIED="1337098363190" TEXT="Capitalize a value. The first character will be uppercase, all others lowercase.  "/>
</node>
<node CREATED="1337098373105" FOLDED="true" MODIFIED="1337098378721" TEXT="center(value, width=80)">
<node CREATED="1337098377712" MODIFIED="1337098378085" TEXT="Centers the value in a field of a given width.  "/>
</node>
<node CREATED="1337098385336" FOLDED="true" MODIFIED="1337098425791" TEXT="default(value, default_value=u&apos;&apos;, boolean=False)">
<node CREATED="1337098397960" MODIFIED="1337098415349" TEXT="If the value is undefined it will return the passed default value, otherwise the value of the variable:&#xa;&#xa;{{ my_variable|default(&apos;my_variable is not defined&apos;) }}&#xa;This will output the value of my_variable if the variable was defined, otherwise &apos;my_variable is not defined&apos;. If you want to use default with variables that evaluate to false you have to set the second parameter to true:&#xa;&#xa;{{ &apos;&apos;|default(&apos;the string was empty&apos;, true) }}&#xa;&#xa;Aliases :&#x9;d"/>
</node>
<node CREATED="1337098436398" FOLDED="true" MODIFIED="1337098508673" TEXT="dictsort(value, case_sensitive=False, by=&apos;key&apos;)">
<node CREATED="1337098444885" MODIFIED="1337098454051" TEXT="Sort a dict and yield (key, value) pairs. Because python dicts are unsorted you may want to use this function to order them by either key or value:&#xa;&#xa;{% for item in mydict|dictsort %}&#xa;    sort the dict by key, case insensitive&#xa;&#xa;{% for item in mydict|dicsort(true) %}&#xa;    sort the dict by key, case sensitive&#xa;&#xa;{% for item in mydict|dictsort(false, &apos;value&apos;) %}&#xa;    sort the dict by key, case insensitive, sorted&#xa;    normally and ordered by value."/>
</node>
<node CREATED="1337098514818" FOLDED="true" MODIFIED="1337098527964" TEXT="escape(s)">
<node CREATED="1337098518851" MODIFIED="1337098522736" TEXT="Convert the characters &amp;, &lt;, &gt;, &#x2018;, and &#x201d; in string s to HTML-safe sequences. Use this if you need to display text that might contain such characters in HTML. Marks return value as markup string.&#xa;&#xa;Aliases :&#x9;e"/>
</node>
<node CREATED="1337098541665" FOLDED="true" MODIFIED="1337098551033" TEXT="filesizeformat(value, binary=False)">
<node CREATED="1337098546873" MODIFIED="1337098548278" TEXT="Format the value like a &#x2018;human-readable&#x2019; file size (i.e. 13 kB, 4.1 MB, 102 Bytes, etc). Per default decimal prefixes are used (Mega, Giga, etc.), if the second parameter is set to True the binary prefixes are used (Mebi, Gibi).  "/>
</node>
<node CREATED="1337098582920" FOLDED="true" MODIFIED="1337098592871" TEXT="first(seq)">
<node CREATED="1337098587695" MODIFIED="1337098588060" TEXT="Return the first item of a sequence."/>
</node>
<node CREATED="1337098593391" FOLDED="true" MODIFIED="1337098602047" TEXT="float(value, default=0.0)">
<node CREATED="1337098600446" MODIFIED="1337098600788" TEXT="Convert the value into a floating point number. If the conversion doesn&#x2019;t work it will return 0.0. You can override this default using the first parameter."/>
</node>
<node CREATED="1337098606614" FOLDED="true" MODIFIED="1337098615404" TEXT="forceescape(value)">
<node CREATED="1337098611486" MODIFIED="1337098612163" TEXT="Enforce HTML escaping. This will probably double escape variables."/>
</node>
<node CREATED="1337098620886" FOLDED="true" MODIFIED="1337098639445" TEXT="format(value, *args, **kwargs)">
<node CREATED="1337098625374" MODIFIED="1337098631523" TEXT="Apply python string formatting on an object:&#xa;&#xa;{{ &quot;%s - %s&quot;|format(&quot;Hello?&quot;, &quot;Foo!&quot;) }}&#xa;    -&gt; Hello? - Foo!"/>
</node>
<node CREATED="1337098645876" FOLDED="true" MODIFIED="1337098668970" TEXT="groupby(value, attribute)">
<node CREATED="1337098658483" MODIFIED="1337098665738" TEXT="Group a sequence of objects by a common attribute.&#xa;&#xa;If you for example have a list of dicts or objects that represent persons with gender, first_name and last_name attributes and you want to group all users by genders you can do something like the following snippet:&#xa;&#xa;&lt;ul&gt;&#xa;{% for group in persons|groupby(&apos;gender&apos;) %}&#xa;    &lt;li&gt;{{ group.grouper }}&lt;ul&gt;&#xa;    {% for person in group.list %}&#xa;        &lt;li&gt;{{ person.first_name }} {{ person.last_name }}&lt;/li&gt;&#xa;    {% endfor %}&lt;/ul&gt;&lt;/li&gt;&#xa;{% endfor %}&#xa;&lt;/ul&gt;&#xa;&#xa;Additionally it&#x2019;s possible to use tuple unpacking for the grouper and list:&#xa;&#xa;&lt;ul&gt;&#xa;{% for grouper, list in persons|groupby(&apos;gender&apos;) %}&#xa;    ...&#xa;{% endfor %}&#xa;&lt;/ul&gt;&#xa;&#xa;As you can see the item we&#x2019;re grouping by is stored in the grouper attribute and the list contains all the objects that have this grouper in common."/>
</node>
<node CREATED="1337098676316" FOLDED="true" MODIFIED="1337098685275" TEXT="indent(s, width=4, indentfirst=False)">
<node CREATED="1337098681291" MODIFIED="1337098684337" TEXT="Return a copy of the passed string, each line indented by 4 spaces. The first line is not indented. If you want to change the number of spaces or indent the first line too you can pass additional parameters to the filter:&#xa;&#xa;{{ mytext|indent(2, true) }}&#xa;    indent by two spaces and indent the first line too."/>
</node>
<node CREATED="1337098690019" FOLDED="true" MODIFIED="1337098699403" TEXT="int(value, default=0)">
<node CREATED="1337098694387" MODIFIED="1337098698273" TEXT="Convert the value into an integer. If the conversion doesn&#x2019;t work it will return 0. You can override this default using the first parameter."/>
</node>
<node CREATED="1337098703898" FOLDED="true" MODIFIED="1337098713666" TEXT="join(value, d=u&apos;&apos;, attribute=None)">
<node CREATED="1337098709490" MODIFIED="1337098711960" TEXT="Return a string which is the concatenation of the strings in the sequence. The separator between elements is an empty string per default, you can define it with the optional parameter:&#xa;&#xa;{{ [1, 2, 3]|join(&apos;|&apos;) }}&#xa;    -&gt; 1|2|3&#xa;&#xa;{{ [1, 2, 3]|join }}&#xa;    -&gt; 123&#xa;It is also possible to join certain attributes of an object:&#xa;&#xa;{{ users|join(&apos;, &apos;, attribute=&apos;username&apos;) }}"/>
</node>
<node CREATED="1337098718594" FOLDED="true" MODIFIED="1337098729727" TEXT="last(seq)">
<node CREATED="1337098723618" MODIFIED="1337098723951" TEXT="Return the last item of a sequence."/>
</node>
<node CREATED="1337098737168" FOLDED="true" MODIFIED="1337098743305" TEXT="length(object)">
<node CREATED="1337098742041" MODIFIED="1337098742542" TEXT="Return the number of items of a sequence or mapping."/>
</node>
<node CREATED="1337098749768" FOLDED="true" MODIFIED="1337098755016" TEXT="list(value)">
<node CREATED="1337098753632" MODIFIED="1337098753949" TEXT="Convert the value into a list. If it was a string the returned list will be a list of characters."/>
</node>
<node CREATED="1337098759559" FOLDED="true" MODIFIED="1337098764920" TEXT="lower(s)">
<node CREATED="1337098763704" MODIFIED="1337098763989" TEXT="Convert a value to lowercase."/>
</node>
<node CREATED="1337098768792" FOLDED="true" MODIFIED="1337098779047" TEXT="pprint(value, verbose=False)">
<node CREATED="1337098773503" MODIFIED="1337098778197" TEXT="Pretty print a variable. Useful for debugging.&#xa;&#xa;With Jinja 1.2 onwards you can pass it a parameter. If this parameter is truthy the output will be more verbose (this requires pretty)"/>
</node>
<node CREATED="1337098783223" FOLDED="true" MODIFIED="1337098788447" TEXT="random(seq)">
<node CREATED="1337098787279" MODIFIED="1337098787740" TEXT="Return a random item from the sequence."/>
</node>
<node CREATED="1337098793263" FOLDED="true" MODIFIED="1337098804694" TEXT="replace(s, old, new, count=None)">
<node CREATED="1337098798126" MODIFIED="1337098800364" TEXT="Return a copy of the value with all occurrences of a substring replaced with a new one. The first argument is the substring that should be replaced, the second is the replacement string. If the optional third argument count is given, only the first count occurrences are replaced:&#xa;&#xa;{{ &quot;Hello World&quot;|replace(&quot;Hello&quot;, &quot;Goodbye&quot;) }}&#xa;    -&gt; Goodbye World&#xa;&#xa;{{ &quot;aaaaargh&quot;|replace(&quot;a&quot;, &quot;d&apos;oh, &quot;, 2) }}&#xa;    -&gt; d&apos;oh, d&apos;oh, aaargh"/>
</node>
<node CREATED="1337098811478" FOLDED="true" MODIFIED="1337098819253" TEXT="reverse(value)">
<node CREATED="1337098816037" MODIFIED="1337098816474" TEXT="Reverse the object or return an iterator the iterates over it the other way round."/>
</node>
<node CREATED="1337098826621" FOLDED="true" MODIFIED="1337098835792" TEXT="round(value, precision=0, method=&apos;common&apos;)">
<node CREATED="1337098832541" MODIFIED="1337098835034" TEXT="Round the number to a given precision. The first parameter specifies the precision (default is 0), the second the rounding method:&#xa;&#xa;&apos;common&apos; rounds either up or down&#xa;&apos;ceil&apos; always rounds up&#xa;&apos;floor&apos; always rounds down&#xa;If you don&#x2019;t specify a method &apos;common&apos; is used.&#xa;&#xa;{{ 42.55|round }}&#xa;    -&gt; 43.0&#xa;{{ 42.55|round(1, &apos;floor&apos;) }}&#xa;    -&gt; 42.5&#xa;Note that even if rounded to 0 precision, a float is returned. If you need a real integer, pipe it through int:&#xa;&#xa;{{ 42.55|round|int }}&#xa;    -&gt; 43"/>
</node>
<node CREATED="1337098839845" FOLDED="true" MODIFIED="1337098847580" TEXT="safe(value)">
<node CREATED="1337098844604" MODIFIED="1337098846890" TEXT="Mark the value as safe which means that in an environment with automatic escaping enabled this variable will not be escaped."/>
</node>
<node CREATED="1337098852100" FOLDED="true" MODIFIED="1337098896730" TEXT="slice(value, slices, fill_with=None)">
<node CREATED="1337098857860" MODIFIED="1337098863065" TEXT="Slice an iterator and return a list of lists containing those items. Useful if you want to create a div containing three ul tags that represent columns:&#xa;&#xa;&lt;div class=&quot;columwrapper&quot;&gt;&#xa;  {%- for column in items|slice(3) %}&#xa;    &lt;ul class=&quot;column-{{ loop.index }}&quot;&gt;&#xa;    {%- for item in column %}&#xa;      &lt;li&gt;{{ item }}&lt;/li&gt;&#xa;    {%- endfor %}&#xa;    &lt;/ul&gt;&#xa;  {%- endfor %}&#xa;&lt;/div&gt;&#xa;&#xa;If you pass it a second argument it&#x2019;s used to fill missing values on the last iteration.&#xa;"/>
</node>
<node CREATED="1337098902762" FOLDED="true" MODIFIED="1337098914579" TEXT="sort(value, reverse=False, case_sensitive=False, attribute=None)">
<node CREATED="1337098910897" MODIFIED="1337098913791" TEXT="Sort an iterable. Per default it sorts ascending, if you pass it true as first argument it will reverse the sorting.&#xa;&#xa;If the iterable is made of strings the third parameter can be used to control the case sensitiveness of the comparison which is disabled by default.&#xa;&#xa;{% for item in iterable|sort %}&#xa;    ...&#xa;{% endfor %}&#xa;It is also possible to sort by an attribute (for example to sort by the date of an object) by specifying the attribute parameter:&#xa;&#xa;{% for item in iterable|sort(attribute=&apos;date&apos;) %}&#xa;    ...&#xa;{% endfor %}&#xa;Changed in version 2.6: The attribute parameter was added."/>
</node>
<node CREATED="1337098918985" FOLDED="true" MODIFIED="1337098925632" TEXT="string(object)">
<node CREATED="1337098922168" MODIFIED="1337098924886" TEXT="Make a string unicode if it isn&#x2019;t already. That way a markup string is not converted back to unicode."/>
</node>
<node CREATED="1337098930128" FOLDED="true" MODIFIED="1337098947201" TEXT="striptags(value)">
<node CREATED="1337098936227" MODIFIED="1337098940550" TEXT="Strip SGML/XML tags and replace adjacent whitespace by one space."/>
</node>
<node CREATED="1337098953351" FOLDED="true" MODIFIED="1337098961415" TEXT="sum(iterable, attribute=None, start=0)">
<node CREATED="1337098958383" MODIFIED="1337098960629" TEXT="Returns the sum of a sequence of numbers plus the value of parameter &#x2018;start&#x2019; (which defaults to 0). When the sequence is empty it returns start.&#xa;&#xa;It is also possible to sum up only certain attributes:&#xa;&#xa;Total: {{ items|sum(attribute=&apos;price&apos;) }}&#xa;Changed in version 2.6: The attribute parameter was added to allow suming up over attributes. Also the start parameter was moved on to the right."/>
</node>
<node CREATED="1337098966183" FOLDED="true" MODIFIED="1337098973551" TEXT="title(s)">
<node CREATED="1337098971159" MODIFIED="1337098971812" TEXT="Return a titlecased version of the value. I.e. words will start with uppercase letters, all remaining characters are lowercase."/>
</node>
<node CREATED="1337098978150" FOLDED="true" MODIFIED="1337098984262" TEXT="trim(value)">
<node CREATED="1337098982910" MODIFIED="1337098983539" TEXT="Strip leading and trailing whitespace."/>
</node>
<node CREATED="1337098988710" FOLDED="true" MODIFIED="1337098996454" TEXT="truncate(s, length=255, killwords=False, end=&apos;...&apos;)">
<node CREATED="1337098992798" MODIFIED="1337098995787" TEXT="Return a truncated copy of the string. The length is specified with the first parameter which defaults to 255. If the second parameter is true the filter will cut the text at length. Otherwise it will try to save the last word. If the text was in fact truncated it will append an ellipsis sign (&quot;...&quot;). If you want a different ellipsis sign than &quot;...&quot; you can specify it using the third parameter."/>
</node>
<node CREATED="1337099001774" FOLDED="true" MODIFIED="1337099007221" TEXT="upper(s)">
<node CREATED="1337099006277" MODIFIED="1337099006651" TEXT="Convert a value to uppercase."/>
</node>
<node CREATED="1337099012461" FOLDED="true" MODIFIED="1337099020221" TEXT="urlize(value, trim_url_limit=None, nofollow=False)">
<node CREATED="1337099016869" MODIFIED="1337099019498" TEXT="Converts URLs in plain text into clickable links.&#xa;&#xa;If you pass the filter an additional integer it will shorten the urls to that number. Also a third argument exists that makes the urls &#x201c;nofollow&#x201d;:&#xa;&#xa;{{ mytext|urlize(40, true) }}&#xa;    links are shortened to 40 chars and defined with rel=&quot;nofollow&quot;"/>
</node>
<node CREATED="1337099025813" FOLDED="true" MODIFIED="1337099031340" TEXT="wordcount(s)">
<node CREATED="1337099030428" MODIFIED="1337099030818" TEXT="Count the words in that string."/>
</node>
<node CREATED="1337099036036" FOLDED="true" MODIFIED="1337099044357" TEXT="wordwrap(s, width=79, break_long_words=True)">
<node CREATED="1337099040820" MODIFIED="1337099043689" TEXT="Return a copy of the string passed to the filter wrapped after 79 characters. You can override this default using the first parameter. If you set the second parameter to false Jinja will not split words apart if they are longer than width."/>
</node>
<node CREATED="1337099049131" FOLDED="true" MODIFIED="1337099063716" TEXT="xmlattr(d, autospace=True)">
<node CREATED="1337099053770" MODIFIED="1337099055745" TEXT="Create an SGML/XML attribute string based on the items in a dict. All values that are neither none nor undefined are automatically escaped:&#xa;&#xa;&lt;ul{{ {&apos;class&apos;: &apos;my_list&apos;, &apos;missing&apos;: none,&#xa;        &apos;id&apos;: &apos;list-%d&apos;|format(variable)}|xmlattr }}&gt;&#xa;...&#xa;&lt;/ul&gt;&#xa;Results in something like this:&#xa;&#xa;&lt;ul class=&quot;my_list&quot; id=&quot;list-42&quot;&gt;&#xa;...&#xa;&lt;/ul&gt;&#xa;As you can see it automatically prepends a space in front of the item if the filter returned something unless the second parameter is false."/>
</node>
</node>
<node CREATED="1337099074714" FOLDED="true" MODIFIED="1338324406864" POSITION="right" TEXT="Built-in Tests">
<node CREATED="1337099085786" FOLDED="true" MODIFIED="1337099093553" TEXT="callable(object)">
<node CREATED="1337099090753" MODIFIED="1337099091846" TEXT="Return whether the object is callable (i.e., some kind of function). Note that classes are callable, as are instances with a __call__() method."/>
</node>
<node CREATED="1337099098393" FOLDED="true" MODIFIED="1337099108025" TEXT="defined(value)">
<node CREATED="1337099103072" MODIFIED="1337099107263" TEXT="Return true if the variable is defined:&#xa;&#xa;{% if variable is defined %}&#xa;    value of variable: {{ variable }}&#xa;{% else %}&#xa;    variable is not defined&#xa;{% endif %}&#xa;&#xa;See the default() filter for a simple way to set undefined variables."/>
</node>
<node CREATED="1337099113577" FOLDED="true" MODIFIED="1337099119920" TEXT="divisibleby(value, num)">
<node CREATED="1337099118864" MODIFIED="1337099119389" TEXT="Check if a variable is divisible by a number."/>
</node>
<node CREATED="1337099125000" FOLDED="true" MODIFIED="1337099130136" TEXT="escaped(value)">
<node CREATED="1337099129296" MODIFIED="1337099129581" TEXT="Check if the value is escaped."/>
</node>
<node CREATED="1337099135456" FOLDED="true" MODIFIED="1337099140640" TEXT="even(value)">
<node CREATED="1337099139759" MODIFIED="1337099140071" TEXT="Return true if the variable is even."/>
</node>
<node CREATED="1337099146576" FOLDED="true" MODIFIED="1337099152726" TEXT="iterable(value)">
<node CREATED="1337099151599" MODIFIED="1337099152244" TEXT="Check if it&#x2019;s possible to iterate over an object."/>
</node>
<node CREATED="1337099157470" FOLDED="true" MODIFIED="1337099162999" TEXT="lower(value)">
<node CREATED="1337099161894" MODIFIED="1337099162315" TEXT="Return true if the variable is lowercased."/>
</node>
<node CREATED="1337099167222" FOLDED="true" MODIFIED="1337099421939" TEXT="mapping(value)">
<node CREATED="1337099172694" MODIFIED="1337099173995" TEXT="Return true if the object is a mapping (dict etc.)."/>
</node>
<node CREATED="1337099429467" FOLDED="true" MODIFIED="1337099434635" TEXT="none(value)">
<node CREATED="1337099433859" MODIFIED="1337099434114" TEXT="Return true if the variable is none."/>
</node>
<node CREATED="1337099440018" FOLDED="true" MODIFIED="1337099445379" TEXT="number(value)">
<node CREATED="1337099444538" MODIFIED="1337099444855" TEXT="Return true if the variable is a number."/>
</node>
<node CREATED="1337099450250" FOLDED="true" MODIFIED="1337099459418" TEXT="odd(value)">
<node CREATED="1337099454618" MODIFIED="1337099455079" TEXT="Return true if the variable is odd."/>
</node>
<node CREATED="1337099459906" FOLDED="true" MODIFIED="1337099469649" TEXT="sameas(value, other)">
<node CREATED="1337099464953" MODIFIED="1337099468263" TEXT="Check if an object points to the same memory address than another object:&#xa;&#xa;{% if foo.attribute is sameas false %}&#xa;    the foo attribute really is the `False` singleton&#xa;{% endif %}"/>
</node>
<node CREATED="1337099474577" FOLDED="true" MODIFIED="1337099485761" TEXT="sequence(value)">
<node CREATED="1337099478761" MODIFIED="1337099479982" TEXT="Return true if the variable is a sequence. Sequences are variables that are iterable. "/>
</node>
<node CREATED="1337099486392" FOLDED="true" MODIFIED="1337099500736" TEXT="string(value)">
<node CREATED="1337099494088" MODIFIED="1337099494751" TEXT="Return true if the object is a string."/>
</node>
<node CREATED="1337099501464" FOLDED="true" MODIFIED="1337099511183" TEXT="undefined(value)">
<node CREATED="1337099506503" MODIFIED="1337099506869" TEXT="Like defined() but the other way round."/>
</node>
<node CREATED="1337099511815" FOLDED="true" MODIFIED="1337099517983" TEXT="upper(value)">
<node CREATED="1337099516383" MODIFIED="1337099516900" TEXT="Return true if the variable is uppercased."/>
</node>
</node>
<node CREATED="1337099528223" FOLDED="true" MODIFIED="1338324408888" POSITION="right" TEXT="List of Global Functions">
<node CREATED="1337099547278" FOLDED="true" MODIFIED="1337099565653" TEXT="range([start], stop[, step])">
<node CREATED="1337099561909" MODIFIED="1337099564587" TEXT="Return a list containing an arithmetic progression of integers. range(i, j) returns [i, i+1, i+2, ..., j-1]; start (!) defaults to 0. When step is given, it specifies the increment (or decrement). For example, range(4) returns [0, 1, 2, 3]. The end point is omitted! These are exactly the valid indices for a list of 4 elements.&#xa;&#xa;This is useful to repeat a template block multiple times for example to fill a list. Imagine you have 7 users in the list but you want to render three empty items to enforce a height with CSS:&#xa;&#xa;&lt;ul&gt;&#xa;{% for user in users %}&#xa;    &lt;li&gt;{{ user.username }}&lt;/li&gt;&#xa;{% endfor %}&#xa;{% for number in range(10 - users|count) %}&#xa;    &lt;li class=&quot;empty&quot;&gt;&lt;span&gt;...&lt;/span&gt;&lt;/li&gt;&#xa;{% endfor %}&#xa;&lt;/ul&gt;"/>
</node>
<node CREATED="1337099585580" FOLDED="true" MODIFIED="1337099594739" TEXT="lipsum(n=5, html=True, min=20, max=100)">
<node CREATED="1337099591996" MODIFIED="1337099592880" TEXT="Generates some lorem ipsum for the template. Per default five paragraphs with HTML are generated each paragraph between 20 and 100 words. If html is disabled regular text is returned. This is useful to generate simple contents for layout testing."/>
</node>
<node CREATED="1337099602171" FOLDED="true" MODIFIED="1337099619771" TEXT="dict(**items)">
<node CREATED="1337099609035" MODIFIED="1337099609784" TEXT="A convenient alternative to dict literals. {&apos;foo&apos;: &apos;bar&apos;} is the same as dict(foo=&apos;bar&apos;)."/>
</node>
<node CREATED="1337099620346" FOLDED="true" MODIFIED="1337099689705" TEXT="class cycler(*items)">
<node CREATED="1337099630585" MODIFIED="1337099632984" TEXT="The cycler allows you to cycle among values similar to how loop.cycle works. Unlike loop.cycle however you can use this cycler outside of loops or over multiple loops.&#xa;&#xa;This is for example very useful if you want to show a list of folders and files, with the folders on top, but both in the same list with alternating row colors.&#xa;&#xa;The following example shows how cycler can be used:&#xa;&#xa;{% set row_class = cycler(&apos;odd&apos;, &apos;even&apos;) %}&#xa;&lt;ul class=&quot;browser&quot;&gt;&#xa;{% for folder in folders %}&#xa;  &lt;li class=&quot;folder {{ row_class.next() }}&quot;&gt;{{ folder|e }}&lt;/li&gt;&#xa;{% endfor %}&#xa;{% for filename in files %}&#xa;  &lt;li class=&quot;file {{ row_class.next() }}&quot;&gt;{{ filename|e }}&lt;/li&gt;&#xa;{% endfor %}&#xa;&lt;/ul&gt;"/>
<node CREATED="1337099645041" MODIFIED="1337099659966" TEXT="The class cycler has the following methods:"/>
<node CREATED="1337099661369" FOLDED="true" MODIFIED="1337099688088" TEXT="reset()">
<node CREATED="1337099666185" MODIFIED="1337099666677" TEXT="Resets the cycle to the first item."/>
</node>
<node CREATED="1337099672752" FOLDED="true" MODIFIED="1337099687792" TEXT="next()">
<node CREATED="1337099676928" MODIFIED="1337099677277" TEXT="Goes one item a head and returns the then current item."/>
</node>
<node CREATED="1337099682152" FOLDED="true" MODIFIED="1337099687480" TEXT="current">
<node CREATED="1337099686416" MODIFIED="1337099686823" TEXT="Returns the current item."/>
</node>
</node>
<node CREATED="1337099696975" FOLDED="true" MODIFIED="1337099707511" TEXT="class joiner(sep=&apos;, &apos;)">
<node CREATED="1337099704078" MODIFIED="1337099706549" TEXT="A tiny helper that can be use to &#x201c;join&#x201d; multiple sections. A joiner is passed a string and will return that string every time it&#x2019;s called, except the first time in which situation it returns an empty string. You can use this to join things:&#xa;&#xa;{% set pipe = joiner(&quot;|&quot;) %}&#xa;{% if categories %} {{ pipe() }}&#xa;    Categories: {{ categories|join(&quot;, &quot;) }}&#xa;{% endif %}&#xa;{% if author %} {{ pipe() }}&#xa;    Author: {{ author() }}&#xa;{% endif %}&#xa;{% if can_edit %} {{ pipe() }}&#xa;    &lt;a href=&quot;?action=edit&quot;&gt;Edit&lt;/a&gt;&#xa;{% endif %}"/>
</node>
</node>
<node CREATED="1337099753837" FOLDED="true" MODIFIED="1337227567944" POSITION="right" TEXT="Extensions">
<node CREATED="1337099767420" FOLDED="true" MODIFIED="1337099851664" TEXT="i18n">
<node CREATED="1337099789299" MODIFIED="1337099792121" TEXT="If the i18n extension is enabled it&#x2019;s possible to mark parts in the template as translatable. To mark a section as translatable you can use trans:&#xa;&#xa;&lt;p&gt;{% trans %}Hello {{ user }}!{% endtrans %}&lt;/p&gt;&#xa;To translate a template expression &#x2014; say, using template filters or just accessing an attribute of an object &#x2014; you need to bind the expression to a name for use within the translation block:&#xa;&#xa;&lt;p&gt;{% trans user=user.username %}Hello {{ user }}!{% endtrans %}&lt;/p&gt;&#xa;If you need to bind more than one expression inside a trans tag, separate the pieces with a comma (,):&#xa;&#xa;{% trans book_title=book.title, author=author.name %}&#xa;This is {{ book_title }} by {{ author }}&#xa;{% endtrans %}&#xa;Inside trans tags no statements are allowed, only variable tags are.&#xa;&#xa;To pluralize, specify both the singular and plural forms with the pluralize tag, which appears between trans and endtrans:&#xa;&#xa;{% trans count=list|length %}&#xa;There is {{ count }} {{ name }} object.&#xa;{% pluralize %}&#xa;There are {{ count }} {{ name }} objects.&#xa;{% endtrans %}&#xa;Per default the first variable in a block is used to determine the correct singular or plural form. If that doesn&#x2019;t work out you can specify the name which should be used for pluralizing by adding it as parameter to pluralize:&#xa;&#xa;{% trans ..., user_count=users|length %}...&#xa;{% pluralize user_count %}...{% endtrans %}&#xa;It&#x2019;s also possible to translate strings in expressions. For that purpose three functions exist:&#xa;&#xa;_ gettext: translate a single string - ngettext: translate a pluralizable string - _: alias for gettext&#xa;&#xa;For example you can print a translated string easily this way:&#xa;&#xa;{{ _(&apos;Hello World!&apos;) }}&#xa;To use placeholders you can use the format filter:&#xa;&#xa;{{ _(&apos;Hello %(user)s!&apos;)|format(user=user.username) }}&#xa;For multiple placeholders always use keyword arguments to format as other languages may not use the words in the same order."/>
</node>
<node CREATED="1337099918838" FOLDED="true" MODIFIED="1337099945637" TEXT="Expression Statement">
<node CREATED="1337099924045" MODIFIED="1337099926891" TEXT="If the expression-statement extension is loaded a tag called do is available that works exactly like the regular variable expression ({{ ... }}) just that it doesn&#x2019;t print anything. This can be used to modify lists:&#xa;&#xa;{% do navigation.append(&apos;a string&apos;) %}"/>
</node>
<node CREATED="1337099950708" FOLDED="true" MODIFIED="1337099962884" TEXT="Loop Controls">
<node CREATED="1337099956884" MODIFIED="1337099961841" TEXT="If the application enables the Loop Controls it&#x2019;s possible to use break and continue in loops. When break is reached, the loop is terminated; if continue is reached, the processing is stopped and continues with the next iteration.&#xa;&#xa;Here a loop that skips every second item:&#xa;&#xa;{% for user in users %}&#xa;    {%- if loop.index is even %}{% continue %}{% endif %}&#xa;    ...&#xa;{% endfor %}&#xa;&#xa;Likewise a look that stops processing after the 10th iteration:&#xa;&#xa;{% for user in users %}&#xa;    {%- if loop.index &gt;= 10 %}{% break %}{% endif %}&#xa;{%- endfor %}"/>
</node>
<node CREATED="1337099967132" FOLDED="true" MODIFIED="1337099992587" TEXT="With Statement">
<node CREATED="1337099974763" MODIFIED="1337099985720" TEXT="If the application enables the With Statement it is possible to use the with keyword in templates. This makes it possible to create a new inner scope. Variables set within this scope are not visible outside of the scope.&#xa;&#xa;With in a nutshell:&#xa;&#xa;{% with %}&#xa;    {% set foo = 42 %}&#xa;    {{ foo }}           foo is 42 here&#xa;{% endwith %}&#xa;foo is not visible here any longer&#xa;&#xa;Because it is common to set variables at the beginning of the scope you can do that within the with statement. The following two examples are equivalent:&#xa;&#xa;{% with foo = 42 %}&#xa;    {{ foo }}&#xa;{% endwith %}&#xa;&#xa;{% with %}&#xa;    {% set foo = 42 %}&#xa;    {{ foo }}&#xa;{% endwith %}"/>
</node>
<node CREATED="1337099901398" FOLDED="true" MODIFIED="1337099911766" TEXT="Autoescape Extension">
<node CREATED="1337099907870" MODIFIED="1337099910731" TEXT="If the application enables the Autoescape Extension one can activate and deactivate the autoescaping from within the templates.&#xa;&#xa;Example:&#xa;&#xa;{% autoescape true %}&#xa;    Autoescaping is active within this block&#xa;{% endautoescape %}&#xa;&#xa;{% autoescape false %}&#xa;    Autoescaping is inactive within this block&#xa;{% endautoescape %}&#xa;After the endautoescape the behavior is reverted to what it was before."/>
</node>
</node>
<node CREATED="1337224351896" FOLDED="true" MODIFIED="1337227571551" POSITION="right" TEXT="Creating a filter to preserve newlines">
<node CREATED="1337224363127" MODIFIED="1337224366539" TEXT="I created a custom Jinja2 filter and used it from within my template. I&apos;m not sure how efficient this may be, but it works for me.&#xa;&#xa;Add the filter in your main.py.&#xa;&#xa;def nl2br(value): &#xa;     return value.replace(&apos;\n&apos;,&apos;&lt;br&gt;\n&apos;)&#xa;&#xa;jinja_env.filters[&apos;nl2br&apos;] = nl2br&#xa;&#xa;&#xa;You then apply the filter wherever you want to preserve newlines in your template.&#xa;&#xa;    {{ text | nl2br | safe }}&#xa;&#xa;You could learn more about custom filters by checking the Jinja2 docs."/>
</node>
</node>
</map>
