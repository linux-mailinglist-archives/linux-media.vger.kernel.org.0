Return-Path: <linux-media+bounces-40430-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F0CB2DEDD
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 16:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A6061C40237
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18A1226738B;
	Wed, 20 Aug 2025 14:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="knkSEmk8"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021094.outbound.protection.outlook.com [52.101.70.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4159026C3BE;
	Wed, 20 Aug 2025 14:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755698884; cv=fail; b=L5u0cW9FGPw3rDHOkhc3+x50BsLBeXltWi6w+14NiQ4Aqed3HJH7Zgr7AyxLbVrlFrx10dBDMm9BdlRBvHTdXtWp+wzV6yQ2jmUi37S3E3kjKPY8G1gnv2xkEkPdX144aP9VsL1J4i7+iQG5BYT0jOapAqsTI2n1Cly3Sxh6s30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755698884; c=relaxed/simple;
	bh=npN7JzP/P93X3K0qDAZos+PuByTQVHy8SnmvQVZNGp0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TlVR+hdsomJHbfNtEBIucAHJQI5pFEroVLDwrWFxPGPZ2xmfpf+xaVAz2FWMQfT7l8PliaKq1wwrnj8+BxtFsgiN0YFZjxVHu7T8yyy/C8tI3F6ic5eWDIsDkSb7GJr/8AeFf2Uw4lEoFjiB8xsVGUd5KfxF/UPX+ibVHlj2aBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com; spf=pass smtp.mailfrom=gocontroll.com; dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b=knkSEmk8; arc=fail smtp.client-ip=52.101.70.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gocontroll.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9LwvyZ1WwvAvnFzzIc618L84F9BBLlagoXgUFL98ygER7s9kN5tggLDFVuvAqKDHfuCnTz08H3ElbbL51iJ0AwEXgA1QXEvmhNSErbR3zk9gO3atcZvxbeauUq+ifAXeij1IX2zXu7oMC+sQFPXeuUkinpQyyBJzx+riTTii47RmfR9NtiUlZHFtcwCVVFMB6zhkNLYqEK/e/4PAX6N1gHx0PLJGBnD87fdDGkHIYU8gipgHVp1PUosLf5+pPqdtM8viM2Y3ngCttKBeJieYU0PU8pCtVbrRZSx4jwyXFRVzvdaI5TxoxdZSE27CaiBU/QaKI/9RbMKcXImy/lVnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mv8tV7tCOyuO4/tVXq2/KCnDlj9dEjo6aL+Kd1Zgaw0=;
 b=IVoaYAbtFJBKjHS67i7yMQwpRknV9irAWAr3SZcEeWxdxki0V6ZxA70HKw6KBo3UmsfepwOKCBhwxQ/S7RuVVzVEcUiMKl79EvB3nEjZ75MUdVV/pGvUp1rOiP1bf21+6b2WpGjvpRBoyuJ7ghvac/e1iqLYmjC9NpmspMcQaB+Ix5DvdR8eTNX9we814vg4vwZdsXLa439hYqTUQxGUrgjvA/1d8JD+BBc+D5aZWjg1/LChNVCUQRv4BbwNOwG85inByhpNPbLL2PYawjR9pB89TsZmoDaiw7XP4aTU4b5SNGXsW4Ola8qnJDl0vqp0OOpz4j690hlnZtDjYDJHLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mv8tV7tCOyuO4/tVXq2/KCnDlj9dEjo6aL+Kd1Zgaw0=;
 b=knkSEmk8AjVEhX7vyL7rl1cc65swsOeEzgOGNAoz5oqBPkw0UMy3HE4plqJbNGwomxnyYZl4uXFwz0yO0OM3XrVA5/1LbX9DzTVCkS/0uXJJuMs4W8Oc3K2eBKA3mcehtImpT1xc0aA2kAMRWppOxgUAVXvU/33JiKeEp5Lm1qtUqyJfPj78M2Na+UGD5ukBViZMs4Gi6QlJAKvAmAW0uGxmQ4CXqd/67qTjEmPOeiufaAHEgmL49IiP8p76IXyc+1kEyUag8iRqqiBT3UokliMe9UymizxRGABXEHg6yhLmFHsRv5tus3IsGI3bWS1PiOETNb9k1dsVSoonUCc1zQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by FRWPR04MB11283.eurprd04.prod.outlook.com (2603:10a6:d10:19e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 14:07:56 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%4]) with mapi id 15.20.9052.013; Wed, 20 Aug 2025
 14:07:56 +0000
