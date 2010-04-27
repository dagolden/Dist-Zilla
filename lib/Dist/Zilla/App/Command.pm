use strict;
use warnings;
package Dist::Zilla::App::Command;
# ABSTRACT: base class for dzil commands
use App::Cmd::Setup -command;
use Moose::Autobox;

=method zilla

This returns the Dist::Zilla object in use by the command.  If none has yet
been constructed, one will be by calling C<< Dist::Zilla->from_config >>.

(This method just delegates to the Dist::Zilla::App object!)

=cut

sub zilla {
  return $_[0]->app->zilla;
}

sub config {
  my ($self) = @_;
  return $self->{__PACKAGE__}{config}
    ||= $self->zilla->_global_config_for(ref $self);
}

=method log

This method calls the C<log> method of the application's chrome.

=cut

sub log {
  $_[0]->app->chrome->logger->log($_[1]);
}

1;
