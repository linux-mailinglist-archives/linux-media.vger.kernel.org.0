Return-Path: <linux-media+bounces-60738-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMjmFPk1/GmNMgAAu9opvQ
	(envelope-from <linux-media+bounces-60738-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 08:49:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC0B4E3B21
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 08:49:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BD401301C8A6
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 06:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9BC33F5B5;
	Thu,  7 May 2026 06:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2ECWyk8T"
X-Original-To: linux-media@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013018.outbound.protection.outlook.com [40.107.201.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028B032AABC;
	Thu,  7 May 2026 06:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136289; cv=fail; b=CQwZAR21eQBScyrQJyaB1p0PZjKGCo02ibnUQWiC7FxHL0M8JQkNFtF6MjKr2v9NZ6z9h5x+gCQYv98IeDYzXyAyI75l7oyb0vKvooiA5Zi/FXoJqOvWyOskBvBeWIBHzTWolB8/FLOdbHLoJBysnMw4iGYxugxgb3kFVPlDTOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136289; c=relaxed/simple;
	bh=D7wI89bSZVhaiyBFGouPYCA1f4trUv2fd+ocSR1too4=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L9tst5vbXL2JHl3YRMn2BuUBW0pjlyAUGy/F6/Ba0BUTDkvxq+ftBipuFOL1dHCYB8mwpM0s1SRBJSvlZezGwGbXegIKuwi4PxFahDQ98P2SLvQ/4OwIE7endiSQcRbK6rzCI2ZK28LNiXRTCG8QVOh2Z4iscLkQ5JvnP/xe8Qk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2ECWyk8T; arc=fail smtp.client-ip=40.107.201.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+5CJembnjsP/Yi10Ah1I71+E9QWo2d6nvx+hkUuqZ40Xq2i4SKWUD6n7JImHksoopsAV99Y2Ya9iGhem4ugbRY/PvcodTOYWaEryW0KOdmvAZUBimP9H8UM2++i2jxWbwVP8KwCkrqXNLIe+GVayXR0U13ok9EIqYJz3cyx4OE0ADOrmAsKCrvPj9/tpYpZk15eLDcpG4RuowFO9Icg7P7lhN3Rv44/81Yi3SAc98NcKKaLjuNYwsYLgY4R0h9lllqD7Q5/LHsmbMNrpAhIHPGaz8vy4wMvHV2DD98Yver37rSuw/3wliveOejcQQl/RdW9CtPcfyDHL/JBI72bnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8NqtjRUeh8+7KenmqTSPIumT6BD4MDVWz6u1MVRBQE=;
 b=OIZ72QvvsGy8eGkclKBbdyVJz//AwD6v1DMxUwWyx2t/Jhdd18Za900CmTC6HgPWVLMgQAqsPoDa8Cr00OKvJnWuPcXu7Czque+dV0Ur5rQzve6pBC9xaxRHdG9POqO3BF3Rq6Mwee+qbWkKnbIGJSHcgEk7/gTFZfW063YsyPqkr4lwzxGSJM6Savs3vEx1vSw5XNnadO2bhuzhAyy6ks8AOIb0XHRsxezYb+d5pcuFuKLDiuVyESUN6TMPD7bQlf9bbIGqZb2MW9JfU50c1cvUzZBy2mO/saNC9GnSdlvYi6vwAvki+g6+MLCnZ4DMWxzpsGPDyXlpASdINKlXYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8NqtjRUeh8+7KenmqTSPIumT6BD4MDVWz6u1MVRBQE=;
 b=2ECWyk8T3z5N5lCSkpzG9taH1pVnhedDHSOTPD5ZZdygF4840aPbq3OK/JPIkB9ABzpw3inodIGYg7QHOd6XEXN2A8aEGa0Wm35LUewaLrO2hPyO9RaQVHJAYzq2S+D+SVGsmdJpVSfUWpFBE1fFmdnrpMn6u0cZa1Iau/6i5/o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by DM6PR12MB4137.namprd12.prod.outlook.com (2603:10b6:5:218::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 06:44:44 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32%6]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 06:44:44 +0000
Message-ID: <f68addf9-eb16-4c87-b281-b4f1dcc4cc63@amd.com>
Date: Thu, 7 May 2026 14:44:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/7] Add AMD ISP4 driver
From: Bin Du <Bin.Du@amd.com>
To: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Cc: "Limonciello, Mario" <Mario.Limonciello@amd.com>,
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
 "Li, King" <King.Li@amd.com>,
 "gjorgji.rosikopulos@amd.com" <gjorgji.rosikopulos@amd.com>,
 "Jawich, Phil" <Phil.Jawich@amd.com>,
 "Antony, Dominic" <Dominic.Antony@amd.com>,
 "Gong, Richard" <Richard.Gong@amd.com>, "Tsao, Anson" <anson.tsao@amd.com>
References: <20260320084146.200988-1-Bin.Du@amd.com>
 <7d5d52bf-b0dc-47d4-8cb8-d6099fd05c57@amd.com>
 <470a9fbc-c4c2-4bde-a91d-a22f1c730b31@amd.com>
 <LV9PR12MB982900FA14329B742FF64BBE875EA@LV9PR12MB9829.namprd12.prod.outlook.com>
 <adSlwqPVF81feLHx@kekkonen.localdomain>
 <21dfb3d2-d838-4325-8a6a-6024b851cbc5@amd.com>
 <afpSBiF8sUqulE-7@kekkonen.localdomain>
 <21140553-f207-468a-9357-a0ae08aa28c4@amd.com>
Content-Language: en-US
In-Reply-To: <21140553-f207-468a-9357-a0ae08aa28c4@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:4:195::17) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|DM6PR12MB4137:EE_
X-MS-Office365-Filtering-Correlation-Id: 985c7ce7-8632-4958-bc11-08deac041fa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	DlCslx5jojXOdvc58KtivR895AShH6Q/8zKcHAoiQ4zeQfW1xytL0A8u/k/Z8rQ2nFT/G3ZsTTGE5v+wqdv+J7rJ/VLvlaYA2Q34NjiDfL9X1C4oMmwlE6vq8wBfg1lL++ARFBK0+DV+frKgy++so1NDIVb0oKHNiwn7ZXcZItwTr7Y6v/eBSKuzc09vlmnLr83N36GoK1lUCwc0TerliI60y4ZIW0MWWacq3ZRvUq6Qow3GjHrlVQdmCMc7JMZS/pBNGPMF5u0jXLBvHUR0A3fMNnR6TfnLEeeaM4CB/K1syxee8lNnYk75RbAyYNKlnKuS69HReknUkzbW1D9r0Tpf/oauj2jm1aDJ/jMGlspMIMwkpk21W1LKR1IHgTYysj/ddVx5HMLsFaEPwf3WXEgAnBhvjoxbNj37x8U35w6smpxLVrbv0jii7o9vI2Y5F/B3h8nEHCu4ouE3nFYm0JKnLlh5jpmeculKzSxYcK27aCSLfquV7BfO+iw3OINimJmHZ/SRMDP08OaKOBp95yJG0p8W9mC+TKykkUMpGcWe4km3T+0bxYmaUpQhKnYCnbByWH5SpNu8HdupPoUTzSYjtjnNbTf84oBFtJbeyKpkTd0cgcEBIEKfDOWXoeVfGLXz22Xmt3xFjO9qskQgew==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTA2SW9IN0d3Z1hic21YUXRQNE5pdVplN3Y4S2M3YUFUb0t0RUh2cEFNaXlp?=
 =?utf-8?B?UVduRytVcmVJY1ZnZHlDcnBPNEZBdFdNK282bHR2RlJRZTRxbjhMdjRiSTRK?=
 =?utf-8?B?eEdNbm1xbXpJYkhBREJPQk5UbndjM0VpR2VvUmxKUUhCaXIzNnpYOUNlWFlq?=
 =?utf-8?B?cHIvYVpGc09rZUNqZWVtYTRSNzY5WkFzVithRHB3T2dsTnYzcEZIaTRYRDBM?=
 =?utf-8?B?UHQwYTJ3RHpjRnFFTzBzSk9lR3krODFIaU9VMjdLVzdZSUxLdm5GSWdVelNE?=
 =?utf-8?B?WnIxRmdLSDRrRkZmenRpaWJqNVczRU9UWTVPL1hyWUdhcGJWMUpsNDM3Skdv?=
 =?utf-8?B?UkRzOE1Hc3pZOXZaRXk1d0YvRTFEZElJNG9uUFhodHRCWi9Od0tCbHA0Snl5?=
 =?utf-8?B?SHRBSjE1eTFkV05rb0FGMUkzSmlER2o5VzNkNWNvbTlGL3V5VXpZbndtSzIx?=
 =?utf-8?B?cWxuRXFqQ0xhZ2NzNWxHL1Nsc3hYaSs4anVjc1VJY01hNnVmcmpzZzh6ZXJL?=
 =?utf-8?B?Z2RkYlBjaHhocGtnbXkxdXVXYUplK0RqU2FETU5xeVdnQUxLNkI4Vk9OT0VP?=
 =?utf-8?B?VVZPdU91WkdzOVBGbUNEdC9waW9lSjB1VXR4Yjh2SUNkSWdXN2FTaWVML2ln?=
 =?utf-8?B?bWVMK1IvcFBFcHYwK1dsNU1vVUNVeUErNHkwdHJvcU5BbkhWR0VuNExVOW5V?=
 =?utf-8?B?c0pYTDB1TmhRa3ZSRDJDcjM3dk10b082am1Kdk93SXFSdWl5bmY3a2l1dGxR?=
 =?utf-8?B?Y3F5NHpqOTIvRkRrZGJzMVlETkxrWWIyVGtLMXJDSTc4VG1JV1RkYm1udUhR?=
 =?utf-8?B?SW5XWFQ2UUprc29vaEJKbTE3bnJhNmgzQkZsTEFPQ1ZaMzUwSTA4K21sUjBi?=
 =?utf-8?B?bzFqKzdrZVdvZ0Vvbm9TODRmK1h0aWZiNnVtNlkzTnhrNGpyMUVybnc4ZnN6?=
 =?utf-8?B?a0NRQ3p3cGx6WXNRcWxLdk1hVDlKWFVFQjYweWk2Z3ZCZzduOUNWOHFWbUFj?=
 =?utf-8?B?SkY2eThkNm5iM0ExZUNqOFhtUWFlakwyc2M4M0p4M0lJRUw0SW4xOE9vaXZq?=
 =?utf-8?B?RUhjRysvRm1TbU5uTWJZa2xVVHlJNzF4Mys1aVcrNWRZQ2tMOFVCNFBRbk5W?=
 =?utf-8?B?cm5PLzBGYzNSd2lRaEpkMlg3Wnh2N2tSbFNwcnFzSEFrZUY3bUdnL3AvcUZp?=
 =?utf-8?B?dlpWdWd1RTZXVzNaN0NvMjRqOTRvczZ2MURGT0wyNDN5QVQ1YWEzZDRPc3da?=
 =?utf-8?B?S0hUR1ZsVnBxTnJqS21JclBFeUdwUVFsQW83N0w1N3NoVGFMRW9nVHk5enJX?=
 =?utf-8?B?ZTcwWFREZVN0TUVMZnFzc1EyVGNpNFFWNkV3WVBNME4yMzZQRGh5ZkxoeC9a?=
 =?utf-8?B?L2JzN3FGcmNJakxtQnNyWkNDL1B2V3FTNytsTm9RUmYvYkdSdjhPQlJNc1ps?=
 =?utf-8?B?VWFpcU1LRmRMUUdWVUJ5MUlyalg5ZnVxOUVsaVVySTJTQTBQYVF3Si9WOVJ2?=
 =?utf-8?B?VGN4V3dKMjg1UFFxRWt0Yis5MjR6ZFBMR1FpSmtraHJjOXZOMW5HYnF5THcx?=
 =?utf-8?B?b0hUOWMrdndlbFY0YXQxS1ZoYU1MMjh4T1RyRThzVGxOUUtFKzQ2a0hTSUV6?=
 =?utf-8?B?clVvQWMyZ0JQU2RTMm85SjJJWnVGdXdlUm5uMC8yUTB5VmR5Mk1sRG9SMDZl?=
 =?utf-8?B?RWxwTjZUdG5CbzEzK0RsdVFPWFhDeTUzYU1wREdVSmkyRStPYk5VMDEySFJa?=
 =?utf-8?B?Sk5nbU02cUVLRXVxdS93SCt6UVlMYlBLQWdrNEpHSVpGeVpXZHVyRGVNMTAw?=
 =?utf-8?B?SWFMNUNQa1BzQjU5d1U2RUNqQUZwYmE2cGQwWDZKTzJHRm1pRENUd1FJeERs?=
 =?utf-8?B?bTlXcitWZFI4cUpJazMySXJUbC9nOElBTU8yZHh3cG51ZUJrMFk4SU80NFlM?=
 =?utf-8?B?dlVoRksra052Zm5BelNZZHBkd2FObjVGTGJySU5wUXhhb1krZ2pLdCtrRDZ6?=
 =?utf-8?B?c2NTMjI4L01VZXdHMDBYREl3OTJJS3JtUFdIYzJvVDU3UkpsaXNZSFVyMzdQ?=
 =?utf-8?B?UUFhUmJyaW9zOW5QbTZkNFFxNU1UcmpnTEExMi9JOTd2SEYvU2JaUWZZeW5s?=
 =?utf-8?B?NnpFL0dXZVVRbWp5YWw4T2prZDM0cVpFL2xXUHlXSTdpSFNXcmIzUWk3am9J?=
 =?utf-8?B?UW9ST3c3L3dhYkFmV2FvNVpnYlQwUnlNME9zOENBT08wZ2VzY1JNcmYrdEpP?=
 =?utf-8?B?TkMvRkZObTRmdU5zZTlNQmcwYU10MXU1WDRGeVJNS0dUNXJZOTVzaGkrTHFR?=
 =?utf-8?Q?kRucKAo/IsAKPrG25s?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 985c7ce7-8632-4958-bc11-08deac041fa9
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 06:44:44.5320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CPBYE05yc2qQre7dNJOhSchUsVlV/1XJ1Di9JTp22GdhuZFRSZVgrolzR911la5j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4137
X-Rspamd-Queue-Id: 4DC0B4E3B21
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
	TAGGED_FROM(0.00)[bounces-60738-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,xs4all.nl,ideasonboard.com,linaro.org,bp.renesas.com,vger.kernel.org,kerneltoast.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,amd.com:email,amd.com:mid,amd.com:dkim,intel.com:email,or.cz:url]