Message-ID: <a9283349-c58d-47e6-ac33-77b5a6b893fe@gocontroll.com>
Date: Wed, 20 Aug 2025 16:07:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: nxp: imx8-isi: Check whether pad is non-NULL
 before access
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Stefan Riedmueller <s.riedmueller@phytec.de>,
 Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>,
 Guoniu Zhou <guoniu.zhou@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250818-imx8_isi-v1-1-e9cfe994c435@gocontroll.com>
 <20250820140154.GB6190@pendragon.ideasonboard.com>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <20250820140154.GB6190@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0064.eurprd04.prod.outlook.com
 (2603:10a6:208:1::41) To PA4PR04MB7630.eurprd04.prod.outlook.com
 (2603:10a6:102:ec::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7630:EE_|FRWPR04MB11283:EE_
X-MS-Office365-Filtering-Correlation-Id: 54b537da-96ae-4c5d-0414-08dddff2f630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QUpBQ3kxOWZTK2U1dkFMQ0RtWHdsQkx0S3dENDVkWGF2dkZpT1piKzNmUFEr?=
 =?utf-8?B?aGhRRFZ6eGtkWkRRTTlYc1lXTkpIK1VPRFBScTgyVE53VTJ5Y05raWFqeTRE?=
 =?utf-8?B?akUxU0pNMHhYaGZwN2Y1M1NXM1NlOVlTTXlBU1FIS3F0VHBGSXNndkNHeDVu?=
 =?utf-8?B?NlpnT1FYUEFTRjZ6WldzakhRNWM3dWFqN3c2UFl5SThGa3lVS01JOWF1cm5q?=
 =?utf-8?B?N1hveWRaU1BvaHdsZEVrbzFobmZsK3lUM21NQ0xaNGZSNmpnSVBYTElIalE4?=
 =?utf-8?B?SFNmT001RFVISlFJeEYvMnBpeEtqNFNRV0lwc3NFb3E5eUl5TmxXWldGZXhG?=
 =?utf-8?B?Y0pWQ2FrK1dHWEF4U29yTkkyU0VDVWhJeklOV1JhWVNqcGJ3alVZUW9MTWNR?=
 =?utf-8?B?d1FQeVF3M2k4TXJOZUdaVmhLd01oeEdMSVpJZStXK0x1eXhTZSsvK0xvU05n?=
 =?utf-8?B?TzJHYWQzZU5sYUlnU0ZZNDNJcFRTVHRPaFFvR2x2SDJLVFF3L25YMVY2blhw?=
 =?utf-8?B?K2pXSzRYQnZkQTQ0SjFtNm5peDR5OFBiRUd4dUM3dWVaWklBUDF4SE9vV0Zp?=
 =?utf-8?B?TU90cHNvVXdoQkRobDhQdDBjT3hlQVJuSmJobmQ1TzA2UlZBdCt6YlJnMHAr?=
 =?utf-8?B?WXF6RVhOTFBxVEhxK1dlUHZ1ZGQ2RzZRQmlXSnNBNHBwaUxaMU5mb2FRTHc0?=
 =?utf-8?B?YnkxcERkNXZiWlhSd3gwVGp6YXM1N2hnZVJFSEFhNlZqdThqd21QWUF6QnZI?=
 =?utf-8?B?SUZDSk9VTGxrSjhMdXZ1N3N4L2wvaGF6cWlybFVrZ3BoQ05WNmZpelBPQWlG?=
 =?utf-8?B?TDVuN3pNRTZoREZwTzJGWDhlS05aL1J1VmtFbDgvSWgvbWx5RUMrQUtQR3Bi?=
 =?utf-8?B?WEJqMTF4YVpKb2lCMVdjM0YxWDR3YVQySEs3WVpSaG1BeFpBbkp2RjhzU1RR?=
 =?utf-8?B?aUlyY0gyak9keHkxU0pYS2tXcVppd0RXVW9WUUNrV3ZYaWdVYUQ4cURWTHRH?=
 =?utf-8?B?Ynd4bGRYV3Zsc0V5RVhxalpmVzk2U2x3ZjlTcnBvcVhFaFprMXNCTDYxNnJu?=
 =?utf-8?B?akhwZmp4NlZIcmhKYUxmbkFCS200RUk4VmNzRVRiTloxZ2lkbURmMGpUWGsx?=
 =?utf-8?B?K2lEN3gra1dkaXcvN2kzWjR4Wk9lRE9ZKzR4cjQ0aHFIcVp0RGx6Wk03dGpu?=
 =?utf-8?B?REs2MFM0S1pMTllNQTV0TFFpZUFDNmo5TlBiRjI1emViMGcxb2dtUCszcFFw?=
 =?utf-8?B?RlF6cFdSRkJoU0NnWmdwWlBvWVdydEVQV3NDemFjMkhBalFXdzI1azhjQmo2?=
 =?utf-8?B?eWxFR1ZIRk9MRDJ3UHBXcEdaeklzZHMwSW5lSkxXMnc0M3BVWVhRc2EzSXNI?=
 =?utf-8?B?Sms5Q0VHcTRVV0pGYy9XdHd3SHFCL01MZDlqWk5vdVRESGVqWXRuYVBwVStZ?=
 =?utf-8?B?eW93TWc1dmpOMWc5SEpVQXdBYmdBaThzZ1ZrU1VuUzh3TDNnRDFnMHdJZHk1?=
 =?utf-8?B?ZUZISXNvSGxmSnV3ZVczMUljVjRoMzVrRFplV0N3QlprNjlrb3FUeGcxWGFZ?=
 =?utf-8?B?Yi9ZOXFua2xVS01rc1l2c2duUTh4ekM2a1RXY1pCNkNlR3V2MGtoODQzdFpM?=
 =?utf-8?B?ZUw2Rmc2NGNXZDdoUUVQUkkxUXRHc1J2M3BFNXQxTE9iMTl3NWVBTkZwUGhK?=
 =?utf-8?B?c0s1Q1RaMkVoR0N5b3Z3a25pOW9GL2Y5ai9NYUtVYWxVWWE4RXd6QnNRVGVt?=
 =?utf-8?B?eDZxb1RHNVppSU1qRk4wSkUrajQ0THJ0aVBQWW5XSnVrTmx2ZFJ2MkFCbVBT?=
 =?utf-8?B?VVV3ZHFabFJVU2wxY2pNVy9pKzBaa3BWbVdCUE53QlU5NlpnVzlwY1NLTVp0?=
 =?utf-8?B?SW9XaWY5ekZuT3RlUzBEWjNKSzQ4ZDBKbytLN3VIczU4Q1JldEFrMnpqN3Ji?=
 =?utf-8?Q?kVnbUIKbvz0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7630.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0tCcFhFeHV2cVFmRy9TbC9uMFpvREQ0a2ovMjhaOXZaY0ZheEE1RjNDS0Vi?=
 =?utf-8?B?b29QbUxBSDErMFYzdzMzTU1sRjYreTRYZDc5NVpFZEZMZ3BpM3NTMVQxVFA2?=
 =?utf-8?B?VHdUZ2ZIWHo0SEtoVm5TcFViSlVaVzlIWmNFWXNySUN0YnNwYWRUZDlDRFVR?=
 =?utf-8?B?VXV1cmRmaEE5aVFWL1VGT1phaXFtUVJKaXUyVmRtTlhoRUVzYlBXbXBPbU41?=
 =?utf-8?B?aXlzRnRQb2ZvV0JaUHpKTEcrRzA5VzRlRkRqWk15U0ltampleUd6cnV3Witt?=
 =?utf-8?B?ZzBmUXRxV1dVbXoyNURkbEFUUDd1QVpqQ0FqQUdDSXRvZVdDS2hPOVg3cnFt?=
 =?utf-8?B?cngwRWFHZW5oMzJHaUhTbnVnalpvZS9nNGRXSjErVmkwTFc3VGFTOWJOS0k2?=
 =?utf-8?B?MmtvMjgzU0lBMDBYbDIrUFRFb1h6dFYyYXNiZU1Xa2hkRWM2TVkzTW1pa3pj?=
 =?utf-8?B?THNXSlpkWFN1Q0wrdk5vQklJTWdDU3VNWG1qQ0kxUmF2cGZQSDlibHM3YUhG?=
 =?utf-8?B?YmdiMUdDSG5ROXJINlM2eUh0ZXFudExRZGp6d3RaUUtFQytQOC9mbUNnYWVh?=
 =?utf-8?B?YnUxNVNLL3VuSnlWbmp3OHBKZEtJZW9hT3duSUdGanVqQUl4aFJnaHRneHc1?=
 =?utf-8?B?MXJYZHkyRmUxRUdpNWQ1c3RFVC9LQVNGdjFnN0tWb3F5YWN6cW9RWU5SNUlv?=
 =?utf-8?B?TXQ2MXlGRmhuZjZzOVVtLzRDRURSSGwwckc5c2dZd1loL3lrSExCOTUxK0NZ?=
 =?utf-8?B?NzVEOVFqanFiamo1Q3ZGaG1RYnRMSXM2aDJMNHFPaXRvbkVrb3RCTFZvdFZW?=
 =?utf-8?B?WDNSdSt1WjkvSExzVjZSTW90US9xQW01UUpyWUd3NkhlNWFsZWdxM2V6dDZh?=
 =?utf-8?B?NlIzRGhNand4c2phQk5mU0pzYmJVeFJWT3o4ckFJdzZoR3lGajZwVlpZMlNz?=
 =?utf-8?B?L0QwL1JXM0YwM0ZTWE81WUlLclU0aEhzRkZjN0dCaG1Qb2RPWU56aFk1aWJJ?=
 =?utf-8?B?K0NnczQxNndGN2tRVEt1L0FNSEhhcGZreUhQNlNPdjB2RWZHT1FMajlNdC9K?=
 =?utf-8?B?OUZMWmNJNzNVYmY3bHpDSjcxOFJpMFQ2RXMwUEM3T0Z5aDlyQUZsdSt2MWEv?=
 =?utf-8?B?OFlCc2Z3U3JOS25LMzhtT1RRUzA2R2FPZ1IzN0g4QXdLcTFKZC9SWXJEWnBN?=
 =?utf-8?B?ZTlvM3RWL0pTTThUbncvcFp0dy9ISWNpdE5mSFBOdU1TM3RibmgrVnJ5anZQ?=
 =?utf-8?B?RnJUWm5LTGswaWRoc1FGcmVlLzROMHVrT1ArOS9vWS9QY3pZdUoxbWtpUXRE?=
 =?utf-8?B?N0F3NEllNXFmdE1VVjArUHJtSllteUdQYkxmOEdSTThnREJZbS9ORW9xWGZX?=
 =?utf-8?B?Q0trSENqaUN0VGsrK1p5aEppbTBSQXRCWXBKVmlQVFdsNFV4UjFSVUlmZTVM?=
 =?utf-8?B?U2JBWDdBQ00xMTR5b25VbnB6RjZPUzgwM2UvT2NlekZoTUVjOUtwTExJWFRF?=
 =?utf-8?B?N2NZYUhEa3FzR25ydlB0L2ppci9aaGJtNlF6U2VQQklsTVY1OWNOakNFT2du?=
 =?utf-8?B?a0FnQ25wTTFDbHdIdVU1Qzd4ak1KU0pDWjdUbVIzY3czQStxZ0tvYU1iNnJW?=
 =?utf-8?B?bkhhalhoRHpwZE5yZkU4aWNiZnFXak5QZ3d5Y09ZMGZwQjdodkxNUm9QMEt2?=
 =?utf-8?B?TmViUHk3VS9seXZuZUR6alNrNkt2SW1DNGhibjBYQXNveWorQkNTUDJyYWJo?=
 =?utf-8?B?TzBEWE1kTTB4aHVmNy93M0pMdWxSbmt6Z2tLQ3duVkZzdURaRlB4ajZibTlr?=
 =?utf-8?B?Vk0xcmVzV2dZMWcwa0dGZUVVUUcyWUE0VXZadjFITDdNNWxrTnlxcUU2ZzB1?=
 =?utf-8?B?UklQL1FPWndtcHhZZ3BnQ1QvN0lWOEZYaGdrZFVnOEJyRlQyMjZQRmtNMkl1?=
 =?utf-8?B?TThiQnllbW8rckNyRnlPT2Z4NlNHR3RhNmpnV3drVGIyQ2RBZGMxQTZQTmZC?=
 =?utf-8?B?V3gvUGJXSUluRUhTSTdMVmFETW1OR3NlUU5Fb0FLanhCeTJ1Vi95NmUzWlZ6?=
 =?utf-8?B?MzBLbzVsazRBWU52d1FOUXRsaFFHZG53a21mM0xzSVEvOHd5SFNmeGE3Zldz?=
 =?utf-8?B?eldoVzBqNFNFY0xHeG5jeXZ6bHNCcFRVM1p3UHJZandsS0QzakpUTjYwZkM5?=
 =?utf-8?B?YjVKYlg2SWhJVjJMM1FqMDhlUFFmZWZSQnpadDZUWHdNc2FaMXBHN3dkZDdp?=
 =?utf-8?B?b1UrMGFoM2Z2bmREWmtHako3L01RPT0=?=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54b537da-96ae-4c5d-0414-08dddff2f630
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7630.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 14:07:56.3235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nNVr6MhSiM/QOWWRTjkE8f6Zaqx9mbZ7NWyEvhZYejxm+49KONg9IsUKsiOnSQgyW2vdF70mjDbWFd26SgnjuqxVNmfzdSPVX65jX8WG63Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11283

On 8/20/25 16:01, Laurent Pinchart wrote:
> Hi Maud,
> 
> On Mon, Aug 18, 2025 at 02:31:43PM +0200, Maud Spierings via B4 Relay wrote:
>> From: Maud Spierings <maudspierings@gocontroll.com>
>>
>> media_pad_remote_pad_first() can return NULL if no valid link is found.
>> Check for this possibility before dereferencing it in the next line.
>>
>> Reported/investigated in [1]:
>>
>> Link: https://lore.kernel.org/all/1536a61b-b405-4762-9fb4-7e257f95e49e@gocontroll.com/ [1]
>> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
>> ---
>> I'm not sure if this should be a dev_dbg(), just following the pattern
>> around it for now, also not sure if EPIPE is the correct error.
> 
> I've submitted
> https://lore.kernel.org/linux-media/20250820140021.8026-1-laurent.pinchart@ideasonboard.com,
> which should fix this issue in a more generic way.

Saw it, but I think my patch technically is still correct as the 
function documentation states it can potentially return NULL right? [1]

Link: 
https://www.kernel.org/doc/html/latest/driver-api/media/mc-core.html [1]

I will test you patches tomorrow.

>> ---
>>   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
>> index ede6cc74c0234049fa225ad82aaddaad64aa53d7..1ed8b031178b7d934b04a8752747f556bd1fc5a9 100644
>> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
>> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
>> @@ -160,6 +160,13 @@ mxc_isi_crossbar_xlate_streams(struct mxc_isi_crossbar *xbar,
>>   	}
>>   
>>   	pad = media_pad_remote_pad_first(&xbar->pads[sink_pad]);
>> +
>> +	if (pad == NULL) {
>> +		dev_dbg(xbar->isi->dev, "no valid link found to pad %u\n",
>> +			sink_pad);
>> +		return ERR_PTR(-EPIPE);
>> +	}
>> +
>>   	sd = media_entity_to_v4l2_subdev(pad->entity);
>>   	if (!sd) {
>>   		dev_dbg(xbar->isi->dev,
>>
>> ---
>> base-commit: 3ac864c2d9bb8608ee236e89bf561811613abfce
>> change-id: 20250818-imx8_isi-954898628bb6
> 


