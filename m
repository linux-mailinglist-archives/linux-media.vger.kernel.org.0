Return-Path: <linux-media+bounces-38658-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FDBB15D77
	for <lists+linux-media@lfdr.de>; Wed, 30 Jul 2025 11:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1435B564AAD
	for <lists+linux-media@lfdr.de>; Wed, 30 Jul 2025 09:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B8812777E1;
	Wed, 30 Jul 2025 09:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="o5qIpDnx"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2052.outbound.protection.outlook.com [40.107.101.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE38269AFB;
	Wed, 30 Jul 2025 09:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753869252; cv=fail; b=Ejdzos9aC8Mv5Q81j13VNJzc9Vg116iiV+gXWkqn+oscA6Z1GgqgQcGvvN0N59a8FldWEWaIOk7hn5Lcn/cOPat5BLd5yPHLFnf/RcGHO21unJ5L0uYb8JLVb9uTK/MnUsHlu06w1u8VQ0sxZYh+7/ZXMxwLtNyr1ZA92y8Ekis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753869252; c=relaxed/simple;
	bh=utF7qBGQzvPEneDb2Ainkvq4ugZ4HOpgKsoimUX2yNg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CoUTkfu95EcFxt+E0qn+TdFuLB9Vqv8WVyBc+02f0RgVxAVdU93RyFhzdMfUwbsN3rDrz3jQUNBuADXkuInTc6aWHdzmRJpDG2b25a2Ei6ucbWT5Z8Y4pFQDxs4iyUSeW1z3lWkdob9u+5zfGWU7VLaG90/Ep0s7Qn2VSXIpeos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=o5qIpDnx; arc=fail smtp.client-ip=40.107.101.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dBxXbocBVresbXZ0tcAtJiEuA29qaCgvDgAZsIW7WgqnpEiIrZXYvVs2eNv9mhh7F9Iqb3MpHpdq15HB8e11FXKWScRtNcLgG/icP8yiLqkTWKXe6kHaLVK8PCPLz/XcCFBkWd4tmcLKjvhBKmam/iX5MA5x9vrn8H9hLQDCuOjOUa+2A+0YrakxlTIP4hRcKpwxgktvN3RZWGhK/vOOgJxr4kl3515PS3rLO1uJdvqhFc8EjIEnOKjNjzKiFs6vXBxuAeiDu4tBWDO0Z/FNA3Zft5tlJ9NFSjnZK3R3pwry07qpy0MiHT9RLsU/+823wOzXcMmvYMEYP+avewb4WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQH3jlZBlNtansmRO5RB3CQNHovTUrqpgQJrhHdffcI=;
 b=DZP3Eduwob7x7ScxZ1jOYqjwg5lcaOfAPjUuw+iAqQ3IslKTzVsrt2Un2pLiDPJ06edfbcQiGUdbTpeIvQfFJaZ99vsmpP34hMOsc/qjWluJrd6fnFgxanyoskGGGS0SJkGO/tud7vgdf6lQN1JEDjvfn49ammHNDh92B1uHBYgaoOyLpKlB3mwGBZzE0AvR0ylonPfQ98YgTYFyJ9Y2yV0RpGA33o7u5x2ckPBo2bgblKZRC6EIhKucEXLICMfBwgYYpYd0QbxXJ3x0TlSexndkIEkgGFaHQ7Ja6rcSFDYAZC0wWAYYMlu3+LeTozQz4Da09fD8Z5pMiDuo0u4fUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQH3jlZBlNtansmRO5RB3CQNHovTUrqpgQJrhHdffcI=;
 b=o5qIpDnxty+Yw7I4+Etu8X6m6rQrDSYdXQQJnOD7j/6NhwhEum2DZq/AWVfptPfYiLoflJQn9aba5/vVAde/LoPSbnl1KrF+scedEw74WYaEcad5RLK3YADp/XeSa9IuMbOHiK632Kgegwz/+JLP1MiLd9aRaSrEmj9UtaCo8Y0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by SN7PR12MB6765.namprd12.prod.outlook.com (2603:10b6:806:26b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Wed, 30 Jul
 2025 09:54:07 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%3]) with mapi id 15.20.8964.026; Wed, 30 Jul 2025
 09:54:06 +0000
