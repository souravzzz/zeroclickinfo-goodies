#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use DDG::Test::Goodie;

zci answer_type => 'parsecron';
zci is_cached => 0;

ddg_goodie_test(
	[qw(
		DDG::Goodie::ParseCron
	)],
	'crontab * */3 * * *' => test_zci(qr/^Cron will start this event next at \d{2}:\d{2}:\d{2} on \d{1,2} [a-zA-Z]{3}, \d{4}\.$/),
	'crontab 42 12 3 Feb Sat' => test_zci(qr/^Cron will start this event next at \d{2}:\d{2}:\d{2} on \d{1,2} [a-zA-Z]{3}, \d{4}\.$/),
);

done_testing;


