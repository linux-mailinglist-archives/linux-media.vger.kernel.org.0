Return-Path: <linux-media+bounces-60985-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jc6SIDiV/ml5tAAAu9opvQ
	(envelope-from <linux-media+bounces-60985-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 04:00:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E28AD4FD7B8
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 04:00:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7A7130221EC
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2026 02:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B50C286891;
	Sat,  9 May 2026 02:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="L3+k/UuL"
X-Original-To: linux-media@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010061.outbound.protection.outlook.com [52.101.193.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E896140E5F;
	Sat,  9 May 2026 02:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778292015; cv=fail; b=e9eO23B+9TbzNCXPqJgDAtKEgPv4oPOrUyfDlB90AdWN+UifsuohQ06s3dV4HBwTZOPGOST9z2Fj0eGWsvHT/NWLbn6gomT03w/MDNEnQOOryUn4f7y1hEI/JRIFzmjXCK/Qr8V/Y+D8AG/75r+D2GPNyTGp0fzhRjFvzYAs78A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778292015; c=relaxed/simple;
	bh=Jw4v9XYC0Xx/pZJT5kr8Pf9I90Xpo2fg3DEjbx0tYSs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WzU2cYe8fMhKofoMNcpABZbDIuH8oDwwA/xjEJz2vDnJxQDbg+w3TWubqthSO6GO8OtMl0HF7WGUyNW3gK3EMrMXVwhlT7uv5yXssqOAwErwScHshIxR32ftq39LMs5aeVNWmFKewzVpkJJxeML32A0mPowqbvMhNQpFD1pw9Rw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=L3+k/UuL; arc=fail smtp.client-ip=52.101.193.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yu4vIp27YYKKxQ89wWxXw1SwxrGN1biar7IdjzFftWamQ4UNyeIIFr6+4YJ9ww5mAg6eNd29KupngUxlftjLLb4AcTmvI0uCBuPnJzTtz9h6T6cIAUQiNMsesLarxuLNUqWDeVXydBuQOSTrnuJ4UYGdqHkXeZA9vi4uXoqRNu0JdwfutpEbky9VHxwX9Zvd0jDVnCfVbRe5ORh8yZR5V1x8nbut95KiXvOcuswefXF4WjYNcTvZ7DGgx9qv0Gh6U382D53tzX02mGBzY4prSXp17NzqD6basdRUcvuPSq1uqxrddYwXPCFts9fcP+/EiD8dXCup7r8i3+UhPTzzXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jw4v9XYC0Xx/pZJT5kr8Pf9I90Xpo2fg3DEjbx0tYSs=;
 b=KbZmoQggsGctDkGxEowm0d51KkJSCibX8FiaAGH6fhS1VqDEvkS5QlOmEuUQv2H4w4HBZ3IeBkYIitPOpMsUqHnDUFWxrlY5/iaUOIZFuOh5EKMp5+DxKwK/O4nc8QVQHOHs4gUpoBiSfD4b56KxfU5wgvLDBoCcZ1nI/KnB+x0QAOauUb8I8Y2vr4uyfGBjddQNDasvjcm2k1grn7xDofDBpo1bAgeiSQ6z6q9J4tY/VEWPuggbfRlAt2EtNGzKgKxsuWAEOZbSrGxi47DYIlj6XZeyCyIzSoAM2JIC3awwlhK5A7G86fR2+7z5isxot9iLh8wCeMXEttjplukxGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jw4v9XYC0Xx/pZJT5kr8Pf9I90Xpo2fg3DEjbx0tYSs=;
 b=L3+k/UuLUpFQ2+ypcsHU1755Xyfj0Pq4RvIov2dEL5RTXaLTjNd05QZ83BIpq+0imJU1pWYEW1iSkYkdllXuJkmbyJOKp66ZYpBAS4/CtH4G7BO4nPk7bm+fcqGAE3x6Jhs5uD7W9yndM3L4fV6LMHzo4RhOg2YxEsnK7PVom/M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by DS0PR12MB8503.namprd12.prod.outlook.com (2603:10b6:8:15a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Sat, 9 May
 2026 01:59:52 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32%6]) with mapi id 15.20.9891.019; Sat, 9 May 2026
 01:59:52 +0000
Message-ID: <0ffceabe-182a-4dad-ac62-665f089df330@amd.com>
Date: Sat, 9 May 2026 09:59:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/7] Add AMD ISP4 driver
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
 "Gong, Richard" <Richard.Gong@amd.com>, "Tsao, Anson" <anson.tsao@amd.com>,
 Ricardo Ribalda <ribalda@chromium.org>
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
Content-Language: en-US
From: Bin Du <Bin.Du@amd.com>
In-Reply-To: <af5WB7z6hfuHUS1P@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KU2P306CA0004.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:14::19) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|DS0PR12MB8503:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f987291-cda7-44e1-f04d-08dead6ea8c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	IWR4lR90xXswvEJHfDoRNuphC8RA7j4rPYYJ0kMGWXbfEVagcXz+uhsw9NUnuyoNkx02bl+25OuNzr4mxHSqtRvTApkcB6Wb7ucINfCX2WPpiAEeHRxJXU+r+MBb1RAf8jaHUGD3MzBEBrct0ckUoUyQw6lmg/o2JD8yObXGj7k8ttq9zIcGRwjdPwFh4SMvfnyfd2pkJfMehnxawujClA+ysNFYp+HFxJGdN4o7iheVl5uPN0LELuTQ/FoWKn10pSV8HY8L2igkx5K86oE1F8EF49S4qdy7+0r4iJ8Xq0ppFFW10/kYGf+bBnx70cAnsojhQmz+3nZhYNBtUnUQ050GLyYFE+Y6jMK3OxrMdg+a/zD070obNI+azlSOVZeuTQj/S7wRSwRLt+W9czY1uVoveDE0eDvmLJhPuLuCu5ivz+wI2d0SimEHfUOapk8wK4eoUdKHTYRRa19dqLDwaXwaK0yU/9V8AHgfV4g1x/IecpLFZGxMnDj9bMnfLqr6moBDHP5HtxHxtGdZ6P5IvDWQza5/yOrupxEZe1aFovcyfHqp43qI88lDLTPs+pCOL9PeX8FtD3kZ54KSy8fU/q2uVYrvJsij3ZQfs5LQTZkQSb0jKACxOds8kvijCSd0SljtktYEGVBRFJUVK5VjKL0OAh/9bRm1zwx/7iNznMKGd+MZ76EZSanrzpLSfFH7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnQ5QWY3eTdQWmlmYnJLY0dCQmtKUEhtZWpVOWNYMUV4bytaZC9JL09nck1U?=
 =?utf-8?B?R09NbXV0VC9kaGtWY2d6YmU5UDliTWZhcWwxRlVTc01GWi9kT2h6aWRuS1Fx?=
 =?utf-8?B?Mlg4THQraDkyeS82VFVrajN1Z1FYQ3NGQTROWGYrUnRwMndJRE9YOElNN21O?=
 =?utf-8?B?MXRUM1lET2Faby82cnR0dTNpSGZxSXVsSFpkRW9FelpyR01uNW9EckNLeEla?=
 =?utf-8?B?dHpGSXdhVDdxLzAycDFxQStSVnVRaG9TamxBcDEvYkc2M0ZtVTgyampxUnYv?=
 =?utf-8?B?SFoxZEFyNHpRTHIxcnc1N1JVdjBySUlFWEZEbFdJdFo5ZTVkSDI2WVd1Yk1x?=
 =?utf-8?B?cENSQzVQcFZORmFJQU9KcDVKdlczZ3k1VlBrcWdKekNpU3hHTDlWUWU5T0Fu?=
 =?utf-8?B?QW9sZ1RaZnoybExZOW5WYUhwc200SW03T3Z3RG9QQ2FkVXF4UFQvWGt3a05N?=
 =?utf-8?B?SVlUK3B5M2hZUVlmUEhXQVRUUHpLQ2p1czRoOVhKL2d6amJZWTlzZnVhQzIy?=
 =?utf-8?B?cHVFMTJkbmQ2TnJuY2tJMDB2K2h4NFcwOVAxOWdTOHVKdE1TZmg3cC84Q3hE?=
 =?utf-8?B?THNnYnkrUjNSTHN1REpxS2l2K3locHAvcmZnVkNtMjltVlUwRmZxNVdrajAv?=
 =?utf-8?B?c1JRSGZ2cVRHTUhXZVlkQ2hHLzRrZkNZVERhSXVKU0t6c1gwR2ZrdUU1TUkr?=
 =?utf-8?B?Q0lrc2FWNDFrbzY4cjAraUp2L0tZbDdKYlJONFgvQitHMGplOGVIZXZEdXlw?=
 =?utf-8?B?NGMySUpSZnVtaHJkcGRsbTJJeGg3Sm9PdENMdHcrZXlURDFvdmE2bG04b3Rn?=
 =?utf-8?B?TC9JdHhSL1dVN3djSENSYVM0VERFcndXY3B4UUJNUFN1ZFZEYW5MQy9CNUZv?=
 =?utf-8?B?S3lpNjdSck0vdUZkaVc4NjBVb0d3SEo0WEpzUXZ0V1UzYk9ONThobjJRV2Z4?=
 =?utf-8?B?cnovQ044c1B5L2lnUGZSM0hnZFVwQWE1K0JObVdkQ3U0UnBER0tTaTJBUlZK?=
 =?utf-8?B?YTJPeXN0b3NTaXVZS3I5a0pSN2p0RDZOMUgwL2NrZTRzNWtDWFNqYWRETlIv?=
 =?utf-8?B?SEFCZWlwUDhNbFNqL2cyTlpEU2svMExrSWh3UTMyUkJYczIxT21uWUtQU1pG?=
 =?utf-8?B?cHVna2gyU1BXL2FGSW1CNlQ1TmVDK05jQ0w0U1FDajVYSnlGclNmUVpBQWRF?=
 =?utf-8?B?TmluLyt1RW14MTdmU1VoZzdSK2plV0ZhbmVKVUhHYmw2ZE5PNXhTYVI2WHVD?=
 =?utf-8?B?MlJOMlBCVHhwTEdZdCt4Tit6TUJlWVR2QWlIclI5c0cvVkU2dlVXc0ZXNzF5?=
 =?utf-8?B?SVpsMzU4am1PVzhJczRtcm14bytZamNuTFdIU0IybnNRTkRLVHljZGNSUnNN?=
 =?utf-8?B?R0NhanlsQ2ZVQ0Y2amV2Z1pkZG1NODhqYzJBREExNzBHMW9NbDBPUWFWeDFC?=
 =?utf-8?B?cWRlUzNtYkRTRXJBZit6QVVMVnB1a21pRHVOYUErMVFQRStUM2ZRZDVlM2R1?=
 =?utf-8?B?WEhGa3c1MUMwODgzaG1Na3k4ejJrR1FBTGNUUTN6VEljcm5jOGRXSGpFL1Nt?=
 =?utf-8?B?SHpyZ2p0T0R5dHJ1OGhYdGtpN0U4TW9IU2crcW9ERWxrNWVwcXZManl5NlJX?=
 =?utf-8?B?Z09jYUtzaVV2Q2FzOWJZLzZEbHU5SS9GRXdocVFSbk5YMmlVVDFtVWZiUGpE?=
 =?utf-8?B?aG9WZVBtV0pXTzJoVHRON1J2NlJjSjVaT3h3SWc0ZEszTHdocEY3eFpISC80?=
 =?utf-8?B?dFFzZUdMOVNDeEZxK0t4amt2ZDduL2svMForM1lna0RCbFgyQzJBT1RETG1E?=
 =?utf-8?B?WThiazN6aDVYeWs3Z2x4eG9QUnRKdTZmRVNEbzljdGxLZjl6QUl1MXVjM1h4?=
 =?utf-8?B?aGhzc3ZEZGp6SVBqVXZpekNJZVdqWUNzQm1tTW5Ia2pVQU1LbVQwQjVmdm1U?=
 =?utf-8?B?UXRncU44K01Mbzk4eEVvRVJKbzZHTnhWVkl0cGJ0R09QNlhQWmV0eERYU1lI?=
 =?utf-8?B?a1l3Z1NLSGlIbXVIUVpiNTRKKzNPU3JoaERwVTNIUUtFZVo1NWZwMG5EUUI3?=
 =?utf-8?B?OTQxRkZPaEh2NThnVjlkU1dmdmVHb1BSWXBPNEovL3AzK3JHVGxIcm5oNDg0?=
 =?utf-8?B?NkIxMlIzMzM3dWxaL21mbm9tdUZiWVQ5aTB1N3JWT2JYVTdPWXNTVEUwc2FD?=
 =?utf-8?B?N1U2a0k3MGVyVng2Qk9UTGs4N3VodlJrNUdRS0hxWVY1SXdBL1pDNzVTajE3?=
 =?utf-8?B?cm1LOW12dzl0S3B3aDlQc1pmaVR6aENDNi9PMTl2NTdsbnFQekFzZEsrU1BN?=
 =?utf-8?Q?W0rxzkis0BXH0zsXNr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f987291-cda7-44e1-f04d-08dead6ea8c2
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 01:59:52.5843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FavVjqjGfzd3bHYxgd8JWpIYn0oXQhRgsYU33FqW02unK8qvw04ro9MNXh+2MAh4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8503
X-Rspamd-Queue-Id: E28AD4FD7B8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60985-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,xs4all.nl,ideasonboard.com,linaro.org,bp.renesas.com,vger.kernel.org,kerneltoast.com,chromium.org];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Action: no action

Hi Sakari,

Sure, I'll send a follow-up patch next week and Cc Ricardo as well.

On 5/9/2026 5:30 AM, sakari.ailus@linux.intel.com wrote:
> Hi Bin,
>
> On Fri, May 08, 2026 at 10:52:55AM +0800, Bin Du wrote:
>> Many thanks for the update and for merging the series, Sakari. Once the
>> newer Smatch lands in CI, I'll send a follow-up patch to remove the
>> workaround. BTW, do you happen to know how to check which Smatch snapshot
>> Media CI is currently using?
> How about posting a patch next week? 🙂
>
> Cc Ricardo, too.

