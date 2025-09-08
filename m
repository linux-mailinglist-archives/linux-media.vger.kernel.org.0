Return-Path: <linux-media+bounces-42001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 467D8B48FF1
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 15:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEA3B3C4AA9
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 13:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0EB30BB95;
	Mon,  8 Sep 2025 13:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FP0TXdSI"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013041.outbound.protection.outlook.com [52.101.83.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF421AAE13;
	Mon,  8 Sep 2025 13:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757339067; cv=fail; b=QhaGbLFdXm2NX6TAWmjm9GXqLSNc2Jm/xp4unUhoMLUauqGWjXYKLCQrgW99qOFJcrh+QiD0a9rY0+WY6TF4arHz9CPiQuX5VvGsJFJtf74PBZvaDLOTXQibNbm81T1Ooqfb5XSBcGesHOR+QYD5kDjCAnvqnctCLYmxPRxlheM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757339067; c=relaxed/simple;
	bh=DBavNU6j2Y2IEYb7TcdxzIMX1DK7tv112ZV8Z6JN0QM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ms9V3drhCRQihxnk9j8rLH24TKpr/6jf7ZD1VRDoebod5gvH/dltDZFTlPXAJXowoK6zKomJEeKvqcqc51tHUtziJo4E6/zzwIa7vU92h8kwZYy3VHT//RwpzP3aOh+jdEfIeNHtFqq3lzwxCIAtLCKUrinRyRDlB0b/VOmzA/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FP0TXdSI; arc=fail smtp.client-ip=52.101.83.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yB4NYqX0OT1kPBTz3lImmS9GTbMSklDRa2ZIleNfpruPugwKfjz/B9KpS1r1DIUDwFxUBARsnP/h7rWV3ZxcsaoOiUq9ymD17ZNGK9fr7Khgbi8Rg8JWfBTJD4KTjkuezdwOT8ZUbisVyTyIbUHGbhDCiSx8CRxqi70LnqJA+xy+4xFeaRleuoqwXYO+uEUyMkIm4W+BAlaqTGjOUadjiR+bcoswSdUAmt6BYdVffcfb4n9qUXUjeXM0mQrzOd3S97b57Q61GBa8XqzBFi/C5t5HEHKiqBYnQXfyDsmd1k73MG0QuAd9JZP9JEGVppixobRSkENrvAfwj+2W1p093w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMF9q39At2OpN8d1WotbEsxRgIpStlxOxd7EWSPkNOc=;
 b=BT8tWCHfLiX7AfaMoZ1Q9Gn+Nx4hsKD2wPFYzTEIjxTI4ph4dEhwpJGKzbCLOPwaXGRKz4+iqD0IpTYYArOm1WYHNQ5SqFL3sCqMqSRt2cmWEf7LYgVPIJIrbU81TwfBqc8pwyNBgaVt4KsR4Ka4/ejGwvyCrUIZjufr/LAQGc3OO3dBh15sIbLgbIN78ILeX0cztVMI8OqOfm3Mquh4h9BlOFXDywiYrKRud8iDR302YecjTN1l2bOENM7yeW3Kb10KstpQWrmBEdnTrxjaUj1zHFfSlDnCBqb2zVT8I3pp+400b7b213gpeUEyLpaA43mFcca69ylP/AjkqH0cGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMF9q39At2OpN8d1WotbEsxRgIpStlxOxd7EWSPkNOc=;
 b=FP0TXdSIJZgw4JrgeHdEY1zEO6/A5ruBF9MpMkd7Mn3k6S47jMKMcDR632uwFwlirJhSC97CAJKJ7lWdKh93kbxrAGdohlALQDycc3qQKxYTZ0z/eGy8v1GWb3+dfkZ5h5Swh/UMBL0cbY71U4cZq77RLn6Dc/owyuwj9D9F0TExff9NS5RCqTOzeTEGqgyosdVSO2yOdjloMEMuYM3O2z6DwY68InArv4kVbplwEPO4yucI1TIpWajGA0wrbP7rtZDPe1XroPprnMeH6qWk/8s6ENvJYPf/FKF4NRTQgFUcFkKqBqBdIhYI8JhqL3T0uXm32CrnKK7DNSoS6c03bA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB9831.eurprd04.prod.outlook.com (2603:10a6:150:11c::8)
 by DB9PR04MB9380.eurprd04.prod.outlook.com (2603:10a6:10:368::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.12; Mon, 8 Sep
 2025 13:44:16 +0000
Received: from GVXPR04MB9831.eurprd04.prod.outlook.com
 ([fe80::4634:3d9c:c4a:641a]) by GVXPR04MB9831.eurprd04.prod.outlook.com
 ([fe80::4634:3d9c:c4a:641a%6]) with mapi id 15.20.9115.010; Mon, 8 Sep 2025
 13:44:16 +0000
Message-ID: <ca9e9a86-dbc1-4016-a71f-1f2980bd625f@nxp.com>
Date: Mon, 8 Sep 2025 15:45:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] media: Introduce V4L2 extensible parameters
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20250820-extensible-parameters-validation-v4-0-30fe5a99cb1f@ideasonboard.com>
 <784dcb9e-4e72-44ca-975e-4eb1b0eed5cf@nxp.com>
 <7l6ahcvujnpfqhzqsviwo72oyhenvcqklj4adivx5yv6fmux5o@bzpgpmmtgntc>
