package Acme::Nasustim::BrainFxxk;
use 5.008001;
use strict;
use warnings;

use Acme::Nasustim::BrainFxxk::Compiler;

our $VERSION = "0.01";
our @EXPORT = qw|create|;

sub new {
    my ($self, $args) = @_;
    my $code = $args->{code};

    return Acme::Nasustim::BrainFxxk::Compiler->new(+{
        code => $code,
    });
};

1;
__END__

=encoding utf-8

=head1 NAME

Acme::Nasustim::BrainFxxk - It's new $module

=head1 SYNOPSIS

    use Acme::Nasustim::BrainFxxk;

=head1 DEVELOPMENT

    $ carton install
    $ carton exec -- prove -Ilib t

=head1 DESCRIPTION

Acme::Nasustim::BrainFxxk is compiler of L<brainfxxk|https://en.wikipedia.org/wiki/Brainfuck>.

=head1 LICENSE

Copyright (C) nasustim.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

nasustim E<lt>hibino17@iamas.ac.jpE<gt>

=cut

