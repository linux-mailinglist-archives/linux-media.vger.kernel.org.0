Return-Path: <linux-media+bounces-41496-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BD2B3F291
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 05:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 304A64846F2
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 03:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF132773F5;
	Tue,  2 Sep 2025 03:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KbhgoETM"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E9C19047F;
	Tue,  2 Sep 2025 03:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756782260; cv=fail; b=fNpMCCCmq0aRuhtW7XDZSVLNrk9uQDHsMJqkfqK4NZ0mHOUg646Pai8HVFWaDJjuOD4+zgMuFh1TmdlUnnYzN7GGvk4FgHwiD7R0/yUMPRy9ign8V7ltZEBtilDrJqPjQb12gNHZ3ZIPUbGTk84im9w7NcI8C+UHjN0b77418bY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756782260; c=relaxed/simple;
	bh=jNXDMDftlZXsdLBBRMuiUzm2qezhN+sxZm1N8YXHhfs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=m7djk8EfY0eWolDAi9lWFMxRPoimM4XGEv6UWd8R1TYhae2UQLKLLtGSCdKcLqiL/jHJjenf3GEY1ILYwbjESmdDxxTK/fbDtTq8cYh0wz2Nr5OHXJk1JO8oypF35MZdCAt1IeMrCQ22LLVXviH8PbnUe/6ou8mIncCsn/+L1+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KbhgoETM; arc=fail smtp.client-ip=40.107.237.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2eq2h/nzBWgvqkJ5QaBiQI0ap/rK5eDGY2fPfFTSDy5Mv9WFIOobMBG651WMvUjWsq8TPFnnUHwr22Xn3KR53dEvftLOsx+ohaePA7VuB/kZhkqbZ0JNtg3g10NnQdYBGVRK2q62+TGl6auvKl7uw0KG6L4n+iK0zwcsGZugRsqcx0OZWAEkD5SJkZZPweaToYp6FPeksu8v2sSsR7DM9GBAXSfm4Lbrf/ZyZh7pkAWCdpUIXTCz1AbFzy5IHqtbg70eIkT9oEyoKzTbONvotVju0VNqcXJ5lOVCpPoz6UsgsF/N1iXsxBq5PmWwgIArCB0Kjp48UfptnbH1cTOyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hiFhgRy/ES4gQPd2ykUYgC6GKAiBRW7+jURj8B7OFMY=;
 b=GphN0lC5hngoDY4JHHQK0lK0AM2nQa3F/l1dKFMlGkl0iwv+VuNZQXDjAWzxrI5K678fi97nds+hVVbye07yi0dUVyy3mygMJe/qERbMbDnCDbC4aNl3EndUOcvE0WCJFRzLgAy4E3PZWrDu1S2xsgz+0Hd5CvSMLobv8jFpecrLvaJKnhPSUAK9rzizseeAtYBpY7RlNyBAKnM8lz+Aq0d7fWUAzrIKvnGaxJNv/DU92jTYIIFoIu+hsCskg7lkc2LiqogBZJ1tqKOLqWcPoX5OISJE3BtA+MyCAUHZyartm5FagceOmjQEgaHO46jSXyaJVAIoBbDLwQ8lHQRTGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiFhgRy/ES4gQPd2ykUYgC6GKAiBRW7+jURj8B7OFMY=;
 b=KbhgoETMg+FixpTFibP/e3iwJ+26teH6N7TxWugcmkAXy5iQCMbcH1PruRqJSZHfBq6cSFd5Z6RxPm5XLSynywCKpoq+va9P0AwrrrmzNscVUWplO6ltT0aRxoXE2IFwWv7p97xEknFmRN3RIJfS+7f68wvRy/pFesb14BwI2Ik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by LV2PR12MB6015.namprd12.prod.outlook.com (2603:10b6:408:14f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Tue, 2 Sep
 2025 03:04:15 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 03:04:15 +0000
Message-ID: <30ccfa67-5f11-49ab-8f70-c7af72ee8b04@amd.com>
Date: Tue, 2 Sep 2025 11:04:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] Documentation: add documentation of AMD isp 4
 driver
