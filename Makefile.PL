
use strict;
use warnings;

BEGIN { require 5.008008; }

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Log to RabbitMQ',
  'AUTHOR' => 'Trevor Little <bundacia@tjlittle.com>',
  'BUILD_REQUIRES' => {
    'English' => '0',
    'Log::Log4perl' => '0',
    'Test::More' => '0',
    'Test::Output' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Log-Log4perl-Appender-RabbitMQ',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Log::Log4perl::Appender::RabbitMQ',
  'PREREQ_PM' => {
    'Net::RabbitMQ' => '0',
    'Readonly' => '0',
    'Test::Net::RabbitMQ' => '0'
  },
  'VERSION' => '0.102020',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



