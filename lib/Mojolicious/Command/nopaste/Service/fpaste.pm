package Mojolicious::Command::nopaste::Service::fpaste;
use Mojo::Base 'Mojolicious::Command::nopaste::Service';

has description => "Post to fpaste.org\n";

sub paste {
  my $self = shift;
  my $lang = $self->language || 'text';

my $tx = $self->ua->post(
    'http://fpaste.org',
    form => {
        api_submit => 1,
        mode       => 'json',
        paste_data => $self->text,
        paste_lang => $lang,
        ($self->private ? (paste_private => 1)           : ()),
        ($self->name    ? (paste_user    => $self->name) : ()),
    }
);

  unless ($tx->res->is_status_class(200)) {
      say $tx->res->message;
      say $tx->res->body;
      exit 1;
  }

  my $url = 'http://fpaste.org/';

  $url .= join '/', @{$tx->res->json->{result}}{qw(id hash)};

  return $url;
}

1;