To: Mario Limonciello <superm1@kernel.org>, mchehab@kernel.org,
 hverkuil@xs4all.nl, laurent.pinchart+renesas@ideasonboard.com,
 bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, sultan@kerneltoast.com
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 richard.gong@amd.com, anson.tsao@amd.com,
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
References: <20250828100811.95722-1-Bin.Du@amd.com>
 <20250828100811.95722-7-Bin.Du@amd.com>
 <906411e5-4354-4670-bd84-640a5b47a2bd@kernel.org>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <906411e5-4354-4670-bd84-640a5b47a2bd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:3:18::30) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|LV2PR12MB6015:EE_
X-MS-Office365-Filtering-Correlation-Id: 384d5cd1-37cb-454f-0d96-08dde9cd6601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WkZNUUl5K25PbHhvUzJabnF1TUFqRm1ya0RxWTZrd0hmMnB4N0RrY2Q5enR0?=
 =?utf-8?B?V0JWUk9YSHZoS09KWTF1Y05jcGNMWlZvVzRlY0pTNkRoRmk1dzRZNC9wQ0Ni?=
 =?utf-8?B?TzRwcy9VeHA0RkJ2T3FoeTV3RzFoeTBHUkhOb0dIUEVmNlNGRS90dzF0N2V1?=
 =?utf-8?B?dnBZODU1R0hrSml3UStHWkNPdEVuWmhhYzA5SzAydHFBUE92MU9yVlJrcFp5?=
 =?utf-8?B?eVhlZHNjemczUWw4WW9zd3QwTnd5dVFhQmlwTlVTSkFIMFd1UHkvZGp4VWx5?=
 =?utf-8?B?Wm5ubHVKbnN1ZXJSUktPOW01MWJGaFNFZ2R2WVprZVVsZlovL1dKaWl5eDEy?=
 =?utf-8?B?N0VOWVJrWlNFc1RFZ1ZSZGRZM2ZISnVrN0dEcTZ4eU1JVUJwdUtTVDU3eXBY?=
 =?utf-8?B?TGpqMFlGc1BUU20yZmFkdHZ6S2tzZVNRaUZpK294WlVoTzUzWkdmODZnajV6?=
 =?utf-8?B?c3QyZVhvU2xsTFArT28vbGhJUjg0WlRSSnpJUW05bnFOUFdjbStqQjU1S0p3?=
 =?utf-8?B?amlqcEoxeTBTUXFqY1lJRlVzSTlJbkV1QVFzSDc3YWFlQVgyZUxtbmMydVBu?=
 =?utf-8?B?Mm53ZkJYRGZUdUdIUXVucDNoRlFXVWJwMmxKNm9hNmdGeW1oakVHT3A0UjYy?=
 =?utf-8?B?alhxV3pDNTNMd2NON0xpUHdmY1V1NFVOL0lDNDRYS2ErbE03VWhkUlRyWHdi?=
 =?utf-8?B?V1pTbUZlYTVvNW5NVTNCVmhrVm0zdUd5OVFVWlFrVDRnOTZuTEVQQ1V0dTBL?=
 =?utf-8?B?U3pSRmlocWJxdGhCbGY0d2UvWkFQZ3d3OHFkb0FlVUVOUFdXbk9aQ0hjNG0z?=
 =?utf-8?B?ejJOMFN0M0pWanhURDdWcnBLYit5SURrbGQycm8vaDlLazMzSGR4VlNCQVdq?=
 =?utf-8?B?ZzVVbmFGU2NjUlNWMDNJYTJMeWNGTjFmb09iZXJ6TW0vSGZtOUMyLzBxZlFR?=
 =?utf-8?B?eEpkYTZpZkpLMkphckhKUTA1TkdDdFN3SzdhT0FMc2phRURXMFFOdkY1RzZB?=
 =?utf-8?B?QUQzTnRpUzNPTFJobUpmSExQbndVQ285UWNFcGRvc2RmcFhRMWk5U1lpR01y?=
 =?utf-8?B?VkFJbmt5MlJyOVpvSUlyUXhjRnBvbTZ4S0JzdUVxMEhKVERsdEJnU01RVEJ0?=
 =?utf-8?B?aVNqdllHRlltUldTTFZuUmRKSjl1bTZSWmRSekcwV2ZvZUZtM05xOXFrdCti?=
 =?utf-8?B?RVRjbVVMaWQ3VzdSTUo4VWVsK1J6V0E4eFovNW9PWDBoUjR1S3k3aFNnVlp4?=
 =?utf-8?B?ZCsrMmhSOU5TeXVSaEZhbWt2ZFRsNG10TTBjRU9JMm1jMStSRlBCYVM1ZlNC?=
 =?utf-8?B?dGN3anE5Sk5hNytFTU8wemZlTzVRSFlOdmNGdkhUQlFwQVc2am1aYXFTUDFw?=
 =?utf-8?B?VXNGMnhzYVgvTWUrN1FlQkdWTEFpNDVHSXcvMjVOdnZLbThudlZSMnZYa2FP?=
 =?utf-8?B?RE9VM3F3eTJGMFYrTlhqaU1qWmIyZFlCZUFtdU55N2JyMXZqSnhoZFJhU1Np?=
 =?utf-8?B?RkR6ak9WRlRlYkhCNC9OSW9BZS9ZQ25ESWRsM1FoN3NKME54d2s3emtwTDBq?=
 =?utf-8?B?Yms3YnB5OVo4R0VjczdJNlZRWXliRFJxdnpmTGFxbzN0WnU5WGdQS0F3YW9L?=
 =?utf-8?B?VGd4ckxTWWNVSG8vVzQxRytpUFZVYnpYWlVPTTUxMUJrZ1JjZWVrZ3BHTWNE?=
 =?utf-8?B?Um1nMGg1bHl4NjdUcm4ybU1xMExvNHRyVSt0UFZKMUhyQldMTUpDWjRhVWlh?=
 =?utf-8?B?TmFxekhCdm1HTURmcjNMczFUUGRVclFzbUZ5YW1HRFoydkJvb1BjMUw3ZTRq?=
 =?utf-8?B?ekxYOFAyamhrZHd0VnJ1Q1czWmVjaWt6NVF4MXZ4Qms1enRJbzV5dUtiaSsr?=
 =?utf-8?B?Y3ovVEl6elNvWG51VWFQUVVKeFRyQUFKampjL2VwWmU4WWRESnNQM1Z4OW5Q?=
 =?utf-8?B?ckVPNElvbUE2eXZadlFLeEJ6RlFxQmdla2p2bk0yMWpnK0x1ZndPTFk5N3Bm?=
 =?utf-8?B?anZLSlAveG5RPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXdIUFVwUGlNODZDbnk2L1lySzVNeFcvQmg5bUl3UVNBaDJVc1JHMkhzUzhV?=
 =?utf-8?B?dlg4ZjZLR241QVkrSmJ0ZVI1R1VuN2srQ3lYRU5vQm5xbGVRMHBCOHdBcW1v?=
 =?utf-8?B?ZlhEZmpQNkw5NlMyQnE1MllwOU1VUHlBdmZodE5PQ0JQRXZZZkg1WS90MGRR?=
 =?utf-8?B?VFJ1L3NpOFhZL29IcWxEcjlOaGwvZHhEd0hCemFhM090clM4c1dmT0VPOWF4?=
 =?utf-8?B?eDFmdHlXQTdoQTZJaUNTN3VFTXZOUHlXOG9Ud2Z6RUdiWnVoQjhJKzUwWXgz?=
 =?utf-8?B?RW1TSlpla05SL3B2UGxoVlNkb3FyclE5RzlCQk4yZWJwQzRpaXdHQnB2c3Ny?=
 =?utf-8?B?K29CSzZUalpzam1rejc1UEY3TE1yY3dSZHRmNFlNQndsbFNqK1BVdU03N3k5?=
 =?utf-8?B?SjNDdXg2NzB6NW9LVWZ2cGNnZGtOcXBoNnFCTlpueGFDNUJURVJQVGFXNDBW?=
 =?utf-8?B?a0UwbkdWZmxNMU5aYzBiRDIwekRCdzJzNGhjalFlenM4NXg0UUw2RmRqTXZu?=
 =?utf-8?B?bFJNeFROMXhaZ1BMVlBUVEQyV1pnR0Q1SDA1NlJ2NzNubU9ydW0yblVjQ2NU?=
 =?utf-8?B?MGh0VjdVajRYOEYzOGFVQUxWcXY5YnJKRkpmQlVyTFJ2ZnhuZ1NJN05ZbktO?=
 =?utf-8?B?T2p4bklFQmU2eFVKeVBIMW9rVVZhbWp4YU1qZlpZTHdQWXBrL2RXWExyNWwx?=
 =?utf-8?B?bnduWWxxSnVuNzllTUY3UVFOMElsS21kMERLTVdWbUFwQW1wNjBDK2dUVnRC?=
 =?utf-8?B?OEJ6WjNtczVxc0kxZjNXUm9hVmp1bWRNWEY0RG1kM0xYcldURWVEVzBTenlO?=
 =?utf-8?B?aW9sK3ZaKzg4WDc5Ty83RS9NQUd1czhjbG5KL1NGeUJCTGdSbS9VbFlZbnEw?=
 =?utf-8?B?Q1Z0aGhlcWpHb2txbDVTR2V0QUV5Z0MrbGdkL2ZZdW42T2M0dVVJNFFnOEsw?=
 =?utf-8?B?aHNXcnJsWExxNWtCTVJvcXlwQzlIR2VIZDU0MjFyZ3dMczJFNDhCYWV5QlY0?=
 =?utf-8?B?d0JQT3pObzZEQUdvU2hiSmZTaFI0aHozQmVrQ2NqRXpKVEcvdFZLQUVVZTFC?=
 =?utf-8?B?NHFSTTBLdEhEbkNmTFh4NWpjeDBKUWRvYkczeVh1Uk5oRmtlWFlKQld1d05l?=
 =?utf-8?B?NGh1KzI4b3VOeHR2K2YrSkdxY1hNVDBzYUJJZ2hIR2FQbzZhVExOblhzVnJv?=
 =?utf-8?B?a3dydUZUbStlaG9qT05MMlkyNUZpS2hzMldCa3R5OFRmMDUyNUEyS3kzbzh5?=
 =?utf-8?B?OVkwY2RKcjhGKzlENG5EV3lRbm96ZkJoR0x5VWpLVEdMY2xwcG1lWjRxTkwz?=
 =?utf-8?B?UHZlMlNYdVB2SFg0S3ZETlZkaHJMK2tld1hvTENWUEFtL1o1OHA0a0FVTlJ1?=
 =?utf-8?B?RlFZTFRxS0NjUjNBcG94TWhTTHN2TFIrZVZBd2NhNzcxdGVtN3h4Y1dqSGdx?=
 =?utf-8?B?Rnp6aURCc2gvTVJ0OVcrcW9XRUNpZ25MR3NPMTZnN1dJRkFuNGhPcmQ2NGU4?=
 =?utf-8?B?TE1HVExoNzNaTWpQeC9QMnUzYklKcUxabkhOSlRsVkVJRHlvZDZ1a0dvVlNv?=
 =?utf-8?B?QlgvL1ZCNERManVEaVJQOUF2Y1RnTU4vc1JPc1lvZHVkcnd6MlNhdk5Mb1ZW?=
 =?utf-8?B?WUN0N2Ivbnd1TVJqNnNaaC9pYkVGU1VGNUM3NWZscWxwWTUwRWdBdk9RMWxS?=
 =?utf-8?B?amlXM2pMUHFhNnNWYlB4UnVMaDJab1ZNYldZSGRURzhCQXZ3NjREdUcyMmJ6?=
 =?utf-8?B?UHVIdWlndTh0YjUyNDV5WkJ0eE1nbU45ajl4K3FDQytpWWhvUldFTU5rSzdF?=
 =?utf-8?B?K2NGeENNVVNlYkRmbGFGWDV0MjdUaWlnbGZJT3BBdGRYUXl1SFhHQVRQRlk3?=
 =?utf-8?B?QnZ1amNYdjJrOHhVZlVFR0FSWVNlczBCV0U4d3dhWHdZaXJMNlhZd3kwcDlw?=
 =?utf-8?B?T2tFTS9SZUpqNG1veS9icnFYS3d0ODM0TXFLRUM5Q1lwZFFGMkVTamdualVO?=
 =?utf-8?B?UVFnemR5SVQ5ZDBGOU1xVklMcHQ0YzZiUUdTS0Y5d2xka3F0ckJCbGtKZCtN?=
 =?utf-8?B?amRhekFBZU9EN1g5S3BxeThSK2k0TmkzS2tWWkpDcnZrTENTaFhzMnhsbCsy?=
 =?utf-8?Q?lmtM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 384d5cd1-37cb-454f-0d96-08dde9cd6601
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 03:04:14.9598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SCk9IQ+zGfZuApWcS0/nxQYdGxdwLTQHyxjKLZs6gkTkJ9wEpWRAir5dkZUUfWeu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6015

