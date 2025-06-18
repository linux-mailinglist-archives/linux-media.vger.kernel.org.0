Return-Path: <linux-media+bounces-35201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD859ADF219
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 18:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C0B417FBD1
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 16:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8162EE28B;
	Wed, 18 Jun 2025 16:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HbfTsM9g"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32FB2DE213;
	Wed, 18 Jun 2025 16:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750262442; cv=fail; b=hihxqa2GC7deVH7huy7kQVD9w1+R2EJA8BzOXAHb5JEJTrz5m2Az8xBp8z8JbynFyg3HQ/HpedX2mwkzelZ7mwrLOrGw08g4cRwPiiFFVhFAeeCcOM05oCSPWXeHcOO9aiZRAc/2EEIUSXwQMK+bvW1UOJ+93ikmB14xd3f7ddU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750262442; c=relaxed/simple;
	bh=yqhN+Ea9bvgGVJxAFlpi9NBaAawZ6JkRii/G7uyRVVI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NVwd0s8Yfn0Q4nDpiPWD/CzHJgczbtvD+/gL5E+FIh5wFP0A9hXn2vNi3reITGscZeAbfOdUKQUazl+5mBf6Flw5XCzxZwevzihYGdpahw9aKqkvyoUHJ7dVy5uB0GAPccWjGSPOksqsbj/Cr3bIvZLLhvmVqJnfm7C0vhGAQ4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HbfTsM9g; arc=fail smtp.client-ip=40.107.223.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0iJXEDLjwryYVw9MCNQGaVaIXe1LoJkWZzYvGiR3BRRZNCWWKPGZnsR5Rt15eiYD659BMVryFpOqsun1P+AY3vFcFo7Ptfe1D6UqW5M3HWAF7EqC4OFAvAzMfx65hkNrWBWxBExeiYU9Bu9UUwKmYO0lQwWgZ0tauq8RSiRF0kZk8tZX9bjhxOb7BBh251oioCKQGyxj7wfaFbELhqsS62h4iAc7LgP8B8F6CtU0HOJxE0Qjpvj8Uk+YA2fyXbx1UBhBHd4VzHXx8etwxBAxd31fr4AKPiib/2EHsW8kzsbbJXehdccJfKS6T+6knFGG+PCKTTB8iTdkBp9nDzQPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucp+FNEqMnZNk+NDyOtf3agQnDsThIMQir1waKVyHqY=;
 b=bTWECesaCOhkVeZKHpFpaoEDvgI8LRguLlyJNi8fn+x21Dz2vQ1WNQuOvCFcwIpiXUfOSu32C3U4eUWORbihTIxC6Il00aCqQOT4rpV1QeE2dqC4DcVRS0Y90yVEwwvUo5UGDl1onLCR1Thjx1bfJzsIQxATmBx47DzAGUzaIdbuD7ginoGaYvvSEZBey+yWfBf4K2+3StNghDsAayKGeV652hSf8MYxwUWfzY6Fv27/WKD1dyY/dacLlrdeoMMC/YGlzBte0JdIAXcFwCvkS7TMyKgntTZF/aLerzsZXUjia1YYTi6zfjCCLT+fia+3tULozm9n0fxU/sfwnDmQMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucp+FNEqMnZNk+NDyOtf3agQnDsThIMQir1waKVyHqY=;
 b=HbfTsM9gx0uLFIXOG5kkkEICbecx2Yug6gw64RE5fEPMG4KKR5BLnNzcwfHL86oOqklutt2IW3EwL73zrP6nAZVRR/T/vd/tCEUcPt2t79X/Xa0tiDkJPMcSrxWWWHufnVaXlYRkuJKQl/KyHdlftQ247/dzDudxAWNkiVp2Ox8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW4PR12MB7239.namprd12.prod.outlook.com (2603:10b6:303:228::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Wed, 18 Jun
 2025 16:00:36 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8857.019; Wed, 18 Jun 2025
 16:00:35 +0000
Message-ID: <9aa3dffa-ded6-42f8-a87b-33ba986311d1@amd.com>
Date: Wed, 18 Jun 2025 11:00:32 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] media: platform: amd: low level support for isp4
 firmware
