Return-Path: <linux-media+bounces-29451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6890A7D35E
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 07:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 673437A427D
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 05:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1139F218823;
	Mon,  7 Apr 2025 05:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OhIS7NK8"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2046.outbound.protection.outlook.com [40.107.22.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1C138FA3;
	Mon,  7 Apr 2025 05:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744002892; cv=fail; b=XkPxhVhRXIVz38e8Iapyue5TOzuvBtewX/SPnCbp1Dp92oqMvETLlyWMpWqObV+CIV9i1MZ/nUOAQWvmZP+TiAPGXmp0NjOkMOY6P3hWmI5NmNFZZPF0Jrz7FBPusedYoQSV6GXEMX32DxnZs+TmK8ywc0rmHjQ3fJZ1KZLlSos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744002892; c=relaxed/simple;
	bh=f4xI+0s6P/9PsXLyMzI3pU48eJ2MLZpQ7r+r5IWkVF0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dHEHW3uBlxULKefi0hfV0lZ3qRg13ss2/7IXti3NwVO0ZUxYifSuDQenWlU9MrHqwxdZTnn3xB+D9J6TT9qHwB1b7i6RbTsX3ncniaNpdk3CXj4N1JubYbYfZ3Qzp/29fZW5eZ/Qu+bsEZgRDoktS760Yq3xzQSOgBhwyaf1Sog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OhIS7NK8; arc=fail smtp.client-ip=40.107.22.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9EwjqPEPYKWtkkcehpHBpgJECMwkiVBRqmpt0/yHwvEgbUe7OnrImD4/A7xStXK1VQInB4YTI3YRC7cQtF98W5EQNBlr6qXhaXLRUsGSvVDCVU62I6HXzgC5VYgR2X1oMEE6pMkjQbdkQAxcZ9NwoOX82SjXbsLN6a6eMDyf+A6peQBXSAtKl4b/IjPwv/hjXSDdjGXpdSI32oK3P3asfJvaKex3JKyCZ/fwEltc12wPK744Ev1XUf0ekbtbSzp7VF/QT1dJLr5qQSGBPJmlGxsUuXr/wuQcnig797rEOlVZV/7ob7Aqhb2Jvz8eyoTU11MrPNNWD201O662uV3Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONhn9bQcnd6xXgqZmsy6j5W+7XiCsxPaX1oYdZuG6A8=;
 b=NSh+p/xRBzEgV7x8Z703Whi/OS5kTfn8IwkJEWTx/oWJEXBQqiw+c7hoN/ddRjwYf8KtjpeawvVHKkcdWIFXa56V/Xn+E6auehQE8cFQxhtzjxw2CEaLe+1d43ZUMtPvWhZioUV4pMszkMSodT14nrrAcwaCPTgsZ1yVXUdPY1uPVadBLjUO8Xml0OcwZoBmHvPYcU7EU9rvjjdRofJUD3w5rYCEiixcbIb/Fec6BP2lljssBeIimdC52oPN2iHb1hQPIPu22bqcwWrBteXRy53aZRJsBBDiyIcqT3aMLbasGHbch5oO4glReR6l5EyDOx1I1C9o1bwmuCErp4cx2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONhn9bQcnd6xXgqZmsy6j5W+7XiCsxPaX1oYdZuG6A8=;
 b=OhIS7NK8yDQBEAkaBdcJtY8LJZ1vtLdpUUD4TvlC3lFN3RTNLSvd8hYNEuiIOGeh2TRk77KxLVmUJoCvZKW/koQzhrK2ZCt6cCf/bVBsA1PX57l7ViAibiNYceLBmLJa+EXZYHGDMqrXtXJsRYfNDTQCpWnT648z4ebsXi96rSo7Phd/2iExuG5BXUbzdEUO7DNNwKJqLqcDjpUfdbqaDGKVAifv8zJIDNJSy9MSLlwDJ0jp+U7r0RIy6FQ4CNMxicbI4nNKRV2m1XzhAOJhakNE5TKl7MB8YO7KdrPC3TKcMKZD2Zk5A+RdTuzShukLpWJj4tuo2eQRcrIpx7lHyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PAXPR04MB8509.eurprd04.prod.outlook.com (2603:10a6:102:210::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Mon, 7 Apr
 2025 05:14:45 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 05:14:44 +0000
Message-ID: <e4011f8c-2221-4350-b14f-52b5bb9c49f6@oss.nxp.com>
Date: Mon, 7 Apr 2025 13:14:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] media: imx-jpeg: Check decoding is ongoing for
 motion-jpeg
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, mirela.rabulea@oss.nxp.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250328063056.762-1-ming.qian@oss.nxp.com>
 <20250328063056.762-4-ming.qian@oss.nxp.com>
 <20250405153732.sitanh6tucpzvkoe@basti-XPS-13-9310>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <20250405153732.sitanh6tucpzvkoe@basti-XPS-13-9310>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PAXPR04MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: acff9907-2a43-4f18-3fdf-08dd75931b89
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UlpIcmhpeEVDWVJHM29WU29pTzJSLzFjVkJNQTJ5cWkwVWVzZWEvdS95eVBr?=
 =?utf-8?B?bWE3ZExSYWhVcW0yQzJ0NVMzZVd4UXZhbWdkWjJUWkxMTGxPb2QvVGZuc0Zh?=
 =?utf-8?B?amYzVHY4YzRTNFNwRlhxM3ZucTBrWjVBenF5NGlLZE9ZOWdQZlI5SlpRejU4?=
 =?utf-8?B?VDdPWi8xU2RlemI5MlhXOG5XQXIrU2FYUTRPV2l1cTc1UXlCRGx6VCtIaXZo?=
 =?utf-8?B?VWljbDVSN2I2SnMzVjI0RS9JL3dlN2I3bmFQM1dsQzVOOGVvM1hvRS9rcXpY?=
 =?utf-8?B?MVRVY0V1dG5CVXNWM2w2cVc5ajRoRGlHNENqWlk4WE9TektwbzlFajQyQU9r?=
 =?utf-8?B?TzJ1TDdHTWtVdjh6TjNiS0tMQkZLYW9jUDc0bnhIbCthT0F2a2ZwQWRraHNP?=
 =?utf-8?B?SGNTNmM3WVBYcjY2dnVjNExycjBEcmwzQzhpM0EzcEw2VDJ5QTJKMWVyMHA2?=
 =?utf-8?B?cVdITXZJZG9VV2UxczYxVlg3NnQwUjYyMis1TFQvUEtUOEZTTUpzVDlaSFIy?=
 =?utf-8?B?Zm5hWEZoTXV6NlAvMWFXdXo0d3R0bEZLaERycHN3T0EzM2NMV1M5V1d6dDNO?=
 =?utf-8?B?RW1GVlVsTnpwczhyR3BiZFpqN29JdzNBS0hlL2puREdibFJaZTgwYkpUYk5K?=
 =?utf-8?B?Q0RIVzhYMnc5WERGWnR2MUt2K0x3MENlUzZIRy9PUndhYmNIWFV1SnB6NlZq?=
 =?utf-8?B?S01QVUE5M0dacEdWQmVoaXBPclhCTXpjVnBaU0xQTXBua0xPTkNUZUJ2Rmdz?=
 =?utf-8?B?YmNVNTZBT29QMEpFTkcrQTl5RWRObEQ5NGovMlZwdUhQSkpmZDErMDhoMTFS?=
 =?utf-8?B?S3RZWUNLV01pTUNRQkl0VjBRR3V4bWwxSjZwM2pUcVBYYUlZcXl1WWdwVjBn?=
 =?utf-8?B?dWE0QmlkeU5WUVpma0JrR1VDcFlBZDM0SFFCRkJqdEZXTTArVHMza05nMHh3?=
 =?utf-8?B?UkNzWkV5eW11YXlEcVAra3dhbmlWQlhEZjRBN2QwRVRsV0RvOUdJeU9yeUho?=
 =?utf-8?B?OFBrcE9TSnVTc1dwZTUrdjZUYzVzdTNtUXBCYTFDc3NjdFQ0ZWJ1ZnVZNHhm?=
 =?utf-8?B?WFdDUjhyd1lGeThLdVYzczlVNEhzRDQvOTZOYXpSWkxCZHNWN0lCNTV5WGxR?=
 =?utf-8?B?MG14OHlEZGZ3RDRaMmZEeXlJMFhSbk9xcUtTVzlKZXpYS2lUMFJuVkd3L29Z?=
 =?utf-8?B?b1Q1M3JkUUZVMzFVSjZJQjY5VlZRMUpMTFZYZEk1SVV2VTM1QkVsWHl6MlRT?=
 =?utf-8?B?RXZMTnQ5ZUcvQWpDN3pVREJGbCtzSlM0ZUVMUGpYWlhuZnQ5SllUd0I0WXVn?=
 =?utf-8?B?a1lSY1Z6Q2UycXZRTXdZVjVTUkF0QmROSUNRWG1KRGxOUkhJakFibVYrZkc5?=
 =?utf-8?B?MFg1OHNLRTRGSmIxbHdVK2ZTeEYzUERBUWNOUTd0T09JUlY5U1VTNmFocDBt?=
 =?utf-8?B?RjUyRU0zSTJtRmUzcXBDUmZNU2NxdHJNUFNRU3BxbklBUkFBN2l4VlpTTDF4?=
 =?utf-8?B?WHZSM29OQkpIbzNNMjRmQnpJTHExUEc5L0YzbTFlaE42S2hCM28rbVBFUGlu?=
 =?utf-8?B?aXpUQzBvT0ZFVmNjOHRLcnFXSFRUWWgydFEvVUVRaE94UkJDaUQ1Mytjb3NN?=
 =?utf-8?B?TDNyWlB5NlJwb3hHNmJkQXVQOU1MRVZwSjdYZyttRmtsYzVFSkRGUUI5ZTlS?=
 =?utf-8?B?enBHRVExWmFYS1oxa2YyTThpd1FDSWtLWnhWd0xFMVVsMCtsVEU2ekc3M3lj?=
 =?utf-8?B?eE5aencxNnUvc2hUdmZ6RnFnNjhMeEc1NGhXVlJNWHVMQVVacElRVU9LU3kv?=
 =?utf-8?B?Y1pCa1hHZGd5ejdpczdiZCtpMUJpUHJkN3RFUlpnVzVlUk5mTGdwcHFQc0sr?=
 =?utf-8?Q?wH7I5o+G3FZkZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZndRZyt6QXJRVjhQNjlDbGlKSzZ5UmYzSXVmdXNlV04xTFl0ZlBvQUdYU2ZQ?=
 =?utf-8?B?dlJ1WDdtWkJhME5FQmdGUWhBTzAyMlpuRnZHSVJHVUVZTEZpN3NkSzhGTmUw?=
 =?utf-8?B?WURaMVZwVkhYaVcwSVcybHhKd3gvM1piTVlUWGlkWWpUNVJCR2tkSEd1TFFq?=
 =?utf-8?B?V1dJVWpIV1VBSVhWeFNiNDNyV3BSbG9sa3BlZVp1RVp5S1hab21EektKUnR4?=
 =?utf-8?B?ZmhRQkhuVE85RTRNaG9Hbkp5RUZYZmErN3p6eURncmRSSzJoVS9lekNPU2tN?=
 =?utf-8?B?WWlaSk1VTy9rdXo5a3FhWWk0YlYzT3c5Ky9TSlU4VENmOWJSczkyanh2NjBn?=
 =?utf-8?B?a2JJZWR1MEIzSzdKc0pjK3hvWWFacUZlbGc4aWRSbndVVC9DSmdEYkNjVmNY?=
 =?utf-8?B?bzhFdVVPNjdrZHAvNkl5NEYvd3g4cXFzMEFja0FyRUdldUcyelFrblVaUkxx?=
 =?utf-8?B?RGNHR3laZTcveTJOSitJdlRsZmlBT1ZNUlNUaW5JZlpsNXMzQWR6aXRUTDI4?=
 =?utf-8?B?Ujg2d2pyWlFVbTVieUlVWWg4Q0hpS2g3cThtUlV5V1VDQ2J1RnNDN0V0cjlx?=
 =?utf-8?B?ODcvMGpSZ1ptYzM4KzBZbzdZRGQrMnpJQjlEczhjbkVuaDFmYmZBZ2s5VlFp?=
 =?utf-8?B?MnhTblRpR3l4RWpDWm1jRlZhRWJiL3g1bGdjMlVzSVh4cTJHdjRYU3hodXNl?=
 =?utf-8?B?NnE2ZHBpOEQvNElZcVJQRW9pRldaWk43ak1ZM3JOSmxoOE40RTRScjd5TWRO?=
 =?utf-8?B?cmdSaGdZUW03d1JUcndReVdRNnN6TXFSRlZ1WWFOcTRUdlZyT0pRSEU3RXBo?=
 =?utf-8?B?MDFuUGs2dU1OaGJQWllPaEJhcE96eEczd3NSVkJJVW1BUm1sV240M1dvVlFC?=
 =?utf-8?B?anBncUZwK3FyZjJFVUl3R1Z6UkZSbFoyU094TnZPSVZFUllIdTJVMTM1S1l5?=
 =?utf-8?B?Tm45SVJWdjU1MytST2xLZ21Yb3RFM2tLVDZreEt4SDRwb3M3L0FDVDF3Wldr?=
 =?utf-8?B?T2tkMTMzTmswRnYvVm44VGNPcWRwUnNueEJFM3NaN1ZzdWNrQ2NheHBVT1pJ?=
 =?utf-8?B?M3hMZWJ6ay80UzRwZDUyaTFabG9XUlBtV2lSK3JYQjNXU252NXdFeFBLYXZM?=
 =?utf-8?B?cEV3azB0a1l3Q0doQk9FZlNSSlFVL1B1YTFqS05UTFp0b1ZuN3VOOEFJUHpI?=
 =?utf-8?B?aTRtbmhnQU4yQjV1cDVOMnl6S3cyRHF1QkJtRXZVblZXbWpPTE1Zblo3alpH?=
 =?utf-8?B?ZCtPUExLVGZKMkFWbXJXaUZ2QXlKbWhTMHNBNjBoM2ozTGd2ZEd6eGQ4L2pz?=
 =?utf-8?B?SThrNjhSa3kxTm5ZNnBtL3pQclZmcTdIUW1JWGZXSzdyL1dLT3dCbkFsdGdG?=
 =?utf-8?B?c3diUUpWdlpXbmUraTZRTWd4L2w1M1I5bmdXQnNnaDNUWU5BUEs4OGllR20x?=
 =?utf-8?B?dUIzdkJuTHZ0bjhFei9YNE8zejhyNHhyMnRZYTFzanlsb1dzSWU1U3cwcUdK?=
 =?utf-8?B?VSttd1dwRVM5cWJpb0pUL0NPVkJkblppTTVEOWNNOENUSmZmTXc2T2hOUjBT?=
 =?utf-8?B?ZDg4aFZNa1MzNXY0NDVySHMzYmhXNHU3Uk9pMmUra2tXdWw1aW5laWhoa1Jj?=
 =?utf-8?B?TWJNeDMvL3RmVy9YVFliNGtoWE11K1YzZ010TzFhc3JSMDhENE4zc3VEWnNI?=
 =?utf-8?B?M2VXMmRtSDBlc1h3aWhsT1J5N3BSSmhRSWlUZnRHdzZVV01yQndwamp4azdE?=
 =?utf-8?B?WnNydkpXSnFQRjFJMmNDcXhYbkpsR2pXTm9MRUdKM1h2MkFXQWlJeThCMnls?=
 =?utf-8?B?bWc1V29zalFSN1JYc2kwa2RBUjU3ajhhSk5IbmNKOVo5UncxcW9jK0dEaFdn?=
 =?utf-8?B?a05CeGR3UFpzNUx1bUEvM3UwNUdwdXhoL2RYOWZlQ0h3MkpEYmlmWUVLa0JU?=
 =?utf-8?B?dUVveVBPSENjTjA0Y2VNMWtjWXpWZDlPNzR0WW1pRTMvOFcxWmQvWW93TTAw?=
 =?utf-8?B?S0VBQVRBaktTTEk5MjF0WHVzVGg5aS9weDI5Q0RkdmVJMkNCbUhuT2FsMWRs?=
 =?utf-8?B?MURndW56V2FVd25UT0ZJQjVhQUh3ODdtUmx4c09FZWVWakNPYWdPSnlzTi9x?=
 =?utf-8?Q?8ggW0IOkzsvZ7NNOUX2mx3uaG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acff9907-2a43-4f18-3fdf-08dd75931b89
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 05:14:44.8302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/yg9D+vMaF+qcGgfIGKYxngO/WaCyer31NHah5CjeCN8DRqkOYd8yv3bHdkQb7gDIAneoet9nAfWBSZGZD6BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8509


