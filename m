Return-Path: <linux-media+bounces-61049-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4E83KjCDAWoFcAEAu9opvQ
	(envelope-from <linux-media+bounces-61049-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 09:20:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF51509064
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 09:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 531E7300D4C5
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 07:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5D5334C1D;
	Mon, 11 May 2026 07:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gbhmL0LW"
X-Original-To: linux-media@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011000.outbound.protection.outlook.com [52.101.52.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B18C379974;
	Mon, 11 May 2026 07:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778483844; cv=fail; b=OyNGGYtYiHiGE+sb6D+LGSOy8JVeueMaPQPHwgTjEu+GBuWq/jGdjTfFzLBweWWWDW1Titb9kDJsov2MgGN9eLASqI6gIjLa12WsAI6JhpFY3dm6anQincnpFU7EzfU3hhIfOVMlWy+koRaWGRZHKouM/bNXAZP2B18PkQ5BWPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778483844; c=relaxed/simple;
	bh=kTA9ctmfJJxofi/z0+GCr/mVwkVyTYoPAuzeuROCNow=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FwfExllhjI6HDEs1O2YTxcRhhBWcHQ6k8qw1PoHFUYGizQlEc/z6WpScBlLpFx367cZfeig6+MzbbNREP7Lv1DS7qpe6SxhSHdoibEMQ+T5ht/tl/u0gx2iZ3nJzaQtKR+OlYmLapP4oGfzM6hCNrpjP5PH5fN6S2pXe0Vp2A3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gbhmL0LW; arc=fail smtp.client-ip=52.101.52.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dC/I6cxaioycJ8DD7ekNwCbTfLoYg2p7qBzaCJP6JYBX3VS0Q0rOYx/40j3iUCNhdfHqt2ircOp2q2yD9kstAzlOnu8w4I+gzxum3QCNSR9pyVaNfOq0+CWymr2tFdcb9steRg4xafVMxFWQNitePSTpiRSEo/jptocSoWfZpFHG86IzCi1w73nfpLRbeZuJRWvztWkVGS47jG2dybpyvQkv7EM6hqv4kkSq+KQ6iU2+0LZfJRG0U08PQFPpjzjniLH91iuQej02kC71t2JhE11/F3+++0szYlla4eMJdLXIQulsYOkOCH8EllZo6FuBhm2z2pa2qSSaIoHXQh8yAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTA9ctmfJJxofi/z0+GCr/mVwkVyTYoPAuzeuROCNow=;
 b=YEZBInJJXL4yyA3+d3X9fau6SYeqpCEP7K/grOT5lIuLXGVW2KD0pbjNsH4Teu9I+8ZU7DM7G/Ye7JwR604RytGfEBoqGi5ge6UH4tyfTrHxk1jGPLaSz/jq1qILyUzzuFrnU/o6ZbM6Nfgueluau/z1G8Z9E6U9juvPZvYVjw/r3DTjnRRbwekFSqJCiDGLlyriPM/gHNedk6H98SEXSE65IFvonSnAqlOPYmNJ2jbpsxmJvw39q2ffvqNaEvMz71nfRbtNje4pobzgyzGG9IDJUkGibCro3jIaHtEsKMngX1yZARH9xaL3CB0fr774H74TvYXWRk1A+ZzCpBAkWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kTA9ctmfJJxofi/z0+GCr/mVwkVyTYoPAuzeuROCNow=;
 b=gbhmL0LWaLaDS7eDYp9ziO4L2SafhshOEePFUZnwXiBy6m3yN8qO3O5BMx4Ojqhd4voFv0QovUxN+26RYLCKuP+iImr4BMh0bRrTQBiaJBx6RS3CkoJ1EDoDHZOc1iG6re+4vUdPNAKmpK5XCyYPlisVhWQotWmnsh8IhxHSjNI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by SJ2PR12MB9115.namprd12.prod.outlook.com (2603:10b6:a03:55c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 07:17:17 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 07:17:16 +0000
Message-ID: <24553c2c-1fe5-4ea6-8c42-bf6733080766@amd.com>
Date: Mon, 11 May 2026 15:17:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/7] Add AMD ISP4 driver
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 "laurent.pinchart+renesas@ideasonboard.com"
 <laurent.pinchart+renesas@ideasonboard.com>,
 "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>,
 "prabhakar.mahadev-lad.rj@bp.renesas.com"
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "sultan@kerneltoast.com" <sultan@kerneltoast.com>,
 "Nirujogi, Pratap" <Pratap.Nirujogi@amd.com>,
 "Chan, Benjamin (Koon Pan)" <Benjamin.Chan@amd.com>,
 "Li, King" <King.Li@amd.com>, "Jawich, Phil" <Phil.Jawich@amd.com>,
 "Antony, Dominic" <Dominic.Antony@amd.com>,
 "Gong, Richard" <Richard.Gong@amd.com>, "Tsao, Anson" <anson.tsao@amd.com>
References: <7d5d52bf-b0dc-47d4-8cb8-d6099fd05c57@amd.com>
 <470a9fbc-c4c2-4bde-a91d-a22f1c730b31@amd.com>
 <LV9PR12MB982900FA14329B742FF64BBE875EA@LV9PR12MB9829.namprd12.prod.outlook.com>
 <adSlwqPVF81feLHx@kekkonen.localdomain>
 <21dfb3d2-d838-4325-8a6a-6024b851cbc5@amd.com>
 <afpSBiF8sUqulE-7@kekkonen.localdomain>
 <21140553-f207-468a-9357-a0ae08aa28c4@amd.com>
 <f68addf9-eb16-4c87-b281-b4f1dcc4cc63@amd.com>
 <afxcirtLHxeiaqF7@kekkonen.localdomain>
 <bd5ab106-e0ef-47d5-aefa-7304ad84105a@amd.com>
 <af5WB7z6hfuHUS1P@kekkonen.localdomain>
 <0ffceabe-182a-4dad-ac62-665f089df330@amd.com>
 <CANiDSCtYQVCKfqNOV-H_CBFysxtM5UT_R=Q01+8A=j3Mr5=KwA@mail.gmail.com>
Content-Language: en-US
From: Bin Du <Bin.Du@amd.com>
In-Reply-To: <CANiDSCtYQVCKfqNOV-H_CBFysxtM5UT_R=Q01+8A=j3Mr5=KwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0027.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::14)
 To LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|SJ2PR12MB9115:EE_
X-MS-Office365-Filtering-Correlation-Id: 7abed447-8633-49c4-afa1-08deaf2d54b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|56012099003|13003099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qQWUs7BeXv8ozwpLHBdlEgFF+jFiOJ3U1F7GHzdI1kKt+007P/YW3CTgz1S09X98srq6pZ1iXBRWJYPwWbmNyUJTWyBXI0Yj/JACBg+XUI01A3CYyvNwQKbaWUadP7+6R9bdBmO88n1LoTI9kauHaRR991MvHWfrR1tJN+Ygbtt4hiSgqJlqES+HmrMlE+R6ay/lt8+tA1MrEgNEjxYTaR/WRhaa5WeLqK2qKDk9UfXivNLUxHQWbDR2j3ZIJZDXEMUWya83FIOOm6mH+HTuRG52UkkvGF9WwYmtH+qKgGfUEZmrk29kpAFEkYRCMIpIbbcD3w9jpvLSpCfuePmxOBhX8llxNG/r97Syh3PHGyEZAmh3+3ReXwNp8PflCjcHJYbJGWHx40Gj7zegclAkUUNNQyXJyjVYQdvXWosVTSi80ttL6GoFRuKBou5Q6R0ZOeycWH3QtRn69vgtSoymVhmEaAsFOH3R0XxDYJPnaBO3eW57MFHcpBC5rBszvWwFvGLlx++pc03/5Ddc4L5SdWvMENxIK83WRhL2IGONqXZZ8tVCsVWelRSjt7WD9JgIZSsVM3uRhD1RhBFLc37c+ZYRJ1eCvotjuZA0d/Lm2K4HrzARFwtoc6aWGUu6CpAfGh2e3Sc1P9FkRO4JOKZqdQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(56012099003)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3JHZGN3OEV6akpqTXNqOUwxU3lRM1IwSWlKVjc5dXFKSFB3N3ZGNC8vYU9W?=
 =?utf-8?B?UEEydU9YTGJic0FaQzJYdkhhZC9BbklYQXBVK1RZWkhKSlR0YjNiMzRxZkRJ?=
 =?utf-8?B?TzN4YTNBZ1Q2OWgyU0l5NnlNS056YkhMbkdoTUNVVXdRKzViYVgxdHQ5MFdE?=
 =?utf-8?B?a3ZuS1B4MXpKQ3dlem10dUJNTVAreDUzYTRjMVhFYmdUN1ViTlh0WE8rL1NU?=
 =?utf-8?B?bTVucGoybEI4dnBmN2hZOFpBMjRMazF5bXd2d1FISWhubFdGNlZhVGNHNFFt?=
 =?utf-8?B?Y2IwUzJSUWtIREU0bGxKcTVaRG1WSWxEaDZmUGdLSlV5Y0VsZk9GeCtiYlNo?=
 =?utf-8?B?dEpUMytDN3ExRlRHTklUWURVSC9ZeDJUKzhFakpkT1JjL1YzaGxJVlpGZXMw?=
 =?utf-8?B?S0FCTmxCWVVuVEZ0cTZnSUt6QjNScWhDREdjd2pwcEx6Rkhia3hUc2xiVXpK?=
 =?utf-8?B?YmdYTnk0Q2tWb2ttWHdWL3QzUGdPTzJlYUM2T2d3cm5tLzFia1I4T0VTY1pY?=
 =?utf-8?B?WjZzaG5yaXBVVk9pU2gwMlVFREw4S2U4WXZLMHNJWG8rUXBkWCtvdEd0bXcr?=
 =?utf-8?B?dXE0eGR1S3J4OUcvWWdveWVTZ1gzTDIzbnhXNWlCZHY2dU5pUnhkNmtxWmha?=
 =?utf-8?B?ZXIxZ3Jab0hzNGM4YWIrV1FnQ2hWcHQ1dERLRWdNU0g0SDUzRmJZRk5INnc1?=
 =?utf-8?B?bWxhSFFXR2FBbkpYNzVmeVc2SHRvQk9PSkRQenE4QXY0eHJoRlMxbVh6RzlO?=
 =?utf-8?B?V3pEdWl5dDJqYlN6M0JXazdiMjNsNm15NlpGazdyNkVFczJnTG5NQXFiNGF1?=
 =?utf-8?B?WG1JUjBnV3k3Uk82K1dZZDAvbHcxajVMb00zYjNxTVEyaDhDaGdRelg3SHZ5?=
 =?utf-8?B?REo3VlFDT1FqdDB5dzdBbG9BMldPZE91VXdJSlNQTXRZUjh3cVdXNFNKVXJP?=
 =?utf-8?B?TnBaNmFLUVhqdmR6YkRCSWJ0dDdrSHovL1IvN1ZUd0NvcGN0dThhZUM1TGRa?=
 =?utf-8?B?ZUVESG5ONGlCRUtBYnNHS1JRd1B3SVBURHplelRKOWh5bFI1U05XUU5GbkNi?=
 =?utf-8?B?Yk91NWw4WlZnS0VqdE5HSTBFMW1hbmNYRzF6SG5hQXRHaGhmNXl0ejVpa2JZ?=
 =?utf-8?B?YlRVbW1NVkprWmRsZ1E0TWRVSElxcDBualBqUDhlR0RjU0lTTXJESVFKMGJ1?=
 =?utf-8?B?QUdTU0pVbmxKN1JUUTM1VGxBSUhraFY4VlZnRDA3NXlNcFZMMEJIQS9wZjlW?=
 =?utf-8?B?MWNXZHA0aktxbERkY0gza21EV1JBWUx4WmQxOVh0WGZuayt2M0NWSGJDRHEz?=
 =?utf-8?B?eFl6d016NmxTMm5DK0FEaGtuQUd3WVNtNVB1d3duSHVxWXJ6OVpVZVhBaFlz?=
 =?utf-8?B?TFBpbzJid0s1aE1TWEJBSm9UZUdsUDUvdFVXalQ1NG5DTHpHV0VyWjZsZks4?=
 =?utf-8?B?Nys2M2RrNmxZWnQ3Smk2T0ZWcTVPUVpLTnBJR3pkM3VBYjh3czVyOTh5QjJ5?=
 =?utf-8?B?eUJibGhyZEZNY0RJemg4Ykh0dldxdVZXMUlyc0xmWGx0bnZZck4vV29EQVpw?=
 =?utf-8?B?NEpLcDZHWi9FNlUvUXRlYXVCYWhPdzkyVFB0VS9VODNSbCt3a05MMFhYa2Ev?=
 =?utf-8?B?M1pnb1pxVU1DVE9LZ1RuREw0eTJUemdUZXRmNGgxQzZxcGZlYUV1RnZ0Q0xj?=
 =?utf-8?B?WEdzMnhzV0RLRkIvNDAxWUlXL1liRXc5T0VIRzBZM3pWM2hJc1FTVmkzbmJR?=
 =?utf-8?B?OWRqUWxxZ0dmdVJkeEdqMWN6VyticlFUUHl0L043bTl3TU5OaGdQd2NncWV2?=
 =?utf-8?B?T0w0MXRQVjc2TSt4dzU4YmlkYXU2dzFPL2ZpUnA4YVBaQ3g4akRZVytOSTBU?=
 =?utf-8?B?SWtXbUkvZlR1UG5SY000OGhIcDIvcC9rMlA5T05RM3dqU1VieHRYUk93WE95?=
 =?utf-8?B?NEhZWWIyOCthYnJBL2pud3laWW10eTNJOVprYngrR2g0cG0zeTNTVll6dmRv?=
 =?utf-8?B?QUlmb3NsTHlXY21rQ3dEODhpcWJjUERrK1dqUFlTU09jcUpZUkJOMDVGVk5w?=
 =?utf-8?B?QVllUlduek51SWpqQzFYUFIyNWIzTXBRakx4QzFSMnFCb3NNMUpPNUFaSHJK?=
 =?utf-8?B?bE9nWUl1TExzUXFKa1k2UlJnS2hHSDgxSjZ1QTRzdStscVNlenJuNkx1dTlO?=
 =?utf-8?B?OUNpVVd6enpOUzJpblZEUlMwTWMyL2dmL3lBc3c2ZjFONVYrZmpWYkZ0cnBQ?=
 =?utf-8?B?emFQUUY4aU9xdzlITkx0NUYvZmlvbE5JSnd0QWRqdWk0SzNZcVd3bldGZXNq?=
 =?utf-8?Q?0TYZ2TGhfdXoIvdZyc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7abed447-8633-49c4-afa1-08deaf2d54b5
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 07:17:16.6282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3swuuXPF2jcF8eidm1TCsjCe0BlGCa4WuZnVM2dkqKi0Fhz5d5QLYQ2w7gYqrcz/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9115
X-Rspamd-Queue-Id: AAF51509064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61049-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,amd.com,kernel.org,xs4all.nl,ideasonboard.com,linaro.org,bp.renesas.com,vger.kernel.org,kerneltoast.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email,amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Action: no action

Hi Ricardo,

Thanks, this was very helpful.

In /media-ci/third_party, `git describe HEAD` fails with:

root@a3a5d0a55d48:/media-ci/third_party# git describe HEAD
fatal: not a git repository (or any of the parent directories): .git

So I tried a bit further. Under /media-ci/third_party/smatch, I get:

# git describe --tags --always --dirty
1.75-3-g9dcab8cc
# ./smatch --version
v0.5.0-9187-g9dcab8cc

So I assume /media-ci/third_party/smatch is the right place to check the
Smatch snapshot used by media-ci.

Regards,
Bin

On 5/10/2026 7:49 AM, Ricardo Ribalda wrote:
> Hi,
>
> You can check what media-ci uses by:
>
> $ podman pull registry.freedesktop.org/linux-media/media-ci/static:latest
> $ podman run --rm -it
> registry.freedesktop.org/linux-media/media-ci/static:latest
> # cd /media-ci/third_party/
> # git describe HEAD
> v0.5.0-9187-g9dcab8cc
>
> Regards!
>
> (you can also use docker instead of podman)
>
> On Sat, 9 May 2026 at 04:00, Bin Du <Bin.Du@amd.com> wrote:
>> Hi Sakari,
>>
>> Sure, I'll send a follow-up patch next week and Cc Ricardo as well.
>>
>> On 5/9/2026 5:30 AM, sakari.ailus@linux.intel.com wrote:
>>> Hi Bin,
>>>
>>> On Fri, May 08, 2026 at 10:52:55AM +0800, Bin Du wrote:
>>>> Many thanks for the update and for merging the series, Sakari. Once the
>>>> newer Smatch lands in CI, I'll send a follow-up patch to remove the
>>>> workaround. BTW, do you happen to know how to check which Smatch snapshot
>>>> Media CI is currently using?
>>> How about posting a patch next week? 🙂
>>>
>>> Cc Ricardo, too.
>
>