X-Rspamd-Action: no action

Hi Sakari,

I'm not sure which Smatch version is used in Media CI. Here are some 
findings from my local tests for reference.

For v10, I could reproduce the false positive with an older Smatch 
snapshot built from upstream commit 
URL:https://repo.or.cz/smatch.git/commit/bc575c7a0c5c7a2d4fefd0e1d8b0dc9ccacdd1a6, 
which is a pre-1.74 snapshot.

I could not reproduce the same false positive with a newer Smatch 
snapshot based on upstream commit 
URL:https://repo.or.cz/smatch.git/commit/bcc58b9ccf06d28ab6be4f0992bc74f462aa12f8, 
which is a post-1.75 snapshot.

For v11, neither Smatch snapshot reports the warning.

On 5/6/2026 5:41 PM, Bin Du wrote:
> Many thanks for the feedback, Sakari. I've sent v11 addressing the 
> Smatch false positive and the new checkpatch.pl warnings you pointed out:
>
> <URL: https://lore.kernel.org/all/20260506093250.93460-1-Bin.Du@amd.com/>
>
> Could you please take a look when you have a chance?
>
> On 5/6/2026 4:24 AM, sakari.ailus@linux.intel.com wrote:
>> Hi Bin,
>>
>> On Tue, Apr 07, 2026 at 03:19:20PM +0800, Bin Du wrote:
>>> Hi Sakari,
>>>
>>> Thank you very much for picking up the series and for updating 
>>> Patchwork. I
>>> really appreciate your help and support. It means a lot to us.
>>> Yes, that's right. <20260303224433.87242-1-kinncj@gmail.com> is no 
>>> longer
>>> needed.
>> The Media CI indeed does check there are no warnings from e.g. static
>> checkers such as smatch, and this lead to build failure earlier. If 
>> the set
>> would be merged, this same smatch warning would pop up as an error
>> elsewhere. So in practice it doesn't matter that the smatch warning is a
>> false positive, it needs to be addressed. You should check smatch is 
>> happy
>> with the updated code.
>>
>> While you're sending a new version, can you address the new 
>> checkpatch.pl
>> warnings, too? They're trivial.
>>
>> The best summary is here
>> <URL:https://gitlab.freedesktop.org/linux-media/media-committers/-/merge_requests/278> 
>>
>> I believe.
>>

