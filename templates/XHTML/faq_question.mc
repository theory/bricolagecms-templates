<%args>
$sect_no
$ques_no
</%args>
              <dt><a id="<% "s${sect_no}q$ques_no" %>"><% $element->get_data('question_paragraph') %></a></dt>
              <dd>
<%perl>;
for my $ans ($element->get_elements(qw(answer_paragraph answer_code list))) {
    my $kn = $ans->get_key_name;
    if ($kn eq 'list') {
        $burner->display_element($ans);
    } else {
        my $tag = $kn eq 'answer_paragraph' ? 'p' : 'pre';
        $m->print("              <$tag>", $ans->get_data, "</$tag>\n");
    }
}
if (my $rel = $element->get_related_story) {
    $m->print(qq{              <p class="more"><a href="},
              $burner->best_uri($rel)->as_string,
              qq{/" title="}, escape_html($rel->get_title),
              qq{">Read more</a></p>\n});
}
</%perl>
              </dd>
<%doc>

=pod

=head1 Name

/faq_question.mc - XHTML output for FAQ questions on bricolage.cc

=head1 Author

David Wheeler <david@kineticode.com>

=head1 Copyright & License

Copyright (c) 2004 David Wheeler & Kineticode. All rights reserved.

This library is free software; you can redistribute it and/or modify it under
the terms of the GNU Lesser General Public License as published by the Free
Software Foundation, version 2.1 of the License.

This library is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
details.

You should have received a copy of the GNU Lesser General Public License along
with this library (see the the license.txt file); if not, write to the Free
Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
USA.

=cut

</%doc>\