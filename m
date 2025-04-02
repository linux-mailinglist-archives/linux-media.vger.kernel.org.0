Return-Path: <linux-media+bounces-29275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDCCA7980C
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 00:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 064661895F36
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 22:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FBE41F4CBC;
	Wed,  2 Apr 2025 22:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0hSBH7EN"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2080.outbound.protection.outlook.com [40.107.100.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9FE1E8326;
	Wed,  2 Apr 2025 22:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743631466; cv=fail; b=i850f/o6BUOH2FJfEcOy7ZLwF0d9ofVt+SXSzSoLzr6JTfL3KgxsvlYbRWRShfXb8t9rppt2EaRXIHomT1B6IYStrcN88Cw67V/PYFYbTbRNzuZ271FuqV5QBItIAkvR1GJZwcs/fLawizgGtGVC4p/QfgehbNLPCaLQ5XXVoVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743631466; c=relaxed/simple;
	bh=Cy4hrJEtwtsutx36prBI6lP5hba6+jJbh9JhHH/EzIc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KOrscK56SF5Z5zExpUMvX1m/OtP1Ja/MZX/TR+KJff+kqLAb+x2fl9rxmwaN7HxmVn5I86eJDpFWmp1ett6pQS2XBPSijMK3JobYKG0gNSRw9P8fB+Pn+lG9QnwlB/B3n5eAy1OVgRQnD/xS3Uw0WH2QhuZn1AXR2LKk+/CjTh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0hSBH7EN; arc=fail smtp.client-ip=40.107.100.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBhflaumbl0oNxxt9d62zjxqFT2ZWs+ZFDh250Lb71tQvJXHQwT0nmgZmQbOjTKQyXXcmVJ8i3r5nucrXKFMGGhplDNToD4sTn3Pqi9wMLdpqFKAibePOuUC1GuMCsAR4SvlM9J4Pxr6j3+jemzyE6oVh5nEFGM4HE6pgCEZ2AY3KZj9sUJ5cbP4L0FlNMS4G9CHOhfulHzMza1eZLfdSjDO2Uh/uXVxHpCW9YBdAeMwJyUBaXIPXViMWhvxtu7Jnm7fpweWMIiKVfftX+d3pp1wIVq3QGNDU1OMTKY+xyLlHmXrB6CRTf+/jVPLWkZEqAnfrMdkuvc9ZcTGSyHMkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8+VfJa4Z585kAt5E7I71ZG/BeIog5ExGHVkF/tlKyY=;
 b=EW4hrDPQQjJkCcFUC90aC1Xl83zs0F0sNA6Jd7nDReg5nprkM2QBDMyydOjS78FP7IGm9QVaxINeSLWO/SFBENVmWX3MWkjgnqd047beWsUittZmGqG3xNLf6kE21G3HdlWlwBo9EHVMp2q1svqeJKCGY4U/kN15K67/w2ajjNutmu6TlZP2lAKiN9Uxa53epANxnagUbdz6AxyFFYGlLqJAiEOdqmq0cxvJh7KqP6EU/qLLyAYIH22C8r6l4l/WqbmLZ7tl7lY8tdTGT7qu0r0WWuKh4IqeDEm1njryk2s5Jv9f0EE7wNubnCOp+MF3UacrPS2qchyIYFY6F+bkGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8+VfJa4Z585kAt5E7I71ZG/BeIog5ExGHVkF/tlKyY=;
 b=0hSBH7ENhAnqM3KImF53ylErg/b6J8qmNZKc8+Cl/edTysong6d1c0G3xRVcqnEAF98X+dIMclHMzTgwEkIO86Lke7gGmBOCUvSx4d/63KR+NTDOQnjNkPQhzfHzf0TR+jvl+bO97peIr/JrlVKQRhU5nEsmnzYbZMAPTe9+N6s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6440.namprd12.prod.outlook.com (2603:10b6:8:c8::18) by
 PH7PR12MB6658.namprd12.prod.outlook.com (2603:10b6:510:211::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 22:04:19 +0000
Received: from DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620]) by DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620%6]) with mapi id 15.20.8583.041; Wed, 2 Apr 2025
 22:04:19 +0000
