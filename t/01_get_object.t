use strict;
use Test::More 0.98;
use Test::TypeConstraints qw/type_isa/;

use Acme::Nasustim::BrainFxxk;

my $got = Acme::Nasustim::BrainFxxk->new(+{
    code => '++++++.',
});
my $expect = 'Acme::Nasustim::BrainFxxk::Compiler';

type_isa $got, $expect, "return Object $expect";

done_testing;

