use strict;
use warnings;
package Text::SlackEmoji;
# ABSTRACT: data for mapping Slack :emoji_strings: into Unicode text

=head1 SYNOPSIS

  use Text::SlackEmoji;

  my $emoji = Text::SlackEmoji->emoji_map;

  $slack_message =~ s!:([-+a-z0-9_]+):!$emoji->{$1} // ":$1:"!ge;

=head1 DESCRIPTION

This library is basically just a container around a hash mapping strings like
"disappointed_relieved" to Unicode text like 😥 .

=head1 SECRET ORIGINS

I made the first version of this lookup to power a little C<irssi> plugin so
that when using the Slack IRC gateway, I'd see the same emoji as the people
using the Slack app, at least when possible.

=cut

our %Emoji = (
  '+1' => "\N{THUMBS UP SIGN}",
  '-1' => "\N{THUMBS DOWN SIGN}",

  'angry'                 => "\N{ANGRY FACE}",
  'anguished'             => "\N{ANGUISHED FACE}",
  'blush'                 => "\N{SMILING FACE WITH SMILING EYES}",
  'coffee'                => "\N{HOT BEVERAGE}",
  'confounded'            => "\N{CONFOUNDED FACE}",
  'confused'              => "\N{CONFUSED FACE}",
  'cry'                   => "\N{CRYING FACE}",
  'disappointed'          => "\N{DISAPPOINTED FACE}",
  'disappointed_relieved' => "\N{DISAPPOINTED BUT RELIEVED FACE}",
  'expressionless'        => "\N{EXPRESSIONLESS FACE}",
  'facepunch'             => "\N{FISTED HAND SIGN}",
  'fearful'               => "\N{FEARFUL FACE}",
  'fist'                  => "\N{RAISED FIST}",
  'frowning'              => "\N{FROWNING FACE WITH OPEN MOUTH}",
  'grin'                  => "\N{GRINNING FACE WITH SMILING EYES}",
  'grinning'              => "\N{GRINNING FACE}",
  'heart'                 => "\N{BLACK HEART SUIT}\x{FE0F}",
  'heart_eyes'            => "\N{SMILING FACE WITH HEART-SHAPED EYES}",
  'imp'                   => "\N{IMP}",
  'innocent'              => "\N{SMILING FACE WITH HALO}",
  'joy'                   => "\N{FACE WITH TEARS OF JOY}",
  'kissing'               => "\N{KISSING FACE}",
  'kissing_closed_eyes'   => "\N{KISSING FACE WITH CLOSED EYES}",
  'kissing_heart'         => "\N{FACE THROWING A KISS}",
  'kissing_smiling_eyes'  => "\N{KISSING FACE WITH SMILING EYES}",
  'neutral_face'          => "\N{NEUTRAL FACE}",
  'ok'                    => "\N{SQUARED OK}",
  'ok_hand'               => "\N{OK HAND SIGN}",
  'pensive'               => "\N{PENSIVE FACE}",
  'persevere'             => "\N{PERSEVERING FACE}",
  'poop'                  => "\N{PILE OF POO}",
  'pouting_cat'           => "\N{POUTING CAT FACE}",
  'rage'                  => "\N{POUTING FACE}",
  'rage'                  => "\N{POUTING FACE}",
  'relaxed'               => "\N{WHITE SMILING FACE}",
  'relieved'              => "\N{RELIEVED FACE}",
  'satisfied'   => "\N{SMILING FACE WITH OPEN MOUTH AND TIGHTLY-CLOSED EYES}",
  'smile'       => "\N{SMILING FACE WITH OPEN MOUTH AND SMILING EYES}",
  'smiley'      => "\N{SMILING FACE WITH OPEN MOUTH}",
  'smiling_imp' => "\N{SMILING FACE WITH HORNS}",
  'smirk'       => "\N{SMIRKING FACE}",
  'snowman'     => "\N{SNOWMAN}",
  'sunglasses'  => "\N{SMILING FACE WITH SUNGLASSES}",
  'sweat'       => "\N{FACE WITH COLD SWEAT}",
  'sweat_smile' => "\N{SMILING FACE WITH OPEN MOUTH AND COLD SWEAT}",
  'triumph'     => "\N{FACE WITH LOOK OF TRIUMPH}",
  'unamused'    => "\N{UNAMUSED FACE}",
  'wave'        => "\N{WAVING HAND SIGN}",
  'weary'       => "\N{WEARY FACE}",
  'wink'        => "\N{WINKING FACE}",
  'worried'     => "\N{WORRIED FACE}",
  'yum'         => "\N{FACE SAVOURING DELICIOUS FOOD}",

  'stuck_out_tongue' => "\N{FACE WITH STUCK-OUT TONGUE}",
  'stuck_out_tongue_closed_eyes' => "\N{FACE WITH STUCK-OUT TONGUE AND TIGHTLY-CLOSED EYES}",
  'stuck_out_tongue_winking_eyes' => "\N{FACE WITH STUCK-OUT TONGUE AND WINKING EYE}",
);

=method emoji_map

This method takes no arguments and returns a hashref mapping Slack emoji names
to Unicode strings.  The strings may be more than one character long.

=cut

sub emoji_map {
  my ($self) = @_;
  return { %Emoji };
}

1;
