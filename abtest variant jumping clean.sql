    with id_counts as (
        select device_id
            , min(experiment) as experiment
            , min(experiment_group) as experiment_group
            , min(ds) as ds
            , count(distinct experiment) as n_experiments
            , count(distinct experiment_group) as n_experiment_groups
        from aurora_grindr.reporting.device_assignments_from_log
        where experiment in ('{EXPERIMENT_NAME_iOS}', '{EXPERIMENT_NAME_Android}')
        and ds <= '{MAX_DATE}'
        group by 1
    )
    select device_id, experiment, experiment_group, ds as assign_ds
    from id_counts
    where n_experiments = 1 and n_experiment_groups = 1