Return-Path: <linux-media+bounces-36883-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69229AF9FE2
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 13:45:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE922484A64
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 11:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B0424BBEC;
	Sat,  5 Jul 2025 11:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Rgo2nVCv"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71BA1B87C0;
	Sat,  5 Jul 2025 11:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751715927; cv=fail; b=sN/4KY8t2K/iw6RzylwevwfsnMm7pOZcDmafUGOF9XEK9XnU2q+DGzlrZoNucq2PhUApUvgoVLC0zZqlUnUivZHw2KIeB2rGiBR0NZRzJz5PbAUfz7PILT9hOtCd0kAZToK2/lkxKf3U3tAlfna5FgUT0cRp+c9jItfvX3e9Vpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751715927; c=relaxed/simple;
	bh=cv6+852lgCEqzN3QgJ34JAy3Q0+FViOnWC3LjbPXLP8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RmbTf//E5HKFJFiguLPJ7XR9q7sIz0JLRqLZp838lbyTtjnW3nA0mOZBMt1WFxE9RPqLR+oa6fuu13dVWtd0TKuo0lWd8rE3vnqjbLU/PPBkFfEMPQaS2mDsXZvAUOWru8iwyLpAwqqtfho4GeAlR1kGhZhOz8gtwlq8W8a83yc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Rgo2nVCv; arc=fail smtp.client-ip=40.107.220.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lp8YILy2AAj1E9zImbar8axsG6vk05BeP19Suui5FDxqbTwuZGkKFM6Y2TCvLFrNh5i7ffHr6r+DwIOUE1MpIuMiHrZTELsmoLUJisp9TufuitYM8gFN1ymdlUh07DUgsVNG6E3c/qQFXHo/24zqBFarRg8C1IQHrdGIKDEGBdq1FD5adbBVpw3YUyYNJhVwGVzzQuWnR/NjK7G2dgRJjFOTSAHTxZ9evGmco9jj7eTxd8bgVgK6hEMVAJbQKR5DH9m1L3L9cnb3NFW1uBiRd4YCu+6DkTxEImHvam67byflm4C2XSHU4DzGC7+2Mf57dkA5JhTyo7TwdX5akVEauA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+paSo2F/H4/CMehvex0R2lpnT1zsfX5rjEZUz4gHjE=;
 b=CWX2jYSFTEfavsQe2BZuVH6zKVEWG0dvQA5jSqM2l7JZqDVWXGjNyw/grjBJYARP8zkBd2ih3t1sgLIPmSGhSSniirgZbipSRHxJLejini9zzEMO0okFevsDRbGpruepU0oy6D9sES/E31XZDpw1twpWOn5xA2THmzlIObANu6LdGCoypC0fkOqZeOhyrbhh8FFfMITYmWsXOdyv3Kcq8XFW4byCRCWxPGEqEF4MjQgCApREZUxnm0ze2OF9/7i7XjVmvkTnMAfPrwLNdWOa+sZZwbDEINiiYky8FW9dOxSFFixJSBSpuJe5IKBATrC2HdauhHKBd7B+S3H7AFgX8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+paSo2F/H4/CMehvex0R2lpnT1zsfX5rjEZUz4gHjE=;
 b=Rgo2nVCv+e7S/prvWb1lIn1jqwoY5vna1CWJudUbHZ9cRpDetT6Af8oVe+P07K/m3wldKvqbG62oBSS3P76rcNIIuBwYhh6+TKbsk6GwweS+lSKDE6z36oLnpLjhUqAuEUUVBrHEpkCLmBBqAkexi2S0brOTmXJLBIHkwjfktb8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by DS2PR12MB9685.namprd12.prod.outlook.com (2603:10b6:8:27a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Sat, 5 Jul
 2025 11:45:21 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8901.021; Sat, 5 Jul 2025
 11:45:20 +0000
Message-ID: <d0b704d7-46bf-44d5-b97a-6eaf021b6d10@amd.com>
Date: Sat, 5 Jul 2025 07:45:16 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
To: "Yan, Dongcheng" <dongcheng.yan@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hao Yao <hao.yao@intel.com>, Pratap Nirujogi <pratap.nirujogi@amd.com>,
 mchehab@kernel.org, hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
 krzk@kernel.org, dave.stevenson@raspberrypi.com, hdegoede@redhat.com,
 jai.luthra@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com,
 dantony@amd.com, vengutta@amd.com, dongcheng.yan@intel.com,
 jason.z.chen@intel.com, jimmy.su@intel.com
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <6a49eb11-d434-4315-8ee9-0f8aa7347de2@intel.com>
 <aEygCdk-zEqRwfoF@kekkonen.localdomain>
 <20250614225257.GO10542@pendragon.ideasonboard.com>
 <f6d1d8f7-d953-4f86-a196-f713726bd5f8@amd.com>
 <ec790d0e-4bdb-49b9-80ad-f44e1b700a5e@linux.intel.com>
 <702594a4-ebc3-471e-8551-d94f0dee2982@amd.com>
 <0d45fca3-5b6f-42e5-acec-bca2dda25f15@linux.intel.com>
 <aGTN5PbfyHTw529O@svinhufvud> <91985c5e-fc69-4d12-b5b0-3dff0ba1b078@amd.com>
 <7e1d05ef-ab67-421e-b521-90331a304d27@linux.intel.com>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <7e1d05ef-ab67-421e-b521-90331a304d27@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT2PR01CA0027.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::32) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|DS2PR12MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: b70625b3-5c46-4f01-d8b8-08ddbbb96b77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dW4vczVuVWVHUFBZa0d2YmZaQkR3Q28ycXY3QTJ2aWQ1Tjk4ZHVvQ2VmUWJk?=
 =?utf-8?B?czJOWUtKSU00TGxPY3lRb0ZWeklCQXRpWDRhNDNVeFZhV1FNeGpYTHprNnlp?=
 =?utf-8?B?R0pVb1hvaUpFZ0t5ajlyUE80c0ZCaU1HNDJkQkdDdFZ0QkNuTk1DWmRhemdN?=
 =?utf-8?B?cmQveHZNRzBoQzdPSkVYb2ZwLzE5OWpjVzZ3dytsa0RwdG5HRXpyUTI4NlNz?=
 =?utf-8?B?N0JMLzZHUE1hS2pvUHI4WU9DaDgrcUxNWnh3Nk9IN21kMFpiR2U2NWxpdkpq?=
 =?utf-8?B?S2VHY2Z0UGdub0xtVW1BNVpMcXNLa0pFUFNkbGFUZlh0YlpJcFpQSTduQ1Qz?=
 =?utf-8?B?L0RYaU5IVjFjSTdVNWFMN0NWcVFRR29ZeEg3eXRVR29HeGxzdlVzMDBKKzd4?=
 =?utf-8?B?ZTRRMWdjOURDNUJ3UXg4Z2hSNkVWejJRbWpmSUcyOWxUQXkwbVdZNEdWUU1U?=
 =?utf-8?B?S1RhUWkwSy9MTFRIcU1JYmU4WnVmTDI3TUdmbnppd0ZRQjFzL1l6MWl3T1lG?=
 =?utf-8?B?VVBhTURDYlFiMUppNXhZaVRpYUZjTDFSUlZFSG51UStVMVk5NUtjenQxODNi?=
 =?utf-8?B?NUtPdmo3clNJWXpRTFZtSVhMWDNJWEIycU5KaW1VdXBuL1QrRlBmeG44SkNh?=
 =?utf-8?B?aEVDY1J3VjZVWWFmcUhSTWRRUmxVb1JoRndTZVR6c2Z4dFlNNGZYd2NVZkNX?=
 =?utf-8?B?VjVnczJSMHNZSUQzVFoxZlQ4NVh3TU83QzdyUTVYWkJ2S3ZQQkJrdmVnbVZn?=
 =?utf-8?B?V3E4RU1sZklRVzZiL3ZlNnZDdFN1VTRSSS9pbVE4SWp1akNKZlNDOENoZkY0?=
 =?utf-8?B?NGFEaWNHNDZwZ1o3YlZBRWloM2JKMHJFTlVKcFhsNmFMaVFxSHVXNStzNVNw?=
 =?utf-8?B?SWVWRnNEZUFIL0IxUHprN0hpSGpuWXU4K3hoQnRSQThZSGVWRkRUSVVUTlR5?=
 =?utf-8?B?NTR5ZjV4YWJadjZVSDFaUXQySytOVndkNmxLWG03VktCaWl4cWJqRU1ud3VN?=
 =?utf-8?B?b3NCM3RobkdqM2tXMm40NUp5Z0JDK2k1d3NEOXk2eURtZXFLZnJWekNhVGZC?=
 =?utf-8?B?YVFXd3pRMWpYcUFwN0RncDE0ZWZQU3FpTDJvNXFDek1yRUwySG5vT3RiWXZV?=
 =?utf-8?B?MjlPMHFKcVRLL3c4S0UyYWNJS2p5UkZkU2lxVVVFY2t6dmVINjJqU0VhQ0lz?=
 =?utf-8?B?b0tLQWcrVDVnSlZhN1NsdDRzVEM0T0lIeDVvNWFJdGhXYTVCT1hqaUcrVGFG?=
 =?utf-8?B?aUNQcGFGaVV6dTRxZDlvSjBHZGRlb3hQNmZjN3liSGNtd2V6eGUvNGQ4a0Vs?=
 =?utf-8?B?NkJzME9lbTdvWVNTQWxIWWFqbHphT3pXZ25nZXZ0bzR2NnJSSkR0MEhqV1Vs?=
 =?utf-8?B?U3dvaXRSWDFrd3BYdDJsbnBsQy8xc1JLMHRPZDVKc29QMGxIUXl4dzBWRnBF?=
 =?utf-8?B?RkpNaDR0b24yUS9aSGVpUVJJRVZpendsTmF3aFRqcjJOd1JGanJTd0MyZmda?=
 =?utf-8?B?MmRPSUFUdk96eThuQ1pnUjcvdTJ3UU9KYUNGUG5ZbEt3NWVGUE9mR054ajJD?=
 =?utf-8?B?UFQ5anplVmVTcE40Y0hSRWwydXFseHMvVVlTalRrT2EvaDFyWWVVWGlRUEpR?=
 =?utf-8?B?ODRMd3lqcmtlTjZZMEpjZDAwRzVRU3VoVzlCRXhlYWJIRFRYTGwxcFNJb1FM?=
 =?utf-8?B?SlJhR2lvZWhOMldvMzNXMzdzTnU2aUZsOGZYZjhIL21HSThNbnhZT29NU0VG?=
 =?utf-8?B?QkNoRmRlMnJrUktrQzQ3RUVQRE14TnF2akNaMHV3RmNLdFpXcS8wcEw3QXE0?=
 =?utf-8?B?NFlJMVRtTXovVmN4SWQ2ZDkrdWJwUGlHWUtVWkNFdmVoWTI5d3IycTgraGk5?=
 =?utf-8?B?MHlaYXRjMXE5S3ZBVHhpTTdwekxjK00xSzBsRXNHcFBqTW1pTENwbG50WWdF?=
 =?utf-8?Q?OBA1Ki/ld7A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDV3SU1pb3g1YVlNeTJOTzVkWkFkcndlNlRNNldyQjBGdGsrUWltYjFGWkhv?=
 =?utf-8?B?bFVVTWh5K2hpeG9aZE5oTHFIbjl3UW9iNG5UMzBFeWJSbEQzenF6OEJtSjRp?=
 =?utf-8?B?ZWRUYlptdVUxenJYWXRzRHdTaUtkVTlybTRPNVVLM2g1MmpqRHdxazI1TzFy?=
 =?utf-8?B?QzYxa0Q5SGxhY0VYL1hJZFc2MlRSR2dFdmgrenlWNFR6b0RaOXUvYUgzWm5h?=
 =?utf-8?B?S25FVEs1cWgxeGF0ZDBKb1FYc3NVRk1QT3RjQzh1MnR1T202WFV1YlVPRkJO?=
 =?utf-8?B?dE93OWZ2czlFb3BZRmlLUHc4YUd5cjFoNCtsMTZmV1NLV0NUaEd1NW5nRm43?=
 =?utf-8?B?NDdmVEsyYTYvM0lPVXJYOHpncFJuUHE4M2JvUDNFeFFjTW9rVUdBQkpEbU4v?=
 =?utf-8?B?TU04UzlFcjdNbjlnMGMwcUhHZzc4VlVRQmtRUGRaQVF4YXZKS01vZ2tiM3du?=
 =?utf-8?B?VlhxeHVhM3hUcHE1MU1oRDc4RDIvRGlpRVFJU3RrNmZTSVFteWo3dzlPMFhO?=
 =?utf-8?B?bUpBZlpxOEo4Zktya0Z5aU1Kai9EcndyNTdUUElUemZOYVlwdDNmZ0lES3lD?=
 =?utf-8?B?UXhaeldkbysrZ2RPSjVpQWVHZmVlMnE2bENHQkxqTUxlaTI3SGd0cGlFay9Z?=
 =?utf-8?B?bEp2bUNZUUo1UFJocjZ5dzViMmNtTVdQeXRXWTZrdS9FQ1RIQ0RlVjV3S3I3?=
 =?utf-8?B?ZXJZdktFUXdyZWNzREpPdTNsS3g0ZmZOc20xaWc5WUxQTWFZVGNZMDJvTHFT?=
 =?utf-8?B?UzlhNGx4NjROazc4b0VxTytGOUxJbnRybGt6OVBOUkJ3WWNMV3pHVjE2VHlx?=
 =?utf-8?B?NWE1SWVCUEw0ZWVodTk5S1BGa3JOeWt6Nmg3QmJpbE9DYjlhb01pS3N1N090?=
 =?utf-8?B?Y2t0NUUvQnNJa0M3eUVHd1FxR3JpeWtnUFJMWkUxVncyYTJwUCtrT0IwZll1?=
 =?utf-8?B?Q3ZubU9CSzRuUHA5Z0p6eUM3b2RiMkFwdG1VYVp0Q3NhUjgxZnJPaUtkZXBF?=
 =?utf-8?B?R3FWUm9VWFplS1lSaVdmTTQ5ZmMzNzR3VlVPeVl3NFBqY3JWY09WdjdyejQw?=
 =?utf-8?B?UXRsd0IxQkJqWTZGcGxuTTE0TEQ4cmNqYWQ3eEszZyt0MDc3QkFtUS84L3dn?=
 =?utf-8?B?aVNpZDlCV1hoRTFPOXN6OEhXcXRpQ0IreEtsSGVscC9YMzd3SFUzRGV0MlNX?=
 =?utf-8?B?M0xyR2tRNjNjZkZweWlnKzlCYVJCdGNlTzIyRDV6dnIvU2Z3YWExRDkwSUVZ?=
 =?utf-8?B?d2c5VnU0UG9EYnppUGttdTBkQnFjc2V5bWRnb0ZKSmxVZFh4OVdFQ2lsRGVx?=
 =?utf-8?B?Mm1aVkFYQ0FXb1d5bVJwaGRYQUNVSXJIWENEQ0YzTklTclNuTXk1NnlSeThE?=
 =?utf-8?B?S04wbFl1T0tEd2dJRHRqU0toNXA2Slk5YXpVa3daOWtDRzFIRUVqYWZqYlo4?=
 =?utf-8?B?MXlMLzBqclVJMWhvVUs4LytBTXNRWm52Y3RIR1JJaklFTmNlWmp2S1hyZUFZ?=
 =?utf-8?B?L1c2Z0dOSHlwSU9IR3F4MUlBcmxKeVk1NTBzUnJpYjM0Z0tYL2pMa3pERmhn?=
 =?utf-8?B?ZGpWY3lIU0lvK0NrMmt6Q2psdklVbFVZR3gwbGZuUWZ1V2VSME5FdTdmTExo?=
 =?utf-8?B?ckE3MU1mWGwrLytxWGh4ckZtWkZyTTVBQ09iYWcvaEhZSUVpNWxMeUFFOUFv?=
 =?utf-8?B?YWo5N0Mzbm8rZHZCRVBzdDV4aktRV1NPVTVLb3lFUDFISXZra1dPYk1uTWgx?=
 =?utf-8?B?NDBVamZMeE9CQ24wdzRURXhvQUgyTkI3bjZGSHJXcng4R2ZRNjYvbXFMS2ZM?=
 =?utf-8?B?NmRnVnczMXZ0WXFvSlJ2TWVoTlpjRTFSOVZWVW1sajNWSnJ0c3ZkVFI2bG1K?=
 =?utf-8?B?aGVrQ0JlMVJ5RHZqSDdWcHl4ZWJlRnZQczdXbmpqYTVRNzlzcldVRlZ0TXlV?=
 =?utf-8?B?UnlCK284b1p1T0RNei9DZzBqZ3BWMGw3T050aUg2Um1QNEpmNEl2and0VzMx?=
 =?utf-8?B?UlhQSS96WkNhSGpzQ3lFcnYxbkRYWk5FS0hudFFkYzJEbDlnbDJ4QktNcDY1?=
 =?utf-8?B?Y2NMRTd1eXlzcUZFbEUzWlRxUUVTS1U2ZTBYU2gvSloxVzZRblJrSjZYU0dQ?=
 =?utf-8?Q?I6+yKHlgPGt4mI58+JlpWeqyc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b70625b3-5c46-4f01-d8b8-08ddbbb96b77
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2025 11:45:20.5066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N8QLSOXG7w0tNj8ygf1Wyt0mB96GrT2TXQSpWoxiG+7OWJ7mVMAF2UAmIpzbALE4uhmKIxaCIelerxN5m2lc7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9685

