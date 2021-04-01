﻿[Report] @{
	Title = "Privileged Access Workstation Windows 10 Report"
	ModuleName = "TAPAuditor"
	BasedOn = @(
		"CIS Microsoft Windows 10 Enterprise Release 2004 Benchmark, Version: 1.9.0, Date: 2020-08-14"
		"CIS Google Chrome Benchmark, Version: 2.0.0, Date: 2019-05-17"
		'CIS Mozilla Firefox 38 ESR Benchmark, Version: 1.0.0, Date: 2015-12-31'
		"Microsoft Security baseline (FINAL) for Windows 10, Version: 20H2, Date: 2020-12-17"
		"Microsoft Edge v85 Security Baseline FINAL, Version: 85, Date: 2020-08-27"
		"SiSyPHuS Windows 10 - Telemetry components - Bundesamt fuer Sicherheit in der Informationstechnik (BSI), Version: V1.1, Date: 2019-07-31"
		
	)
	Sections = @(
		[ReportSection] @{
			Title = 'CIS Benchmarks'
			Description = 'This section contains the CIS Benchmark results.'
			SubSections = @(
				[ReportSection] @{
					Title = 'Windows 10'
					Description = 'This section contains the CIS "Windows 10" Benchmark results.'
					SubSections = @(
						[ReportSection] @{
							Title = 'Registry Settings/Group Policies'
							AuditInfos = Test-AuditGroup "Microsoft Windows 10-CIS-1.9.0#RegistrySettings"
						}
						[ReportSection] @{
							Title = 'User Rights Assignment'
							AuditInfos = Test-AuditGroup "Microsoft Windows 10-CIS-1.9.0#UserRights"
						}
						[ReportSection] @{
							Title = 'Account Policies'
							AuditInfos = Test-AuditGroup "Microsoft Windows 10-CIS-1.9.0#AccountPolicies"
						}
						[ReportSection] @{
							Title = 'Advanced Audit Policy Configuration'
							AuditInfos = Test-AuditGroup "Microsoft Windows 10-CIS-1.9.0#AuditPolicies"
						}
					)
				}
				[ReportSection] @{
					Title = 'Google Chrome'
					Description = 'This section contains the CIS "Google Chrome" Benchmark results.'
					SubSections = @(
						[ReportSection] @{
							Title = "Registry Settings/Group Policies"
							AuditInfos = Test-AuditGroup "Google Chrome-CIS-2.0.0#RegistrySettings"
						}
					)
				}
				[ReportSection] @{
					Title = 'Mozilla Firefox'
					Description = 'This section contains the CIS "Mozilla Firefox" Benchmark results.'
					SubSections = @(
						[ReportSection] @{
							Title = "Firefox Preferences"
							AuditInfos = Test-AuditGroup "Mozilla Firefox-CIS-1.0.0.1_1#FirefoxPreferences"
						}
					)
				}
			)
		}
		[ReportSection] @{
			Title = 'Microsoft Benchmarks'
			Description = 'This section contains the Microsoft Benchmark results.'
			SubSections = @(
				[ReportSection] @{
					Title = 'Windows 10'
					Description = 'This section contains the MICROSOFT "Windows 10" Benchmark results.'
					SubSections = @(
						[ReportSection] @{
							Title = 'Registry Settings/Group Policies'
							AuditInfos = Test-AuditGroup "Microsoft Windows 10-Microsoft-20H2#RegistrySettings"
						}
						[ReportSection] @{
							Title = 'User Rights Assignment'
							AuditInfos = Test-AuditGroup "Microsoft Windows 10-Microsoft-20H2#UserRights"
						}
						[ReportSection] @{
							Title = 'Account Policies'
							AuditInfos = Test-AuditGroup "Microsoft Windows 10-Microsoft-20H2#AccountPolicies"
						}
						[ReportSection] @{
							Title = 'Advanced Audit Policy Configuration'
							AuditInfos = Test-AuditGroup "Microsoft Windows 10-Microsoft-20H2#AuditPolicies"
						}
					)
				}
				[ReportSection] @{
					Title = 'Edge'
					Description = 'This section contains the MICROSOFT "Edge" Benchmark results.'
					SubSections = @(
						[ReportSection] @{
							Title = "Edge"
							AuditInfos = Test-AuditGroup "Microsoft Edge-MS-85#RegistrySettings"
						}
					)
				}
			)
		}
		[ReportSection] @{
			Title = "BSI Recommendations"
			Description = "This section contains the Telemetry-Recommendations of the Federal Office for Information Security (BSI)"
			SubSections = @(
				[ReportSection] @{
					Title = "Telemetry"
					AuditInfos = Test-AuditGroup "Microsoft Windows 10 GDPR-BSI-V1.1#RegistrySettings"
				}
			)
		}
	)
}