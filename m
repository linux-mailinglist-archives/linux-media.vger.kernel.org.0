Return-Path: <linux-media+bounces-44692-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C88A4BE21AA
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 10:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9FF284E3D76
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 08:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 419B83009E3;
	Thu, 16 Oct 2025 08:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mZo03frm"
X-Original-To: linux-media@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013016.outbound.protection.outlook.com [40.93.196.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092221A2C11;
	Thu, 16 Oct 2025 08:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760602441; cv=fail; b=COcMKROy+KpTwt0q1Bw8iL5etUHrEW2nOVBmzbzKPBQCknUEWA4LpFrM//Bvakc9dIJA/lOw/WC6LB3hqZ0YJqlzdgsXUrTXCeACR4XAbG3h1pIp8PG+yuYmp3LnDE3meMkTY/lr/kujpJo++kW0K6fh6OOkxfIIPdOBX7bpeOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760602441; c=relaxed/simple;
	bh=RhZ3xe6Yc+PqrK1zmGQz5Bvq+ixzzW0mMbL9xU7/dgQ=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nnOizKm5c9qPnz6GFORkbUl7elRrENwjaJbXB/bYVL1BPEXcb/Wh0EuyAcZsxSypmvIMIbiWt2GbWEJHZWVonvJ3Hj8+/LfGZXWsMVhCsWGHFhTYxrn2nr4navZYgtpzlZG6DHZfybfbldVFtnXZf72w1RmixoCiK7QZhuGIA1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mZo03frm; arc=fail smtp.client-ip=40.93.196.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TfM2r7Dynlh716JHqzulN8roAB6LhQ3XSxeLwyufOwskjV+bLBSxH7zhLa8oEO3YIHMDUI/KtApjGfEWiSTGVxQaiolcQk45xLkGFm4DdAFimatvJkaA6cpeLs2Qaf9xPDf6BriF54JMpY3Kz9XeI8uVO9p1AXEPRYGLuzg8EtinDGoHeocq7s3j9L5h4JgTYGdLv5dsp2NZbjyBLchCxltdI3d3Rn0uARKuAI02N5PcDAzFlf59Ut8uYxmdanO4ck2EA0EsfZBT7uljKNNJssDjDVe3uYT5kQc2k/rzcDnRkegoUgUbpQhbeQNh0V5SNXNAFf07TkL1lm9J9T+h7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RbSOrmaX4oAOyqsx7SvELmzW1vzdRn58sPLzg9RZhIg=;
 b=NNo+CQmGrrr0bmuoFzIcWsQJK7T+vQgY7+GVS6IU3UI3eivD5hc+RDcUPL4AaKtt8Gutwayhsrroz/ajm/rS3pWygoygFZlZ4BEUgbJlS4wFTfzJGHKfyTyq1Y9VcS1HM+MaPk3pm+MzaFvrY/v8Q7RcVektdMryc2hlpmqbyucqXaPXqoqvAB7oG4reQDwzVhzgQVA1TPgo6k0ZUJ/o5cKPN+Vsy4unWACtQAFOAfBc5SX41664TtXyp/UDHWuI47E2GU7e7eh4Un1w+NZ8giKs3csG01+3csJY8LvJhiqJJ4dU5lVfDYkD1A70vS6NfkSgCthcgK56lvqknRDKyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RbSOrmaX4oAOyqsx7SvELmzW1vzdRn58sPLzg9RZhIg=;
 b=mZo03frmNRhxyCYAZ07Qj/8SCrQpxBjAQCgaRsIwPUvF8LCtkYegRLLDk3BOpaMc8GLJVaPJKT89To8Mwou0ggbHCe9YyQpccbTrRICdtPJ+Uq4yobXkxYkFJE2Vm1mbMbszrdcTclB5bHOZOCnvnTw1n5Kiy+tKPdvmckdyCOc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by IA1PR12MB6436.namprd12.prod.outlook.com (2603:10b6:208:3ac::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 08:13:57 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 08:13:57 +0000
Message-ID: <51c24e3d-be89-44c9-8247-95fb776aed78@amd.com>
Date: Thu, 16 Oct 2025 16:13:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] media: platform: amd: isp4 video node and buffers
 handling added
From: "Du, Bin" <bin.du@amd.com>
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
 Alexey Zagorodnikov <xglooom@gmail.com>
References: <20250911100847.277408-1-Bin.Du@amd.com>
 <20250911100847.277408-6-Bin.Du@amd.com> <aNzP2LH0OwUkMtGb@sultan-box>
 <c28eb905-b578-4512-aa9c-37281d3a0ee4@amd.com>
Content-Language: en-US
In-Reply-To: <c28eb905-b578-4512-aa9c-37281d3a0ee4@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCPR01CA0158.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::9) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|IA1PR12MB6436:EE_
X-MS-Office365-Filtering-Correlation-Id: 12ce739c-5d44-41a0-3538-08de0c8bf402
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YkxiNVZwZUhvU1BhdUpENVpjTURtVVNlaFdrRWRORUVmYUZuSmFTeHBQcThC?=
 =?utf-8?B?RGpJbDBpZ0xWM1J3bXZFTXVNb2ZMSE4rcWtEZ0FBMkZMd25JT3F0U2F4Z2Rw?=
 =?utf-8?B?Y0tGaFlQNjZ5WUVCb1lYNlA0cWJtMDFIU1duaitXYzNiUjJtS2xqcFVwbEZN?=
 =?utf-8?B?bm1sVVpWRE1nZnhWdDZMMk5UVWZhQ1BDU1kwOGZWSFR1YXIvS1pzNjBJNXMx?=
 =?utf-8?B?WVZVOXA1YlUybUFOS1RuOFc2UURDcUlLSnJqY0x0Nk5mcnIzd1hkK2xnVm1J?=
 =?utf-8?B?NS9vVGZmZ0tpNVpzVGpBQUdJT3JaQ3NMUlBtenpaRy90MUNnbS9BdEtadXVz?=
 =?utf-8?B?Q2QxSVh2bDRVNlVsYy9FdytPOW4ycTZ2NFp1S203QmwrRVVwMGQxMXM3MTZm?=
 =?utf-8?B?MHlFZUY4WU5tN244ODRKWmppSGtXSkFEdlFveVIzQkZzVU9iekpsTU5zT0V3?=
 =?utf-8?B?TmEzcytlK1hhb3lMY21uSVh2TkV3clZJVTVNQ2xVRDNuTUY3Y1FRMXhMcDI4?=
 =?utf-8?B?S0ovakg3NnhQNW1KTzJPQ1dSeEdmem9TL0RJTUVoeUo0MVFnblY4ampCalk3?=
 =?utf-8?B?b2YyY2IyWHBDTElPSDQxR1FHUlhyYnVaVk82VGQ5RlFYbSsvMWM5L1ZlN3Vn?=
 =?utf-8?B?Z05tVDFibW9oazg0ZkVoQ25INEp6dzM2MXEvSEpTRjZ3SlN1NS9WQkNIZFpQ?=
 =?utf-8?B?djMzNS85UWgxR3RGNk81aS9rS0xPT1MxNkluanhRRmpPbll0MmIvL0lKYzdL?=
 =?utf-8?B?cXp0U2N3NHhZN0hiMUpER1MrUE82aFNmaFJleUQwNThMSzE1Z1FyZkh1eHVK?=
 =?utf-8?B?SmRHTGVUU3lrNitBWnZwcVFOL25XckExTnFMdk9oMTRvd09QUUJZRHBXWnJS?=
 =?utf-8?B?bER3NE0rRzhocGxNU0YyTzUrS051b0VMQ2RyUWVWdnZkNWRCYUFxNjliSDFo?=
 =?utf-8?B?K2oybnRTWFQxVDBIRUpJelBLNzRZMEtnWlBKc0s1eVA4d3VZTFZ5RG4rR0lM?=
 =?utf-8?B?Tjc0ZVRxSXR6VXYvdVQ5bjlUdWpCcmRvL3kwWmJQbHI3dnZVQUJZdDNzdDVH?=
 =?utf-8?B?dWx0S255NE1mWEFiUTRCOUxpNzlGRVhiU0ZNRE1STkc0OXJLdnVoWi9xSHlo?=
 =?utf-8?B?aHVMdGxqek5QRWlJVHBWNDgrcWVnSXRveXUveGRYMmM4WDdNMlNkTDZZMVNm?=
 =?utf-8?B?WEhvc3luOWhiU1VTQVdLWTdrN1BRYkRPZ29hSy9LK1ZHOFRxbG10YU9XWmRT?=
 =?utf-8?B?OTZvME5NcWE3LzBOL3l2UjNPZ1F6VFZqVFF3VWR2dEliT1NPYVREVTIyRU1x?=
 =?utf-8?B?U3F2SGhwZFB6ZHAyeERXSWoxN0xDU1lYNk01R0hFYk5VRXlLa3dEZm85cllm?=
 =?utf-8?B?L1BoektrOGdmb3ViUG1ZaGxvbmtrelp2ZTgwY2FZc29COWNIUzcwU3E0YXpT?=
 =?utf-8?B?cjJ4YzJDNDlCTFE0RVRlQmxzbWh4UzdvdU9ySTJ3Y2FIRmZzcVpkZzNrak41?=
 =?utf-8?B?U2FLVjhsbklyMkJuSVhucGEvbEdsWVErUUdaTEd3KzgyRW5UVDdxUWlLYmUx?=
 =?utf-8?B?dHk5U2dhcFU2dWhmQ0N4bHRIRmtSTkk2b2sxMkF1bDBYdE9jdDV2b1hTU3VS?=
 =?utf-8?B?QytEUG8vUnBDY05rZ1RSVDNVSXRCRzExYnZRWFlPUDBrT1luQUJJbmtnVmk4?=
 =?utf-8?B?aENsS2wvTnZxZ053eDllUDJVTHZ5VWtPUm56Ukx6S0ZON2oyYitubFQySkJZ?=
 =?utf-8?B?VU1vb2xGY2YvQlVjU21NWnpHZFo1cUlGQlFwUlNkdzRieS82NSt0SVRFMEdH?=
 =?utf-8?B?SFBrRW9sSDgvSUY3Z0ZHWkNWWDR3cnRCdDVuTHJRNjRIc00wQXFrVEpqZHJ5?=
 =?utf-8?B?WEY5L2tYWERGS3ZCOERkRDd4bGhhYk1xU1ZnYlhWK1RqOE5LK04ydExQaGRu?=
 =?utf-8?B?SE9TRVloVXRxQUVBVzBWU2tpaDdnRHhjWGlFTE9ZVkJWU0tvWklSRUI2ZTBJ?=
 =?utf-8?B?aXpnS1ZSMkhRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTdPY3FTcUxtdnNOVHVHbHQzaXh0aEZ3NGhQVkw3Y0ZGdHFoZzdNSWtnRksz?=
 =?utf-8?B?SGRmTVF0QWV4emJNTm1paS9ZSnNRUjFFSWdkRVp4M3NTZGI1TVNKanJBZkx4?=
 =?utf-8?B?NjVyRWNvc01pY0tYbkZwKytWdnh5ZUdsZ0ZvMVNBTVZPSjQ1amZaRUk1WGEy?=
 =?utf-8?B?eWdrOEgwTU9uY2RqOE5IbGswQlAwKzNCVnVzRVd2QUoxU1o3R1loQk9XS1pa?=
 =?utf-8?B?SHhnVjBkeExvdk1WVnJVbHA3L2tNemRrOEYwZ0JtaElIdDFnYkdidkRYSVRh?=
 =?utf-8?B?WUI2WkJwVkVHWTBLQk1kUFhPT0pRWDZ1cnExZUFmOUFCMzgzbGJBMXhOUXFo?=
 =?utf-8?B?d0tLT25qRmN5L05OY0k0MTBnUTRad1BhbEt1UTRmZ1pXdTFiV0JSa0FCNEN4?=
 =?utf-8?B?aDBaR3lEekdPS3VmYllHUlpWQWhCOGN4bm9LSFd0cW1rWXpCRHVSZ1I5bmUr?=
 =?utf-8?B?M1Vmd1hkVW13OWpJeEpTRDdlZGpHaEhTSXVaQUpxd3hjZVcwMEx0OTBjSVZi?=
 =?utf-8?B?czdKZHRqblhVa2F2TmROUjJUZFVweXR4eDlQZUVibzY2dlBjcE1QVEZXdWFw?=
 =?utf-8?B?eFkyc2FkT2tONU5kb3IzUGFiL3VUUklTVVV0Y0FpMUduLzFiZWM4Z2lGNWlC?=
 =?utf-8?B?djJwY3MxSERxb2tuSUR5WEo4ZDFaVWtxZFFFWlh1UlcrOENBQnU0RW9sbGts?=
 =?utf-8?B?eDd2NWpKRG5mVytXMUp0c2FLTEZTY3FqY2drTWpPZmdDcWVtaUdab0ZDbVg4?=
 =?utf-8?B?Q3N2WU5pemJ2c0ZYZ25hMnhROGpBZ1oyQzc5c1Z6WU5ERDBtQzJXMzdKV1JD?=
 =?utf-8?B?Ujl1UkU1d2VzeFkvT2pkbGhndTNUWlNwUWhvWGtIOWxlUXdSbU9RVDFzem5o?=
 =?utf-8?B?VHF0WnpnQzhWZGpQdTZZZldJdG5uUWJtTzBXR3Q2WDE3ZlE0NU1GdUc2Rm5J?=
 =?utf-8?B?Wko2WTNNS0w1dW5WWmlIZExDbHpycm16bEJMT2lXZGxleXFGdTBaeEVROEV4?=
 =?utf-8?B?QUdJdlZsS3ptaG9rNC9Ed1Nhd1lVbmk0dVJqcTNwYkpwQm9zYXFUeVgwVFN4?=
 =?utf-8?B?U2NKbEgyWmwzY0VibFZOVlBWaWlZZE1paUJkNDdJdCt5Q1ZhVERRV3Bjdmt6?=
 =?utf-8?B?YXl1YVJKRlhIdW5nQlNYeDUyL3JnSGE3NkpwNnNsbHF3NjRMQ0dFdDFUN3h1?=
 =?utf-8?B?elN3UjAxTlZoUktaSFc4QnZhUHpKMEFIOGJrQ1BhdzQrNUx1ZE9kSU94RWNq?=
 =?utf-8?B?MUhiRjVSU1JRd1lGSytCZTlqTjJDOFV2RHlITTZOaDlpSHRmSTcwN0xON1lV?=
 =?utf-8?B?MnNoV0VvM1FMM2lJQTNWYlZjbnViSjRIbmRBK29JUWQwVjBtMVNrQnRqWDYv?=
 =?utf-8?B?a1dzTEh1ZUozWEh0QkVYcDZWT25tNjg2d2k5eDhhYVFEdktVOHFQbmVmTGll?=
 =?utf-8?B?SFB2M1VwazdFUHdUS2ZISTA1bXlDQkxETm00M2p0TWpqN1k3OUJMYktrbjVI?=
 =?utf-8?B?Z3htMmtTQVVOR1ZlcUMyN2ZEak44OTNUN0Q2VWw3YXU5cFpIMWwyTDdIZGtP?=
 =?utf-8?B?UWxESWd0YjAvQ01JcXNxdm91bEEzY2NNYmNGTkl0dWkrL2NoNnQ1TXhsYkxC?=
 =?utf-8?B?eXdKS3pLQVhCanQza2xHRExGSzZIaCtMZk5hRWlmVWFHVFRsRlVsZ2haWHF1?=
 =?utf-8?B?eGhSTSs4bVJWaWtqV2k1K0xSN2F4akhNa3hhOVY3MEpmRVVMVWNNMzhRR0Ns?=
 =?utf-8?B?VUNjWTVCYzFvOUpKOTBrZCtvTGlCS1JwZFA3YUpQNklvMEREaWZ1a3RHL1U1?=
 =?utf-8?B?bHQzVUNHTUtiOFBwZWZuOHhMSHZLNjNVVktVL3Y0VnNMSzY3Q3B1OHdaaHZG?=
 =?utf-8?B?KzlzbE83R0dwNzZmYnkrZnNvOG5OQkxwM0VQUWRtWlk4eTV2NmVlZ1hBZUE0?=
 =?utf-8?B?RVM3cWc2UkM4SEtPWldTSWRmUkJaSFpuLzBUMmdISGVDZUpYUDEyemxNbWk4?=
 =?utf-8?B?QkRYN05ZSHRCYXlqOHlzRVhPSzdqc2pVVUptU3dzSkVkdkhpMEVVT0tWUndh?=
 =?utf-8?B?Ym51THh0YnlqVVJZTlhyL2dCMGc4dVJSdmRaVnVISzJXd0NVN2RTNmkzdlNO?=
 =?utf-8?Q?CuTE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ce739c-5d44-41a0-3538-08de0c8bf402
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 08:13:56.9771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z7NsrnkCJVdWxS6qkayUmgh2nbGA/WACL1GLjdwpFIXbDSB/LEQe1e4SGZwXVlM0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6436

