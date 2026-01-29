Return-Path: <linux-media+bounces-51758-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIEKBye7emkr9gEAu9opvQ
	(envelope-from <linux-media+bounces-51758-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 02:43:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 88016AADD6
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 02:43:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08B423015850
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 01:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7D6D31AAA3;
	Thu, 29 Jan 2026 01:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="k4x1B+in"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010055.outbound.protection.outlook.com [52.101.84.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B63194098;
	Thu, 29 Jan 2026 01:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769650977; cv=fail; b=fqIJVWE4pJJ/L7k1sMEM/u73nNtZoqBo5wcnaM+MI75ooMhLK0pB4sfNDVdeE1oV5eRyhtOjclK1IbXpzBQ3SU6LyrhhWRRrfQkfOyUb7BUUHfTwFqO1AYy1/LLzIHr4nvuDRDaYLwjLBI2XtHDgAI6e/jayqh+pCoety8teLmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769650977; c=relaxed/simple;
	bh=OY6gxa8ohFC6sU3lLrX4Bl25FZ8HbFwlW8Gvim9SrAs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NNB36x/RoOFUJZgaii5votU+AwnFlLRa6pKjeHe4G60i4rpxD6VuXvXMouCff3uMzW7Ekm1N9BrHcJzcF8js1GVXyVUulMWqsZwN7ZIlhOZhdEwMJo+vS5FQHu8QqMbRdDZ6OL+6reuCkw78S6d++KtJOHIts2EvBaX4Hs00Y/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=k4x1B+in; arc=fail smtp.client-ip=52.101.84.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FrvvvFQ/z3qEYdcTpw7k+mdCMOXY/Irv6bL5DayDvMg7zsiiprdz2mf7yCBf1sDUQxavnILLojzu5Sx/jBenCCPj6fKmtHkQXyUjVhXBtes9xr4gdeSMkQZrtmcZabep1AkJ9YjlBpragh52nAhXfoPCT6LemvdAsGo902vbA58DI8yQV17t3sW/wktt69gUAvF45uIwh9MiTqnugh/nQDEMSPcR33K9wnZJWNgKCtOOcmjrKc0cug/Faz8tIYZEZMD3HzoPOWWoxLOpaeJYcVRwlMpmYBTS7K59H3ZFkRtIOKyUvaeR0F72mnCDGyNfLfDCrgyDaWX/qFCzX27zIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pq9/2KmejWoLXnm/4jAmuYEqfEppzMVl7cHMVK7fxyM=;
 b=f+tloxguOs8mS2C3KIb36RTP6qhL7l+Abe2zBuv3u2rR0xjyX9vOoysk6lfhcs9P349wEdkrw2EBq2G9bBM9c1e3Eb+b/uhHFUMwsk2/xQ/SsiaiPUd9gh0+0NgPOvgRPIEykNIQUPASIbWUytzz5wpPZ8q1UTQOZfofha7pmY5P0Dl7SPM/sx910EuFiIKx9skeC5l4S7E3n+jQTF/Rhjywro0dE8yYaU6Ortj4pegPdVK0NJKWpHq50JG5m+LaYj10CAOXtR1Z31p5riuupFXDTgbJTCPlEeSGG8ppSCCkR5mr06MhPmsvgpV1tXWTngR/zphMXkljv+Q2uY3qqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pq9/2KmejWoLXnm/4jAmuYEqfEppzMVl7cHMVK7fxyM=;
 b=k4x1B+iniE0HzIZhwK4/9nebI3sBuL4pqFwF4NhyUN2O2oZJfdrL/XbFqWEyDcN26sDZsIfpNxwZBJ8wraThXntGVwuFxeEWbPfQkwPs22caY7ImHur3o5oJYOCTEAM0cR3dtuHLWINJUcT3HJTYuw/e9c4WNtbG3rusuane6YNU8Z60NbQWxaDmE9dRlVMtEx1r5YSEUK4Q7YPJHeC9xr5tpEXqnaby2n1f9Ljz2WsBL+V8j5fDHYtlmQTaX/syMj7nmQ4BEkJaq07mqKpobeC6112sKA7J4RzXFR5uZ68EPNrrYMdy+393wH41UPgClJPoVIHriU4BCky8ExPCgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AMDPR04MB11617.eurprd04.prod.outlook.com (2603:10a6:20b:71d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 29 Jan
 2026 01:42:50 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 01:42:50 +0000
Message-ID: <69a3d328-748c-445d-bcbd-823b5b314543@oss.nxp.com>
Date: Thu, 29 Jan 2026 09:42:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: imx-jpeg: Add encoder V1 support for i.MX952
To: Frank Li <Frank.li@nxp.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, mirela.rabulea@oss.nxp.com,
 nicolas@ndufresne.ca, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, linux-imx@nxp.com, imx@lists.linux.dev,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260127073702.1782-1-ming.qian@oss.nxp.com>
 <aXp2CHEX+YCHogjW@lizhi-Precision-Tower-5810>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <aXp2CHEX+YCHogjW@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0070.apcprd02.prod.outlook.com
 (2603:1096:4:54::34) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AMDPR04MB11617:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a05b6dd-b373-47cd-f959-08de5ed7b597
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QjNrcGVxUTZYT3N5Uk5yeFJJRDBjTi9zbWdZbXdmLzlKT0N3blJrSFVpR0hN?=
 =?utf-8?B?SVZxa3VwVlJOTVJkMWJuY2luZDFMSFErSWJIbTVlU053UnVYWDJ1SFRmclIx?=
 =?utf-8?B?RkViM1NUYkcyVkIrMVFwTC9LQnE3M043dVMxcDExVzRPeHBhVkZDdnVheXFB?=
 =?utf-8?B?MzNuOCsxWVF3Sm5DTGF1K1BmR0wwTDkxTk55K3ZSeVNRQ29ESC9zR205TGY2?=
 =?utf-8?B?azZRdnJOVWV2UmFrbTlmQW5kbDBaQm1aSUdWK0JLclJVN3BFbERjS3FlYUxF?=
 =?utf-8?B?c3ZqeU5nZ2g2UmJ1NGU3ZDZDdXpLaVltRVNVc2k4ZXpzb0lpNkFNS2UzUm9G?=
 =?utf-8?B?Y0VabkhITGlXQ1pmbUdqbWd6VE5yNEtrdzRlTVpWZFc4NzNBdXUzZXQ0aXFo?=
 =?utf-8?B?OFplR3orZ0hVY0lndmZOcE9kUks4WnpCeEYwc0JZU3Z3RTRlM01kSVU4UXZy?=
 =?utf-8?B?b3czVlRMdjJKOGlJM29FdllDUytTM2pESTFXOGdPSUVZd3drMXlzdXJqMXVB?=
 =?utf-8?B?T2R6bUh1bC9oSGhmNVg1Qkd5a2p0M3NOVlpGb0gzNUZ4ejhKNmRPT3RZWEdk?=
 =?utf-8?B?MlNncDVCbHhlbUg2aDhHczN2MFIrUXJLUzdDZERIaE5lMW5aQVBNWUVua20r?=
 =?utf-8?B?d2dwY2cxOVloNHZsYlVuaTRpSU4ydmhjRzJiVWpiUUdPQTRYY0thNVFyUml4?=
 =?utf-8?B?YXdjREwyWWhNclBKZ2xqcTdKQmhoT2N2Rk14S0kvNGZaSWZtQjdoL1BFSVUz?=
 =?utf-8?B?STMzay92dGVhSzZTZnZDOGd0RVBsZWIvV1l0b0VLWHZXN1Iva21rTmRsVVEx?=
 =?utf-8?B?dlV4Q0hCZkhvRlRmRDhRbnE0QkVCeUlPdlBsOUZEZFpsaERYbXhnSnNaZWE0?=
 =?utf-8?B?ZzNMbkdQdU5PUVdsY1ZHRENGTE9rRlNVdm05THNLNmMwRDV3YlhJZzI1WW0y?=
 =?utf-8?B?aitGYWRUWU41aHNDSStkQWxZOFBDSWg2MHVIYVo4enpKQ2orcmJlQ0ZYRVZn?=
 =?utf-8?B?UnEybmx2NTViQTdldTB1aElOa1ltWVpEcFhneC9Cd0s2Yzdkc25yZTBEUHNU?=
 =?utf-8?B?WDJhdEdpcTV5eHNDMTV3USt0WExwdFRyZHhLV0NpLyt2N1JjcGRsZnRrdEgr?=
 =?utf-8?B?N1N4UkRRVUlDS3oxcEVmd0lZMXMwdFQvUmoyNHBnUStXMnRaMzIzTE02Y0ox?=
 =?utf-8?B?cnE0TnZtNFFKV1M1WXFzb0o4NmF6SVJ2a2pqVks1MTFCUktvRS9CSzJuOVFo?=
 =?utf-8?B?QUdNdTNxRVUxU0o1RzlFWFk5MXl5T3psSWNSbzE0RThJY2VSY1RaVDJ3ZlU2?=
 =?utf-8?B?V0M5L2tjUXgxSXRqcE5uc1hUaEdlclVpbndqeHRJMUFHVkIzUlhoUkVFaU9B?=
 =?utf-8?B?TnpmTkRrR2wwWGxDYkdMWkJvWEZRUG5aS2REekpkenptZExPUWQzODFBZTUw?=
 =?utf-8?B?YmhaZlhNMi9TMTN2amxNYlFmaG9YcisyTVEvZUh1WVJhTjRoYWN0aGhlSXky?=
 =?utf-8?B?M1paMGpNR2tSd2VEb0s4ZmhiZTd2dEZYWTRHa09DK3RPZFZ3SU5FSDNlSjFS?=
 =?utf-8?B?bll4TUxsNWxXbTJGSTB3V25DMzZRQmxzWjFUYWxuWisrSTBDR0pWeWhOdnVC?=
 =?utf-8?B?RWhwVlZrbmNvREtYN3UyNFBOYW1qYVUxa2tMazVNQnZLRGtRRkREMXpRcnEr?=
 =?utf-8?B?WUtwdHJ1b0VTTEpDNFp1N3Y0RXVXc2xmNnRYeUFDRzkveExGVkI3Nzd6VE1S?=
 =?utf-8?B?Y3o4MmJOZjdQQnI5Yi9ITE5Bam1yZ0VnQURncVhCQ2dCWWtoeFcwR0lpbTJZ?=
 =?utf-8?B?ZXdHdG1SbUpuYnJJb09za0szWVkxcUJwWlVjN0VObWlTRmxNc0pFUEtBaXRE?=
 =?utf-8?B?cis3L21pWU5pMjVVaUVzcjQwZmhFWU5qNmJxeWVibkxhYVdUVGVPQ2M1Ym0x?=
 =?utf-8?B?ZEVVQUJSSjJHbERqZmpGM1NDUmVIRDhZUml3eHVGSENHQzY3NHVmTEk1Q1B2?=
 =?utf-8?B?dndFaHRHZEhYaTMzM3kzOEVpT0FKMGhNYm42Q0s3RlNaV1o1ZTB6VWtmajN5?=
 =?utf-8?B?cUVXSG5Jb011TkZSeFNpU2RNT2prNmUrNzZCcWF2dkdiL0U2RkppUWNZcGFz?=
 =?utf-8?Q?PDsM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTRIK3JaWTR6Y1l1QXg4ak4xZ0ZNUzFCQ2Q1SHhuenJzZk5pSERCR2hLSFFz?=
 =?utf-8?B?Y1pHR3MvcXp0b3FBbW9ndWs5dVVrTnJ2R3FkMEQvS1ppbld0ZFlPRitXU1BS?=
 =?utf-8?B?dnliclU4K0FLOXZNaXNVTjZWb1VDWWpyWVM5SEYzTVJmNUt6Yk9Yb1JrWUMx?=
 =?utf-8?B?bCsyblluVEJ3R3d1R3R1U2NJL1k5SnkwYmtDaFIrekJibm1BaVZCR28rektJ?=
 =?utf-8?B?MERwVzhEODFZYmFjSmZMTXBZeGJNckRIUU5QZ3NuNWJLZTUzbGUxcmprY3VH?=
 =?utf-8?B?d21vWU82YW5KdVB5Tm9ITkxjR2NhVFE0RlpTYU5OdWNPdUxDSFlTV0VyTjJY?=
 =?utf-8?B?eTA2c1czVnUwSlhaQ0VvamZvbjBuSUNCVXV3ajd6UUxIWUhmWCtKQlY1bUVa?=
 =?utf-8?B?YTQrbHZHRjM3WkVPY2puSG4xb1RJbUNTejVSVnIzVVhDSUV4dytlMFlqVWNE?=
 =?utf-8?B?T0Npb21vbkNNTjRVN3BDU2tKZlR3dG1rTnkxeWlNSTRQU0NtMzQzM2NtQnRX?=
 =?utf-8?B?aGZHREJlNkt6NExId2NOU3BTQ1BSSzdJWitXb1g5VWdCcjdBOFlkalVlZ05o?=
 =?utf-8?B?NkJoQ1A4czIvZExQUm94VFI5a2F6Q2FCd1IwMG1zdFMrLy85YmVMdWJyNGcz?=
 =?utf-8?B?am9uK1JZNGZCVjFVNTA5TlRYZFYvbEk4OUcza1RmY0dabldwVXF0a0VuVzNG?=
 =?utf-8?B?cWZSU3ZjTlk3eWdHRjB3VTJNNHMzOU12OGlWeE9ZL0UrK2NaRCszU0plY0Vo?=
 =?utf-8?B?L3laREZ3ME9JSElRR3pMZUN3cm1ZVnY1K1FYdlNhWFQzK2tOY2w2enlyaHNX?=
 =?utf-8?B?ZFlxREprM2R3NTdtRW5LMDdqNGdhbWtHZVVTUitXS3BKODdqVlhON0pseGdZ?=
 =?utf-8?B?ejQ3Y3VUWmVWMUVneXk3MkRuQVV5UzViQUtPVll5UkVSQVg0SmlFd2F2OVhS?=
 =?utf-8?B?L3oyd003WFRFYk5kVE9qTXcrK040bjhsNWNjVm9DRkFTbjg2bjVMNFpmcEY4?=
 =?utf-8?B?c1pxbHdzc09DU3dMd2hmRnlPUW93ZTRpTktQdEJCYWNkRjVZdjJWVkZsZnJV?=
 =?utf-8?B?Ti9UbWhmdy8wZU1yN0syS0JkTUphS1I5bEtxRnJUUEowS3pxQWp3RjNXbkVn?=
 =?utf-8?B?MStOYW5zNVJhdjUyVTJ2a3Y5b3N4ODQ5WjR1Ujgranhsd29hc29IRitjckFW?=
 =?utf-8?B?RW1nOC83ODBWTTk4ZEVGTi9vd3l0aUpIWG9wZnR1alNROENBQWxlT2hJdEl1?=
 =?utf-8?B?RTBFZ0w5d1dzTHlnRGZreWpBMXVyQlZWc2RscmVZbWZkTDFHaytxL3MzRC9s?=
 =?utf-8?B?Q3dZV0RtNFp0elVCd0dKNUQvYVdoSDdvT2g5b2Uzdm1acy82Mnl1SUZnOXpW?=
 =?utf-8?B?TXlNZC9PM1BoSWQ2RC96RWtEZmFVZVB4Lzh0OTNoSmM1Uk1pSU1UV0o0RTlx?=
 =?utf-8?B?Y2JWMFdlbVpNVjdleWtDVys3c1Vad05oZEt1Vk13Q3ltMmZIeXRYSHZkN0Yz?=
 =?utf-8?B?SHRCaGJJMHc4TEo3UkNudDFhaUdxdzdhUEUvZGxQVjFUMlZyLzdpeXUwRDg4?=
 =?utf-8?B?S053UXdVT01sSTl4dlRRUmw1SCtiMGlCZlIxUEs3UWUxRE52YXhLNVFLLzQ5?=
 =?utf-8?B?RlBXY1dLeDF2OGkzRHNzUERWZnhQd0JCeEY4aDlpeUF3SWR6VjVnd2l6Y1Zm?=
 =?utf-8?B?MTNkbVcvclN5QTBPZXM3aldQVzlNZll4UVVyTGwzdHl3UHhiWVd2RXRPcVVL?=
 =?utf-8?B?dUVnOGp5eU43cVBZN1JaMGZxeitFU2h1Z1VldFJqaG83NVVKdFFXRkFNazZv?=
 =?utf-8?B?Y25UMkxVYmc1cERId1AwR2NzZGwvcGdhSHdndHBBaXd5TDh2eHpTQ1VMWkFU?=
 =?utf-8?B?anBKbjh1cGNXZWdxKzN5L0FYejE1UTk5UnIySHJ1ajlNckFnMVFxWVNvUUZ1?=
 =?utf-8?B?MjhVdmdZa0VOajltOWlrcXZVbTZPNFczUndmbDNDTjNmUkhmb1c2Qms0UGpm?=
 =?utf-8?B?TEduUjB4cUhyS1JuMG5xTjFWZmNOd0JBYk1BdTJLNlk3NitadS9sQ2t6R0xM?=
 =?utf-8?B?cjhZTENYaDdZeUhJMi8rTE1WMklLR25nMWhOVUNKcWJKYWVhU3E1M29WdGhH?=
 =?utf-8?B?dEFHRVlRTDFoaHFYTXNHbWh4dWVqcmNxNEJUNWp3TVIwRXNGVmVDK0Fjazlx?=
 =?utf-8?B?dlhFa0xjTGpRdFZLMGZDOUhJVmZGUUwvaGtlY2ZOc1RxMytPOFJQS0loeUt5?=
 =?utf-8?B?KzNuWTdmWU4xYW4xMDhGQkNnT3JhL3RDeWtoL3cxOVA4UTIybjBNbUg5aFp5?=
 =?utf-8?B?L1pBQXhybXY2NTZ1NTNsUGhFQ0JXSUhaY0NIaEE0eERVaFdNdmJDQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a05b6dd-b373-47cd-f959-08de5ed7b597
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 01:42:50.6135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YjVn2xDGnrvy3m00zMRArv57KTCmAxRVdQ5h56Ot2hglmBluiTF/cjGNeQcD76CYtKOMqDLLqYegneABCw3/mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11617
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51758-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,oss.nxp.com,ndufresne.ca,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 88016AADD6
X-Rspamd-Action: no action


Hi Frank,

On 1/29/2026 4:48 AM, Frank Li wrote:
> On Tue, Jan 27, 2026 at 03:37:00PM +0800, ming.qian@oss.nxp.com wrote:
>> From: Ming Qian <ming.qian@oss.nxp.com>
>>
>> The i.MX952 SoC features an upgraded JPEG encoder (version 1) with
>> enhanced descriptor-based configuration capabilities.
>>
>> The hardware version can be determined by reading the
>> version register.
>>
>> The v1 encoder uses an expanded descriptor format that allows
>> configuring all encoding parameters, including JPEG quality,
>> directly in the descriptor. This eliminates the manual
>> configuration phase required by v0 and reduces the interrupt
>> count from two to one per frame.
>>
>> V0 encoding flow:
>>    1. Write quality to registers -> trigger config interrupt
>>    2. Start encoding -> trigger completion interrupt
>>
>> V1 encoding flow:
>>    1. Configure descriptor with all parameters including quality
>>    2. Start encoding -> trigger completion interrupt
> 
> AI polished commit message
> 
> jpeg: imx: add support for JPEG encoder v1 descriptor configuration
> 
> Support the upgraded JPEG encoder v1 found on i.MX952 SoC.
> 
> Detect the encoder hardware version via the version register.
> 
> The v1 encoder uses an expanded descriptor format that allows all encoding
> parameters, including JPEG quality, to be configured directly in the
> descriptor.
> 
> This removes the manual register-based configuration step required by v0
> and reduces the interrupt count from two to one per frame.
> 

OK, will apply this improvement in V2.

>>
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>> ---
>>   .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.c | 10 +-
>>   .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |  4 +-
>>   .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 92 ++++++++++++++++---
>>   .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    | 24 ++++-
>>   4 files changed, 112 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.c
>> index 9a6e8b332e12..97a6e1426ba2 100644
>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.c
>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.c
>> @@ -2,7 +2,7 @@
>>   /*
>>    * i.MX8QXP/i.MX8QM JPEG encoder/decoder v4l2 driver
>>    *
>> - * Copyright 2018-2019 NXP
>> + * Copyright 2018-2026 NXP
>>    */
>>
>>   #include <linux/delay.h>
>> @@ -189,3 +189,11 @@ void mxc_jpeg_clr_desc(void __iomem *reg, int slot)
>>   {
>>   	writel(0, reg + MXC_SLOT_OFFSET(slot, SLOT_NXT_DESCPT_PTR));
>>   }
>> +
>> +int mxc_jpeg_get_version(void __iomem *reg)
>> +{
>> +	u32 regval;
>> +
>> +	regval = readl(reg + GLB_CTRL);
>> +	return GLB_CTRL_CUR_VERSION(regval);
>> +}
>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
>> index adb93e977be9..e9c7573f0fe4 100644
>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
>> @@ -2,7 +2,7 @@
>>   /*
>>    * i.MX8QXP/i.MX8QM JPEG encoder/decoder v4l2 driver
>>    *
>> - * Copyright 2018-2019 NXP
>> + * Copyright 2018-2026 NXP
>>    */
>>
>>   #ifndef _MXC_JPEG_HW_H
>> @@ -73,6 +73,7 @@
>>   #define GLB_CTRL_DEC_GO					(0x1 << 2)
>>   #define GLB_CTRL_L_ENDIAN(le)				((le) << 3)
>>   #define GLB_CTRL_SLOT_EN(slot)				(0x1 << ((slot) + 4))
>> +#define GLB_CTRL_CUR_VERSION(r)				FIELD_GET(0xF0000, r)
> 
> 0xF0000 use GEN_MASK(16, 23)
> 

OK, will fix it in V2

>>
>>   /* COM_STAUS fields */
>>   #define COM_STATUS_DEC_ONGOING(r)		(((r) & (1 << 31)) >> 31)
>> @@ -129,4 +130,5 @@ void mxc_jpeg_set_res(struct mxc_jpeg_desc *desc, u16 w, u16 h);
>>   void mxc_jpeg_set_line_pitch(struct mxc_jpeg_desc *desc, u32 line_pitch);
>>   void mxc_jpeg_set_desc(u32 desc, void __iomem *reg, int slot);
>>   void mxc_jpeg_clr_desc(void __iomem *reg, int slot);
>> +int mxc_jpeg_get_version(void __iomem *reg);
> 
> Only use at mxc_jpeg_runtime_resume(), it can be removed here and it can
> be static in C file.
> 

But it's defined and used in different c file.
I will move it to mxc-jpeg.c in V2.

>>   #endif
>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> index b558700d1d96..9624eea2450d 100644
>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> @@ -37,7 +37,7 @@
>>    *
>>    * This is inspired by the drivers/media/platform/samsung/s5p-jpeg driver
>>    *
>> - * Copyright 2018-2019 NXP
>> + * Copyright 2018-2026 NXP
>>    */
>>
>>   #include <linux/kernel.h>
>> @@ -64,6 +64,12 @@
>>   #include "mxc-jpeg-hw.h"
>>   #include "mxc-jpeg.h"
>>
>> +#define call_void_jpeg_enc_ops(jpeg, op, args...)			\
>> +	do {								\
>> +		if ((jpeg)->enc_cfg_ops && (jpeg)->enc_cfg_ops->op)	\
>> +			(jpeg)->enc_cfg_ops->op(args);			\
>> +	} while (0)
>> +
>>   static const struct mxc_jpeg_fmt mxc_formats[] = {
>>   	{
>>   		.name		= "JPEG",
>> @@ -1030,11 +1036,7 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
>>
>>   	if (jpeg->mode == MXC_JPEG_ENCODE &&
>>   	    ctx->enc_state == MXC_JPEG_ENC_CONF) {
>> -		q_data = mxc_jpeg_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>> -		ctx->enc_state = MXC_JPEG_ENCODING;
>> -		dev_dbg(dev, "Encoder config finished. Start encoding...\n");
>> -		mxc_jpeg_enc_set_quality(dev, reg, ctx->jpeg_quality);
>> -		mxc_jpeg_enc_mode_go(dev, reg, mxc_jpeg_is_extended_sequential(q_data->fmt));
>> +		call_void_jpeg_enc_ops(jpeg, exit_config_mode, ctx);
>>   		goto job_unlock;
>>   	}
>>   	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed &&
>> @@ -1272,6 +1274,7 @@ static void mxc_jpeg_config_dec_desc(struct vb2_buffer *out_buf,
>>
>>   	jpeg_src_buf = vb2_to_mxc_buf(src_buf);
>>
>> +	ctx->extseq = mxc_jpeg_is_extended_sequential(jpeg_src_buf->fmt);
>>   	/* setup the decoding descriptor */
>>   	desc->next_descpt_ptr = 0; /* end of chain */
>>   	q_data_cap = mxc_jpeg_get_q_data(ctx, cap_type);
>> @@ -1335,9 +1338,15 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
>>   	struct mxc_jpeg_q_data *q_data;
>>   	enum mxc_jpeg_image_format img_fmt;
>>   	int w, h;
>> +	bool extseq;
>>
>>   	q_data = mxc_jpeg_get_q_data(ctx, src_buf->vb2_queue->type);
>> +	extseq = mxc_jpeg_is_extended_sequential(q_data->fmt);
>> +
>> +	ctx->extseq = extseq;
>>
>> +	memset(desc, 0, sizeof(struct mxc_jpeg_desc));
>> +	memset(cfg_desc, 0, sizeof(struct mxc_jpeg_desc));
>>   	jpeg->slot_data.cfg_stream_size =
>>   			mxc_jpeg_setup_cfg_stream(cfg_stream_vaddr,
>>   						  q_data->fmt->fourcc,
>> @@ -1348,11 +1357,6 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
>>   	cfg_desc->next_descpt_ptr = desc_handle | MXC_NXT_DESCPT_EN;
>>
>>   	cfg_desc->buf_base0 = jpeg->slot_data.cfg_stream_handle;
>> -	cfg_desc->buf_base1 = 0;
>> -	cfg_desc->line_pitch = 0;
>> -	cfg_desc->stm_bufbase = 0; /* no output expected */
>> -	cfg_desc->stm_bufsize = 0x0;
>> -	cfg_desc->imgsize = 0;
>>   	cfg_desc->stm_ctrl = STM_CTRL_CONFIG_MOD(1);
>>   	cfg_desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
>>
>> @@ -1372,11 +1376,14 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
>>   	desc->stm_ctrl = STM_CTRL_CONFIG_MOD(0) |
>>   			 STM_CTRL_IMAGE_FORMAT(img_fmt);
>>   	desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
>> -	if (mxc_jpeg_is_extended_sequential(q_data->fmt))
>> +	if (extseq)
>>   		desc->stm_ctrl |= STM_CTRL_PIXEL_PRECISION;
>>   	else
>>   		desc->stm_ctrl &= ~STM_CTRL_PIXEL_PRECISION;
>>   	mxc_jpeg_addrs(desc, src_buf, dst_buf, 0);
>> +
>> +	call_void_jpeg_enc_ops(jpeg, setup_desc, ctx);
>> +
>>   	dev_dbg(jpeg->dev, "cfg_desc:\n");
>>   	print_descriptor_info(jpeg->dev, cfg_desc);
>>   	dev_dbg(jpeg->dev, "enc desc:\n");
>> @@ -1388,6 +1395,54 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
>>   	mxc_jpeg_set_desc(cfg_desc_handle, reg, slot);
>>   }
>>
>> +static void mxc_jpeg_enc_start_config_manually(struct mxc_jpeg_ctx *ctx)
>> +{
>> +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
>> +	void __iomem *reg = jpeg->base_reg;
>> +	struct device *dev = jpeg->dev;
>> +
>> +	ctx->enc_state = MXC_JPEG_ENC_CONF;
>> +	mxc_jpeg_enc_mode_conf(dev, reg, ctx->extseq);
>> +}
>> +
>> +static void mxc_jpeg_enc_finish_config_manually(struct mxc_jpeg_ctx *ctx)
>> +{
>> +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
>> +	void __iomem *reg = jpeg->base_reg;
>> +	struct device *dev = jpeg->dev;
>> +
>> +	ctx->enc_state = MXC_JPEG_ENCODING;
>> +	dev_dbg(dev, "Encoder config finished. Start encoding...\n");
>> +	mxc_jpeg_enc_set_quality(dev, reg, ctx->jpeg_quality);
>> +	mxc_jpeg_enc_mode_go(dev, reg, ctx->extseq);
>> +}
>> +
>> +static void mxc_jpeg_enc_configure_desc(struct mxc_jpeg_ctx *ctx)
>> +{
>> +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
>> +	struct mxc_jpeg_desc *desc = jpeg->slot_data.desc;
>> +	struct mxc_jpeg_desc *cfg_desc = jpeg->slot_data.cfg_desc;
>> +
>> +	ctx->enc_state = MXC_JPEG_ENCODING;
>> +	cfg_desc->mode = (ctx->extseq) ? 0xb0 : 0xa0;
>> +	cfg_desc->cfg_mode = 0x3ff;
>> +
>> +	desc->mode = (ctx->extseq) ? 0x150 : 0x140;
>> +	desc->cfg_mode = 0x3ff;
>> +	desc->quality = ctx->jpeg_quality;
>> +	desc->lumth = 0xffff;
>> +	desc->chrth = 0xffff;
>> +}
>> +
>> +static const struct mxc_jpeg_enc_ops mxc_jpeg_enc_cfg_ops_v0 = {
>> +	.enter_config_mode = mxc_jpeg_enc_start_config_manually,
>> +	.exit_config_mode = mxc_jpeg_enc_finish_config_manually
>> +};
>> +
>> +static const struct mxc_jpeg_enc_ops mxc_jpeg_enc_cfg_ops_v1 = {
>> +	.setup_desc = mxc_jpeg_enc_configure_desc
>> +};
>> +
>>   static const struct mxc_jpeg_fmt *mxc_jpeg_get_sibling_format(const struct mxc_jpeg_fmt *fmt)
>>   {
>>   	int i;
>> @@ -1593,12 +1648,10 @@ static void mxc_jpeg_device_run(void *priv)
>>
>>   	if (jpeg->mode == MXC_JPEG_ENCODE) {
>>   		dev_dbg(dev, "Encoding on slot %d\n", ctx->slot);
>> -		ctx->enc_state = MXC_JPEG_ENC_CONF;
>>   		mxc_jpeg_config_enc_desc(&dst_buf->vb2_buf, ctx,
>>   					 &src_buf->vb2_buf, &dst_buf->vb2_buf);
>>   		/* start config phase */
>> -		mxc_jpeg_enc_mode_conf(dev, reg,
>> -				       mxc_jpeg_is_extended_sequential(q_data_out->fmt));
>> +		call_void_jpeg_enc_ops(jpeg, enter_config_mode, ctx);
>>   	} else {
>>   		dev_dbg(dev, "Decoding on slot %d\n", ctx->slot);
>>   		print_mxc_buf(jpeg, &src_buf->vb2_buf, 0);
>> @@ -3006,6 +3059,15 @@ static int mxc_jpeg_runtime_resume(struct device *dev)
>>   		return ret;
>>   	}
>>
>> +	if (jpeg->mode == MXC_JPEG_ENCODE) {
>> +		if (!jpeg->enc_cfg_ops) {
>> +			if (mxc_jpeg_get_version(jpeg->base_reg) == 0)
>> +				jpeg->enc_cfg_ops = &mxc_jpeg_enc_cfg_ops_v0;
>> +			else
>> +				jpeg->enc_cfg_ops = &mxc_jpeg_enc_cfg_ops_v1;
> 
> This should only do once at probe.
> 

OK, will fix it in v2

>> +		}
>> +	}
>> +
>>   	return 0;
>>   }
>>
>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
>> index 9c5b4f053ded..8e68dcde9613 100644
>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
>> @@ -2,7 +2,7 @@
>>   /*
>>    * i.MX8QXP/i.MX8QM JPEG encoder/decoder v4l2 driver
>>    *
>> - * Copyright 2018-2019 NXP
>> + * Copyright 2018-2026 NXP
>>    */
>>
>>   #include <media/v4l2-ctrls.h>
>> @@ -81,6 +81,17 @@ struct mxc_jpeg_desc {
>>   	u32 stm_bufsize;
>>   	u32 imgsize;
>>   	u32 stm_ctrl;
>> +	/* below parameters are valid for v1 */
>> +	u32 mode;
>> +	u32 cfg_mode;
>> +	u32 quality;
>> +	u32 rc_regs_sel;
>> +	u32 lumth;
>> +	u32 chrth;
>> +	u32 nomfrsize_lo;
>> +	u32 nomfrsize_hi;
>> +	u32 ofbsize_lo;
>> +	u32 ofbsize_hi;
> 
> Do you only use one desc each time? if desc is array based, it will impact
> v0.
> 

The desc is not array based, each descriptor is assigned a separate DMA 
buffer.
For v0, properties added at the end will not be read. Therefore, it 
should have no effect.

>>   } __packed;
>>
>>   struct mxc_jpeg_q_data {
>> @@ -105,6 +116,7 @@ struct mxc_jpeg_ctx {
>>   	unsigned int			source_change;
>>   	bool				need_initial_source_change_evt;
>>   	bool				header_parsed;
>> +	bool				extseq;
>>   	struct v4l2_ctrl_handler	ctrl_handler;
>>   	u8				jpeg_quality;
>>   	struct delayed_work		task_timer;
>> @@ -125,6 +137,15 @@ struct mxc_jpeg_slot_data {
>>   	dma_addr_t cfg_dec_daddr;
>>   };
>>
>> +struct mxc_jpeg_enc_ops {
>> +	/* Manual configuration (v0 hardware) - two-phase process */
>> +	void (*enter_config_mode)(struct mxc_jpeg_ctx *ctx);
>> +	void (*exit_config_mode)(struct mxc_jpeg_ctx *ctx);
>> +
>> +	/* Descriptor-based configuration (v1 hardware) - single-phase */
>> +	void (*setup_desc)(struct mxc_jpeg_ctx *ctx);
> 
> You use callback, suppose callback name should be the same for v0 and v1.
> 
> for example:
> 
> 	void (*setup_config)()
> 	void (*clean_config)()
> 
> v0	enter_config_mode() -> .setup_config
> 	exit_config_mode() -> .clean_config
> 
> v1
> 	setup_desc -> .setup_config
> 	NULL -> .clean_config.
> 
> Frank
> 

However, the flow for calling the callback in v0 and v1 are different.
If use the same callback name, then additional checks will be required 
during the call.
Therefore, I prefer to use different names to handle the different flow.

Regards,
Ming

>> +};
>> +
>>   struct mxc_jpeg_dev {
>>   	spinlock_t			hw_lock; /* hardware access lock */
>>   	unsigned int			mode;
>> @@ -142,6 +163,7 @@ struct mxc_jpeg_dev {
>>   	struct device			**pd_dev;
>>   	struct device_link		**pd_link;
>>   	struct gen_pool			*sram_pool;
>> +	const struct mxc_jpeg_enc_ops	*enc_cfg_ops;
>>   };
>>
>>   /**
>>
>> base-commit: c824345288d11e269ce41b36c105715bc2286050
>> prerequisite-patch-id: 0000000000000000000000000000000000000000
>> --
>> 2.52.0
>>

