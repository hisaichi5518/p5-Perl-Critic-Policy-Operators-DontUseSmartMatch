package Perl::Critic::Policy::Keywords::ProhibitSwitchStatements;
use 5.008005;
use strict;
use warnings;
use parent 'Perl::Critic::Policy';

use Readonly;
use Perl::Critic::Utils qw{ :severities };

our $VERSION = "0.01";

Readonly::Scalar my $DESC => q{Switch statement keywords are used};
Readonly::Scalar my $EXPL => q{Avoid using switch statements keywords};

sub supported_parameters { return () }
sub default_severity     { return $SEVERITY_MEDIUM }
sub default_themes       { return qw( core ) }
sub applies_to           { return 'PPI::Token::Word' }

sub violates {
    my ($self, $elem) = @_;
    return if $elem !~ m{^(?:CORE::)?(?:given|when|default)$};
    return $self->violation($DESC, $EXPL, $elem);
}

1;
__END__

=encoding utf-8

=head1 NAME

Perl::Critic::Policy::Keywords::ProhibitSwitchStatements - Don't use switch statements

=head1 DESCRIPTION

According to L<perlsyn/"Switch Statements">, switch statements are highly experimental feature.
Those not brave enough should avoid using them. Switch statement keywords include:
B<given>, B<when>, B<default>.

    given ($foo) {
        when (42) { say 'Heureka!' }
	default { die 'Gosh!' }
    }

=head1 LICENSE

Copyright (C) .

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Jan Holcapek E<lt>holcapek@gmail.comE<gt>

=cut