Hi Dongcheng,

On 7/3/2025 2:24 AM, Yan, Dongcheng wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On 7/3/2025 12:47 AM, Nirujogi, Pratap wrote:
>> Hi Sakari, Dongcheng,
>>
>> On 7/2/2025 2:12 AM, Sakari Ailus wrote:
>>> Caution: This message originated from an External Source. Use proper
>>> caution when opening attachments, clicking links, or responding.
>>>
>>>
>>> Hi Dongcheng, Pratap,
>>>
>>> On Wed, Jul 02, 2025 at 02:08:26PM +0800, Yan, Dongcheng wrote:
>>>> Hi Pratap,
>>>>
>>>> On 7/1/2025 6:31 AM, Nirujogi, Pratap wrote:
>>>>> Hi Sakari, Hi Laurent,
>>>>>
>>>>> On 6/29/2025 3:40 AM, Sakari Ailus wrote:
>>>>>> Caution: This message originated from an External Source. Use proper
>>>>>> caution when opening attachments, clicking links, or responding.
>>>>>>
>>>>>>
>>>>>> Hi Pratap,
>>>>>>
>>>>>> On 6/17/25 01:33, Nirujogi, Pratap wrote:
>>>>>> ...
>>>>>>>>>>> +static const struct cci_reg_sequence ov05c10_2888x1808_regs[]
>>>>>>>>>>> = {
>>>>>>>>>>> + { CCI_REG8(0xfd),  0x00 },
>>>>>>>>>>> + { CCI_REG8(0x20),  0x00 },
>>>>>>>>>>> + { CCI_REG8(0xfd),  0x00 },
>>>>>>>>>>> + { CCI_REG8(0x20),  0x0b },
>>>>>>>>>>> + { CCI_REG8(0xc1),  0x09 },
>>>>>>>>>>> + { CCI_REG8(0x21),  0x06 },
>>>>>>>>>>> + { CCI_REG8(0x14),  0x78 },
>>>>>>>>>>> + { CCI_REG8(0xe7),  0x03 },
>>>>>>>>>>> + { CCI_REG8(0xe7),  0x00 },
>>>>>>>>>>> + { CCI_REG8(0x21),  0x00 },
>>>>>>>>>>> + { CCI_REG8(0xfd),  0x01 },
>>>>>>>>>>> + { CCI_REG8(0x03),  0x00 },
>>>>>>>>>>> + { CCI_REG8(0x04),  0x06 },
>>>>>>>>>>> + { CCI_REG8(0x05),  0x07 },
>>>>>>>>>>> + { CCI_REG8(0x06),  0x44 },
>>>>>>>>>>> + { CCI_REG8(0x07),  0x08 },
>>>>>>>>>>> + { CCI_REG8(0x1b),  0x01 },
>>>>>>>>>>> + { CCI_REG8(0x24),  0xff },
>>>>>>>>>>> + { CCI_REG8(0x32),  0x03 },
>>>>>>>>>>> + { CCI_REG8(0x42),  0x5d },
>>>>>>>>>>> + { CCI_REG8(0x43),  0x08 },
>>>>>>>>>>> + { CCI_REG8(0x44),  0x81 },
>>>>>>>>>>> + { CCI_REG8(0x46),  0x5f },
>>>>>>>>>>> + { CCI_REG8(0x48),  0x18 },
>>>>>>>>>>> + { CCI_REG8(0x49),  0x04 },
>>>>>>>>>>> + { CCI_REG8(0x5c),  0x18 },
>>>>>>>>>>> + { CCI_REG8(0x5e),  0x13 },
>>>>>>>>>>> + { CCI_REG8(0x70),  0x15 },
>>>>>>>>>>> + { CCI_REG8(0x77),  0x35 },
>>>>>>>>>>> + { CCI_REG8(0x79),  0x00 },
>>>>>>>>>>> + { CCI_REG8(0x7b),  0x08 },
>>>>>>>>>>> + { CCI_REG8(0x7d),  0x08 },
>>>>>>>>>>> + { CCI_REG8(0x7e),  0x08 },
>>>>>>>>>>> + { CCI_REG8(0x7f),  0x08 },
>>>>>>>>>>> + { CCI_REG8(0x90),  0x37 },
>>>>>>>>>>> + { CCI_REG8(0x91),  0x05 },
>>>>>>>>>>> + { CCI_REG8(0x92),  0x18 },
>>>>>>>>>>> + { CCI_REG8(0x93),  0x27 },
>>>>>>>>>>> + { CCI_REG8(0x94),  0x05 },
>>>>>>>>>>> + { CCI_REG8(0x95),  0x38 },
>>>>>>>>>>> + { CCI_REG8(0x9b),  0x00 },
>>>>>>>>>>> + { CCI_REG8(0x9c),  0x06 },
>>>>>>>>>>> + { CCI_REG8(0x9d),  0x28 },
>>>>>>>>>>> + { CCI_REG8(0x9e),  0x06 },
>>>>>>>>>>> + { CCI_REG8(0xb2),  0x0f },
>>>>>>>>>>> + { CCI_REG8(0xb3),  0x29 },
>>>>>>>>>>> + { CCI_REG8(0xbf),  0x3c },
>>>>>>>>>>> + { CCI_REG8(0xc2),  0x04 },
>>>>>>>>>>> + { CCI_REG8(0xc4),  0x00 },
>>>>>>>>>>> + { CCI_REG8(0xca),  0x20 },
>>>>>>>>>>> + { CCI_REG8(0xcb),  0x20 },
>>>>>>>>>>> + { CCI_REG8(0xcc),  0x28 },
>>>>>>>>>>> + { CCI_REG8(0xcd),  0x28 },
>>>>>>>>>>> + { CCI_REG8(0xce),  0x20 },
>>>>>>>>>>> + { CCI_REG8(0xcf),  0x20 },
>>>>>>>>>>> + { CCI_REG8(0xd0),  0x2a },
>>>>>>>>>>> + { CCI_REG8(0xd1),  0x2a },
>>>>>>>>>>> + { CCI_REG8(0xfd),  0x0f },
>>>>>>>>>>> + { CCI_REG8(0x00),  0x00 },
>>>>>>>>>>> + { CCI_REG8(0x01),  0xa0 },
>>>>>>>>>>> + { CCI_REG8(0x02),  0x48 },
>>>>>>>>>>> + { CCI_REG8(0x07),  0x8f },
>>>>>>>>>>> + { CCI_REG8(0x08),  0x70 },
>>>>>>>>>>> + { CCI_REG8(0x09),  0x01 },
>>>>>>>>>>> + { CCI_REG8(0x0b),  0x40 },
>>>>>>>>>>> + { CCI_REG8(0x0d),  0x07 },
>>>>>>>>>>> + { CCI_REG8(0x11),  0x33 },
>>>>>>>>>>> + { CCI_REG8(0x12),  0x77 },
>>>>>>>>>>> + { CCI_REG8(0x13),  0x66 },
>>>>>>>>>>> + { CCI_REG8(0x14),  0x65 },
>>>>>>>>>>> + { CCI_REG8(0x15),  0x37 },
>>>>>>>>>>> + { CCI_REG8(0x16),  0xbf },
>>>>>>>>>>> + { CCI_REG8(0x17),  0xff },
>>>>>>>>>>> + { CCI_REG8(0x18),  0xff },
>>>>>>>>>>> + { CCI_REG8(0x19),  0x12 },
>>>>>>>>>>> + { CCI_REG8(0x1a),  0x10 },
>>>>>>>>>>> + { CCI_REG8(0x1c),  0x77 },
>>>>>>>>>>> + { CCI_REG8(0x1d),  0x77 },
>>>>>>>>>>> + { CCI_REG8(0x20),  0x0f },
>>>>>>>>>>> + { CCI_REG8(0x21),  0x0f },
>>>>>>>>>>> + { CCI_REG8(0x22),  0x0f },
>>>>>>>>>>> + { CCI_REG8(0x23),  0x0f },
>>>>>>>>>>> + { CCI_REG8(0x2b),  0x20 },
>>>>>>>>>>> + { CCI_REG8(0x2c),  0x20 },
>>>>>>>>>>> + { CCI_REG8(0x2d),  0x04 },
>>>>>>>>>>> + { CCI_REG8(0xfd),  0x03 },
>>>>>>>>>>> + { CCI_REG8(0x9d),  0x0f },
>>>>>>>>>>> + { CCI_REG8(0x9f),  0x40 },
>>>>>>>>>>> + { CCI_REG8(0xfd),  0x00 },
>>>>>>>>>>> + { CCI_REG8(0x20),  0x1b },
>>>>>>>>>>> + { CCI_REG8(0xfd),  0x04 },
>>>>>>>>>>> + { CCI_REG8(0x19),  0x60 },
>>>>>>>>>>> + { CCI_REG8(0xfd),  0x02 },
>>>>>>>>>>> + { CCI_REG8(0x75),  0x05 },
>>>>>>>>>>> + { CCI_REG8(0x7f),  0x06 },
>>>>>>>>>>> + { CCI_REG8(0x9a),  0x03 },
>>>>>>>>>>> + { CCI_REG8(0xa2),  0x07 },
>>>>>>>>>>> + { CCI_REG8(0xa3),  0x10 },
>>>>>>>>>>> + { CCI_REG8(0xa5),  0x02 },
>>>>>>>>>>> + { CCI_REG8(0xa6),  0x0b },
>>>>>>>>>>> + { CCI_REG8(0xa7),  0x48 },
>>>>>>>>>>> + { CCI_REG8(0xfd),  0x07 },
>>>>>>>>>>> + { CCI_REG8(0x42),  0x00 },
>>>>>>>>>>> + { CCI_REG8(0x43),  0x80 },
>>>>>>>>>>> + { CCI_REG8(0x44),  0x00 },
>>>>>>>>>>> + { CCI_REG8(0x45),  0x80 },
>>>>>>>>>>> + { CCI_REG8(0x46),  0x00 },
>>>>>>>>>>> + { CCI_REG8(0x47),  0x80 },
>>>>>>>>>>> + { CCI_REG8(0x48),  0x00 },
>>>>>>>>>>> + { CCI_REG8(0x49),  0x80 },
>>>>>>>>>>> + { CCI_REG8(0x00),  0xf7 },
>>>>>>>>>>> + { CCI_REG8(0xfd),  0x00 },
>>>>>>>>>>> + { CCI_REG8(0xe7),  0x03 },
>>>>>>>>>>> + { CCI_REG8(0xe7),  0x00 },
>>>>>>>>>>> + { CCI_REG8(0xfd),  0x00 },
>>>>>>>>>>> + { CCI_REG8(0x93),  0x18 },
>>>>>>>>>>> + { CCI_REG8(0x94),  0xff },
>>>>>>>>>>> + { CCI_REG8(0x95),  0xbd },
>>>>>>>>>>> + { CCI_REG8(0x96),  0x1a },
>>>>>>>>>>> + { CCI_REG8(0x98),  0x04 },
>>>>>>>>>>> + { CCI_REG8(0x99),  0x08 },
>>>>>>>>>>> + { CCI_REG8(0x9b),  0x10 },
>>>>>>>>>>> + { CCI_REG8(0x9c),  0x3f },
>>>>>>>>>>> + { CCI_REG8(0xa1),  0x05 },
>>>>>>>>>>> + { CCI_REG8(0xa4),  0x2f },
>>>>>>>>>>> + { CCI_REG8(0xc0),  0x0c },
>>>>>>>>>>> + { CCI_REG8(0xc1),  0x08 },
>>>>>>>>>>> + { CCI_REG8(0xc2),  0x00 },
>>>>>>>>>>> + { CCI_REG8(0xb6),  0x20 },
>>>>>>>>>>> + { CCI_REG8(0xbb),  0x80 },
>>>>>>>>>>> + { CCI_REG8(0xfd),  0x00 },
>>>>>>>>>>> + { CCI_REG8(0xa0),  0x01 },
>>>>>>>>>>> + { CCI_REG8(0xfd),  0x01 },
>>>>>>>>
>>>>>>>> Please replace these with names macros where possible. I'm sure
>>>>>>>> quite a
>>>>>>>> few of the registers configured here are documented in the
>>>>>>>> datasheet.
>>>>>>>> The registers that configure the mode (analog crop, digital crop,
>>>>>>>> binning, skipping, ...) should be computed dynamically from the
>>>>>>>> subdev
>>>>>>>> pad format and selection rectangles, not hardcoded.
>>>>>>>>
>>>>>>> I agree, but we get the sensor settings based on our requirements
>>>>>>> from
>>>>>>> the vendor, i will check if we can get some more info regarding the
>>>>>>> crop, binning, skipping etc...
>>>>>>
>>>>>> Some of this infomation should be available in the datasheet. Use at
>>>>>> least the register names that can be found, for those that can't
>>>>>> there's
>>>>>> not much that could be done.
>>>>>>
>>>>> Sorry to say that I don't have the details in this case. We have
>>>>> previously reached out to the sensor vendor, but they are not
>>>>> willing to
>>>>> disclose any of these details. We hope for your understanding of the
>>>>> constraints we're facing and truly value your support.
>>>>>
>>>>
>>>> If you have a spec of OV05C10 (I assume you do, as the developer of this
>>>> driver), it is not a issue.
>>>> Take P0:0x14 as an example, it's named as DPLL_NC_SEL in spec and set to
>>>> 0x78 in your reglist ov05c10_2888x1808_regs. If define all named
>>>> registers rather than the confusing magic hardcode, the driver code will
>>>> be more readable and easy to review.
>>>> I think this is what Sakari thought.
>>>
>>> Yes. And even if it happens that a register write slips to a wrong list,
>>> we can fix it later.
>>>
>> I agree with the suggestion on proper naming of register offsets, but
>> unfortunately we lack access to the spec.
> 
> Do you mean this driver is developed without spec? Noticing that
> OV05C10_*CTL_PAGE and OV05C10_REG_* are defined quite standard, I never
> doubt it. Excuse me for being a little straightforward, I even doubt
> whether this driver can work properly.
> 
I can confirm that the driver works reliably. This was verified with the 
ISP patch series submitted for review. Please refer 
https://lore.kernel.org/lkml/20250618091959.68293-1-Bin.Du@amd.com/

We have incorporated all register names provided by the sensor vendor. 
Unfortunately, for the remaining registers, we don't have the details 
from the vendor. Maybe in future when the sensor vendor choose to share 
the details, we will be happy to submit an updated patch accordingly.

Thanks,
Pratap

>   We are completely relying on
>> the sensor vendor for these sequences, which they are not willing to
>> share the details.
>>
>> Thanks,
>> Pratap
>>
>>> --
>>> Kind regards,
>>>
>>> Sakari Ailus
>>
> 


