Return-Path: <linux-media+bounces-26895-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 851EBA43676
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 08:51:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9AD21889E16
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 07:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C24ED25A32D;
	Tue, 25 Feb 2025 07:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="Fia2eO2f"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023091.outbound.protection.outlook.com [40.107.159.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBDB2A1D8
	for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 07:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740469863; cv=fail; b=nut7+mRKLfZr2e/S43ePH/MLMhiFKyEBC8QBh/sTW6OdonwMhBrQOgyQiHrq5p2QiGT6h9ZrXzeyDFOzcfSspBzlo++htdoNyKjJrKLsyrDEpZ54liTlnNTmdiIxNfTyscpdL9lPIZz/eTkWSqtTl1y/qRLPuw0p0mkzhAkHAHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740469863; c=relaxed/simple;
	bh=7NN02WSCnZLxN8dDrMjgg4WQDaOaFfn4ZqmlNtLqDpg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mTwr6CdsTNJw8+NpjNbM3lD3z6/B4ZLNBBEqsfvNyluhbN+hvpqfSf3Fkx0MSvGcoK25dLMc6qjUm+Px78q77+ifHSliDoopG2lMzlcdW8/kityCfEP3cYgUpnGa1krSLh7IWg0xVYhOCGgRc8zDsMZIzskAn/Wxg+A2LMV1eO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=Fia2eO2f; arc=fail smtp.client-ip=40.107.159.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fO8Oq6o60wfOHTrb6hr7b09Qu6NaXgS5oZxiJwF2amp000vkfIYpUYWvEeggTB4moPbGvFnv6oF+uCjs21Wy/lOJTKkGii2U1Q8Oxf55LlA6tcKC6q/kTo8S8sMLfc933800HLuutRcifap4j9Z8ExY4SLelCosFE5dspfdJ50IQ1to97lGR+4oc3jh7nrqpqquxQk2JQ6dsgRoKh9NOrhVaDL+JRCN7ZSM7YxK5B6F3u1vwjY55TZbuWJhp1ISDs/9LmVeKsh/2WvBtogjojOStOrRUyqfrfGbUUdy6IPXCAILfW/ysaGDscbkdqHb17T1TARvKO9t7FM6ZlncCbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=At8ccgNg4g4onNf2Z6UaM0Gk+czrxAnJnRTUf97NlgE=;
 b=E5qROWV0b1jupusbB7Z2v5OC6zMVWa55D+ejvzeImX6kehYgYXlxdHbnsDiSfXmwOaIFGq/WqS12jyfZM6yRGRmric81opNSl41s9jv5yQWpv7/RbsFEbtkLWATJWDoU9/9BMFDVd7eS/vOgKKZABBezZZC4uM+C2IjxpDZ7l2rpPQlAFxaTC9opbMyq0OrVlnnR83zlPyiyRI1ASeCLtc5kfMKArl54ejiLaRGqh7HqfHXu8c7wNnBR6FDuew91y+zAGafdH31xEvkvEikw2AkRQ3pn9b/QhdBslvXTCjgmUxPU8P5xFFoy0w/e+DlVTnMlIwycoKT/9c/Xb2f95w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=At8ccgNg4g4onNf2Z6UaM0Gk+czrxAnJnRTUf97NlgE=;
 b=Fia2eO2fZeDosuU9xy6/ZRMUtgt/FQk3RkjQzKixlWeOoz5T86/6CIwFMk0SeAhmgn9XVeZhjc9I1dRTo9S/69ReNfSMadjplKTwWkWFSWJqeMa+T/RFhdg+mvFjtN62mf+KHl5pS1YyMyxoEd3udmYfrlhL7jw1Exgi6JYCugk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DU0PR08MB7713.eurprd08.prod.outlook.com (2603:10a6:10:3bf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 07:50:58 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 07:50:57 +0000
Message-ID: <5175d31f-6621-4047-833a-e7a6ae5e1bf3@wolfvision.net>
Date: Tue, 25 Feb 2025 08:50:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: i2c: imx415: Add get_mbus_config() pad
 operation support
To: Alexander Shiyan <eagle.alexander923@gmail.com>,
 linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20250219094637.607615-1-eagle.alexander923@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <20250219094637.607615-1-eagle.alexander923@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0216.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::37) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DU0PR08MB7713:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a8a8321-e798-430f-7ceb-08dd557123b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M20rNUE5MTNtd0N3aEQwWXBybGs0alN1eTR4WU85M3Q3VU1XQU95ejdka08y?=
 =?utf-8?B?b1hOSnhMTHNnZVIwTUNiNnVadWFCWUFWRVZ6OGVBNnRva2t4R09jd0xaUlJO?=
 =?utf-8?B?NnRuWFhrY1hkZHV5ZmhaUWUrYkVWTC81WlhFVVQ2SzlFbWliY2ptR3J0Q3Fp?=
 =?utf-8?B?aWh5TzQzSkhjMmpDUGEvem9pUUlLMlR1eWU1UFRIQkczK2VFSXhURWJ4dGRS?=
 =?utf-8?B?OXYybVV3ZDVsVm1Hck5GUG50VDJYdTNwK3ZLTktzSWl3MkxQblNmLy9MMjZs?=
 =?utf-8?B?MklPWTRHemVkZmNJbHgzV2lCSE40MStlT1dSZkI3MkdOS1pkR1psbVhpRzNt?=
 =?utf-8?B?VjBCbUl0d1QrbUlyazhlVkRvdE8zODc5NzZIeVMrUVVsZmVZMVZ6ZWtMcTRJ?=
 =?utf-8?B?c2FoYUxlVjZoRFFsNzBuNWR4MHRrWGtUclp0TkVIMFEzQ1Q3Z280Q3NENjJm?=
 =?utf-8?B?ei8vMllwT1dCR1ljelJQTkd5aUY4d2xZaDZabDIwZWd3T2lpQWNhSEY2d0s4?=
 =?utf-8?B?Rnpid3RYOXViejJyNjBlU1hKNmE4bDRDN25TdVVaWFhuNnhpL3ltaHZBYWpI?=
 =?utf-8?B?S2tnTE5LbkhJc0xPZWpSc0F4ZFAwR2szTW04WEwrOGx0WGw2aWd5TksxRWhm?=
 =?utf-8?B?MEptQXNOQ2VHRTJjTGR2ZGpUMlhRN3l2RHVuRm44bVV2VlRoT3ZISzdDTHo0?=
 =?utf-8?B?VDEwMVVHK0w0V01Ub3I5b2poWDhFaVMrMVhmVmpzaFpyUG9FTUdNcXVkb0JC?=
 =?utf-8?B?OGZydVlsanFrVDdkVXNoQW45c3dWMTNIaHZkNnV4UjhtWTcxKzNPYU9VSm9w?=
 =?utf-8?B?a3RtWjRCcUt0ZmlUY3h2dkRxd20yRzlSQmptVTNvK1N4dVlHdXRoK0l2cTht?=
 =?utf-8?B?RTkrYVh2cnAzWkdvM3JsSUl4b3RKck5iSDFzZmh6aC9XV2IwNnppQUxVVno0?=
 =?utf-8?B?TmRvSzJURzdCZnN6cTBDb21MbGNCM0tvRzFDUW1XbzIxZGwvU2pORmlXVWds?=
 =?utf-8?B?STJuQ2s4TGV3MnM4WXJDZkJvcVVKNmVNWC9aTjIzOWpUVHAvKzlXc0JBTTVi?=
 =?utf-8?B?T2tkWnc5MFVxMHp4T3QrSUpvK2VoM3VaUTY5R2gxblZYc3VXNm1FWTZnb3ZW?=
 =?utf-8?B?Q2JhUkh3SG5IMkNLVHRTWUtQRjRyRlU5WDMrYkVKcDU1OXNud21tUUlLYmpJ?=
 =?utf-8?B?bW9qbFR6RzFSVnUyU3pIV3U0MGpBWnoxVkJnOURidkVkdzlpT2tvOCtZRHRs?=
 =?utf-8?B?UVdnNlRDajBXeVIzZElHR2pnMWZDNEV5Z21ObzcxNlcrYjVnVStvQ1hWNUQv?=
 =?utf-8?B?UjBPeXVPc2o0RjRGbXdhQWlpcXY2UG1nKy9yQjJlM1J1R1ZtTE1TZkRyWjdD?=
 =?utf-8?B?MlZkUW8yTUJ6cjZIbk0wazlGQUMzQjlQVU5peXQ1c0wyTCsyVnJJR1RSa2h4?=
 =?utf-8?B?a1NJekd1MGwySHoxemovdGdYOXlxUlQrM1ZqdDM1dEROMUJXY1Z1NFZ2bEZy?=
 =?utf-8?B?cGpyb0JvZFVIdDQ4WDYva1ArblhxT0pERG5taU5YYitEWkxrQWtLcERBeWEy?=
 =?utf-8?B?WUNzS01LM2p4NllQZWFvODNzeEp5bC9jQ0Z5emduQ1NoRUVlZmFPOWtJcFpS?=
 =?utf-8?B?WVhteEt1T1VaVElpUjB2L2NGL2Q2UDNIS1BIc1ZLdTZoU3liNXdva1QrbjZw?=
 =?utf-8?B?M1lVOUx6MCtjcTR3MmoyVmZZQVN3ckRKTXp1b3d0ZEZGS2thNVBGd016RFE0?=
 =?utf-8?B?bkw5R2N5N2dpMGFHREx1UmxRVlp1VHYrUzlJVkpaU2prbHpkUUNUU1FKNU1R?=
 =?utf-8?B?Z1FEaEVndkZJT21qb282MHpKbWJyMTZNOFd4RG0xWThhb25RNllMaytNcGpM?=
 =?utf-8?Q?caQrXXR/lPcaL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHE2OWkrbWdOTTZhMmxaQko5d1BLUWhadWJhQzFqY3FyRG9VV2hLdWJUdFVR?=
 =?utf-8?B?NWxHRkJPS296WFIxZVp1ZlJVRVhUbmRGUmk4MUl3SHVlZUZSQURQOVFEY1NQ?=
 =?utf-8?B?TCtrZUg2UFArVzlQbjJObGxabDlZS3V4bE8rM05YUi9BcXhVUmpyRU9Ha291?=
 =?utf-8?B?YmhtNE9aSU5DWm9sNzBubmE4N1JYSkVlZjVZY1J1cUJyWnhDek1FNFZVZFh3?=
 =?utf-8?B?VUY1V3RDekNFYmdKYURoeFVLZnp3bUNFR2MySU9OekRROEdnWDFjM1dYM05V?=
 =?utf-8?B?SWEyZWxtM005eHFnbkZwdHlHWWpuY0I2enlodGNNLzZiV29kVU5RQjNKZGFS?=
 =?utf-8?B?QmlvZHovT0dGV2FESWJ5c0NEajJ3MlNwNlRZRlphaGhMa0NpekRJeWtBTkFU?=
 =?utf-8?B?VGZ2Z3RHQ0YrRmp5SHBiZVBzYlIyU2hhRXNRUFc2UkRVZ1FIa1RPVUpWNk4r?=
 =?utf-8?B?WkwvUU1sSlRwTTdYTjJQWUVqT1ZqUEM2VWJ3U1hUODNKbVVhSVZtb0tNMXJ1?=
 =?utf-8?B?eStRVVg0SUs2VEJjbGROVDFySUhHdUgycGxLdGtRYzlFbXFLSVM3YVFUOVRF?=
 =?utf-8?B?R3lXUUZlQlNkYXoxQVpLdVhpckNPTDRrM2N0N0R3OSt2Qk4yV09RV2hPdUNZ?=
 =?utf-8?B?Nk5mUEpJSW84S3NpcUJ0YkROZXBaYi9oZTIyUk9aS1g2VzhCTDdCUmwwRTNC?=
 =?utf-8?B?aW5iTlFxanJHWWFBNjZWMnNmVVIveFdjU0dwbmFkbVNRUDJ5Y1JaMm8wUXM2?=
 =?utf-8?B?RVQ4SlVGdGE1UEN5WEJoaEp5Um1UMHNDWGJKZkhjcFFYVkZzYUZzbW1QZnNn?=
 =?utf-8?B?YUozajdOaHZrcmdJMnIwdWdOL3k5NExzY3ZMUUtDR1pUbjUxb0xaWVBCWHgv?=
 =?utf-8?B?Q2FkZ1AwMWR6MzRndDhaWVBGa3kvR0FWYlNhV0hYem96RmVwbGJEajVtelJF?=
 =?utf-8?B?TlpRUk5iZFRaVmxOVnQvNFdWY0NpZ2lPa096Mkwxcy8zTWdmNDdMUVh5WUhw?=
 =?utf-8?B?Q1pZVUZzYTRVUXNQZDRTYjRDRnJtdFVodGxlalVNVlVqUzBNbVVtTkhSZ2VT?=
 =?utf-8?B?b2VRUmhSdFZGU25RSVhvZ2xjVk50RzFMeHBmU1dDUzMwRU1XS3RGY0hnUWsr?=
 =?utf-8?B?TDkrWjdiKzAxdi85MDAxYzdGRUZWeUFsYk5nbHNjdzRNa2wwVU90UDRUalg0?=
 =?utf-8?B?Vm1ncFhveGdMSGxtc0VzUDYzbWhpalNEOEIyUkZBQi9LOE9sNE5XdlMvbnNr?=
 =?utf-8?B?WERBZTNZdEpNSHAyaG5tZDUrbkxEdmltVFRZeWJZRGVSc29RNVBTbzNCYVly?=
 =?utf-8?B?MFRVdXk1enJMZ0dPeTJLQkRVQ2g4QkMvaUVkN1hVRm51TUZYMmNjd3BZcnQy?=
 =?utf-8?B?SENYcGdsaVM0WnJMNVJqUTNwZm8wMnpscGNkWDloTW0wei9Hb3lRcHBDUlJX?=
 =?utf-8?B?OTkxek5WdzZOL3RHQWRteWhRb0pGZ3RvUnd2ZU96Sk56ajFIdWpNcGsySk91?=
 =?utf-8?B?V2tTSXFRdklhellDVFBlNHk2MEV6MEswaFBuaW9QTFBZMS8wdFBibVlId1RY?=
 =?utf-8?B?Sk1ISEZYcFhHZ01nVXhXNGFsZU5hTlpFbkx6RWI4VGxMcXVHZmkwZjlicHBx?=
 =?utf-8?B?cTdiaExHSGlCbi9NMTd1Z29wa1FNd3U2V0I2WVhMYVRFVUZ4aHc1K0RGRzBZ?=
 =?utf-8?B?dloyY012SDBpcDdOODYvVTRtQ1NhL1FVSUVwbU5QclZuTW5EckNkeDFiT1Ns?=
 =?utf-8?B?VnJJTXFVZHZJaDd2L1FNNkQxUFpvd24vOHlTTWxWSExkMm03ZUhzMUtXYXA0?=
 =?utf-8?B?eXFEMlFMSGs0Y1ZZVkp2dVJnSjUva2YxcTVJZ0Y3M2FUZHFDZlBTZ2ZISkpK?=
 =?utf-8?B?ajFrbkZRZFlmbys4UzNlMFRuSkNvWmk4U2NETVBsdFV1clZ3ZEhiK1hJMVBy?=
 =?utf-8?B?YW1NeE5NallZalV5S1RQV1JVNWdibUErNkF6RkpnWHdYZjBDTkxRaVg3ekQ4?=
 =?utf-8?B?ZUhlMXBDMUNmbEZsYm1BcVB2RHB2amFnWTVMYkRsWlFBKysrU2VPMFh6RXZj?=
 =?utf-8?B?N2NOQnNPbTg0ZFNTQU1PVmhhYjFqV1JUbkxnajBHS25vQXgzeU15RW5yVjBm?=
 =?utf-8?B?UFUvWGNWS1ROTnd5MlpuZXlHc3BvdEJCOHM1TkFkbXdqaEUzd2N4QmZLNWFE?=
 =?utf-8?B?Q1E9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a8a8321-e798-430f-7ceb-08dd557123b9
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 07:50:57.7493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H++76zVxYbtMv7tvPqC7GpGPmwWwXAa8CL0OlAulwdvxMzJipFlTAY+5KyTTLwvjxpFLTQ1sv0SHkrEknoGgimwHd38ZA1aqxjDpNBZ0jyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7713

Hi Alexander,

Thanks for the patches. Next time, a cover letter that describes the
overall goal of the changes would be nice for a series like this.

On 2/19/25 10:46, Alexander Shiyan wrote:
> Allow the driver to report static media bus configuration using
> pad get_mbus_config() operation.
> 
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>

Reviewed-by: Michael Riesch <michael.riesch@wolfvision.net>

Best regards,
Michael

> ---
>  drivers/media/i2c/imx415.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> index 9f37779bd611..16a52900c61c 100644
> --- a/drivers/media/i2c/imx415.c
> +++ b/drivers/media/i2c/imx415.c
> @@ -1076,6 +1076,18 @@ static int imx415_init_state(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int imx415_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad_id,
> +				  struct v4l2_mbus_config *config)
> +{
> +	struct imx415 *sensor = to_imx415(sd);
> +
> +	config->type = V4L2_MBUS_CSI2_DPHY;
> +	config->bus.mipi_csi2.flags = 0;
> +	config->bus.mipi_csi2.num_data_lanes = sensor->num_data_lanes;
> +
> +	return 0;
> +}
> +
>  static const struct v4l2_subdev_video_ops imx415_subdev_video_ops = {
>  	.s_stream = imx415_s_stream,
>  };
> @@ -1086,6 +1098,7 @@ static const struct v4l2_subdev_pad_ops imx415_subdev_pad_ops = {
>  	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = imx415_set_format,
>  	.get_selection = imx415_get_selection,
> +	.get_mbus_config = imx415_get_mbus_config,
>  };
>  
>  static const struct v4l2_subdev_ops imx415_subdev_ops = {