To: Bin Du <Bin.Du@amd.com>, mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 Svetoslav.Stoilov@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-3-Bin.Du@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250618091959.68293-3-Bin.Du@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR15CA0007.namprd15.prod.outlook.com
 (2603:10b6:610:51::17) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW4PR12MB7239:EE_
X-MS-Office365-Filtering-Correlation-Id: bec876e7-34b2-4aa2-0137-08ddae814324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aitpNEVReURRQ1MzOUg0dFhoL3U2aUtOUUsyQ2RQdE5Vc25VY0Q1ZmFrc3RE?=
 =?utf-8?B?TFkraWwvckM3RkxzV0VCK1g1KzFNVXdLclZ3YnBmSWtPSDJOTXRCYWpGK3Z5?=
 =?utf-8?B?dXFvU2kzeEo4Smx3OVk0MTFMRlRZSS9DVzJmanppaFRMNmZ3RlpqSzNMQXdP?=
 =?utf-8?B?aFdCWlFCcEVqWHVoaVhlNEp4alY2T0FZTVhEN2hsaUVFUGRCZXdiYkNqKytq?=
 =?utf-8?B?ZmZUOGNrSXRvN3BOV3ZkTytvMXJXUSt4U28yVUsrZjNsVVpMRVg3ODlSUWtr?=
 =?utf-8?B?SGx0eEZPcks4bWNsSmQyQkZselh1clZRbTY1emN1TC80TjBEbkQrV2RuL1Ri?=
 =?utf-8?B?b2NURDNoK0VpSHJaOE9HVU9BdlRiOWtTeWpQT2pBZlRGZEFTTS9tWW01SEV0?=
 =?utf-8?B?WW5ualU0N09PQlVGN1ppT2RiZlhtSWhmUXF5ZTFwU3BBTHpXamhmZVg3c0pl?=
 =?utf-8?B?dXpXN3VnZ01EaVkzcFZmUWdqZjdSVEZxdEMwTmQ0bHJJcTBwd3laOW5mL2dq?=
 =?utf-8?B?Y1llWlZsMlE3UzlzaG9BRzVDekF2cSsrSzFxajBtblpxSktoQXRvU0NYWDdR?=
 =?utf-8?B?OGZkM2dZY1VrY2dVb1EydEVvWnAwZUlzRStJZStEQnVmSnBLaGFBY1JNaDAv?=
 =?utf-8?B?bEh5Qmp4elRlRWt6S1JsTFUxSisvUzgvbWIzbnZXNTlwZFlpZ0JsTUZWRDNC?=
 =?utf-8?B?TlZ2bHJJWjFVVncvRjM4WmhaT3QvOFovUC9Ed3d0cU9nUFZXYTNCVXNEd09j?=
 =?utf-8?B?VGdyd2RveUxPU2RmeTVyWGZJMGdnRk9MTFcyL05pN3FpTFFSUzZOUnFEVCtS?=
 =?utf-8?B?U25yOFhNVnFJTUt3UHRvUU41cS9NMkVlUmVuR2lTaWRRVEhXM3RJU04zc1RN?=
 =?utf-8?B?Tm8ycHA5RFJ2alFxc2d3WnpsOGI2bUhROHk2TG1JNzQ4cUpNeW0ybVRmbkMw?=
 =?utf-8?B?NlJtSW9FSlVCSm5GdFRKcnZHZmhCbktXVFdQTXp1WUFLN2lJL0tNb1RtNUlM?=
 =?utf-8?B?UnVGejhTb1ZiQWpKQlVHZDNxR3diRyswRFdyLzQ0R05WbzlMS2FpS0NNdXp1?=
 =?utf-8?B?bmVnZG81RFpCTzNZajNqUnhyNFdiUUFrNGdJM1JHcmFLcDFzRmhJdmU1L3NI?=
 =?utf-8?B?NEpsRHllbkdQSThXb2N4Z3JZb3k3ZmtEcldrNUtvWkFxYTY1R1RNTkM1ZmpT?=
 =?utf-8?B?UVAvQVVkTmpXTUpYaUV5eUF3OXBmdG5YejVPSFBDV1g3L0RaSGtYKzc4dERj?=
 =?utf-8?B?VlFwUlZVYVVEVUJ4d3JPVU4vclVZWFJMQ2lRQUdBV1B0OUwyQUdQMmlIQ1V3?=
 =?utf-8?B?RUJWV0drN1FoMWJEaXpqRFRnb0t5Vk9nS3VWajV2Zmwva3VMQ1BIcHROQ3NI?=
 =?utf-8?B?M2RXUDhReUFUY2NCckxQM21xMjJxRzQwdlFIQ0VvU1l4SWVuSFQ5WTFKMmE2?=
 =?utf-8?B?TUd2dngxQXBCTXlyeENRTDRZdngxNFo5OXVwSEZqajl2ZGp0OWZrV2hiTEFt?=
 =?utf-8?B?WHFGSFNWcHROUG5qUHc4RU9HdW12REIwcnN3ZjRHYmNvU1lJb0pzQkp2WXpa?=
 =?utf-8?B?ZXlFcEpSNStSM0x3YndqUnlNaGcrd3dqeFBmY1dlWlVJc3RnQmMxU2lrMEYx?=
 =?utf-8?B?ZE5XcGdFaWV4VENMQ3FTNlZGWXQ1TXg3VWJkOGM1WUhsVktRajZ1NGYzNVI5?=
 =?utf-8?B?NCs0bG1sYTJ5RDdUaWQ1Q3dPYzBnd3FKa1IyR3BkQjFzK2lHRGg3ekNwMFJ2?=
 =?utf-8?B?OVdlL1RldUNTMzZCVUQ0SjJWeXltNy9POVNsSjliTGNvNERWSnp0NVVBS3RC?=
 =?utf-8?B?YVFmUkF0MUtCeFJ2MVY4azVjWWdGQTkrc3ZGK0x0Yit5SW1seU50di95YUVl?=
 =?utf-8?B?V2VxcVBnM3E4VUVpVHFOenFjUEVIUTRtMWVPcVM0dUFIS1hJTjdEbGZDRFkr?=
 =?utf-8?Q?xICztzVvzxw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXpuS1NoVDlKSW1RL1hGSHVxT0QxY0cvMGVueUxOOHVWS3N2TjNiTVl5bW9B?=
 =?utf-8?B?Nmc3U2trYnpvOWs4TWJ2RzZjRXJOMHl2dm9tejhWeWc5bjRHU0lUeUNkWEJY?=
 =?utf-8?B?V25DR05kb2Y4UGJYQllPN24vR0E1NFVubDRrN1VkZVB6WTNhc2VZVmdEeG5P?=
 =?utf-8?B?b1kzWWwxM3hqM0dOb0JZS3JRajFlSWFBcThJb25QWFN3bEU1a29OR1dNZnhZ?=
 =?utf-8?B?VDdUbU1HK1NxcmZNeDFqNzV5WDdFU09oczZHNzZhMFFnVE9sZldrOExYZit1?=
 =?utf-8?B?YVdFRXE4V0RKa2YwS0NnbUxjK2hxL0dMaG9ROS80di8xYjFsaXVYOTRITVdU?=
 =?utf-8?B?cWI0cUs2aUtrOVpuM1dYbXR2Q0NURjBzaWdla1RHOTJTeVQ0d3JmSEt4ZFRB?=
 =?utf-8?B?c29ud3lseEYxZ080bm1Obmo3WkhJcjhXWFVMWndGSVpPeHlyb0lwNTMrSVY0?=
 =?utf-8?B?TDNJdEQ1ZEEzQ2NKcnlxTit3QVQvWlVXajdta2RKbWQxSGRvUkpacW52Rk9X?=
 =?utf-8?B?dHNlVDBRMUVoZTA4TWJKa1FqZGdMYURoczY0WlRWYURpZXpYaGo1V0ZIcStz?=
 =?utf-8?B?NWgwMDRCYS9MZ3AzSWpMWlRRenhOYjVWVXJ0aUV3SFB2a1RMbUJmSWVkUlVP?=
 =?utf-8?B?aEtJdU9RZVJldFNoY201bEhsbkhZQW8vWkl4MVp5YTdtcG45ejY5Rk1HWGV3?=
 =?utf-8?B?UmV0cThzMFdlYVhScXVPUGpkMmptSWVvM2IrYnNPUjB3ZUtNdDNaZHVCN1R2?=
 =?utf-8?B?dzdiM0M0bk1Wa1A4L0VVTmowT0Jta253eG83azRuOVNueVQrc0R1VWRGOVRi?=
 =?utf-8?B?MlRDSWdPNmNuUlplY1BlNEVZMXZDYWp6cjJYdG5aek95QjJhTmlseEJveGht?=
 =?utf-8?B?ZzdVdmJyZ3lkRy9kck1WQmFoTDdyWnlXaE52bmJTMmRRc01VOTh6WURCb1pS?=
 =?utf-8?B?bHhSdnJMVWVTaVRpeUQzaUIxNy9wRGVTS0VIWG8vS2ZZSUdOdXpxb2liNkh1?=
 =?utf-8?B?NkY4NHd2cWJkRVAzeEJVdW5OV3YrRGlXZGtETC84Umx2b0ZzVXNFV3YwSXZP?=
 =?utf-8?B?TkwvZ3FhbGlSNkZHSW1sQjJ4ZDZsMml1NU9abWtWakRwV3dVb3pWY3hpQXQz?=
 =?utf-8?B?V2lHNjhuckZPQWI1R1JmK3R4dUthNlZlNWV6dHpyUnVCb3VHVG9CSkJVd2w2?=
 =?utf-8?B?MDhYSzBkVlB2MmQwd01IZ202dm1nck5SL2tYRDZrWkM1T2c0Qzl0L0ViajdF?=
 =?utf-8?B?OGFCNDUzSDJIWWx4WkZBTW85eTgyUUhlRm45bEZkVHpVak5YM09QNm5NeHZH?=
 =?utf-8?B?bm1KS0dVTTdYU1oyQ1NKeXpCSUoxUDQ5SDdCbXYxSTZLenBteW5sbVZxK2Iv?=
 =?utf-8?B?a3YyOVpiNUwwdnBUWXovV29LalBBQURFUE5YeEY4ME1GV2gxcEVEaEI2ak5N?=
 =?utf-8?B?aGxaZndFUEcrcDZBZlo4T3hqOUpnaFJ6dEN2OUVQeEhKRVpNalFNWTRWcFFy?=
 =?utf-8?B?c1d4bjZRY2ZVY2tyR0hrVE05MENFcStDY0kwdXZuQUZYeWdza2JocmRSRTBC?=
 =?utf-8?B?SS93akdiVEU3R3EyVWdLaithRzVqWVRCRjlTNXNZb3hkRWMwRkhDb3pMNC9k?=
 =?utf-8?B?YkhhM2tKdmJWUVZtNCtkTFMxYnZPTExoUVpYRXR6TytXZEJIc2Y0bitIQTFl?=
 =?utf-8?B?NHhNT2x6ZkxtQ2UxdlRoZExacXdYMnpKYlY0d29HRHBHak05c0NEd1BKN3Yz?=
 =?utf-8?B?dWJNa1kyMElzdXFzOUgwUXlZRWVwUzdYeXk0Q1h3bFR6L2VQclNKRzZYM2VL?=
 =?utf-8?B?K2tEcGtIaTF4OXV0NGVWakJNTTJ4Q2V0S1BCSkJDeDhYWEdLQWJ1ZTFMbVBx?=
 =?utf-8?B?TTAyVHRwTVJ3bVVZeDBQdHEyakNsbVR5bzc0cUVWUldIM0JsTkV0TThIZjJH?=
 =?utf-8?B?SklINmtnQ2dQeHEzSEhCTDlkSGtBYXREbE9qT3laR3Uvd3o2ZHhKS3NucTR6?=
 =?utf-8?B?YkszMndreXcyT0dqT1R1MDhpZnFrMDVZRjNiaEwvYmIyWmVFamdFdDBZeFBW?=
 =?utf-8?B?L3ZDdTFGcUxIWC8yeEQxOG16enh5MFB2SmVxd1pud01YeE9TQnlHdUlUY0ho?=
 =?utf-8?Q?X8blogzuYfsLXZN1DTJFj99Ok?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bec876e7-34b2-4aa2-0137-08ddae814324
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 16:00:35.8250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPM5b+ORzvWbZrs5xuDa3zcj7ac65KiLArVVAPzjVehrltgVZ0IA2PSO0hKigvAQsDgx6O8s1kKFKfbVAXQshw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7239