Message-ID: <a3272335-1813-4706-813e-a79a9cabc659@amd.com>
Date: Wed, 30 Jul 2025 17:53:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] Add AMD ISP4 driver
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 bin.du@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <aIEmJXNpNN0QF233@sultan-box> <12fb4d09-6b94-4f54-86b8-8a3ac0949151@amd.com>
 <aIVXVpg_9XxRXUAH@sultan-box> <b02d0749-6ecb-4e69-818a-6268f894464d@amd.com>
 <aIh7WB0TGNU15Zm1@sultan-box> <aIh8JPTv9Z5lphRQ@sultan-box>
 <751e9265-889f-4fbf-acf8-7374311a6b6f@amd.com> <aImvvC9JEgQ2xBki@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aImvvC9JEgQ2xBki@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:4:188::16) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|SN7PR12MB6765:EE_
X-MS-Office365-Filtering-Correlation-Id: c57684e2-bbab-472f-23d4-08ddcf4f05ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZC9GV1ZwSGxYRmppYms1Umt5ZFVaa29lWDRlS0NFbnpIck5WUzZITXVMTkcy?=
 =?utf-8?B?Mkk2OWJoNTlDeHVKd0JSUWdXZ3kwc2orZFlKckQ1RzlyeEF6VE5JaU9FSlJt?=
 =?utf-8?B?NStDaktCOElxaUdzT0tGQTBEUCt4OGlBNVRpYTNwSTI5VGpZRFh5N1VKRGlW?=
 =?utf-8?B?N3A3SEs2MEZvbnBNSzR1ZXJ1T0dWVHJiTWNpOVdwaWdZZkVZUVpHZUkxSWtC?=
 =?utf-8?B?QWo0Y0VPV0YvQTJSU2h0Y1FUdHpmbEh2azBnMnB0dW9ZQU1KOFQvWFBmMFNm?=
 =?utf-8?B?S3NpeXBIRUs3UXMwb1pWalZoeDZaQm4rVk9JRXU3TEhycmdWSjNKcmk4Nkdu?=
 =?utf-8?B?RTVCR2hIajQ3T0IrK1B1SmwrVkRYN290a0xLNUZMc1pNUmhZMHdFMGs3WW9j?=
 =?utf-8?B?WjBQMkh4RjAwQldHOXhvVlpWVEIvUGpxVmhRZlk2MHRPdDJ6VlY0SXpUeWpk?=
 =?utf-8?B?U0V5Z09sYk1YMnZUTzNsRDNJSVk3YjBOMktYbWl6UnZzaFJtNzg1V0dDcHlw?=
 =?utf-8?B?OVF3MktjRmFKSXVONFVIMkJFbXFrNDkyd1dpakx2WXhsVzVneThUR1pRRkM2?=
 =?utf-8?B?dFRQbGZZYmU0N09RL2NPZ1RUVW9FN1Q5MXYyTGxWUG1LU2hNWjhLQm81RnR4?=
 =?utf-8?B?ZVZYVHo0QzAzN25aODY3SlJYK1N2cTdvTmlCc2ZsVnMyYzk3WlZDNE5DeFZh?=
 =?utf-8?B?WUtLdXVzUEk0Wm9iSFYvY3ZUYlZPV05XMGJBYU9sTk1VbDhCOGJnOTluL3Vt?=
 =?utf-8?B?T25sK1RvbHJodklKQTBIVGV5VEJsUGRMS3ZXQkFBZS9LV2NIbG5KS3VBUmRt?=
 =?utf-8?B?ZFU3MERyRnlxY05mMy9UL1hnV29BeUNxT09SUWY2cGpMeCs1WXZDVVlpZkhC?=
 =?utf-8?B?UjdSZFMwUld6TFVJV2VoUk10MXdQZTY5VUtZUC9GNUpWcWVHQS8yYWl1WDRn?=
 =?utf-8?B?TkJSMGpJSC9YUkFQWkJsQm1pQVdxTFZpaEpZSGlMcURobC9iUndaYUdDcUUw?=
 =?utf-8?B?SzRGdFV1K0VrSHRnSFZ1cDJEQlBEN1ZCZDM4L3IyRUZtL3BEOU1WY0xmQlpm?=
 =?utf-8?B?Vkt6NDVNNldDNndpcGdDNHlNK0dzTkRYMlc2Tm0wM2hqRmFaTEttdXZHQkZD?=
 =?utf-8?B?bitjVzlWWG5lT0hGSWZmcXNWYUZBdWlBRW4vQlhhbEpEUDU5SGlaTVRPYitZ?=
 =?utf-8?B?aktZbDNuQy9WaGhDUWYxRkh3bDBCT0tqbWZnM0RyUWE5THV6RWNkZmVzR0g5?=
 =?utf-8?B?SzZvNGZoSVdwS1JjaEFicDB4bVp5VHI3VzF2cmNLNHRmWWFWcnJWMEJ3SWE0?=
 =?utf-8?B?TjE3S0tEUnFGeG9VVS9wYWR2OTRRZVoxRUFabWUwWnh3eEVYcVE2WVpiekpy?=
 =?utf-8?B?Y0dNUW53SSs4YmpydnB4bFR0WUgvRnByajg0RjVLM21jRjdDUVlNWU90WGZa?=
 =?utf-8?B?aHZ0SlJTZTVhcWJRY1pVcGxTSVE5ZHQ4aUFtVjMyOHVhWmlXNkhXaGJGbGRp?=
 =?utf-8?B?cXNneGVOVEppSHB3d0liT3BEZkhFVjhIbTBVSDM3T1pSNktJUHY3YVcxTUNt?=
 =?utf-8?B?b3R0UC9RWHNYRWdxRXZ1ZXFPQzNlRHEweFRpWVl1Vnlvak1LZmZpQ1JqdkVR?=
 =?utf-8?B?TzlxcUovNW1SY2dwUHNvSzhuWG9iSkQ2TnNQSWpwaEFqOGhkS1BacnpkbzZa?=
 =?utf-8?B?aTJtMmErUzdwUy9nTGpTK3pNN3luQ3hkUFZiei80dnR4bGIxbTc5M2Jhb3k4?=
 =?utf-8?B?Y0dXdWNWQTNra1JSVlZabXIwdk5EYzROQ2ZETUVqMnVzclc0V3RPTzRhNXpz?=
 =?utf-8?B?S0ZkRnhSMUt2eHEySjl0QXZTV3NBVEJRRUN2UGVhVnhpcEhDNTZSVUhMUmM4?=
 =?utf-8?B?MStKMXgzelVzT3RvdVBBTExKU1dYUnhMYzhid0Y4eHljalFoZmhXZnk5c2Mr?=
 =?utf-8?Q?MgiMr9CXCtM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z25mZHk2MEUreHppWVFnY0xXUUlkWEJURk5tN1JEako4aU0rdUNDc1NreE5V?=
 =?utf-8?B?TmtOOHVWZFJ2Ykc1NjJ0Tk9PWFA5YjRYNjkxUzZxSW15U1pRR2puamhEY09z?=
 =?utf-8?B?amZhT0VRU1FTTnVleE84aGNKbHJsWERiQzJTK1ZQZ0JQc0lEVDNuNlMvZm83?=
 =?utf-8?B?aUJoelpKZVZTSTFUT2JPcGxDZXBKbkJoVy9LR0tMSk1EZFF4RDJxOFhFNi8r?=
 =?utf-8?B?YXg5OG9pRHJ2L0FRQkxlaWR2U1JKdk1UcmdPOFRESC90L2RxZHJ4aGY5NTRk?=
 =?utf-8?B?c0VyRFVXclNXRHlteW04YXFySEdCMmZkbGtZZ3UyOWZnTHNlM29JdzEwNExa?=
 =?utf-8?B?V2FXV1lPMjcyaFg0anNCdUFlNzEzZkNXVFl2SnBPN0YyVEdrZTAxN0YxR3JZ?=
 =?utf-8?B?QU9GQjVLdGJYOGNOVThSaHJFWFQ2Szc5cllnVzVpZTJpbkVOVVBDbTlmdTdh?=
 =?utf-8?B?Z0F0U0JRTEg3ZC9SY1JVcWphR01Xb2lPVHozanBlVEdiTlVqK3dkUWF0bXlY?=
 =?utf-8?B?ZEVUM2RrUjFOdmw5Mmo2UGxVa0NVODl0R3ZNQW4ydXU4OVZOZUlreUFIZVYy?=
 =?utf-8?B?eC9VeHJJR1IvU01LZlpJNjlpSmJLSjR2aktCbytrZVBlcEgzRXp4S2tKS1R4?=
 =?utf-8?B?bHBlRUtoZkFSK3JwNWxxZENLRnVlWUYvdklzOUc5alRqSmtiL2tZemRTY2ha?=
 =?utf-8?B?SEFoaDVnNE51a1JRcVAvME9TTXB1WVN4VXFaUklkd0VJcHRxS3hNVlA3TVZF?=
 =?utf-8?B?aVI2YXVlMVFmeGM1akkzQWpob0JZK2FTbkxkb2ZtdFpnL1U3UVlpUFFtcTMy?=
 =?utf-8?B?VEdia0x1VDlNbVNUTk9NZHkxeWRQblA5YmpsOGthOHFYcitLYVVORE4zY2xO?=
 =?utf-8?B?ZEhJbnB6SjBIYThNRWhHcUdXQktjdlRhMFBJZkdNZXRuUWpqRmlhZUZEc1F0?=
 =?utf-8?B?SnpwenhYRnZFVVVjb1gvWG1RK2QvOTVVZ3RCNnRaVzBrY2ZFTWVMOGRLT1hQ?=
 =?utf-8?B?VTRqSEYvYzFKTk9qeklmckIzcXdHSnB3WkQ4V2lvZ0hENkRqcnVjVHVsRzQz?=
 =?utf-8?B?R3hFcTNjWmlXZWNvZlJUMjJhN1d0WEtJM3puYnE3NHFTV0JZQ3dGTUpkYnVZ?=
 =?utf-8?B?ZU5oeGRqY1BUdE04YkpSaEpRL09WYTdOTjJ3eUVrWU56cXpKVXZjbVZVVUhB?=
 =?utf-8?B?dlFDdC85Mm5nWmEyMVJheE9jOXFqdzF1VzA4ZVNuSXlhUXByOG1MZ1NQUUQv?=
 =?utf-8?B?VXgwdHJDWkI4WUZrZVkrT0FDcU1WQytHcVVQdWQxVWF0WS9nSXF2cnBTZmdJ?=
 =?utf-8?B?NTBjS29QdHljSGxyQmhwVjJLVVlIM20zVXhiNkhTRkdJTnZLaHl2ak83R2Vt?=
 =?utf-8?B?K0VHcEl6aFlhRm12c1NHQmtPbW9WTDhhdnZFbE92M1BHTERjU1BvbHloWVNY?=
 =?utf-8?B?WTFLdkZlL1Q3WEovTjFYdkJMUjMwV0tvVTFTVkpVeG5kRXRCRHBrRjBPdkhm?=
 =?utf-8?B?ZG9DUm9rWmZ1S2ZVOUhXSStlU3VYZU5PQmRRVGpCSUhCQWZEMEhUaWpPNklX?=
 =?utf-8?B?L1ErUEFpdmdldjZBZ2lSTjBWYm00SzduaURlM1Zaa1NrTkNwNGlJSk56MmdE?=
 =?utf-8?B?T1MxMUhKOXF2dmsxSVJzTE5TTFI1eWpDWkpCRzhBbEdmdGtBRERtM1ZaNE9u?=
 =?utf-8?B?cFlFaUFaVWJnVUhMZGJ0WmNMZU1IcWxBTUl4b1V6RDdpVUFmeXlVR0FkMVFB?=
 =?utf-8?B?WXN5VkdRRXEzOVBJNWljdk1WVCtud2dxTys4eXBLVWVxa29NUzJPeEE4R2FR?=
 =?utf-8?B?MkRGYXVuZ1RMVk5IUkkzM0NuQ3pZbDBlbHQ4SHJyU1JXdnhrR2JWa1dPcFVl?=
 =?utf-8?B?a1JpM05tbmJEOU0xeHV0YzVMU3hNQmpmSEhNSnRJa0xjM3lOeXdiNG1Bd1My?=
 =?utf-8?B?RE1uNnl0QkRjc3UzRXZMSWVIUytwSU9nZlkrempTTTJQZDhPQ2RtcGQzQytw?=
 =?utf-8?B?d1A4SGdvQUZyYUI3eDN2dk9YeUZQYmxySFFJdkdDcUthZDA5MVhndmNIZGFO?=
 =?utf-8?B?MnpmdGdJRkJISmFOTjErZ1VGMjN2VHFtMVpuVjZ3YnFyOExGdWlIOE9ycUJ4?=
 =?utf-8?Q?8b/c=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c57684e2-bbab-472f-23d4-08ddcf4f05ea
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 09:54:06.8277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4/co6PCg6jH1EVw/BpHwkxOw3YN8p3R3dwXJuffUdQlDpJ15wVFkCRVdJDM44oRf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6765

