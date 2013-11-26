package Dist::Zilla::Stash::Rights;
use Moose;
with 'Dist::Zilla::Role::Stash';
# ABSTRACT: a stash of your default licensing terms

use namespace::autoclean;

sub mvp_multivalue_args { qw/license_class/ }

has license_class => (
  is  => 'ro',
  isa => 'ArrayRef[Str]',
  required => 1,
);

has copyright_holder => (
  is  => 'ro',
  isa => 'Str',
  required => 1,
);

has copyright_year => (
  is  => 'ro',
  isa => 'Int',
);

__PACKAGE__->meta->make_immutable;
1;
