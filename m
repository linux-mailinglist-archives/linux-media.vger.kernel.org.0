Return-Path: <linux-media+bounces-34697-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F36DFAD812E
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 04:43:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66B451899AFC
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 02:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A895F23C4ED;
	Fri, 13 Jun 2025 02:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JTBfLrdL"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDDF23906A;
	Fri, 13 Jun 2025 02:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749782587; cv=fail; b=AA3OOjebkZz68J49n0qYDfzlbzZa0Xvs1KvUPNFx+s3bjl38eb0nf0HNeXV48akw0EKXoqo5XQOOI5HNE0wGb6PLcWW549imUftJTgIVHzZCNy6WmRo9sccXrGQilxxcVkFOs7Uv5mAeSqQi87+6aj4nVbd0fyFTZp8qnpQ5fmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749782587; c=relaxed/simple;
	bh=iPvIJerH6dTSGQKzZqzwq+eTeJXU0oHIb27MbiLEr/4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WMwUfdrVSuhnxrNjoOtS58j0D+QdvdOhcIyDxsQJk381ea/e4QccWKjZOhnmccRUaMUD/D1A3rJ4exNqLz75Hyrj8xUU6kcR9KfK5Q6l90irsu5qTo0uFdhx0iREEI1otCru3yYE9tOV2I1z/ZzPs26Rmpk4OKPaOjHeRo68NAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JTBfLrdL; arc=fail smtp.client-ip=40.107.220.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+V0DiO3QGX/vl/CVkTdey0yT0+wyEzsdWJ2WU2TRuBIEEfr8g0UCkp5/5Fks9Wylbtz+7wSGBWp0+dnm68ddweoqxJnEzFn8MRT3FzrgXleTO58AhVB8PLGtEUYQMxt+BWfMbNZD5QosqZf66aRAH0gKpJhJR2XDypCU32wFAGSdTOVB/EohUFGfa1vdOwTp5qS/PVVeoGmgIuScmVitedU7MqMigonDE4W25xZ8/pBCTdWbyCaEoYbYKUiaI/VVWumpCkUTMk9YiXSXJEeFlGIQXYsCxz4vjLMOMYLhzXzXnR4flnLD5ovlZyVJpr7tJMolUf8BSfPydjKeS2QPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6OUvFP8twKquxrhkroHfy1/URS/zkbDFFXx6+oeEecw=;
 b=HC7yWmLQbk1bQxOWFJePLd+o4ber4dkY006qsLTyfAtGstiQFCn/hykdsq3uK6nZ/mDV4AuJpzAhzvZZI1U5F5Hsqyxn7LCQ5h2tDKeCViSGqllm8YLRnaEJmdZBXWbmgRUH+P5s2hlLf4RLaUeby8ORARufjXQHqQTAgTnEir7LBHqRBiz/TReDO74NKKBXHit8dpw7zBqzAWM3LBoNT1HLQVPcvMk0VOtnD9cAxhbx1P4mTuuQks9wDDkhQxWLfwv7brYz2WB86ax9qbRUP3C7eVtXtPAxRxhNpPfbXxsFT9mRJWE1WVFJ9KVXoSvuRuQPof/3DuM3P9lZIw89MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OUvFP8twKquxrhkroHfy1/URS/zkbDFFXx6+oeEecw=;
 b=JTBfLrdLAiYIv+iLvKsbrRTTx30HKUw7dtXHUWiSVV3fXHWH6WIfO4XSp5vfLEVTFiQMPnHsn6Q1G3GqXeeLAbFwROQFrmYkngEeQHezQbc7HpC6F1vdRNgWDKSMMBQeyC9ztL5BesL/7GdQcfPY2Q4RxUcqVpW/6O9bnNRyYXI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW5PR12MB5683.namprd12.prod.outlook.com (2603:10b6:303:1a0::10)
 by PH8PR12MB6796.namprd12.prod.outlook.com (2603:10b6:510:1c7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.36; Fri, 13 Jun
 2025 02:43:01 +0000
Received: from MW5PR12MB5683.namprd12.prod.outlook.com
 ([fe80::3366:15a2:2179:2137]) by MW5PR12MB5683.namprd12.prod.outlook.com
 ([fe80::3366:15a2:2179:2137%7]) with mapi id 15.20.8792.040; Fri, 13 Jun 2025
 02:43:00 +0000
Message-ID: <85edcca3-cd51-441e-9bf8-6b86f8fe949f@amd.com>
Date: Fri, 13 Jun 2025 10:42:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/9] media: platform: amd: isp4 video node and buffers
 handling added