Hi Sultan, really glad to hear that you got your camera working

On 7/30/2025 1:38 PM, Sultan Alsawaf wrote:
> On Tue, Jul 29, 2025 at 06:13:50PM +0800, Du, Bin wrote:
>> On 7/29/2025 3:45 PM, Sultan Alsawaf wrote:
>>> On Tue, Jul 29, 2025 at 12:42:16AM -0700, Sultan Alsawaf wrote:
>>>> On Tue, Jul 29, 2025 at 11:32:23AM +0800, Du, Bin wrote:
>>>>> Thanks Sultan, please see my comments
>>>>>
>>>>> On 7/27/2025 6:31 AM, Sultan Alsawaf wrote:
>>>>>> On Fri, Jul 25, 2025 at 06:22:03PM +0800, Du, Bin wrote:
>>>>>>>> I have the Ryzen AI MAX+ 395 SKU of the HP ZBook Ultra G1a 14.
>>>>>>>>
>>>>>>>> I cannot for the life of me get the webcam working under Linux. The webcam works
>>>>>>>> under Windows so it's not a hardware issue.
>>>>>>>>
>>>>>>>> With this patchset and all of the patches you link here applied to 6.15, I get
>>>>>>>> the following errors:
>>>>>>>>       [   11.970038] amd_isp_i2c_designware amd_isp_i2c_designware: Unknown Synopsys component type: 0xffffffff
>>>>>>>>       [   11.973162] amd_isp_i2c_designware amd_isp_i2c_designware: error -19: i2c_dw_probe failed
>>>>>>>>
>>>>>>>> With the old ispkernel code from February [1] applied on 6.15, the webcam
>>>>>>>> indicator LED lights up but there's no image. I see these messages at boot:
>>>>>>>>       [    9.449005] amd_isp_capture amd_isp_capture.1.auto: amdgpu: AMD ISP v4l2 device registered
>>>>>>>>       [    9.489005] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: The OV05 sensor device is added to the ISP I2C bus
>>>>>>>>       [    9.529012] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout while trying to abort current transfer
>>>>>>>>       [    9.554046] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout in disabling adapter
>>>>>>>>       [    9.554174] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout while trying to abort current transfer
>>>>>>>>       [    9.580022] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout in disabling adapter
>>>>>>>>
>>>>>>>> And then the kernel crashes due to the same use-after-free issues I pointed out
>>>>>>>> in my other email [2].
>>>>>>>>
>>>>>>>> Any idea what's going on?
>>>>>>>>
>>>>>>>> [1] https://github.com/amd/Linux_ISP_Kernel/commit/c6d42584fbd0aa42cc91ecf16dc5c4f3dfea0bb4
>>>>>>>> [2] https://lore.kernel.org/r/aIEiJL83pOYO8lUJ@sultan-box
>>>>>>> Hi Sultan,
>>>>>>>
>>>>>>> [1] is for kernel 6.8, believe it can't be applied to 6.15. We didn't verify
>>>>>>> on 6.15 but we are really glad to help, would you please provide some info,
>>>>>>> 1. Suppose you are using Ubuntu, right? What's the version?
>>>>>>> 2. 6.15, do you mean https://github.com/torvalds/linux/tree/v6.15 ?
>>>>>>>
>>>>>>> After your confirmation, we'll see what we can do to enable your camera
>>>>>>> quickly and easily
>>>>>>>
>>>>>>> Regards,
>>>>>>> Bin
>>>>>>
>>>>>> Thank you, Bin!
>>>>>>
>>>>>> 1. I'm using Arch Linux with the ISP4-patched libcamera [1].
>>>>>> 2. Yes, here is my kernel source [2].
>>>>>>
>>>>>> I have some more findings:
>>>>>>
>>>>>> Currently, the first blocking issue is that the I2C adapter fails to initialize.
>>>>>> This is because the ISP tile isn't powered on.
>>>>>>
>>>>>> I noticed that in the old version of amd_isp_i2c_designware [3], there were
>>>>>> calls to isp_power_set(), which is available in the old ISP4 sources [4].
>>>>>> Without isp_power_set(), the I2C adapter always fails to initialize for me.
>>>>>>
>>>>>> How is the ISP tile supposed to get powered on in the current ISP4 code?
>>>>>>
>>>>> You are correct, yes, i believe the I2C adapter failure is caused by ISP not
>>>>> being powered up. Currently in latest code, isp_power_set is no longer
>>>>> available, instead, we implemented genPD for ISP in amdgpu
>>>>> https://lore.kernel.org/all/20250618221923.3944751-1-pratap.nirujogi@amd.com/
>>>>> Both amd_isp_i2c and amd_isp_capture are in the power domain and use the
>>>>> standard runtime PM API to do the power control
>>>>
>>>> Thanks for that link, I found it along with another patch on the list to make
>>>> the fwnode work ("drm/amd/amdgpu: Initialize swnode for ISP MFD device").
>>>>
>>>>>> Also, I noticed that the driver init ordering matters between all of the drivers
>>>>>> needed for the ISP4 camera. In particular, amd_isp_i2c_designware and amd_isp4
>>>>>> must be initialized before amd_capture, otherwise amd_capture will fail to find
>>>>>> the fwnode properties for the OV05C10 device attached to the I2C bus.
>>>>>>
>>>>>> But there is no driver init ordering enforced, which also caused some issues for
>>>>>> me until I figured it out. Maybe probe deferral (-EPROBE_DEFER) should be used
>>>>>> to ensure each driver waits for its dependencies to init first?
>>>>>>
>>>>> amd_isp_capture only has dependency on amd_isp4 which is the ACPI platform
>>>>> driver, it is init before amd_isp_catpure.
>>>>> Do you see in your side the amd_capture probe failure caused by failing to
>>>>> read fwnode properties? If that's the case please help to check if amd_isp4
>>>>> is loaded successfully
>>>>
>>>> I got much further now: there aren't any driver initialization errors, but when
>>>> I open the camera, there's no image. The camera LED turns on so it's active.
>>>>
>>>> And then shortly afterwards, amdgpu dies and the entire system freezes.
>>>>
>>>> I've attached my full dmesg, please let me know what you think. Thanks!
>>>
>>> I almost forgot, here is my current kernel tree:
>>> https://github.com/kerneltoast/kernel_x86_laptop/tree/v6.16-sultan-isp4
>>>
>>> Sultan
>>
>> Thanks Sultan, yes, seems much close to the final success. Will have some
>> internal discussion.
> 
> I got the webcam working. The same bug happened when I tried Ubuntu's linux-oem
> kernel, which made me think that the issue was firmware.
> 
> And indeed, the culprit was a firmware update from February. I bisected
> linux-firmware and found the commit which broke the webcam for me:
> 
> 	commit 1cc8c1bfa11251ce8bfcc97d1f15e312f7fe4df0 (HEAD)
> 	Author: Pratap Nirujogi <pratap.nirujogi@amd.com>
> 	Date:   Wed Feb 19 12:16:51 2025 -0500
> 
> 	    amdgpu: Update ISP FW for isp v4.1.1
> 	
> 	    From internal git commit:
> 	    5058202443e08a673b6772ea6339efb50853be28
> 	
> 	    Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> 
> 	 amdgpu/isp_4_1_1.bin | Bin 4543184 -> 6083536 bytes
> 	 1 file changed, 0 insertions(+), 0 deletions(-)
> 
> Downgrading firmware to before that commit fixes the webcam. Any idea why?
> 
> Thanks,
> Sultan

So, can i say the working firmware binary is this one?

Commit 8f070131
amdgpu: Update ISP FW for isp v4.1.1

 From internal git commit:
39b007366cc76ef8c65e3bc6220ccb213f4861fb

Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>

There are too many changes between them, so i can't tell exactly which 
change caused this. So, from my side
1. Will try these two firmware to see if we have the same issue.
2. It has been quite a long time since last release, will see if need to 
release a latest one.

Regards,
Bin