Hi Sebastian,

On 2025/4/5 23:37, Sebastian Fricke wrote:
> Hey Ming,
> 
> On 28.03.2025 14:30, ming.qian@oss.nxp.com wrote:
>> From: Ming Qian <ming.qian@oss.nxp.com>
>>
>> To support decoding motion-jpeg without DHT, driver will try to decode a
>> pattern jpeg before actual jpeg frame by use of linked descriptors
>> (This is called "repeat mode"), then the DHT in the pattern jpeg can be
>> used for decoding the motion-jpeg.
> 
> Hmm do we need to repeat the description from the previous patch?

This issue is also caused by the repeat mode, I thought I should explain
it, but as you said, this does make it redundant.

>>
>> In other words, 2 frame done interrupts will be triggered, driver will
>> ignore the first interrupt, and wait for the second interrupt.
>> If the resolution is small, and the 2 interrupts may be too close,
>> when driver is handling the first interrupt, two frames are done, then
>> driver will fail to wait for the second interrupt.
> 
> Okay this first part is a bit hard to understand, how about:
> 
> As the first frame in "repeat-mode" is the pattern, the first interrupt
> is ignored by the driver. With small resolution bitstreams, the
> interrupts might fire too quickly and thus the driver might miss the
> second interrupt from the first actual frame.
> 
> Is that what you mean?
Yes, you're right, and it's better now.

