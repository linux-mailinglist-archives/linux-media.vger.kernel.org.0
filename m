Return-Path: <linux-media+bounces-29016-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 163B0A75E14
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 05:10:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D02F1887B6E
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 03:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CDDA13A3F7;
	Mon, 31 Mar 2025 03:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VrjPPB26"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012032.outbound.protection.outlook.com [52.101.66.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1A441760;
	Mon, 31 Mar 2025 03:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743390638; cv=fail; b=pH16I8ZO2HiL91t6y3MUm3XPiO483IYNSO4P8w7OOTCQaswPW8ownhNSRH3kHZzF++E3AbTjXyhDiPaPRPk8wJTLOLQzNvQoOEgPP6BVr9E4LcgnW0rLhA7jkadiqTrzk3G9eaxBqhulkPBWMRvy2b/H0gAqme/pC6anh2X+/ts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743390638; c=relaxed/simple;
	bh=mEYl0Q1w7QyA6MqkBnkjW1hIgUNFkny1OGnpKE4CRSA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cbKq2EXqyo9CUT2w68dncrNu0yFY8Az2xkCz2D+bMk/pRey0Se7o130Lt4Z5WnUiwHP9rQSLD7L3VzRCqumyJvhaBw/wJQElsN1eUZ6IO8Qj6XGmQ89Fm0SF7lSGCIYcDf5PORxrW9nAKQsJMF55yDOxuOIcbQJHftHyc9hRrbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VrjPPB26; arc=fail smtp.client-ip=52.101.66.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iON5K+QRbVZIX2n9P+t+od57wHlbLcZRtKCPsJb8KRYYgQsdKZ4SLlRw2KU0qgGB4Bkz0sG9XoroN4l7DqoJQuti9OzoC6gA1JmrZxEd8XfiY2eNaznjXourF+bTtPHZ+0tYejL6KzrUubIS2amJnoFoS74DvCjSKKenGH2nFfSsPqhy/V2GoEmn3E3zioLp4AQmL7+YsCgRt8BKJe+jf88cKWQ9mQPJU4lxLFYfTuMmlqrTy3sjlT0kpDo3IlPbrdDS/TN/hGb/n9uJZqqpNV8NK+CtCale4wdIEpDAUgHvR1yRpM4z/uA2nrGqxGtBy23Ki4stdmN9cXOmxEVxmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/iBiCig7Lr6BoY9ptubmw0TWsL7Add0vLqBAUA3UrJo=;
 b=KgSobBIKmqR8OXeodwrSo+M4rF8gJ64fSOCWY1VY6ZGWQZneBWiHBbDaRsqOp2+xNccILMGg1dACwmxF8Bap2ZApAvgiR+v159DRKgRUFYMWRkk046hNl/nQ4Fgk97mMidfMUp7E05yWe+wkDmxb6YIRR4Dm3FYXDOF62pdh2HcHLtKITkEirdY6F96vl7fjyx/sp9Qy3XIBzTQf2vtzYjBWjbIp5UUswVT10TeCLytiis5Hzl9Ms1UCPnDUU3WThSVndD6IBjVPS7bipg1/lAAQUvKPFPxYTJ84Xq93lWHGjo09+NdgjHXr0iWhW7O0tN69Y61nChw9YBxiXwgo7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/iBiCig7Lr6BoY9ptubmw0TWsL7Add0vLqBAUA3UrJo=;
 b=VrjPPB26ggkUnsg2fLlZP4dTcVp2MzBksJV6dV1YTYsJt04kd1eCCSNBbnlTP5pwfWERi/Xl0wfeVABxdGrwPsmElhk+HKm9eH/+FuIGLpyNOQlZBYdMo3PhT1cVEo02artRIsPZJggWt7wQIYrCGkG9bHl5yoTTtNg+DQ/cETxnQ4m2CGr8IA/0K8lOiT3QQLm+rd59gR1IXk9jnCj1zNHVwF0kqu0y4b2EiPnac7TB7tuu2hkYsDnl8QF3csvkqUmhEgfGbk1XCwmgM7Eo3FDZqE4Y1aqi3/w7e0pbsUhDzACDbrbduQHq6WbB4MVC1FVnwtYDB8MUZqu7kdlU/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by GVXPR04MB10802.eurprd04.prod.outlook.com (2603:10a6:150:220::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 03:10:30 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8534.052; Mon, 31 Mar 2025
 03:10:30 +0000
Message-ID: <99aa5db6-eb75-4fcf-ada7-cc6d519a40cc@oss.nxp.com>
Date: Mon, 31 Mar 2025 11:10:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] media: imx-jpeg: Check decoding is ongoing for
 motion-jpeg
