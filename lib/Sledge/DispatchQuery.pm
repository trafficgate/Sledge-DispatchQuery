package Sledge::DispatchQuery;
# $Id$
#
# Tatsuhiko Miyagawa <miyagawa@edge.jp>
# EDGE, Co.,Ltd.
#

use strict;
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