To: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 Svetoslav.Stoilov@amd.com
References: <20250608144916.222835-1-Bin.Du@amd.com>
 <20250608144916.222835-7-Bin.Du@amd.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <20250608144916.222835-7-Bin.Du@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0183.apcprd06.prod.outlook.com (2603:1096:4:1::15)
 To MW5PR12MB5683.namprd12.prod.outlook.com (2603:10b6:303:1a0::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR12MB5683:EE_|PH8PR12MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: b8ce8c2e-34f5-41f3-415f-08ddaa240326
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2h4ZnFVTVRLRDAyYXNscHFNRzFOcGlERjVrOG4rWnc2Nm1ucG93MDJySTRu?=
 =?utf-8?B?NzN4SnFrVlBWUjVQKzUrMG0wTFFZNGRPWnYrVlVuMVAvTDIxbUJLNzJIcEZo?=
 =?utf-8?B?Z081R0V1clpNQ0VnRWIvNW12VXZDd0dlQzlFcHVWWEtkaXc4VUNsMzBrb0lt?=
 =?utf-8?B?RVJ3Zmk4Nmg3bVU2Y1grNnkwcXdzcHAxNVRTVG1TeXEyRjhqZmpuM2JoZ3ds?=
 =?utf-8?B?WDg2ZWV2RE9NSkRLOXpaSjZwVHp4NmVNWnNZbGpmaExNT0w3RElKd2RPZHZN?=
 =?utf-8?B?TVpxaHp2QWFYK05JNVN1OXhuYzRybWtIZitSckt4M0VmV2kyMlYyY3dqaVhD?=
 =?utf-8?B?NlNRUDZTM0hsRjQwSm9xU2E1ZlJxYlBwSVZheVpXa0ZmR2diem1VdWZ6N0FW?=
 =?utf-8?B?cmpOeDZLWTZtSmZ5U1loOXJraEIzUzdZbGZwNTh2VFhHNUVERDloaXVjbTFL?=
 =?utf-8?B?V2NuWERNbkZEcS9JbjZDMExYRjg5cVFoTlExYXJUNGpZOHhpc20xb2tVZHdO?=
 =?utf-8?B?V3VsK1BtZTljWGZaL2JBTFd3Y0VtRGdrMGpvRVJiU29MZzBoUE5PMmIrdEI1?=
 =?utf-8?B?bHphWUJOV1JvUXVxQXpCUkM2WUZINzNIMWIyUm92TkZyclIvWUJRV3FmWmhU?=
 =?utf-8?B?YW1NNWRRU3BXdjhFUTVpWjBLdnh4d0xqcEx5MnV3N1ZUbE1rRWZxZitHNDU4?=
 =?utf-8?B?dlNhSXlJU3ZJaE1vSit2V0U0UkZ1dzVnK0g1d3BEaEt0N0xjdDd4YndSWFdQ?=
 =?utf-8?B?d3dmMTFicHg4dHpwMzBIL3BzS0dqRkg1NDlMcFVYMk05alZTV3NXUERyUTlO?=
 =?utf-8?B?TGFaMWZoZGwwMlpVMkYyQmcwbHlhcWYvS3ZLU3g1ZG5abEd1VjVyS2FDdHkx?=
 =?utf-8?B?eE5MeXFhVENLSWJreVZIVEI5aHhLY0R1QThwUGl6Smt0TVdhVUZlVFpWWjRy?=
 =?utf-8?B?MjE1UkV0VU1tNzk0aGd2S2NCYXVrNXVxYk9JdkRNT0VWMWF4enJ5L2FrZThG?=
 =?utf-8?B?NEIvZTFXSGk1ZWFqMFVQOE16aWswY0E3OFZsaUZSNGtpWEJWMzVrbHlDVmlF?=
 =?utf-8?B?ays1eXlDalhWbGtld3dIT1VtQ2x2LzhBblZCTmtxODAvQnJnVkw5cFlXc2V5?=
 =?utf-8?B?ZXI5ZC8zczhkQkplWWRBNFQ0Vi9nRjUyS1NQcEdUU0hxRHFHN2ZTVXhWbXdn?=
 =?utf-8?B?cXJsZHgxSEZtdGpBRDRCYjlDbkN1VktRcUZoVnRnbTdBRmtFSUFDbWhXQ1ZB?=
 =?utf-8?B?eW11MGVGUjJpa2VBTFcralJOZXFXVnVSOHFOSkRNcmdKRTM0aVhEaVdKUFZ2?=
 =?utf-8?B?QTByQzljeWQ5cXljUVk2amc3Uy9KOVkyTjVHbFRHNVFRRUVFOXF2K29NT1ll?=
 =?utf-8?B?ZEtCSHo5K05UQk4wUk5CMXlCbkJSR2NWV1JYQ3hkZmlpU2ZZTGpnZUlLayt4?=
 =?utf-8?B?OERNaFNJU3dwV3hVMW81d1AvdkpvYndJSDg4V1diUDFnMzRZSURMV2dkeElF?=
 =?utf-8?B?YVlXcnNsNW1oZ0pxR2xpc0x3bE1ablFObVRWdGZqa093QlkraWFUTHQxU3dj?=
 =?utf-8?B?SklYOVdueEh6bXZYNjRHbDVXRUptd1l0T1pHRUFPV2hwcUlVZFdaVHRramJT?=
 =?utf-8?B?OVM2c3AwVGpqb1ZkZEJjc2NwVzFiSDhqNDcyK2w5VktzTzhjZnlrMXJ3cHFx?=
 =?utf-8?B?NERGaFQ1eUk3aVVBUWx2TFA0MTJkcTR6L29MbzVkWktCUi9INUZFaVVHUG5M?=
 =?utf-8?B?Q0trdlNZd0toTHE2YXRkQzdENXpva0Q2QjhMd1NOeE5lbXhlWFh4QmRuQ0JS?=
 =?utf-8?B?N0R5Ukt5ZlJlb3FQUDdUMCtLVmMwQlRTYTQraTI4WmtxQnZKRFpFemQ4bjJS?=
 =?utf-8?B?dXhTMCtZZ2o5RU12dWJRK2JnanZLRlVDRFhaWHNDajhyZzZ4UGhaU3poUm9J?=
 =?utf-8?Q?9JmUed7Fsx8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR12MB5683.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NE9lU1hQczROWEc2eno4WXVFZWttblpIejJPaWhsR04ybVBvNVNaV3R3OG1F?=
 =?utf-8?B?TE9UN2pyWWk1RjFhSVZBckVJUGFwUUxlTDBZUVhNRVB3UGdScWF5UDI3ZGdD?=
 =?utf-8?B?NDIwK0xYeENSWitXWHRWMm9LWXBNWFNJUFp4WHF2RGF3Tit6bUZ4ZThiZTRZ?=
 =?utf-8?B?Sm9udStzRnNGNXI4S25ObVd3UU40bCtONXgydkpvSXRKckNTdGl3c3NNZVcy?=
 =?utf-8?B?aG8zYjkzLzlYZk9QUzVBaml6Y1lHc00zYS84ZHRHeGwxSTNtRE5yWWZ5N1dE?=
 =?utf-8?B?Ui94L2dhQStzdVYzMmwxL3dzSWJmVm9qWCt3Y0p1SjJSMEdzWVBYRXJjR2Zr?=
 =?utf-8?B?dVI1M3kyNitZamNtdGU0STltS2ZENHJDaDhFTkZWSHNGcC9VekcxOW50R2Nz?=
 =?utf-8?B?c3B4c1g2YVROdFY3RmdNNGVmWGI0N1VhcENXZFFJV2ZSNjJGL0JLN2ZxdVJh?=
 =?utf-8?B?UHFId2kxUVB5NFNvZjJxcWRlWGFZRzhkR0paZ3ptM0VBcHFXNGNMcEFZR2tv?=
 =?utf-8?B?MDlhUDJVMElod3NQSkQyZHpzTW9SbmhwR3BocytKNTFpeVRwQUpURk9MZW15?=
 =?utf-8?B?NHErZVFaeHJDQkxLLzFBaStXemdTditBTXY3TmpjOVZRTXhDTWFjVEUrdUR4?=
 =?utf-8?B?SjloazFUdmYyZ3JQaHBzQzR6WWFtVndNUmdiQVdDNTZEQjdHNjBXZC9tenA2?=
 =?utf-8?B?TS8rZUx3UmJZVU0zbEl5WmQ4ZTJEN3JYQlhQdTZhVFV3Q1RkNWRwaUpGK0p4?=
 =?utf-8?B?OGVzNXhxYUFQSnBsdzQwcUZEMWJMV1dRcFdJRlFwR0JEaWZxSDZraEdQVzNn?=
 =?utf-8?B?VlUrVWN1TnZORjdmRHNDWFEram9KS25kK2g3aDh4Ym4yK0ladDNvMEdYQS9x?=
 =?utf-8?B?MFNjQUJQUXZHNklTcFprVkVpVTV2UWszWnYxWU5vVTUzUEFhNXR1VVNEWE9X?=
 =?utf-8?B?TkdMeSt0cjFNVDRWdUIxZy9XNXRpekx5QnI3ZVAyR0g4WmcvdCtGdEMyYldv?=
 =?utf-8?B?aWlwNk55bENUanF5UU1JQVh1SDgrTVp5NVo0Vm40QUlkWDdkN2FWZ2V6TlJL?=
 =?utf-8?B?QkxRSFVlNmp6bTBMcEdhSUNPSFhkMDJSSzVTQVZxN1lpSElUeDBjMEpETk9M?=
 =?utf-8?B?aUtnRmNBenBrSks2dDZzWHJLdk1iY2Y3OFpoelRYSEx0SXVXdzd5K2pIVC84?=
 =?utf-8?B?OEUyQXRHVC9rK091NjdUSnZlQVB6NlJmTmk0aFJhMTcxS3pKRXM1ay93SStK?=
 =?utf-8?B?N2NZNXZGelNDbERsUFUxUUk3SmR5cVJmRElpa1pHa2hpZndDRGk4Z3VxV0xu?=
 =?utf-8?B?VkpFbjJ3ZjNzNkNFY1JQZ2VsWGtwT252VURaQllnbnVCSERqK2cyRWl5cXBJ?=
 =?utf-8?B?bUFOYlc3OC9GTHlDMGkyM1NYT3h3RUZhd0dybDZNVTZwOTdlQWlBanhhWFVL?=
 =?utf-8?B?b1paVkszVGc3TFIwTjJEbFUrQnhwaEhNTFRhSTBKMGtTTFZqNFBFc2h3Szd4?=
 =?utf-8?B?NjB5ckFKbTZpelRoaDFIbUFoTlYyWVZVZ0lDbnZZTEoxK3FZczZ5dzN4NkRU?=
 =?utf-8?B?L1BxUnN3RTFMUG5mT2FRdVh4OTZhaWtHQkZ5VDA0clg3SWhqSFVxV0FoZXhs?=
 =?utf-8?B?SlMrRFVJd0VFTEJqcXdGcGtCaFVYeU1yYkw0OGpOWnlsN0duQmN1WTNkTVE0?=
 =?utf-8?B?UjRid1M0OWxDa2ZpMFJZYnNZdy9iUEpabmJBdzlKbUNBVWxhTGd5R0JJTmE4?=
 =?utf-8?B?TmNXTncveHhTL0lrT1FlNnV4S0R4Uk9QcjJyZWMwbWx4cnhRSzRhZlMwaW1N?=
 =?utf-8?B?QXgvVmZxQkdOU1V5Ujg5SWFmUm1kSThiV1NGSkhINnJWZ3l4NmhTbjNKQUhT?=
 =?utf-8?B?c0xIdUEyZFFTb2NyWGhacnJoN3FaSVlWK2ZFNk1lQS9Yb2VDNU15MFNXNWZo?=
 =?utf-8?B?aGtKZTJkODQzVllBOWVqMlRvU1JueFNuLzFDMGljYm1aRXdhY1VKck0rZ2JI?=
 =?utf-8?B?RFRNU0wzTHFDNm01Tm80dFFGbWs2Z1VqL1ZqYVg5Wmpqa2l5c0lmMHBjTkVP?=
 =?utf-8?B?aVFXUzdMbW1mTVFMVDJxRVl0ZExTYUo5WXI2bWd3bktML2NWcEIrL3g0NTh0?=
 =?utf-8?Q?xGrQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ce8c2e-34f5-41f3-415f-08ddaa240326
X-MS-Exchange-CrossTenant-AuthSource: MW5PR12MB5683.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 02:43:00.8991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6bYeaOreMeu1eCkp1X4U5p39MWZDBn/KUdcvxnBK4IasbcQF518z/hx0hugs7Vjx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6796

Change-Id should be removed and will be fixed in V2

On 6/8/2025 10:49 PM, Bin Du wrote:
> Isp video implements v4l2 video interface and supports NV12 and YUYV.
> It manages buffers, pipeline power and state.
> 
> Signed-off-by: Bin Du <Bin.Du@amd.com>
> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Change-Id: I42178ebe877dd1901bd801a23d8f825827282e56
> ---
>   drivers/media/platform/amd/isp4/Makefile      |    1 +
>   drivers/media/platform/amd/isp4/isp4.c        |   13 +-
>   drivers/media/platform/amd/isp4/isp4_subdev.c |  128 +-
>   drivers/media/platform/amd/isp4/isp4_subdev.h |    2 +
>   drivers/media/platform/amd/isp4/isp4_video.c  | 1457 +++++++++++++++++
>   drivers/media/platform/amd/isp4/isp4_video.h  |   93 ++
>   6 files changed, 1684 insertions(+), 10 deletions(-)
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_video.c
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_video.h
> 
> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
> index d2f1523ad07a..a68f18fe79b4 100644
> --- a/drivers/media/platform/amd/isp4/Makefile
> +++ b/drivers/media/platform/amd/isp4/Makefile
> @@ -7,6 +7,7 @@ amd_capture-objs := isp4_subdev.o \
>   			isp4_phy.o \
>   			isp4_interface.o \
>   			isp4.o	\
> +			isp4_video.o \
>   			isp4_hw.o	\
>   
>   ccflags-y += -I$(srctree)/drivers/media/platform/amd/isp4
> diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
> index 2dc7ea3b02e8..3beb35293504 100644
> --- a/drivers/media/platform/amd/isp4/isp4.c
> +++ b/drivers/media/platform/amd/isp4/isp4.c
> @@ -310,6 +310,16 @@ static int isp4_capture_probe(struct platform_device *pdev)
>   		goto err_isp4_deinit;
>   	}
>   
> +	ret = media_create_pad_link(&isp_dev->isp_sdev.sdev.entity,
> +				    1, &isp_dev->isp_sdev.isp_vdev.vdev.entity,
> +				    0,
> +				    MEDIA_LNK_FL_ENABLED |
> +				    MEDIA_LNK_FL_IMMUTABLE);
> +	if (ret) {
> +		dev_err(dev, "fail to create pad link %d\n", ret);
> +		goto err_unreg_video_dev_notifier;
> +	}
> +
>   	platform_set_drvdata(pdev, isp_dev);
>   
>   	pm_runtime_set_suspended(dev);
> @@ -317,9 +327,10 @@ static int isp4_capture_probe(struct platform_device *pdev)
>   
>   	return 0;
>   
> -err_isp4_deinit:
> +err_unreg_video_dev_notifier:
>   	v4l2_async_nf_unregister(&isp_dev->notifier);
>   	v4l2_async_nf_cleanup(&isp_dev->notifier);
> +err_isp4_deinit:
>   	isp4sd_deinit(&isp_dev->isp_sdev);
>   err_unreg_v4l2:
>   	v4l2_device_unregister(&isp_dev->v4l2_dev);
> diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
> index 4b28fbd6867b..816fa3a127f5 100644
> --- a/drivers/media/platform/amd/isp4/isp4_subdev.c
> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
> @@ -167,6 +167,24 @@ static int isp4sd_enum_mbus_code(struct v4l2_subdev *isp_subdev,
>   	return 0;
>   }
>   
> +static int isp4sd_enum_frame_size(struct v4l2_subdev *isp_subdev,
> +				  struct v4l2_subdev_state *state,
> +				  struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	struct v4l2_frmsize_discrete min, max;
> +
> +	if (fse->index >= ARRAY_SIZE(isp4sd_image_formats))
> +		return -EINVAL;
> +
> +	isp4vid_frmsize_range(&min, &max);
> +	fse->min_width = min.width;
> +	fse->max_width = max.width;
> +	fse->min_height = min.height;
> +	fse->max_height = max.height;
> +
> +	return 0;
> +}
> +
>   static bool isp4sd_get_str_out_prop(struct isp4_subdev *isp_subdev,
>   				    struct isp4fw_image_prop *out_prop,
>   				    struct v4l2_subdev_state *state, u32 pad)
> @@ -509,17 +527,14 @@ isp4sd_get_meta_by_mc(struct isp4_subdev *isp_subdev,
>   
>   static struct isp4if_img_buf_node *
>   isp4sd_preview_done(struct isp4_subdev *isp_subdev,
> -		    struct isp4fw_meta_info *meta)
> +		    struct isp4fw_meta_info *meta,
> +		    struct isp4vid_framedone_param *pcb)
>   {
>   	struct isp4_interface *ispif = &isp_subdev->ispif;
>   	struct isp4if_img_buf_node *prev = NULL;
>   	struct device *dev = isp_subdev->dev;
>   
> -	if (!meta) {
> -		dev_err(dev, "fail bad param for preview done\n");
> -		return prev;
> -	}
> -
> +	pcb->preview.status = ISP4VID_BUF_DONE_STATUS_ABSENT;
>   	if (meta->preview.enabled &&
>   	    (meta->preview.status == BUFFER_STATUS_SKIPPED ||
>   	     meta->preview.status == BUFFER_STATUS_DONE ||
> @@ -529,9 +544,12 @@ isp4sd_preview_done(struct isp4_subdev *isp_subdev,
>   		str_info = &isp_subdev->sensor_info.output_info;
>   		prev = isp4if_dequeue_buffer(ispif);
>   
> -		if (!prev)
> +		if (!prev) {
>   			dev_err(dev, "fail null prev buf\n");
> -
> +		} else {
> +			pcb->preview.buf = prev->buf_info;
> +			pcb->preview.status = ISP4VID_BUF_DONE_STATUS_SUCCESS;
> +		}
>   	} else if (meta->preview.enabled) {
>   		dev_err(dev, "fail bad preview status %u\n",
>   			meta->preview.status);
> @@ -578,6 +596,7 @@ static void isp4sd_fw_resp_frame_done(struct isp4_subdev *isp_subdev,
>   				      enum isp4if_stream_id stream_id,
>   				      struct isp4fw_resp_param_package *para)
>   {
> +	struct isp4vid_framedone_param pcb = {0};
>   	struct isp4if_img_buf_node *prev = NULL;
>   	struct device *dev = isp_subdev->dev;
>   	struct isp4fw_meta_info *meta;
> @@ -590,12 +609,17 @@ static void isp4sd_fw_resp_frame_done(struct isp4_subdev *isp_subdev,
>   		return;
>   	}
>   
> +	pcb.poc = meta->poc;
> +	pcb.cam_id = 0;
> +
>   	dev_dbg(dev, "ts:%llu,streamId:%d,poc:%u,preview_en:%u,(%i)\n",
>   		ktime_get_ns(), stream_id, meta->poc,
>   		meta->preview.enabled,
>   		meta->preview.status);
>   
> -	prev = isp4sd_preview_done(isp_subdev, meta);
> +	prev = isp4sd_preview_done(isp_subdev, meta, &pcb);
> +	if (pcb.preview.status != ISP4VID_BUF_DONE_STATUS_ABSENT)
> +		isp4vid_notify(&isp_subdev->isp_vdev, &pcb);
>   
>   	isp4if_dealloc_buffer_node(prev);
>   
> @@ -974,6 +998,84 @@ static int isp4sd_start_stream(struct isp4_subdev *isp_subdev,
>   	return ret;
>   }
>   
> +static int ispsd4_subdev_link_validate(struct media_link *link)
> +{
> +	return 0;
> +}
> +
> +static const struct media_entity_operations isp4sd_subdev_ent_ops = {
> +	.link_validate = ispsd4_subdev_link_validate,
> +};
> +
> +static int isp4sd_ioc_send_img_buf(struct isp4vid_dev *sd,
> +				   struct isp4if_img_buf_info *buf_info)
> +{
> +	struct isp4_subdev *isp_subdev = to_isp4_vdev(sd);
> +	struct isp4_interface *ispif = &isp_subdev->ispif;
> +	struct isp4if_img_buf_node *buf_node = NULL;
> +	struct device *dev = isp_subdev->dev;
> +	int ret = -EINVAL;
> +
> +	mutex_lock(&isp_subdev->ops_mutex);
> +	/* TODO: remove isp_status */
> +	if (ispif->status != ISP4IF_STATUS_FW_RUNNING) {
> +		dev_err(dev, "fail send img buf for bad fsm %d\n",
> +			ispif->status);
> +		mutex_unlock(&isp_subdev->ops_mutex);
> +		return -EINVAL;
> +	}
> +
> +	buf_node = isp4if_alloc_buffer_node(buf_info);
> +	if (!buf_node) {
> +		dev_err(dev, "fail alloc sys img buf info node\n");
> +		ret = -ENOMEM;
> +		goto unlock_and_return;
> +	}
> +
> +	ret = isp4if_queue_buffer(ispif, buf_node);
> +	if (ret) {
> +		dev_err(dev, "fail to queue image buf, %d\n", ret);
> +		goto error_release_buf_node;
> +	}
> +
> +	if (!isp_subdev->sensor_info.start_stream_cmd_sent) {
> +		isp_subdev->sensor_info.buf_sent_cnt++;
> +
> +		if (isp_subdev->sensor_info.buf_sent_cnt >=
> +		    ISP4SD_MIN_BUF_CNT_BEF_START_STREAM) {
> +			ret = isp4if_send_command(ispif, CMD_ID_START_STREAM,
> +						  NULL, 0);
> +
> +			if (ret) {
> +				dev_err(dev, "fail to START_STREAM");
> +				goto error_release_buf_node;
> +			}
> +			isp_subdev->sensor_info.start_stream_cmd_sent = true;
> +			isp_subdev->sensor_info.output_info.start_status =
> +				ISP4SD_START_STATUS_STARTED;
> +			isp_subdev->sensor_info.status =
> +				ISP4SD_START_STATUS_STARTED;
> +		} else {
> +			dev_dbg(dev,
> +				"no send start,required %u,buf sent %u\n",
> +				ISP4SD_MIN_BUF_CNT_BEF_START_STREAM,
> +				isp_subdev->sensor_info.buf_sent_cnt);
> +		}
> +	}
> +
> +	mutex_unlock(&isp_subdev->ops_mutex);
> +
> +	return 0;
> +
> +error_release_buf_node:
> +	isp4if_dealloc_buffer_node(buf_node);
> +
> +unlock_and_return:
> +	mutex_unlock(&isp_subdev->ops_mutex);
> +
> +	return ret;
> +}
> +
>   static int isp4sd_subdev_pre_streamon(struct v4l2_subdev *sd, u32 flags)
>   {
>   	struct isp4_subdev *isp_subdev = to_isp4_subdev(sd);
> @@ -1098,6 +1200,7 @@ static int isp4sd_disable_streams(struct v4l2_subdev *sd,
>   
>   static const struct v4l2_subdev_pad_ops isp4sd_pad_ops = {
>   	.enum_mbus_code	= isp4sd_enum_mbus_code,
> +	.enum_frame_size = isp4sd_enum_frame_size,
>   	.get_fmt = v4l2_subdev_get_fmt,
>   	.set_fmt = isp4sd_set_pad_format,
>   	.enable_streams = isp4sd_enable_streams,
> @@ -1123,6 +1226,10 @@ static const struct media_entity_operations isp4sd_sdev_ent_ops = {
>   	.link_validate = isp4sd_sdev_link_validate,
>   };
>   
> +static const struct isp4vid_ops isp4sd_isp4vid_ops = {
> +	.send_buffer = isp4sd_ioc_send_img_buf,
> +};
> +
>   int isp4sd_init(struct isp4_subdev *isp_subdev,
>   		struct v4l2_device *v4l2_dev,
>   		void *amdgpu_dev)
> @@ -1188,6 +1295,8 @@ int isp4sd_init(struct isp4_subdev *isp_subdev,
>   	isp_subdev->host2fw_seq_num = 1;
>   	ispif->status = ISP4IF_STATUS_PWR_OFF;
>   
> +	ret = isp4vid_dev_init(&isp_subdev->isp_vdev, &isp_subdev->sdev,
> +			       &isp4sd_isp4vid_ops, amdgpu_dev);
>   	if (ret)
>   		goto err_media_clean_up;
>   	return ret;
> @@ -1203,6 +1312,7 @@ void isp4sd_deinit(struct isp4_subdev *isp_subdev)
>   	struct isp4sd_output_info *output_info;
>   
>   	output_info = &isp_subdev->sensor_info.output_info;
> +	isp4vid_dev_deinit(&isp_subdev->isp_vdev);
>   	media_entity_cleanup(&isp_subdev->sdev.entity);
>   
>   	isp4if_deinit(ispif);
> diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.h b/drivers/media/platform/amd/isp4/isp4_subdev.h
> index 99ec914a95ce..e04811dd2591 100644
> --- a/drivers/media/platform/amd/isp4/isp4_subdev.h
> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.h
> @@ -18,6 +18,7 @@
>   #include "isp4_fw_cmd_resp.h"
>   #include "isp4_hw_reg.h"
>   #include "isp4_interface.h"
> +#include "isp4_video.h"
>   
>   /*
>    * one is for none sesnor specefic response which is not used now
> @@ -97,6 +98,7 @@ struct isp4_subdev_thread_param {
>   struct isp4_subdev {
>   	struct v4l2_subdev sdev;
>   	struct isp4_interface ispif;
> +	struct isp4vid_dev isp_vdev;
>   
>   	/*
>   	 * sdev_pad[0] is sink pad connected to sensor
> diff --git a/drivers/media/platform/amd/isp4/isp4_video.c b/drivers/media/platform/amd/isp4/isp4_video.c
> new file mode 100644
> index 000000000000..39f0b6e49713
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4_video.c
> @@ -0,0 +1,1457 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/pm_runtime.h>
> +#include <linux/vmalloc.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-mc.h>
> +
> +#include "amdgpu_object.h"
> +#include "isp4_interface.h"
> +#include "isp4_subdev.h"
> +#include "isp4_video.h"
> +
> +#define ISP4VID_ISP_DRV_NAME "amd_isp_capture"
> +#define ISP4VID_VIDEO_BUF_NUM 5
> +#define ISP4VID_MAX_PREVIEW_FPS 30
> +#define ISP4VID_DEFAULT_FMT isp4vid_formats[0]
> +
> +#define ISP4VID_PAD_VIDEO_OUTPUT 1
> +
> +/* timeperframe default */
> +#define ISP4VID_ISP_TPF_DEFAULT isp4vid_tpfs[0]
> +
> +/* amdisp buffer for vb2 operations */
> +struct isp4vid_vb2_buf {
> +	struct device			*dev;
> +	void				*vaddr;
> +	struct frame_vector		*vec;
> +	enum dma_data_direction		dma_dir;
> +	unsigned long			size;
> +	refcount_t			refcount;
> +	struct dma_buf			*dbuf;
> +	void				*bo;
> +	u64				gpu_addr;
> +	struct vb2_vmarea_handler	handler;
> +	bool				is_expbuf;
> +};
> +
> +static int isp4vid_vb2_mmap(void *buf_priv, struct vm_area_struct *vma);
> +
> +static void isp4vid_vb2_put(void *buf_priv);
> +
> +static const char *isp4vid_video_dev_name = "Preview";
> +
> +/* Sizes must be in increasing order */
> +static const struct v4l2_frmsize_discrete isp4vid_frmsize[] = {
> +	{640, 360},
> +	{640, 480},
> +	{1280, 720},
> +	{1280, 960},
> +	{1920, 1080},
> +	{1920, 1440},
> +	{2560, 1440},
> +	{2880, 1620},
> +	{2880, 1624},
> +	{2888, 1808},
> +};
> +
> +static const u32 isp4vid_formats[] = {
> +	V4L2_PIX_FMT_NV12,
> +	V4L2_PIX_FMT_YUYV
> +};
> +
> +/* timeperframe list */
> +static const struct v4l2_fract isp4vid_tpfs[] = {
> +	{.numerator = 1, .denominator = ISP4VID_MAX_PREVIEW_FPS}
> +};
> +
> +static void
> +isp4vid_handle_frame_done(struct isp4vid_dev *isp_vdev,
> +			  const struct isp4if_img_buf_info *img_buf,
> +			  bool done_suc)
> +{
> +	struct isp4vid_capture_buffer *isp4vid_buf;
> +	enum vb2_buffer_state state;
> +	void *vbuf;
> +
> +	mutex_lock(&isp_vdev->buf_list_lock);
> +
> +	/* Get the first entry of the list */
> +	isp4vid_buf = list_first_entry_or_null(&isp_vdev->buf_list,
> +					       typeof(*isp4vid_buf), list);
> +	if (!isp4vid_buf) {
> +		mutex_unlock(&isp_vdev->buf_list_lock);
> +		return;
> +	}
> +
> +	vbuf = vb2_plane_vaddr(&isp4vid_buf->vb2.vb2_buf, 0);
> +
> +	if (vbuf != img_buf->planes[0].sys_addr) {
> +		dev_err(isp_vdev->dev, "Invalid vbuf");
> +		mutex_unlock(&isp_vdev->buf_list_lock);
> +		return;
> +	}
> +
> +	/* Remove this entry from the list */
> +	list_del(&isp4vid_buf->list);
> +
> +	mutex_unlock(&isp_vdev->buf_list_lock);
> +
> +	/* Fill the buffer */
> +	isp4vid_buf->vb2.vb2_buf.timestamp = ktime_get_ns();
> +	isp4vid_buf->vb2.sequence = isp_vdev->sequence++;
> +	isp4vid_buf->vb2.field = V4L2_FIELD_ANY;
> +
> +	/* at most 2 planes */
> +	vb2_set_plane_payload(&isp4vid_buf->vb2.vb2_buf,
> +			      0, isp_vdev->format.sizeimage);
> +
> +	state = done_suc ? VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
> +	vb2_buffer_done(&isp4vid_buf->vb2.vb2_buf, state);
> +
> +	dev_dbg(isp_vdev->dev, "call vb2_buffer_done(size=%u)\n",
> +		isp_vdev->format.sizeimage);
> +}
> +
> +s32 isp4vid_notify(void *cb_ctx, struct isp4vid_framedone_param *evt_param)
> +{
> +	struct isp4vid_dev *isp4vid_vdev = cb_ctx;
> +
> +	if (evt_param->preview.status != ISP4VID_BUF_DONE_STATUS_ABSENT) {
> +		bool suc;
> +
> +		suc = (evt_param->preview.status ==
> +		       ISP4VID_BUF_DONE_STATUS_SUCCESS);
> +		isp4vid_handle_frame_done(isp4vid_vdev,
> +					  &evt_param->preview.buf,
> +					  suc);
> +	}
> +
> +	return 0;
> +}
> +
> +void isp4vid_frmsize_range(struct v4l2_frmsize_discrete *min,
> +			   struct v4l2_frmsize_discrete *max)
> +{
> +	if (!min || !max) {
> +		pr_err("fail, null param\n");
> +		return;
> +	}
> +
> +	min->width = isp4vid_frmsize[0].width;
> +	min->height = isp4vid_frmsize[0].height;
> +	max->width = isp4vid_frmsize[ARRAY_SIZE(isp4vid_frmsize) - 1].width;
> +	max->height = isp4vid_frmsize[ARRAY_SIZE(isp4vid_frmsize) - 1].height;
> +}
> +
> +static unsigned int isp4vid_vb2_num_users(void *buf_priv)
> +{
> +	struct isp4vid_vb2_buf *buf = buf_priv;
> +
> +	if (!buf) {
> +		pr_err("fail null buf handle\n");
> +		return 0;
> +	}
> +	return refcount_read(&buf->refcount);
> +}
> +
> +static int isp4vid_vb2_mmap(void *buf_priv, struct vm_area_struct *vma)
> +{
> +	struct isp4vid_vb2_buf *buf = buf_priv;
> +	int ret;
> +
> +	if (!buf) {
> +		pr_err("fail no memory to map\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = remap_vmalloc_range(vma, buf->vaddr, 0);
> +	if (ret) {
> +		dev_err(buf->dev, "fail remap vmalloc mem, %d\n", ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Make sure that vm_areas for 2 buffers won't be merged together
> +	 */
> +	vm_flags_set(vma, VM_DONTEXPAND);
> +
> +	dev_dbg(buf->dev, "mmap isp user bo 0x%llx size %ld refcount %d\n",
> +		buf->gpu_addr, buf->size, buf->refcount.refs.counter);
> +
> +	return 0;
> +}
> +
> +static void *isp4vid_vb2_vaddr(struct vb2_buffer *vb, void *buf_priv)
> +{
> +	struct isp4vid_vb2_buf *buf = buf_priv;
> +
> +	if (!buf) {
> +		pr_err("fail for empty buf\n");
> +		return NULL;
> +	}
> +
> +	if (!buf->vaddr) {
> +		dev_err(buf->dev,
> +			"fail for buf vaddr is null\n");
> +		return NULL;
> +	}
> +	return buf->vaddr;
> +}
> +
> +static void isp4vid_vb2_detach_dmabuf(void *mem_priv)
> +{
> +	struct isp4vid_vb2_buf *buf = mem_priv;
> +
> +	if (!buf) {
> +		pr_err("fail invalid buf handle\n");
> +		return;
> +	}
> +
> +	struct iosys_map map = IOSYS_MAP_INIT_VADDR(buf->vaddr);
> +
> +	dev_dbg(buf->dev, "detach dmabuf of isp user bo 0x%llx size %ld",
> +		buf->gpu_addr, buf->size);
> +
> +	if (buf->vaddr)
> +		dma_buf_vunmap_unlocked(buf->dbuf, &map);
> +
> +	// put dmabuf for exported ones
> +	dma_buf_put(buf->dbuf);
> +
> +	kfree(buf);
> +}
> +
> +static void *isp4vid_vb2_attach_dmabuf(struct vb2_buffer *vb,
> +				       struct device *dev,
> +				       struct dma_buf *dbuf,
> +				       unsigned long size)
> +{
> +	struct isp4vid_vb2_buf *buf;
> +
> +	if (dbuf->size < size) {
> +		dev_err(dev, "Invalid dmabuf size %ld %ld", dbuf->size, size);
> +		return ERR_PTR(-EFAULT);
> +	}
> +
> +	buf = kzalloc(sizeof(*buf), GFP_KERNEL);
> +	if (!buf)
> +		return ERR_PTR(-ENOMEM);
> +
> +	struct isp4vid_vb2_buf *dbg_buf = (struct isp4vid_vb2_buf *)dbuf->priv;
> +
> +	buf->dev = dev;
> +	buf->dbuf = dbuf;
> +	buf->dma_dir = vb->vb2_queue->dma_dir;
> +	buf->size = size;
> +
> +	dev_dbg(dev, "attach dmabuf of isp user bo 0x%llx size %ld",
> +		dbg_buf->gpu_addr, dbg_buf->size);
> +
> +	return buf;
> +}
> +
> +static void isp4vid_vb2_unmap_dmabuf(void *mem_priv)
> +{
> +	struct isp4vid_vb2_buf *buf = mem_priv;
> +
> +	if (!buf) {
> +		pr_err("fail invalid buf handle\n");
> +		return;
> +	}
> +
> +	struct iosys_map map = IOSYS_MAP_INIT_VADDR(buf->vaddr);
> +
> +	dev_dbg(buf->dev, "unmap dmabuf of isp user bo 0x%llx size %ld",
> +		buf->gpu_addr, buf->size);
> +
> +	dma_buf_vunmap_unlocked(buf->dbuf, &map);
> +	buf->vaddr = NULL;
> +}
> +
> +static int isp4vid_vb2_map_dmabuf(void *mem_priv)
> +{
> +	struct isp4vid_vb2_buf *mmap_buf = NULL;
> +	struct isp4vid_vb2_buf *buf = mem_priv;
> +	struct iosys_map map;
> +	int ret;
> +
> +	memset(&map, 0x0, sizeof(map));
> +
> +	if (!buf) {
> +		pr_err("fail invalid buf handle\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = dma_buf_vmap_unlocked(buf->dbuf, &map);
> +	if (ret) {
> +		dev_err(buf->dev, "vmap_unlocked fail");
> +		return -EFAULT;
> +	}
> +	buf->vaddr = map.vaddr;
> +
> +	mmap_buf = (struct isp4vid_vb2_buf *)buf->dbuf->priv;
> +	buf->gpu_addr = mmap_buf->gpu_addr;
> +
> +	dev_dbg(buf->dev, "map dmabuf of isp user bo 0x%llx size %ld",
> +		buf->gpu_addr, buf->size);
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_HAS_DMA
> +struct isp4vid_vb2_amdgpu_attachment {
> +	struct sg_table sgt;
> +	enum dma_data_direction dma_dir;
> +};
> +
> +static int isp4vid_vb2_dmabuf_ops_attach(struct dma_buf *dbuf,
> +					 struct dma_buf_attachment *dbuf_attach)
> +{
> +	struct isp4vid_vb2_buf *buf = dbuf->priv;
> +	int num_pages = PAGE_ALIGN(buf->size) / PAGE_SIZE;
> +	struct isp4vid_vb2_amdgpu_attachment *attach;
> +	void *vaddr = buf->vaddr;
> +	struct scatterlist *sg;
> +	struct sg_table *sgt;
> +	int ret;
> +	int i;
> +
> +	attach = kzalloc(sizeof(*attach), GFP_KERNEL);
> +	if (!attach)
> +		return -ENOMEM;
> +
> +	sgt = &attach->sgt;
> +	ret = sg_alloc_table(sgt, num_pages, GFP_KERNEL);
> +	if (ret) {
> +		kfree(attach);
> +		return ret;
> +	}
> +	for_each_sgtable_sg(sgt, sg, i) {
> +		struct page *page = vmalloc_to_page(vaddr);
> +
> +		if (!page) {
> +			sg_free_table(sgt);
> +			kfree(attach);
> +			return -ENOMEM;
> +		}
> +		sg_set_page(sg, page, PAGE_SIZE, 0);
> +		vaddr = ((char *)vaddr) + PAGE_SIZE;
> +	}
> +
> +	attach->dma_dir = DMA_NONE;
> +	dbuf_attach->priv = attach;
> +
> +	return 0;
> +}
> +
> +static void
> +isp4vid_vb2_dmabuf_ops_detach(struct dma_buf *dbuf,
> +			      struct dma_buf_attachment *dbuf_attach)
> +{
> +	struct isp4vid_vb2_amdgpu_attachment *attach = dbuf_attach->priv;
> +	struct sg_table *sgt;
> +
> +	if (!attach) {
> +		pr_err("fail invalid attach handler\n");
> +		return;
> +	}
> +
> +	sgt = &attach->sgt;
> +
> +	/* release the scatterlist cache */
> +	if (attach->dma_dir != DMA_NONE)
> +		dma_unmap_sgtable(dbuf_attach->dev, sgt, attach->dma_dir, 0);
> +	sg_free_table(sgt);
> +	kfree(attach);
> +	dbuf_attach->priv = NULL;
> +}
> +
> +static struct sg_table
> +*isp4vid_vb2_dmabuf_ops_map(struct dma_buf_attachment *dbuf_attach,
> +			    enum dma_data_direction dma_dir)
> +{
> +	struct isp4vid_vb2_amdgpu_attachment *attach = dbuf_attach->priv;
> +	struct sg_table *sgt;
> +
> +	sgt = &attach->sgt;
> +	/* return previously mapped sg table */
> +	if (attach->dma_dir == dma_dir)
> +		return sgt;
> +
> +	/* release any previous cache */
> +	if (attach->dma_dir != DMA_NONE) {
> +		dma_unmap_sgtable(dbuf_attach->dev, sgt, attach->dma_dir, 0);
> +		attach->dma_dir = DMA_NONE;
> +	}
> +
> +	/* mapping to the client with new direction */
> +	if (dma_map_sgtable(dbuf_attach->dev, sgt, dma_dir, 0)) {
> +		dev_err(dbuf_attach->dev, "fail to map scatterlist");
> +		return ERR_PTR(-EIO);
> +	}
> +
> +	attach->dma_dir = dma_dir;
> +
> +	return sgt;
> +}
> +
> +static void isp4vid_vb2_dmabuf_ops_unmap(struct dma_buf_attachment *dbuf_attach,
> +					 struct sg_table *sgt,
> +					 enum dma_data_direction dma_dir)
> +{
> +	/* nothing to be done here */
> +}
> +
> +static int isp4vid_vb2_dmabuf_ops_vmap(struct dma_buf *dbuf,
> +				       struct iosys_map *map)
> +{
> +	struct isp4vid_vb2_buf *buf = dbuf->priv;
> +
> +	iosys_map_set_vaddr(map, buf->vaddr);
> +
> +	return 0;
> +}
> +
> +static void isp4vid_vb2_dmabuf_ops_release(struct dma_buf *dbuf)
> +{
> +	struct isp4vid_vb2_buf *buf = dbuf->priv;
> +
> +	/* drop reference obtained in vb2_isp4vid_get_dmabuf */
> +	if (buf->is_expbuf)
> +		isp4vid_vb2_put(dbuf->priv);
> +	else
> +		dev_dbg(buf->dev, "ignore buf release for implicit case");
> +}
> +
> +static int isp4vid_vb2_dmabuf_ops_mmap(struct dma_buf *dbuf,
> +				       struct vm_area_struct *vma)
> +{
> +	return isp4vid_vb2_mmap(dbuf->priv, vma);
> +}
> +
> +static const struct dma_buf_ops vb2_isp4vid_dmabuf_ops = {
> +	.attach = isp4vid_vb2_dmabuf_ops_attach,
> +	.detach = isp4vid_vb2_dmabuf_ops_detach,
> +	.map_dma_buf = isp4vid_vb2_dmabuf_ops_map,
> +	.unmap_dma_buf = isp4vid_vb2_dmabuf_ops_unmap,
> +	.vmap = isp4vid_vb2_dmabuf_ops_vmap,
> +	.mmap = isp4vid_vb2_dmabuf_ops_mmap,
> +	.release = isp4vid_vb2_dmabuf_ops_release,
> +};
> +
> +static struct dma_buf *isp4vid_get_dmabuf(struct vb2_buffer *vb,
> +					  void *buf_priv,
> +					  unsigned long flags)
> +{
> +	struct isp4vid_vb2_buf *buf = buf_priv;
> +	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> +	struct dma_buf *dbuf;
> +
> +	if (!buf) {
> +		pr_err("fail invalid buf handle\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	exp_info.ops = &vb2_isp4vid_dmabuf_ops;
> +	exp_info.size = buf->size;
> +	exp_info.flags = flags;
> +	exp_info.priv = buf;
> +
> +	if (WARN_ON(!buf->vaddr))
> +		return NULL;
> +
> +	dbuf = dma_buf_export(&exp_info);
> +	if (IS_ERR(dbuf))
> +		return NULL;
> +
> +	return dbuf;
> +}
> +
> +static struct dma_buf *isp4vid_vb2_get_dmabuf(struct vb2_buffer *vb,
> +					      void *buf_priv,
> +					      unsigned long flags)
> +{
> +	struct isp4vid_vb2_buf *buf = buf_priv;
> +	struct dma_buf *dbuf;
> +
> +	if (buf->dbuf) {
> +		dev_dbg(buf->dev,
> +			"dbuf already created, reuse implicit dbuf\n");
> +		dbuf = buf->dbuf;
> +	} else {
> +		dbuf = isp4vid_get_dmabuf(vb, buf_priv, flags);
> +		dev_dbg(buf->dev, "created new dbuf\n");
> +	}
> +	buf->is_expbuf = true;
> +	refcount_inc(&buf->refcount);
> +
> +	dev_dbg(buf->dev, "buf exported, refcount %d\n",
> +		buf->refcount.refs.counter);
> +
> +	return dbuf;
> +}
> +
> +#endif
> +
> +static void isp4vid_vb2_put_userptr(void *buf_priv)
> +{
> +	struct isp4vid_vb2_buf *buf = buf_priv;
> +
> +	if (!buf->vec->is_pfns) {
> +		unsigned long vaddr = (unsigned long)buf->vaddr & PAGE_MASK;
> +		unsigned int n_pages;
> +
> +		n_pages = frame_vector_count(buf->vec);
> +		if (vaddr)
> +			vm_unmap_ram((void *)vaddr, n_pages);
> +		if (buf->dma_dir == DMA_FROM_DEVICE ||
> +		    buf->dma_dir == DMA_BIDIRECTIONAL) {
> +			struct page **pages;
> +
> +			pages = frame_vector_pages(buf->vec);
> +			if (!WARN_ON_ONCE(IS_ERR(pages))) {
> +				unsigned int i;
> +
> +				for (i = 0; i < n_pages; i++)
> +					set_page_dirty_lock(pages[i]);
> +			}
> +		}
> +	} else {
> +		iounmap((__force void __iomem *)buf->vaddr);
> +	}
> +	vb2_destroy_framevec(buf->vec);
> +	kfree(buf);
> +}
> +
> +static void *isp4vid_vb2_get_userptr(struct vb2_buffer *vb, struct device *dev,
> +				     unsigned long vaddr, unsigned long size)
> +{
> +	struct isp4vid_vb2_buf *buf;
> +	struct frame_vector *vec;
> +	int n_pages, offset, i;
> +	int ret = -ENOMEM;
> +
> +	buf = kzalloc(sizeof(*buf), GFP_KERNEL);
> +	if (!buf)
> +		return ERR_PTR(-ENOMEM);
> +
> +	buf->dev = dev;
> +	buf->dma_dir = vb->vb2_queue->dma_dir;
> +	offset = vaddr & ~PAGE_MASK;
> +	buf->size = size;
> +	vec = vb2_create_framevec(vaddr, size,
> +				  buf->dma_dir == DMA_FROM_DEVICE ||
> +				  buf->dma_dir == DMA_BIDIRECTIONAL);
> +	if (IS_ERR(vec)) {
> +		kfree(buf);
> +		return vec;
> +	}
> +	buf->vec = vec;
> +	n_pages = frame_vector_count(vec);
> +	if (frame_vector_to_pages(vec) < 0) {
> +		unsigned long *nums = frame_vector_pfns(vec);
> +
> +		/*
> +		 * We cannot get page pointers for these pfns. Check memory is
> +		 * physically contiguous and use direct mapping.
> +		 */
> +		for (i = 1; i < n_pages; i++)
> +			if (nums[i - 1] + 1 != nums[i])
> +				goto err_destroy_free;
> +		buf->vaddr = (__force void *)
> +			     ioremap(__pfn_to_phys(nums[0]), size + offset);
> +	} else {
> +		buf->vaddr = vm_map_ram(frame_vector_pages(vec), n_pages, -1);
> +	}
> +
> +	if (!buf->vaddr)
> +		goto err_destroy_free;
> +
> +	buf->vaddr = ((char *)buf->vaddr) + offset;
> +	return buf;
> +
> +err_destroy_free:
> +	vb2_destroy_framevec(vec);
> +	kfree(buf);
> +	return ERR_PTR(ret);
> +}
> +
> +static void isp4vid_vb2_put(void *buf_priv)
> +{
> +	struct isp4vid_vb2_buf *buf = (struct isp4vid_vb2_buf *)buf_priv;
> +	struct amdgpu_bo *bo = (struct amdgpu_bo *)buf->bo;
> +
> +	dev_dbg(buf->dev,
> +		"release isp user bo 0x%llx size %ld refcount %d is_expbuf %d",
> +		buf->gpu_addr, buf->size,
> +		buf->refcount.refs.counter, buf->is_expbuf);
> +
> +	if (refcount_dec_and_test(&buf->refcount)) {
> +		amdgpu_bo_free_isp_user(bo);
> +
> +		// put implicit dmabuf here, detach_dmabuf will not be called
> +		if (!buf->is_expbuf)
> +			dma_buf_put(buf->dbuf);
> +
> +		vfree(buf->vaddr);
> +		kfree(buf);
> +		buf = NULL;
> +	} else {
> +		dev_warn(buf->dev, "ignore buffer free, refcount %u > 0",
> +			 refcount_read(&buf->refcount));
> +	}
> +}
> +
> +static void *isp4vid_vb2_alloc(struct vb2_buffer *vb, struct device *dev,
> +			       unsigned long size)
> +{
> +	struct isp4vid_dev *isp_vdev = vb2_get_drv_priv(vb->vb2_queue);
> +	struct isp4vid_vb2_buf *buf = NULL;
> +	struct amdgpu_bo *bo;
> +	u64 gpu_addr;
> +	u32 ret;
> +
> +	buf = kzalloc(sizeof(*buf), GFP_KERNEL | vb->vb2_queue->gfp_flags);
> +	if (!buf)
> +		return ERR_PTR(-ENOMEM);
> +
> +	buf->dev = dev;
> +	buf->size = size;
> +	buf->vaddr = vmalloc_user(buf->size);
> +	if (!buf->vaddr) {
> +		kfree(buf);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	buf->dma_dir = vb->vb2_queue->dma_dir;
> +	buf->handler.refcount = &buf->refcount;
> +	buf->handler.put = isp4vid_vb2_put;
> +	buf->handler.arg = buf;
> +
> +	// get implicit dmabuf
> +	buf->dbuf = isp4vid_get_dmabuf(vb, buf, 0);
> +	if (!buf->dbuf) {
> +		dev_err(dev, "fail to get dmabuf\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	// create isp user BO and obtain gpu_addr
> +	ret = amdgpu_bo_create_isp_user(isp_vdev->amdgpu_dev, buf->dbuf,
> +					AMDGPU_GEM_DOMAIN_GTT, &bo, &gpu_addr);
> +	if (ret) {
> +		dev_err(dev, "fail to create BO\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	buf->bo = (void *)bo;
> +	buf->gpu_addr = gpu_addr;
> +
> +	refcount_set(&buf->refcount, 1);
> +
> +	dev_dbg(dev, "allocated isp user bo 0x%llx size %ld refcount %d",
> +		buf->gpu_addr, buf->size, buf->refcount.refs.counter);
> +
> +	return buf;
> +}
> +
> +const struct vb2_mem_ops isp4vid_vb2_memops = {
> +	.alloc		= isp4vid_vb2_alloc,
> +	.put		= isp4vid_vb2_put,
> +	.get_userptr	= isp4vid_vb2_get_userptr,
> +	.put_userptr	= isp4vid_vb2_put_userptr,
> +#ifdef CONFIG_HAS_DMA
> +	.get_dmabuf	= isp4vid_vb2_get_dmabuf,
> +#endif
> +	.map_dmabuf	= isp4vid_vb2_map_dmabuf,
> +	.unmap_dmabuf	= isp4vid_vb2_unmap_dmabuf,
> +	.attach_dmabuf	= isp4vid_vb2_attach_dmabuf,
> +	.detach_dmabuf	= isp4vid_vb2_detach_dmabuf,
> +	.vaddr		= isp4vid_vb2_vaddr,
> +	.mmap		= isp4vid_vb2_mmap,
> +	.num_users	= isp4vid_vb2_num_users,
> +};
> +
> +static const struct v4l2_pix_format isp4vid_fmt_default = {
> +	.width = 1920,
> +	.height = 1080,
> +	.pixelformat = V4L2_PIX_FMT_NV12,
> +	.field = V4L2_FIELD_NONE,
> +	.colorspace = V4L2_COLORSPACE_SRGB,
> +};
> +
> +static void isp4vid_capture_return_all_buffers(struct isp4vid_dev *isp_vdev,
> +					       enum vb2_buffer_state state)
> +{
> +	struct isp4vid_capture_buffer *vbuf, *node;
> +
> +	mutex_lock(&isp_vdev->buf_list_lock);
> +
> +	list_for_each_entry_safe(vbuf, node, &isp_vdev->buf_list, list) {
> +		list_del(&vbuf->list);
> +		vb2_buffer_done(&vbuf->vb2.vb2_buf, state);
> +	}
> +	mutex_unlock(&isp_vdev->buf_list_lock);
> +
> +	dev_dbg(isp_vdev->dev, "call vb2_buffer_done(%d)\n", state);
> +}
> +
> +static int isp4vid_vdev_link_validate(struct media_link *link)
> +{
> +	return 0;
> +}
> +
> +static const struct media_entity_operations isp4vid_vdev_ent_ops = {
> +	.link_validate = isp4vid_vdev_link_validate,
> +};
> +
> +static const struct v4l2_file_operations isp4vid_vdev_fops = {
> +	.owner = THIS_MODULE,
> +	.open = v4l2_fh_open,
> +	.release = vb2_fop_release,
> +	.read = vb2_fop_read,
> +	.poll = vb2_fop_poll,
> +	.unlocked_ioctl = video_ioctl2,
> +	.mmap = vb2_fop_mmap,
> +};
> +
> +static int isp4vid_ioctl_querycap(struct file *file, void *fh,
> +				  struct v4l2_capability *cap)
> +{
> +	struct isp4vid_dev *isp_vdev = video_drvdata(file);
> +
> +	strscpy(cap->driver, ISP4VID_ISP_DRV_NAME, sizeof(cap->driver));
> +	snprintf(cap->card, sizeof(cap->card), "%s", ISP4VID_ISP_DRV_NAME);
> +	snprintf(cap->bus_info, sizeof(cap->bus_info),
> +		 "platform:%s", ISP4VID_ISP_DRV_NAME);
> +
> +	cap->capabilities |= (V4L2_CAP_STREAMING |
> +			      V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_IO_MC);
> +
> +	dev_dbg(isp_vdev->dev, "%s|capabilities=0x%X",
> +		isp_vdev->vdev.name, cap->capabilities);
> +
> +	return 0;
> +}
> +
> +static int isp4vid_g_fmt_vid_cap(struct file *file, void *priv,
> +				 struct v4l2_format *f)
> +{
> +	struct isp4vid_dev *isp_vdev = video_drvdata(file);
> +
> +	f->fmt.pix = isp_vdev->format;
> +
> +	return 0;
> +}
> +
> +static int isp4vid_try_fmt_vid_cap(struct file *file, void *priv,
> +				   struct v4l2_format *f)
> +{
> +	struct isp4vid_dev *isp_vdev = video_drvdata(file);
> +	struct v4l2_pix_format *format = &f->fmt.pix;
> +	unsigned int i;
> +
> +	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		return -EINVAL;
> +
> +	/*
> +	 * Check if the hardware supports the requested format, use the default
> +	 * format otherwise.
> +	 */
> +	for (i = 0; i < ARRAY_SIZE(isp4vid_formats); i++)
> +		if (isp4vid_formats[i] == format->pixelformat)
> +			break;
> +
> +	if (i == ARRAY_SIZE(isp4vid_formats))
> +		format->pixelformat = ISP4VID_DEFAULT_FMT;
> +
> +	switch (format->pixelformat) {
> +	case V4L2_PIX_FMT_NV12: {
> +		const struct v4l2_frmsize_discrete *fsz =
> +			v4l2_find_nearest_size(isp4vid_frmsize,
> +					       ARRAY_SIZE(isp4vid_frmsize),
> +					       width, height,
> +					       format->width, format->height);
> +
> +		format->width = fsz->width;
> +		format->height = fsz->height;
> +
> +		format->bytesperline = format->width;
> +		format->sizeimage = format->bytesperline *
> +				    format->height * 3 / 2;
> +	}
> +	break;
> +	case V4L2_PIX_FMT_YUYV: {
> +		const struct v4l2_frmsize_discrete *fsz =
> +			v4l2_find_nearest_size(isp4vid_frmsize,
> +					       ARRAY_SIZE(isp4vid_frmsize),
> +					       width, height,
> +					       format->width, format->height);
> +
> +		format->width = fsz->width;
> +		format->height = fsz->height;
> +
> +		format->bytesperline = format->width * 2;
> +		format->sizeimage = format->bytesperline * format->height;
> +	}
> +	break;
> +	default:
> +		dev_err(isp_vdev->dev, "%s|unsupported fmt=%u",
> +			isp_vdev->vdev.name, format->pixelformat);
> +		return -EINVAL;
> +	}
> +
> +	if (format->field == V4L2_FIELD_ANY)
> +		format->field = isp4vid_fmt_default.field;
> +
> +	if (format->colorspace == V4L2_COLORSPACE_DEFAULT)
> +		format->colorspace = isp4vid_fmt_default.colorspace;
> +
> +	return 0;
> +}
> +
> +static int isp4vid_set_fmt_2_isp(struct v4l2_subdev *sdev,
> +				 struct v4l2_pix_format *pix_fmt)
> +{
> +	struct v4l2_subdev_format fmt = {0};
> +
> +	switch (pix_fmt->pixelformat) {
> +	case V4L2_PIX_FMT_NV12:
> +		fmt.format.code = MEDIA_BUS_FMT_YUYV8_1_5X8;
> +		break;
> +	case V4L2_PIX_FMT_YUYV:
> +		fmt.format.code = MEDIA_BUS_FMT_YUYV8_1X16;
> +		break;
> +	default:
> +		return -EINVAL;
> +	};
> +	fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> +	fmt.pad = ISP4VID_PAD_VIDEO_OUTPUT;
> +	fmt.format.width = pix_fmt->width;
> +	fmt.format.height = pix_fmt->height;
> +	return v4l2_subdev_call(sdev, pad, set_fmt, NULL, &fmt);
> +}
> +
> +static int isp4vid_s_fmt_vid_cap(struct file *file, void *priv,
> +				 struct v4l2_format *f)
> +{
> +	struct isp4vid_dev *isp_vdev = video_drvdata(file);
> +	u32 pitch;
> +	int ret;
> +
> +	/* Do not change the format while stream is on */
> +	if (vb2_is_busy(&isp_vdev->vbq))
> +		return -EBUSY;
> +
> +	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		return -EINVAL;
> +
> +	ret = isp4vid_try_fmt_vid_cap(file, priv, f);
> +	if (ret)
> +		return ret;
> +
> +	dev_dbg(isp_vdev->dev, "%s|width height:%ux%u->%ux%u",
> +		isp_vdev->vdev.name,
> +		isp_vdev->format.width, isp_vdev->format.height,
> +		f->fmt.pix.width, f->fmt.pix.height);
> +	dev_dbg(isp_vdev->dev, "%s|pixelformat:0x%x-0x%x",
> +		isp_vdev->vdev.name, isp_vdev->format.pixelformat,
> +		f->fmt.pix.pixelformat);
> +	dev_dbg(isp_vdev->dev, "%s|bytesperline:%u->%u",
> +		isp_vdev->vdev.name, isp_vdev->format.bytesperline,
> +		f->fmt.pix.bytesperline);
> +	dev_dbg(isp_vdev->dev, "%s|sizeimage:%u->%u",
> +		isp_vdev->vdev.name, isp_vdev->format.sizeimage,
> +		f->fmt.pix.sizeimage);
> +
> +	isp_vdev->format = f->fmt.pix;
> +
> +	switch (isp_vdev->format.pixelformat) {
> +	case V4L2_PIX_FMT_NV12:
> +		pitch = isp_vdev->format.width;
> +		break;
> +	case V4L2_PIX_FMT_YUYV:
> +		pitch = isp_vdev->format.width * 2;
> +		break;
> +	default:
> +		dev_err(isp_vdev->dev, "%s|unsupported fmt=0x%x\n",
> +			isp_vdev->vdev.name, isp_vdev->format.pixelformat);
> +		return -EINVAL;
> +	}
> +
> +	ret = isp4vid_set_fmt_2_isp(isp_vdev->isp_sdev, &isp_vdev->format);
> +
> +	return ret;
> +}
> +
> +static int isp4vid_enum_fmt_vid_cap(struct file *file, void *priv,
> +				    struct v4l2_fmtdesc *f)
> +{
> +	struct isp4vid_dev *isp_vdev = video_drvdata(file);
> +
> +	switch (f->index) {
> +	case 0:
> +		f->pixelformat = V4L2_PIX_FMT_NV12;
> +		break;
> +	case 1:
> +		f->pixelformat = V4L2_PIX_FMT_YUYV;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(isp_vdev->dev, "%s|index=%d, pixelformat=0x%X",
> +		isp_vdev->vdev.name, f->index, f->pixelformat);
> +
> +	return 0;
> +}
> +
> +static int isp4vid_enum_framesizes(struct file *file, void *fh,
> +				   struct v4l2_frmsizeenum *fsize)
> +{
> +	struct isp4vid_dev *isp_vdev = video_drvdata(file);
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(isp4vid_formats); i++) {
> +		if (isp4vid_formats[i] == fsize->pixel_format)
> +			break;
> +	}
> +	if (i == ARRAY_SIZE(isp4vid_formats))
> +		return -EINVAL;
> +
> +	if (fsize->index < ARRAY_SIZE(isp4vid_frmsize)) {
> +		fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
> +		fsize->discrete = isp4vid_frmsize[fsize->index];
> +		dev_dbg(isp_vdev->dev, "%s|size[%d]=%dx%d",
> +			isp_vdev->vdev.name, fsize->index,
> +			fsize->discrete.width, fsize->discrete.height);
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int isp4vid_ioctl_enum_frameintervals(struct file *file, void *priv,
> +					     struct v4l2_frmivalenum *fival)
> +{
> +	struct isp4vid_dev *isp_vdev = video_drvdata(file);
> +	int i;
> +
> +	if (fival->index >= ARRAY_SIZE(isp4vid_tpfs))
> +		return -EINVAL;
> +
> +	for (i = 0; i < ARRAY_SIZE(isp4vid_formats); i++)
> +		if (isp4vid_formats[i] == fival->pixel_format)
> +			break;
> +	if (i == ARRAY_SIZE(isp4vid_formats))
> +		return -EINVAL;
> +
> +	for (i = 0; i < ARRAY_SIZE(isp4vid_frmsize); i++)
> +		if (isp4vid_frmsize[i].width == fival->width &&
> +		    isp4vid_frmsize[i].height == fival->height)
> +			break;
> +	if (i == ARRAY_SIZE(isp4vid_frmsize))
> +		return -EINVAL;
> +
> +	fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
> +	fival->discrete = isp4vid_tpfs[fival->index];
> +	v4l2_simplify_fraction(&fival->discrete.numerator,
> +			       &fival->discrete.denominator, 8, 333);
> +
> +	dev_dbg(isp_vdev->dev, "%s|interval[%d]=%d/%d",
> +		isp_vdev->vdev.name, fival->index,
> +		fival->discrete.numerator,
> +		fival->discrete.denominator);
> +
> +	return 0;
> +}
> +
> +static int isp4vid_ioctl_g_param(struct file *file, void *priv,
> +				 struct v4l2_streamparm *param)
> +{
> +	struct isp4vid_dev *isp_vdev = video_drvdata(file);
> +
> +	if (param->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		return -EINVAL;
> +
> +	param->parm.capture.capability   = V4L2_CAP_TIMEPERFRAME;
> +	param->parm.capture.timeperframe = isp_vdev->timeperframe;
> +	param->parm.capture.readbuffers  = 0;
> +
> +	dev_dbg(isp_vdev->dev, "%s|timeperframe=%d/%d", isp_vdev->vdev.name,
> +		param->parm.capture.timeperframe.numerator,
> +		param->parm.capture.timeperframe.denominator);
> +	return 0;
> +}
> +
> +static const struct v4l2_ioctl_ops isp4vid_vdev_ioctl_ops = {
> +	/* VIDIOC_QUERYCAP handler */
> +	.vidioc_querycap = isp4vid_ioctl_querycap,
> +
> +	/* VIDIOC_ENUM_FMT handlers */
> +	.vidioc_enum_fmt_vid_cap = isp4vid_enum_fmt_vid_cap,
> +
> +	/* VIDIOC_G_FMT handlers */
> +	.vidioc_g_fmt_vid_cap = isp4vid_g_fmt_vid_cap,
> +
> +	/* VIDIOC_S_FMT handlers */
> +	.vidioc_s_fmt_vid_cap = isp4vid_s_fmt_vid_cap,
> +
> +	/* VIDIOC_TRY_FMT handlers */
> +	.vidioc_try_fmt_vid_cap = isp4vid_try_fmt_vid_cap,
> +
> +	/* Buffer handlers */
> +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> +	.vidioc_querybuf = vb2_ioctl_querybuf,
> +	.vidioc_qbuf = vb2_ioctl_qbuf,
> +	.vidioc_expbuf = vb2_ioctl_expbuf,
> +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
> +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> +
> +	/* Stream on/off */
> +	.vidioc_streamon = vb2_ioctl_streamon,
> +	.vidioc_streamoff = vb2_ioctl_streamoff,
> +
> +	/* Stream type-dependent parameter ioctls */
> +	.vidioc_g_parm        = isp4vid_ioctl_g_param,
> +
> +	/* Debugging ioctls */
> +	.vidioc_enum_framesizes = isp4vid_enum_framesizes,
> +
> +	/* VIDIOC_ENUM_FRAMEINTERVALS */
> +	.vidioc_enum_frameintervals = isp4vid_ioctl_enum_frameintervals,
> +
> +};
> +
> +static unsigned int isp4vid_get_image_size(struct v4l2_pix_format *fmt)
> +{
> +	switch (fmt->pixelformat) {
> +	case V4L2_PIX_FMT_NV12:
> +		return fmt->width * fmt->height * 3 / 2;
> +	case V4L2_PIX_FMT_YUYV:
> +		return fmt->width * fmt->height * 2;
> +	default:
> +		return 0;
> +	}
> +};
> +
> +static int isp4vid_qops_queue_setup(struct vb2_queue *vq,
> +				    unsigned int *nbuffers,
> +				    unsigned int *nplanes, unsigned int sizes[],
> +				    struct device *alloc_devs[])
> +{
> +	struct isp4vid_dev *isp_vdev = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
> +
> +	if (*nplanes > 1) {
> +		dev_err(isp_vdev->dev,
> +			"fail to setup queue, no mplane supported %u\n",
> +			*nplanes);
> +		return -EINVAL;
> +	};
> +
> +	if (*nplanes == 1) {
> +		unsigned int size;
> +
> +		size = isp4vid_get_image_size(&isp_vdev->format);
> +		if (sizes[0] < size) {
> +			dev_err(isp_vdev->dev,
> +				"fail for small plane size %u, %u expected\n",
> +				sizes[0], size);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	if (q_num_bufs + *nbuffers < ISP4VID_VIDEO_BUF_NUM)
> +		*nbuffers = ISP4VID_VIDEO_BUF_NUM - q_num_bufs;
> +
> +	switch (isp_vdev->format.pixelformat) {
> +	case V4L2_PIX_FMT_NV12:
> +	case V4L2_PIX_FMT_YUYV: {
> +		*nplanes = 1;
> +		sizes[0] = max(sizes[0], isp_vdev->format.sizeimage);
> +		isp_vdev->format.sizeimage = sizes[0];
> +	}
> +	break;
> +	default:
> +		dev_err(isp_vdev->dev, "%s|unsupported fmt=%u\n",
> +			isp_vdev->vdev.name, isp_vdev->format.pixelformat);
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(isp_vdev->dev, "%s|*nbuffers=%u *nplanes=%u sizes[0]=%u\n",
> +		isp_vdev->vdev.name,
> +		*nbuffers, *nplanes, sizes[0]);
> +
> +	return 0;
> +}
> +
> +static void isp4vid_qops_buffer_queue(struct vb2_buffer *vb)
> +{
> +	struct isp4vid_capture_buffer *buf =
> +		container_of(vb, struct isp4vid_capture_buffer, vb2.vb2_buf);
> +	struct isp4vid_dev *isp_vdev = vb2_get_drv_priv(vb->vb2_queue);
> +
> +	struct isp4vid_vb2_buf *priv_buf = vb->planes[0].mem_priv;
> +	struct isp4if_img_buf_info *img_buf = &buf->img_buf;
> +
> +	dev_dbg(isp_vdev->dev, "%s|index=%u", isp_vdev->vdev.name, vb->index);
> +
> +	dev_dbg(isp_vdev->dev, "queue isp user bo 0x%llx size=%lu",
> +		priv_buf->gpu_addr,
> +		priv_buf->size);
> +
> +	switch (isp_vdev->format.pixelformat) {
> +	case V4L2_PIX_FMT_NV12: {
> +		u32 y_size = isp_vdev->format.sizeimage / 3 * 2;
> +		u32 uv_size = isp_vdev->format.sizeimage / 3;
> +
> +		img_buf->planes[0].len = y_size;
> +		img_buf->planes[0].sys_addr = priv_buf->vaddr;
> +		img_buf->planes[0].mc_addr = priv_buf->gpu_addr;
> +
> +		dev_dbg(isp_vdev->dev, "img_buf[0]: mc=0x%llx size=%u",
> +			img_buf->planes[0].mc_addr,
> +			img_buf->planes[0].len);
> +
> +		img_buf->planes[1].len = uv_size;
> +		img_buf->planes[1].sys_addr =
> +			(void *)((u64)priv_buf->vaddr + y_size);
> +		img_buf->planes[1].mc_addr = priv_buf->gpu_addr + y_size;
> +
> +		dev_dbg(isp_vdev->dev, "img_buf[1]: mc=0x%llx size=%u",
> +			img_buf->planes[1].mc_addr,
> +			img_buf->planes[1].len);
> +
> +		img_buf->planes[2].len = 0;
> +	}
> +	break;
> +	case V4L2_PIX_FMT_YUYV: {
> +		img_buf->planes[0].len = isp_vdev->format.sizeimage;
> +		img_buf->planes[0].sys_addr = priv_buf->vaddr;
> +		img_buf->planes[0].mc_addr = priv_buf->gpu_addr;
> +
> +		dev_dbg(isp_vdev->dev, "img_buf[0]: mc=0x%llx size=%u",
> +			img_buf->planes[0].mc_addr,
> +			img_buf->planes[0].len);
> +
> +		img_buf->planes[1].len = 0;
> +		img_buf->planes[2].len = 0;
> +	}
> +	break;
> +	default:
> +		dev_err(isp_vdev->dev, "%s|unsupported fmt=%u",
> +			isp_vdev->vdev.name, isp_vdev->format.pixelformat);
> +		return;
> +	}
> +
> +	if (isp_vdev->stream_started)
> +		isp_vdev->ops->send_buffer(isp_vdev, img_buf);
> +
> +	mutex_lock(&isp_vdev->buf_list_lock);
> +	list_add_tail(&buf->list, &isp_vdev->buf_list);
> +	mutex_unlock(&isp_vdev->buf_list_lock);
> +}
> +
> +static void isp4vid_qops_buffer_cleanup(struct vb2_buffer *vb)
> +{
> +	struct isp4vid_dev *isp_vdev = vb2_get_drv_priv(vb->vb2_queue);
> +	struct isp4vid_vb2_buf *buf = vb->planes[0].mem_priv;
> +
> +	dev_dbg(isp_vdev->dev, "%s|index=%u vb->memory %u",
> +		isp_vdev->vdev.name, vb->index, vb->memory);
> +
> +	if (!buf) {
> +		dev_err(isp_vdev->dev, "Invalid buf handle");
> +		return;
> +	}
> +
> +	// release implicit dmabuf reference here for vb2 buffer
> +	// of type MMAP and is exported
> +	if (vb->memory == VB2_MEMORY_MMAP && buf->is_expbuf) {
> +		dma_buf_put(buf->dbuf);
> +		dev_dbg(isp_vdev->dev,
> +			"put dmabuf for vb->memory %d expbuf %d",
> +			vb->memory,
> +			buf->is_expbuf);
> +	}
> +}
> +
> +static int isp4vid_qops_start_streaming(struct vb2_queue *vq,
> +					unsigned int count)
> +{
> +	struct isp4vid_dev *isp_vdev = vb2_get_drv_priv(vq);
> +	struct isp4vid_capture_buffer *isp_buf;
> +	struct v4l2_subdev *isp_subdev = NULL;
> +	struct media_entity *entity;
> +	struct v4l2_subdev *subdev;
> +	struct media_pad *pad;
> +	int ret = 0;
> +
> +	if (isp_vdev->stream_started) {
> +		dev_dbg(isp_vdev->dev,
> +			"%s do nothing for already streaming\n",
> +			isp_vdev->vdev.name);
> +		return 0;
> +	}
> +	isp_vdev->sequence = 0;
> +	ret = v4l2_pipeline_pm_get(&isp_vdev->vdev.entity);
> +	if (ret) {
> +		dev_err(isp_vdev->dev, "power up isp fail %d\n", ret);
> +		return ret;
> +	}
> +
> +	entity = &isp_vdev->vdev.entity;
> +	while (1) {
> +		pad = &entity->pads[0];
> +		if (!(pad->flags & MEDIA_PAD_FL_SINK))
> +			break;
> +
> +		pad = media_pad_remote_pad_first(pad);
> +		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
> +			break;
> +
> +		entity = pad->entity;
> +		subdev = media_entity_to_v4l2_subdev(entity);
> +
> +		if (entity->function == MEDIA_ENT_F_PROC_VIDEO_ISP) {
> +			ret = v4l2_subdev_call(subdev, video, pre_streamon, 0);
> +			/* The isp s_stream should be called last! */
> +			isp_subdev = subdev;
> +		} else {
> +			ret = v4l2_subdev_call(subdev, video, s_stream, 1);
> +		}
> +
> +		if (ret < 0 && ret != -ENOIOCTLCMD) {
> +			dev_dbg(isp_vdev->dev, "fail start streaming: %s %d\n",
> +				subdev->name, ret);
> +			return ret;
> +		}
> +	}
> +
> +	if (isp_subdev) {
> +		ret = v4l2_subdev_call(isp_subdev, video, s_stream, 1);
> +		if (ret < 0 && ret != -ENOIOCTLCMD) {
> +			dev_dbg(isp_vdev->dev, "fail start stream: %s %d\n",
> +				isp_subdev->name, ret);
> +			return ret;
> +		}
> +	}
> +
> +	list_for_each_entry(isp_buf, &isp_vdev->buf_list, list) {
> +		isp_vdev->ops->send_buffer(isp_vdev, &isp_buf->img_buf);
> +	}
> +
> +	/* Start the media pipeline */
> +	ret = video_device_pipeline_start(&isp_vdev->vdev, &isp_vdev->pipe);
> +	if (ret) {
> +		dev_err(isp_vdev->dev, "video_device_pipeline_start fail:%d",
> +			ret);
> +		isp4vid_capture_return_all_buffers(isp_vdev,
> +						   VB2_BUF_STATE_QUEUED);
> +		return ret;
> +	}
> +	isp_vdev->stream_started = true;
> +
> +	return 0;
> +}
> +
> +static void isp4vid_qops_stop_streaming(struct vb2_queue *vq)
> +{
> +	struct isp4vid_dev *isp_vdev = vb2_get_drv_priv(vq);
> +	struct v4l2_subdev *subdev, *isp_subdev = NULL;
> +	struct media_entity *entity;
> +	struct media_pad *pad;
> +	int ret;
> +
> +	if (!isp_vdev->stream_started) {
> +		dev_dbg(isp_vdev->dev,
> +			"%s stop_streaming, do none for not started\n",
> +			isp_vdev->vdev.name);
> +		return;
> +	}
> +	dev_dbg(isp_vdev->dev, "%s stop_streaming\n",
> +		isp_vdev->vdev.name);
> +
> +	entity = &isp_vdev->vdev.entity;
> +	while (1) {
> +		pad = &entity->pads[0];
> +		if (!(pad->flags & MEDIA_PAD_FL_SINK))
> +			break;
> +
> +		pad = media_pad_remote_pad_first(pad);
> +		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
> +			break;
> +
> +		entity = pad->entity;
> +		subdev = media_entity_to_v4l2_subdev(entity);
> +
> +		if (entity->function == MEDIA_ENT_F_PROC_VIDEO_ISP) {
> +			/*
> +			 * isp subdev to call isp post_streamoff
> +			 * after s_stream sequence
> +			 */
> +			isp_subdev = subdev;
> +		}
> +		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
> +
> +		if (ret < 0 && ret != -ENOIOCTLCMD)
> +			dev_dbg(isp_vdev->dev, "fail start streaming: %s %d\n",
> +				subdev->name, ret);
> +	}
> +
> +	if (isp_subdev) {
> +		ret = v4l2_subdev_call(isp_subdev, video, post_streamoff);
> +		if (ret < 0 && ret != -ENOIOCTLCMD)
> +			dev_dbg(isp_vdev->dev, "fail start stream: %s %d\n",
> +				isp_subdev->name, ret);
> +	}
> +
> +	isp_vdev->stream_started = false;
> +	v4l2_pipeline_pm_put(&isp_vdev->vdev.entity);
> +
> +	/* Stop the media pipeline */
> +	video_device_pipeline_stop(&isp_vdev->vdev);
> +
> +	/* Release all active buffers */
> +	isp4vid_capture_return_all_buffers(isp_vdev, VB2_BUF_STATE_ERROR);
> +}
> +
> +static int isp4vid_fill_buffer_size(struct isp4vid_dev *isp_vdev)
> +{
> +	int ret = 0;
> +
> +	switch (isp_vdev->format.pixelformat) {
> +	case V4L2_PIX_FMT_NV12:
> +		isp_vdev->format.bytesperline = isp_vdev->format.width;
> +		isp_vdev->format.sizeimage = isp_vdev->format.bytesperline *
> +					     isp_vdev->format.height * 3 / 2;
> +		break;
> +	case V4L2_PIX_FMT_YUYV:
> +		isp_vdev->format.bytesperline = isp_vdev->format.width;
> +		isp_vdev->format.sizeimage = isp_vdev->format.bytesperline *
> +					     isp_vdev->format.height * 2;
> +		break;
> +	default:
> +		dev_err(isp_vdev->dev, "fail for invalid default format 0x%x",
> +			isp_vdev->format.pixelformat);
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct vb2_ops isp4vid_qops = {
> +	.queue_setup = isp4vid_qops_queue_setup,
> +	.buf_cleanup = isp4vid_qops_buffer_cleanup,
> +	.buf_queue = isp4vid_qops_buffer_queue,
> +	.start_streaming = isp4vid_qops_start_streaming,
> +	.stop_streaming = isp4vid_qops_stop_streaming,
> +	.wait_prepare = vb2_ops_wait_prepare,
> +	.wait_finish = vb2_ops_wait_finish,
> +};
> +
> +int isp4vid_dev_init(struct isp4vid_dev *isp_vdev,
> +		     struct v4l2_subdev *isp_sdev,
> +		     const struct isp4vid_ops *ops,
> +		     void *amdgpu_dev)
> +{
> +	const char *vdev_name = isp4vid_video_dev_name;
> +	struct v4l2_device *v4l2_dev;
> +	struct video_device *vdev;
> +	struct vb2_queue *q;
> +	int ret;
> +
> +	if (!isp_vdev || !isp_sdev || !isp_sdev->v4l2_dev || !amdgpu_dev)
> +		return -EINVAL;
> +
> +	v4l2_dev = isp_sdev->v4l2_dev;
> +	vdev = &isp_vdev->vdev;
> +
> +	isp_vdev->isp_sdev = isp_sdev;
> +	isp_vdev->amdgpu_dev = amdgpu_dev;
> +	isp_vdev->dev = v4l2_dev->dev;
> +	isp_vdev->ops = ops;
> +
> +	/* Initialize the vb2_queue struct */
> +	mutex_init(&isp_vdev->vbq_lock);
> +	q = &isp_vdev->vbq;
> +	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +	q->io_modes = VB2_MMAP | VB2_DMABUF;
> +	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	q->buf_struct_size = sizeof(struct isp4vid_capture_buffer);
> +	q->min_queued_buffers = 2;
> +	q->ops = &isp4vid_qops;
> +	q->drv_priv = isp_vdev;
> +	q->mem_ops = &isp4vid_vb2_memops;
> +	q->lock = &isp_vdev->vbq_lock;
> +	q->dev = v4l2_dev->dev;
> +	ret = vb2_queue_init(q);
> +	if (ret) {
> +		dev_err(v4l2_dev->dev, "vb2_queue_init error:%d", ret);
> +		return ret;
> +	}
> +	/* Initialize buffer list and its lock */
> +	mutex_init(&isp_vdev->buf_list_lock);
> +	INIT_LIST_HEAD(&isp_vdev->buf_list);
> +
> +	/* Set default frame format */
> +	isp_vdev->format = isp4vid_fmt_default;
> +	isp_vdev->timeperframe = ISP4VID_ISP_TPF_DEFAULT;
> +	v4l2_simplify_fraction(&isp_vdev->timeperframe.numerator,
> +			       &isp_vdev->timeperframe.denominator, 8, 333);
> +
> +	ret = isp4vid_fill_buffer_size(isp_vdev);
> +	if (ret) {
> +		dev_err(v4l2_dev->dev, "fail to fill buffer size: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = isp4vid_set_fmt_2_isp(isp_sdev, &isp_vdev->format);
> +	if (ret) {
> +		dev_err(v4l2_dev->dev, "fail init format :%d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Initialize the video_device struct */
> +	isp_vdev->vdev.entity.name = vdev_name;
> +	isp_vdev->vdev.entity.function = MEDIA_ENT_F_IO_V4L;
> +	isp_vdev->vdev_pad.flags = MEDIA_PAD_FL_SINK;
> +	ret = media_entity_pads_init(&isp_vdev->vdev.entity, 1,
> +				     &isp_vdev->vdev_pad);
> +
> +	if (ret) {
> +		dev_err(v4l2_dev->dev, "init media entity pad fail:%d\n", ret);
> +		return ret;
> +	}
> +
> +	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE |
> +			    V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
> +	vdev->entity.ops = &isp4vid_vdev_ent_ops;
> +	vdev->release = video_device_release_empty;
> +	vdev->fops = &isp4vid_vdev_fops;
> +	vdev->ioctl_ops = &isp4vid_vdev_ioctl_ops;
> +	vdev->lock = NULL;
> +	vdev->queue = q;
> +	vdev->v4l2_dev = v4l2_dev;
> +	vdev->vfl_dir = VFL_DIR_RX;
> +	strscpy(vdev->name, vdev_name, sizeof(vdev->name));
> +	video_set_drvdata(vdev, isp_vdev);
> +
> +	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> +	if (ret)
> +		dev_err(v4l2_dev->dev, "register video device fail:%d\n", ret);
> +
> +	return ret;
> +}
> +
> +void isp4vid_dev_deinit(struct isp4vid_dev *isp_vdev)
> +{
> +	video_unregister_device(&isp_vdev->vdev);
> +}
> diff --git a/drivers/media/platform/amd/isp4/isp4_video.h b/drivers/media/platform/amd/isp4/isp4_video.h
> new file mode 100644
> index 000000000000..4d6705174d34
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4_video.h
> @@ -0,0 +1,93 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _ISP4_VIDEO_H_
> +#define _ISP4_VIDEO_H_
> +
> +#include <linux/mutex.h>
> +#include <media/videobuf2-memops.h>
> +#include <media/videobuf2-vmalloc.h>
> +#include <media/v4l2-dev.h>
> +#include "isp4_interface.h"
> +
> +enum isp4vid_buf_done_status {
> +	/* It means no corresponding image buf in fw response */
> +	ISP4VID_BUF_DONE_STATUS_ABSENT,
> +	ISP4VID_BUF_DONE_STATUS_SUCCESS,
> +	ISP4VID_BUF_DONE_STATUS_FAILED
> +};
> +
> +struct isp4vid_buf_done_info {
> +	enum isp4vid_buf_done_status status;
> +	struct isp4if_img_buf_info buf;
> +};
> +
> +/* call back parameter for CB_EVT_ID_FRAME_DONE */
> +struct isp4vid_framedone_param {
> +	s32 poc;
> +	s32 cam_id;
> +	s64 time_stamp;
> +	struct isp4vid_buf_done_info preview;
> +};
> +
> +struct isp4vid_capture_buffer {
> +	/*
> +	 * struct vb2_v4l2_buffer must be the first element
> +	 * the videobuf2 framework will allocate this struct based on
> +	 * buf_struct_size and use the first sizeof(struct vb2_buffer) bytes of
> +	 * memory as a vb2_buffer
> +	 */
> +	struct vb2_v4l2_buffer vb2;
> +	struct isp4if_img_buf_info img_buf;
> +	struct list_head list;
> +};
> +
> +struct isp4vid_dev;
> +
> +struct isp4vid_ops {
> +	int (*send_buffer)(struct isp4vid_dev *vid,
> +			   struct isp4if_img_buf_info *img_buf);
> +};
> +
> +struct isp4vid_dev {
> +	struct video_device vdev;
> +	struct media_pad vdev_pad;
> +	struct v4l2_pix_format format;
> +
> +	/* mutex that protects vbq */
> +	struct mutex vbq_lock;
> +	struct vb2_queue vbq;
> +
> +	/* mutex that protects buf_list */
> +	struct mutex buf_list_lock;
> +	struct list_head buf_list;
> +
> +	u32 sequence;
> +	bool stream_started;
> +	struct task_struct *kthread;
> +
> +	struct media_pipeline pipe;
> +	struct device *dev;
> +	void *amdgpu_dev;
> +	struct v4l2_subdev *isp_sdev;
> +	struct v4l2_fract timeperframe;
> +
> +	/* Callback operations */
> +	const struct isp4vid_ops *ops;
> +};
> +
> +int isp4vid_dev_init(struct isp4vid_dev *isp_vdev,
> +		     struct v4l2_subdev *isp_sdev,
> +		     const struct isp4vid_ops *ops,
> +		     void *amdgpu_dev);
> +
> +void isp4vid_dev_deinit(struct isp4vid_dev *isp_vdev);
> +
> +s32 isp4vid_notify(void *cb_ctx, struct isp4vid_framedone_param *evt_param);
> +
> +void isp4vid_frmsize_range(struct v4l2_frmsize_discrete *min,
> +			   struct v4l2_frmsize_discrete *max);
> +
> +#endif