To: Frank Li <Frank.li@nxp.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, mirela.rabulea@oss.nxp.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250328063056.762-1-ming.qian@oss.nxp.com>
 <20250328063056.762-4-ming.qian@oss.nxp.com>
 <Z+a2G5We38cQw3UD@lizhi-Precision-Tower-5810>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <Z+a2G5We38cQw3UD@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0015.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::15) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|GVXPR04MB10802:EE_
X-MS-Office365-Filtering-Correlation-Id: 53581b62-9a0b-4dd0-7d9b-08dd700197a5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0hUUnFHYVRla3JXM3ZBVGlMMlB5YmdKYnA0Vno1bTVCWFNkZVJ1ZEhOSWIz?=
 =?utf-8?B?VlRoa1YwM3pENDEvdytYdjVMc0cvbk1VRTNVRDNYY3A5TGN1OUI3eXZjb211?=
 =?utf-8?B?ZFMrNzFCeUJtMWFBcXJsVlJmeExoRVppeU5EUUN5enhwNll6VjJYSndOTVZU?=
 =?utf-8?B?b01Fd0YzYmdMQzE0MG84cGRRUWpYbzdWdU5xSGJKVk9kUHFOYlpHMkpKbDBK?=
 =?utf-8?B?eHdJN3BvVlpDaS9sUXBmeWRQd3E5aXpqWkNwaFBySzZMZWdHbE5VL25aR0Ez?=
 =?utf-8?B?MXNaNklXTHNValZXZk9KREtYVkFNais0UXBOWCsxSURqaDRocjZTOFhwMVRR?=
 =?utf-8?B?ZDd4WjNjMVQwSGlTUzhDZlhpR3d3Vng3dGxFUmtleDFYamdsNURhc0E5ZU1o?=
 =?utf-8?B?eElkQWNiZG5CWFNNc09YUGxvdVB2NUFLV3FsblZVRVhha2FSRU5TQmRsaEwv?=
 =?utf-8?B?MG5wWGlTaW5wYXlMNFZBa2VPdGdUVlBWc3JoR0xMY05XeEhGMnBqaFNYd3Fk?=
 =?utf-8?B?K1hQZXY0QWNzRDZVYmNNR1NyTnJ2OVoyY2FMcFZTRG11cWJBMDNTRUFxMGgy?=
 =?utf-8?B?NzcyM3ZZMkxDTk9tUDhicnlacTV5N1l0VFhmU1RUb091MGhxMDZUZUhqeGp0?=
 =?utf-8?B?ZnM0YnZXYU9oaFJUQnJqWjgrTDMrbmpOK2Q0OUtXYm1LbjRQZWQ2L1ZWTDJQ?=
 =?utf-8?B?ZEg1S20yTWdhM0VhcE9vTXlZZW9XdlhHYm1TQ0NETmdKU1orNXNJeVpRbWl0?=
 =?utf-8?B?bnMzSHdGK0haSWIzOHI2WkoxbnRQVDhMS2J1NlA4anhjUWdrMnhNUnluWG1P?=
 =?utf-8?B?WTI5ME44TThNemRldk03ZWEwQ1h1S241bGgvaktGdU0xYTF3ZnAzUFBOM25Y?=
 =?utf-8?B?aEZZbytMMCtWbUVPMEdzR1dvOFVEUXRuenNPRFk1a1VWWXhkYUVZSmpUZHpo?=
 =?utf-8?B?SmZxUW5IU21WQmFGcDZTODJXQ2FzWmU3Z05SNFhwRGRLMnVUK25GZWM3MWpi?=
 =?utf-8?B?MXcyVHhCa0ZnajNnLytRSThvQ254QW5IMElBSElsVENyMmFEd2cvUThnSnQ0?=
 =?utf-8?B?VFdHcDFYTkIwdnhIWFlFN1BreUVyUlUwMkFxbXVWQmV0R204OTZ4TEdBZlJD?=
 =?utf-8?B?dnJBWU5tRnlVMEg4VEFiVjM4bmJWeXcyV0FjcXo5eWtEMFBybjJFcnc1ZXlK?=
 =?utf-8?B?a1hMaVM1aXppakdxNmxDVk1zbjVobkVvMXZPekJnVlVndGZmZTQrMkk4R3NQ?=
 =?utf-8?B?MTRTZUErZkxaWHZzaHF4ZEw4UjhiWEw1Lyt2QXc1MFBqVE93Z2hKRGI1RlFE?=
 =?utf-8?B?QjdoaUI1Vm5DazJocmdwMFhHK3BQZ1lPTkJsMWNRRmY4azNiVDFZYlFKQllB?=
 =?utf-8?B?dCt4Sks1QkdtZ2xXOGdHTzdDTDFNenkyaUpnejBsQnpoWCt4eTliTVptMllK?=
 =?utf-8?B?K3hOSGZWaFlOWVNEVzRWVk5pV2xuT1ZWODg4N3ZNMlhnQzZ6bGxJbDlTV3hk?=
 =?utf-8?B?YnNLeFZTRno4bTlDUHNtMnpqSmF5dTVGZThzNXlHWXZmdGNEQXFVK28xYm8r?=
 =?utf-8?B?cFhMOE5sRVR3UHVFeVhIZHZlSXljaVBBQUJiYTF2ZDRvM1pta1Q4VmlJYXpP?=
 =?utf-8?B?clN5bWRBMjBqb3E1clowR0xlcEZpQlZWdXFJUmNBSytFZEhWQXQ1dTBUM2FR?=
 =?utf-8?B?SWRVL1Q1ZUxsdzlXTFBaMm9SazZoQ1AxUUJ1VXN6RlhxdFoxRmwyUXpZenBx?=
 =?utf-8?B?NXNuZ0x1ZWxXak54R2QwbVJOd0lsOWxyOXNscGlzelhYZ21tTVdpUm9Ca3h0?=
 =?utf-8?B?amRnZUY3SWVBZ1RobE9qd2c4MTFpN2Y0RCt4U1pLWHJJdlFtSlV0WEg1VWtG?=
 =?utf-8?Q?MdbKKuF0wD1+j?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmFkZzRxY3hFOHZTVVFiTzdzMHovUkticXloL0hFdmhOdU96RW9vOWtYb0NV?=
 =?utf-8?B?aTJBWlhpWGFHWExhS3RZQ1c2enNOVDVSN2htZnZvK0huK2VYK3RBUERHeU5k?=
 =?utf-8?B?VTlERVQydlc0TWpQam1OU2RwWDRUdHpLMnFwOUk5K0ZoMUZSQ1M1dFY1TGtB?=
 =?utf-8?B?b2ZGbHZQaFVjajdoYWRxZnhjRDV6SDgvVkNBNFRMc3F4UHdpV2YrRjZQU1hR?=
 =?utf-8?B?VlhmVGIzTTJGNDRZTksxTXc5ODdTR2dOUjMrU0dVdzgxa2xhRlF1a2N1TlNh?=
 =?utf-8?B?K3VVN1VmM2ZzY0g2Mi92bTFKcmVKSE9YYjUvWTNhVzhkZlAxOEp5emwrVTUx?=
 =?utf-8?B?VUVEOEtydittU3NoWUhiWXdEQkxXZXZGUGxUTklqR3BySUd1dVRYT2RlZHY0?=
 =?utf-8?B?MlpXaWFCM0VwaEtvd1JCNDk4ME9WSFBTbWRwQ2hicko5TXpPQ3dRQXN0ZS9W?=
 =?utf-8?B?NWh3OHZMY0YvRDI0ZXRDbUErYUFSU2pJdDU4alkxRUFrYy9GMmk1b3QyUHNY?=
 =?utf-8?B?SmErU3ZmZVdmcEZOc2JRaXZ1ekZyZVo2aXlmM3JLU1FEZVhsd3pzd2dJWWpJ?=
 =?utf-8?B?R2g2RlNzYW5BK3FHdGY2Z3duUWR5Ump0MjlVT0x6YmUwdDRtSHVvbk9hUWRr?=
 =?utf-8?B?eXlYakU3TmhVMFFEU0VCbWZGZ2x2Y2RPc3Q3ZGZra1BGQjdTc1Blb3MwVnlS?=
 =?utf-8?B?WmdIc2Q3OEJmdHV6dzY1b0Q5OFZndGNUbjdmMG5tdStDMmVZL2Q5M2I5dWRL?=
 =?utf-8?B?NVlKems0bHY3VkJMMjE3Rll5N3JaZndXNjZOUnJRN01PY0tUdk5SRVh3RER5?=
 =?utf-8?B?c3R3N3JjZVNiMXRBS3FQbzUrQTAxZ2lZTzVSbWJiVjY4SFpMVjhtdUNYa2xv?=
 =?utf-8?B?emdnL3dLU0hobGhoa1BZcWk2WVVoYllyWmNnZkFlU0pzOE1kSmMvK1Y0RW54?=
 =?utf-8?B?WkRtYTlYeXJUZ3FuMXY4RE9XZ1dRblRiM2RBQlZPNi81V0EwRmRBcUxaNFpE?=
 =?utf-8?B?dlpLR2cvd3Z1Y3piNitwL0tyODgzSWt2OUVLYXFLYmJiN1QxVE9hcEpRYlhP?=
 =?utf-8?B?VnJicXpRM29xTVpMQkI4dUlWVktqaytRcHZGMGZIb3pJanJsbnZVc1Rqb3pl?=
 =?utf-8?B?NklmOHhsVnAyOHdvTGhTK2ZocDhxMGFnclVUb0YrcFdvQmZ0cGhxM2d2eURx?=
 =?utf-8?B?REpZaDJ3QWZLMnZ5d1oxY1phWm50SDhVRVNDMkRVbU1NdFQ2bG9lSk5wT2NI?=
 =?utf-8?B?azVnTmszclA4bUZCMzYzbk1IWmduZWVKNkN3YnAyL0RxWmV2TStwT1JsRWUz?=
 =?utf-8?B?MStFWCswM0J2K3pYMmlFTktaR0xLWUZaUjRCOWxHZkUwdFUxZkJFUVhxbC8z?=
 =?utf-8?B?Y011bEIvQWVkUzYzQTZrQVhKRE5XYTZSdGlpWFE0cW1JSE9CUGMrMDh2VExl?=
 =?utf-8?B?Q2w5RjNIUnIyUnNUN0YveXFnZFpWRC9pZkNHanc5WmNZVFdLZ01hQlNaWisy?=
 =?utf-8?B?ZmxqMFpMa0hEQXdPekhrd3JhRFVIaEdlOG5IeW1YZTd3dEt6a2EvYlNtSWdG?=
 =?utf-8?B?TERnTGhZdjUvQUVqQU1TeW1ZUkRtWDNsT1Y3VmxabVBVSWFKZTBYdDVqSnoz?=
 =?utf-8?B?b1lTSGtrRXVuMC9kMEFqWVpGSDhLcThpSHJlUzYxY0tUdlIvNFRtdjZNZUFM?=
 =?utf-8?B?aXZEN2tlaDg3ZTFSOUdzMXoxNlZ6MW1CVldtTGZ5SHFyNjA3cHgwaXAvRHJX?=
 =?utf-8?B?OWlGcURJaU5pS2lqMWo4ZGNqM1N3VmpMM2N5TVBjajh6eFBkSVF0VzlCcEtH?=
 =?utf-8?B?Qm8rWWwwbS9YYW04cVFjam5BN0F3N2dPMUNxNlFOZ002aG0zL2NDWmhEMkYz?=
 =?utf-8?B?Z3A5RW9nNDFZZ1ZMRHg2QmxFYkRPOGwxTXF2MTZITFo1NUswTlJqc25weVFj?=
 =?utf-8?B?ZUwyS005aEFPL0dtRVg0aFA1aTh3Nit3bnVXOFh0UE9nYzI5Vks4YTE2R1lD?=
 =?utf-8?B?WC9qbGtoVVYvelhLdWlUYWpqRnVHWWF1N245REM0VEIxbEtGc0R1WmZhTE9Q?=
 =?utf-8?B?ZHA1dFI1R2hPNzhOemFxTU01eUM4TE96VFpuOURiKzc1MVBFZ3ROMytvbWp1?=
 =?utf-8?Q?P9gA13orqs2reLHGPdssE0of5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53581b62-9a0b-4dd0-7d9b-08dd700197a5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 03:10:30.1295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPLPOqhzKOx+rrDgJsXwzm5iyxdkOrkqWc+RI+RH5u3pQFCuWlZ+DI5wB/pnGbJgoYkgPGxTgBc0P+HwIVCL2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10802


