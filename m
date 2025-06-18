Return-Path: <linux-media+bounces-35205-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D709AADF2BE
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 18:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 599541723C9
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 16:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC9A2EF9DC;
	Wed, 18 Jun 2025 16:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nbYxcewo"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999931D63D8;
	Wed, 18 Jun 2025 16:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750264516; cv=fail; b=XZ2/fbYCsedHtyavR9OouDPfxpl5x8mtuWeTBnkf/F/dl6p59xUd/9Uej/tpTtqtphxxuyeBZxe/H575VT8zuiYMsoswAUItjEBqlFqn+/aMKNVNJqtUYVowuyL9nTOCBRlpPQw2N4V+RNPECtFo3kOYZIdrx0VfN8wxxYD06ws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750264516; c=relaxed/simple;
	bh=fkkSwoPaaqvj43deDae3+dKK1vJJsKjl/RSFKrAv/b0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BTIctuqI15zzKR7NvpiJaWJTrfcLpb/1iTE2Pmvlh0rj+zsN61MovPzeA0hUIrmZCSycOsHyt2Msikvy/ZrAn8aHACOGyp5UN+ICinUopANwT3zi2ae6roSVPofQX++btgHcVFMaA7eAwmLIKq1EMYeDu/0pnyCqXcqQ87ZsGbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nbYxcewo; arc=fail smtp.client-ip=40.107.93.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSJNwGLVhFmMoR6FPPy+IGbNXQWzHPT45VUes7yYZjAo2qBaQtdBFXd7O1Pr2/le3vdhonp228zytWg004UuPtE9msZRhkTpS5VKFD94Oe7mujAatQeq93GEvD4aNZju4FeQKZkELqvl+FKG2Rn3vzj9zwLqGrzc54ANpMEzb6m7BpkHwabel966NaFAN2JUueKzGGBQmh4LuMy8011U7aignQQo3pZj00l/8VtfTa32iBHP338J+CyW73qnuGew1jb99jbWHFBMz5zbpbL8R6fZHDMxoFFQtzOAaG93tCzD+aZlGyuc35ATYzMcUfuZ7jxNqcx+OjiSNyMg8H9MqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OskeLbWCXoEYjhMErJT7dUy0/jCaQg7OA+SjJRJ2/VI=;
 b=eS4udhDeXanBnyKTHj6XxW9PHU9jWIIqQSrR6NxBJ/UVQPaPUzC5PCzFk1j5zh3IgzpCEYV4HcqKg1bERdd7aFjb1N18CNVkqdP4EeODYkbrRZqknIrZKkkkmV1eW8rN3PjDPjK1O/fHjqDjnIDB5lMMGuaWkoH8PD/9pS+UBT5pVC9SV4obxsnbhlL6VH3bBunp6ViJLjYwBA8VPHRxHONSMwq+U4+wN7JSuUTMA/s72ZhlvRCAAFH9kNXNxMlXqwwn579EDKF3fkiE0o/e7eIMrcRdT8uV62ht09g7uFhaCnkrfr7Gn3cEN46EOERgv7jEUQ+Zrca2TYVCMfSBVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OskeLbWCXoEYjhMErJT7dUy0/jCaQg7OA+SjJRJ2/VI=;
 b=nbYxcewoMTp1JFsX1Dcl7nPIupVdFu3Tb3NiHVuUusJItEahMV3Ph9qlHfTN7GlimAE11+YRPFT7HLECDPclq9dn9eEu9hd3plomnLLJGYGgkIb3kqlthKarP704AnpsUER6vkis6ihdzBHTPdYU/amn6oyzdO1HAjUCwR1IGnI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ0PR12MB7005.namprd12.prod.outlook.com (2603:10b6:a03:486::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Wed, 18 Jun
 2025 16:35:04 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8857.019; Wed, 18 Jun 2025
 16:35:03 +0000
Message-ID: <6825c4cd-611b-4efe-a988-3ca7dd1f876d@amd.com>
Date: Wed, 18 Jun 2025 11:35:00 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] media: platform: amd: isp4 subdev and firmware
 loading handling added
To: Bin Du <Bin.Du@amd.com>, mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 Svetoslav.Stoilov@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-6-Bin.Du@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250618091959.68293-6-Bin.Du@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:5:3b9::21) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ0PR12MB7005:EE_
X-MS-Office365-Filtering-Correlation-Id: e1e23c73-da9c-4912-eda5-08ddae8613c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d1BIRldocXI3bTdIcHlpbGVIamxObG5KM2R0MklhN1F3VXo5dHo5Y3RudTF4?=
 =?utf-8?B?Z3JacE13WG9KZjlkVmhpdTZkeTRLa0RYUytZS0NaZktteWZtUHMvaXdxeEVt?=
 =?utf-8?B?OGRSNkhycm10YlprcFVqRW1oblg2TGhGMXlZMnhLZ3JjUVo5OGV5eTJndDNV?=
 =?utf-8?B?YStxUWxnR2loR2U1M0FUMmhyZmM1Lzl6aGdnblVFNE51bTBNWkVFU2luWVE4?=
 =?utf-8?B?N205ZHBWdnY2KzM4Q3Y2VlFVM2s1MEZYQS83QUZScHdSdko3RzVKOC9VUWpH?=
 =?utf-8?B?bFJLZ2xwL2Jidnk1cDRHN3l0aTlHUUtmQTlzcTBzRjBQdzVIckprNGd4aFBH?=
 =?utf-8?B?MVUrcUtObXU2eHRyaDRIY1I5OUhtT0l2dlNwODliR0cwd05CZEh4SWIxeCs1?=
 =?utf-8?B?b3YrZXBGV2ZsMDJKQ1VWS2JNMFFRSHBnSmZnT0FsVXlVbWNyV2kxSkxxeHBw?=
 =?utf-8?B?YjlJQVRpUnBIT1ZzOE5Ranh5Y1JZQjJVZG9MZlNRanZrWm55djFHODlwbmFh?=
 =?utf-8?B?U3cyV2tNTVVzTkVtaDNnZlIrdW5qS2RzZzN1VUJMODg5ckZueHhJQVFoNUR2?=
 =?utf-8?B?SXpvZDJlN0tBODNhQUFWWE5RSWlzWlc1VkFJeGJMMUxZV1FUMVRSQ3pCaERH?=
 =?utf-8?B?aDhzZlhjQmxlUGV0KzU4RC9rVUVzRm9ZNWtZbHZkQkpxbUtZNHF1dDkrRWR1?=
 =?utf-8?B?eXNVK1BMSUhRS2c4enFtVEx1YThKckl0eW5Ra0d4a2VSRGhjSlNLb1JoQkFm?=
 =?utf-8?B?TWhSUU9JUzRWSElXWFRiM0VaVFNWNUVnMzMycXczbnZab2NiNTJOOHZ1QlBl?=
 =?utf-8?B?Q2hwdVJTeGpkUUZTNTY1ZTdaZ2JwNzBSWnRyMHhZaThXR1h0VjhBNmQ1T0dM?=
 =?utf-8?B?RWN2Zm9jOU9RVTJ0S2tiSzIvTlp5elNVWmFQTk5uKy85b3dPRmJrb0VlOElS?=
 =?utf-8?B?cUpPYlBRcmxLam9LT09pKzRkRVprR2ZlWS90ZEFnb2l2S0ltVFRvVjdrS2xL?=
 =?utf-8?B?eHRNdXhGb0pHdHh5Q0ZicTFOTzdWYS8zQ1Znb2FYRytIejFjVDhBOHBYeU5a?=
 =?utf-8?B?dWF3MEh1VUJKSVpJaW5JRUZ3T0xkUFpqRHlNWU5Ec1pnWU4rSC9SL05YakFW?=
 =?utf-8?B?WnQ0bDE0RnBSZ045S0hQVmNhSzk0d05BYzNlVWw0emtVQkVjcTkrWndiSGdF?=
 =?utf-8?B?K0Z3c1gwcUVMby9TU2Npei92VFREMDVrTG1ZUWJ6QklJV1ZxaGdNWnEvMjVj?=
 =?utf-8?B?K3RqYWcrQlJKa2plNkN6MlU0blpESEdTRG9WamxhNHJ2UndkSXJEZWx0eXZt?=
 =?utf-8?B?SXhvQktDVWVRUTd1WitOMnNSN3NENnFhU2ZQY0xkN2hPRkdsbXVaNWtNMWY4?=
 =?utf-8?B?Z3lwMVRtM0ZDMU9veEw3ZGlPZmhkclhWUVpuMktOS0oyTDUwQkNoeldrK0w4?=
 =?utf-8?B?REJ2Rlo2VWdEUm1hbFMrZ3VndlNEY0RwVjdkbWtOMmtiUHl4MFlHcUxiTTlB?=
 =?utf-8?B?M3pZTmg3dm5CTm1IZ0RkenVQdXNVLytNb2RrTDU3MTBKb3RmTzg0T00rYi9H?=
 =?utf-8?B?bElpZzUrYU44dkhTaUFpWGtoRXdCQzJKaFc0R1hlaFdYSS9aNnJ3L015bFM5?=
 =?utf-8?B?L1AzamtaRVQxSkYyN3EvaW1KNzJxNHpVK2kreWZtVkRTWXNVaDJJTUZrc3Vx?=
 =?utf-8?B?VzVnUE9GNkNMc3MvemVpSjJHVUlLSVlVcW5kNDR6NzU1UzhLQTlDcVVDbHBI?=
 =?utf-8?B?SFNMaDUrRXpGczZ6WWp0d3VZUm1SSUZES0lNeWtBSmFueGVkTzNPclBOVHRo?=
 =?utf-8?B?UnJpMGpkT2RCNEw1NWxZMlkrV214ZHp6ZENUUzBpMXo0Z0VGWUxtY0Zxa2ZJ?=
 =?utf-8?B?dWQvbGtTdGxiYTgremRKaG1ZZlNlZkJoQW9nN01PSmdxKzh4WlF5MzkyaWVY?=
 =?utf-8?Q?BHl4d+QMcyU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUJqNUwvNnk1M0tNRTA0TGRFdDVoOGk5emxNZWxYNzJOSHJtNFNsKzRRdjhV?=
 =?utf-8?B?Q0MyVll1dm4yd1pJZHFGcVNwUEtLaFFiVzY5RVMycnB6MnZ3OWRnMkwyaktK?=
 =?utf-8?B?RlZ6ekt1elVqdmZHczVtSUpVVWkydDRlWjk1NUN3cHcrME5tSXJvRlhjUzNj?=
 =?utf-8?B?YkpHZGwzcFZocnVmREN5clVyUHFtYkJTMVAyQ2c2ZDI1eWs1RHNJbE1hb1lu?=
 =?utf-8?B?UVd5Vlc0M25uRk1SVHRrSEFLQ3Bva1FxV1o5ZUtVVHpBRmpKTmkyeVRINWNG?=
 =?utf-8?B?S3oxcXQ4c3NBS0k0U205c3Z0bDNPRkhNS2tSMy95bjNya3JaOEtza3dzNHA1?=
 =?utf-8?B?Y245NkpVRCtRQ3RqY1FPaVM0QTNnWUM0Ny8xZGhTbmJ6NW1QaXRVMi8yVm1k?=
 =?utf-8?B?YzRKZTk2Z0RXaXVPZ0Q5NmZJWkUxaTZXcFFjNU9sb2Jmc283R1hKMmFIdU50?=
 =?utf-8?B?a1h3SzVTa1J3MEpJbmQ2ZEs0STBqeHVWcXEzaFdxZHFJQjJud0lUc2NRd0Qw?=
 =?utf-8?B?eFFlRlkyVFJVVnltQUZyc0FuTlBLOU5IR0xBMzFkeDZLdTROZ21WLzdZQXdM?=
 =?utf-8?B?dytuSjFOV09ONW1uYTF2YUVvZXRDVGxXRE1SVThld1M3MVFYSUpCa2Uyb3Iz?=
 =?utf-8?B?a0ZIR3kzOVhjdWhiQzZXL01zRWFtRFZHNFJqMFdDanJJaUNmR2hJcVgzNWxK?=
 =?utf-8?B?OGVRR0wyNUZXMjR5WVMrMWRsRWdxcVpJbkNmOWZDaGlXVHNWVmNxT1cwN3lG?=
 =?utf-8?B?UWd1WmEvR1JOZlc3RkdmaEJlL0kyZVZDN1lrWDN0dSt4cHA0RXdqdGtyVFp1?=
 =?utf-8?B?NENEaW83RFZIQ0hoaWYxN29ldU1UeEQxSGFWZG8rcjc1SDZldTc3aWt1NHB6?=
 =?utf-8?B?YlJZMkZuUlgrdDRWcEo2YXpybGlac0dnVGdCK1AvbVBEUVQ1K28rcWE2cUxJ?=
 =?utf-8?B?eTN4OGpGcGsraG14R3NaY3Z1ZFpLMmZrR20wbWh5ZVo2aWZLdmdXdS85aDdo?=
 =?utf-8?B?WXFPUDNTTEJjZnVWUFVteEZjVDRkcnd4NlBPMzhwQVU2eWw4enh6aXlsaVdj?=
 =?utf-8?B?MUt5M0Z0OXVLOVBXUEdmdExDTlgyNHlWRVRwYzNSbDB6WUJCK09Ma25rTjZT?=
 =?utf-8?B?M25RQlVvSUYwNWRBQ3pZeGE5OWJhcWNOWTRzcXpyYWdxay83aEc4dTlrcVFm?=
 =?utf-8?B?cFdsOEhzVGRQVVBTUEFNcGdMWGRhbzRTbHdMZGZ3b2N1VjNWOUJIaUdoVzA4?=
 =?utf-8?B?bENxby9qNHB6N1FhY2tmMHNDK2YxTFpTenNZVVNTTG1tL3hseDR4WHNNZkFt?=
 =?utf-8?B?TTI2Qng0SUpmUlhwaVYzV2lDbnAzcnczZ3BlNzczTHdDdmUrR0U2bnNHcjM2?=
 =?utf-8?B?dnV2dW5yU0lTbVZvOWwvWXJCbGUzZW9zSEZCVUtuZlZoUEFBMnQ5VVZ5aFN5?=
 =?utf-8?B?cW96OThZbW9UMkxEUy9nREJBWTNZWWtqZHFhQTdZSDZmbTYzRmEvaThraW4w?=
 =?utf-8?B?Mm9sNGw3N0lLSFZzTTVzUFNHYWJWa2xRVWREWTdlMmxvWWhJVVZWTkh0dEwy?=
 =?utf-8?B?ZHVOUDJhdGswZ3hkTHY1SmdmTmIzREovanA1WXI1S0xzNm1sWWFYQTB5cHhW?=
 =?utf-8?B?SExid3I5MFB0eUVLaDlvK1ZFdmlkdE43SWpHKzJPM2Z3M2h6WncyZUQvUE5V?=
 =?utf-8?B?c2JOSUFGVVlrdWtTY2c4N1J2eXp4ekZRM2lCSkR1TTVvZVZwS1dTeEdSL0pE?=
 =?utf-8?B?RlN6WlQxTGUrRU1QU05KYzRSdnVYSm5Xc0d4ckNSOGhHWnljQlRDVmdDWXZ2?=
 =?utf-8?B?eElMd0FzYnhiSzB5Z1pQQ21LUlJpWjN3WmRkMThlZVlRQktsM2wzQnFQeVNv?=
 =?utf-8?B?dzRSeVlLQjdic2tCRXRTS09kSmw2SXY0VFI5REh5N1E0dmpqK1JTb1Jkd0s4?=
 =?utf-8?B?WnhCUmlDalhWeklSQldsZTZ4UHpBSmcvL1doWG1iRE11RUdBajZVbkpQdVVh?=
 =?utf-8?B?RVhlOTlsazBOTUdrdGNqWWl2YnBjTzMxZGZRTTJwQXNrOFJyZEs2aS9MTDdO?=
 =?utf-8?B?Vi8rdVZXSnZZUWpUck81aWdrUDZJT1dVcVY4YkxRK2JNVkdpSjRKUmd5K1FW?=
 =?utf-8?Q?WRHhKOIQkfI4t1koAsWytj+sB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e23c73-da9c-4912-eda5-08ddae8613c2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 16:35:03.9285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wzj9fntD1ynWPrXzGhthc7zl5FF8oUsnnp/hVQf8+vQtFRJ/dot9HL+RwPeEL/qfwFuHPYrFohMYrg5NeYbP4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7005

