Return-Path: <linux-media+bounces-35333-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63328AE0668
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 15:01:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F01B31685BB
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 13:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0EAC155CB3;
	Thu, 19 Jun 2025 13:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UpcFu04Q"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9EE2110;
	Thu, 19 Jun 2025 13:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750338054; cv=fail; b=kLg/RXEyCW4j5odbl1z5qrnQ7ugTTcPwH+Kg/zAQa+VDa94EIoNHBzN9O1BEtYJ/YoD/ywFGI1dnYwTWWpXoccFaXUzk/eYQtSw0K7zmafq7QRi+RJAfdchXGLEabxOlhgQbDLoY+2/eXwNFW4QYR5lk17GbzOO1blwblNmjfzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750338054; c=relaxed/simple;
	bh=kaifK3L0TpyIj/27kzljSRCjAjOrdUKwMU9MhffqDKA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AtAv8Y6o1W1o2EaIfbl/WzS1GdSmlc6UNX27Mq7zF9CeyfjpFFNXsMYaGffOipdqi9kVTUSIk7ibwR1W1Ng0AvozwkHRm0aT28ZuWsuBZ49NFCyYRireC8Im/lzSbietFQ28rQ8ZXY3JtRHAq8mVZBgrlxvI0s3zOXaXSlAjyZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UpcFu04Q; arc=fail smtp.client-ip=40.107.244.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LaBAldTlm5J/s6Slmb1HJaxdhXMXtV25mz5usUefiPwLORIxSoRqtnTT/sykdweri2Nsr15wz7bm7jphspLN2E4ZZ1i/9vaNQihsiivVKx1GB5tQUgyZa/6SCeTHUqZOrNjIKrXRQIkWjdFGckrR00XYEQepMoaktMmkt3AK7P4rVb9X4J4MICydT8vOZswG7Q+Mo09GystHJ/qZasLMXjg0/LJMs+BYgmYDGLeWSc1qWKqxSufVkwNXqNiVKphfuZaHxyOqc5s7IAKV/vC1DRDiptLjGCuBxqsJdeqb3m1ujehZIvJiSHBWrBdygjrqCU2Ha5YGmzjKuAZ41zY1CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnNrkhLIrh/PnlsTy5PQX8eA75QOW0OKIUoqhyzumcA=;
 b=NWsff2gtHRO0CHLXQ/mQEhyJA49aUyjVGSjPeSsua4/ccpTgSyT/ri7CBV6TeoN/SJU6XHi7EUa0et0hZis5Z9Xezrqru1YLyT+uVkGVIywX8YD0rYwiQ5z/eBq8n0uWCVyvPkQJmqiwXWjxweFtoSXkoIMpFGCeUnVUy7lKMHseodVFxbmkpCF9PNCaNz9ohHmS9otfqgxzQxXS4F+NYMZOYtpdYVFRyur/mVuQJ0FVrGbORGNYb3uvfw9272TFv1qzsojXsQppP8agHFTtRcbK5ZfXmXcjmK7tIZDubDV8Ai/CE3x1xuVnIC6R4T05HrZu+1868qSJ5c16Ls3+Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnNrkhLIrh/PnlsTy5PQX8eA75QOW0OKIUoqhyzumcA=;
 b=UpcFu04Q5zXFVEEcAFAwLC9nCraA2fPkOKd8W/aJJ5tEZ+xFBzqkKkSr6xoLTXFXepHhA/2UZu8/SG8pBF26pMs2YKeCDdJ8r/kE3HhFAb35d7zX0tH4uCSGcxrXpRo+Dowcz8Lr8MNMO/0h2xjVJ7oy4Vmxs4UyV3OWB37HFHo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA0PR12MB8087.namprd12.prod.outlook.com (2603:10b6:208:401::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Thu, 19 Jun
 2025 13:00:46 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 13:00:46 +0000
Message-ID: <067d67e1-9a7a-4a98-8fc5-771664055ef3@amd.com>
Date: Thu, 19 Jun 2025 08:00:44 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] media: platform: amd: Introduce amd isp4 capture
 driver
To: "Du, Bin" <bin.du@amd.com>, mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 Svetoslav.Stoilov@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-2-Bin.Du@amd.com>
 <0c4240bd-4918-48b3-aa8c-3860fa62db00@amd.com>
 <68f481ff-3b99-4c21-964d-edb81b34452e@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <68f481ff-3b99-4c21-964d-edb81b34452e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0151.namprd04.prod.outlook.com
 (2603:10b6:806:125::6) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA0PR12MB8087:EE_