Hi Sultan,

On 10/11/2025 5:30 PM, Du, Bin wrote:
> Many thanks Sultan for your review, that's really helpful.
> 
> On 10/1/2025 2:53 PM, Sultan Alsawaf wrote:
>> Hi Bin,
>>
>> On Thu, Sep 11, 2025 at 06:08:45PM +0800, Bin Du wrote:
>>> Isp video implements v4l2 video interface and supports NV12 and YUYV. It
>>> manages buffers, pipeline power and state. Cherry-picked Sultan's DMA
>>> buffer related fix from branch v6.16-drm-tip-isp4-for-amd on
>>> https://github.com/kerneltoast/kernel_x86_laptop.git
>>>
>>> Co-developed-by: Sultan Alsawaf <sultan@kerneltoast.com>
>>> Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
>>> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>>> Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
>>
>> [snip]
>>
>>> +++ b/drivers/media/platform/amd/isp4/isp4.c
>>> @@ -178,6 +178,16 @@ static int isp4_capture_probe(struct 
>>> platform_device *pdev)
>>>           goto err_isp4_deinit;
>>>       }
>>> +    ret = media_create_pad_link(&isp_dev->isp_sdev.sdev.entity,
>>> +                    0, &isp_dev->isp_sdev.isp_vdev.vdev.entity,
>>> +                    0,
>>> +                    MEDIA_LNK_FL_ENABLED |
>>> +                    MEDIA_LNK_FL_IMMUTABLE);
>>> +    if (ret) {
>>> +        dev_err(dev, "fail to create pad link %d\n", ret);
>>> +        goto err_isp4_deinit;
>>> +    }
>>> +
>>
>> Two problems with this hunk:
>>
>> 1. According to the comment in include/media/media-device.h [1],
>>     media_create_pad_link() should be called before 
>> media_device_register():
>>
>>      * So drivers need to first initialize the media device, register 
>> any entity
>>      * within the media device, create pad to pad links and then 
>> finally register
>>      * the media device by calling media_device_register() as a final 
>> step.
>>
>> 2. Missing call to media_device_unregister() on error when
>>     media_create_pad_link() fails.
>>
>> Since the media_create_pad_link() will be moved before 
>> media_device_register(),
>> we will need to clean up media_create_pad_link() when 
>> media_device_register()
>> fails.
>>
>> The clean-up function for media_create_pad_link() is 
>> media_device_unregister().
>> According to the comment for media_device_unregister() [2], it is safe 
>> to call
>> media_device_unregister() on an unregistered media device that is 
>> initialized
>> (through media_device_init()).
>>
>> In addition, this made me realize that there's no call to 
>> media_device_cleanup()
>> in the entire driver too. This is the cleanup function for 
>> media_device_init(),
>> so it should be called on error and on module unload.
>>
>> To summarize, make the following changes:
>>
>> 1. Move the media_create_pad_link() up, right before 
>> media_device_register().
>>
>> 2. When media_device_register() fails, clean up 
>> media_create_pad_link() by
>>     calling media_device_unregister().
>>
>> 3. Add a missing call to media_device_cleanup() on error and module 
>> unload to
>>     clean up media_device_init().
>>
> 
> Very clear guide, will follow your advice.
> 
>>>       platform_set_drvdata(pdev, isp_dev);
>>>       return 0;

For 2, we found when media_device_register() fails, calling 
media_device_unregister() won't clean up media_create_pad_link() because 
it simply returns without doing anything(see 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/mc/mc-device.c?h=v6.17-rc7#n797). 
Therefore like other kernel drivers, we'd rather not call 
media_device_unregister() in this scenario, it doesn't cause issues, but 
it's not logically correct. Cleanup for media_create_pad_link() occurs 
during error handling via 
isp4sd_deinit()->isp4vid_dev_deinit()->vb2_video_unregister_device()->...->media_entity_remove_link(). 
What do you think?

[snip]

-- 
Regards,
Bin


