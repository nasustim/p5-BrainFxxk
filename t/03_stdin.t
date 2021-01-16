use strict;
use Test::More 0.98;
use IO::ScalarArray;

use Acme::Nasustim::BrainFxxk;

my @inputs = ('A');
my $my_stdin = IO::ScalarArray->new(\@inputs);
*STDIN = *$my_stdin;

my $got = Acme::Nasustim::BrainFxxk->new(+{
    code => ',.',
})->out;
my $expect = 'A';

is $got, $expect, 'validate ,(input from stdin)';

done_testing;