X-MS-Office365-Filtering-Correlation-Id: 361575e8-7ecc-47dc-a6e6-08ddaf314e45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dVpraXl0S1RGbVdocWF6YXFsSjh0ZmxqQUo2czVuL21NdHFvUXhrMENXTW9j?=
 =?utf-8?B?amt2RThqM0FBaW0wMGY4YjdQRHU4UlFSMk1taE1GcG5mWkczK0VJb0p1ZXdq?=
 =?utf-8?B?ajFYdjR4anZYd25IZ1lta250UWE2WWZuYkREWkMxVFhvZ1A0QlJlWURVaEFW?=
 =?utf-8?B?YTZzL1NyYmtETTJ0OGpXL2dYTHk1eENvK2hqQ3B2LzNMbHZNa0JhVytUOXRa?=
 =?utf-8?B?Q1AxekZZbjIyanljcjgrZnJTakIrNURqaDd2Z1ZOMjloYVpRT3NiOWU1VDht?=
 =?utf-8?B?bCtXU3gvd3FwZkhmd2Z6TXNqcTMwdnc0ZWQzbmNOUGRaVzVodGwyRmpzc21U?=
 =?utf-8?B?REdDa0Z4cFJBbUREQzhEa3NvUWZMU1JKUTMvZkVZcWFqbDBTZVVTUHZQY1hw?=
 =?utf-8?B?b0NqaHBmaVJiZmNWZEdha0xodFozMDFaampaR2xzdDNhZnlSaGRYVXpna3pk?=
 =?utf-8?B?NEJBekVvSnVRdXJsNTZWYi9IQ0lUTG5nNXFaa2w1NytCWWF2dDc5SEl2T0gz?=
 =?utf-8?B?SlJrTy9ZelFPSlR6ZlpGdExwQmlvNkRhN1QzcHg2MlAwNEdVVDlQMk4vcWVO?=
 =?utf-8?B?TkhjRW1HcGhiNEZGMVpYQndzcWoxRjljRjJyUk5rT3VRa0lzMHFZb3pFQ04z?=
 =?utf-8?B?aktZSmlUeG1YamdIQ0xHTVhFTXE2bXdDS1BiVVA0OGEyWG1IcDllN1hhZDlW?=
 =?utf-8?B?cW1qcHpvZGVZa0RsVmdKV1c3N013QkFTZm92bmJ6RWtiTW0zUXpTM2RNOThB?=
 =?utf-8?B?SWVQYXJ6SERCVHhiclVUKzlwN1NYYlpzZ0toQ1NOZlFySWN6VmRnM2VFSk1P?=
 =?utf-8?B?MlBWTlZWWWk3dlBBLzM1SDl5ME5pcUUvV2R3ZFIrWXJ5cmJNZHUxSm5tUnZp?=
 =?utf-8?B?VlFrTldOb0ZWZTZ6bTk3alRWUnc5Nm12M3lJSmdpb2k0QnQ5b2VKT2lRMzJU?=
 =?utf-8?B?Y1hoTTR3OUZ3ZnZLSzRTczFUQVREMERkU29Mc2NpMTdDcVEwZS84TWhtTHda?=
 =?utf-8?B?bzBKZmduT2RvalJSZEo2NzVNRzNXcXpiTmc2VWZFeEYvKzVYK2p3L1BpZy8z?=
 =?utf-8?B?QWZpQlZ2MHE4cVAybDgwcjIwWGhTUUM4RE4rbDNkMUlCLzgraS9lUmF5bkhU?=
 =?utf-8?B?M0g2Z08yWCs3NWo0NEFhTVdMbVk3VGlMeUVlMVc5UFN6dTB6ZEd4c0NWRHRI?=
 =?utf-8?B?U21VTDVTVUpnc1pLQ092VVg3ZWUvSHEyc0hCYmpPOUJva2Z4ZG80MGYwcmo2?=
 =?utf-8?B?N2ZxWU5VOU5TZ1NRbklPYjl4UFM3VUZpcWMzSzk4enJuWDNNNzBhL1I0Z1Zn?=
 =?utf-8?B?M1Q3TkNla2RhMHhSckxPREI5SWlCTzhUdkdZOEhwUnFOWXVkMHNoaVdNb0tD?=
 =?utf-8?B?QmhJYzhMZ1BEUTVLN21UTjBxSWpvYzdGM3EzN0pUNGswSk9ZaHlkdVFTSmV3?=
 =?utf-8?B?amNQRkV3UERmd1VUMGUvRlNUU294Znk0V2tKeGNPRHA1NGIrd2RBYUEvVHhB?=
 =?utf-8?B?QmlNTzV5bjNrN3hZc25XdGRYUnB5dTRjSHF5TzB6YWV0b0JmWkNYZ3RoZ2w3?=
 =?utf-8?B?UkRTQjJLVHMxQlF1V0dTOWlseEVuTFBaMi90Um0xUGc4MkFZRjRHeWVjVThK?=
 =?utf-8?B?cGxuTCsrKzVZenNJdVFFN0RHdjNmTjRGbmZhdGl4cVNSOUpVcVdFYUo3OVBB?=
 =?utf-8?B?R2dpc1hrbXkyNzAvRXBvUXo5MjhFVEROWlYxTG82QmZZNTQ4SldCZXR4a2No?=
 =?utf-8?B?clI0bkZkUDJBRkhNenpzeXVaSm5oOEN6YjRQNlBGM3lpRUJ2Qjl6a1ZIUG4r?=
 =?utf-8?B?cldjVnFoSnRNRmRaZkFFQ3hMWU1NbnZTVU9vMys3aXhxU2dpZk5Wd2k5Q0hr?=
 =?utf-8?B?eGtGTStOUWdZYmRtRWgzNWdKdVAxNmZhMG93Y0xkZzdUUnplTGNxSmt3Umpr?=
 =?utf-8?B?MlYySXRySGhrRlBqRzlCYVFGV0JCYW1mQ0MxWnVSajlUYzZoUnJqaTZmWEtW?=
 =?utf-8?B?TFZYY01GZlJRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bE9lS3lOSGJYMGVoaXBhbktiVDYvb1h0THlpemdybVJaRGE1V1pBMVRlK3Zz?=
 =?utf-8?B?WEVmZ3VwTmRScGdsSlR3M3czK3U1dWVTRG82TVkxOTlQeDRSMWdWdG1tUFhr?=
 =?utf-8?B?VDhFRlFvZGNwTmZMeTljV2QzTVR5cDB5NmtFV0VxYmdXYWZWeDBKL2kzeXNB?=
 =?utf-8?B?ZFBWS1BwcEFXR3NXSC9RWlNFaG56Z1BkNmVIeXNUY2trTGJON2R2em5aZlJq?=
 =?utf-8?B?OXJ2RW5FT2NNaEdNSHFNS1QzejJkSjkrK3lSQzZwdXlwVUx0cHVZbk13ZHBC?=
 =?utf-8?B?aUVET2grUmNjbW5mdVdUVnI0Z24vSTFQZEYwQjRQVzR6eW4wUDlEdExvQ3Uz?=
 =?utf-8?B?RlR0ejgyc1J2SjFNT2c4SzRMTnp6dGtTUDZZRW9mSWVIUy9OQit0cVl1SlZo?=
 =?utf-8?B?WGtrL1B6WVQ0bGtJb3VxbEVwKzBKV1F4eVpjMVJDdjVKWWVHaGNheW9tNzRP?=
 =?utf-8?B?L0FYa1M0UzRTc09HZVp1WHYrc0NOVTcycmcrazRsOEQzRmY1bVVyNTZKNTFY?=
 =?utf-8?B?OENMN0x6UUdlbStDa1l1RDlwTDg1NVNIQ2JBMVRFeTRFZ1lxMm1EMjRqZDh2?=
 =?utf-8?B?RlpjU3h1TVlzNVRaZ0NiTjUxSzdLeXhBZnJ1NXBrbHhoSmtFUzhmenB5Ykxl?=
 =?utf-8?B?TXkrOHdNRWJraGNFNlR2TG1USDdySWRtMS9NRHNOanVlVFZzOHJUd3hpM0Yw?=
 =?utf-8?B?dFBZY2RYemZ1MytaT0c5RkF3M1pUKzNwckF3aDMvRXFTdkRtM1dUUllENjZp?=
 =?utf-8?B?akhTd2RkUEtLRFJ4UUZIYVQwY3R2ellxSHJFd0RSdVBRdTlYbnZXVHNuVWhI?=
 =?utf-8?B?bC9DbnMra0ZVMitod2xDNHFNbHVzYzY4UEpjbTZxSHZGaFdOSmNacWhaQ1BS?=
 =?utf-8?B?cmlZOGkySjFnWEdLejRpQUdPZXNIZGRiNEdCVjNDRUZ2dURTNktUT0k2Mkl2?=
 =?utf-8?B?Ly9pWVdPS1hYWVlZcUgyMU1oTGZoQWtQcHQ1NC9NRnBaa3FpY2lmUG5VaG5Y?=
 =?utf-8?B?bXFFZExLTENjaTl6ZDR2WHhPYlhURVVlTTJhaC9oVnFpYUo4OXd1SHVTdG83?=
 =?utf-8?B?MDF5Ym1jMzFOeEpQdi9jWW5CSTBuejRRQ2o2N3o4SHE5Z25RS3JMa2IwM1Ft?=
 =?utf-8?B?N3JteHZkUkk5Nm5ZVnVwRUoxWTlwNlozMkdtMWdNR3EzSk5UYmpNUThGLzJF?=
 =?utf-8?B?dDZxaGtEeFZxUHNFZi9NaHIrRGRlZE5ZT0N2TkJIbTBTWE1ZYVVJVGpvTitJ?=
 =?utf-8?B?Q2M3djBMczBBMzBEYVpOUklFSEZmNEtXWTVaRHJkV3pKVCs4ay9nbUZZNVRG?=
 =?utf-8?B?cE5aYk03RDg1L3FsckNGdmJXb05GTTI1T0NwUWQ4MUJ0QlhEcHhFMUFJMHAv?=
 =?utf-8?B?Rm9keGZNa2ZoZjVXVS9EZ2t0QTI1K1hSaWtnbVRyeGV0ZVNIY2xGckRwcWUx?=
 =?utf-8?B?NFNhL08venpDY0RUWnNJcXBkaHM5ejBVM29pOVEwa0NLVzBNWENnNGpMRHcw?=
 =?utf-8?B?V0w4d1JBbnlFTTJ6eXZTdkFaZGRMNTR0bEtqV1JqK3F2eisvbG9aMStRRHh4?=
 =?utf-8?B?UzA1TzNPbUV2ck5abnFKcWpMdmJtN2tmSERqT01HZ3duVzlWK3pjZFJmcGVS?=
 =?utf-8?B?RDU4YitLRGlMaGpReEw5SE41ZmRDb3padDZFSTN2dUFKR2phSlhSZkZXa2FN?=
 =?utf-8?B?ck5COG8xdUxwcGhDWkQ3eUFFcmVkN1g2NzR0N1ljQ0Z5TVE0OHhocUdOd2NK?=
 =?utf-8?B?bXBFKzVnbzlJdTdIYWZ4M0FhbTlEZzlTa25ady9nVWJMQUdJajR1TnJ3MEhF?=
 =?utf-8?B?eG0vdktWUnZGWjlwcTRQSjQ4ZjcrVGI3QUVnZW9nYVBMalFtLzdYV1JTWndi?=
 =?utf-8?B?TDYxYlhIMFpob2NXNStGMDJwSFFlZ3FVNXZjRkgwR05mdkZuRDRwVUcxa1Nw?=
 =?utf-8?B?aTNkYWhiZGswaVIvajQzY3dBMVZMR0hEU1hVaUZLWWQ4UUR2NmhmSi84V200?=
 =?utf-8?B?aDRGSlNBS094dmxYYjViMlVhVjdOK3g0RU1NTHlWWFJjVFAxUkFscy9ybGY5?=
 =?utf-8?B?UStPd3JPenNWYUJqOWFpQXZqK3M4cGFBcFdWTmRLNmd3WHRUVXd4WStwSWEx?=
 =?utf-8?Q?R1QZ13A0LmiilO18pEFQQNikX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 361575e8-7ecc-47dc-a6e6-08ddaf314e45
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:00:46.1626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xe+jTq44vpDwP4OY8FsHOAh9SP6MMAmibQVE9E8mH34m+WIuImMvm7bmeUuiSU4rDLGNP+SUPRhvVg+QpXqf7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8087

