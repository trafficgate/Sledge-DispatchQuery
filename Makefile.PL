use ExtUtils::MakeMaker;
WriteMakefile(
    'NAME'      => 'Sledge::DispatchQuery',
    'VERSION_FROM' => 'lib/Sledge/DispatchQuery.pm', # finds $VERSION
    'PREREQ_PM' => {
	Test::More => 0.32,
    },
);
