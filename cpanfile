requires 'perl', '5.008001';

requires 'Mouse';
requires 'List::AllUtils';
requires 'Exporter::Lite';
requires 'Switch';

on 'test' => sub {
    requires 'Test::More', '0.98';
    requires 'Test::TypeConstraints';
};

on 'develop' => sub {
    requires 'Data::Printer';
};
