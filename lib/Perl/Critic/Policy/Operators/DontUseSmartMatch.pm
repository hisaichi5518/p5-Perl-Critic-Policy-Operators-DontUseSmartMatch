package Perl::Critic::Policy::Operators::DontUseSmartMatch;
use 5.008005;
use strict;
use warnings;
use parent 'Perl::Critic::Policy';

use Readonly;
use Perl::Critic::Utils qw{ :severities };

our $VERSION = "0.01";

Readonly::Scalar my $DESC => q{DON'T USE SMART MATCH!!!!!!!!!};
Readonly::Scalar my $EXPL => q{remove start march.};

sub supported_parameters { return () }
sub default_severity     { return $SEVERITY_MEDIUM }
sub default_themes       { return qw( core ) }
sub applies_to           { return 'PPI::Token::Operator' }

sub violates {
    my ($self, $elem) = @_;
    return if $elem ne '~~';
    return $self->violation($DESC, $EXPL, $elem);
}

1;
__END__

=encoding utf-8

=head1 NAME

Perl::Critic::Policy::Operators::DontUseSmartMatch - It's new $module

=head1 SYNOPSIS

    use Perl::Critic::Policy::Operators::DontUseSmartMatch;

=head1 DESCRIPTION

Perl::Critic::Policy::Operators::DontUseSmartMatch is ...

=head1 LICENSE

Copyright (C) hisaichi5518.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

hisaichi5518 E<lt>hisada.kazuki@gmail.comE<gt>

=cut

