Return-Path: <linux-media+bounces-52086-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHS9MmexgWloIwMAu9opvQ
	(envelope-from <linux-media+bounces-52086-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 09:27:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4015ED6373
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 09:27:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E572D3078067
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 08:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C514AD24;
	Tue,  3 Feb 2026 08:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FtnaGp/1"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013041.outbound.protection.outlook.com [52.101.72.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCC9393DC8;
	Tue,  3 Feb 2026 08:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770107124; cv=fail; b=HxHbl1hnwf4Kab/fzzuSHTEX/f5qtakBAdWjyRttGL/sWY+ml0PMxO4xq07kcq1Vt9wW2CGerPRZ02ZiWs4xvrmXcB3uLHxp27sHJl+cJqbde5anoJOC+8cVNRIz1T0K9BDbendGWIAUG5QxF9rhKjfGMeCC9dsJ7ENZ9ehRf4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770107124; c=relaxed/simple;
	bh=a2+iRhKeUdcEiwWkvvyA84w+oNAuAaqpZp8H0eW9CAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b+1/Pd2e6CmdifsD4Z15+SotfsbPtZDIiXANVrG+3asxBoVN2Bi2S5+AY4q4wXHdC+IiDCT7lsFKRbusEMjBYgv810MdUeB8kuJ9s0lAxGLmpb3wZRvSa0CRWju9inkMxq/l7+eVRqf3Q761w+cA+xmJ/XMoJni53nqK5FlBhl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FtnaGp/1; arc=fail smtp.client-ip=52.101.72.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EEEW81t9PVvts0zUUiwuDYsjA8AVpSl5fTCOiFt35xebTQbLv1A5/Zzq19clw6SaxEpi0d1UYLW10BrdHDJdwxWK6CLaPqJfbTTlstmkGEduO/Pnl51TuTtyct3KT5YceU6coJP83bMu5Wj9qs+qPWYGA9FRx2Fzc0Av9ffdFTnKO7AnU8t2Cpg+CH/nCB/Gb+LO8yQD9EXBhxL1eXeIU4kLzoLuBdpF4PyswyQSMQSRbmqdN1T5vKCft+JWbi/zxBvsnwq8PK/hiMxF+3o14v+LN8gzAAez9/mUruXG9YaAh0fpzHWlQnp9PJci/NM8enRxTgztn8zvck09zXkG2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jD+27UQ/alJpluHJg4yM9vm9JaVVyn7c0qvbcJsQgdM=;
 b=mVKii7v9pOgFxmkaYSHT/H3C1wfv71ungrgPTWVjYgT/esM8ASDQS0rRmZi/zOZ2e6hO+dvuvnN5GdomtQkR2iIP7mG5B0XVoEPWzpW0GNWqFbMyJfjCdRPGbFGAcbd3BjE08vUng+nG3Sr8APi7LNO1tPxEaUmHPanElDI8TpI41U9LoMPISPkZEypjxhY/HlB4GU6oxUvunNKdc4Ak8+fH168oR2eTYFjeT8LVbXoqpg4JSow35utnw+VuGkfj4hUnvnHANvBktGjiF1jQQ4WyERWnXNrbOOwabPA8VtyIg5U4HSLFhqBl5WyXYfWGadOADkcB1asrW5XeR9kEig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jD+27UQ/alJpluHJg4yM9vm9JaVVyn7c0qvbcJsQgdM=;
 b=FtnaGp/1r4Qd2dV4kPnFlAIhuUElief/quafqOEEkUfEaCCXsP06/3sbIfUwLO30HLoloME3NJfAFtDry5btfpoBJNGz/fLiJb6s1vb8REdqk9D1iJs7z+0i7p7qJqZiZ4OeHe+EhT1SJc5l3kwmpepaH4hIwpNGyGCrIeETTxql8U9Hs9+w7QiHyKGYBYBsIlmLSagHbtVP/oDb4n05EPqsamJQ4H6Vfsp7VbWKPrX1wCRon6Y2J5QpCZEHlyz8qSGvSXQUDEizMhoT0DbqaX5LjNBSSpOXRj0LCdPu1oZ1AGRsWgOzkwVGW6IGXjCNo8BJxsGA7kk4yMfi4WzNdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DUZPR04MB9919.eurprd04.prod.outlook.com (2603:10a6:10:4d9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 08:25:15 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 08:25:15 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: nicolas@ndufresne.ca,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	linux-imx@nxp.com,
	Frank.li@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 4/4] media: imx-jpeg: Add support for encoder v1 descriptor configuration
Date: Tue,  3 Feb 2026 16:23:41 +0800
Message-ID: <20260203082349.1082-5-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20260203082349.1082-1-ming.qian@oss.nxp.com>
References: <20260203082349.1082-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0112.apcprd02.prod.outlook.com
 (2603:1096:4:92::28) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DUZPR04MB9919:EE_
X-MS-Office365-Filtering-Correlation-Id: 834c8fca-3ed3-4f59-c353-08de62fdc1d8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RTmugrM1IdZTizyIOvMU4clVtkXIxqvzQXSJSLLfhK1x3xO4/JzaPjZaCyEM?=
 =?us-ascii?Q?ZLToWHNMefPPk/Oivy+hrR4ljNbVoX8/QNORMxqE38SP0HV6ie4W50lmIxuA?=
 =?us-ascii?Q?aM490drh5CqCF2MTsAMngJ4ddIPVOiOXegTJoxXwNCHj+ETtn+j76d3BLVD7?=
 =?us-ascii?Q?2CMbURREP+eAXdulbfIntcATJUxbpmXELPGXcsaTp8FwePkySJB6udlibNX4?=
 =?us-ascii?Q?pqrTdiIm/ijO6SHaofwaWu5ZhIlR/FJwtTF6sFkEeW+Bywfsnja+8C9+vgDp?=
 =?us-ascii?Q?I1mV7bd5BY6+kGhZOY3olXBBUm4LL0OX9bxvjhOII6JLVsJseEaiIrTyxgRc?=
 =?us-ascii?Q?CkpHuDyU6F82mx4SPVMZIiIZNCVf6ZP/gResZze0U0LdkO/aUGqtXXeBa/9d?=
 =?us-ascii?Q?YS97ngPZoDAgCTQ/pRudf0rTqT+oAysLS53MH9qqIOxzZqlW81aSwWU6OlWZ?=
 =?us-ascii?Q?rzCuEOi8blXn9hbjK7Gk5b5bnXnDBN9gtg5j3C9AZcA/NHQ4DU1q2bo/GDRg?=
 =?us-ascii?Q?OLA62vgJTnMDUueS1oyFav0h+U8piPguMIaoDDmemZdPoloVZV7U+3nwRbUn?=
 =?us-ascii?Q?CjF+4hD8U/BulP2ARWV0kJDRpC+/vhsFxGdfpLkHMvhLgBUwexSIOT2x8USg?=
 =?us-ascii?Q?lsgsVkOrO7VM0klb3SYvFQ4Vl3X/9xqZoox4I3M+ARGZR2dH6Av1vlrI9zKo?=
 =?us-ascii?Q?Enx5Vzht9QXLnAfid9LlF1AuyjWB8MDKIS+2ZWUNQdRNRAcfC6Ja9Uqff8cm?=
 =?us-ascii?Q?r33p5pvF30ExvaMm8sIRHJkS97r2s9s4JnHfKXoMfaeGaGuRG7bAJJvwQqN2?=
 =?us-ascii?Q?YwIl1aK+/vUxunGhMRT3ATRHzCYy7yTNPxBm9xBVvDTgs3zpjTPYo8Dq/oW9?=
 =?us-ascii?Q?oshad+J6oNjRvBHzibwV8HE3+6mjDDxSUkAhAQ9iM/NLdfZPyMCU94poZRQP?=
 =?us-ascii?Q?VHV60ULiSZBMzd6cPvfCYb+uqV4k+WwE3p24v265e6WbrYUPdPLdEfKtsFM9?=
 =?us-ascii?Q?2HssuVtlePf1XW+qxMHhi7Yek0aPijiw16qvMwsbkBX6CNir6HG8sf9UFxF0?=
 =?us-ascii?Q?XC+ScvEARWEv1qzC+cFLtv679xAWfwVGYKUlS4vW3kptX8G2cYt9aaptrcz/?=
 =?us-ascii?Q?9dr3XGLnQh0mzflqeGBfFyoN/HnQdEuuKVi3cqd9DtImae3RnWBd90odL2o/?=
 =?us-ascii?Q?OzgiyRYDEVahV9sDLcd6pgJ58lnB6uqPWD+IUbPHT4H5V5+/ZnBPbMCUukY8?=
 =?us-ascii?Q?tsJiASJJnWqlW1h9mXHv+xvutK630PKmyzcvnp6DrXYUKNKmUyLrc81rOAEG?=
 =?us-ascii?Q?JGvcz+JKQCY7a4LL89ujvUZndB/XaMHLSdd9OOIDR8PAsHXf14h0pnlw9Muj?=
 =?us-ascii?Q?O0npYLrR7L1/Zo1K2iV7MaSCOEeR/wJ2uLwG20NdiRs7gPdIOlJJ0vewl7SC?=
 =?us-ascii?Q?HYv8bOnkuTk8HnkIX+gGLYaYqpywueKZrqhJ3Zn3uggVLp3ftrOk5LK9QrIm?=
 =?us-ascii?Q?7DJdzQzF+zeoWlwz5dNyjKjfAGvk80k59soyY6M++Gz39I+t1NVaJ4w/Nq3E?=
 =?us-ascii?Q?v78XynFRD8IfXOi+YvAzNhl4tf2TK/QX03HtKGE/GUxMDRRaILnO/fd+PKx1?=
 =?us-ascii?Q?ZTjhav4wHPnL+/OlzM6yhvM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LhjAgAZ2tVtG4rlCfcs84pfHbbBY7+FW7NcV1lT/DVIvoI2Xi8pMw0QSLTjy?=
 =?us-ascii?Q?5/9je8DGdp9pmV3n/06lIfO7ZeiFsgxuZ9HiRmTkn5QcnDEi8YT53WX7HhKb?=
 =?us-ascii?Q?Y1uoPd0CooruZ2ghDPjvjt9Dbzao+Hg/wPXNloFFQh2dyzrP1xX0UG7kvxet?=
 =?us-ascii?Q?TT3drDqRT4tSNEvsP7IHlcYez0msGfrQbnI2brRBn+sUgceFXFx9qZ1Jc9Wg?=
 =?us-ascii?Q?uqbA9EQ84+INhfx7jyOAydvZmthGQIkxOeUeuhXb/Sb2M81PIHJi7Zrruu/a?=
 =?us-ascii?Q?w+ZG9BEb4c13sU9pp8FDwOR6UiLfrSQDuyEt+0DtNUk/3q/a3EX5R9ZtsS0f?=
 =?us-ascii?Q?ASWh5jVLXC8nSU7Y1i2UIhRr0pghe+JFUs/x+tLlEjtU6QJ91yS/eIPRd1VD?=
 =?us-ascii?Q?ft6K10O2/FjTm2UJ0IU5qhSgkm20CnfaI03mVtafJIOaBhWRgAyW19bfH03n?=
 =?us-ascii?Q?TdxI79cSuWczPl3Lfw6e8X0TCmujeKw0Uvs6xotbHze3G7skt62VFpIviNqN?=
 =?us-ascii?Q?jtU4aAt/1WwcjBKmxqjK6ksKlZ1FwbFZ9Ygor4WoY1KslOIRP4IQX/P+c/x/?=
 =?us-ascii?Q?cXo4Om/dthwhzne6X3iOIETixIKvHCb7ExbyGEhm4maREpuVg32ADHRIyl1C?=
 =?us-ascii?Q?PAP/w1sm6JOgwcUv4eP/RNeOeOIXZuEj4A+M9gt6sjktCg74xG567R+2lEZr?=
 =?us-ascii?Q?pVj8V31fxtJT/AjSPLKgHtvuzCIacWfVhD8n0qwIEHDJlGrK+X8S6+F1oqcD?=
 =?us-ascii?Q?NZnERzsA6ihp1BIwe3MIPoiueO3dWKyupjqlpE8e+71MTyz7212AMxz5BvXm?=
 =?us-ascii?Q?GvL0yA+SmWa0/lKRtwKoPVpnQ1B52asiIJBrP+VnuyR43vWNZWMHc6+GnnJE?=
 =?us-ascii?Q?JG8bE/zzW2wvp1tFlWX4CX/zj426KAEwrgwnRs3Zcp5TYeY4Ki4/KLP3ZdE0?=
 =?us-ascii?Q?ncnGnmpisfs7k5wUQPJ7Et07fT02oX8FqZaFBAN/3DPqHr3OlUKAAT2aWwBH?=
 =?us-ascii?Q?mUkCH5rUlgF0FxEmlLOOaGQN4vL0heO7ztx5wAhZgU0YS+ByGDuzt+7HpHzi?=
 =?us-ascii?Q?waC84QhSpnnbgaLGc6hwHwesS8yWAwrMClkQ7xBoNC29pS4pSi/p2uwUc5k5?=
 =?us-ascii?Q?yEY4nI4LrcZKIUQMlAiQTypQDNKcDEkFMRYijx7OBTH4w6cj1vEK80lw8bTP?=
 =?us-ascii?Q?u2lKANxfJhlZ+11cF4ALZ5JzcJFzuNGwinb82yfAN95/4q4MsGTRO43x12Nk?=
 =?us-ascii?Q?4rQ4TqaR3h0gcZd9Z0X36a3cuSIwHmzA/YMCjjTeCReu6UEp3TX8Ht0n4fOz?=
 =?us-ascii?Q?cNrGLLoURdeAYRnlIiMJY51TRW8MdmIlulCk2Y5JJuBitou99mNSm88p5QqU?=
 =?us-ascii?Q?shYxwHrPjMzA4DeBPy/0OVEANOfiBkckP2yrQPQpOnlUEWcDh0CdYEeCe1bO?=
 =?us-ascii?Q?W56W7SvF3NYmKRxkqbeyTY60lshjHknLKmymtlUq8d0Ntka/aK0P7h8rACpS?=
 =?us-ascii?Q?fMFnAChgcwLPj4zgsYDVQpbjTnLEz5DGcuTHKdTbDhDuBusMZcSpjnK1MXtb?=
 =?us-ascii?Q?Bgt9G8dJ2LRjn8b66892oQQS8WcQY2If9wd9voFjV2Vfs/mpuT5aRbqeBIhH?=
 =?us-ascii?Q?p4CVbQ+Ld1CgS63W27cd1Kga4PYe6fwPEheVxGaQqDo+ZkSlTG42TaxrogXR?=
 =?us-ascii?Q?t2uaYwG7iHuGfVbtBDVziEKymPUR5EH8F2xiIHVOIOfy5NEoWFVRZflqWlN7?=
 =?us-ascii?Q?tAlLZlIGQA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 834c8fca-3ed3-4f59-c353-08de62fdc1d8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 08:25:15.6076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H83Mra+VL9j5dFbmfn27UOk8kCRktfDwQT7DiA01fVxseccRdvgwJFFDfW83Qb3eZqX+RQQ2Osk030a8gp17bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9919
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52086-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[ndufresne.ca,kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,oss.nxp.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim,oss.nxp.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: 4015ED6373
X-Rspamd-Action: no action

From: Ming Qian <ming.qian@oss.nxp.com>

Support the upgraded JPEG encoder v1 found on i.MX952 SoC.

Detect the encoder hardware version via the version register.

The v1 encoder uses an expanded descriptor format that allows all
encoding parameters, including JPEG quality, to be configured directly
in the descriptor.

This removes the manual register-based configuration step required by v0
and reduces the interrupt count from two to one per frame.

V0 encoding flow:
  1. Write quality to registers -> trigger config interrupt
  2. Start encoding -> trigger completion interrupt

V1 encoding flow:
  1. Configure descriptor with all parameters including quality
  2. Start encoding -> trigger completion interrupt

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |  1 +
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 43 ++++++++++++++++++-
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    | 11 +++++
 3 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
index adb93e977be9..0d78443cb270 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
@@ -73,6 +73,7 @@
 #define GLB_CTRL_DEC_GO					(0x1 << 2)
 #define GLB_CTRL_L_ENDIAN(le)				((le) << 3)
 #define GLB_CTRL_SLOT_EN(slot)				(0x1 << ((slot) + 4))
+#define GLB_CTRL_CUR_VERSION(r)				FIELD_GET(GENMASK_U32(19, 16), r)
 
 /* COM_STAUS fields */
 #define COM_STATUS_DEC_ONGOING(r)		(((r) & (1 << 31)) >> 31)
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index c2e2c028b410..5723ae677153 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -1417,11 +1417,32 @@ static void mxc_jpeg_enc_finish_config_manually(struct mxc_jpeg_ctx *ctx)
 	mxc_jpeg_enc_mode_go(dev, reg, ctx->extseq);
 }
 
+static void mxc_jpeg_enc_configure_desc(struct mxc_jpeg_ctx *ctx)
+{
+	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
+	struct mxc_jpeg_desc *desc = jpeg->slot_data.desc;
+	struct mxc_jpeg_desc *cfg_desc = jpeg->slot_data.cfg_desc;
+
+	ctx->enc_state = MXC_JPEG_ENCODING;
+	cfg_desc->mode = (ctx->extseq) ? 0xb0 : 0xa0;
+	cfg_desc->cfg_mode = 0x3ff;
+
+	desc->mode = (ctx->extseq) ? 0x150 : 0x140;
+	desc->cfg_mode = 0x3ff;
+	desc->quality = ctx->jpeg_quality;
+	desc->lumth = 0xffff;
+	desc->chrth = 0xffff;
+}
+
 static const struct mxc_jpeg_enc_ops mxc_jpeg_enc_cfg_ops_v0 = {
 	.enter_config_mode = mxc_jpeg_enc_start_config_manually,
 	.exit_config_mode = mxc_jpeg_enc_finish_config_manually
 };
 
+static const struct mxc_jpeg_enc_ops mxc_jpeg_enc_cfg_ops_v1 = {
+	.setup_desc = mxc_jpeg_enc_configure_desc
+};
+
 static const struct mxc_jpeg_fmt *mxc_jpeg_get_sibling_format(const struct mxc_jpeg_fmt *fmt)
 {
 	int i;
@@ -2874,6 +2895,14 @@ static int mxc_jpeg_attach_pm_domains(struct mxc_jpeg_dev *jpeg)
 	return ret;
 }
 
+static int mxc_jpeg_get_version(void __iomem *reg)
+{
+	u32 regval;
+
+	regval = readl(reg + GLB_CTRL);
+	return GLB_CTRL_CUR_VERSION(regval);
+}
+
 static int mxc_jpeg_probe(struct platform_device *pdev)
 {
 	struct mxc_jpeg_dev *jpeg;
@@ -3012,8 +3041,18 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
 		goto err_pm;
 	}
 
-	if (mode == MXC_JPEG_ENCODE)
-		jpeg->enc_cfg_ops = &mxc_jpeg_enc_cfg_ops_v0;
+	if (mode == MXC_JPEG_ENCODE) {
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret < 0)
+			goto err_pm;
+
+		if (mxc_jpeg_get_version(jpeg->base_reg) == 0)
+			jpeg->enc_cfg_ops = &mxc_jpeg_enc_cfg_ops_v0;
+		else
+			jpeg->enc_cfg_ops = &mxc_jpeg_enc_cfg_ops_v1;
+
+		pm_runtime_put_sync(dev);
+	}
 
 	return 0;
 
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
index cdfefb68346a..c00c13549746 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
@@ -81,6 +81,17 @@ struct mxc_jpeg_desc {
 	u32 stm_bufsize;
 	u32 imgsize;
 	u32 stm_ctrl;
+	/* below parameters are valid for v1 */
+	u32 mode;
+	u32 cfg_mode;
+	u32 quality;
+	u32 rc_regs_sel;
+	u32 lumth;
+	u32 chrth;
+	u32 nomfrsize_lo;
+	u32 nomfrsize_hi;
+	u32 ofbsize_lo;
+	u32 ofbsize_hi;
 } __packed;
 
 struct mxc_jpeg_q_data {
-- 
2.52.0


