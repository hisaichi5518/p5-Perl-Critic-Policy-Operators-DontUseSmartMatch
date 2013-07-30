use strict;
use warnings;
use Test::More;
use Perl::Critic::TestUtils qw(critique pcritique fcritique);

my $code = <<'__CODE__';
my ($hash, $test);
if ($hash ~~ $test) {
    print;
}
__CODE__

is pcritique('Operators::DontUseSmartMatch', \$code), 1;

done_testing;
