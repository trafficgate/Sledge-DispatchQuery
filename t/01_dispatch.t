# $Id$
#
# Tatsuhiko Miyagawa <miyagawa@edge.jp>
# EDGE, Co.,Ltd.
#

use strict;
use Test::More tests => 6;

use lib "t/lib";
use Sledge::TestPages;

package Mock::Pages;
use base qw(Sledge::TestPages);

use Sledge::DispatchQuery;

package main;

$ENV{HTTP_HOST}      = "localhost";
$ENV{REQUEST_METHOD} = 'GET';
$ENV{REQUEST_URI}    = "http://localhost/index.cgi";
my $d = $Mock::Pages::TMPL_PATH;
$Mock::Pages::TMPL_PATH = "t/template";

test_pattern(".cmd=index", ".cmd", qr/dispatch_index/);
test_pattern(".command=index", undef, qr/dispatch_index/);
test_pattern(".cmd=edit", ".cmd", qr/dispatch_edit/);
test_pattern(".command=edit", undef, qr/dispatch_edit/);
test_pattern("", undef, qr/dispatch_index/);

$Sledge::DispatchQuery::DefaultKey = ".action";
test_pattern(".action=edit", undef, qr/dispatch_edit/);


sub test_pattern {
    my($query, $key, $re) = @_;
    local $ENV{QUERY_STRING}   = $query;
    eval {
	Mock::Pages->dispatch_query($key);
	fail "no fail here";
    };
    like $@, $re, "$query => $re";
}



