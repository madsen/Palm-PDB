use ExtUtils::MakeMaker;

require 5.006;

eval "use Test::Manifest 1.21";

$|++;
foreach ( 1 .. 4 ) {
	sleep 1;
	print "\a"; # annoying bell
	}

print STDERR <<"HERE";
====================================================================
--------------------------------------------------------------------

The Palm modules are unmaintained. If you want to use them, perhaps
you can take over its maintenance! Write to modules@perl.org to ask
to take over the module.

--------------------------------------------------------------------
====================================================================
HERE

WriteMakefile(
    'NAME'			=> 'Palm',
	'ABSTRACT'		=> 'Module for handling PalmOS databases',
    'VERSION_FROM'  => 'lib/Palm.pm',
    'LICENSE'       => 'perl',
	'AUTHOR'        => 'brian d foy <bdfoy@cpan.org>',
	
	'PREREQ_PM'		=> {
		'Test::More'	=> '0',
		},

	'META_MERGE'	=> {
		resources => {
			repository => 'https://github.com/briandfoy/p5-Palm',
			},
		},

    'EXE_FILES'		=> [ 'examples/pdbdump' ],

	clean  => { FILES    => q|*.bak *gz| },

);