On 6/18/2025 4:19 AM, Bin Du wrote:
> Low level functions for access the registers and mapping to their ranges.
> This change also includes register definitions for ring buffer used to
> communicate with ISP Firmware.
> Ring buffer is the communication interface between driver and ISP Firmware.
> Command and responses are exchanged through the ring buffer.
> 
> Signed-off-by: Bin Du <Bin.Du@amd.com>
> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>

Same comment as first patch (and others), who wrote it?  Is 
Co-developed-by missing?

> ---
>   drivers/media/platform/amd/isp4/Makefile      |   3 +-
>   drivers/media/platform/amd/isp4/isp4_hw.c     |  46 +++++++
>   drivers/media/platform/amd/isp4/isp4_hw.h     |  14 +++
>   drivers/media/platform/amd/isp4/isp4_hw_reg.h | 116 ++++++++++++++++++
>   4 files changed, 178 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_hw.c
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_hw.h
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_hw_reg.h
> 
> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
> index e9e84160517d..8ca1c4dfe246 100644
> --- a/drivers/media/platform/amd/isp4/Makefile
> +++ b/drivers/media/platform/amd/isp4/Makefile
> @@ -3,7 +3,8 @@
>   # Copyright (C) 2025 Advanced Micro Devices, Inc.
>   
>   obj-$(CONFIG_AMD_ISP4) += amd_capture.o
> -amd_capture-objs := isp4.o
> +amd_capture-objs := isp4.o	\
> +			isp4_hw.o	\
>   
>   ccflags-y += -I$(srctree)/drivers/media/platform/amd/isp4
>   ccflags-y += -I$(srctree)/include
> diff --git a/drivers/media/platform/amd/isp4/isp4_hw.c b/drivers/media/platform/amd/isp4/isp4_hw.c
> new file mode 100644
> index 000000000000..e5315330a514
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4_hw.c
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/io.h>
> +#include <linux/types.h>
> +
> +#include "isp4_hw.h"
> +#include "isp4_hw_reg.h"
> +
> +#define RMMIO_SIZE 524288
> +
> +u32 isp4hw_rreg(void __iomem *base, u32 reg)
> +{
> +	void __iomem *reg_addr;
> +
> +	if (reg >= RMMIO_SIZE)
> +		return RREG_FAILED_VAL;
> +
> +	if (reg < ISP_MIPI_PHY0_REG0)
> +		reg_addr = base + reg;
> +	else if (reg <= ISP_MIPI_PHY0_REG0 + ISP_MIPI_PHY0_SIZE)
> +		reg_addr = base + (reg - ISP_MIPI_PHY0_REG0);
> +	else
> +		return RREG_FAILED_VAL;
> +
> +	return readl(reg_addr);
> +};
> +
> +void isp4hw_wreg(void __iomem *base, u32 reg, u32 val)
> +{
> +	void __iomem *reg_addr;
> +
> +	if (reg >= RMMIO_SIZE)
> +		return;
> +
> +	if (reg < ISP_MIPI_PHY0_REG0)
> +		reg_addr = base + reg;
> +	else if (reg <= ISP_MIPI_PHY0_REG0 + ISP_MIPI_PHY0_SIZE)
> +		reg_addr = base + (reg - ISP_MIPI_PHY0_REG0);
> +	else
> +		return;
> +
> +	writel(val, reg_addr);
> +};
> diff --git a/drivers/media/platform/amd/isp4/isp4_hw.h b/drivers/media/platform/amd/isp4/isp4_hw.h
> new file mode 100644
> index 000000000000..072d135b9e3a
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4_hw.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _ISP4_HW_H_
> +#define _ISP4_HW_H_
> +
> +#define RREG_FAILED_VAL 0xFFFFFFFF
> +
> +u32 isp4hw_rreg(void __iomem *base, u32 reg);
> +void isp4hw_wreg(void __iomem *base, u32 reg, u32 val);
> +
> +#endif
> diff --git a/drivers/media/platform/amd/isp4/isp4_hw_reg.h b/drivers/media/platform/amd/isp4/isp4_hw_reg.h
> new file mode 100644
> index 000000000000..b11f12ba6c56
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4_hw_reg.h
> @@ -0,0 +1,116 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _ISP4_HW_REG_H_
> +#define _ISP4_HW_REG_H_
> +
> +#define ISP_SOFT_RESET		0x62000
> +#define ISP_SYS_INT0_EN		0x62010
> +#define ISP_SYS_INT0_STATUS	0x62014
> +#define ISP_SYS_INT0_ACK	0x62018
> +#define ISP_CCPU_CNTL		0x62054
> +#define ISP_STATUS		0x62058
> +#define ISP_LOG_RB_BASE_LO0	0x62148
> +#define ISP_LOG_RB_BASE_HI0	0x6214C
> +#define ISP_LOG_RB_SIZE0	0x62150
> +#define ISP_LOG_RB_RPTR0	0x62154
> +#define ISP_LOG_RB_WPTR0	0x62158
> +#define ISP_RB_BASE_LO1		0x62170
> +#define ISP_RB_BASE_HI1		0x62174
> +#define ISP_RB_SIZE1		0x62178
> +#define ISP_RB_RPTR1		0x6217C
> +#define ISP_RB_WPTR1		0x62180
> +#define ISP_RB_BASE_LO2		0x62184
> +#define ISP_RB_BASE_HI2		0x62188
> +#define ISP_RB_SIZE2		0x6218C
> +#define ISP_RB_RPTR2		0x62190
> +#define ISP_RB_WPTR2		0x62194
> +#define ISP_RB_BASE_LO3		0x62198
> +#define ISP_RB_BASE_HI3		0x6219C
> +#define ISP_RB_SIZE3		0x621A0
> +#define ISP_RB_RPTR3		0x621A4
> +#define ISP_RB_WPTR3		0x621A8
> +#define ISP_RB_BASE_LO4		0x621AC
> +#define ISP_RB_BASE_HI4		0x621B0
> +#define ISP_RB_SIZE4		0x621B4
> +#define ISP_RB_RPTR4		0x621B8
> +#define ISP_RB_WPTR4		0x621BC
> +#define ISP_RB_BASE_LO5		0x621C0
> +#define ISP_RB_BASE_HI5		0x621C4
> +#define ISP_RB_SIZE5		0x621C8
> +#define ISP_RB_RPTR5		0x621CC
> +#define ISP_RB_WPTR5		0x621D0
> +#define ISP_RB_BASE_LO6		0x621D4
> +#define ISP_RB_BASE_HI6		0x621D8
> +#define ISP_RB_SIZE6		0x621DC
> +#define ISP_RB_RPTR6		0x621E0
> +#define ISP_RB_WPTR6		0x621E4
> +#define ISP_RB_BASE_LO7		0x621E8
> +#define ISP_RB_BASE_HI7		0x621EC
> +#define ISP_RB_SIZE7		0x621F0
> +#define ISP_RB_RPTR7		0x621F4
> +#define ISP_RB_WPTR7		0x621F8
> +#define ISP_RB_BASE_LO8		0x621FC
> +#define ISP_RB_BASE_HI8		0x62200
> +#define ISP_RB_SIZE8		0x62204
> +#define ISP_RB_RPTR8		0x62208
> +#define ISP_RB_WPTR8		0x6220C
> +#define ISP_RB_BASE_LO9		0x62210
> +#define ISP_RB_BASE_HI9		0x62214
> +#define ISP_RB_SIZE9		0x62218
> +#define ISP_RB_RPTR9		0x6221C
> +#define ISP_RB_WPTR9		0x62220
> +#define ISP_RB_BASE_LO10	0x62224
> +#define ISP_RB_BASE_HI10	0x62228
> +#define ISP_RB_SIZE10		0x6222C
> +#define ISP_RB_RPTR10		0x62230
> +#define ISP_RB_WPTR10		0x62234
> +#define ISP_RB_BASE_LO11	0x62238
> +#define ISP_RB_BASE_HI11	0x6223C
> +#define ISP_RB_SIZE11		0x62240
> +#define ISP_RB_RPTR11		0x62244
> +#define ISP_RB_WPTR11		0x62248
> +#define ISP_RB_BASE_LO12	0x6224C
> +#define ISP_RB_BASE_HI12	0x62250
> +#define ISP_RB_SIZE12		0x62254
> +#define ISP_RB_RPTR12		0x62258
> +#define ISP_RB_WPTR12		0x6225C
> +
> +#define ISP_POWER_STATUS	0x60000
> +
> +#define ISP_MIPI_PHY0_REG0	0x66700
> +#define ISP_MIPI_PHY1_REG0	0x66780
> +#define ISP_MIPI_PHY2_REG0	0x67400
> +
> +#define ISP_MIPI_PHY0_SIZE	0xD30
> +
> +/* ISP_SOFT_RESET */
> +#define ISP_SOFT_RESET__CCPU_SOFT_RESET_MASK			0x00000001UL
> +
> +/* ISP_CCPU_CNTL */
> +#define ISP_CCPU_CNTL__CCPU_HOST_SOFT_RST_MASK			0x00040000UL
> +
> +/* ISP_STATUS */
> +#define ISP_STATUS__CCPU_REPORT_MASK				0x000000feUL
> +
> +/* ISP_SYS_INT0_STATUS */
> +#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT9_INT_MASK	0x00010000UL
> +#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT10_INT_MASK	0x00040000UL
> +#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT11_INT_MASK	0x00100000UL
> +#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT12_INT_MASK	0x00400000UL
> +
> +/* ISP_SYS_INT0_EN */
> +#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT9_EN_MASK	0x00010000UL
> +#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT10_EN_MASK	0x00040000UL
> +#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT11_EN_MASK	0x00100000UL
> +#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT12_EN_MASK	0x00400000UL
> +
> +/* ISP_SYS_INT0_ACK */
> +#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT9_ACK_MASK	0x00010000UL
> +#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT10_ACK_MASK	0x00040000UL
> +#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT11_ACK_MASK	0x00100000UL
> +#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT12_ACK_MASK	0x00400000UL
> +
> +#endif


