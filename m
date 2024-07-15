Return-Path: <linux-media+bounces-15024-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDFC93149E
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 14:47:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8C8CB217AE
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 12:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3719A18C338;
	Mon, 15 Jul 2024 12:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="mUeMBDg7"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020129.outbound.protection.outlook.com [52.101.69.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10ED4291E;
	Mon, 15 Jul 2024 12:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721047648; cv=fail; b=pirNuTdpZRpmYar8PtmXmur89+Uh6aHwARvQDrGSl75dHPO9WQfTkUtie8XxULEGqzjL4QNk7dQEHJXEL4kykmP3ATbUzsm4gpwM25qdQdYTC4fIWYPGBblhJPCLWqPvbX9ZsTK1Bc8m8IPbLf594r5wE9wWonMJgHgkyxQgWuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721047648; c=relaxed/simple;
	bh=tf7uXB/AQJXk3ctWF3GX4e98gV19bM4B3zb9mMUKnIA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aRByggAkdqJd4Apz/PMfe2zmM8tyc8DBMkkzwcIqMNNF0s9lI9rx4m//qMJnPafsV44trp5HmeMgJ1bPzwxhgsYJLPLCnV7179IMG4LSxmW6kauu2wu5FfMWIwfVACPQBo7wKxtAi3k10GHOnEqLpG1MmnFYSpF6P/L7lVBGxw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=mUeMBDg7; arc=fail smtp.client-ip=52.101.69.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W5N5Vwbo/IAI46yCZPdAi4uvzKu/7nJfIWhGBVlTxCLaSB3UGn2GEGgMxxop8PlsyMYHRpZGf4CX+ma1ZgtJWkGWiXeewp9WpJLb3p+aXuLWtppB0J/M5S9LEEV/7QWSoxzU+RaQE4P0xoCAJ30jDIs6ozFq54vVpHb5S598jcrZC7Q6lr9VJaOBtAcpOFVnHpjgytjs2OZgJ7BBbZ/WuOUt0Fb59QN+rqpW6wlwClWpUIarNqbC1rFwV3OF+fRoue61Sf3w5r/AXVOjNDdg37kyslEx/HRWD5vdsJtr8hKOXGkItYAfSJAdxIHYnGvLRSdFvoXztR9t7U/6FPC1rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7GdJr33zHzyeogkCPTsigWJ9HINu1o49WqSZX5Wp8BE=;
 b=nw+/gEPYoPtlvKRfKuOc05SC2sPPTc2nNWSae8guWl8rhidOPh8u1iwQ68xwgYdKm20e1OUHTvLl3LXEzwrbw/eQo/mfKsPNbxRXIKmQ0+E8fOuTo6jV1qnAGcDEtaXBdlUBpyXt+MRygKMg9+vkCVo102ErAqDoqZ/sd+t/ph1MXQcYpCLwtu4vaAJfGqmMXyqCUCWFlYDPH9HGB2Y958gobcE+BUAa8ICX7eggCqDF/YKKst0S5mqs4Br0QrqY0roPK6I9meymTta1gA1cyTmUKr9pTriYKDXkQTYjAdyvNYudVgg83qctxU9HctSocB+t8PMBeI/d6kbuvTj00g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GdJr33zHzyeogkCPTsigWJ9HINu1o49WqSZX5Wp8BE=;
 b=mUeMBDg7VHspKHMrNRR2HkG8OEbea06sTAv/51+wkQMDSiItiQEVFkmqxVvl8Cyu0kMCd47yvoQlumQMZ+vwe3133TzRu8yllTZgCrcE8Nd+ziMtuZq5nYotdwyGDEdnvHOLKG2IvmRRmRz4TtV6IUbi9CtByJL4icO/qA7ADbc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB10149.eurprd04.prod.outlook.com (2603:10a6:150:1c2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.27; Mon, 15 Jul
 2024 12:47:19 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.7762.020; Mon, 15 Jul 2024
 12:47:19 +0000
Message-ID: <37877d57-f0c6-4985-b907-d23204a29b1d@cherry.de>
Date: Mon, 15 Jul 2024 14:47:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: ov5675: Fix power on/off delay timings
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Cc: Johan Hovold <johan@kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20240713-linux-next-ov5675-v3-1-527f5b985836@linaro.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240713-linux-next-ov5675-v3-1-527f5b985836@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB10149:EE_
X-MS-Office365-Filtering-Correlation-Id: c970dabe-0189-45ca-1074-08dca4cc4392
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SGpvcUo2SXU0d2hrSnJMOVBTczFpTUxNQzB4eE1IN0tLeEhBcms4M0dxMEdo?=
 =?utf-8?B?WG92Um4yRWlhcmRheXBUdGFHaldrYVJSTmhCRmR1NWczZ2dnMEVmNjdmaUd6?=
 =?utf-8?B?Q05zTU5XTkRlYmxsbHVBbXkybkhPa0xSYy9iZmszeVlyZlVGSHo2SUhndzNP?=
 =?utf-8?B?Y1ZGb29EcjZCYVBRSENPaVU1QWozR3BKYTZPRW1Mejl1L3dLU2VHYmhsZHJx?=
 =?utf-8?B?ZitGeFBqWks0UjZUZlJRa1ROUHRVTHRhK3FsblVKY05LTzVNZ1pQajhEaHk5?=
 =?utf-8?B?bVZoL3BTQ0hqQ003ZjlHL2FsellWWVBmL25yaHBlU3Q5aXhmdklwNTBwVjE3?=
 =?utf-8?B?cm9QRS9WY0JtTWFoVFpoSEFReFplT3NpZXNEYmFlWHoxaVFTS3NvMVZza0Ja?=
 =?utf-8?B?d3VpUk41QzU5Yk9RMnBIazRSck13L1cxMXBUaHE2NEZrWkhENytVcWJOMnRU?=
 =?utf-8?B?TlN1cDZ3bWphaEhMK25remkvQWpvZmZSM3pSdENLSEppQ3NqdnpXc3JoMUV0?=
 =?utf-8?B?ZjZ0Wk5vOFpTUWhwenBEZ213dGQxWkUyd08xeVpTVDN6QnVRbVNHZjhWK2x6?=
 =?utf-8?B?Y3Z1ZnQzczFJVG1OeHB1MDFyY2hWa1RJSjAyOUlCUHljWDFkaHVNbkc2cmZk?=
 =?utf-8?B?eXkzaDdUMWl5SVBURlFyRWp3bkF1Q0l6WE5aelBYUzhaWEtTbHljZGtxaGVD?=
 =?utf-8?B?Y05zVkk4VzF0OVlBeGw5L2pSTEpTTS91NEZQRnRVY3lGcWJIamwxQnY3bFRB?=
 =?utf-8?B?SS8rN0tlQmNWekZPaTJMd1NGUWlxcU9La0M5NW1WSHpMUStRangrOC9OTG9y?=
 =?utf-8?B?RWc3Tk41cFg5dkFnWk1mdUc0R0JHZmVLVDZRREdvT01ZN2pTQkowUVlhTGpH?=
 =?utf-8?B?TEk5WEZvbis4ZDJLNHZwMU41L1h1U01LdW5QNSsyVVROMFU2Q3VHVWE0SXdK?=
 =?utf-8?B?bk8yQkZ5TmovT0lSRitQVmxOci9USFhvQlcyKzlrMkRCcnIwMTBrOUZLR2VX?=
 =?utf-8?B?QjBTL1hKR3RYNk9OeWViejRJbXJQelBESVJpcTNIWVdla0N2aFdtVXYyTmZz?=
 =?utf-8?B?cThLbVcrMXl5UXhqMTI2M1BMODVyN3lIRnd5M3VSZ2tIZ2ZNK1dEUldkZ05n?=
 =?utf-8?B?UVorNGVPTXV5bGpUbmtYa2t6UGd5UnFCeG8rNFJGQ2dmN3lBTUUwOWJCMjZ4?=
 =?utf-8?B?YlpiMm84aUwrN2FvK3BqTDlNL1ZRbGJxUkNicG8xQUh6WlF0bitLbFExZE11?=
 =?utf-8?B?dUpxcy93TWw3QzE1ekJjN0F3UExmV3hKQk40RXFRbTUvTGN0Y3lybVIxN0xa?=
 =?utf-8?B?NVR4K2tuNHFKaGhBOFpDaHJTaVB3UHlxU1ZWRSsveWdEaGFnVW04UlRNcGhh?=
 =?utf-8?B?d2RIR3dOTlJpeWFDNjZ1dEtKZitqUFZKNFQrNk9zTTlHNVJSNUJ3OGNESjFR?=
 =?utf-8?B?ZXMzdDZaRXdUbFY5UjhZbEU4aE9zY3Nna3NFbnl2Ym1FK2NKTHE2ZTBReTRB?=
 =?utf-8?B?ZGszajNFbXY2U0hkd1M4b2s3b25mMnUvZ1o3V1hqUnF6cTFlYk5uVlA2bm1s?=
 =?utf-8?B?MjZxMXVHZmdsVFNNNTBoTk9OUlVSdkhtVnczTjU3UUNRbW9sNEx2Q2FsTjBS?=
 =?utf-8?B?TUhMclJWS1hzR3dqMVI0R2xZWXYvSUFBbzZKN2Y5bWNPU2NPRmFkREt2dmlJ?=
 =?utf-8?B?cjkxcy9vaEFVQ2pyWmcxbEtWM3ZZZmk2ZERaZzN5Qng1amdscklLaElLQ2tP?=
 =?utf-8?B?RFM4R1NCaDdTam9IVm04WVI5Uzh2bHpqZGY3ZE1JUHZLczFDZERXVHN5dmFW?=
 =?utf-8?B?aCtwTFllTCtlSjI2T2JCZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFphMGlkbFduRFlUU3VsWENlUzhTVXZMRHBJQUgvWUhTWUZYVjlucWtMOHRP?=
 =?utf-8?B?WnFJTFdnNTVjelE4R0NlZTFXQnVPZm9zRFBXTHVJOWp4WmNIQ2UwVE1Lc0lT?=
 =?utf-8?B?Ujd4dUNNV1k2OGRrNG9wcmg2aThudEJMM0RScjMvei9CU0g0MDdnS2dhYW5p?=
 =?utf-8?B?aTdGRWJranUzNC80dENhWXZpclFuNmJvRmVlNnNWT2Rac2cyeHJiOWExbVdY?=
 =?utf-8?B?UjZzRDJXckFFUXBSYmRHOU1TYUl5d3l2WEpmTnJEdHJqQzBWN2d5UjJ5ZWZh?=
 =?utf-8?B?bUg1cTYxWXE4L3ZkRC92alpxRmY5OGZSa1B3T05POUppcWMrdldTVDdGNUdZ?=
 =?utf-8?B?cmFDUlhGeGpHVTZFbXA2UHF1WkpyYjZsbUc4dm5STzlWSmxQVmFHQ0pQcEgr?=
 =?utf-8?B?SHRSTVljVFlPbjd0WFRNcmRZbVBZK21SR1Z5K1JLZyt5TTMzaVd6bGdxL0JX?=
 =?utf-8?B?cjZzVkJaWGZFWGxsZUJaMlF0VnN5QzV6L3FRclFjeThJR3F5WEhURmNwRWgz?=
 =?utf-8?B?SjVnd2hXRStmSWJ5VUFnVGR6SDU5ZVZZQ2lyd09kVjJXR2M5ak5jeUtSc2k1?=
 =?utf-8?B?OC8zOUwzOTFzeWdabjFIZmQ5NEtONmJRWGhUQ2FDMEFxcnhYR000Mkt2Q0NH?=
 =?utf-8?B?clpxMGZkTzBSRW5DSkY3RGkyOG50SjBna1hiS0U3YURPOGhWNm1qWlovMnQ0?=
 =?utf-8?B?c3RZZ1dRanBQZUJOM2swVHU0Tnc5VFc3ZS9RSjk1S3hNMk9rd3RZL0V0STk3?=
 =?utf-8?B?Q3NtVllhWVJlUUlYTFE2SHlhbUVSU3VVaENzOTdQZGFWK0ZEOUNJOFVNZmRF?=
 =?utf-8?B?Tm9OYTdzaVBzZEIycC9lUkNFZWFuV3BLaklsdk11bDlPUElPVlFwZEFud3Fa?=
 =?utf-8?B?eXE2RDNmS1ZOYy9vRkJwOEY4WXlHbTZVUHhrWlhSY2I5a1k2UFF4aWNITWNH?=
 =?utf-8?B?Ui92eHJqZVJHYzY1blhwbXFNdE1NRmp0bGYyRkdWQThNZUdORzVVaHNpbk5D?=
 =?utf-8?B?REdEUm5neUVUWThmWnlhWi8vYXp4ditSRjZlV0NoN1BPWlV2VkZ6aEJueXlo?=
 =?utf-8?B?dHZ4bnBpN1hrbDlDeUNIRmJyT0NHOXlBVHlCUkdjS0NIM2pBWjBMUEI4SW82?=
 =?utf-8?B?NjIwdGhyeGJLMTFJTjhPSzNaQ2U2SzBZZ01COXoxSm1tUGIxNVliOTk4ZkVQ?=
 =?utf-8?B?VC9qa2ZCYU5CY0xOUGk1N0xtZkl1b2RoZFNLRGUvNmZkb0doUDIyWGFhOXFr?=
 =?utf-8?B?Y1M1ejk5Nk9TdHdtNEUzaDEwT2F5Y3JjdDI0TFZwUUhIZXRUeWQ5TkJKWGEy?=
 =?utf-8?B?aU1oaDFUdWJrWWg2bVVSN1IwNko5UkZ1eFpKWG9iSFFLcWljRDZORUp2SUZM?=
 =?utf-8?B?d0tQUGlkUkxZbC9SU05wdnVBUGIyVXFxRmxESTRJVC85aEd6Yjl2Z1dzZUZw?=
 =?utf-8?B?S0xLYzlQUWhwTlF6TVVWaGV0bmRIOEdmdG9HNmt5M2phdUNyN0ZVRGpiQ1NI?=
 =?utf-8?B?UUR1VFV5SXZKQ21WTmNCc1BpM2Z5c0hBZjlFMlZtWXB0dmVUR2RSV3JWRWc2?=
 =?utf-8?B?Sm8xVFFWNDdoQ2dlSFk2RzRYc3hyMGNJU2tSN0hiMjJHYUpJYzVuOGZqbjA4?=
 =?utf-8?B?b3prOTl4M3hiYVZIK0RkTkcwMGdhZkptZSt5d0w1ZFFXWWhDSWhQcmRmYnFa?=
 =?utf-8?B?S3BTNmhDOGI1SzJsaXMvNWVtRW9zcStCcUQwRjA4MS81ME9iYmh6dmlxdm1p?=
 =?utf-8?B?NW9McEliWDV2U05QVnF6bm5kZ1h3N2J6MzVvckFLek9FZ1pRdU5TUi9Yeis0?=
 =?utf-8?B?OFR1b2JVRkhLTDRha1FEcFJmUzhGTmJ3cDhyQnVmWFdMdStJQ3Y2WEJ6Ymdl?=
 =?utf-8?B?OXR0ZXRVejJxRVVoWlRNUlU4TlJSUURROStxSXhubjdtbnR0bWRGU0kwRXRz?=
 =?utf-8?B?ZXpCY1JOZy9FWU9YWFU2b21TYVExbEZqU2IyS2Z6MUg5YTcxQkRGdG9RdGhj?=
 =?utf-8?B?K2haZ2VzKzREd1g4RFcwYTA4bitBeUpHVVlZQ2k5Z2VhRkJLQnk3WktzZ2tR?=
 =?utf-8?B?aXNqNFcxSnNjMjkzTE55SGMrZm81TlExRmNwdmh2WmtkQ2xjbUdLSFZIYzVm?=
 =?utf-8?B?bVVHaytaRStMWUdwVUpBa0hPNnN3OExGcU1PVEJCaFBaNTZtdlVrMi9ZUTR4?=
 =?utf-8?B?OGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c970dabe-0189-45ca-1074-08dca4cc4392
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 12:47:19.5212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F9z15EQFrpf00ytHOCV9DE6KimXh1+5C/rjxE+G7igFWsQVwi9K9v4IYpdPyD6EKYmu5ByPwmudldI3iuTfx6aO3F+NGG9D3NvEN+SaLwA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10149

Hi Bryan,

On 7/14/24 12:33 AM, Bryan O'Donoghue wrote:
> The ov5675 specification says that the gap between XSHUTDN deassert and the
> first I2C transaction should be a minimum of 8192 XVCLK cycles.
> 
> Right now we use a usleep_rage() that gives a sleep time of between about
> 430 and 860 microseconds.
> 
> On the Lenovo X13s we have observed that in about 1/20 cases the current
> timing is too tight and we start transacting before the ov5675's reset
> cycle completes, leading to I2C bus transaction failures.
> 
> The reset racing is sometimes triggered at initial chip probe but, more
> usually on a subsequent power-off/power-on cycle e.g.
> 
> [   71.451662] ov5675 24-0010: failed to write reg 0x0103. error = -5
> [   71.451686] ov5675 24-0010: failed to set plls
> 
> The current quiescence period we have is too tight. Instead of expressing
> the post reset delay in terms of the current XVCLK this patch converts the
> power-on and power-off delays to the maximum theoretical delay @ 6 MHz with
> an additional buffer.
> 
> 1.365 milliseconds on the power-on path is 1.5 milliseconds with grace.
> 85.3 microseconds on the power-off path is 90 microseconds with grace.
> 
> Fixes: 49d9ad719e89 ("media: ov5675: add device-tree support and support runtime PM")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Doesn't seem to break my camera on RK3399 Puma on Haikou with Haikou 
Video Demo adapter, so:

Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3399 Puma with 
Haikou Video Demo

Thanks!
Quentin