Hi Frank,

On 2025/3/28 22:45, Frank Li wrote:
> On Fri, Mar 28, 2025 at 02:30:52PM +0800, ming.qian@oss.nxp.com wrote:
>> From: Ming Qian <ming.qian@oss.nxp.com>
>>
>> To support decoding motion-jpeg without DHT, driver will try to decode a
>> pattern jpeg before actual jpeg frame by use of linked descriptors
>> (This is called "repeat mode"), then the DHT in the pattern jpeg can be
>> used for decoding the motion-jpeg.
>>
>> In other words, 2 frame done interrupts will be triggered, driver will
>> ignore the first interrupt,
> 
> Does any field in linked descriptors to control if issue irq? Generally
> you needn't enable first descriptors's irq and only enable second one.
> 

Unfortunately, we cannot configure interrupts for each descriptor.
So we can't only enable the second irq.


>> and wait for the second interrupt.
>> If the resolution is small, and the 2 interrupts may be too close,
> 
> It also possible two irqs combine to 1 irqs. If I understand correct, your
> irq handle only handle one descriptors per irq.
> 
> Another words,
> 
> If second irq already happen just before 1,
> 
> 1. dec_ret = readl(reg + MXC_SLOT_OFFSET(slot, SLOT_STATUS));
> 2. writel(dec_ret, reg + MXC_SLOT_OFFSET(slot, SLOT_STATUS)); /* w1c */
> 
> Does your driver wait forever because no second irq happen?
> 
> Frank

