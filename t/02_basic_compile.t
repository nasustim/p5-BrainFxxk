use strict;
use Test::More 0.98;

use Acme::Nasustim::BrainFxxk;

my $got = Acme::Nasustim::BrainFxxk->new(+{
    code => '+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.+.+.',
})->out;
my $expect = 'ABC';

is $got, $expect, 'validate +(increment) and outout(.)';

done_testing;