> 
>>
>> In such case, driver can check whether the decoding is still ongoing,
>> if not, just done the current decoding.
> 
> That doesn't answer to me why this solves the issue of missing the
> second interrupt, can you elaborate your solution a bit so that the
> reader of the commit description understands why this is needed?
> 

When the first frame-done interrupt is received, we need to figure out
if we can get the second interrupt.
So we check the curr_desc register first,
if it is still pointing to the pattern descripor, the second actual
frame is not started, we can wait for its frame-doen interrupt.
if the curr_desc has pointed to the frame descriptor, then we check the
ongoing bit of slot_status register.
if the ongoing bit is set to 1, the decoding of the actual frame is not
finished, we can wait for its frame-doen interrupt.
if the ongoing bit is set o 0, the decoding of the actual frame is
finished, we can't wait for the second interrupt, but mark it as done.

But there is still a small problem, that the curr_desc and slot_status
registers are not synchronous. curr_desc is updated when the
next_descpt_ptr is loaded, but the ongoing bit of slot_status is set
after the 32 bytes descriptor is loaded, there will be a short time
interval in between, which may cause fake faluse. Reading slot_status
twice can basically reduce the probability of fake false to 0.

Regards,
Ming

> Regards,
> Sebastian
> 
>>
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>> ---
>> .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |  1 +
>> .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 20 ++++++++++++++++++-
>> 2 files changed, 20 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h 
>> b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
>> index d579c804b047..adb93e977be9 100644
>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
>> @@ -89,6 +89,7 @@
>> /* SLOT_STATUS fields for slots 0..3 */
>> #define SLOT_STATUS_FRMDONE            (0x1 << 3)
>> #define SLOT_STATUS_ENC_CONFIG_ERR        (0x1 << 8)
>> +#define SLOT_STATUS_ONGOING            (0x1 << 31)
>>
>> /* SLOT_IRQ_EN fields TBD */
>>
>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c 
>> b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> index 45705c606769..e6bb45633a19 100644
>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> @@ -910,6 +910,23 @@ static u32 mxc_jpeg_get_plane_size(struct 
>> mxc_jpeg_q_data *q_data, u32 plane_no)
>>     return size;
>> }
>>
>> +static bool mxc_dec_is_ongoing(struct mxc_jpeg_ctx *ctx)
>> +{
>> +    struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
>> +    u32 curr_desc;
>> +    u32 slot_status;
>> +
>> +    slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, 
>> SLOT_STATUS));
>> +    curr_desc = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, 
>> SLOT_CUR_DESCPT_PTR));
>> +
>> +    if (curr_desc == jpeg->slot_data.cfg_desc_handle)
>> +        return true;
>> +    if (slot_status & SLOT_STATUS_ONGOING)
>> +        return true;
>> +
>> +    return false;
>> +}
>> +
>> static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
>> {
>>     struct mxc_jpeg_dev *jpeg = priv;
>> @@ -979,7 +996,8 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void 
>> *priv)
>>         mxc_jpeg_enc_mode_go(dev, reg, 
>> mxc_jpeg_is_extended_sequential(q_data->fmt));
>>         goto job_unlock;
>>     }
>> -    if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed) {
>> +    if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed &&
>> +        mxc_dec_is_ongoing(ctx)) {
>>         jpeg_src_buf->dht_needed = false;
>>         dev_dbg(dev, "Decoder DHT cfg finished. Start decoding...\n");
>>         goto job_unlock;
>> -- 
>> 2.43.0-rc1
>>
>>