Thanks Mario.

On 8/29/2025 12:50 AM, Mario Limonciello wrote:
> Just two small nits to me.
> 
> On 8/28/25 5:08 AM, Du, Bin wrote:
>> Add documentation for AMD isp 4 and describe the main components
> 
> Probably should be "ISP"
> 

Sure, will update

>>
>> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>> Signed-off-by: Bin Du <Bin.Du@amd.com>
> 
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> 

Many thanks for the review.

>> ---
>>   Documentation/admin-guide/media/amdisp4-1.rst | 66 +++++++++++++++++++
>>   Documentation/admin-guide/media/amdisp4.dot   |  8 +++
>>   .../admin-guide/media/v4l-drivers.rst         |  1 +
>>   MAINTAINERS                                   |  2 +
>>   4 files changed, 77 insertions(+)
>>   create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
>>   create mode 100644 Documentation/admin-guide/media/amdisp4.dot
>>
>> diff --git a/Documentation/admin-guide/media/amdisp4-1.rst b/ 
>> Documentation/admin-guide/media/amdisp4-1.rst
>> new file mode 100644
>> index 000000000000..a5ed78912d0f
>> --- /dev/null
>> +++ b/Documentation/admin-guide/media/amdisp4-1.rst
>> @@ -0,0 +1,66 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +.. include:: <isonum.txt>
>> +
>> +====================================
>> +AMD Image Signal Processor (amdisp4)
>> +====================================
>> +
>> +Introduction
>> +============
>> +
>> +This file documents the driver for the AMD ISP4 that is part of
>> +AMD Ryzen AI Max 385 SoC.
> 
> It's in 390 too isn't it?
> 
> Maybe it's better to say:
> Ryzen AI Max 300 Series
> 
> That's what https://www.amd.com/en/products/processors/laptop/ryzen/ 
> ai-300-series/amd-ryzen-ai-max-plus-395.html uses after all.
> 