Message-ID: <e14637fa-6116-4378-ace2-8343a1fc9165@amd.com>
Date: Wed, 2 Apr 2025 18:04:17 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: i2c: Add OV05C10 camera sensor driver
Content-Language: en-GB
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 dave.stevenson@raspberrypi.com, krzk@kernel.org, dan.carpenter@linaro.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com,
 dantony@amd.com, Venkata Narendra Kumar Gutta <vengutta@amd.com>
References: <MhUYQD7uWnfZQAPq7VslFWPHOmx2B2UfAIpbMhLq1-7GC_i5bI2hhns_-ov_AAVpEH_VmDDFYkS5aOKBwnY61g==@protonmail.internalid>
 <20250328214706.1516566-1-pratap.nirujogi@amd.com>
 <fef11ce6-b3b6-4677-9387-13332b9a9d43@linaro.org>
 <6ba024ef-4757-4db0-b12a-d56622329bb0@amd.com>
 <20250402012052.GG4845@pendragon.ideasonboard.com>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <20250402012052.GG4845@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0278.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:109::19) To DS0PR12MB6440.namprd12.prod.outlook.com
 (2603:10b6:8:c8::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6440:EE_|PH7PR12MB6658:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fc6db9e-2cd7-4316-5180-08dd72325112
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TFNHSHlJTG9PL00yY2hFUnA3Z3ZXZkJlSllvL0JHL2d0QlRtQ0ZWTkdMajZH?=
 =?utf-8?B?QXpQbE55RHVwUmp3MWZhZWJiV3JhaWlJdWZhZndDa25hWEhpQWF3a243SjAy?=
 =?utf-8?B?MXVQMktZZjdsSERXUjhpNFRaL0QzRVRZeTRRQjRpbklnZUFZSitSTlJYU0FN?=
 =?utf-8?B?Q0MxZjVOci9zczV6SzluS2FoZ05tMm5laksvZG9PZ0gveTRKaCs4ODFoQXR3?=
 =?utf-8?B?aWh0eE84MlV1Nks0TlZjdzVWSHQxQW9zaUY4VHRkTFhtdExuK1hsYkdvQXpa?=
 =?utf-8?B?eWkzZnNjT2NKRFFkdll3U3VxMDhsVGZTRVlYemlNVExyb1RPdEhmMG00YmhG?=
 =?utf-8?B?cWdTQTlXVU05VTNLc0s1TFdQSWJxelZNSmZHRlhXSXJKbDN6SndHZW15Q0NI?=
 =?utf-8?B?Y3hFQlhVdk5aS3VqTG9ibnpoMFMvRFp6SzBzWHpiQ0YvMEJ3NnE4LzlYZ2dO?=
 =?utf-8?B?dlZXMUVGNlpmVmlmbFVXOEhOUFhLbWp5MmpIV0RtRDVRSE9HR3M4dzF1c2hK?=
 =?utf-8?B?elh5T1p6SGlUSGlhbXV4YW42cllGSURrSEpjL2pyL3BDNjNhNmZuckpub2tz?=
 =?utf-8?B?OVBlbTlIV1NMR3I2aENSOUFDT3g1Q1UrSC82VDR3dE8xUWNDRUhEK2NQZVZO?=
 =?utf-8?B?NGN1cEx3MTh0OWU4RlVEUGtXTjNjWE9aeXg5a1NjM29OZURwb0h2Wk1XOXdP?=
 =?utf-8?B?bStkeHdRMHY5US9POERHc09CbWpadUxKNEN2VTVkeThHOGdWYmFjN2laVmlP?=
 =?utf-8?B?bU8ycEt1NnQxRmFqc3A0MkNOMmNzTUp3MWduQjN6eHFxb1V1c3JWTjVmMUtI?=
 =?utf-8?B?Vlo0anVpOWpBdHA0c2N5U0Y1YUxFWFJua1orUW55ZU8wa0trUTF2Syt5TlM0?=
 =?utf-8?B?dkY0TUpnZ2ZJT1dZNlA0VVJvcjNBOXU2bTU2dk14bVZqWnFNS1c4Z1plN3JF?=
 =?utf-8?B?WGFFOGFpMStLbGhrQTZUeHZpek5yM1ZUL3hzMWRzRTQ3eUlGcmJ0UGxDaVc0?=
 =?utf-8?B?YnZ5eGI3cGNBQXRxMlEvYm1GWjFRTkd2R1VVSnRlcUE4YkExdFNnZVVhaTJX?=
 =?utf-8?B?TngvbDYraXFEUFpKSm5DSVJPSnJDTmVPNEVaYVhXVkRGSmpQNmJTZVBEN1JO?=
 =?utf-8?B?NGxoSGRSTGxHLzJ3NjJwVjJ2SHBSL2VJejU4KzI2dHI0RTBEQ0VjYjF6dUgz?=
 =?utf-8?B?QjV2eDFVTGkxZXJyTDBzOWJidEttY1JOVjV6ektJTjRWeks0ekltK01WK1Qw?=
 =?utf-8?B?bFovU2JnRGxqMktHbnR1SzZ5L3B4YmV1RTFNV3YvZFNWaERpcmVPbUtZSGgz?=
 =?utf-8?B?c3NoR0p3MktvREdKWis0LzVDS0pxQnlZTmNJYkQzWi9wN3cxOVI1Y3FoTGhQ?=
 =?utf-8?B?Y0kwQjV6QnFtYUwwaFd2SHR4OTcxUnVSWTN0NktlSVRZRHVacmtKRm9rSUJX?=
 =?utf-8?B?bVdjT0Z1ZkZEa0VGK0JJVUhSMWhIWkJyZk45R0kvVjBDTHlrWkVLL05tYUxp?=
 =?utf-8?B?MGdhc1RXWjUraFlWWUc0RzBkOFMzaVgyQkU3VGorbWUvbmxmVlZncGZkclQ4?=
 =?utf-8?B?MnJrZUlSUWVnZmZlSEZ1ZzRtMlYvVFJyUzlOZ1RKbW8zNTM1WnNGRWxyOHlW?=
 =?utf-8?B?VHF5a1ZmaFZnek1iQzJwQ1E3Mmk5M0w2TWZQaW55cmxUWTMxOVAwUXFaVy9j?=
 =?utf-8?B?UVFSSWZsQ2xIYTBSM0MxQzBQSHdsSjJmZ0x3ZlFVWGp1L205SnNBRUw3VXJ4?=
 =?utf-8?B?SzkyWTJ0WXhrMm4wMDFsSnlMNjRZT2dZQlBhblhhRWFBQjVCWnF4dmRkait2?=
 =?utf-8?B?djBlSUJSeUlZUFpYQVoydz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6440.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yi9jZitnOWh3M2V0V1NrK09ybFJwYTlOdHZzeEp2S3F3cll4LzZDakxZNWhS?=
 =?utf-8?B?T0dVWm9LNHZGMjZ2bDNCeGQvRm9jU3d6a0ordm83Q3FCVDgyUG8rbjkremJB?=
 =?utf-8?B?dHF0QWhLa0lUU1RQUHpHTzRsSyttMlVVZUxScVpXTkxTL29KWjkwTkJSajZ4?=
 =?utf-8?B?aVNhM3FjUjlHY1lVYVpDcW5xeXZqa1BrRDk1bmZFd2d4MHVKb0NWMTVCVnNa?=
 =?utf-8?B?dzZ4OWhRVWxoRlVCZVpzTC9leTBhczdDYXZxZHpxVTJsR1VoYkRGRk5TK09Z?=
 =?utf-8?B?bE1IYS9DUjVyRFRlTTBMNkYzUkQ0eXlxVmxiUUxXd2pQNktnaWFVQmJJQTJn?=
 =?utf-8?B?ajdCV2hxMk45ekxxWmhia2JlV0o3bGR2VXNWVUc1dDg1OWRtcmY2dmRnQzdM?=
 =?utf-8?B?MGZwMXJQUWNUcHg5N0JDTk12VDRtczZGUGRNVEwyWnRkaG1Rb3BhMUUvN04r?=
 =?utf-8?B?c3JwS2xRL21za3JSOXJFZGdkQW01NElDbWJFTkhncWVBQTA2SWpYUlZWYjRT?=
 =?utf-8?B?clZFUFVUVWxZcXlpSmU5ajNGaDN1anVUUlVtSktyOUtSS3hoL2FqNXJFNm5O?=
 =?utf-8?B?TDRvVVZGdEFpa2hidXBuM3lXcE9ZcVhTckVhSmdmM3dOY2sya2p1VndOblgr?=
 =?utf-8?B?V3daNzBOUVQ3N1BWR2RINmRycG5TY0RrditmRjFiSHF4TStOY3kzRWhuSDFT?=
 =?utf-8?B?YVpkR0lRMWtlb3AvbW95dFFZbTZxVlo1MnhQdmgrbEw0VzhnQTEza2paNGNk?=
 =?utf-8?B?YmdqblI5aEk4MmVCQzVJY3lHR0NibUNLVTBPSUVxNG15NjhZeng4U3ZXUGdk?=
 =?utf-8?B?WW55OGxqNjE4RkUxZzhkSnExS0dYMW5haWJSdGFsWVRLNVI5TjRhbnVOYUxv?=
 =?utf-8?B?Zk53QzRlQWFkNG5LWitzaktvZ2JnWExWZTdkUUI3N3lORGRnd0F2amQ1NHNl?=
 =?utf-8?B?bWNBMGsxbEJ1TzI0ZlBiNzM0QUpkODNScGZQdGIxT1V1Y2toNUppeWl2a1VP?=
 =?utf-8?B?T1dUNFJ5S2YwVkxMUHZUaVJQMm9IQlgvbzdNZDlQcjNURmNtQTAxZDFjTEhu?=
 =?utf-8?B?U2F4V3V5OUduamY2ekxJVE5GSXZPcFVGKzhnVllwcS84UmhGN08rQmRwNFBt?=
 =?utf-8?B?cy9MM2Njd0wrSC9EN0hYQlMvdnI1bmRIWGxKVVhNb0htUGFJLzhDT252L0xK?=
 =?utf-8?B?Q0pwUEx1QitMbmpWZDIzNTVnZC9SQVMzd0dXT011cjRWZ0dxb3BHVkRmUFls?=
 =?utf-8?B?UmEwQVgrNFhoYmYzN2FNMDNvN3htcHkxTS9NdHQ4eEZYeUlqMnNaaUhZdVVR?=
 =?utf-8?B?aWUrNks2OWlHS0hqRFVJb2lydWk5dFF6T1Zzb0RWYWVwdmFhdVV5SWNCdmw1?=
 =?utf-8?B?YlJEK2hiTXl3WHV3WThjbHFBc2tzQ0VZeVUvbGlId0hCRElWUUtMYUZ5VnY1?=
 =?utf-8?B?UUNBa01sRlMya3p1TGlXaUhDeUpYMkJCQjFWdGlPODkyOXJRZFdaMHVOQzZP?=
 =?utf-8?B?Y2ZUTzVEaTNOUWNOdFQ0R29vSHc4TUkvVnhLWnJsYTRnWHBvaWExK0tQc2F5?=
 =?utf-8?B?RmVWWjFvRnlhdDVmcStBUGsxdzN2MzJ1TzRoR2Y0UDYxNi9RelU4QWdRbC9l?=
 =?utf-8?B?cVBTbFBYNml6ejhHd1N6VzkzWTVaSjViVjJjbk9wek1GRCtlSEFJRnRnL0lC?=
 =?utf-8?B?SVp1c20xSkwzS0ZQZFVIZFQwemNQcU15MGk2eHZoQ2FZL0xicjF1TTVmWUl2?=
 =?utf-8?B?T3h6QXV0c2RlSjNtMWg4TFZveFozS2pPUDJsajdRdVFBb2dlRVIxSmduUzlV?=
 =?utf-8?B?dGJBb090Wk0wTitaZ3JIMFh6SlRMTjJiQ2g0VmduSm9ueVFBVFlHZ1g3VUdO?=
 =?utf-8?B?eGxRWXY1c1ErWldWUlpISnVKM2sxNGxKdDcwUHVBL2VKNW1MS0VkcGhsUldD?=
 =?utf-8?B?aGVLZ05LK0h0SGU2VmIzUU5BeDlXRUN4MlRmWlRiaUhmL0YxQTBHQlh6ZlNh?=
 =?utf-8?B?R1pKeHFWd0tSV1Y3R3hXazJUaEtXTEJLU2hWMHVKcUdMbGNGU1dQc3BKYm1r?=
 =?utf-8?B?d25JanNPVWVCdzVZSkpaVURZUXdaekpINUFsY25GKzJqSkhGajd6clBrYzNI?=
 =?utf-8?Q?wJ6Cnw+x0HH24ZsXzzVVS2SL+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc6db9e-2cd7-4316-5180-08dd72325112
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6440.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 22:04:19.3012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11ga5oTNC148QXPxDFokFWvlEcrL/eDB7hAV3wEO6YXYuNN/8QvkY4+h44zYdq2nLRFmX3ehZV0ZiICiBmy4Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6658

Hi Laurent,

Please see below v4l2-compliance test reports for:

(a) ov05c10 device /dev/v4l-subdev0
(b) amd_isp_capture device /dev/video0


Compliance test for device /dev/v4l-subdev0:
--------------------------------------------

atg@isp-pv-linux:~/v4l-utils/build/utils/v4l2-compliance$ sudo 
./v4l2-compliance -u 0
v4l2-compliance 1.29.0-5348, 64 bits, 64-bit time_t
v4l2-compliance SHA: 75e3f0e2c2cb 2025-03-17 18:12:17

Compliance test for device /dev/v4l-subdev0:

Driver Info:
         Driver version   : 6.14.0
         Capabilities     : 0x00000000
         Client Capabilities: 0x0000000000000002
interval-uses-which
Required ioctls:
         test VIDIOC_SUDBEV_QUERYCAP: OK
         test invalid ioctls: OK

Allow for multiple opens:
         test second /dev/v4l-subdev0 open: OK
         test VIDIOC_SUBDEV_QUERYCAP: OK
         test for unlimited opens: OK

Debug ioctls:
         test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
         test VIDIOC_ENUMAUDIO: OK (Not Supported)
         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
         test VIDIOC_G/S_AUDIO: OK (Not Supported)
         Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
         Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
         test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
         test VIDIOC_QUERYCTRL: OK
         test VIDIOC_G/S_CTRL: OK
         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
         Standard Controls: 11 Private Controls: 0

Format ioctls:
         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
         test VIDIOC_G/S_PARM: OK (Not Supported)
         test VIDIOC_G_FBUF: OK (Not Supported)
         test VIDIOC_G_FMT: OK (Not Supported)
         test VIDIOC_TRY_FMT: OK (Not Supported)
         test VIDIOC_S_FMT: OK (Not Supported)
         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
         test Cropping: OK (Not Supported)
         test Composing: OK (Not Supported)
         test Scaling: OK (Not Supported)

Codec ioctls:
         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
         test CREATE_BUFS maximum buffers: OK
         test VIDIOC_REMOVE_BUFS: OK
         test VIDIOC_EXPBUF: OK (Not Supported)
         test Requests: OK (Not Supported)
         test blocking wait: OK (Not Supported)

Total for device /dev/v4l-subdev0: 46, Succeeded: 46, Failed: 0, Warnings: 0
atg@isp-pv-linux:~/v4l-utils/build/utils/v4l2-compliance$
---

Compliance test for amd_isp_capture device /dev/video0:
-------------------------------------------------------
atg@isp-pv-linux:~/test$ sudo ./v4l2-compliance -d /dev/video0
[sudo] password for atg:
v4l2-compliance 1.29.0-5348, 64 bits, 64-bit time_t
v4l2-compliance SHA: 75e3f0e2c2cb 2025-03-17 18:12:17

Compliance test for amd_isp_capture device /dev/video0:

Driver Info:
         Driver name      : amd_isp_capture
         Card type        : amd_isp_capture
         Bus info         : platform:amd_isp_capture
         Driver version   : 6.14.0
         Capabilities     : 0xa4200001
                 Video Capture
                 I/O MC
                 Streaming
                 Extended Pix Format
                 Device Capabilities
         Device Caps      : 0x24200001
                 Video Capture
                 I/O MC
                 Streaming
                 Extended Pix Format
Media Driver Info:
         Driver name      : amd_isp_capture
         Model            : amd_isp41_mdev
         Serial           :
         Bus info         : platform:amd_isp_capture
         Media version    : 6.14.0
         Hardware revision: 0x00000000 (0)
         Driver version   : 6.14.0
Interface Info:
         ID               : 0x03000003
         Type             : V4L Video
Entity Info:
         ID               : 0x00000001 (1)
         Name             : Preview
         Function         : V4L2 I/O
         Pad 0x01000002   : 0: Sink
           Link 0x02000007: from remote pad 0x1000006 of entity 'ov05c10 
99-0010' (Camera Sensor): Data, Enabled, Immutable

Required ioctls:
         test MC information (see 'Media Driver Info' above): OK
         test VIDIOC_QUERYCAP: OK
         test invalid ioctls: OK

Allow for multiple opens:
         test second /dev/video0 open: OK
         test VIDIOC_QUERYCAP: OK
         test VIDIOC_G/S_PRIORITY: OK
         test for unlimited opens: OK

Debug ioctls:
         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
         test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
         test VIDIOC_ENUMAUDIO: OK (Not Supported)
         test VIDIOC_G/S/ENUMINPUT: OK
         test VIDIOC_G/S_AUDIO: OK (Not Supported)
         Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
         Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
         test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
         test VIDIOC_QUERYCTRL: OK (Not Supported)
         test VIDIOC_G/S_CTRL: OK (Not Supported)
         test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
         Standard Controls: 0 Private Controls: 0

Format ioctls (Input 0):
         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
         test VIDIOC_G/S_PARM: OK
         test VIDIOC_G_FBUF: OK (Not Supported)
         test VIDIOC_G_FMT: OK
         test VIDIOC_TRY_FMT: OK
         test VIDIOC_S_FMT: OK
         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
         test Cropping: OK (Not Supported)
         test Composing: OK (Not Supported)
         test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
         test CREATE_BUFS maximum buffers: OK
         test VIDIOC_REMOVE_BUFS: OK
         test VIDIOC_EXPBUF: OK
         test Requests: OK (Not Supported)
         test blocking wait: OK

Total for amd_isp_capture device /dev/video0: 49, Succeeded: 49, Failed: 
0, Warnings: 0
atg@isp-pv-linux:~/test$
---

Thanks,
Pratap

On 4/1/2025 9:20 PM, Laurent Pinchart wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Mon, Mar 31, 2025 at 03:17:22PM -0400, Nirujogi, Pratap wrote:
>> On 3/28/2025 9:18 PM, Bryan O'Donoghue wrote:
>>> On 28/03/2025 21:42, Pratap Nirujogi wrote:
>>>> From: Bin Du <Bin.Du@amd.com>
>>>
>>>> +static const struct i2c_device_id ov05c10_id[] = {
>>>> +     {"ov05c10", 0 },
>>>> +     { }
>>>> +};
>>>
>>> There's an IPU6/IPU7 version of this driver.
>>>
>>> https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/
>>> ov05c10.c
>>>
>>> Perhaps you could import the Intel ACPI name contained in there too.
>>>
>> sure, will add Intel ACPI names too in V3. To be specific, I'm going to
>> add the below table in addition to the existing "struct i2c_device_id
>> ov05c10_id[]" table:
>>
>> static const struct acpi_device_id ov05c10_acpi_ids[] = {
>>        { "OVTI05C1" },
>>        {}
>> };
> 
> You could drop the i2c_device_id table if you added an OF device ID
> table, but you'll need DT bindings for that. Sakari, any best practice
> rule in this area ?
> 

Sure, will wait for Sakari's feedback. We will also check if the driver 
can work using acpi_device_id match instead of i2c_device_id.

>>>> +
>>>> +MODULE_DEVICE_TABLE(i2c, ov05c10_id);
>>>> +
>>>> +static struct i2c_driver ov05c10_i2c_driver = {
>>>> +     .driver = {
>>>> +             .name = DRV_NAME,
>>>> +             .pm = pm_ptr(&ov05c10_pm_ops),
>>>> +     },
>>>> +     .id_table = ov05c10_id,
>>>> +     .probe = ov05c10_probe,
>>>> +     .remove = ov05c10_remove,
>>>> +};
>>>> +
>>>> +module_i2c_driver(ov05c10_i2c_driver);
>>>> +
>>>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>>>> +MODULE_AUTHOR("Venkata Narendra Kumar Gutta <vengutta@amd.com>");
>>>> +MODULE_AUTHOR("Bin Du <bin.du@amd.com>");
>>>> +MODULE_DESCRIPTION("OmniVision OV05C1010 sensor driver");
>>>> +MODULE_LICENSE("GPL v2");
>>>
>>> Why v2 ? Checkpatch will complain about v2 and BTW the IPU6 driver above
>>> is GPL not GPL v2.
>>
>> sure, will replace "GPL v2" with "GPL" in V3.
> 
> --
> Regards,
> 
> Laurent Pinchart