On 6/18/2025 4:19 AM, Bin Du wrote:
> Isp4 sub-device is implementing v4l2 sub-device interface. It has one
> capture video node, and supports only preview stream. It manages
> firmware states, stream configuration and mipi phy configuration.
> This change also adds interrupt handling and notification for isp
> firmware to isp-subdevice.
> 
> Signed-off-by: Bin Du <Bin.Du@amd.com>
> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> ---
>   drivers/media/platform/amd/isp4/Makefile      |    3 +-
>   drivers/media/platform/amd/isp4/isp4.c        |  267 +++-
>   drivers/media/platform/amd/isp4/isp4.h        |    4 +-
>   drivers/media/platform/amd/isp4/isp4_subdev.c | 1192 +++++++++++++++++
>   drivers/media/platform/amd/isp4/isp4_subdev.h |  145 ++
>   5 files changed, 1601 insertions(+), 10 deletions(-)
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.c
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.h
> 
> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
> index c0166f954516..52defc06189e 100644
> --- a/drivers/media/platform/amd/isp4/Makefile
> +++ b/drivers/media/platform/amd/isp4/Makefile
> @@ -3,9 +3,10 @@
>   # Copyright (C) 2025 Advanced Micro Devices, Inc.
>   
>   obj-$(CONFIG_AMD_ISP4) += amd_capture.o
> -amd_capture-objs := isp4.o	\
> +amd_capture-objs := isp4_subdev.o \
>   			isp4_phy.o \
>   			isp4_interface.o \
> +			isp4.o	\
>   			isp4_hw.o	\
>   
>   ccflags-y += -I$(srctree)/drivers/media/platform/amd/isp4
> diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
> index d0be90c5ec3b..c1aca2bd35e3 100644
> --- a/drivers/media/platform/amd/isp4/isp4.c
> +++ b/drivers/media/platform/amd/isp4/isp4.c
> @@ -5,13 +5,20 @@
>   
>   #include <linux/pm_runtime.h>
>   #include <linux/vmalloc.h>
> +#include <media/v4l2-fwnode.h>
>   #include <media/v4l2-ioctl.h>
>   
> -#include "isp4.h"
> +#include "amdgpu_object.h"
>   
> -#define VIDEO_BUF_NUM 5
> +#include "isp4.h"
> +#include "isp4_hw.h"
>   
>   #define ISP4_DRV_NAME "amd_isp_capture"
> +#define ISP4_FW_RESP_RB_IRQ_STATUS_MASK \
> +	(ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT9_INT_MASK  | \
> +	 ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT10_INT_MASK | \
> +	 ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT11_INT_MASK | \
> +	 ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT12_INT_MASK)
>   
>   /* interrupt num */
>   static const u32 isp4_ringbuf_interrupt_num[] = {
> @@ -24,23 +31,233 @@ static const u32 isp4_ringbuf_interrupt_num[] = {
>   #define to_isp4_device(dev) \
>   	((struct isp4_device *)container_of(dev, struct isp4_device, v4l2_dev))
>   
> +static int isp4_create_links(struct isp4_device *isp4_dev,
> +			     struct v4l2_subdev *sensor_sdev)
> +{
> +	struct v4l2_subdev *isp4_sdev = &isp4_dev->isp_sdev.sdev;
> +	struct device *dev = &isp4_dev->pdev->dev;
> +	int ret;
> +
> +	ret = media_create_pad_link(&sensor_sdev->entity,
> +				    0, &isp4_sdev->entity, 0,
> +				    MEDIA_LNK_FL_ENABLED |
> +				    MEDIA_LNK_FL_IMMUTABLE);
> +	if (ret)
> +		dev_err(dev, "create sensor to isp link fail:%d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int isp4_register_subdev_and_create_links(struct isp4_device *isp_dev,
> +						 struct v4l2_subdev *sdev)
> +{
> +	struct device *dev = &isp_dev->pdev->dev;
> +	int ret;
> +
> +	ret = isp4_create_links(isp_dev, sdev);
> +	if (ret)
> +		dev_err(dev, "fail create isp link:%d\n", ret);

You're discarding ret here.  Shouldn't you return ret in the failure path?

> +
> +	ret = v4l2_device_register_subdev_nodes(&isp_dev->v4l2_dev);
> +	if (ret != 0) {
> +		dev_warn(dev, "register subdev as nodes fail:%d\n", ret);
> +		ret = 0;

This isn't fatal?

> +	}
> +
> +	return ret;
> +}
> +
> +static int isp4_camera_sensor_bound(struct v4l2_async_notifier *notifier,
> +				    struct v4l2_subdev *sensor_sdev,
> +				    struct v4l2_async_connection *asd)
> +{
> +	struct isp4_device *isp_dev = to_isp4_device(notifier->v4l2_dev);
> +	struct device *dev = &isp_dev->pdev->dev;
> +	int ret;
> +
> +	ret = isp4_register_subdev_and_create_links(isp_dev, sensor_sdev);
> +	if (ret)
> +		dev_err(dev, "register sensor subdev fail:%d\n",
> +			ret);
> +	else
> +		dev_dbg(dev, "register sensor subdev suc\n");

Probably can drop this now

> +	return ret;
> +}
> +
> +static void isp4_camera_sensor_unbind(struct v4l2_async_notifier *notifier,
> +				      struct v4l2_subdev *sensor_sdev,
> +				      struct v4l2_async_connection *asd)
> +{
> +}
> +
> +static const struct v4l2_async_notifier_operations isp4_camera_sensor_ops = {
> +	.bound = isp4_camera_sensor_bound,
> +	.unbind = isp4_camera_sensor_unbind,
> +};
> +
> +static void isp4_wake_up_resp_thread(struct isp4_subdev *isp, u32 index)
> +{
> +	if (isp && index < ISP4SD_MAX_FW_RESP_STREAM_NUM) {
> +		struct isp4sd_thread_handler *thread_ctx =
> +				&isp->fw_resp_thread[index];
> +
> +		thread_ctx->wq_cond = 1;
> +		wake_up_interruptible(&thread_ctx->waitq);
> +	}
> +}
> +
> +static void isp4_resp_interrupt_notify(struct isp4_subdev *isp, u32 intr_status)
> +{
> +	bool wake = (isp->ispif.status == ISP4IF_STATUS_FW_RUNNING);
> +
> +	u32 intr_ack = 0;
> +
> +	/* global response */
> +	if (intr_status &
> +	    ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT12_INT_MASK) {
> +		if (wake)
> +			isp4_wake_up_resp_thread(isp, 0);
> +
> +		intr_ack |= ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT12_ACK_MASK;
> +	}
> +
> +	/* stream 1 response */
> +	if (intr_status &
> +	    ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT9_INT_MASK) {
> +		if (wake)
> +			isp4_wake_up_resp_thread(isp, 1);
> +
> +		intr_ack |= ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT9_ACK_MASK;
> +	}
> +
> +	/* stream 2 response */
> +	if (intr_status &
> +	    ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT10_INT_MASK) {
> +		if (wake)
> +			isp4_wake_up_resp_thread(isp, 2);
> +
> +		intr_ack |= ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT10_ACK_MASK;
> +	}
> +
> +	/* stream 3 response */
> +	if (intr_status &
> +	    ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT11_INT_MASK) {
> +		if (wake)
> +			isp4_wake_up_resp_thread(isp, 3);
> +
> +		intr_ack |= ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT11_ACK_MASK;
> +	}
> +
> +	/* clear ISP_SYS interrupts */
> +	isp4hw_wreg(ISP4_GET_ISP_REG_BASE(isp), ISP_SYS_INT0_ACK, intr_ack);
> +}
> +
>   static irqreturn_t isp4_irq_handler(int irq, void *arg)
>   {
> -	struct isp4_device *isp_dev = dev_get_drvdata((struct device *)arg);
> +	struct isp4_device *isp_dev = dev_get_drvdata(arg);
> +	struct isp4_subdev *isp = NULL;
> +	u32 isp_sys_irq_status = 0x0;
> +	u32 r1;
>   
>   	if (!isp_dev)
> -		goto error_drv_data;
> +		return IRQ_HANDLED;

As mentioned in the first patch, avoid ping ponging the code.

> +
> +	isp = &isp_dev->isp_sdev;
> +	/* check ISP_SYS interrupts status */
> +	r1 = isp4hw_rreg(ISP4_GET_ISP_REG_BASE(isp), ISP_SYS_INT0_STATUS);
> +
> +	isp_sys_irq_status = r1 & ISP4_FW_RESP_RB_IRQ_STATUS_MASK;
> +
> +	isp4_resp_interrupt_notify(isp, isp_sys_irq_status);
>   
> -error_drv_data:
As mentioned in the first patch, avoid ping ponging the code.
>   	return IRQ_HANDLED;
>   }
>   
> +static int isp4_parse_fwnode_init_async_nf(struct isp4_device *isp_dev)
> +{
> +	struct isp4_subdev *isp_sdev = &isp_dev->isp_sdev;
> +	struct device *dev = &isp_dev->pdev->dev;
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY
> +	};
> +	struct fwnode_handle *remote_ep = NULL;
> +	struct fwnode_handle *local_ep = NULL;
> +	struct v4l2_async_connection *asd;
> +	struct fwnode_handle *fwnode;
> +	struct fwnode_endpoint fwep;
> +	int ret;
> +
> +	fwnode = dev_fwnode(dev);
> +
> +	local_ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> +	if (!local_ep) {
> +		ret = -ENXIO;
> +		goto err_fwnode;
> +	}
> +
> +	remote_ep = fwnode_graph_get_remote_endpoint(local_ep);
> +	if (!remote_ep) {
> +		ret = -ENXIO;
> +		goto err_fwnode;
> +	}
> +
> +	ret = fwnode_graph_parse_endpoint(remote_ep, &fwep);
> +	if (ret)
> +		goto err_fwnode;
> +	isp_sdev->phy_id = fwep.port;
> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(remote_ep, &bus_cfg);
> +	if (ret)
> +		goto err_fwnode;
> +
> +	if (!bus_cfg.nr_of_link_frequencies) {
> +		ret = -EINVAL;
> +		dev_err(dev, "fail invalid link freq number %u\n", bus_cfg.nr_of_link_frequencies);
> +		v4l2_fwnode_endpoint_free(&bus_cfg);
> +		goto err_fwnode;
> +	}
> +	isp_sdev->phy_link_freq = *bus_cfg.link_frequencies;
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +	isp_sdev->phy_num_data_lanes =
> +		fwnode_property_count_u32(remote_ep, "data-lanes");
> +
> +	v4l2_async_nf_init(&isp_dev->notifier, &isp_dev->v4l2_dev);
> +
> +	asd = v4l2_async_nf_add_fwnode(&isp_dev->notifier, remote_ep,
> +				       struct v4l2_async_connection);
> +	if (IS_ERR(asd)) {
> +		ret = PTR_ERR(asd);
> +		goto err_async_nf_cleanup;
> +	}
> +
> +	isp_dev->notifier.ops = &isp4_camera_sensor_ops;
> +	ret = v4l2_async_nf_register(&isp_dev->notifier);
> +	if (ret) {
> +		dev_err(dev, "v4l2_async_nf_register fail:%d", ret);
> +		goto err_async_nf_cleanup;
> +	}
> +
> +	return 0;
> +
> +err_async_nf_cleanup:
> +	v4l2_async_nf_cleanup(&isp_dev->notifier);
> +err_fwnode:
> +	if (remote_ep)
> +		fwnode_handle_put(remote_ep);
> +	if (local_ep)
> +		fwnode_handle_put(remote_ep);
> +
> +	return ret;
> +}
> +
>   /*
>    * amd capture module
>    */
>   static int isp4_capture_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> +	struct isp4_subdev *isp_sdev;
>   	struct isp4_device *isp_dev;
>   
>   	int i, irq, ret;
> @@ -52,6 +269,17 @@ static int isp4_capture_probe(struct platform_device *pdev)
>   	isp_dev->pdev = pdev;
>   	dev->init_name = ISP4_DRV_NAME;
>   
> +	isp_sdev = &isp_dev->isp_sdev;
> +	isp_sdev->mmio = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(isp_sdev->mmio))
> +		return dev_err_probe(dev, PTR_ERR(isp_sdev->mmio),
> +				     "isp ioremap fail\n");
> +
> +	isp_sdev->isp_phy_mmio = devm_platform_ioremap_resource(pdev, 1);
> +	if (IS_ERR(isp_sdev->isp_phy_mmio))
> +		return dev_err_probe(dev, PTR_ERR(isp_sdev->isp_phy_mmio),
> +				     "isp phy mmio ioremap fail\n");
> +
>   	for (i = 0; i < ARRAY_SIZE(isp4_ringbuf_interrupt_num); i++) {
>   		irq = platform_get_irq(pdev, isp4_ringbuf_interrupt_num[i]);
>   		if (irq < 0)
> @@ -90,10 +318,23 @@ static int isp4_capture_probe(struct platform_device *pdev)
>   
>   	dev_dbg(dev, "AMD ISP v4l2 device registered\n");
>   
> +	ret = isp4sd_init(&isp_dev->isp_sdev, &isp_dev->v4l2_dev,
> +			  isp_dev->pltf_data->adev);
> +	if (ret) {
> +		dev_err(dev, "fail init isp4 sub dev %d\n", ret);
> +		goto err_unreg_v4l2;
> +	}
> +
> +	ret = isp4_parse_fwnode_init_async_nf(isp_dev);
> +	if (ret) {
> +		dev_err(dev, "fail to parse fwnode %d\n", ret);
> +		goto err_unreg_v4l2;
> +	}
> +
>   	ret = media_device_register(&isp_dev->mdev);
>   	if (ret) {
>   		dev_err(dev, "fail to register media device %d\n", ret);
> -		goto err_unreg_v4l2;
> +		goto err_isp4_deinit;
>   	}
>   
>   	platform_set_drvdata(pdev, isp_dev);
> @@ -103,6 +344,10 @@ static int isp4_capture_probe(struct platform_device *pdev)
>   
>   	return 0;
>   
> +err_isp4_deinit:
> +	v4l2_async_nf_unregister(&isp_dev->notifier);
> +	v4l2_async_nf_cleanup(&isp_dev->notifier);
> +	isp4sd_deinit(&isp_dev->isp_sdev);
>   err_unreg_v4l2:
>   	v4l2_device_unregister(&isp_dev->v4l2_dev);
>   
> @@ -112,11 +357,17 @@ static int isp4_capture_probe(struct platform_device *pdev)
>   static void isp4_capture_remove(struct platform_device *pdev)
>   {
>   	struct isp4_device *isp_dev = platform_get_drvdata(pdev);
> -	struct device *dev = &pdev->dev;
> +
> +	v4l2_async_nf_unregister(&isp_dev->notifier);
> +	v4l2_async_nf_cleanup(&isp_dev->notifier);
> +	v4l2_device_unregister_subdev(&isp_dev->isp_sdev.sdev);
>   
>   	media_device_unregister(&isp_dev->mdev);
> +	media_entity_cleanup(&isp_dev->isp_sdev.sdev.entity);
>   	v4l2_device_unregister(&isp_dev->v4l2_dev);
> -	dev_dbg(dev, "AMD ISP v4l2 device unregistered\n");
> +	dev_dbg(&pdev->dev, "AMD ISP v4l2 device unregistered\n");

Don't ping pong this

> +
> +	isp4sd_deinit(&isp_dev->isp_sdev);
>   }
>   
>   static struct platform_driver isp4_capture_drv = {
> diff --git a/drivers/media/platform/amd/isp4/isp4.h b/drivers/media/platform/amd/isp4/isp4.h
> index 27a7362ce6f9..596431b4a5c2 100644
> --- a/drivers/media/platform/amd/isp4/isp4.h
> +++ b/drivers/media/platform/amd/isp4/isp4.h
> @@ -7,9 +7,9 @@
>   #define _ISP4_H_
>   
>   #include <linux/mutex.h>
> -#include <media/v4l2-device.h>
>   #include <media/videobuf2-memops.h>
>   #include <media/videobuf2-vmalloc.h>
> +#include "isp4_subdev.h"
>   
>   #define ISP4_GET_ISP_REG_BASE(isp4sd) (((isp4sd))->mmio)
>   
> @@ -25,11 +25,13 @@ struct isp4_platform_data {
>   
>   struct isp4_device {
>   	struct v4l2_device v4l2_dev;
> +	struct isp4_subdev isp_sdev;
>   	struct media_device mdev;
>   
>   	struct isp4_platform_data *pltf_data;
>   	struct platform_device *pdev;
>   	struct notifier_block i2c_nb;
> +	struct v4l2_async_notifier notifier;
>   };
>   
>   #endif /* isp4.h */
> diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
> new file mode 100644
> index 000000000000..978164031067
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
> @@ -0,0 +1,1192 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/mutex.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "isp4_fw_cmd_resp.h"
> +#include "isp4_hw.h"
> +#include "isp4_interface.h"
> +#include "isp4_phy.h"
> +#include "isp4_subdev.h"
> +#include <linux/units.h>
> +
> +#define ISP4SD_MAX_CMD_RESP_BUF_SIZE (4 * 1024)
> +#define ISP4SD_MIN_BUF_CNT_BEF_START_STREAM 4
> +
> +#define ISP4SD_PERFORMANCE_STATE_LOW 0
> +#define ISP4SD_PERFORMANCE_STATE_HIGH 1
> +
> +#define ISP4SD_FW_CMD_TIMEOUT_IN_MS  500
> +#define ISP4SD_WAIT_RESP_IRQ_TIMEOUT  5 /* ms */
> +/* align 32KB */
> +#define ISP4SD_META_BUF_SIZE ALIGN(sizeof(struct isp4fw_meta_info), 0x8000)
> +
> +#define to_isp4_subdev(v4l2_sdev)  \
> +	container_of(v4l2_sdev, struct isp4_subdev, sdev)
> +
> +#define to_isp4_vdev(isp4_vid)  \
> +	container_of(isp4_vid, struct isp4_subdev, isp_vdev)
> +
> +static const char *isp4sd_entity_name = "amd isp4";
> +
> +struct isp4sd_mbus_image_format_remap {
> +	u32				mbus_code;
> +	enum isp4fw_image_format	image_format;
> +};
> +
> +static const struct isp4sd_mbus_image_format_remap
> +	isp4sd_image_formats[] = {
> +	{
> +		.mbus_code	= MEDIA_BUS_FMT_YUYV8_1_5X8,
> +		.image_format	= IMAGE_FORMAT_NV12,
> +	},
> +	{
> +		.mbus_code	= MEDIA_BUS_FMT_YUYV8_1X16,
> +		.image_format	= IMAGE_FORMAT_YUV422INTERLEAVED,
> +	},
> +};
> +
> +static void isp4sd_module_enable(struct isp4_subdev *isp_subdev, bool enable)
> +{
> +	if (isp_subdev->enable_gpio) {
> +		gpiod_set_value(isp_subdev->enable_gpio, enable ? 1 : 0);
> +		dev_dbg(isp_subdev->dev, "%s isp_subdev module\n",
> +			enable ? "enable" : "disable");
> +	}
> +}
> +
> +static int isp4sd_setup_fw_mem_pool(struct isp4_subdev *isp_subdev)
> +{
> +	struct isp4_interface *ispif = &isp_subdev->ispif;
> +	struct isp4fw_cmd_send_buffer buf_type;
> +	struct device *dev = isp_subdev->dev;
> +	int ret;
> +
> +	if (!ispif->fw_mem_pool) {
> +		dev_err(dev, "fail to alloc mem pool\n");
> +		return -ENOMEM;
> +	}
> +
> +	memset(&buf_type, 0, sizeof(buf_type));
> +	buf_type.buffer_type = BUFFER_TYPE_MEM_POOL;
> +	buf_type.buffer.buf_tags = 0;
> +	buf_type.buffer.vmid_space.bit.vmid = 0;
> +	buf_type.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
> +	isp4if_split_addr64(ispif->fw_mem_pool->gpu_mc_addr,
> +			    &buf_type.buffer.buf_base_a_lo,
> +			    &buf_type.buffer.buf_base_a_hi);
> +	buf_type.buffer.buf_size_a = (u32)ispif->fw_mem_pool->mem_size;
> +
> +	ret = isp4if_send_command(ispif, CMD_ID_SEND_BUFFER,
> +				  &buf_type, sizeof(buf_type));
> +	if (ret) {
> +		dev_err(dev, "send fw mem pool 0x%llx(%u) fail %d\n",
> +			ispif->fw_mem_pool->gpu_mc_addr,
> +			buf_type.buffer.buf_size_a,
> +			ret);
> +		return ret;
> +	}
> +
> +	dev_dbg(dev, "send fw mem pool 0x%llx(%u) suc\n",
> +		ispif->fw_mem_pool->gpu_mc_addr,
> +		buf_type.buffer.buf_size_a);
> +
> +	return 0;
> +};
> +
> +static int isp4sd_set_stream_path(struct isp4_subdev *isp_subdev)
> +{
> +	struct isp4_interface *ispif = &isp_subdev->ispif;
> +	struct isp4fw_cmd_set_stream_cfg cmd = {0};
> +	struct device *dev = isp_subdev->dev;
> +
> +	cmd.stream_cfg.mipi_pipe_path_cfg.isp4fw_sensor_id = SENSOR_ID_ON_MIPI0;
> +	cmd.stream_cfg.mipi_pipe_path_cfg.b_enable = true;
> +	cmd.stream_cfg.isp_pipe_path_cfg.isp_pipe_id = MIPI0_ISP_PIPELINE_ID;
> +
> +	cmd.stream_cfg.b_enable_tnr = true;
> +	dev_dbg(dev, "isp4fw_sensor_id %d, pipeId 0x%x EnableTnr %u\n",
> +		cmd.stream_cfg.mipi_pipe_path_cfg.isp4fw_sensor_id,
> +		cmd.stream_cfg.isp_pipe_path_cfg.isp_pipe_id,
> +		cmd.stream_cfg.b_enable_tnr);
> +
> +	return isp4if_send_command(ispif, CMD_ID_SET_STREAM_CONFIG,
> +				   &cmd, sizeof(cmd));
> +}
> +
> +static int isp4sd_send_meta_buf(struct isp4_subdev *isp_subdev)
> +{
> +	struct isp4_interface *ispif = &isp_subdev->ispif;
> +	struct isp4fw_cmd_send_buffer buf_type = { 0 };
> +	struct isp4sd_sensor_info *sensor_info;
> +	struct device *dev = isp_subdev->dev;
> +	u32 i;
> +
> +	sensor_info = &isp_subdev->sensor_info;
> +	for (i = 0; i < ISP4IF_MAX_STREAM_META_BUF_COUNT; i++) {
> +		int ret;
> +
> +		if (!sensor_info->meta_info_buf[i]) {
> +			dev_err(dev, "fail for no meta info buf(%u)\n", i);
> +			return -ENOMEM;
> +		}
> +		buf_type.buffer_type = BUFFER_TYPE_META_INFO;
> +		buf_type.buffer.buf_tags = 0;
> +		buf_type.buffer.vmid_space.bit.vmid = 0;
> +		buf_type.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
> +		isp4if_split_addr64(sensor_info->meta_info_buf[i]->gpu_mc_addr,
> +				    &buf_type.buffer.buf_base_a_lo,
> +				    &buf_type.buffer.buf_base_a_hi);
> +		buf_type.buffer.buf_size_a =
> +			(u32)sensor_info->meta_info_buf[i]->mem_size;
> +		ret = isp4if_send_command(ispif, CMD_ID_SEND_BUFFER,
> +					  &buf_type,
> +					  sizeof(buf_type));
> +		if (ret) {
> +			dev_err(dev, "send meta info(%u) fail\n", i);
> +			return ret;
> +		}
> +	}
> +
> +	dev_dbg(dev, "send meta info suc\n");
> +	return 0;
> +}
> +
> +static int isp4sd_enum_mbus_code(struct v4l2_subdev *isp_subdev,
> +				 struct v4l2_subdev_state *state,
> +				 struct v4l2_subdev_mbus_code_enum *code_enum)
> +{
> +	if (code_enum->index >= ARRAY_SIZE(isp4sd_image_formats))
> +		return -EINVAL;
> +
> +	code_enum->code = isp4sd_image_formats[code_enum->index].mbus_code;
> +
> +	return 0;
> +}
> +
> +static bool isp4sd_get_str_out_prop(struct isp4_subdev *isp_subdev,
> +				    struct isp4fw_image_prop *out_prop,
> +				    struct v4l2_subdev_state *state, u32 pad)
> +{
> +	struct v4l2_mbus_framefmt *format = NULL;
> +	struct device *dev = isp_subdev->dev;
> +	bool ret;
> +
> +	format = v4l2_subdev_state_get_format(state, pad, 0);
> +	if (!format) {
> +		dev_err(dev, "fail get subdev state format\n");
> +		return false;
> +	}
> +
> +	switch (format->code) {
> +	case MEDIA_BUS_FMT_YUYV8_1_5X8:
> +		out_prop->image_format = IMAGE_FORMAT_NV12;
> +		out_prop->width = format->width;
> +		out_prop->height = format->height;
> +		out_prop->luma_pitch = format->width;
> +		out_prop->chroma_pitch = out_prop->width;
> +		ret = true;
> +		break;
> +	case MEDIA_BUS_FMT_YUYV8_1X16:
> +		out_prop->image_format = IMAGE_FORMAT_YUV422INTERLEAVED;
> +		out_prop->width = format->width;
> +		out_prop->height = format->height;
> +		out_prop->luma_pitch = format->width * 2;
> +		out_prop->chroma_pitch = 0;
> +		ret = true;
> +		break;
> +	default:
> +		dev_err(dev, "fail for bad image format:0x%x\n",
> +			format->code);
> +		ret = false;
> +		break;
> +	}
> +
> +	if (!out_prop->width || !out_prop->height)
> +		ret = false;
> +	return ret;
> +}
> +
> +static int isp4sd_kickoff_stream(struct isp4_subdev *isp_subdev, u32 w, u32 h)
> +{
> +	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
> +	struct isp4_interface *ispif = &isp_subdev->ispif;
> +	struct device *dev = isp_subdev->dev;
> +
> +	if (sensor_info->status == ISP4SD_START_STATUS_STARTED) {
> +		return 0;
> +	} else if (sensor_info->status == ISP4SD_START_STATUS_START_FAIL) {
> +		dev_err(dev, "fail for previous start fail\n");
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(dev, "w:%u,h:%u\n", w, h);
> +
> +	sensor_info->status = ISP4SD_START_STATUS_START_FAIL;
> +
> +	if (isp4sd_send_meta_buf(isp_subdev)) {
> +		dev_err(dev, "fail to send meta buf\n");
> +		return -EINVAL;
> +	};
> +
> +	sensor_info->status = ISP4SD_START_STATUS_NOT_START;
> +
> +	if (!sensor_info->start_stream_cmd_sent &&
> +	    sensor_info->buf_sent_cnt >=
> +	    ISP4SD_MIN_BUF_CNT_BEF_START_STREAM) {
> +		int ret = isp4if_send_command(ispif, CMD_ID_START_STREAM,
> +					      NULL, 0);
> +		if (ret) {
> +			dev_err(dev, "fail to start stream\n");
> +			return ret;
> +		}
> +
> +		sensor_info->start_stream_cmd_sent = true;
> +	} else {
> +		dev_dbg(dev,
> +			"no send START_STREAM, start_sent %u, buf_sent %u\n",
> +			sensor_info->start_stream_cmd_sent,
> +			sensor_info->buf_sent_cnt);
> +	}
> +
> +	return 0;
> +}
> +
> +static int isp4sd_setup_output(struct isp4_subdev *isp_subdev,
> +			       struct v4l2_subdev_state *state, u32 pad)
> +{
> +	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
> +	struct isp4sd_output_info *output_info =
> +			&isp_subdev->sensor_info.output_info;
> +	struct isp4fw_cmd_set_out_ch_prop cmd_ch_prop = {0};
> +	struct isp4_interface *ispif = &isp_subdev->ispif;
> +	struct isp4fw_cmd_enable_out_ch cmd_ch_en = {0};
> +	struct device *dev = isp_subdev->dev;
> +	struct isp4fw_image_prop *out_prop;
> +	int ret;
> +
> +	if (output_info->start_status == ISP4SD_START_STATUS_STARTED)
> +		return 0;
> +
> +	if (output_info->start_status == ISP4SD_START_STATUS_START_FAIL) {
> +		dev_err(dev, "fail for previous start fail\n");
> +		return -EINVAL;
> +	}
> +
> +	out_prop = &cmd_ch_prop.image_prop;
> +	cmd_ch_prop.ch = ISP_PIPE_OUT_CH_PREVIEW;
> +	cmd_ch_en.ch = ISP_PIPE_OUT_CH_PREVIEW;
> +	cmd_ch_en.is_enable = true;
> +
> +	if (!isp4sd_get_str_out_prop(isp_subdev, out_prop, state, pad)) {
> +		dev_err(dev, "fail to get out prop\n");
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(dev, "channel: w:h=%u:%u,lp:%u,cp%u\n",
> +		cmd_ch_prop.image_prop.width, cmd_ch_prop.image_prop.height,
> +		cmd_ch_prop.image_prop.luma_pitch,
> +		cmd_ch_prop.image_prop.chroma_pitch);
> +
> +	ret = isp4if_send_command(ispif, CMD_ID_SET_OUT_CHAN_PROP,
> +				  &cmd_ch_prop,
> +				  sizeof(cmd_ch_prop));
> +	if (ret) {
> +		output_info->start_status = ISP4SD_START_STATUS_START_FAIL;
> +		dev_err(dev, "fail to set out prop\n");
> +		return ret;
> +	};
> +
> +	ret = isp4if_send_command(ispif, CMD_ID_ENABLE_OUT_CHAN,
> +				  &cmd_ch_en, sizeof(cmd_ch_en));
> +
> +	if (ret) {
> +		output_info->start_status = ISP4SD_START_STATUS_START_FAIL;
> +		dev_err(dev, "fail to enable channel\n");
> +		return ret;
> +	}
> +
> +	if (!sensor_info->start_stream_cmd_sent) {
> +		ret = isp4sd_kickoff_stream(isp_subdev, out_prop->width,
> +					    out_prop->height);
> +		if (ret) {
> +			dev_err(dev, "kickoff stream fail %d\n", ret);
> +			return ret;
> +		}
> +		/* sensor_info->start_stream_cmd_sent will be set to true
> +		 * 1. in isp4sd_kickoff_stream, if app first send buffer then
> +		 * start stream
> +		 * 2. in isp_set_stream_buf, if app first start stream, then
> +		 * send buffer
> +		 * because ISP FW has the requirement, host needs to send buffer
> +		 * before send start stream cmd
> +		 */
> +		if (sensor_info->start_stream_cmd_sent) {
> +			sensor_info->status = ISP4SD_START_STATUS_STARTED;
> +			output_info->start_status = ISP4SD_START_STATUS_STARTED;
> +			dev_dbg(dev, "kickoff stream suc,start cmd sent\n");
> +		} else {
> +			dev_dbg(dev, "kickoff stream suc,start cmd not sent\n");
> +		}
> +	} else {
> +		dev_dbg(dev, "stream running, no need kickoff\n");
> +		output_info->start_status = ISP4SD_START_STATUS_STARTED;
> +	}
> +
> +	dev_dbg(dev, "setup output suc\n");
> +	return 0;
> +}
> +
> +static int isp4sd_alloc_meta_buf(struct isp4_subdev *isp_subdev)
> +{
> +	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
> +	struct isp4_interface *ispif = &isp_subdev->ispif;
> +	struct device *dev = isp_subdev->dev;
> +	u32 i;
> +
> +	/* TODO: check alloc method */
> +	for (i = 0; i < ISP4IF_MAX_STREAM_META_BUF_COUNT; i++) {
> +		if (!sensor_info->meta_info_buf[i]) {
> +			sensor_info->meta_info_buf[i] =
> +				ispif->metainfo_buf_pool[i];
> +			if (sensor_info->meta_info_buf[i]) {
> +				dev_dbg(dev, "valid %u meta_info_buf ok\n", i);
> +			} else {
> +				dev_err(dev,
> +					"invalid %u meta_info_buf fail\n", i);
> +				return -ENOMEM;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int isp4sd_init_stream(struct isp4_subdev *isp_subdev)
> +{
> +	struct device *dev = isp_subdev->dev;
> +	int ret;
> +
> +	ret  = isp4sd_setup_fw_mem_pool(isp_subdev);
> +	if (ret) {
> +		dev_err(dev, "fail to  setup fw mem pool\n");
> +		return ret;
> +	}
> +
> +	ret  = isp4sd_alloc_meta_buf(isp_subdev);
> +	if (ret) {
> +		dev_err(dev, "fail to alloc fw driver shared buf\n");
> +		return ret;
> +	}
> +
> +	ret = isp4sd_set_stream_path(isp_subdev);
> +	if (ret) {
> +		dev_err(dev, "fail to setup stream path\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void isp4sd_reset_stream_info(struct isp4_subdev *isp_subdev,
> +				     struct v4l2_subdev_state *state, u32 pad)
> +{
> +	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
> +	struct v4l2_mbus_framefmt *format = NULL;
> +	struct isp4sd_output_info *str_info;
> +	int i;
> +
> +	format = v4l2_subdev_state_get_format(state,
> +					      pad,
> +					      0);
> +
> +	if (!format) {
> +		pr_err("fail reset stream info for not get format\n");
> +
> +	} else {
> +		memset(format, 0, sizeof(*format));
> +		format->code = MEDIA_BUS_FMT_YUYV8_1_5X8;
> +	}
> +
> +	for (i = 0; i < ISP4IF_MAX_STREAM_META_BUF_COUNT; i++)
> +		sensor_info->meta_info_buf[i] = NULL;
> +
> +	str_info = &sensor_info->output_info;
> +	str_info->start_status = ISP4SD_START_STATUS_NOT_START;
> +}
> +
> +static bool isp4sd_is_stream_running(struct isp4_subdev *isp_subdev)
> +{
> +	struct isp4sd_sensor_info *sif;
> +	enum isp4sd_start_status stat;
> +
> +	sif = &isp_subdev->sensor_info;
> +	stat = sif->output_info.start_status;
> +	if (stat == ISP4SD_START_STATUS_STARTED)
> +		return true;
> +
> +	return false;
> +}
> +
> +static void isp4sd_reset_camera_info(struct isp4_subdev *isp_subdev,
> +				     struct v4l2_subdev_state *state, u32 pad)
> +{
> +	struct isp4sd_sensor_info *info  = &isp_subdev->sensor_info;
> +
> +	info->status = ISP4SD_START_STATUS_NOT_START;
> +	isp4sd_reset_stream_info(isp_subdev, state, pad);
> +
> +	info->start_stream_cmd_sent = false;
> +}
> +
> +static int isp4sd_uninit_stream(struct isp4_subdev *isp_subdev,
> +				struct v4l2_subdev_state *state, u32 pad)
> +{
> +	struct isp4_interface *ispif = &isp_subdev->ispif;
> +	struct device *dev = isp_subdev->dev;
> +	bool running;
> +
> +	running = isp4sd_is_stream_running(isp_subdev);
> +
> +	if (running) {
> +		dev_dbg(dev, "fail for stream is still running\n");
> +		return -EINVAL;
> +	}
> +
> +	isp4sd_reset_camera_info(isp_subdev, state, pad);
> +
> +	isp4if_clear_cmdq(ispif);
> +	return 0;
> +}
> +
> +static void isp4sd_fw_resp_cmd_done(struct isp4_subdev *isp_subdev,
> +				    enum isp4if_stream_id stream_id,
> +				    struct isp4fw_resp_cmd_done *para)
> +{
> +	struct isp4_interface *ispif = &isp_subdev->ispif;
> +	struct isp4if_cmd_element *ele =
> +		isp4if_rm_cmd_from_cmdq(ispif, para->cmd_seq_num, para->cmd_id);
> +	struct device *dev = isp_subdev->dev;
> +
> +	dev_dbg(dev, "stream %d,cmd (0x%08x)(%d),seq %u, ele %p\n",
> +		stream_id,
> +		para->cmd_id, para->cmd_status, para->cmd_seq_num,
> +		ele);
> +
> +	if (!ele)
> +		return;
> +
> +	if (ele->wq) {
> +		dev_dbg(dev, "signal event %p\n", ele->wq);
> +		if (ele->wq_cond)
> +			*ele->wq_cond = 1;
> +		wake_up(ele->wq);
> +	}
> +
> +	kfree(ele);
> +}
> +
> +static struct isp4fw_meta_info *
> +isp4sd_get_meta_by_mc(struct isp4_subdev *isp_subdev,
> +		      u64 mc)
> +{
> +	u32 i;
> +
> +	for (i = 0; i < ISP4IF_MAX_STREAM_META_BUF_COUNT; i++) {
> +		struct isp4if_gpu_mem_info *meta_info_buf =
> +				isp_subdev->sensor_info.meta_info_buf[i];
> +
> +		if (meta_info_buf) {
> +			if (mc == meta_info_buf->gpu_mc_addr)
> +				return meta_info_buf->sys_addr;
> +		}
> +	}
> +	return NULL;
> +};
> +
> +static struct isp4if_img_buf_node *
> +isp4sd_preview_done(struct isp4_subdev *isp_subdev,
> +		    struct isp4fw_meta_info *meta)
> +{
> +	struct isp4_interface *ispif = &isp_subdev->ispif;
> +	struct isp4if_img_buf_node *prev = NULL;
> +	struct device *dev = isp_subdev->dev;
> +
> +	if (!meta) {
> +		dev_err(dev, "fail bad param for preview done\n");
> +		return prev;
> +	}
> +
> +	if (meta->preview.enabled &&
> +	    (meta->preview.status == BUFFER_STATUS_SKIPPED ||
> +	     meta->preview.status == BUFFER_STATUS_DONE ||
> +	     meta->preview.status == BUFFER_STATUS_DIRTY)) {
> +		prev = isp4if_dequeue_buffer(ispif);
> +		if (!prev)
> +			dev_err(dev, "fail null prev buf\n");
> +
> +	} else if (meta->preview.enabled) {
> +		dev_err(dev, "fail bad preview status %u\n",
> +			meta->preview.status);
> +	}
> +
> +	return prev;
> +}
> +
> +static void isp4sd_send_meta_info(struct isp4_subdev *isp_subdev,
> +				  u64 meta_info_mc)
> +{
> +	struct isp4_interface *ispif = &isp_subdev->ispif;
> +	struct isp4fw_cmd_send_buffer buf_type;
> +	struct device *dev = isp_subdev->dev;
> +
> +	if (isp_subdev->sensor_info.status != ISP4SD_START_STATUS_STARTED) {
> +		dev_warn(dev, "not working status %i, meta_info 0x%llx\n",
> +			 isp_subdev->sensor_info.status, meta_info_mc);
> +		return;
> +	}
> +
> +	if (meta_info_mc) {
> +		memset(&buf_type, 0, sizeof(buf_type));
> +		buf_type.buffer_type = BUFFER_TYPE_META_INFO;
> +		buf_type.buffer.buf_tags = 0;
> +		buf_type.buffer.vmid_space.bit.vmid = 0;
> +		buf_type.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
> +		isp4if_split_addr64(meta_info_mc,
> +				    &buf_type.buffer.buf_base_a_lo,
> +				    &buf_type.buffer.buf_base_a_hi);
> +
> +		buf_type.buffer.buf_size_a = ISP4SD_META_BUF_SIZE;
> +		if (isp4if_send_command(ispif, CMD_ID_SEND_BUFFER,
> +					&buf_type, sizeof(buf_type))) {
> +			dev_err(dev, "fail send meta_info 0x%llx\n",
> +				meta_info_mc);
> +		} else {
> +			dev_dbg(dev, "resend meta_info 0x%llx\n", meta_info_mc);
> +		}
> +	}
> +}
> +
> +static void isp4sd_fw_resp_frame_done(struct isp4_subdev *isp_subdev,
> +				      enum isp4if_stream_id stream_id,
> +				      struct isp4fw_resp_param_package *para)
> +{
> +	struct isp4if_img_buf_node *prev = NULL;
> +	struct device *dev = isp_subdev->dev;
> +	struct isp4fw_meta_info *meta;
> +	u64 mc = 0;
> +
> +	mc = isp4if_join_addr64(para->package_addr_lo, para->package_addr_hi);
> +	meta = isp4sd_get_meta_by_mc(isp_subdev, mc);
> +	if (mc == 0 || !meta) {
> +		dev_err(dev, "fail to get meta from mc %llx\n", mc);
> +		return;
> +	}
> +
> +	dev_dbg(dev, "ts:%llu,streamId:%d,poc:%u,preview_en:%u,(%i)\n",
> +		ktime_get_ns(), stream_id, meta->poc,
> +		meta->preview.enabled,
> +		meta->preview.status);
> +
> +	prev = isp4sd_preview_done(isp_subdev, meta);
> +
> +	isp4if_dealloc_buffer_node(prev);
> +
> +	if (isp_subdev->sensor_info.status == ISP4SD_START_STATUS_STARTED)
> +		isp4sd_send_meta_info(isp_subdev, mc);
> +
> +	dev_dbg(dev, "stream_id:%d, status:%d\n", stream_id,
> +		isp_subdev->sensor_info.status);
> +}
> +
> +static void isp4sd_fw_resp_func(struct isp4_subdev *isp_subdev,
> +				enum isp4if_stream_id stream_id)
> +{
> +	struct isp4_interface *ispif = &isp_subdev->ispif;
> +	struct device *dev = isp_subdev->dev;
> +	struct isp4fw_resp resp;
> +
> +	if (ispif->status < ISP4IF_STATUS_FW_RUNNING)
> +		return;
> +
> +	while (true) {
> +		s32 ret;
> +
> +		ret = isp4if_f2h_resp(ispif, stream_id, &resp);
> +		if (ret)
> +			break;
> +
> +		switch (resp.resp_id) {
> +		case RESP_ID_CMD_DONE:
> +			isp4sd_fw_resp_cmd_done(isp_subdev, stream_id,
> +						&resp.param.cmd_done);
> +			break;
> +		case RESP_ID_NOTI_FRAME_DONE:
> +			isp4sd_fw_resp_frame_done(isp_subdev, stream_id,
> +						  &resp.param.frame_done);
> +			break;
> +		default:
> +			dev_err(dev, "-><- fail respid (0x%x)\n",
> +				resp.resp_id);
> +			break;
> +		}
> +	}
> +}
> +
> +static s32 isp4sd_fw_resp_thread_wrapper(void *context)
> +{
> +	struct isp4_subdev_thread_param *para = context;
> +	struct isp4sd_thread_handler *thread_ctx;
> +	enum isp4if_stream_id stream_id;
> +
> +	struct isp4_subdev *isp_subdev;
> +	struct device *dev;
> +	u64 timeout;
> +
> +	if (!para)
> +		return -EINVAL;
> +
> +	isp_subdev = para->isp_subdev;
> +	dev = isp_subdev->dev;
> +
> +	switch (para->idx) {
> +	case 0:
> +		stream_id = ISP4IF_STREAM_ID_GLOBAL;
> +		break;
> +	case 1:
> +		stream_id = ISP4IF_STREAM_ID_1;
> +		break;
> +	default:
> +		dev_err(dev, "fail invalid %d\n", para->idx);
> +		return -EINVAL;
> +	}
> +
> +	thread_ctx = &isp_subdev->fw_resp_thread[para->idx];
> +
> +	thread_ctx->wq_cond = 0;
> +	mutex_init(&thread_ctx->mutex);
> +	init_waitqueue_head(&thread_ctx->waitq);
> +	timeout = msecs_to_jiffies(ISP4SD_WAIT_RESP_IRQ_TIMEOUT);
> +
> +	dev_dbg(dev, "[%u] started\n", para->idx);
> +
> +	while (true) {
> +		wait_event_interruptible_timeout(thread_ctx->waitq,
> +						 thread_ctx->wq_cond != 0,
> +						 timeout);
> +		thread_ctx->wq_cond = 0;
> +
> +		if (kthread_should_stop()) {
> +			dev_dbg(dev, "[%u] quit\n", para->idx);
> +			break;
> +		}
> +
> +		mutex_lock(&thread_ctx->mutex);
> +		isp4sd_fw_resp_func(isp_subdev, stream_id);
> +		mutex_unlock(&thread_ctx->mutex);
> +	}
> +
> +	mutex_destroy(&thread_ctx->mutex);
> +
> +	return 0;
> +}
> +
> +static int isp4sd_start_resp_proc_threads(struct isp4_subdev *isp_subdev)
> +{
> +	struct device *dev = isp_subdev->dev;
> +	int i;
> +
> +	for (i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++) {
> +		struct isp4sd_thread_handler *thread_ctx =
> +				&isp_subdev->fw_resp_thread[i];
> +
> +		isp_subdev->isp_resp_para[i].idx = i;
> +		isp_subdev->isp_resp_para[i].isp_subdev = isp_subdev;
> +
> +		thread_ctx->thread = kthread_run(isp4sd_fw_resp_thread_wrapper,
> +						 &isp_subdev->isp_resp_para[i],
> +						 "amd_isp4_thread");
> +		if (IS_ERR(thread_ctx->thread)) {
> +			dev_err(dev, "create thread [%d] fail\n", i);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int isp4sd_stop_resp_proc_threads(struct isp4_subdev *isp_subdev)
> +{
> +	int i;
> +
> +	for (i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++) {
> +		struct isp4sd_thread_handler *thread_ctx =
> +				&isp_subdev->fw_resp_thread[i];
> +
> +		if (thread_ctx->thread) {
> +			kthread_stop(thread_ctx->thread);
> +			thread_ctx->thread = NULL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static u32 isp4sd_get_started_stream_count(struct isp4_subdev *isp_subdev)
> +{
> +	u32 cnt = 0;
> +
> +	if (isp_subdev->sensor_info.status == ISP4SD_START_STATUS_STARTED)
> +		cnt++;
> +	return cnt;
> +}
> +
> +static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev)
> +{
> +	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
> +	unsigned int perf_state = ISP4SD_PERFORMANCE_STATE_LOW;
> +	struct isp4_interface *ispif = &isp_subdev->ispif;
> +
> +	struct device *dev = isp_subdev->dev;
> +	u32 cnt;
> +	int ret;
> +
> +	mutex_lock(&isp_subdev->ops_mutex);
> +
> +	if (sensor_info->status == ISP4SD_START_STATUS_STARTED) {
> +		dev_err(dev, "fail for stream still running\n");
> +		mutex_unlock(&isp_subdev->ops_mutex);
> +		return -EINVAL;
> +	}
> +
> +	sensor_info->status = ISP4SD_START_STATUS_NOT_START;
> +	cnt = isp4sd_get_started_stream_count(isp_subdev);
> +	if (cnt > 0) {
> +		dev_dbg(dev, "no need power off isp_subdev\n");
> +		mutex_unlock(&isp_subdev->ops_mutex);
> +		return 0;
> +	}
> +
> +	isp4if_stop(ispif);
> +
> +	ret = dev_pm_genpd_set_performance_state(dev, perf_state);
> +	if (ret)
> +		dev_err(dev,
> +			"fail to set isp_subdev performance state %u,ret %d\n",
> +			perf_state, ret);
> +	isp4sd_stop_resp_proc_threads(isp_subdev);
> +	dev_dbg(dev, "isp_subdev stop resp proc streads suc");
> +	/* hold ccpu reset */
> +	isp4hw_wreg(isp_subdev->mmio, ISP_SOFT_RESET, 0x0);
> +	isp4hw_wreg(isp_subdev->mmio, ISP_POWER_STATUS, 0);
> +	ret = pm_runtime_put_sync(dev);
> +	if (ret)
> +		dev_err(dev, "power off isp_subdev fail %d\n", ret);
> +	else
> +		dev_dbg(dev, "power off isp_subdev suc\n");
> +
> +	ispif->status = ISP4IF_STATUS_PWR_OFF;
> +	isp4if_clear_cmdq(ispif);
> +	isp4sd_module_enable(isp_subdev, false);
> +
> +	msleep(20);
> +
> +	mutex_unlock(&isp_subdev->ops_mutex);
> +
> +	return 0;
> +}
> +
> +static int isp4sd_pwron_and_init(struct isp4_subdev *isp_subdev)
> +{
> +	struct isp4_interface *ispif = &isp_subdev->ispif;
> +	struct device *dev = isp_subdev->dev;
> +	int ret;
> +
> +	if (ispif->status == ISP4IF_STATUS_FW_RUNNING) {
> +		dev_dbg(dev, "camera already opened, do nothing\n");
> +		return 0;
> +	}
> +
> +	mutex_lock(&isp_subdev->ops_mutex);
> +
> +	isp4sd_module_enable(isp_subdev, true);
> +
> +	isp_subdev->sensor_info.start_stream_cmd_sent = false;
> +	isp_subdev->sensor_info.buf_sent_cnt = 0;
> +
> +	if (ispif->status < ISP4IF_STATUS_PWR_ON) {
> +		unsigned int perf_state = ISP4SD_PERFORMANCE_STATE_HIGH;
> +
> +		ret = pm_runtime_resume_and_get(dev);
> +		if (ret) {
> +			dev_err(dev, "fail to power on isp_subdev ret %d\n",
> +				ret);
> +			goto err_unlock_and_close;
> +		}
> +
> +		/* ISPPG ISP Power Status */
> +		isp4hw_wreg(isp_subdev->mmio, ISP_POWER_STATUS, 0x7FF);
> +		ret = dev_pm_genpd_set_performance_state(dev, perf_state);
> +		if (ret) {
> +			dev_err(dev,
> +				"fail to set performance state %u, ret %d\n",
> +				perf_state, ret);
> +			goto err_unlock_and_close;
> +		}
> +
> +		ispif->status = ISP4IF_STATUS_PWR_ON;
> +
> +		if (isp4sd_start_resp_proc_threads(isp_subdev)) {
> +			dev_err(dev, "isp_start_resp_proc_threads fail");
> +			goto err_unlock_and_close;
> +		} else {
> +			dev_dbg(dev, "create resp threads ok");
> +		}
> +	}
> +
> +	isp_subdev->sensor_info.start_stream_cmd_sent = false;
> +	isp_subdev->sensor_info.buf_sent_cnt = 0;
> +
> +	ret = isp4if_start(ispif);
> +	if (ret) {
> +		dev_err(dev, "fail to start isp_subdev interface\n");
> +		goto err_unlock_and_close;
> +	}
> +
> +	mutex_unlock(&isp_subdev->ops_mutex);
> +	return 0;
> +err_unlock_and_close:
> +	mutex_unlock(&isp_subdev->ops_mutex);
> +	isp4sd_pwroff_and_deinit(isp_subdev);
> +	return -EINVAL;
> +}
> +
> +static int isp4sd_stop_stream(struct isp4_subdev *isp_subdev,
> +			      struct v4l2_subdev_state *state, u32 pad)
> +{
> +	struct isp4sd_output_info *output_info =
> +			&isp_subdev->sensor_info.output_info;
> +	struct isp4_interface *ispif = &isp_subdev->ispif;
> +	struct device *dev = isp_subdev->dev;
> +	int ret = 0;
> +
> +	dev_dbg(dev, "status %i\n", output_info->start_status);
> +	mutex_lock(&isp_subdev->ops_mutex);
> +
> +	if (output_info->start_status == ISP4SD_START_STATUS_STARTED) {
> +		struct isp4fw_cmd_enable_out_ch cmd_ch_disable;
> +
> +		cmd_ch_disable.ch = ISP_PIPE_OUT_CH_PREVIEW;
> +		cmd_ch_disable.is_enable = false;
> +		ret = isp4if_send_command_sync(ispif,
> +					       CMD_ID_ENABLE_OUT_CHAN,
> +					       &cmd_ch_disable,
> +					       sizeof(cmd_ch_disable),
> +					       ISP4SD_FW_CMD_TIMEOUT_IN_MS);
> +		if (ret)
> +			dev_err(dev, "fail to disable stream\n");
> +		else
> +			dev_dbg(dev, "wait disable stream suc\n");
> +
> +		ret = isp4if_send_command_sync(ispif, CMD_ID_STOP_STREAM,
> +					       NULL,
> +					       0,
> +					       ISP4SD_FW_CMD_TIMEOUT_IN_MS);
> +		if (ret)
> +			dev_err(dev, "fail to stop steam\n");
> +		else
> +			dev_dbg(dev, "wait stop stream suc\n");
> +	}
> +
> +	isp4if_clear_bufq(ispif);
> +
> +	output_info->start_status = ISP4SD_START_STATUS_NOT_START;
> +	isp4sd_reset_stream_info(isp_subdev, state, pad);
> +
> +	mutex_unlock(&isp_subdev->ops_mutex);
> +
> +	isp4sd_uninit_stream(isp_subdev, state, pad);
> +
> +	return ret;
> +}
> +
> +static int isp4sd_start_stream(struct isp4_subdev *isp_subdev,
> +			       struct v4l2_subdev_state *state, u32 pad)
> +{
> +	struct isp4sd_output_info *output_info =
> +			&isp_subdev->sensor_info.output_info;
> +	struct isp4_interface *ispif = &isp_subdev->ispif;
> +	struct device *dev = isp_subdev->dev;
> +	int ret;
> +
> +	mutex_lock(&isp_subdev->ops_mutex);
> +
> +	if (ispif->status != ISP4IF_STATUS_FW_RUNNING) {
> +		mutex_unlock(&isp_subdev->ops_mutex);
> +		dev_err(dev, "fail, bad fsm %d", ispif->status);
> +		return -EINVAL;
> +	}
> +
> +	ret = isp4sd_init_stream(isp_subdev);
> +
> +	if (ret) {
> +		dev_err(dev, "fail to init isp_subdev stream\n");
> +		ret = -EINVAL;
> +		goto unlock_and_check_ret;
> +	}
> +
> +	if (output_info->start_status == ISP4SD_START_STATUS_STARTED) {
> +		ret = 0;
> +		dev_dbg(dev, "stream started, do nothing\n");
> +		goto unlock_and_check_ret;
> +	} else if (output_info->start_status ==
> +		   ISP4SD_START_STATUS_START_FAIL) {
> +		ret = -EINVAL;
> +		dev_err(dev, "stream  fail to start before\n");
> +		goto unlock_and_check_ret;
> +	}
> +
> +	if (isp4sd_setup_output(isp_subdev, state, pad)) {
> +		dev_err(dev, "fail to setup output\n");
> +		ret = -EINVAL;
> +	} else {
> +		ret = 0;
> +		dev_dbg(dev, "suc to setup out\n");
> +	}
> +unlock_and_check_ret:
> +	mutex_unlock(&isp_subdev->ops_mutex);
> +	if (ret) {
> +		isp4sd_stop_stream(isp_subdev, state, pad);
> +		dev_err(dev, "start stream fail\n");
> +	} else {
> +		dev_dbg(dev, "start stream suc\n");
> +	}
> +
> +	return ret;
> +}
> +
> +static int isp4sd_subdev_pre_streamon(struct v4l2_subdev *sd, u32 flags)
> +{
> +	struct isp4_subdev *isp_subdev = to_isp4_subdev(sd);
> +	u64 phy_bit_rate = isp_subdev->phy_link_freq * isp_subdev->phy_num_data_lanes / HZ_PER_MHZ;
> +	u32 num_data_lanes = isp_subdev->phy_num_data_lanes;
> +	u32 phy_id = isp_subdev->phy_id;
> +	int ret;
> +
> +	ret = isp4phy_start(isp_subdev->dev,
> +			    isp_subdev->isp_phy_mmio, phy_id,
> +			    phy_bit_rate, num_data_lanes);
> +	if (ret) {
> +		dev_err(isp_subdev->dev,
> +			"fail start phy,lane %d id %u bitrate %llu, %d\n",
> +			num_data_lanes, phy_id, phy_bit_rate, ret);
> +		return ret;
> +	}
> +
> +	dev_dbg(isp_subdev->dev, "start phy suc,lane %d id %u bit_rate %llu\n",
> +		num_data_lanes, phy_id, phy_bit_rate);
> +
> +	return ret;
> +}
> +
> +static int isp4sd_subdev_post_streamoff(struct v4l2_subdev *sd)
> +{
> +	struct isp4_subdev *isp_subdev = to_isp4_subdev(sd);
> +	int ret;
> +
> +	dev_dbg(isp_subdev->dev, "stopping phy %u\n", isp_subdev->phy_id);
> +	ret = isp4phy_stop(isp_subdev->isp_phy_mmio,
> +			   isp_subdev->phy_id);
> +	if (ret)
> +		dev_err(isp_subdev->dev, "fail to stop the Phy:%d", ret);
> +
> +	return ret;
> +}
> +
> +static int isp4sd_set_power(struct v4l2_subdev *sd, int on)
> +{
> +	struct isp4_subdev *ispsd = to_isp4_subdev(sd);
> +
> +	if (on)
> +		return isp4sd_pwron_and_init(ispsd);
> +	else
> +		return isp4sd_pwroff_and_deinit(ispsd);
> +};
> +
> +static const struct v4l2_subdev_core_ops isp4sd_core_ops = {
> +	.s_power = isp4sd_set_power,
> +};
> +
> +static const struct v4l2_subdev_video_ops isp4sd_video_ops = {
> +	.s_stream = v4l2_subdev_s_stream_helper,
> +	.pre_streamon = isp4sd_subdev_pre_streamon,
> +	.post_streamoff = isp4sd_subdev_post_streamoff,
> +};
> +
> +static int isp4sd_set_pad_format(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_format *fmt)
> +{
> +	struct isp4sd_output_info *steam_info =
> +		&(to_isp4_subdev(sd)->sensor_info.output_info);
> +	struct v4l2_mbus_framefmt *format;
> +
> +	format = v4l2_subdev_state_get_format(sd_state, fmt->pad);
> +
> +	if (!format) {
> +		dev_err(sd->dev, "fail to get state format\n");
> +		return -EINVAL;
> +	}
> +
> +	*format = fmt->format;
> +	switch (format->code) {
> +	case MEDIA_BUS_FMT_YUYV8_1_5X8:
> +		steam_info->image_size = format->width * format->height * 3 / 2;
> +		break;
> +	case MEDIA_BUS_FMT_YUYV8_1X16:
> +		steam_info->image_size = format->width * format->height * 2;
> +		break;
> +	default:
> +		steam_info->image_size = 0;
> +		break;
> +	}
> +	if (!steam_info->image_size) {
> +		dev_err(sd->dev,
> +			"fail set pad format,code 0x%x,width %u, height %u\n",
> +			format->code, format->width, format->height);
> +		return -EINVAL;
> +	}
> +	dev_dbg(sd->dev,
> +		"set pad format suc, code:%x w:%u h:%u size:%u\n", format->code,
> +		format->width, format->height, steam_info->image_size);
> +
> +	return 0;
> +}
> +
> +static int isp4sd_enable_streams(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state, u32 pad,
> +				 u64 streams_mask)
> +{
> +	struct isp4_subdev *ispsd = to_isp4_subdev(sd);
> +
> +	return isp4sd_start_stream(ispsd, state, pad);
> +}
> +
> +static int isp4sd_disable_streams(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state, u32 pad,
> +				  u64 streams_mask)
> +{
> +	struct isp4_subdev *ispsd = to_isp4_subdev(sd);
> +
> +	return isp4sd_stop_stream(ispsd, state, pad);
> +}
> +
> +static const struct v4l2_subdev_pad_ops isp4sd_pad_ops = {
> +	.enum_mbus_code	= isp4sd_enum_mbus_code,
> +	.get_fmt = v4l2_subdev_get_fmt,
> +	.set_fmt = isp4sd_set_pad_format,
> +	.enable_streams = isp4sd_enable_streams,
> +	.disable_streams = isp4sd_disable_streams,
> +};
> +
> +static const struct v4l2_subdev_ops isp4sd_subdev_ops = {
> +	.core = &isp4sd_core_ops,
> +	.video = &isp4sd_video_ops,
> +	.pad = &isp4sd_pad_ops,
> +};
> +
> +static int isp4sd_sdev_link_validate(struct media_link *link)
> +{
> +	return 0;
> +}
> +
> +static const struct media_entity_operations isp4sd_sdev_ent_ops = {
> +	.link_validate = isp4sd_sdev_link_validate,
> +};
> +
> +int isp4sd_init(struct isp4_subdev *isp_subdev,
> +		struct v4l2_device *v4l2_dev,
> +		void *amdgpu_dev)
> +{
> +	struct isp4_interface *ispif = &isp_subdev->ispif;
> +	struct isp4sd_sensor_info *sensor_info;
> +	struct device *dev = v4l2_dev->dev;
> +	int ret;
> +
> +	isp_subdev->dev = dev;
> +	isp_subdev->amdgpu_dev = amdgpu_dev;
> +	v4l2_subdev_init(&isp_subdev->sdev, &isp4sd_subdev_ops);
> +	isp_subdev->sdev.owner = THIS_MODULE;
> +	isp_subdev->sdev.dev = dev;
> +	snprintf(isp_subdev->sdev.name, sizeof(isp_subdev->sdev.name), "%s",
> +		 dev_name(dev));
> +
> +	isp_subdev->sdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	isp_subdev->sdev.entity.name = isp4sd_entity_name;
> +	isp_subdev->sdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
> +	isp_subdev->sdev.entity.ops = &isp4sd_sdev_ent_ops;
> +	isp_subdev->sdev_pad[0].flags = MEDIA_PAD_FL_SINK;
> +	isp_subdev->sdev_pad[1].flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&isp_subdev->sdev.entity, 2,
> +				     isp_subdev->sdev_pad);
> +	if (ret) {
> +		dev_err(dev, "fail to init isp4 subdev entity pad %d\n", ret);
> +		return ret;
> +	}
> +	ret = v4l2_subdev_init_finalize(&isp_subdev->sdev);
> +	if (ret < 0) {
> +		dev_err(dev, "fail to init finalize isp4 subdev %d\n",
> +			ret);
> +		return ret;
> +	}
> +	ret = v4l2_device_register_subdev(v4l2_dev, &isp_subdev->sdev);
> +	if (ret) {
> +		dev_err(dev, "fail to register isp4 subdev to V4L2 device %d\n",
> +			ret);
> +		goto err_media_clean_up;
> +	}
> +
> +	sensor_info = &isp_subdev->sensor_info;
> +
> +	isp4if_init(ispif, dev, amdgpu_dev, isp_subdev->mmio);
> +
> +	mutex_init(&isp_subdev->ops_mutex);
> +	sensor_info->start_stream_cmd_sent = false;
> +	sensor_info->status = ISP4SD_START_STATUS_NOT_START;
> +
> +	/* create ISP enable gpio control */
> +	isp_subdev->enable_gpio = devm_gpiod_get(isp_subdev->dev,
> +						 "enable_isp",
> +						 GPIOD_OUT_LOW);
> +	if (IS_ERR(isp_subdev->enable_gpio)) {
> +		dev_err(dev, "fail to get gpiod %d\n", ret);
> +		media_entity_cleanup(&isp_subdev->sdev.entity);
> +		return PTR_ERR(isp_subdev->enable_gpio);
> +	}
> +
> +	isp_subdev->host2fw_seq_num = 1;
> +	ispif->status = ISP4IF_STATUS_PWR_OFF;
> +
> +	if (ret)
> +		goto err_media_clean_up;
> +	return ret;
> +
> +err_media_clean_up:
> +	media_entity_cleanup(&isp_subdev->sdev.entity);
> +	return ret;
> +}
> +
> +void isp4sd_deinit(struct isp4_subdev *isp_subdev)
> +{
> +	struct isp4_interface *ispif = &isp_subdev->ispif;
> +
> +	media_entity_cleanup(&isp_subdev->sdev.entity);
> +	isp4if_deinit(ispif);
> +	isp4sd_module_enable(isp_subdev, false);
> +
> +	ispif->status = ISP4IF_STATUS_PWR_OFF;
> +}
> diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.h b/drivers/media/platform/amd/isp4/isp4_subdev.h
> new file mode 100644
> index 000000000000..bcbb93dce18f
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.h
> @@ -0,0 +1,145 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _ISP4_CONTEXT_H_
> +#define _ISP4_CONTEXT_H_
> +
> +#include <linux/delay.h>
> +#include <linux/firmware.h>
> +#include <linux/platform_device.h>
> +#include <linux/uaccess.h>
> +#include <linux/types.h>
> +#include <linux/debugfs.h>
> +#include <media/v4l2-device.h>
> +#include <media/videobuf2-vmalloc.h>
> +
> +#include "isp4_fw_cmd_resp.h"
> +#include "isp4_hw_reg.h"
> +#include "isp4_interface.h"
> +
> +/*
> + * one is for none sesnor specefic response which is not used now
> + * another is for sensor specific response
> + */
> +#define ISP4SD_MAX_FW_RESP_STREAM_NUM 2
> +
> +/*
> + * cmd used to register frame done callback, parameter is
> + * struct isp4sd_register_framedone_cb_param *
> + * when a image buffer is filled by ISP, ISP will call the registered callback.
> + * callback func prototype is isp4sd_framedone_cb, cb_ctx can be anything
> + * provided by caller which will be provided back as the first parameter of the
> + * callback function.
> + * both cb_func and cb_ctx are provide by caller, set cb_func to NULL to
> + * unregister the callback
> + */
> +
> +/* used to indicate the ISP status*/
> +enum isp4sd_status {
> +	ISP4SD_STATUS_PWR_OFF,
> +	ISP4SD_STATUS_PWR_ON,
> +	ISP4SD_STATUS_FW_RUNNING,
> +	ISP4SD_STATUS_MAX
> +};
> +
> +/*used to indicate the status of sensor, output stream */
> +enum isp4sd_start_status {
> +	ISP4SD_START_STATUS_NOT_START,
> +	ISP4SD_START_STATUS_STARTED,
> +	ISP4SD_START_STATUS_START_FAIL,
> +};
> +
> +struct isp4sd_img_buf_node {
> +	struct list_head node;
> +	struct isp4if_img_buf_info buf_info;
> +};
> +
> +/* this is isp output after processing bayer raw input from sensor */
> +struct isp4sd_output_info {
> +	enum isp4sd_start_status start_status;
> +	u32 image_size;
> +};
> +
> +/* This struct represents the sensor info which is input or source of ISP,
> + * meta_info_buf is the buffer store the fw to driver metainfo response
> + * status is the sensor status
> + * output_info is the isp output info after ISP processing the sensor input,
> + * start_stream_cmd_sent mean if CMD_ID_START_STREAM has sent to fw.
> + * buf_sent_cnt is buffer count app has sent to receive the images
> + */
> +struct isp4sd_sensor_info {
> +	struct isp4if_gpu_mem_info *
> +		meta_info_buf[ISP4IF_MAX_STREAM_META_BUF_COUNT];
> +	struct isp4sd_output_info output_info;
> +	enum isp4sd_start_status status;
> +	bool start_stream_cmd_sent;
> +	u32 buf_sent_cnt;
> +};
> +
> +/*
> + * Thread created by driver to receive fw response
> + * thread will be wakeup by fw to driver response interrupt
> + */
> +struct isp4sd_thread_handler {
> +	struct task_struct *thread;
> +	struct mutex mutex; /* mutex */
> +	wait_queue_head_t waitq;
> +	int wq_cond;
> +};
> +
> +struct isp4_subdev_thread_param {
> +	u32 idx;
> +	struct isp4_subdev *isp_subdev;
> +};
> +
> +struct isp4_subdev {
> +	struct v4l2_subdev sdev;
> +	struct isp4_interface ispif;
> +
> +	/*
> +	 * sdev_pad[0] is sink pad connected to sensor
> +	 * sdev_pad[0] is sink pad connected to sensor
> +	 * sdev_pad[1] is sourc pad connected v4l2 video device
> +	 */
> +	struct media_pad sdev_pad[2];
> +
> +	enum isp4sd_status isp_status;
> +	struct mutex ops_mutex; /* ops_mutex */
> +
> +	/* Used to store fw cmds sent to FW whose response driver needs
> +	 * to wait for
> +	 */
> +	struct isp4sd_thread_handler
> +		fw_resp_thread[ISP4SD_MAX_FW_RESP_STREAM_NUM];
> +
> +	u32 host2fw_seq_num;
> +
> +	struct isp4sd_sensor_info sensor_info;
> +
> +	/* gpio descriptor */
> +	struct gpio_desc *enable_gpio;
> +	struct device *dev;
> +	void *amdgpu_dev;
> +	void __iomem *mmio;
> +	struct isp4_subdev_thread_param
> +		isp_resp_para[ISP4SD_MAX_FW_RESP_STREAM_NUM];
> +#ifdef CONFIG_DEBUG_FS
> +	struct dentry *debugfs_dir;
> +	bool enable_fw_log;
> +	char *fw_log_output;
> +#endif
> +	u32 phy_num_data_lanes;
> +	u32 phy_id;
> +	u64 phy_link_freq;
> +
> +	void __iomem *isp_phy_mmio;
> +};
> +
> +int isp4sd_init(struct isp4_subdev *isp_subdev,
> +		struct v4l2_device *v4l2_dev,
> +		void *amdgpu_dev);
> +void isp4sd_deinit(struct isp4_subdev *isp_subdev);
> +
> +#endif


