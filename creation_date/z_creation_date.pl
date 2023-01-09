# Return this datestamp from the first history item of this record - the creation date.
#
# requires https://bazaar.eprints.org/452/1/plugins/EPrints/MetaField/Virtualwithvalue.pm
# (and some phrases)
#
# This is not the most efficient field - it requires additional database accesses.
# A better implementation would user a real field, and use similar code to get the value if one wasn't present in the field.

$c->add_dataset_field( "eprint",
	{
		name => 'creation_date',
		type => 'virtualwithvalue',
		virtual => 1,
		get_value => sub
		{
			my ( $field, $eprint ) = @_;
			my $repo = $eprint->repository;
			my @filters = (
				{ meta_fields => [qw( datasetid )], value => 'eprint', },
				{ meta_fields => [qw( objectid )], value => $eprint->id, },
			);
			my $hist_list = $repo->dataset( "history" )->search(
				filters => \@filters,
				custom_order=>"historyid",
				limit => 1,
			);

			my $first_hist = $hist_list->item( 0 );

			if( defined $first_hist )
			{
				my $ts = $first_hist->value( "timestamp" );
				my( $date, $time ) = split / /, $ts;
				return $date if defined $date;
			}
			return;
		},
	}
);
