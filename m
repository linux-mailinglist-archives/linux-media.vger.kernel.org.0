Return-Path: <linux-media+bounces-61204-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIirC57EAmp7wQEAu9opvQ
	(envelope-from <linux-media+bounces-61204-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 08:11:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 985A951ABE3
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 08:11:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B1461306509D
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 06:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E70428468;
	Tue, 12 May 2026 06:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qAjk8Qt5"
X-Original-To: linux-media@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012042.outbound.protection.outlook.com [52.101.43.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD8E43CEEF
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 06:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778566122; cv=fail; b=KpVTa7m3qlpWoVoM04FJ8eSINgaRwBIRY8S1Y1IN6kgY5BnSxBUhXnhUBmAhtx0kPSl2v8cqTRHw0WRMyO0pP9sxg9Mcb7btHBrYH0vL+fKKGus72yShagimX9k56BzhAiOKqHQ9U2jvr0Sv/B0ufrGlASIz0srei7HsZRWv5Fc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778566122; c=relaxed/simple;
	bh=N96wVEe7KJU4+8dZFyUsqPtTgGyVCmxPUEfcfogWUkg=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KV7Q8u7B0p9dZwl14xaw5M6NhSBXjCrgIQHA1f9aB9qSYS0qohVVVetAko2j9z7xWrCm9rIat3XKqBxwiA5BEj61vacSsQOkvYkVkdp8BTNu1T9woapAalw0LTvLIeXMCj8gAfITVsaRJjABKn07603YKyacG3VDaLLsyo9CcmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qAjk8Qt5; arc=fail smtp.client-ip=52.101.43.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TwesQWYmWYXjIa1jAI1FA7oZQm8Q4ieAekwc+ivljQSY9bQrxTng5EZRPnSo4iRnyLFK733Iii9YdHVWDSjK6/fh/obrgCTfpp4BmYjIzt/iQrLb7Z2E0VJ596+4cMYwCs46z65BkZMAPVC+EqbXFudGjnjXgQzRTndKwXxuT/T5GQnFzwCZ1fPY3ihj0rQWx7IpmhM/JtOzzlnjt8NR8vhnIC5ClIu+9YBb8o4heZBwwmAcDZ+NlIbdxXPREATSsZyiUs70x0IPGLYS4rdcPAydJmIBI9QfKabwNuaOuDarSBrw1pAlb9b3gVse1YfrpKu9imXLx28+QnT9XPtizw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6vB3Lj1vFMu2IKl2dKQw8MBLMcPSTst3fdBj8DtSxU=;
 b=wLrh/SjR8L5VL7K9mY8j0Q9WdS4+MWfOVyw07lywZH08upECvlmmjM3cOTw32XJePXx1AHQ8kEI8uzqjdTwAJs+EsVlirkz+d5Sl+Njkt3Ati9O8Ky5Ih3q7X9oAQkSxQYdkZp3QGVsPn7J/akIWEBbdn00kFe7WmD4amqDZgTzU7mkjAE7SmJsepFeZOJ3DergcsC43B3x+YVU77qExgSBXKRtRGGw3MEf+Dt8GiL+ielJpWvlOb5gIlKoOFSIa1LsGHzEgCotUE9J3nKNrialjVMnYiuc6ZprZ3oMgYeZSykHomvJHMBgSFaOpgnLKsXo9+qrQ97+tRkwrzye/NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6vB3Lj1vFMu2IKl2dKQw8MBLMcPSTst3fdBj8DtSxU=;
 b=qAjk8Qt5d++DXq/bvv8R4UsjRuqhxCrpd7L89WSmkBhmL3xMhFxY/4vivzoz+SdcgjtSJRA819MNt6Zj/zTGuQfN7y6o48Xu5hBl1R0jgZImxK6fFGKQqcuuclCnNmUNfCDNvj5DPPr55j9l8zfkvNwtrdKF8C4rHnQ4NKKV7ZM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by PH8PR12MB6841.namprd12.prod.outlook.com (2603:10b6:510:1c8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 06:08:24 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 06:08:24 +0000
Message-ID: <dc562c68-5a3d-46e5-824e-b0d4490ad3d4@amd.com>
Date: Tue, 12 May 2026 14:08:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] media: platform: amd: isp4: drop stale list reinit before
 free
To: linux-media@vger.kernel.org
References: <20260512032114.292725-1-Bin.Du@amd.com>
 <6a02b2c1.050a0220.27c677.bdf0@mx.google.com>
Content-Language: en-US
From: Bin Du <Bin.Du@amd.com>
In-Reply-To: <6a02b2c1.050a0220.27c677.bdf0@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0188.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::10) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|PH8PR12MB6841:EE_
X-MS-Office365-Filtering-Correlation-Id: c049e5d8-9b3a-41c1-3936-08deafece033
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	WJcMzEcfLFTHyzmVcku3Obqd3Je64w6HbqEqCSCTGzYAfAnDVf8crONd4cpuXqHfEiQVyRPkniSqu5FHC2lx4uTLB3MqU4+NEhRRSVNzn5bFJhvHs4csTasUvabYtFh0rtVbAQbn0FSc/oHuah5bt+jReWDysxfdopdrFk7/h9zRzr9R3cLZtQ6FiQcOgrgb2nrzqgINgakMj0dnY0kjvc0Bz2SNUBSvytzZz+2c/DQ/LTOCV661G0WGZsSA3BZRfmePUByz277o/wQ0/zVA9Bhq6Le76UdaXKhg61sN0Bp9cH0FBaLqZA/WDreubtDXyahCs8i+6ysTjGzcrq3t/XFL9k8djM99YtRgxY/IB+LbnTbbWkERY9S529BO6KasgcyvubBSeqATdGqBMYYM9GGOG7ATkxnGw4gNWHvF6THwrDH3SQCW/BdLu2nxiS+Enynn9N4EfGr3PO8FrShmvAyFtbnBJEjAUZU0P2Wubb6z4FXcHh5I0f+XkW8RUskM+XOdfhhths2DYduFUuYg6YkIQK9FUPJfJFUg5xUarJfwLqhVKPo8XP4d6l8Y1Z70+dUrlWfhz3DBanxI9JiQbwfCUMO/Dh26n6WouZPOPhz/hQZGmGdnL6kuqQbDYwb9H4HMLOPwMwUBYNu6Wm7Gcw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rm9panVvMGJyOTF3TDR5WjlRbXQramlSNXBqN3JDTlExaUUyY21sSUk3OHpJ?=
 =?utf-8?B?WmllcmY4RklXSWFTMHJvWENJSVg5RlVMQzdac2VidzVhUkRudzY3a3F0VHh4?=
 =?utf-8?B?YkNTbERhZnB6UlBseXRJWmNkcndhamNreUMxcXJOeSttVENuRHhwR3EzMElS?=
 =?utf-8?B?VmpzT0NuQ0ZQM1dpKytHRGFyVjJNVWhHMjRYOUptZkhwakVHV25KV3Z5LzhC?=
 =?utf-8?B?NGc4QnU1M1pobTJGOHZVQ2lnbDBGSGdMQ2ErY1ltT1hUbEc3Y3p2TGs5NEto?=
 =?utf-8?B?R1NjNkJvcUIrNmx0QnA2M1ZoU1lFU1NjejRJbk5DaFh5NFczNWNtTXpnU0o3?=
 =?utf-8?B?STNXTEhrdGZmOWV1TzBHelp6ZXIzUTZRNk5uZjV6YWI0TkJ6NHVRNGtWbExO?=
 =?utf-8?B?RVRiSmFRV3VxTTVXaklHSDNhSHRDVkR3OWhoRUg4TGtrd0FpV3JYY0Mvd1p1?=
 =?utf-8?B?YXJ3MzE1OFRJVXBDNmh6b0lMcktHemt1WHRuNEZWcDZScjNvcitiMzkva2I5?=
 =?utf-8?B?OW9QTzJySFpVVXhERTY1L3NmSkFSSlBPcUIrYWpmMkdjQnJUOVQxOVN6VFJz?=
 =?utf-8?B?Sm5lT3NZakM1bkJjdTA1OWdGb3BuN0UzOThMcmFtdnEzVEF6cHpkVXNaWHhW?=
 =?utf-8?B?cEZTeStSOXVMOEo1YlE3RlpVRnJnYWhWdkl3WktsbXh3RzAzRWdGWU9sMFhO?=
 =?utf-8?B?RU54SnI1K3JxL0dlUVhKWVltaEt3Yk5aTTA1bURRNzRnenFRTzdwaGRLalB2?=
 =?utf-8?B?d21ZaUdTVHRuZFU1R1VncnR6ZWFUNy9JK1JrakJvalhQZ1pwQWZpY0d5R3pr?=
 =?utf-8?B?bklwY2g4OXdTalFPVi93VW8raTBsQU5IdlkzRnY5ZVZLbk9JaTBwdTlqbHRw?=
 =?utf-8?B?T2djSHYyTjZYZFlkeVlLeWZBa3BTZVRmWis0dmdmZDNIUGtxUFlJK1FVbTdD?=
 =?utf-8?B?L01zWTlsQlVydFhQK3c1VXg4MExNMU9seTdUZjFSa0NkOHBZMytNMVZmMGZF?=
 =?utf-8?B?Ly9lRDM3aU8zMTVLVEtFNVJzY0ZTblZPUUxSQWpQWFJXdHZSNHlnMDdQa2Rt?=
 =?utf-8?B?NTBnU0doWjU5M00veVNva2VocGRCMUlTV2FLYTE3ck4wUlBoVU9VQ0swSjJB?=
 =?utf-8?B?SktQcHdSaEF6ZzhLS3pqSUgrS0lCdWxWTjM5TXpDU3BLMVFkN25MVzFYKzlY?=
 =?utf-8?B?WGlDd3BSbFRXb3AyNCszb09sMFFFQ09hbVFESTBmcGE3N2p3VTA5T2VwM3A4?=
 =?utf-8?B?a2ZYNUxCeTVHci9RcFczYlVRV2YzNWxrWkl2OXJGV3BCUHFEQnZqUU5ob0hZ?=
 =?utf-8?B?YzJ1SHVqbEdiMm5EcCtoRmt5T3NTYjU2ampvejdZOURwYlkyY2EyNlNYMERT?=
 =?utf-8?B?aWdicmVvREpiNi9qWjJJUVJnSXkzMk8reFJpWE1qUkl2UHh2RVc3ZkhTcisy?=
 =?utf-8?B?TERzRUI0VzJ1d0tldDBCNFJ1SFVyVjg3dXZuV3A1UHduc0FKak9wM1daTnVB?=
 =?utf-8?B?UW9LTHF3REJyRGhLYytGRHFHZUVhYUthNWJSTlJLTUxPMXJWMnNJdnJjai9H?=
 =?utf-8?B?MFZYREU5bjZZMHBPYnhYWGtHak1PL2lWcXIyeXNGWStWc2FPb1Fqckl2Q1NJ?=
 =?utf-8?B?bm5XZ2F5bTZ1d2VnZDJ0Q2RreE9JUnFoSWZTQUFOMVFXOG9tQklqdTBCNE1E?=
 =?utf-8?B?VGc3T0hiZkVLQWZaV3hjUUFFWVJmV0RxSGNwWFR1S1kxSk8rcjhnRXQvdk9x?=
 =?utf-8?B?OFRGZnc5OG1CTGVlUFpTYmY2ZUlvUlVlbHJpZGl6KzFpc3N4cXVXWjJvSHJu?=
 =?utf-8?B?alZjbGtYU1FYSTF6RkFObzJTRkVCZUNXSnI2SUZ6Ym9FYmF5cXlsVlJFUFRU?=
 =?utf-8?B?UjhXQ0o0MjlyY3kzUVF5b0NiTE0zUC84OGJ4TngzOEdEazRWdTBVYUJzSUlM?=
 =?utf-8?B?TDRXNUtTZkQ0RDE4NFEycGRaM2hDdVFvZWZvOUNZWUd4dmVsYUNCdUUwVHF3?=
 =?utf-8?B?OUFsanJ3Yi9xSGJEMFM2Nk1UdHFjNHlUcWpxQWtMRTdKNnpDQm0vZDNmcHNM?=
 =?utf-8?B?a1BCTXdqekhHcHF4ZXh0Tm1od0VlTmlrbi8zTmNkMDJ0SVJZNmlTOVJySG9L?=
 =?utf-8?B?VnJZVGdvKzg4cytTeUtXeWdWNVJCT0J1WnBDUDgyY0tiN3poanJCeUpaZVQ2?=
 =?utf-8?B?ajhuT2tnNjFuOU02ZnFuSVFWZElKZzVkR21hcG5PRk9JZkh0anJyRjFXdXJn?=
 =?utf-8?B?TWQ1Y0tnZ05DR096S1VDQ1ZUaFlKY2Z2MGdZUkhxU1czeXNnSjl5enVkNHJG?=
 =?utf-8?Q?XSBaSLIZJ4k9uo0fFD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c049e5d8-9b3a-41c1-3936-08deafece033
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 06:08:24.4834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wXcC/W/Aj+ip3o7yYt3r27bd3MIDZiiy+T7ORCDCViKQoSvGkPPXWDBHifX/NN6N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6841
X-Rspamd-Queue-Id: 985A951ABE3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61204-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,amd.com:mid,amd.com:dkim,gitlab.freedesktop.org:url,pages.freedesktop.org:url]
X-Rspamd-Action: no action

Hi,

On 5/12/2026 12:55 PM, Patchwork Integration wrote:
> Dear Bin Du:
> 
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
> 
> 
> 
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
> 
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/99599428/artifacts/report.htm .
> 
> 

Thanks for the report.

I rechecked the v2 results. The patch-specific checks now pass:
- media-ci/checkpatch
- media-ci/media-patchstyle
- build-basic

The remaining failure appears to be media-ci/static:
https://gitlab.freedesktop.org/linux-media/users/patchwork/-/jobs/99602662

From the log, this looks like a GitLab runner/system failure rather than
an ISP4-specific issue. I do not see an ISP4-specific warning there; the
ISP4 files only appear as normal build/check steps.

If I missed a patch-related warning in that job, please let me know.

> 
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
> 
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> 
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.
> 