Yes, it's better, will update

>> +
>> +The driver is located under drivers/media/platform/amd/isp4 and uses
>> +the Media-Controller API.
>> +
>> +Topology
>> +========
>> +
>> +.. _amdisp4_topology_graph:
>> +
>> +.. kernel-figure:: amdisp4.dot
>> +     :alt:   Diagram of the media pipeline topology
>> +     :align: center
>> +
>> +
>> +
>> +The driver has 1 sub-device:
>> +
>> +- isp: used to resize and process bayer raw frames in to yuv.
>> +
>> +The driver has 1 video device:
>> +
>> +- capture video device: capture device for retrieving images.
>> +
>> +
>> +  - ISP4 Image Signal Processing Subdevice Node
>> +
>> +-----------------------------------------------
>> +
>> +The isp4 is represented as a single V4L2 subdev, the sub-device does not
>> +provide interface to the user space. The sub-device is connected to 
>> one video node
>> +(isp4_capture) with immutable active link. The isp entity is connected
>> +to sensor pad 0 and receives the frames using CSI-2 protocol. The 
>> sub-device is
>> +also responsible to configure CSI2-2 receiver.
>> +The sub-device processes bayer raw data from the connected sensor and 
>> output
>> +them to different YUV formats. The isp also has scaling capabilities.
>> +
>> +  - isp4_capture - Frames Capture Video Node
>> +
>> +--------------------------------------------
>> +
>> +Isp4_capture is a capture device to capture frames to memory.
>> +This entity is the DMA engine that write the frames to memory.
>> +The entity is connected to isp4 sub-device.
>> +
>> +Capturing Video Frames Example
>> +==============================
>> +
>> +.. code-block:: bash
>> +
>> +         # set the links
>> +
>> +         # start streaming:
>> +         v4l2-ctl "-d" "/dev/video0" "--set-fmt- 
>> video=width=1920,height=1080,pixelformat=NV12" "--stream-mmap" "-- 
>> stream-count=10"
>> diff --git a/Documentation/admin-guide/media/amdisp4.dot b/ 
>> Documentation/admin-guide/media/amdisp4.dot
>> new file mode 100644
>> index 000000000000..a4c2f0cceb30
>> --- /dev/null
>> +++ b/Documentation/admin-guide/media/amdisp4.dot
>> @@ -0,0 +1,8 @@
>> +digraph board {
>> +    rankdir=TB
>> +    n00000001 [label="{{<port0> 0} | amd isp4\n | {<port1> 1}}", 
>> shape=Mrecord, style=filled, fillcolor=green]
>> +    n00000001:port1 -> n00000004 [style=bold]
>> +    n00000004 [label="Preview\n/dev/video0", shape=box, style=filled, 
>> fillcolor=yellow]
>> +    n0000000a [label="{{} | ov05c10 22-0010\n/dev/v4l-subdev0 | 
>> {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>> +    n0000000a:port0 -> n00000001:port0 [style=bold]
>> +}
>> diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/ 
>> Documentation/admin-guide/media/v4l-drivers.rst
>> index 3bac5165b134..6027416e5373 100644
>> --- a/Documentation/admin-guide/media/v4l-drivers.rst
>> +++ b/Documentation/admin-guide/media/v4l-drivers.rst
>> @@ -9,6 +9,7 @@ Video4Linux (V4L) driver-specific documentation
>>   .. toctree::
>>       :maxdepth: 2
>> +    amdisp4-1
>>       bttv
>>       c3-isp
>>       cafe_ccic
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 7724620896e7..72ef7c77d881 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1139,6 +1139,8 @@ M:    Nirujogi Pratap <pratap.nirujogi@amd.com>
>>   L:    linux-media@vger.kernel.org
>>   S:    Maintained
>>   T:    git git://linuxtv.org/media.git
>> +F:    Documentation/admin-guide/media/amdisp4-1.rst
>> +F:    Documentation/admin-guide/media/amdisp4.dot
>>   F:    drivers/media/platform/amd/Kconfig
>>   F:    drivers/media/platform/amd/Makefile
>>   F:    drivers/media/platform/amd/isp4/Kconfig
> 

-- 
Regards,
Bin


