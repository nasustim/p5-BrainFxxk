package Acme::Nasustim::BrainFxxk::Compiler;

use Mouse;
use Switch;

has code => (
    is  => 'ro',
    isa => 'Str',
);

has pointer => (
    is  => 'rw',
    isa => 'ArrayRef[Int]',
    default => sub { +[0] },
);

has index => (
    is  => 'rw',
    isa => 'Int',
    default => 0,
);

has output => (
    is  => 'rw',
    isa => 'Str',
    default => '',
);

has code_index => (
    is  => 'rw',
    isa => 'Int',
    default => 0,
);

sub out {
    my $self = shift;

    my @chars = split //, $self->{code};

    while ( scalar(@chars) >= $self->{code_index} ) {
        $self->interpret( $chars[$self->{code_index}] );
        $self->{code_index}++;
    }

    return $self->output;
};

sub interpret {
    my ($self, $char) = @_;
    my $address = $self->{index};

    switch ($char) {
        case '+' {
            $self->{pointer}->[$address]++;
        }
        case '-' {
            $self->{pointer}->[$address]--;
        }
        case '>' {
            $self->{index}++;
            my @new_pointer = push(@{$self->{pointer}}, 0) if ($self->{index} >= scalar(@{$self->{pointer}}));
            $self->{pointer} = \@new_pointer;
        }
        case '<' {
            $self->{index}-- unless ($self->{index} < 0);
        }
        case '.' {
            $self->{output} .= chr $self->{pointer}->[$address];
        }
        case ',' {
            my $buf = <STDIN>;
            $char = substr $buf, 0, 1;
            $self->{pointer}->[$address] = ord $char;
        }
        case '[' {
            if (0 == $self->{pointer}->[$address]) {
                my @_code = split //, $self->{code};
                do {
                    $self->{code_index}++;
                } while ( $_code[$self->{code_index}] ne ']' );
            }
        }
        case ']' {
            unless (0 == $self->{pointer}->[$address]) {
                my @_code = split //, $self->{code};
                while ( $_code[$self->{code_index}] ne '[' ) {
                    $self->{code_index}--;
                }
            }
        }
    }
}

1;