On 6/19/2025 2:46 AM, Du, Bin wrote:
> Many thx Mario for your comments, really helpful, will address all of 
> them in the next patch.
> Add inline for some of your comments, pls check
> 
> On 6/18/2025 11:58 PM, Mario Limonciello wrote:
>> On 6/18/2025 4:19 AM, Bin Du wrote:
>>> Amd isp4 capture is a v4l2 media device which implements media 
>>> controller
>>
>> AMD
>>
>>> interface.
>>> It has one sub-device (amd ISP4 sub-device) endpoint which can be 
>>> connected
>>
>> AMD
>>
>>> to a remote CSI2 TX endpoint. It supports only one physical interface 
>>> for
>>> now.
>>> Also add ISP4 driver related entry info into the MAINAINERS file
>>
>> MAINTAINERS
>>
>>>
>>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>>
>> Who actually developed?  If both are developers there should be a Co- 
>> developed-by tag.
>>
>>> ---
>>>   MAINTAINERS                              |  10 ++
>>>   drivers/media/platform/Kconfig           |   1 +
>>>   drivers/media/platform/Makefile          |   1 +
>>>   drivers/media/platform/amd/Kconfig       |  17 +++
>>>   drivers/media/platform/amd/Makefile      |   5 +
>>>   drivers/media/platform/amd/isp4/Makefile |  21 ++++
>>>   drivers/media/platform/amd/isp4/isp4.c   | 139 +++++++++++++++++++++++
>>>   drivers/media/platform/amd/isp4/isp4.h   |  35 ++++++
>>>   8 files changed, 229 insertions(+)
>>>   create mode 100644 drivers/media/platform/amd/Kconfig
>>>   create mode 100644 drivers/media/platform/amd/Makefile
>>>   create mode 100644 drivers/media/platform/amd/isp4/Makefile
>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4.c
>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4.h
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 10893c91b1c1..15070afb14b5 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1107,6 +1107,16 @@ T:    git git://git.kernel.org/pub/scm/linux/ 
>>> kernel/git/iommu/linux.git
>>>   F:    drivers/iommu/amd/
>>>   F:    include/linux/amd-iommu.h
>>> +AMD ISP4 DRIVER
>>> +M:    Bin Du <bin.du@amd.com>
>>> +M:    Nirujogi Pratap <pratap.nirujogi@amd.com>
>>> +L:    linux-media@vger.kernel.org
>>> +S:    Maintained
>>> +T:    git git://linuxtv.org/media.git
>>> +F:    drivers/media/platform/amd/Kconfig
>>> +F:    drivers/media/platform/amd/Makefile
>>> +F:    drivers/media/platform/amd/isp4/*
>>> +
>>>   AMD KFD
>>>   M:    Felix Kuehling <Felix.Kuehling@amd.com>
>>>   L:    amd-gfx@lists.freedesktop.org
>>> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/ 
>>> Kconfig
>>> index 85d2627776b6..d525c2262a7d 100644
>>> --- a/drivers/media/platform/Kconfig
>>> +++ b/drivers/media/platform/Kconfig
>>> @@ -89,5 +89,6 @@ source "drivers/media/platform/ti/Kconfig"
>>>   source "drivers/media/platform/verisilicon/Kconfig"
>>>   source "drivers/media/platform/via/Kconfig"
>>>   source "drivers/media/platform/xilinx/Kconfig"
>>> +source "drivers/media/platform/amd/Kconfig"
>>>   endif # MEDIA_PLATFORM_DRIVERS
>>> diff --git a/drivers/media/platform/Makefile b/drivers/media/ 
>>> platform/ Makefile
>>> index ace4e34483dd..9f3d1693868d 100644
>>> --- a/drivers/media/platform/Makefile
>>> +++ b/drivers/media/platform/Makefile
>>> @@ -32,6 +32,7 @@ obj-y += ti/
>>>   obj-y += verisilicon/
>>>   obj-y += via/
>>>   obj-y += xilinx/
>>> +obj-y += amd/
>>
>> Is this whole file alphabetical?  If so this is the wrong place.
>>
>>>   # Please place here only ancillary drivers that aren't SoC-specific
>>>   # Please keep it alphabetically sorted by Kconfig name
>>> diff --git a/drivers/media/platform/amd/Kconfig b/drivers/media/ 
>>> platform/amd/Kconfig
>>> new file mode 100644
>>> index 000000000000..3b1dba0400a0
>>> --- /dev/null
>>> +++ b/drivers/media/platform/amd/Kconfig
>>> @@ -0,0 +1,17 @@
>>> +# SPDX-License-Identifier: MIT
>>> +
>>> +config AMD_ISP4
>>> +    tristate "AMD ISP4 and camera driver"
>>> +    default y
>>
>> I don't believe this should default 'y'.  Normally drivers need to be 
>> opt in.
>>
>>> +    depends on VIDEO_DEV && VIDEO_V4L2_SUBDEV_API
>>> +    select VIDEOBUF2_CORE
>>> +    select VIDEOBUF2_V4L2
>>> +    select VIDEOBUF2_MEMOPS
>>> +    select VIDEOBUF2_VMALLOC
>>> +    select VIDEOBUF2_DMA_CONTIG
>>> +    select VIDEOBUF2_DMA_SG
>>> +    help
>>> +      This is support for AMD ISP4 and camera subsystem driver.
>>> +      Say Y here to enable the ISP4 and camera device for video 
>>> capture.
>>> +      To compile this driver as a module, choose M here. The module 
>>> will
>>> +      be called amd_capture.
>>> diff --git a/drivers/media/platform/amd/Makefile b/drivers/media/ 
>>> platform/amd/Makefile
>>> new file mode 100644
>>> index 000000000000..76146efcd2bf
>>> --- /dev/null
>>> +++ b/drivers/media/platform/amd/Makefile
>>> @@ -0,0 +1,5 @@
>>> +# Copyright 2024 Advanced Micro Devices, Inc.
>>
>> 2025
>>
>>> +# add isp block
>>> +ifneq ($(CONFIG_AMD_ISP4),)
>>> +obj-y += isp4/
>>> +endif
>>> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/ 
>>> media/ platform/amd/isp4/Makefile
>>> new file mode 100644
>>> index 000000000000..e9e84160517d
>>> --- /dev/null
>>> +++ b/drivers/media/platform/amd/isp4/Makefile
>>> @@ -0,0 +1,21 @@
>>> +# SPDX-License-Identifier: GPL-2.0+
>>> +#
>>> +# Copyright (C) 2025 Advanced Micro Devices, Inc.
>>> +
>>> +obj-$(CONFIG_AMD_ISP4) += amd_capture.o
>>
>> As the directory is already conditional on CONFIG_AMD_ISP4 is this 
>> obj- $() needed?  Or should it really be obj-y?
>>
> Yes, it is needed, because AMD_ISP4 is trisate in Kconfig, it can be y or m

Got it, thanks for clarification.

> 
>>> +amd_capture-objs := isp4.o
>>> +
>>> +ccflags-y += -I$(srctree)/drivers/media/platform/amd/isp4
>>> +ccflags-y += -I$(srctree)/include
>>> +
>>> +ifneq ($(call cc-option, -mpreferred-stack-boundary=4),)
>>> +    cc_stack_align := -mpreferred-stack-boundary=4
>>> +endif
>>> +
>>> +ccflags-y += $(cc_stack_align)
>>> +ccflags-y += -DCONFIG_COMPAT
>>> +ccflags-y += -Wunused-but-set-variable
>>> +ccflags-y += -Wmissing-include-dirs
>>> +ccflags-y += -Wunused-const-variable
>>> +ccflags-y += -Wmaybe-uninitialized
>>> +ccflags-y += -Wunused-value
>>
>> Do you really need to enforce all these flags just for this driver?
>>
>> Was this just for development to avoid having to remember to call the 
>> build with W=1 or CONFIG_WERROR?
>>
> We found after patch submission, Media CI robot test will be triggered, 
> when it builds the patch it will set these flags, so adding these flags 
> to align with Media CI robot test to discover potential issue before 
> submission.

I believe you can just compile with CONFIG_WERROR and get same result, 
no?  If I'm wrong, nonetheless this should be set in your external build 
environment script not in the Makefile to be going upstream.

> 
>>> diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/ 
>>> platform/amd/isp4/isp4.c
>>> new file mode 100644
>>> index 000000000000..d0be90c5ec3b
>>> --- /dev/null
>>> +++ b/drivers/media/platform/amd/isp4/isp4.c
>>> @@ -0,0 +1,139 @@
>>> +// SPDX-License-Identifier: GPL-2.0+
>>> +/*
>>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>>> + */
>>> +
>>> +#include <linux/pm_runtime.h>
>>> +#include <linux/vmalloc.h>
>>> +#include <media/v4l2-ioctl.h>
>>> +
>>> +#include "isp4.h"
>>> +
>>> +#define VIDEO_BUF_NUM 5
>>> +
>>> +#define ISP4_DRV_NAME "amd_isp_capture"
>>> +
>>> +/* interrupt num */
>>> +static const u32 isp4_ringbuf_interrupt_num[] = {
>>> +    0, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT9 */
>>> +    1, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT10 */
>>> +    3, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT11 */
>>> +    4, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT12 */
>>> +};
>>> +
>>> +#define to_isp4_device(dev) \
>>> +    ((struct isp4_device *)container_of(dev, struct isp4_device, 
>>> v4l2_dev))
>>> +
>>> +static irqreturn_t isp4_irq_handler(int irq, void *arg)
>>> +{
>>> +    struct isp4_device *isp_dev = dev_get_drvdata((struct device 
>>> *)arg);
>>> +
>>> +    if (!isp_dev)
>>> +        goto error_drv_data;
>>> +
>>> +error_drv_data:
>>> +    return IRQ_HANDLED;
>>
>> In patch 5 you change this function, including dropping the goto and 
>> label.
>>
>> So I suggest that for patch 1 you KISS:
>>
>> static irqreturn_t isp4_irq_handler(int irq, void *arg)
>> {
>>      return IRQ_HANDLED;
>> }
>>
>> Then in patch 5 add the extra conditional code and real handling.
>>
>>> +}
>>> +
>>> +/*
>>> + * amd capture module
>>> + */
>>
>> Pointless comment, no?
>>
>>> +static int isp4_capture_probe(struct platform_device *pdev)
>>> +{
>>> +    struct device *dev = &pdev->dev;
>>> +    struct isp4_device *isp_dev;
>>> +
>>
>> Why newline here?
>>
>>> +    int i, irq, ret;
>>> +
>>> +    isp_dev = devm_kzalloc(&pdev->dev, sizeof(*isp_dev), GFP_KERNEL);
>>> +    if (!isp_dev)
>>> +        return -ENOMEM;
>>> +
>>> +    isp_dev->pdev = pdev;
>>> +    dev->init_name = ISP4_DRV_NAME;
>>> +
>>> +    for (i = 0; i < ARRAY_SIZE(isp4_ringbuf_interrupt_num); i++) {
>>> +        irq = platform_get_irq(pdev, isp4_ringbuf_interrupt_num[i]);
>>> +        if (irq < 0)
>>> +            return dev_err_probe(dev, -ENODEV,
>>> +                         "fail to get irq %d\n",
>>> +                         isp4_ringbuf_interrupt_num[i]);
>>> +        ret = devm_request_irq(&pdev->dev, irq, isp4_irq_handler, 0,
>>> +                       "ISP_IRQ", &pdev->dev);
>>> +        if (ret)
>>> +            return dev_err_probe(dev, ret, "fail to req irq %d\n",
>>> +                         irq);
>>> +    }
>>> +
>>> +    isp_dev->pltf_data = pdev->dev.platform_data;
>>> +
>>> +    dev_dbg(dev, "isp irq registration successful\n");
>>
>> As you have error handling in place with dev_err_probe() I think the 
>> lack of an error implies this message.  I'd say drop it.
>>
>>> +
>>> +    /* Link the media device within the v4l2_device */
>>> +    isp_dev->v4l2_dev.mdev = &isp_dev->mdev;
>>> +
>>> +    /* Initialize media device */
>>> +    strscpy(isp_dev->mdev.model, "amd_isp41_mdev",
>>> +        sizeof(isp_dev->mdev.model));
>>> +    snprintf(isp_dev->mdev.bus_info, sizeof(isp_dev->mdev.bus_info),
>>> +         "platform:%s", ISP4_DRV_NAME);
>>> +    isp_dev->mdev.dev = &pdev->dev;
>>> +    media_device_init(&isp_dev->mdev);
>>> +
>>> +    /* register v4l2 device */
>>> +    snprintf(isp_dev->v4l2_dev.name, sizeof(isp_dev->v4l2_dev.name),
>>> +         "AMD-V4L2-ROOT");
>>> +    ret = v4l2_device_register(&pdev->dev, &isp_dev->v4l2_dev);
>>> +    if (ret)
>>> +        return dev_err_probe(dev, ret,
>>> +                     "fail register v4l2 device\n");
>>> +
>>> +    dev_dbg(dev, "AMD ISP v4l2 device registered\n");
>>
>> As you have error handling in place with dev_err_probe() I think the 
>> lack of an error implies this message.  I'd say drop it.
>>
>>> +
>>> +    ret = media_device_register(&isp_dev->mdev);
>>> +    if (ret) {
>>> +        dev_err(dev, "fail to register media device %d\n", ret);
>>> +        goto err_unreg_v4l2;
>>> +    }
>>> +
>>> +    platform_set_drvdata(pdev, isp_dev);
>>> +
>>> +    pm_runtime_set_suspended(dev);
>>> +    pm_runtime_enable(dev);
>>> +
>>> +    return 0;
>>> +
>>> +err_unreg_v4l2:
>>> +    v4l2_device_unregister(&isp_dev->v4l2_dev);
>>> +
>>> +    return dev_err_probe(dev, ret, "isp probe fail\n");
>>> +}
>>> +
>>> +static void isp4_capture_remove(struct platform_device *pdev)
>>> +{
>>> +    struct isp4_device *isp_dev = platform_get_drvdata(pdev);
>>> +    struct device *dev = &pdev->dev;
>>> +
>>> +    media_device_unregister(&isp_dev->mdev);
>>> +    v4l2_device_unregister(&isp_dev->v4l2_dev);
>>> +    dev_dbg(dev, "AMD ISP v4l2 device unregistered\n");
>>
>> Probably not needed message anymore, right?
>>
>>> +}
>>> +
>>> +static struct platform_driver isp4_capture_drv = {
>>> +    .probe = isp4_capture_probe,
>>> +    .remove = isp4_capture_remove,
>>> +    .driver = {
>>> +        .name = ISP4_DRV_NAME,
>>> +        .owner = THIS_MODULE,
>>> +    }
>>> +};
>>> +
>>> +module_platform_driver(isp4_capture_drv);
>>> +
>>> +MODULE_ALIAS("platform:" ISP4_DRV_NAME);
>>> +MODULE_IMPORT_NS("DMA_BUF");
>>> +
>>> +MODULE_DESCRIPTION("AMD ISP4 Driver");
>>> +MODULE_AUTHOR("Bin Du <bin.du@amd.com>");
>>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>>> +MODULE_LICENSE("GPL");
>>> diff --git a/drivers/media/platform/amd/isp4/isp4.h b/drivers/media/ 
>>> platform/amd/isp4/isp4.h
>>> new file mode 100644
>>> index 000000000000..27a7362ce6f9
>>> --- /dev/null
>>> +++ b/drivers/media/platform/amd/isp4/isp4.h
>>> @@ -0,0 +1,35 @@
>>> +/* SPDX-License-Identifier: GPL-2.0+ */
>>> +/*
>>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>>> + */
>>> +
>>> +#ifndef _ISP4_H_
>>> +#define _ISP4_H_
>>> +
>>> +#include <linux/mutex.h>
>>> +#include <media/v4l2-device.h>
>>> +#include <media/videobuf2-memops.h>
>>> +#include <media/videobuf2-vmalloc.h>
>>> +
>>> +#define ISP4_GET_ISP_REG_BASE(isp4sd) (((isp4sd))->mmio)
>>> +
>>> +struct isp4_platform_data {
>>> +    void *adev;
>>> +    void *bo;
>>> +    void *cpu_ptr;
>>
>> Will touch more on these in later patches, but I would say don't 
>> introduce them until the patch they're needed.
>>
>>> +    u64 gpu_addr;
>>> +    u32 size;
>>> +    u32 asic_type;
>>> +    resource_size_t base_rmmio_size;
>>> +};
>>> +
>>> +struct isp4_device {
>>> +    struct v4l2_device v4l2_dev;
>>> +    struct media_device mdev;
>>> +
>>> +    struct isp4_platform_data *pltf_data;
>>> +    struct platform_device *pdev;
>>> +    struct notifier_block i2c_nb;
>>> +};
>>> +
>>> +#endif /* isp4.h */
>>
>> /* ISP4_H */
>>
> 