Before this patch, the answer is yes, the driver will wait 2 seconds
until timeout.
In fact, this is the problem that this patch wants to avoid.
Now I think there are 3 cases for motion-jpeg decoding:
1. The second irq happens before the first irq status check, the 
on-going check
help to hanle this case.
2. The second irq happens after the first irq status check, but before
on-going check, this on-going check can help handle it, fisnish the
current decoding and reset the jpeg decoder.
3. The second irq happens after the on-going check, this is the normal
process before. No additional processing required.

Thanks,
Ming

>>
>> when driver is handling the first interrupt, two frames are done, then
>> driver will fail to wait for the second interrupt.
>>
>> In such case, driver can check whether the decoding is still ongoing,
>> if not, just done the current decoding.
>>
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>> ---
>>   .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |  1 +
>>   .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 20 ++++++++++++++++++-
>>   2 files changed, 20 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
>> index d579c804b047..adb93e977be9 100644
>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
>> @@ -89,6 +89,7 @@
>>   /* SLOT_STATUS fields for slots 0..3 */
>>   #define SLOT_STATUS_FRMDONE			(0x1 << 3)
>>   #define SLOT_STATUS_ENC_CONFIG_ERR		(0x1 << 8)
>> +#define SLOT_STATUS_ONGOING			(0x1 << 31)
>>
>>   /* SLOT_IRQ_EN fields TBD */
>>
>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> index 45705c606769..e6bb45633a19 100644
>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> @@ -910,6 +910,23 @@ static u32 mxc_jpeg_get_plane_size(struct mxc_jpeg_q_data *q_data, u32 plane_no)
>>   	return size;
>>   }
>>
>> +static bool mxc_dec_is_ongoing(struct mxc_jpeg_ctx *ctx)
>> +{
>> +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
>> +	u32 curr_desc;
>> +	u32 slot_status;
>> +
>> +	slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_STATUS));
>> +	curr_desc = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_CUR_DESCPT_PTR));
>> +
>> +	if (curr_desc == jpeg->slot_data.cfg_desc_handle)
>> +		return true;
>> +	if (slot_status & SLOT_STATUS_ONGOING)
>> +		return true;
>> +
>> +	return false;
>> +}
>> +
>>   static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
>>   {
>>   	struct mxc_jpeg_dev *jpeg = priv;
>> @@ -979,7 +996,8 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
>>   		mxc_jpeg_enc_mode_go(dev, reg, mxc_jpeg_is_extended_sequential(q_data->fmt));
>>   		goto job_unlock;
>>   	}
>> -	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed) {
>> +	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed &&
>> +	    mxc_dec_is_ongoing(ctx)) {
>>   		jpeg_src_buf->dht_needed = false;
>>   		dev_dbg(dev, "Decoder DHT cfg finished. Start decoding...\n");
>>   		goto job_unlock;
>> --
>> 2.43.0-rc1
>>

