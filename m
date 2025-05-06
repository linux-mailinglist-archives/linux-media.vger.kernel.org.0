Return-Path: <linux-media+bounces-31811-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CBEAABB79
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 09:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 636B77BCE04
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 07:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67B20254872;
	Tue,  6 May 2025 06:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="e0DT4Ve3"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012033.outbound.protection.outlook.com [52.101.66.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE8FA935;
	Tue,  6 May 2025 06:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746512930; cv=fail; b=fKKBdmEtwQeW7wgNulluq11JU8wIaah1g3C6czA9P7HXjLWZqHDdfNIv/gkZqaLA3UXyiRE+5om6ttoK0YaCqO5vAvG4ZaalkAWMfvD2oSxHhsGBfngpTL/ecl5jn3He+Knr51+VmTFDroaRmaiDkCpSjkrNKCVKwZbzSB04RgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746512930; c=relaxed/simple;
	bh=w5K53YtMvyMom0C2kIpzmRhI2Kd4iVrm+mChagwsM5k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AFKvlAIkJ+TbclbGGAd84d4ZkVCEhlBcg4Vl4+To3NLILPLKrhcS5YSK6/jxGlwWRT3Ap60vSH/8h5xaefjPmL5KDstl6KLwZt84hwzU+m7nno0gjmpoe2rxOaLSmkk6P11Z7x+TSFELBSkWphzTthkncJvP/kLYvEcmUUCL5hM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=e0DT4Ve3; arc=fail smtp.client-ip=52.101.66.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJxrVv0BvfFW4HG2OY0usl61KMyM+g3tCYH8b5+Oj62GKnFBjefLPDjGEWOUAZJz7/i+SZOJaQ014aWnFnzLOe7W7jW2aZzEJ/JRDjiTLAowRkBtsQIretO/QgHN4Z0y753kp3jy0Jp1oocGiXtOkbFpEqJZBXLF8ITC8WYvZ4L0bCpl9GZnrZkWNY6mLi9Fskjuf9YvkacHLu+zr4OzcQE6JzEPyf9zdSIkz+zShn94nf8eIW0OIlGK8Ldi3bYncdJf3IObReMfkXCrAHtiJQVlTEH8tY42HpolLzxlRwDBgIP+/afiy7tKO4YeUGCx8hUyeb6mGV5F/yY3a3WXew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKEwj3fISM1EXF4w5M1QvnA6utU//3YE4m+TmndG4/8=;
 b=J1SIfpvRnxoVE9fSbDJgajAtky04ZFWfrSvgAKCXcbJFOfFmudjUT6kA8wPqoyTtujUWiIBbbidZNYbDy3xBNlBvgCCRheRpQYCBlUABX6uQGIk4LsDMVOueLF7hmNw3zKt617mYzfcKHzDJAlmtJTWiIY2vEspcRV9EK6qaOPdgCgZAYqj8QYNPbZiU9FC0iTRmshVDK/5SbVrvVJXI7XIp9AQItltjd42rn6XzlsruJTXzx839NazCcLZKyLJkU77PRBDzT5I7D8j4gPOxmVR4yOo5JHd96i2UyPvZFTJgs1XuWZyldpZ4EFkr+KH/o7Lhx3CBAZ0QMkCIrx18FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKEwj3fISM1EXF4w5M1QvnA6utU//3YE4m+TmndG4/8=;
 b=e0DT4Ve3ms4eBq0OqNIVWB9hWGhdkhXC8lkpjQ2grlE82VKe7UHpGuVeAuSqhJiAyJzQpBY5Sijth6p2O0/BQeFlcGW+XOTjmmvcQCAP8ZygxrKo5GKWzASm2OdtCD0W083kEgmvfAlr8rvNI0WxCEHdLMhhbVGM3H4g4q8xj4JDh4d0xAMYmxEB4//NNhoQPyQpnXEiOLLFd3JY4Dyh32xlavFdCnj7g+KAweGE12yXx+bDxoc6fpFwe2oTRnaInG/ySdwC9NFwuCnH9Vkww6d4TdS4A9PlrvXJr+px8IEzlpwBVU3gcRgQRAkPEjIL97k8nsn2vvYtXaZnaFcpbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DU2PR04MB8709.eurprd04.prod.outlook.com (2603:10a6:10:2dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Tue, 6 May
 2025 06:28:45 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8699.019; Tue, 6 May 2025
 06:28:45 +0000
Message-ID: <1f1207d0-c1ab-4d9a-8369-b8c6eadb289e@oss.nxp.com>
Date: Tue, 6 May 2025 14:28:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: imx-jpeg: Account for data_offset when getting
 image address
To: Nicolas Dufresne <nicolas@ndufresne.ca>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250430053928.214-1-ming.qian@oss.nxp.com>
 <c9981a1e01281153748a1edd4096f4ce1aaae576.camel@ndufresne.ca>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <c9981a1e01281153748a1edd4096f4ce1aaae576.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0091.apcprd02.prod.outlook.com
 (2603:1096:4:90::31) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DU2PR04MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: bafe497b-2860-4098-0108-08dd8c67406b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eElkV0tJZDdWWXY2Q0J1SFBzSk13WW4zS0V6eitVaFR0R1pUUHp0NEp2VW5X?=
 =?utf-8?B?Q2JLVzRZTGpqNmdoYVZZNnFJSG9PVGRaMER3S1hna2xVbmhsa0lBRERoMENI?=
 =?utf-8?B?RmJCV2ZKbXNCNnJyeTFJNEQ3eDFsbGtaR1d3ZXViQVFsbm5wL3dwOC9BY09G?=
 =?utf-8?B?dCtoVEg1QUovY1RrR09xSTNGTW1RZ1FET2N6YlhwMUsvbFMwRlJhWDByMkpE?=
 =?utf-8?B?MXZJNlpUb1dtYVZUY3hsWUZQdnFraVg5a0tIVndNdWxmSmx6OTRPYzYwUTQz?=
 =?utf-8?B?aE9wbXhzcTFPdFl6NlBWckVxZWNPMFlOL2F2QkRIRVRJSllmdDJNc1U5Zkds?=
 =?utf-8?B?MUhud1IrL1lGR3loN0pKTXVRYmZ4bExlU24xZGJYcTRyYVNybFg4MjZPdzA3?=
 =?utf-8?B?bXFXN0I0UXZiRHFha0xQRjQzZEtTNURwbFZENFNhUUN3eHp4MTBHUlZDb1ds?=
 =?utf-8?B?SXVxSDdGcjJTdDFKVGVKT0c3c1ZickpPOWRTRTkxOHMyUVZ3cHR3VEpZMStL?=
 =?utf-8?B?YVB0VEJkSTduWHZ1ck82WWdINHVwcmd1Szd1VWJDRi9QL0FIZnViZ2lQK3JT?=
 =?utf-8?B?VW5CQ2xCQk1HZllMTGZUSXUraUc5Y0VBL2ppeitIc3ZxSWFJcFpqOVVKdmFK?=
 =?utf-8?B?eDY3c3d0QTErdHZ5aGRmUVlhcHJoV2xNejVCQVhNQlMyY0FTY0EwbTAxVU9j?=
 =?utf-8?B?RmxxRFVMcFZmNzRzcUZRN1hDVDhmbU9qaGQxUmgwdTErd1F3NUNqVUUwWkIw?=
 =?utf-8?B?SXFsdHhhbTdmcWFNNzBFaG00TjJCUk1VUlBnQzQyS3FpZ1VkRCtVbTFyeThO?=
 =?utf-8?B?WDlFYzVFOFBMMGZnZUV5Vk02THVRaUltayt3eFRzTHZsSnZhdVd4MlRPd1F3?=
 =?utf-8?B?WXNhaXJ2NFUwZ2R0dVEzcDlpSzRBK2hQODVsOTdhZjRrajV3Tk5HTzdhZW9p?=
 =?utf-8?B?MHA0UXRoUEJRV0tpa2RnNTUrbmJXRGU1VlZlMmE5SjF2T2JHNWtSSkIrUExW?=
 =?utf-8?B?ZlhqOEhzVVovSTVOT1VjVHc1c1RyUDdtQTBaODNsNnRmQ2xNV1AyT3F5aklZ?=
 =?utf-8?B?VnRZOGIzYS95emp4VUQxSVIyNXVRY2pkckZpc3NOSzN2WFY4MlAzZUl6NXBE?=
 =?utf-8?B?YzFkTkZXTk1CWXVFVlh1UzVzVUM5MWpVUWVYeXFGUCtkYnJCRkVPR0tNdmlS?=
 =?utf-8?B?Yk5Rc0txUnhGcXlsYTVIZVAzSVYwSkl2UGxDQWtVWHR5WWFyU0tIMlVPY3hp?=
 =?utf-8?B?MnovTmtTSjRwNXNoTGdyNHE1LzA1ZW9YNzJpN01hSXpZNGI3bU1HdVY5WWtL?=
 =?utf-8?B?RXVPY1RwVEt3ZUVacHdmM2g2YVBJUUtFZmg2UURFZFR3UU1mOGR6VUNZeFkv?=
 =?utf-8?B?OWRyYmhkL0dEdStpVExBNnZPV0tmcEhIdlVNS0NzdERiVnplaFdnWHZOUG5S?=
 =?utf-8?B?Y1doK0Z2L1dsZGltNGxNZGJiNzFEekFOdjdlRUg3MmlobGtaRk4xMnQxUmsv?=
 =?utf-8?B?MlZhcDJhWGNVOUxzYTAvTE9BOWtReU8zYkYzZlNBQkxjK3pSMWlrTkY4eVVB?=
 =?utf-8?B?ZGw5LzN0TGRMa3NyYTMxWlZJNTBzZ0N5YTNmdHZiUlQ1TzdKSEtzMWVKYjgx?=
 =?utf-8?B?SHQxVVBDWm8yV1pJNGpERGFwUzlVMnE2S1hXc2tGdG9RUVJxeFMrRjNQbko1?=
 =?utf-8?B?VnpWU2JITmQydUxkMU9UVEdqMC9MeXlWMkU0dDJWZjZxOHJXeDZ3cTR3L3Nx?=
 =?utf-8?B?T1U1NDI2bjFVcTVtNGVSNXVkdmpmanJSOENqWTNwVFVXV1BBTlFwWDhLTlhn?=
 =?utf-8?B?bEtwRlB1R3hUbXpSeTMxazc2LytvQ1h6MUp3cHp2czMvc0lVYlFlRWRMc29l?=
 =?utf-8?B?TkFsVnVCdlFSbVlUOTUzWTVGNGhwMWU2bXF1MkNXQWRTUll2MGtCOFZ0NlpF?=
 =?utf-8?Q?PGVIAdwjKBY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGEzeURFN3ZKNWlVK0FBbmlSaGNpVUtBU21SZzVZcWVNNDFDYW1uelZ0aHdE?=
 =?utf-8?B?VTdOKzR2Z2lFOXNzRjFaMlBvT2xWSXNSR3U3T0kzV2RkejFjazE2ZXZWeElM?=
 =?utf-8?B?a1JpZkVCcFp0UjlwWGJYRHV0WHFTSjVhWGZoaWp4eUdvYWU5TFhLbkN1N25k?=
 =?utf-8?B?aFpUTzdZQnhDSk5WSGZ1QkVJRTRUME1mR0g2c1QxdVVpdkNBNWFSL2t4a0tV?=
 =?utf-8?B?d3VOeTZxcFhRTjM4eWJUUU5GaVUreUExMEhNUy81ZDgvOU1zYVZjTlY3K2NE?=
 =?utf-8?B?YVpqL0s1aUhhS2IrRlBBK1FBT3BVcTRjenhHQVg0V2FRRDI0aWNuaHlDZjJJ?=
 =?utf-8?B?YUg2VzIzY090ZFhoNE9MaEZrZENMbWYwOG9KZFhuQXFoaXRVWlRlUmFVUkVY?=
 =?utf-8?B?N0xlSXFGR1NjY1V2K3k0eE9sQk1YR1hTNzZaUEkzdW5rRlFFZXZ3RlBLeE5q?=
 =?utf-8?B?TkVVTEFta0d4ZFpyMVRXWVRBMFgranNxdE5EdWtqRFBzVmRxWVJqWkZFMFdm?=
 =?utf-8?B?R0ZWRzlDQXh2ZzNkRVhMcGR0VmZqbThvUnp1eXd4NXNxQWlDQ0huU1Bpc0lH?=
 =?utf-8?B?VTZZRVc5LzhNMWNTTEh0MTlCQStxOHVFZFVaNTBYMUREVVJ6YmMyUTY1d1d5?=
 =?utf-8?B?NjNmTHlDQnJTcW9EZzBZUElpUmRKYW5vbTU3dkZxQ0FxWHVveDlxU1QvZURu?=
 =?utf-8?B?RjJsKzhOR3BPbDhmTUdaQ01oOEJtREdYVHhCZklRbmpQWmJZa2tVdkhzNjBn?=
 =?utf-8?B?ZGVqT2p5WDNIL3QvcVBiaUVoTVpiOVpMWjNCSTJDdUExYnBCdU01bzRXQ0Vw?=
 =?utf-8?B?cXZwb09VamdPaUNhNXgreENwVUN0NCs2UExrb1kySlJsMFVTREhhcW93a3FU?=
 =?utf-8?B?VEZsRWRQWXU3eE56aXpvcGRsSVpiTjZzajM3dm92NnU0TU5LVURxMlNUTFdJ?=
 =?utf-8?B?QW1XWTZuSlI5VHQvUmNRS2tjOGtXbmhDc0ZiUVI4YnJrQ3VacUxxQi95ZHJZ?=
 =?utf-8?B?ZjliOVdiTWRNRFN4S3Q3VTM5MktJWmE2YnFBME00MzR5eUVlKzNuVGNTQzdi?=
 =?utf-8?B?NDMxV3VTUGNKRDloRVFENFcxNjZaZFdqWDhRMi9xcDhiWTBMS1gxMndKOHJN?=
 =?utf-8?B?aXdIa3F4WUFZQW52U1ovcnFsTlRXaGQwRmdyZisydm1jbTZHNTUyYTdDWXZM?=
 =?utf-8?B?TVVnSVdaN0xGVGFpdTFkaGQvajVCaWo0cWFVRmJFalNxSjFHOWNXS29qS0t2?=
 =?utf-8?B?YzBIeHFnN0h2Q2k2Y2hGY3V1Nk9YQ1BPYmxsaVpnY0dTUWhScSthVXJYTW82?=
 =?utf-8?B?ME9Wa0dpUUk4c0RjdS92ZVB5dEh6eGNhcEJIeWYrK254SmRSbXFSMDI5TlVK?=
 =?utf-8?B?TDJrUlVTZitHTkRiSVNuVUFWN2hudmZ1cmk3dkFRcjNkcUptbTJHRE9KRHYx?=
 =?utf-8?B?bElMdWdQZU5RTFE4K25WUTN2dlh1eEFKWDJoMjNwcHpleW5YVVpSd29iV1lS?=
 =?utf-8?B?d2h0TmQrZEt1d2RYelh4em1IYlkvaUZ4cjY3VSt3R3JQNGFMa1Q4TWxzUnox?=
 =?utf-8?B?MzNHNG9CV3F1YUNnL21wN09ONVVMQzRkMDcxK2RtZFAvaGg2SmNBZ1AyYkFr?=
 =?utf-8?B?OVlORWF0NFFJTFMrWGYwcWdTNkxOVHZ4YlFpalVNejBBV2lxUWorUmRSOUUr?=
 =?utf-8?B?aTQ5WjBPWXN2VkFrbGxseW9IdjJzZWNxeW9VV3UycTFiVGkwVTNSQ1E1Mlcw?=
 =?utf-8?B?eFVIOUZBTWFVV1psZHNZSldhVW5wekJWdC9JQkYxVXhBZ2Q3SVdid3djTEN3?=
 =?utf-8?B?MkxiNFBEU0l4MFBWWlVDMTE2NkV6R3h0dXVxNnNWbDFJTkZ4c1ZnYXFXZWZq?=
 =?utf-8?B?U0YyVHM5ZmdxamJxRTJzUVFKd05IbnpwV0ZTWWwzd0xCQlYzTFlKa0VVbWtI?=
 =?utf-8?B?RmVkd2s1RVdoanB0NzNQMlRwM3RvamExR28vdGcydGtjekpqSEtwY3FCRk56?=
 =?utf-8?B?YlNoeU5MWU9rY1dOR3VMWEMxZ1duZStjR1ludjk1Mi8xNUl3RTlDSFNMTXFG?=
 =?utf-8?B?bWlIK0g4b2svQXBIdjdrVnVzWjE0YzFZMG5uUDV5a2ZVSlhUQmNxWGoySmxP?=
 =?utf-8?Q?mck291qwTV/TbJsfoVevmmTN2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bafe497b-2860-4098-0108-08dd8c67406b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 06:28:45.2894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gL6q+0t2XDF/u4Z+BjC7dqLQrZmy6BdD/bobHJrgghOHzATX1JcObydkNSvKlGmHTbOMOmDpXSUHNTisLMvFRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8709

Hi Nicolas,

On 2025/5/2 1:02, Nicolas Dufresne wrote:
> Le mercredi 30 avril 2025 à 13:39 +0800, ming.qian@oss.nxp.com a écrit :
>> From: Ming Qian <ming.qian@nxp.com>
>>
>> Applications may set data_offset when it refers to an output queue. So
>> driver need to account for it when getting the start address of input
>> image in the plane.
>>
>> Meanwhile data_offset is included in bytesused. So the data_offset
>> should be subtracted from the payload of input image.
> 
> I think you should revisit this commit message a little in the next version.
> While the overall patch looks good, I believe you forgot to add code to verify
> that addr + data_offset still falls within the HW needed alignment. I don't
> have the HW documentation for that chip, but I have never seen HW capapble of
> handlign random alignment.
> 
> Without the data_offset, the data is always page align, so we don't usually
> have to validate that.
> 
> regards,
> Nicolas
> 

Thanks for the reminder, the mxc-jpeg codec requires addresses to be
16-aligned. I'll fix it in v2.

Regards,
Ming

>>
>> Signed-off-by: Ming Qian <ming.qian@nxp.com>
>> ---
>>   .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 42 ++++++++++++++-----
>>   1 file changed, 31 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> index 1221b309a916..035368d65913 100644
>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> @@ -587,6 +587,27 @@ static void _bswap16(u16 *a)
>>   	*a = ((*a & 0x00FF) << 8) | ((*a & 0xFF00) >> 8);
>>   }
>>   
>> +static dma_addr_t mxc_jpeg_get_plane_dma_addr(struct vb2_buffer *buf, unsigned int plane_no)
>> +{
>> +	if (plane_no >= buf->num_planes)
>> +		return 0;
>> +	return vb2_dma_contig_plane_dma_addr(buf, plane_no) + buf->planes[plane_no].data_offset;
>> +}
>> +
>> +static void *mxc_jpeg_get_plane_vaddr(struct vb2_buffer *buf, unsigned int plane_no)
>> +{
>> +	if (plane_no >= buf->num_planes)
>> +		return NULL;
>> +	return vb2_plane_vaddr(buf, plane_no) + buf->planes[plane_no].data_offset;
>> +}
>> +
>> +static unsigned long mxc_jpeg_get_plane_payload(struct vb2_buffer *buf, unsigned int plane_no)
>> +{
>> +	if (plane_no >= buf->num_planes)
>> +		return 0;
>> +	return vb2_get_plane_payload(buf, plane_no) - buf->planes[plane_no].data_offset;
>> +}
>> +
>>   static void print_mxc_buf(struct mxc_jpeg_dev *jpeg, struct vb2_buffer *buf,
>>   			  unsigned long len)
>>   {
>> @@ -599,11 +620,11 @@ static void print_mxc_buf(struct mxc_jpeg_dev *jpeg, struct vb2_buffer *buf,
>>   		return;
>>   
>>   	for (plane_no = 0; plane_no < buf->num_planes; plane_no++) {
>> -		payload = vb2_get_plane_payload(buf, plane_no);
>> +		payload = mxc_jpeg_get_plane_payload(buf, plane_no);
>>   		if (len == 0)
>>   			len = payload;
>> -		dma_addr = vb2_dma_contig_plane_dma_addr(buf, plane_no);
>> -		vaddr = vb2_plane_vaddr(buf, plane_no);
>> +		dma_addr = mxc_jpeg_get_plane_dma_addr(buf, plane_no);
>> +		vaddr = mxc_jpeg_get_plane_vaddr(buf, plane_no);
>>   		v4l2_dbg(3, debug, &jpeg->v4l2_dev,
>>   			 "plane %d (vaddr=%p dma_addr=%x payload=%ld):",
>>   			  plane_no, vaddr, dma_addr, payload);
>> @@ -701,16 +722,15 @@ static void mxc_jpeg_addrs(struct mxc_jpeg_desc *desc,
>>   	struct mxc_jpeg_q_data *q_data;
>>   
>>   	q_data = mxc_jpeg_get_q_data(ctx, raw_buf->type);
>> -	desc->buf_base0 = vb2_dma_contig_plane_dma_addr(raw_buf, 0);
>> +	desc->buf_base0 = mxc_jpeg_get_plane_dma_addr(raw_buf, 0);
>>   	desc->buf_base1 = 0;
>>   	if (img_fmt == STM_CTRL_IMAGE_FORMAT(MXC_JPEG_YUV420)) {
>>   		if (raw_buf->num_planes == 2)
>> -			desc->buf_base1 = vb2_dma_contig_plane_dma_addr(raw_buf, 1);
>> +			desc->buf_base1 = mxc_jpeg_get_plane_dma_addr(raw_buf, 1);
>>   		else
>>   			desc->buf_base1 = desc->buf_base0 + q_data->sizeimage[0];
>>   	}
>> -	desc->stm_bufbase = vb2_dma_contig_plane_dma_addr(jpeg_buf, 0) +
>> -		offset;
>> +	desc->stm_bufbase = mxc_jpeg_get_plane_dma_addr(jpeg_buf, 0) + offset;
>>   }
>>   
>>   static bool mxc_jpeg_is_extended_sequential(const struct mxc_jpeg_fmt *fmt)
>> @@ -967,8 +987,8 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
>>   			vb2_set_plane_payload(&dst_buf->vb2_buf, 1, payload);
>>   		}
>>   		dev_dbg(dev, "Decoding finished, payload size: %ld + %ld\n",
>> -			vb2_get_plane_payload(&dst_buf->vb2_buf, 0),
>> -			vb2_get_plane_payload(&dst_buf->vb2_buf, 1));
>> +			mxc_jpeg_get_plane_payload(&dst_buf->vb2_buf, 0),
>> +			mxc_jpeg_get_plane_payload(&dst_buf->vb2_buf, 1));
>>   	}
>>   
>>   	/* short preview of the results */
>> @@ -1827,8 +1847,8 @@ static int mxc_jpeg_parse(struct mxc_jpeg_ctx *ctx, struct vb2_buffer *vb)
>>   	struct mxc_jpeg_sof *psof = NULL;
>>   	struct mxc_jpeg_sos *psos = NULL;
>>   	struct mxc_jpeg_src_buf *jpeg_src_buf = vb2_to_mxc_buf(vb);
>> -	u8 *src_addr = (u8 *)vb2_plane_vaddr(vb, 0);
>> -	u32 size = vb2_get_plane_payload(vb, 0);
>> +	u8 *src_addr = (u8 *)mxc_jpeg_get_plane_vaddr(vb, 0);
>> +	u32 size = mxc_jpeg_get_plane_payload(vb, 0);
>>   	int ret;
>>   
>>   	memset(&header, 0, sizeof(header));
>>
>> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
>> prerequisite-patch-id: 0000000000000000000000000000000000000000

