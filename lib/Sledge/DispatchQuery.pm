package Sledge::DispatchQuery;
# $Id$
#
# Tatsuhiko Miyagawa <miyagawa@edge.jp>
# EDGE, Co.,Ltd.
#

use strict;
use vars qw($VERSION);
$VERSION = 0.01;

use base qw(Exporter);
@Sledge::DispatchQuery::EXPORT = qw(dispatch_query);

$Sledge::DispatchQuery::DefaultKey = ".command";

sub dispatch_query {
    my($class, $key) = @_;
    $key ||= $Sledge::DispatchQuery::DefaultKey;
    my $sledge = $class->new();
    my $page = $sledge->r->param($key) || "index";
    $sledge->dispatch($page);
}

1;

__END__

=head1 NAME

Sledge::DispatchQuery - Mix-in to add dispatch_query to your Pages class

=head1 SYNOPSIS

  package Proj::Pages;
  use Sledge::DispatchQuery;

  # in blahblah/index.cgi
  use Proj::Pages::Blahblah;
  Proj::Pages::Blahblah->dispatch_query(".action");

=head1 DESCRIPTION

Sledge::DispatchQuery is a mix-in to add C<dispatch_query> to your
Pages class. This method allows you to create only C<index.cgi> in
each directory and call various page via CGI query paramter.

In the example in SYNOPSIS,

  http://example.com/blahblah/?.action=edit

would make a call for

  Project::Pages::Blahblah->new->dispatch('edit');

=head1 AUTHOR

Tatsuhiko Miyagawa E<lt>miyagawa@bulknews.netE<gt>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Sledge.

=head1 SEE ALSO

L<Sledge>

=cut

