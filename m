Return-Path: <linux-media+bounces-65574-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z/QrBloOPGp0jQgAu9opvQ
	(envelope-from <linux-media+bounces-65574-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 19:05:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 459536C037E
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 19:05:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=u1id7bHZ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65574-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65574-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C21B30C72F9
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 17:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 687793596F8;
	Wed, 24 Jun 2026 17:00:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010005.outbound.protection.outlook.com [52.101.84.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E75D351C34;
	Wed, 24 Jun 2026 17:00:29 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782320430; cv=fail; b=h6zz3z7BDSbF7Mh73PnudxRxG8uadgF43kTxNNoTmu747F3Mgt2y7SOjpF2hwYG9lMyJvJLYD7OSYp1LxK0YKzdFvcSbZJ2WJnl30GUFDc+Ck7dLZ51979naAvMaiJTdHfZH3AoXExp5beoqgCkj9w+8ZEMlDaXs6+xhezDnwLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782320430; c=relaxed/simple;
	bh=h63iRbQ1GPMDdasfP6W+ABvT0t8BNoqAmuNCpp+G0Os=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dm5c0v/W95NkOhxTUtmyR811OH0pqIjaxcpFqTihuyBmQNx+Q5I7reXmYAzKS3V/UbxHoejm3Xwfr/BxOFzDgENL2zrIzxweEy2NANTut8jJpxZsMZjgjfqdNyvsaDqxNr23ROBhsHE0WnVlgWaaEVrq39fyamdzTKGH/ZaS2CU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=u1id7bHZ; arc=fail smtp.client-ip=52.101.84.5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0PKo35vW2eKFdzpmdRXcmJ6948AT9/TrxJ5kKJjShu4ZIMHsQx2/uVnnKWCfp3TcviwweQRWxRtopLvPuv8JZhm1RkKPQtBUYrwHJ72RWSYvTwcrIfa9o+hS2P8sYhnVxnbONsKqkgBrcUQnPkjvCNJmRP+ykKxVYlpshoUW89RHCkmEYe4AyAYVKyoOALdZE0Skkvxogbhc7PWiPvjZx850NqnwApUZKVGZGbUn/ZPGnebgqvQOPEtxbbInORDQCmTHOtjS9S45PytseOmDKfHR/p6Rz8c9yi7m2k6iyI2dUy8dXzMmaGlW1MhuUGqj8t9d/NynIqx+i43PGfodw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZuU9GsMN2cftcusn1sFuZSuVC0nxYlS9qv7LpS+qQv0=;
 b=twWeSqyTy90I65SRIqaCMiQ+l9Vta124JZaH1ZQQSkkfqqWToPNpZNAUr59eHp7YlsZS7e8p110kuN4IqqSWrdJT8YO5FyuyoBf1WwtFbW8fFhXrWZMVKuVqEnop0Q/CwPleC6gG/M/TyiJ9HPPHmrCzqe9Y9ekMm7WKws7We8q8LwOeNCyMV+numTZThJ8VeXbOaybW4bPMJgnQs0tCyD37L4dX/2zOIy9qdhTpMevCMn84EGNM6oAj+2Va18qly6rTjwzGTPqD5sTDExv50Gy0qQ6KmBugp5mvynxMjoLLZ4XFdJsmGQOfnPiUau8ixql0+1DZSu8bGKVxX+TIjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZuU9GsMN2cftcusn1sFuZSuVC0nxYlS9qv7LpS+qQv0=;
 b=u1id7bHZFNFVmRbl99aTKXlbqeZ2tgjGEKtR9/YeJf9NlzyvrVMnhFu2hB3embhL0Q2LUV5XN8zYcsnf+tXihcr8OThNK6B8tEf71w/dJQdN4EfV2NLiKxGOa4P2G9C+uBxJfrU6TM2ile5igHntrBc9Y+Z/NNciMAY/nSAjk7eT7LCqg0SrbuUU9zPgKezd+5PS6BPRIkCQV5dGPqbfYedko8ul2SgD/3jgpeQzkqgbff0WOiVkYSqh3gWQ3tOna6LclXlsX9bDVU7QcsaW8rNrxRyxJvivvv03V0UqzAqLjo6MNyi85F+hfegq5VChH2mrMX5L08uxs2GqCzzpKw==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB11642.eurprd04.prod.outlook.com (2603:10a6:800:2ff::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 17:00:26 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 24 Jun 2026
 17:00:26 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 24 Jun 2026 13:00:10 -0400
Subject: [PATCH v2 2/4] media: mc: use
 fwnode_graph_for_each_endpoint_scoped() to simpilfy code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-fw_scoped-v2-2-0a8db472af4a@nxp.com>
References: <20260624-fw_scoped-v2-0-0a8db472af4a@nxp.com>
In-Reply-To: <20260624-fw_scoped-v2-0-0a8db472af4a@nxp.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: driver-core@lists.linux.dev, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 Guoniu Zhou <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782320410; l=1315;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=RRM+PhgFywyRjgfuwD0XfbDOr+bs4JubTmqSivkK0K0=;
 b=FGPSviNSd+iYrTJKvC2ipRLsPTxIZJUWiYwyXAf+veSO492fOsAlcKIUPew+gNhPL7mWDEkXz
 eETbL73GTfVBx/8/mHsa+vzrqm4e+tDZOl5w1kC/H/sKp42B0YkAMvp
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8P221CA0028.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB11642:EE_
X-MS-Office365-Filtering-Correlation-Id: 08920a39-a750-4dbd-bc0c-08ded2121684
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|19092799006|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 OU+BS4IPDSriWxLsqTb2BRHlAE616bUiqfgc7tLT0YwN7CLLqEKCDk8UnVIKik5OcaNxAO9aIJzEhCZz9M1BPoJWRHgjIERM75r/6aMg1Woenwel+O+GiJISPqXkzvIpAOuwlAZH4rVRX34NS4ZTmArbWFu5AxxLTcJB7PSljF/cEUFrJMJ+TvCXg3UbhmcOn6GCQklQe6n63AZin3krcBnDYuBNuvIC6kp26JQP0iaEtUaQz664o0OeuToEXlNhoq5cQwZmSVfbUjbzMDmw0Jg3a9z+199PQfFQlQwDSfoQRzK4QglsFzjZfQqm/VAzisMPJE7YSTjtG8IIJE1sm4KuF4POqh1N7fEDthy6B7fJl0EDzgE7PlLLPXanRcADbj7J+G0WLaFwg7o07iVWmLOVeKpWCLEv8CD4LC4vMmpoZ+KaXyEJ2GZyfg0C27cQ0HhYO80axIiw49K40J5cv47XRoD23dWNCfrR4MVPHSHaotCdIWsVQPB26Hu3RLRRC7KjFWkDCJaDRd15IqgI/TZxX76gPlMh5UNCj98eV2qCfIODTd1/9ZhWMDNSRfuZBOnPtEHsY/mTKvdz348dK2LXnVn42u4tK59OG8v5XFEC9BThIY3n8xpFBa7QGXxD3B48c1mWnPb3I9PpIdb0IXkrCo+kqia1/7tYZqzAQiJ82g/RQ1s2QVXx8sfoEcx/x+cwYh2/FIAR/ep9/zeHEQ==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(19092799006)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Y1NuV2RqblI2dFpoMTZ6QWpsclVqbGNrUDRhZHNTZlVVYVBEZDlycHRkMVZi?=
 =?utf-8?B?SnVYYVJaZjRaT09kRUhkMFhlSjNYMXU4YjVkajZBQkRYbmtVVkRDc1g1RGVT?=
 =?utf-8?B?T0xjci9wdEZ0VGRvbUJCN2lOeE1JeU1VUnBWVGpCNGpEYUEvS3krNWpOZGVC?=
 =?utf-8?B?TWpYVlZpSzZ3QVlHN0dkMWlOWWR1bVZPeFRwcUthQzRSaUgyd2dvaDBGU0FT?=
 =?utf-8?B?MnpFTnlnWGFoTGUxR2UrbW9kaFY0b1BCT1N3SG5qWkxQeVhSQWE0eDMzcWxY?=
 =?utf-8?B?WnpwZ3Zqdys1QXgwSVYxM0VkTmJNNHZGclFDQmxuZVJXTm9KRE92UnFnRmFQ?=
 =?utf-8?B?Z3VoRW1yZ053QTBWTlFhWkZwd2FKRmp1VEUwOEJjUXRMV3RhUWN4VmVJRFBF?=
 =?utf-8?B?V0RYdnBZS2sxTXlaM0JMaW9nZWluZmovK09ZMUtScGNBRVVqSDhHOUlDR3Nv?=
 =?utf-8?B?WFE5WFE3Q1VTdldMdHJlWXBPWFVYNWp4bjY0QjIwSlF6WjU4K1FwMnE3c0l3?=
 =?utf-8?B?RWk0UURaM0lMeUl0ZkZhaGZreElOR05iYkU5UDhTQ3c4aStMbjhBYU13T3VY?=
 =?utf-8?B?K0N6OGdrdW5tMitUd3BFNkZCVmVSNGh1NXFGSThQeG5UeVg1aHROUHpaQm05?=
 =?utf-8?B?ajFYMGk2US9wNE1tTFJkTEhZWm00Tjl2NUEwQUtxaldpeGVaZVJxT1RzL3RZ?=
 =?utf-8?B?djBOVEhnMkc2MHBnQkZQNUtPRlRoeDFRQzMvYlhWYzQzN0sySGpNTlpGZnQ3?=
 =?utf-8?B?c2VvZlVmeVJEeU10K1NDQTJoOVZ0R1V4RmdNMGR2N1YwN00wT0U1WlpFY0Rq?=
 =?utf-8?B?NGlqQU12cDQyeGZKNWF3aE5tLytJcG5NNVBqRWJNYUpsb0g0WjhkN0pnTUZX?=
 =?utf-8?B?ZEFUSTAram1FUENKMWl4U1l1ODhUNHVybGd6TlBqWWVIN2NnZFJ2eklaTVlU?=
 =?utf-8?B?Sy9lRXZoQStDV0tUVmlhb1pIL2pKSnpneTlQblB0dTlTbThxNTRRSktaNUpq?=
 =?utf-8?B?b00yNWZQZWpjbTBiQitIK1NaRmNkckJ2cXM5RmhtSGhsTlNlVGJwSmFBNWxx?=
 =?utf-8?B?aWpVYkRITkNxUFJmWTFOV3pjaktEeWoxWDZkRW5jUDl1UTdMd0pZSlh2V000?=
 =?utf-8?B?V1NCbGV4TWhscUhhR1BrWWpiWVU5b2FzWXJOZkkwRE1IWnZ3R0hoSnhsN1J6?=
 =?utf-8?B?L05waXhNbHNBRW5YY293bVErQmtaN09LbVU5VHFTVTEreXNmaGUrVTNhQUVM?=
 =?utf-8?B?ZGNkMjlJdjduMXF4OGp2RmdzRm5mWGZ6dUh2cnJ6TXJsbjVJYm9jQ0VBVFFj?=
 =?utf-8?B?R01XYXk0dDBCNGJucTZ6emhQc3RiZ3hwTm5hdVRvSWs1N0cvb25EUDdJcWMw?=
 =?utf-8?B?SjBVdk9ENk1HZ08xRjVwSnozNDBhQ1F0dmtTM3RRQ0dRcHlLejhZMlNDckpn?=
 =?utf-8?B?Ny8rdmFHdm9mYVRvVS81SHVHY29nR05FK1duWUNoSVFwakVidEhGT0F0RGFZ?=
 =?utf-8?B?WC9TWkRZWENXb3Nla1JsQkxaNkM4Q0I0RGsyU3hkc3IxNmw2d2Jzc1ZGYjls?=
 =?utf-8?B?WWZ6ZEJ4aFFoQzJiR0tpTU1OK2FyVzFhV1pLclNmVStFTXNOY3YzdE91c2E4?=
 =?utf-8?B?dU9tQTBuNUNtYkhFWEd1REd2S1VtL1Uzam5TVXVpNjNLKysyMDNXeWxuY3dR?=
 =?utf-8?B?VDE1MzNDUWV4OVMxWWswUWxYd2hqblBkNGdCS3BEd1RINzgxcTQzbmJSYTVr?=
 =?utf-8?B?SVYvNzdMcm4zWHc3Wjh3cHBMd0NGNzVDdklLRmNKMzc4SG16SHdKeWF3S2Q2?=
 =?utf-8?B?SVdwZVZRRVZSbmJtTEVjT0o1Y3pjS3BTRmxCVDE4MTMwSlprN2pvandoV0hZ?=
 =?utf-8?B?a083Q3NwOFlocklkZURISGg3eStidjlPM1RoUE1DeHR4OG4vckNtU2F4cDZp?=
 =?utf-8?B?eTQ3SVlPTW5pUmhJdFV3dDZOdWk3R00zdFN6V0VLRWZiRUhjaDFlU1J0VWlx?=
 =?utf-8?B?QnZ1cFVJRnlQTTdwcXY0U2xxR3FKVHZIOVRlOXA4N3lSbDRzNXlVOUNUZHlp?=
 =?utf-8?B?Y2hkTTJXMkI5Y2s5UVlBcGwyUWJLa1JOTG5Dc1FUL2dRWld2azVvZ3BMeUZs?=
 =?utf-8?B?TEFWY29aYzhCMFdRVy9GT2t4S3VocWs2L0tORnBjL2VxSWhvL1oyVEhEdTVB?=
 =?utf-8?B?N1BkU3RTYmE2RWc3SGh2NldmZEIvNkM0bG80ZVRKTmJHWWZHYlI0Mzd4OGcy?=
 =?utf-8?B?YjY0TXY1aG5TaGdxdmhTeGhnTFNBTzRKa1FkdjlBNHdiQ3pXUUt0U1oxUmFN?=
 =?utf-8?B?RS9CUU51SmxNUW5Zd0RhRzhMMjZpdEFNMjRGSWdoRTJrdlQwWnFUYUFRV1Bq?=
 =?utf-8?Q?oVQxZ4WYFKi52oa4jYlvQezqRGWyah4wiev62?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08920a39-a750-4dbd-bc0c-08ded2121684
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 17:00:26.3794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PAvSHVV9wYimZJHzUiI9Sy5ARYCCZYFqyu4xCtZFZH7+DgeLJ8oKGUxxVH1tnJMwhYsp9TAntoaLQeJSohpq1799GkhJ4zlwkibQg0cDeStSkGCKNENKZjLZuJrJTGJy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11642
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:mchehab@kernel.org,m:dafna@fastmail.com,m:laurent.pinchart@ideasonboard.com,m:heiko@sntech.de,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:driver-core@lists.linux.dev,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:Frank.Li@nxp.com,m:guoniu.zhou@oss.nxp.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,fastmail.com,ideasonboard.com,sntech.de,linaro.org,oss.qualcomm.com];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-65574-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,oss.nxp.com:from_mime,NXP1.onmicrosoft.com:dkim,nxp.com:mid,nxp.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 459536C037E

From: Frank Li <Frank.Li@nxp.com>

Use cleanup helper fwnode_graph_for_each_endpoint_scoped() to simpilfy
code.

Reviewed-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/v4l2-core/v4l2-mc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
index 937d358697e19..5d7fcd67dc42e 100644
--- a/drivers/media/v4l2-core/v4l2-mc.c
+++ b/drivers/media/v4l2-core/v4l2-mc.c
@@ -324,12 +324,10 @@ EXPORT_SYMBOL_GPL(v4l_vb2q_enable_media_source);
 int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
 				    struct media_pad *sink, u32 flags)
 {
-	struct fwnode_handle *endpoint;
-
 	if (!(sink->flags & MEDIA_PAD_FL_SINK))
 		return -EINVAL;
 
-	fwnode_graph_for_each_endpoint(src_sd->fwnode, endpoint) {
+	fwnode_graph_for_each_endpoint_scoped(src_sd->fwnode, endpoint) {
 		struct fwnode_handle *remote_ep;
 		int src_idx, sink_idx, ret;
 		struct media_pad *src;
@@ -397,7 +395,6 @@ int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
 				src_sd->entity.name, src_idx,
 				sink->entity->name, sink_idx, ret);
 
-			fwnode_handle_put(endpoint);
 			return ret;
 		}
 	}

-- 
2.43.0


