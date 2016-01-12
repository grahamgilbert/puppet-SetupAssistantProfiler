class setupassistantprofiler(
    $payloadidentifier = 'org.company.profile.setupassistant',
    $payloadorganization = 'Your Organization',
    ) {
    if ! defined(File["${::puppet_vardir}/setupassistantprofiler"]) {
      file { "${::puppet_vardir}/setupassistantprofiler":
        ensure => directory,
      }
    }

    file {"${::puppet_vardir}/setupassistantprofiler/SetupAssistant.mobileconfig":
        owner   => 0,
        group   => 0,
        mode    => '0644',
        content => template('setupassistantprofiler/SetupAssistant.mobileconfig.erb')
    }

    outset::everyboot{'setup_assistant_profiler.py':
        script        => template('setupassistantprofiler/setup_assistant_profiler.py.erb'),
        type          => 'template',
        immediate_run => true,
    }
}