Content-Language: en-US
From: Antoine Bouyer <antoine.bouyer@nxp.com>
In-Reply-To: <7l6ahcvujnpfqhzqsviwo72oyhenvcqklj4adivx5yv6fmux5o@bzpgpmmtgntc>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: AM0PR06CA0078.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::19) To GVXPR04MB9831.eurprd04.prod.outlook.com
 (2603:10a6:150:11c::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB9831:EE_|DB9PR04MB9380:EE_
X-MS-Office365-Filtering-Correlation-Id: 81d3df3b-3693-4ac2-aa77-08ddeeddcd84
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?VlA5c01Kb3R2R1M0TzFndDB0V01QcGNuc2s5NDFJWHltS1pERFJ2VEc2TUVz?=
 =?utf-8?B?NmRkWDVPMUFXemlFUE1mK09wOXN5NHF4NW1POXlrYStnQmVmY0JxM1Vmajdv?=
 =?utf-8?B?NnFnVDRKUFVUdktPbFhCS0w3M05HUDB4WnpNV2MxTjNjNlhUNmdWU1FTVDI2?=
 =?utf-8?B?azVqRkdrekRKQVNaekdvVXczNWFuK2QwYWEyQjlyNVpVRmdxTTJZb29iWlZw?=
 =?utf-8?B?ZFBLQXFZRTBGWElBYWRGTGN2UDVHWXBxOVJERE9oSGVhejlKWVlRMm1OaEZJ?=
 =?utf-8?B?NmRVMlNPRFlPVWF2bzNJclJaTUhaVVVnOXlkSEE0MDlXcmQ4THQ1TUVudUFy?=
 =?utf-8?B?N2pnWVRxYnRDc0ZEZXNoZkRzSzFIQUUzbzJ1L0U4cDdwZmJDQVJFclpmQkNt?=
 =?utf-8?B?RGtmMzhEeHluS2lXY2gwMHRJVlVYWlphYkMzc3FGUDZscFViSGUvYTJxT1hr?=
 =?utf-8?B?Q3lQaGJnZWRmVHVHYmUzSGQvUGUyNlRNdWxZR0wrTWY3clNsL3BzZkVvTmdM?=
 =?utf-8?B?bktXTVM5YzdDM2NsYTRpRzZ4MitCM0VUOUR2UFJJK3hiUUJjMERTeUFXUmdo?=
 =?utf-8?B?eXMzWCtld2VFeGU1MTNweGJSQ21Xa0tma0J5KzRkVktmTEgzcTVlUlhYUGhm?=
 =?utf-8?B?V0dMOTJRWDJhSWwrNU5MQUs3WVoyYlhsWEdabytveW9PV0FEcTJXSXNXU0FR?=
 =?utf-8?B?YWdDWnpJZjd4bWJ5MVExdFVUUlRmWSs0bmZYc3pSbi80enJ4N0tGUlpSS2ZM?=
 =?utf-8?B?cS9aVEkxYkVabE9LTkVKVWhCWk03bTQxazZydmJ6VXRKOWw0UUhpSlJOWFJZ?=
 =?utf-8?B?UW5vS3A5Z2R0TGJrN1lROE1oOTVJVjZVWDhsVUtNV1BSdGFJRE81WG1ZSk5s?=
 =?utf-8?B?bTV1N0k5cnF0OXNYZlEzc3lSSkFJcUhqcGI1cFJGOThSNkJnRmZocVJkZjU2?=
 =?utf-8?B?TFhHQW0rdlJiNE9Ic0tEN3ZMZHNrSXpaNGgweWVsYW5IYlEzOGd0WU4xaWZL?=
 =?utf-8?B?T3duUFlidDdmN2ZITS9JUEwvSElBN1FkemhiQnpPUGxpYU14QU1xN205b1kr?=
 =?utf-8?B?Rzg4enY5bFp0Q0JraEtCWUcwejIyZlYyeXcyajBqanM3YmJUV0hVUzQrbERP?=
 =?utf-8?B?eEUyRXZ4clZXRENLUWh0WkYxZjNuME1Va0taaWF2MzB0cGlZSDdVbWlUU3pX?=
 =?utf-8?B?Y2c4MGZxRjNGVEY5QWZKc2NDK3ZQOXU0VmxwL1FXcDN5SnhYR0hyYTBzRlR1?=
 =?utf-8?B?TmVyTzJrVzhtOGJXbDUzZmdjWW55YlRkamlPeWQ0cUpuaVpiRjcwek56aWRC?=
 =?utf-8?B?YSs4VWdqbTRmOFljcC8yMExHL25UVy9uRE1qLzVhTzNhN0NuMUxqNW1OdTQ1?=
 =?utf-8?B?TDRYVGVDZVZmeFpaaE1sbTZUWmZWYWo3c2tFOElnSERvZjJLQnRXMUFvZjJi?=
 =?utf-8?B?U0FSa3BKVXdOTkc4TkV5SldGSTVjb1doYk5iRXhLRmJuMFRoZWVQaVI3dU8z?=
 =?utf-8?B?Tk9vOGJNTGFYTFhQcFM5SXp4NlM4TFh6M3VpTit0Z1B2SXVLakcwNjd2M2k4?=
 =?utf-8?B?aGRTWUhKTm5IdU5hOWx5clBzbEQvMm1mNDY4WExHRzNXbGg3SmxIOU11dE5P?=
 =?utf-8?B?ZGRKK0JLNll4N3AvVi9Qa0VTVkpYVkQvdHJHSFdGMzYxVlpPSGx5Zm1uM0Fq?=
 =?utf-8?B?VUpsbVh1bmdwaFlRb0w2eFhYTC94N0RKSmFsdUVOaTFkdkFxaFJSS3JTMnNW?=
 =?utf-8?B?Z0tWYVZsQVlWcllkYzRZU2oxWm56azlZODNhMll0MS9mMURqS3d5bDJVSEpl?=
 =?utf-8?B?RldnYTVoVExza1RldXV0RUI3My9mSnJONEpEa0NvUnVFdHNFMVE0U0gxM0dS?=
 =?utf-8?Q?fybnUAJFfdJd0?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB9831.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?K3o2WGxOdVNNbkRFVkhhTmJsZEI4ejFsbVp1Uk1jeU83d3JWemYrcW9kVVZr?=
 =?utf-8?B?UEJuRno4blMyQmw1Sks3WXpnQk9wWmhhdXNWdXRjOVpFdGhGbnN4V1FjTitX?=
 =?utf-8?B?cUgrNU53K05wODlRdGhkeXlsbUNReFBwS1RpNHNKalFPSklsNjNmanV6M3c4?=
 =?utf-8?B?WWl4cFFSVUVTcS9qUW1kUFFCZTVKNnovb0JUVFRqQkNFZ3NnZldYRWVEcTRH?=
 =?utf-8?B?ai9HQXV3YUR2ZmFuZG1mT3N3SjNadUlrL2FNYmZpN0l3RVJGc3FuMGRpMHpB?=
 =?utf-8?B?c0FrRDdONnFVQThKU29GTDlNZW1zTlJFdnA3UThqL202c00ya0RoeG5UdGtP?=
 =?utf-8?B?RUdyblU1UFNPdkQ0MmdVM1pQQzZTSnhZSGtEc3h3ZnJBSEJxMHlLdFlvRmlB?=
 =?utf-8?B?R1hVcFhjQ3BybmRWWEJsUGZTcjJWMkg0NVYvMTQ2Ny8zY3NBNms1WlFSU2pO?=
 =?utf-8?B?U0toajRPc0Y5aEhJcFhMdk1lSndEcnIwc2dGbXhrRm9PS3ZSYWw4VGhPRVlU?=
 =?utf-8?B?WXBwSEUzencxVFlCbDk0bGFGSXBDMW1KQkgvZ2duVkdnU3lBamRoUzFJRVZz?=
 =?utf-8?B?Y01hY1daVlJqU204RXFQOTZLQU55MzA0U1B5eVVsZklMbE9ndTd6SU9uc05S?=
 =?utf-8?B?c2RtZDNqcUFRMCsrM0hDVUpCYzVONnhCRXRCWmdIZk1NY0tWakdvMER4RHhZ?=
 =?utf-8?B?ZXRiRDg5VUw2S2ZLdjVDT1NpN0Z4cnErT0J5b2ZZZXNOdCtCRnNJcDhHS3FW?=
 =?utf-8?B?bTlsK0pGcjdoQXZacy9hNjF2R21vQzNyNWhkTmNpcnJucjArQW52Y0xhU2Rq?=
 =?utf-8?B?U1JhaC9YRnlWZTZxSHg3UTc2SXR5VXhoMmlnWGdqdWxNYm9qSnZOTTdGZG1t?=
 =?utf-8?B?QkJLTUxYRWNlSzlFbDVDZHNBRVM2Z0RFVVdvQTQ2cFNidE4wZHIzVTcyYU1H?=
 =?utf-8?B?Q2czV2d1dDNubWg3ZmtVb1ZoSzBhcmdvS1U0SGxKTmM4a3M1SFdtd1Fwa1Yx?=
 =?utf-8?B?eTZaVFhWU1VZQzFUTjVKMDR4ZkpWa24xK2NzV2tLYmF4S3NiWE1qOHFBSGZh?=
 =?utf-8?B?Wndpa285VWNZYlBEUVJGRXVVUGhvUmo1Wk40S01vTnExWmtGanhpbmgzWVhF?=
 =?utf-8?B?RzMzTjRJaG1ROSt6VGJQMUdxTTYzTy9UdHJCUHZYWCtlRmNvN0pEUjFCSWVR?=
 =?utf-8?B?L01nNUU1YlA4MmtPTVNqQjMyMFBvSjJ5K2tXV3NZeFpKcDdiT0tLKzRPemM5?=
 =?utf-8?B?NE9ENEt0azVjdUU2c3BRWTRGTzNuT3BQeFRHbUkrdEtuQzY4NXhNeWxsdW5j?=
 =?utf-8?B?S2VXYUtTaDFIZllmZHljOG1qMG05eTZzckpMSHhoQ3hvL1hiUlZJa2VmeTFN?=
 =?utf-8?B?WHhHUVlHbzlJYm5QamtaTlZQbTZTYkNmR1d4OFFBM0J5WkhTUFBCZXdWOUFG?=
 =?utf-8?B?VldSckVTKzNkRnFhYVlCYXYzRmdnZTB1cTVWMHlwUU1pMUp2SzVvMHVCTXpa?=
 =?utf-8?B?Ty8zY1JyYndJWlZzVVIrbjJhdE1rYW1KbHlRYVZOKzQ1YWZvNGo3TzNIaWZK?=
 =?utf-8?B?aEY0d2FDaTMrTWhsWndWSWNCTTlSOXFybTBwNjZ6bjFzbDVGUituMml3Yzh2?=
 =?utf-8?B?bFNyNnpFaHdOTjNZT3grZmJlU1JmU2M3VWVQY1hlMUVPcExlUnBkenMvclFG?=
 =?utf-8?B?a1Y2QWJRcG85ck9lZldqOXZtbTlVQnJQMElJRnZOU1VvMklsOUh6cUI5Znlr?=
 =?utf-8?B?cVNsaVhLOGdHcndIR1QwcE1FWTJ1clJ5TVdZWHJxcnQyQXNOcC9JQjgvczFv?=
 =?utf-8?B?YWhITlhielhCTkFHMTBMLytvUFF0cURuaTZmc2NEcWIrbTJGWUJIdDJ0ZEdC?=
 =?utf-8?B?eFRKd0xJVGxLWVlodnI1ZjRSbGpHVmU5c3V5Tzdxc2xDcDQvcXV4YU1YN0Fz?=
 =?utf-8?B?OWErSldqQTZWbVRjSGFsNzd3Y1RZdm83VGY0YTBGNlNadzZFWFY5dEg1VFNY?=
 =?utf-8?B?dWNSWXZMTTBySWZnR1ZkSzArZXRDaWxJdEVTM3BhOHRHRFFEUzE2Qk9HRkpK?=
 =?utf-8?B?QlE3VUxqUDlZWU9VSUs4akxuWWRQdVFHSHQ0YWE2RVMrMVR5NGtCa3ZOYU9j?=
 =?utf-8?B?YVRtckVmem1yWkFnTDJ6eXVadU9KVE1nN1hpRFBqa1JFd2pmb1ZoUkpoUEJx?=
 =?utf-8?B?bXc9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d3df3b-3693-4ac2-aa77-08ddeeddcd84
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB9831.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 13:44:16.1802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 41bnccGNW6fSfdcgdX6HDjyY3e/rog2++5aiLSjm+sbQ23Hu7o46Z3GiIe9w11escJIBV6RbuEmRXz7+rusDLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9380

Hi Jacopo

On 05/09/2025 12:39, Jacopo Mondi wrote:
> Hello Antoine
> 
> On Fri, Sep 05, 2025 at 12:14:39PM +0200, Antoine Bouyer wrote:
>> Hi Jacopo
>>
>> On 20/08/2025 14:58, Jacopo Mondi wrote:
>>> Extensible parameters meta formats have been introduced in the Linux
>>> kernel v6.12 initially to support different revision of the RkISP1 ISP
>>> implemented in different SoC. In order to avoid breaking userspace
>>> everytime an ISP configuration block is added or modified in the uAPI
>>> these new formats, which are versionated and extensible by their
>>> definition have been introduced.
>>>
>>> See for reference:
>>> e9d05e9d5db1 ("media: uapi: rkisp1-config: Add extensible params format")
>>> 6c53a7b68c5d ("media: rkisp1: Implement extensible params support")
>>>
>>> The Amlogic C3 ISP driver followed shortly, introducing an extensible
>>> format for the ISP configuration:
>>>
>>> 6d406187ebc0 ("media: uapi: Add stats info and parameters buffer for C3 ISP")
>>>
>>> with a very similar, if not identical, implementation of the routines to
>>> validate and handle the ISP configuration in the ISP driver in the
>>> c3-isp-params.c file.
>>>
>>> fb2e135208f3 ("media: platform: Add C3 ISP driver")
>>>
>>> With the recent upstreaming attempt of the Mali C55 ISP driver from Dan,
>>> a third user of extensible parameters is going to be itroduced in the
>>> kernel, duplicating again in the driver the procedure for validating and
>>> handling the ISP configuration blocks
>>>
>>> https://patchwork.linuxtv.org/project/linux-media/patch/20250624-c55-v10-15-54f3d4196990@ideasonboard.com/
>>>
>>> To avoid duplicating again the validation routines and common types
>>> definition, this series introduces v4l2-params.c/.h for the kAPI
>>> and v4l2-extensible-params.h for the uAPI and re-organize the RkISP1
>>> and Amlogic C3 drivers to use the common types and the helper validation
>>> routines.
>>>
>>
>> I'm currently working on another ISP driver: NXP neo, and also use extended
>> params so as RkISP1.
>>
> 
> Nice to hear!
> 
>> Using common types looks like really interesting approach. However, only
>> params are taken into account, while NXP neo also provides statistics. I'm
>> currently testing extended approach for both params AND statistics. But
>> v4l2-params only applies to .. params, as stated in the name.
>>
>> Is there any plan to apply the same to statistics ?
>>
> 
> Not a proper plan at the moment, but I agree it would indeed be
> beneficial to have a similar approach for stats...
> 
> Are you suggesting we should drop 'params' at least from the file
> names ?

Either create v4l2-extended-stats header, or a more generic name for 
both params & stats. Seems Laurent already suggested v4l2-isp.h. I'm 
fine with this too.

> 
>>> If the here proposed approach is accepted, I propose to rebase the Mali
>>> C55 driver on top of this series, to use the new common types and
>>> helpers.
>>>
>>> I have been able to test this on RkISP1 but not on C3.
>>
>> Also tested on NXP neo locally.
> 
> Great, could you maybe send a Tested-by tag ?

Actually, I further tested your libcamera patchs, but not yet the driver 
ones. So indeed, I can send my Tested-By tag in libcamera series.

Best regards
Antoine

> 
> Also, not sure if you have noticed this series for libcamera
> https://patchwork.libcamera.org/project/libcamera/list/?series=5413
> where I tried to generalize the extensible param helpers.
> 
> Thanks
>    j
> 
>>
>> Best regards
>> Antoine
>>
>>>
>>> Thanks
>>>     j
>>>
>>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>> ---
>>> Changes in v4:
>>> - Fix the definition of V4L2_PARAMS_FL_PLATFORM_FLAGS
>>> - Add __counted_by() attribute to the data[] flexible-array member of
>>>     v4l2_params_buffer
>>> - Minor style change
>>> - Link to v3: https://lore.kernel.org/r/20250819-extensible-parameters-validation-v3-0-9dc008348b30@ideasonboard.com
>>>
>>> Changes in v3:
>>> - Rebased on latest media-committers/next
>>> - Take in Dan's suggestion in block size validation
>>> - Documentation minor spelling fixes
>>> - Link to v2: https://lore.kernel.org/r/20250710-extensible-parameters-validation-v2-0-7ec8918ec443@ideasonboard.com
>>>
>>> Changes in v2:
>>> - Make v4l2_params_buffer directly usable
>>> - Centralize ENABLE/DISABLE flags definition and validation
>>> - Take in Dan's v4l2_params_buffer_size()
>>> - Allow blocks to only contain the header if they're going to be
>>>     disabled
>>> - Documentation fixes as reported by Nicolas
>>> - Link to v1: https://lore.kernel.org/r/20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com
>>>
>>> ---
>>> Jacopo Mondi (8):
>>>         media: uapi: Introduce V4L2 extensible params
>>>         media: uapi: Convert RkISP1 to V4L2 extensible params
>>>         media: uapi: Convert Amlogic C3 to V4L2 extensible params
>>>         media: Documentation: uapi: Add V4L2 extensible parameters
>>>         media: v4l2-core: Introduce v4l2-params.c
>>>         media: rkisp1: Use v4l2-params for validation
>>>         media: amlogic-c3: Use v4l2-params for validation
>>>         media: Documentation: kapi: Add v4l2 extensible parameters
>>>
>>>    Documentation/driver-api/media/v4l2-core.rst       |   1 +
>>>    Documentation/driver-api/media/v4l2-params.rst     |   5 +
>>>    .../media/v4l/extensible-parameters.rst            |  89 ++++++
>>>    .../userspace-api/media/v4l/meta-formats.rst       |   1 +
>>>    MAINTAINERS                                        |  10 +
>>>    .../media/platform/amlogic/c3/isp/c3-isp-params.c  | 263 ++++++----------
>>>    .../media/platform/rockchip/rkisp1/rkisp1-params.c | 349 +++++++++------------
>>>    drivers/media/v4l2-core/Makefile                   |   3 +-
>>>    drivers/media/v4l2-core/v4l2-params.c              | 126 ++++++++
>>>    include/media/v4l2-params.h                        | 164 ++++++++++
>>>    include/uapi/linux/media/amlogic/c3-isp-config.h   |  48 +--
>>>    include/uapi/linux/media/v4l2-extensible-params.h  | 146 +++++++++
>>>    include/uapi/linux/rkisp1-config.h                 |  67 ++--
>>>    13 files changed, 817 insertions(+), 455 deletions(-)
>>> ---
>>> base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
>>> change-id: 20250701-extensible-parameters-validation-c831f7f5cc0b
>>>
>>> Best regards,


