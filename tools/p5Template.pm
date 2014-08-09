#---------------------------------------------------------------------
package tools::p5Template;
#
# Copyright 2014 Christopher J. Madsen
#
# Author: Christopher J. Madsen <perl@cjmweb.net>
# Created:  27 Jul 2014
#
# This program is free software; you can redistribute it and/or modify
# it under the same terms as Perl itself.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See either the
# GNU General Public License or the Artistic License for more details.
#
# ABSTRACT: Pod::Loom template for Palm-PDB
#---------------------------------------------------------------------

our $VERSION = '1.015';

use 5.008;
use Moose;
extends 'Pod::Loom::Template::Default';
with 'Pod::Loom::Role::Extender';

#---------------------------------------------------------------------
sub section_AUTHOR
{
  my ($self, $title) = @_;

  my ($dist) = $self->required_attr($title, qw(dist));

  my $pod = <<"END AUTHORS";
=head1 AUTHORS

Andrew Arensburger C<< <arensb AT ooblick.com> >>

Currently maintained by Christopher J. Madsen C<< <perl AT cjmweb.net> >>
END AUTHORS

  my $bugs = $self->bugtracker || {
    mailto => "bug-$dist\@rt.cpan.org",
    web    => "http://rt.cpan.org/Public/Bug/Report.html?Queue=$dist",
  };

  if (my $mailto = $bugs->{mailto} or $bugs->{web}) {
    $pod .= "\nPlease report any bugs or feature requests\n";

    if ($mailto) {
      $mailto =~ s/@/ AT /g;
      $pod .= "to S<C<< <$mailto> >>>";
    }

    if ($bugs->{web}) {
      $pod .= "\nor " if $mailto;
      $pod .= "through the web interface at\nL<< $bugs->{web} >>";
    }
    $pod .= ".\n";
  } # end if bugtracker

  my $repo = $self->repository;
  if ($repo) {
    $repo = "L<< $repo >>" if $repo =~ /^https?:/;

    $pod .= <<"END REPOSITORY";
\nYou can follow or contribute to ${dist}'s development at
$repo.
END REPOSITORY
  } # end if $self->repository

  return $pod;
} # end section_AUTHOR

#=====================================================================
# Package Return Value:

no Moose;
__PACKAGE__->meta->make_immutable;
1;
