Return-Path: <linux-media+bounces-64370-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id heKpMwoOKWrwPQMAu9opvQ
	(envelope-from <linux-media+bounces-64370-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 09:11:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F1A6667F8
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 09:11:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=xpRXs8Zt;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64370-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64370-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB52D318F9C2
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 07:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A58538425A;
	Wed, 10 Jun 2026 07:05:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011018.outbound.protection.outlook.com [52.101.62.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F583839AF;
	Wed, 10 Jun 2026 07:05:25 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781075127; cv=fail; b=jKa/KhVcOfJ9DRlOrfamYM5Gogo7IDBP+r5IiAK53KIgOEgnPn/jAplDwSaL8ZvdALeKEA2cO0l+P56tM+1otg4R4poy31G0Q9mN98FNPhBlH6PJWD/rY6Bc/jWdXYLqMcuHYbkSEN0IKJuz+j+0sgPuyOsadzAWMeRDDYB4lDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781075127; c=relaxed/simple;
	bh=G+EbitmvzWg5enhw6EjkHan96FhORwusgA6ldVWwCgU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=S8SPPmUcq/rO6hHvskk3CSf3gNirHAAY6o91YTfeWMMA4D3bNEpGpJFcSC2CyXLlsI9KY4k5Azntcl7D5h/Z1R/3c01APwnABVj69Fe9b41CiFN5WgJKJAIWT964lgO+NI7CJg3NwxUEBXxktMzjzfB45rt0F+CrDg8rVzYfPrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xpRXs8Zt; arc=fail smtp.client-ip=52.101.62.18
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wC5gaRwugFgobAoTCWdjnvaFw5ZahNuTM/nnOT6KX/MSD1G0vYricNY7y1vS99ava03T01XuqX6A454WYigeSyjhL38goLJhSBlQwlHK+KSN8GpU6BKrt2XTSy4WWOrCIPvN3u+9JHLfg1pwqMmpM0uA15RyJbeCVDhln5D1B45iYhlFiqxss8Iuzm0bGEO3jTCeUruww2TwIv1e7kk2Ukul5h2KypYga5Ioix5QwGGuMOZCajOM/xgafD51FpVDGWeKDAf6V4+g/4Q2yA/iJJr558wvmVLyJzrUo1w52HGC9q++7zMzcNT13w895i0VOlySJfu+RPVY4jwAAbVMpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UI3tncPTi8BPTuOtb0LYX0hQd3bu6+ZfrwFLx8wrcU=;
 b=Dcf5wKXS9ot4tdy1yWhVeG8o4RS1ehsNjfusLSobe2+hCiCKlfng4P/sfdAp5lEW7HZV7kNpJmzWn21EvkOjm8T7aj7moePGCetehqiIDDwOIAsPkGb6Qnye6O6TaYQwhq3yNL/0vtvBls6e+MfUjlZTZTy3KRuJF92cgCP+3cFl++lAsULIkOlUV+Swt+01iLnVh5RpBpwrb7oA6DDu9HUW2M5HOo0t75UsCZXm+m2z+lLC5v68nkAMCFHBmfSRHpkAPjzzHImP9KcKCE7jnpdj03FcYxPf9B4Cy5dNg6IfQL0Sm8ylOXEhi+VOjsOh+DhDLxoeCZ3E/h9NW/Lldg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3UI3tncPTi8BPTuOtb0LYX0hQd3bu6+ZfrwFLx8wrcU=;
 b=xpRXs8ZtYT0DzY/FDERfvzMxQqgVOIXkAqu265cTbwjGbI6QPgb9RXnbue2uOTYiuaEZlA92tuVRMi3WQGAVVQelWxAVrhCCIP0pJHdMj/L2ueTapH/dL1APNXK/gITWYe8gTQJq4hDzomPaAXghwFNu30+J0ew2aiOCrePUL80=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB8598.namprd12.prod.outlook.com (2603:10b6:806:253::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 07:05:22 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0092.006; Wed, 10 Jun 2026
 07:05:22 +0000
Message-ID: <c78eec30-159f-41f6-b725-8402752f90dd@amd.com>
Date: Wed, 10 Jun 2026 09:04:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/4] udmabuf: emit one sg entry per pinned folio
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski
 <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Shuah Khan <shuah@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org,
 sdf@fomichev.me, razor@blackwall.org, daniel@iogearbox.net,
 almasrymina@google.com, matttbe@kernel.org, skhawaja@google.com,
 dw@davidwei.uk, Bobby Eshleman <bobbyeshleman@meta.com>
References: <20260603-tcpdm-large-niovs-v1-0-f37a4ac6726c@meta.com>
 <20260603-tcpdm-large-niovs-v1-2-f37a4ac6726c@meta.com>
 <bdce2488-fe77-4f36-9ed6-dd2c785fa7c1@amd.com>
 <aiMY8CpckM8Jav0g@devvm29614.prn0.facebook.com>
 <0c86f5d3-b5e9-4cac-aa9d-30c5c8ecca66@amd.com>
 <CAKB00G3opAoAYswsq2uz0Q6jgku8u4NthKOzCbSumZ0qK7QxcQ@mail.gmail.com>
 <a51e97bd-39dc-492f-bd7d-f137423277df@amd.com>
 <aigqFQWzPkiSh3ie@devvm29614.prn0.facebook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aigqFQWzPkiSh3ie@devvm29614.prn0.facebook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0357.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB8598:EE_
X-MS-Office365-Filtering-Correlation-Id: c9f7bbaa-e450-4695-b251-08dec6bea395
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|10063799003|11063799006|56012099006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	U9FM1uTIw9GGijuROFDG0oSAWEZO4ts2TW7shhHgPp0oo2WTeuuMJd4Pt6QU2y/O9zoJ5F4iGh+f+OMPTQT3HvOY5blUChNkKKQeWbUAflUfR0CBNWQ/nbsDZLVfGXEGoYkHP8aw+O9ysZPu9pz/d7dJhT04UBpwcta3cnwdtZrQLkFsTVIzjOxZMjhpzw5V4eyU2FC9qO07dsaLZWygI5EwEuNApX7XRF8/e0yrfJz2cTuyCikLEl1iH6ekoaXEBH+RhxEccmFVFPRTBagEdmHk20Y//2KBhnr8ZvzGsQwM+IqcMSwpqAmwceeNJaAjR1lBhiX2y8RLVk0mBrpvtSZzJJU0X6Eax3nUadZsSiR9aM3zZ2rsvYDLBBR/uO3bh4Yc0vqDklJy7eReNB81yttkmJEEDJ4okS9akL8prPKKTcLboAjtJruBA5/K+ayOp89VgEl3luPyLn66K+s8lXpoBPZG3LcEWxZuImKa024p9qZ3MgwiDw4hAQ+JICEmAT6A93r93zSCavUGpo89BHpYopGXV4iiv20P1Y79ERdbpz//jqdo4xE4sN+0xKzeyYpuBdYGGyDzVvj8dXHCH070z9KbqY2xnOv7f0Xke4Zf5FV5b1ImEITWbeuX5iyXzUSA8Ld5U+K0UYTsISc/gmY5IJ1OCZUTq0EmtAvB/aEJxt4twN9IKrvVNE3tJJw7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(10063799003)(11063799006)(56012099006)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEJDNStCY3ZCZ2Q1b2k0cWxhVVdSMHBPcVBCODYxRlNBa2lDUCtadm1iRFNT?=
 =?utf-8?B?Z2hMSUk2RTRTZ3hZUDdPc2xIcGQxTnZWbTRqblNVenZISER0dkpKSU83V2Uy?=
 =?utf-8?B?cktIcGZDWVkrcHVpUi9abk5jajJEbGtWZWlHWG5NVnZFMjYxUTRoMjFOOW9T?=
 =?utf-8?B?M25xdXFqMm0wY3QydUgxakw1UEdrUWN1WFR3emtMQXM0NnZGeEkwdXhlaVYv?=
 =?utf-8?B?bnA1OHpHenRUWXpVYXpkcDJCOTdVMm0zQTdESGFDK3JHTUt6ZjlVaFVNRS96?=
 =?utf-8?B?eUZNTXZoRHgwNk1Fc0ZwVTgyVmF1R0tKa29aaWd3RnZ3OUZMekJkTXY5NEJh?=
 =?utf-8?B?enAydXZGZW5hUWtUbElSSnRGd2cybzBYUVBiZ3B3MEw1ZDRGdzNQV2tPbmdT?=
 =?utf-8?B?U1U4cVc5dEZvaEVPYUtRL05haU5RL1dPRlVZK0pyMEtReUtnZTQvVFQ2MVBI?=
 =?utf-8?B?NmZLYnlNZ01RQkFSY1JaWEN5RjJkc0pkWkxKZmJ1b2lXaitNMTNSOEtIaDUr?=
 =?utf-8?B?blVpbzk5VnVOQWxHREhib2tvQ1pZZWJrOVh4RndqQjBoK0I0eVpGOXVBWGo1?=
 =?utf-8?B?VCt6UDBZdGZRVWlWY3IrUHFHOUJqU3kwRVV1dzJTSTN5ZHB2b3VFbVlTRDZh?=
 =?utf-8?B?cnNQWk1hMnhySmpWUURzOUU1ODNDdTlkVjZDZUJ4THZvN0tHUDhNVzRiZDhW?=
 =?utf-8?B?UlM3S2gySGl4WE43STBWL3UrRXNFckZuLzlEVEFCbkg2YWw0QWdYdVF3RmVR?=
 =?utf-8?B?TGNVV1M3MTVhREQrNDc0RVY4eXlIdTBYTnFLZE9Ybk5ndWptUEZiNldKaXor?=
 =?utf-8?B?Q05hVS9tWVlhZEVaVGJhdzMwVHh1aHJtQWpWT0dHOEdzS0RySnNpVmxzMXB6?=
 =?utf-8?B?UCtzeUJUbkozN2diNTVTemhFUEk4NExrWGY2Q3hJdXhjeTZ0UEQxUXB3M1oz?=
 =?utf-8?B?M3Y4WEEraC9KMDYvOTUxdHRHMXltOCt1SmZ3Q0FRNTUyemlKY3loOUVkcnpR?=
 =?utf-8?B?ZFNQQUgwMkptazIveU8xdTFqUWlxZXNVRU4yQmFSMDkvTXE5d2o1M0o1MTNM?=
 =?utf-8?B?cWFYdEdPL2htbGlaUXQ3VUFtRkZjMFBueVJVakZ1azhSWENwTUVnK1h1OWw1?=
 =?utf-8?B?OERTTmoydFgrbjZkUmNSdi9RRWZob2VCUU1ubEdoUU0reTJia3FHVm9RWGUv?=
 =?utf-8?B?U2lZV3BVQU1lWXRwdjVIMzhBWnNyMloxTjZVMmJkUHFmcDVHOEZlL1Rnd2ls?=
 =?utf-8?B?SzNUNUZZbHdyRjRxcEJydnA4MHF6Sk01VFhmcTdUR2pWeVA1eEV6ZmkveXVB?=
 =?utf-8?B?ZUpKVjYxeUFBTzN1ZHFMcVpYQ3loeGNndDRleERrSWNJVTJHUnFIWkpSaEVj?=
 =?utf-8?B?SW9ZYmk5dXdWcDQrMUVFZS9rRncyY1JLWjVYUjdtOUU3ZC9HYUNLK21PVHZr?=
 =?utf-8?B?LzRWejVXV3E1NkNYYkpoWnBjZ2lMb0xudzZGTWI2SUZTQjVXWFYrY1dqUWZH?=
 =?utf-8?B?NWZiTTc4QTV1UWFaR0MyTGM1NCs5b2dnejZsMlFkVDFycTMwdmNRdmNJcnp6?=
 =?utf-8?B?VHdJSWdsU0I0SDlkZ3BqZFh1b2Q1djVSdTNobDMydXBkVWo1aGdneTZFcmxC?=
 =?utf-8?B?SXVjT21BZjBWTFRkUlZaaDBiMHZiQ1lraHdaZEwyRnFZVnZnQ0xJUGl2ZVN6?=
 =?utf-8?B?NDlxSDlrRmd1UWFjOW03RXl2NEJ5UEV5TmRkNk1BWTdMV0tCOUxodVdSQ0lT?=
 =?utf-8?B?MUN0UHRMdE1WSDNyTHZsdDNYRytlUTFqWC9VOVUwci9xRHgxQ1BnanVXdkJ4?=
 =?utf-8?B?RlYwSmlNclBGdzdTOHk1b2trOEZtcUxEakJweGhQVUVxdnhiWU02a3BPcDJy?=
 =?utf-8?B?Y1RpQ2JJTFI0eERkaUQzVEp5c20wUFNDa09KcSt6R2dPVXB5a2xhWEE2WjI5?=
 =?utf-8?B?Z09aTExnbUgrWVVoalp2YXBRbVJmODNuZEhWbzRnUkdBSkRaRlU4NVNUWTF3?=
 =?utf-8?B?eUpydTkxY2xEdVNvK25SaUhyc3djNm9HV2p5TEV5ZXdjeUJnODFtOWhqbi9W?=
 =?utf-8?B?NlV6N1RSSklzYzFsRkJkSk9mcEhadW5TWFRCR0dFb2JkaFdVZ3p3NFV3c2Ri?=
 =?utf-8?B?MDZDZDBLTXBGT1BUYVRHM2NnY1BRQVRoMy9ldWlSZGVJdkNDNEdQWWRoTzlV?=
 =?utf-8?B?K2ZwVEI3bjgzd1l0QmhLRzVRZ29QdHdNZTRyM0ZBUEFBeUZHV3g2dVZUYnB1?=
 =?utf-8?B?NzRTV0JkT2ZZaE95QkxkN1Ewb1poa1dHaEJvclBHSUdnRXBONDA4SlpVQ29v?=
 =?utf-8?Q?QC24X2X0/kQBnG5rJN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f7bbaa-e450-4695-b251-08dec6bea395
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 07:05:22.5788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +jcpW5n71EkJnjSrLpPbEVLknf/3YNE0O8pZQe0UKv4Ww45oXdr9BpIzkalxRg/j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8598
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64370-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bobbyeshleman@gmail.com,m:donald.hunter@gmail.com,m:kuba@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:horms@kernel.org,m:andrew+netdev@lunn.ch,m:kraxel@redhat.com,m:vivek.kasireddy@intel.com,m:sumit.semwal@linaro.org,m:shuah@kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kselftest@vger.kernel.org,m:sdf@fomichev.me,m:razor@blackwall.org,m:daniel@iogearbox.net,m:almasrymina@google.com,m:matttbe@kernel.org,m:skhawaja@google.com,m:dw@davidwei.uk,m:bobbyeshleman@meta.com,m:donaldhunter@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,davemloft.net,google.com,redhat.com,lunn.ch,intel.com,linaro.org,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,fomichev.me,blackwall.org,iogearbox.net,davidwei.uk,meta.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,vger.kernel.org:from_smtp,meta.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70F1A6667F8

On 6/9/26 16:58, Bobby Eshleman wrote:
> On Mon, Jun 08, 2026 at 03:59:04PM +0200, Christian König wrote:
>> On 6/8/26 15:55, Bobby Eshleman wrote:
>>>
>>> On Sun, Jun 7, 2026 at 11:42 PM Christian König <christian.koenig@amd.com <mailto:christian.koenig@amd.com>> wrote:
>>>
>>>     On 6/5/26 20:44, Bobby Eshleman wrote:
>>>     > On Fri, Jun 05, 2026 at 11:30:07AM +0200, Christian König wrote:
>>>     >> On 6/4/26 02:42, Bobby Eshleman wrote:
>>>     >>> From: Bobby Eshleman <bobbyeshleman@meta.com <mailto:bobbyeshleman@meta.com>>
>>>     >>>
>>>     >>> get_sg_table() emitted one PAGE_SIZE sg entry per page even when the
>>>     >>> underlying folio was larger.
>>>     >>>
>>>     >>> Instead, walk folios[] and emit one sg entry per folio. When folios
>>>     >>> represent large pages (as is for MFD_HUGETLB), each sg entry is a large
>>>     >>> page. Normal PAGE_SIZE sg tables are unchanged.
>>>     >>>
>>>     >>> Required by net/core/devmem to support rx-buf-size > PAGE_SIZE with
>>>     >>> udmabuf.
>>>     >>
>>>     >> That doesn't explain why this is required.
>>>     >
>>>     > Sure, can definitely add. Devmem currently requires dmabuf sg entries to
>>>     > be length and size aligned when it allocates niovs for NIC page pools.
>>>     > Though udmabuf is not violating any dmabuf contract by emitting
>>>     > PAGE_SIZE entries and the above restriction is probably more a
>>>     > shortfalling of devmem, by emitting a single entry per folio this patch
>>>     > allows udmabuf to be used by devmem for large pages.
>>>     >
>>>     >>
>>>     >> Please note that accessing the pages/folio of an sg-table returned by DMA-buf is illegal and strictly forbidden!
>>>     >>
>>>     >> Regards,
>>>     >> Christian.
>>>     >
>>>     > It seems both devmem and io_uring zcrx at least introspect through to
>>>     > the sg-table to build NIC page pools (not accessing the memory itself,
>>>     > however). Is there a better way?
>>>
>>>     That's an absolute NO-GO! We need to stop that immediately.
>>>
>>>     Touching the underlying struct page of an DMA-buf exported sg-table is strictly forbidden.
>>>
>>>     We even have code to wrap the sg_table and hide the struct pages on debug builds to catch those issues, see function dma_buf_wrap_sg_table().
>>>
>>>     My last status is that the NIC page pools are build directly from the DMA addresses exposed by the sg_table.
>>>
>>>     Was there any change I'm not aware of?
>>>
>>>     Regards,
>>>     Christian.
>>>
>>>
>>> Oh no change, your mental model is still current.
>>> They just go through each sg and use sg_dma_address() on each.
>>
>> Ah, thanks! That was a near heart attack :D
>>
>> Yeah that is perfectly correct, question is do you then still really need this udmabuf change? I mean the DMA API usually merges together contiguous DMA addresses.
>>
>> Regards,
>> Christian.
>>
> 
> Hey Christian, sorry for the delay I justed want to double check what
> I'm seeing...
> 
> I reverted the udmabuf patch and confirmed devmem still runs into 4K
> pages even for hugepage udmabuf. I see that the dma_map_direct() path is
> being taken, which if I am reading the code correctly results in the
> sg_dma_len(sg) inheriting sg->length directly (set by udmabuf's
> sg_set_folio(..., PAGE_SIZE) call), compared to the iommu_dma_map_phys()
> path which looks like it does merge when possible.


Ok that makes more sense. Yeah something which could potentially be improved elsewhere.

Feel free to go ahead with this patch as a workaround, just adjust the commit message and maybe add a code comment why it is necessary and helpful.

Thanks,
Christian.

> 
> Best,
> Bobby


