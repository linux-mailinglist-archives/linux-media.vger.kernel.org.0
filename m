Return-Path: <linux-media+bounces-30575-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9D9A94D54
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 09:40:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89A7818915CF
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 07:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD32D20E6F9;
	Mon, 21 Apr 2025 07:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="n50I6UCL"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2064.outbound.protection.outlook.com [40.107.22.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B0D20DD6B;
	Mon, 21 Apr 2025 07:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745221208; cv=fail; b=uHKoOaefPDzF7jKjJLKAx1m5bTsI6QVHJRQUxTzP5/V77iCwKFd+r85cDV4yQMRHp51GhwZMz5SMiRj4VAZBTgU2gmOpidSpiE4DDCpxDNV3sC+W5+jMeGukcChVxwFXXsUtQMR6zs2snQaJz9CDLv+idJu3Swvs3KFnGK0JCJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745221208; c=relaxed/simple;
	bh=ztjEpvByHq3GT0jcCNLdECgJvMpaRPPiwsMu8f4fzPM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hjB+tBPFiOA23fi7t/fSysp/lNh3ljLbKQmqbZ8GRA0aJUoLvoOzDlEP+iXSOZD/UAJ759WT0cx1opE1f/ohnZsf0jVARBnAvHx5mIidNqMOzq8rQLt6EcuH30+xwhIzUxjsFCV1AT15lY/ARk7Im/ejANoJuhQHs5Y/uAXuQ/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=n50I6UCL; arc=fail smtp.client-ip=40.107.22.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCoT/XbgRr+pMbydjuDGx1ZqNsX9l0uV15OhJdCtTV45u7RYRQ/0APkRArwrz+hB+8l1bDwEI8WF+MLMCzpNafOdslCe5WdktcEwZjm7Rjksnzn/jOTI+AMiNr8UnnE4qrL7dGby2US8y1tGMo0Rr5fTHqG1fffHTj9lwtXqhoZkbEn0UIEBesNBow+Ui0NqPIsXqrNNsUsZQ6zKuRnH7l1WYTOZfnCLR98l7dvQYEWklOjD0A9udtqyU4SqhaUQO7dspfqoA/KZz+aJi8WkHOjU8PEn7vNAd9H+i7mCokKiuKSO/66IAzHXzB0eGM9MzduY66mBPZANP/xWy7pQoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=utvtmBrKSHpwS1D2hE8oOEHOvnrmU7PnX27BvTcx6Hc=;
 b=aW+71Kgl4rOAb2JRztSk+eChqPAL7cO/4wx9j2bbZwigpj2pznmxeYizICnObVvtB4twAPdkDtw6uXautpsQXf0wMn5dQNwPw/x3G08F6yLzswqTqlnenJcNngh2lsFXoskKCyfTc9ErXg9CfRQaw3iD+bGxTomXDgJ+EnrwHC3Be9qkaRmY1TaXLOLxll/E+bYoH3EhvowTG3jAUszKc0GtGijNSMgRAI2Il/gs2YquGkuP8mIl5yIqWy6bDD6vjB880ZUPpZeRbbSLcr8oOWaQr3diGh9B9jBjoe9LQ5Hn6XTq2gLc/mkAN4yV4k0m/QziP6+aMp6L6p0UcJt5og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=utvtmBrKSHpwS1D2hE8oOEHOvnrmU7PnX27BvTcx6Hc=;
 b=n50I6UCLMkAeIpLg3dvLSV95R3seuSbEvesjnwCFN/M2OfsNGtiiyQYz/R8e2Rtflchhl7mOUnStJPlAnpSG9GKO/xlN20minXwKHns94sF/UXBW8ZiE8RIs3lmXOUGwT8FGhWbRK2hI2ul29p3XR4FG6wn4lybCLIpOATFnuIi+hiwc9kZjAThS2ljbCJaijcpsNfqFiUzYZaZHwZlCMBILffS0aijovcjenDFlzFpmCMQ+Sm3RCRd8icVRvsbdpnSF+Cl8/cW92cKoerLJE+weZe5p5ekPneWjz/uQbHIZiWtz+ddPBRjXWptPkzXUo6T5Rr+sBAJg3MZARuSI3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DBBPR04MB7675.eurprd04.prod.outlook.com (2603:10a6:10:207::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Mon, 21 Apr
 2025 07:40:02 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 07:40:02 +0000
Message-ID: <34b8d290-4b33-4d26-86c4-b7da08a735a0@oss.nxp.com>
Date: Mon, 21 Apr 2025 15:39:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] media: imx-jpeg: Reset slot data pointers when
 free data
To: Nicolas Dufresne <nicolas@ndufresne.ca>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250418070826.141-1-ming.qian@oss.nxp.com>
 <20250418070826.141-3-ming.qian@oss.nxp.com>
 <22e43e927514ebfc20e97f2bfd5fd52899820627.camel@ndufresne.ca>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <22e43e927514ebfc20e97f2bfd5fd52899820627.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
 To PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DBBPR04MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: 9729135b-60b5-4e3e-e0fd-08dd80a7b9c7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WEdWSm13RW1UTGNmZjlUQ29rbFRWMm44TmNQY3NQSUtvMEYwSzlhbkpGYlVl?=
 =?utf-8?B?SGxvZkUxZXFGTlhaYXYwTENMSFE3czZ5VDVndCtLWElSS0JCWEZyeWprQlAz?=
 =?utf-8?B?NGNNTVdCVjVpd2NRVVdQc0RJR3QwZzdpbk5xSDVsalJCMHFjS1doanBXN1M5?=
 =?utf-8?B?ZUtoTkxMRnNJeXNxeUl1S3hkWUxUek5iZnRyWUVxYXVJT1FDUmk3ajZyWk1X?=
 =?utf-8?B?dlZ5WURJbW1MdGdKdUsxZXYzNDlBM2dOWkNuOW9Ld09FUys2MWd5SkhvTGVE?=
 =?utf-8?B?ZWhlSEtWTnk1MWlQTG9sc1B4NGxnd3pGYWs1VjRGT2hHUGVteDFPcVljT3Z1?=
 =?utf-8?B?Mms4SHpwV3NTMG82SFVYaGUrYmV0ZGZRZjFUc2ljNUtHNVhPWEQ3K1FJTVUy?=
 =?utf-8?B?dk9Dc004K1Voa2lrT3lkblpBeGdXcm5hcmVZaUkzUGF4MThrZWtmT1I2UGpt?=
 =?utf-8?B?Y2NORUdmTGMrSTZKcmFmVkpuQlRZWUFJaHVQdURvN3hmUm01ZXNGbTFPNlM0?=
 =?utf-8?B?ZUgvQUlqM0RvTEIvTkpGZ083RGk5OUZjWWlHZFVJY1RIZ1VOOHFGcDMxeC9S?=
 =?utf-8?B?WUY1WFNFWnNLaWlTVFlMcjhJdENaZU54WkZrbnhqQXJ6UXUzcEgxSUFKWHho?=
 =?utf-8?B?UWVKbHFydkNGMXF2c1ZoQ1pzRFMzVUxOWHlQQlUyQlZjMzBVWkowRDdJeXN2?=
 =?utf-8?B?a2E4WGdMMHlNNXBUOFBCWDFTUkVaMWk0Vy9nWjZZUWw2RHp6VTZlc3dqSW93?=
 =?utf-8?B?ZkNmYU1aRERFc0xhUWdDU2k1cC9QanFZTkJqU1BnbWxnNUFIaWlPQ0xWS0ND?=
 =?utf-8?B?N0loNUMzS0lKQUxTQTdDdkhhaVErSjdCaE5mQTZvNTlUMWtxeDFFOHJoYzBE?=
 =?utf-8?B?eEtjNUxSS2xZM1lLdHMzOFl2d2l6R2dGTHVGVS96RW1tVUM1cGtFZStHNk9D?=
 =?utf-8?B?dTVEYkJjQ1c2U001ZkM1WExhMkU2WERrUmNpVEp6TnRkUzc1TS96TjRaOWtj?=
 =?utf-8?B?R0pCaDZRMFdzSjZPc2didkxXeHRqVGFtWm85Q2RWSUQ5VXZKMlFTcTAyTDZX?=
 =?utf-8?B?cTZxZG5uQUt5TEs4SmpBY3c4SzVoWks5aDJrWDgyV3VKTHNjcTN4ZnJVVURr?=
 =?utf-8?B?azJpMTkxL1pSU3hWZGt3dFYwUnRpM2VMM21SVm5CM1p1TFV0WHdoSDZ1czl2?=
 =?utf-8?B?eVZkbXBDbHY2V2pJZElzRVpBbjFxNnBEb3NvdDltR0hYTnl2ek9EWTQvbDJt?=
 =?utf-8?B?T3RvQy9FZndVc05DU2VxUlZxNVQzZnNBYTVFZmplNlFmdkJtZTR4OHREOFp0?=
 =?utf-8?B?emxaaVYzRlBndzh6M0E1Vkh4NE9hemlmcjhwZG44Rm5aVHlNNmN5aktEZzFE?=
 =?utf-8?B?T3RPSFhGY2Z2eEpmYWwzSXh3enhrekgzRW9Gc3N2eEp6MHJ0dVoxRWR3eFRY?=
 =?utf-8?B?ejJ6cytPbTJiYjl3bk9zTFh4YW1HU2xINS9sMU40RFhVZ0lKNVlNdGNYaWFF?=
 =?utf-8?B?a1UzcGFIWHpMZExDeXNJN3lBM2pNL0xiY3lkYk0zYjlRN1hJbjdvYmZOUGZr?=
 =?utf-8?B?NExHK210bkxWZURxZTlzbXBZZ0QxR3JoeW9NWFVmdEVNNkRZRmlKdE1DVHNQ?=
 =?utf-8?B?ck5DblNCSGtDRUVWbUlLV2lmVmtZMDQyMzQwMktzcFk1ZW9MWGVNaTIrZUNJ?=
 =?utf-8?B?NXNIdERCMUNZaUJXKzQ3NHc4Tnh1WEUvZERBNVpucGRoUnFTcUxpZHl2THNr?=
 =?utf-8?B?bXZjLzdWam41UTcvRlZXbCtHZjVwNmdCaUFYYXV1UU5zNmw2dkVUNGg0dzBD?=
 =?utf-8?B?MU51aEpyVzdOa2tGaEZCVDNzOFMwOFZPK1E3SWI0YkJhakFhR0w5eUlUUHZO?=
 =?utf-8?B?eUdaWitBR1FKRFNOZWxGS0V6c1ExMXZmQ2xYemxFRGg4ZktoSGtXcGVBMzlH?=
 =?utf-8?Q?Zxwhhgu+NSo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mk40Q3NRdko3ekszdzdYNzd4ek56SHZseEk5eDFDcys3aVZudVVzWFVoRlZB?=
 =?utf-8?B?ZDU2eG4zRlZCbW1ESkpReHlqR3ZRYnFIcm1CS1djenpIN1lBYjBTUGFaNFd4?=
 =?utf-8?B?ckh1aVJqQmFrSkd4NDcrMHpSZ0FPYThoVFUwNGVzeVRpSUZwK2pNdTdLSUdL?=
 =?utf-8?B?Um8reDZxa2hadmVxd2Nmd3NUZ1oyVy9jclJNWVpROUtYRkhrRDErRkdHWFRK?=
 =?utf-8?B?SEFSUEdzdFZJVmVXZDl2THhUcW5jejErcldoUUFFR29GbmhPblNPdHJRMkV6?=
 =?utf-8?B?SHppSlVFeXVzeThOdWs3NXJ6TFBlVUlueUlaQnRVSXNRcGtrUk5oMTBVODFT?=
 =?utf-8?B?Zjl0UHJMTm04V0cwakk1Zm1LenhmWHhzN2wzamFvdDYyYTJ1eHlDTC9iUGE4?=
 =?utf-8?B?QjBqM0hVL00rUDEzaVFLVnN2RDBUNk1DOFFCM2RrNkJIRGJ3NnNkUFR0VktH?=
 =?utf-8?B?WmJucEdybjFiOEVhMjRLSkk5d0ZrVjZzR210ZEpGTmx3ZUxWYlN2UGhOaks5?=
 =?utf-8?B?VjBGSmJGYVN6Q0QyeW1SUmxjRWc5SDJhcUdaeVI1QVFlQXR3UnRWNDlwMjYx?=
 =?utf-8?B?YXU2b3dMQVl5dlRvdGV2bnRjMkIwU3B4cm52c0g1ZWhNSXdhaWlSek1hNVlX?=
 =?utf-8?B?RWEwaTJTWmxHTW0zUURPWGRjVlFFNktRMVFZQjgveFd3dmNQZ0ZOeXgrUlNS?=
 =?utf-8?B?UG9uZitiNmlzdHNQSGNqUnB3SUY2bHVlcFF4SUlZblFFOC83Rmkvc1F1S0F6?=
 =?utf-8?B?RUJWQmJGTjhHL3h3VUZNdU5QS1RBd1dtek5rSVg0V3ZoUElpMm55MEh3MFVz?=
 =?utf-8?B?UUZWdFREN3p3K05oaFhLN1JSa015OTVCOXVVcHJNSjEvcDcxckpCZ05KUlJx?=
 =?utf-8?B?MnFrUDJFYVpyN3pWT2dvOEthWU1UUVM2cnEyUGF1MWpjY2xaRDJsVlNtcGhW?=
 =?utf-8?B?MXdVWGU0T1p3QnpVd0pBY1NGSHY5TEhoNUtaanVIckx3MUdQU0Z5WUx0eXpL?=
 =?utf-8?B?MDM3bWtQQkVTU1Z2WDI4ckh5cDRKSU5Ud01OU1UyRGdLV0o1aHMwQXhIZzRm?=
 =?utf-8?B?V3U2My96QXRrOGdJYWo4eUxWWGpwTkkrU2ZvdFhUVUlyRjFlOFZ5bFg5VXl2?=
 =?utf-8?B?L1N2SEkybEdQc2k0SHkrZExxR2ROU1FDbWkvazBWRW1zdnNtYkgyeERqZnVT?=
 =?utf-8?B?YzNIMFFLVnJaR2xneXBnMlR3MFduZ2NTVk03Z3FSNVRySjlXdnBPZWhNK2g0?=
 =?utf-8?B?Mlp0Z2NYN3dUdTZJcVN0d0NJWmdRc2JJaHZqcUFMRTN6ZzlDU2VvcFdlUEt5?=
 =?utf-8?B?eTlkMURxUzB3SFQyY3Vwb3o2cUFFS3M1MGgvcjJmUWJaVXdqZXRKR2RsdDF2?=
 =?utf-8?B?NmRnelZEL1BHVEk2c2lXRW42Uk04OWhTTTBZQjNPOEtBU01GZGZRZmVsWS94?=
 =?utf-8?B?MjdSTjUrVlZ6bVppL1NCenZHUTU4UnBzb2pWYjBpWXh5aU96YlFNYVgxMlpu?=
 =?utf-8?B?L1ZVVnpVR1lKUVFjWk1xY01FTkR3WkdJZUVxejVGdXZoK2ZsNFl1SnVqYXZD?=
 =?utf-8?B?Sm1jT3hRMHJKQ0tld1Z6VVRPR2EzQ3lwa0puZllBWXY3ZUovakN2U3RRNFhF?=
 =?utf-8?B?ZC8rZjJuVGRibDN5N0ZmOUY4REMwUldDN0hOVjVuVExYNWVnY25qMzhOeUVZ?=
 =?utf-8?B?Tkl6SU5yVTJ1UHVHL2w4bzhETDZyTm1wVm1lT2ZNTDVSYW9vcGlaWUQ3WDBl?=
 =?utf-8?B?Y2tLRjJSa3EvVlh2QTM0dE1nMDN3amNCTGJmNnZvYzVhQkthL1l5enhIcXl5?=
 =?utf-8?B?eGx5RHNweVVFN0lDR05EZEkvZWcydHNtWWFUZHMwanBFejkwNjI2Y093RVNk?=
 =?utf-8?B?TDFFSVlLZ1ZVMWFiaWxaSmo1aFQ2MlhpM2dXTHdxUDJOeUVQRHc1LzI2dVI5?=
 =?utf-8?B?b2cybXo2VnlaUWxvYlBVaXVXb240YmxSbC9CdmVpRFJwazBQamNhZkZLeUxB?=
 =?utf-8?B?ZmwzUDFuT0lRUjFJa3VCd1lTZkJ1N2d0dlAzbU5sLzlzN2pmdWRuaDlwV2Mz?=
 =?utf-8?B?ZTJzKzliUkNHQnp2YnkzelZpWEFsS2psUmxLL2xhNmtzVm1JZkkyQTd2dDZw?=
 =?utf-8?Q?LiF97BvdpJOCSO4rcH6SgZqcO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9729135b-60b5-4e3e-e0fd-08dd80a7b9c7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 07:40:02.4084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e5aPeRJMIZ+Ouko95gGCzT7TWkUc/LGgw9dbJlnR3NTzrEL79jaam99scDlhyxgR5RwXQqV6KUYRFb0qqEZTSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7675

Hi Nicolas,

On 2025/4/18 20:49, Nicolas Dufresne wrote:
> Le vendredi 18 avril 2025 à 15:08 +0800, ming.qian@oss.nxp.com a écrit :
>> From: Ming Qian <ming.qian@oss.nxp.com>
>>
>> To make the function mxc_jpeg_alloc_slot_data() and
>> mxc_jpeg_free_slot_data() safe to be called multiple times. Ensure that
>> the slot data pointers are reset to NULL and handles are set to 0 after
>> freeing the coherent memory.
> 
> Perhaps:
> 
>     media: imx-jpeg: Reset slot data pointers when freed
> 
> 
>     Ensure that the slot data pointers are reset to NULL and handles are
>     set to 0 after freeing the coherent memory. This makes he function
>     mxc_jpeg_alloc_slot_data() and mxc_jpeg_free_slot_data() safe to be
>     called multiple times.
> 

Thanks for help improve the commit message,
I'll apply it and make a v6 patch

Regards,
Ming

>>
>> Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>> ---
>> v5
>> - Make a single patch to reset the slot data pointers when free data
>>
>>   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> index 2f7ee5dfa93d..b2f7e9ad1885 100644
>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> @@ -758,16 +758,22 @@ static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
>>   	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
>>   			  jpeg->slot_data.desc,
>>   			  jpeg->slot_data.desc_handle);
>> +	jpeg->slot_data.desc = NULL;
>> +	jpeg->slot_data.desc_handle = 0;
>>   
>>   	/* free descriptor for encoder configuration phase / decoder DHT */
>>   	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
>>   			  jpeg->slot_data.cfg_desc,
>>   			  jpeg->slot_data.cfg_desc_handle);
>> +	jpeg->slot_data.cfg_desc_handle = 0;
>> +	jpeg->slot_data.cfg_desc = NULL;
>>   
>>   	/* free configuration stream */
>>   	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
>>   			  jpeg->slot_data.cfg_stream_vaddr,
>>   			  jpeg->slot_data.cfg_stream_handle);
>> +	jpeg->slot_data.cfg_stream_vaddr = NULL;
>> +	jpeg->slot_data.cfg_stream_handle = 0;
>>   
>>   	jpeg->slot_data.used = false;
>>   }
> 
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

