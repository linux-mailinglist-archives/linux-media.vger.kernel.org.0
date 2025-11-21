Return-Path: <linux-media+bounces-47538-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0C0C7708A
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 03:42:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E948F4E6BA6
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 02:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A07291C19;
	Fri, 21 Nov 2025 02:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="h9po8gRz"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011018.outbound.protection.outlook.com [52.101.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281EC27703A;
	Fri, 21 Nov 2025 02:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763692895; cv=fail; b=Bdg9YBPDLJAxh4tVhuTo+MP9k7smw1+nKjPA1r53bVrkBpTSPNY2x5dlA2ErxcyOtie2X99gdehcdcLUa32lM6zZEZMYymR+m/FwoeUExokYM3rS77HkaCpY7vBSXINV0HwDD65TjS7PoID5vquMgvfOScZaBSP9hZN/MpA+qdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763692895; c=relaxed/simple;
	bh=epPB1cb8R4kY+kpswl4Pyr63iSjiVlsgJRz8fAq4zQk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Elr6yQpVo5g7QcmyLXIwHwjHdSVl4Yx21J8n/yEFxaxewbXZFYmY4ZyS41t4tk5BEf3rp9fZZ7oU0FOWCNtsx8tNvOPAv+mokFFjn1x50m1aI1UFN01zh8AyRG+bK8se99b7LJogakRXoYc5GzlsMxreyIJnQjRQXF9guhmIua4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=h9po8gRz; arc=fail smtp.client-ip=52.101.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wk0UpGesO0dHm4VPE7yezlMBpm8zunsZnAAPm3My8zr74srIC4aJ94JPajlG2iVqG3/9Aa0kSKLVIxhckT1UzD4RpqhB90kTizkfeyVsKEQsk02o/WydBZyrZJ44gLg/B80jPvRVPcQz8+Jwls8mOjvWaRBWTJ8Y/xbd+nQGZGW3noP8PjR45/fK4eMCsQ35UKbs/UaKDkpr1o/t0EGaxQjSKwo2alDGr70WUG38j+NkUqY+iAQCaucNZ6uEGODEc/y22gI/lPf2TMy4qeX9H7ZK8jO2sML+YepuSqt4NTHrTsnPj7QxiGu1z8rEZEXZpuhHZ/VBANQAbVAkMa9/ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UViik8H91DpDKlhGM2wbCcRVMGWVpz1GKdG5Y58dKHQ=;
 b=gFVJAxeF7OoiC3mVKG3rdlCIfdusXAGJGDm7hKQle16/7HdQkcHa5nUOnTdtgdrFiCyf7Cxw9o9vlcTnLlqKpPXcC9aXa6oqvrRJsRbcyn+/d0dXP0GWZ7S9gMr9pr28HKqI8XvMO2VdwdP8x67LAWVjbqNigMC3BXFJJvvYgW84uvx/OkoMejV5LvBIV1pZrOzTObK6rAHXtU+F/DQzjqSDagIitGndVcnNtLsK1e0UkLqjDMMCS9nA8X4RxbjuPRX7OUyjBl8JSN4+00JpO+kLqhF6WeMMIt1T8+Oiv72+pCf2GvjQ0g2LBpDpzW2o+unVCyTMNtc06WCWsAnb5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UViik8H91DpDKlhGM2wbCcRVMGWVpz1GKdG5Y58dKHQ=;
 b=h9po8gRzOualNZiceEAMCmlONAUnxJshyhYqPb65a9RGSoQwUvbB1ah7ioDFX7tDKcFVCh9Jb8Bj30NF3P3VPz5PM3gIYkoW9Yik9kQR+KEN8FzOQI7bYLA14bxjhVhFp5SsgeCOymqcgCUTM9ErTit9CH12HMWXApjWEgMyCfBYk4DrUoVaK09dDmDQs5uMT7iWkVKjjvG7b3hoMIkhCkW8toLEpyGlT3wsNstiQGqsXNQcQWRuHSKWvIKzrT6oSYrSEKM267/8p9e4S4JbDSay2T6wcf00WquF/rnQZRYTazokKkFkSkU9ecAjRbuKrT8DmKc/S+PpeSavU6+zSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com (2603:10a6:102:225::22)
 by GV1PR04MB10306.eurprd04.prod.outlook.com (2603:10a6:150:1c9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Fri, 21 Nov
 2025 02:41:30 +0000
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::7bfd:652a:2f5b:e488]) by PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::7bfd:652a:2f5b:e488%4]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 02:41:30 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 21 Nov 2025 10:41:54 +0800
Subject: [PATCH v9 3/5] media: imx8mq-mipi-csi2: Explicitly release reset
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-csi2_imx8ulp-v9-3-05b41b897e50@nxp.com>
References: <20251121-csi2_imx8ulp-v9-0-05b41b897e50@nxp.com>
In-Reply-To: <20251121-csi2_imx8ulp-v9-0-05b41b897e50@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763692932; l=1388;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=5ZMALNNCa112G5AZW1PPvq6lmWhShQv6BEeesyrShCQ=;
 b=ovTPL7Z/0zdrWw1Q8mUux0SQbhqOaXOy3HMbWS4XpGbk4dQ1hHBx71HwDCR8u+i7ZS6Rhb4d2
 rboTbDIx4tSBLl9H48jzoi0QyGXAhbt/ExmeqcfGx4AAEKKAvCRFx+p
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR01CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::7) To PAXPR04MB9089.eurprd04.prod.outlook.com
 (2603:10a6:102:225::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9089:EE_|GV1PR04MB10306:EE_
X-MS-Office365-Filtering-Correlation-Id: c5038afe-a67d-4107-605f-08de28a779a2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?VnEzbzEwRkpNQW55M1F3bUtGcTRQL3VpbVFZT0F1eHpQemJmOFBwRHBtRWt2?=
 =?utf-8?B?VnZqK0M1aDVGSkRsU0hJMUZMMmJ3ajdVdVFGM084Z0JQK3B3MWcyWkRqL0VR?=
 =?utf-8?B?SVRocm1hcTdzMk91eGNETGJLMWlsYzZRNlNKMVRZalB1S3RJamRmaW1FcHdr?=
 =?utf-8?B?SFZqT004dHhVa3FLckRsTVovdm43cmRvMmdpYjA5V2lBNmVveXlsM2NmK3Zu?=
 =?utf-8?B?cFZMTUJpUlVGajlWMUUwVGxBOU1VVjN1T3JDRjR2WWpaMlpMMWRZYUMvcloy?=
 =?utf-8?B?aE5sT0dxRSt1U2Qvd3VHYTRZL0FYNEN1QjVETGgzMjF0cUd3Yy9KMXhhdFdB?=
 =?utf-8?B?SWRBT1hMeTBKRTFSdlpGSlRhMWdjMTkvVGFQbDRkZnB4SG1GUktZeXZ5Mmk5?=
 =?utf-8?B?V1VKSGRDL0RyVEpJU3JTUTN6dTkyVndFL0dzaE1DWmo4NWFuYThVck1DMmlw?=
 =?utf-8?B?Z045YnRhN1ViYWllaFBLSm5LRDNwa1BYTVNPdXFkVDlRVXB5NUtEa3JiMENZ?=
 =?utf-8?B?dGlUMDdpUUdXcTlTMFlOOXpjVXdyT3Vtalk5aWQ2YytJNyt3N05zamFjc1Np?=
 =?utf-8?B?VDZLc1ZFcjJPKzdqamNXU2pSTmFEUm40QndZZEFYSlBsNndjNDhvMUFmZm9O?=
 =?utf-8?B?UVQxMWE4L3kxbmdGR09vMk9CTmd0RVhqa3U3R2lUUEI2S0taOWNzRTVRRFJq?=
 =?utf-8?B?MUZZWUhaYkl1YkpXc1ZteFZMN0tWNlh5MzVjVERsemtrTlRpK1FZUDAxSFN0?=
 =?utf-8?B?SmVmT1pjV0hjZVBOalV1MGtET1pPWGo5MERsTHRrZEs0ZU9vbGh1U2t4RzhX?=
 =?utf-8?B?MERCZDBoKzg5VFE2ZVJvQitCV0JIT3pPeVg4ZmZXa1lJS045RG41OXhFdE1y?=
 =?utf-8?B?S2dEWkRsa1RqMGh0UEQ4WjRHcnh2b2ZWZDE2SUVlbmNWMWFuOUNYSnVQWGdm?=
 =?utf-8?B?M0dqT3lIZTZTM3UzSmRwSFhYZThxN2hNNWlmZDlUMXJhbGNQb1laaWJLZEJJ?=
 =?utf-8?B?STF5MnRVYi9aWmpuSURIS2NuNHpLcU80RHV0WmpYc0p6WVFGZVVBUFFwTXlB?=
 =?utf-8?B?bmtUcGg5WElyWGMydi9RUlFHelNMcW9pR1NTbm5UL1BCZktnQnRIZ1Q4VjI3?=
 =?utf-8?B?aGEzbkw2SzlEdWpxUE83c1YvUDA2c05pcDkvQnh6aHozcEp1VlA2eGZXMkU2?=
 =?utf-8?B?dGw0YXAwT2NQTTZyYWRERzcxODhoUXg0enp5RVpPTzhqWWhUend5WThWMDJv?=
 =?utf-8?B?N21jYW5JWGVoa0pCaXl0Z0lwczBmVFRROXR5VFBjRFBRbUpxbFMrM09Kb1R2?=
 =?utf-8?B?U0tKNGw5WmxEU2VjOGxiajdKdnFwaUtUOGRXcTcyQ3pHeFMxU003d0dOK0Rj?=
 =?utf-8?B?Zy9YcmRTVE5tU1FmbkpEYXc1S2RJRWF6eHMySkd0d0x1OUFMY0pvOVZ1cUZt?=
 =?utf-8?B?N3FKNmZiVzZYb1FyVy80ZSttblVPa1pXcldYL1UrMHNJY3U2dnExZE9IRmxx?=
 =?utf-8?B?TE9SNEhvWXVIcUpIQUpEY2Y1dVZRN1NuekJkSEZwbC80bzJ4dVdvTENwZ2c1?=
 =?utf-8?B?RUhaM2RCNlhFNVBKM3NIWkQwc1FURE4xNS9NMklpRCtnRGVrOXdBLzNiQllS?=
 =?utf-8?B?VEhlRE9mUzBreW4zWnpibGhmc1FpRWpUVkpSU1RNZ1I5RThEYWpRM1kwZU4x?=
 =?utf-8?B?VWV2Z1NxL3FkRFF1elNoMDNvczF2ODNRTTRuS29ydVprWG1OMDRvVnpNS0Ni?=
 =?utf-8?B?dDlWWkhnV0pPTFlMV3hjYXJaRVF5ZjJHd2hMNElkTmhiTUdveUVpZU8wYmVN?=
 =?utf-8?B?VytQMjVEQW9tMTN2MTFmOS9idUZpbDZUN2VQOUNJWCs0V0dkQWo5N3pJQ0pJ?=
 =?utf-8?B?NXhNOVVkTjFSMTVRNzRVcWl2TUM5NEM0azVvbmtoUjJyN2pHaEo2ZDlYMUtl?=
 =?utf-8?B?OVV3ZUpUYTFiWU9HMVQrdXdWa0toUTdjZm1XVmVDVkM4amcyUitkTUR0TTVp?=
 =?utf-8?B?Q2ZYZXNsL0NCcktvSDZRM0g5QWpackZqd2MyUnJqWVNjeEFjUi9mL3dqOVNv?=
 =?utf-8?B?ZTlxWE5kVzNmcTJrRFJmR2RuZkJYMEJWUlUvZz09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9089.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?YURqMERjNHAzdjNUUkUwdGpGcXdROXVCeUhYNE4yRGlJZXJJUXc1aWVWdzJt?=
 =?utf-8?B?cllCaHEya0thRTNaelVUK0hOakFKNEJLRE5vVG9DUEpDRS9saVZxMmNsa1ph?=
 =?utf-8?B?N2lySDI2WGxQM3RuZGgwaGoxU0RBcC8wSXJ2OU9hQy9QNEQ5VUxvSFV1Lzda?=
 =?utf-8?B?SHhlM1lnR0xhRzY1Yk1PdmNETUpyeFpyaGo4aUNZY0hORFVZZnhtTGFXMlJs?=
 =?utf-8?B?dDk0Qm9WanR3VjR3d2pJMTNNOTdrMVZvSzdjZjRRK1JZdGs4VGFUM05IUm8x?=
 =?utf-8?B?dTJJVUYrWlhUT05aTTl1a0pIZkREWitXVUFVSnZyZmVqN2ZMeFE2VjFUM3Rj?=
 =?utf-8?B?UXR5SWg5U1NtN2tNanBSTzNJdVpBYmc3TU50Q0lXaGIrWW9pUkpxYUc4UU1T?=
 =?utf-8?B?TU1hbit2SEd5c1FKbkl0L0s4cVk4Vmhnb09pR1l2Y2kwU0pxUk5CbXgwRGU5?=
 =?utf-8?B?eVRnSVQvNzExYzRrdDRLdkJsUTI5RC8wd3VVUVpSclJSczlEbnlxL2JyeVgz?=
 =?utf-8?B?Nlg5T25DY1grNTh3TTg4eFBwTEROVnBXM0I0MVkvemtkTmoySW0yU0VNdVds?=
 =?utf-8?B?eURld1pWNjFiQ2Z4aGZlSWs1RXpDQW1SZFpIQUVoUXpjR0tvYzFiU2N3aDNC?=
 =?utf-8?B?ZjFGOG5XTjNxaDVIRnNqRk5ZSEVNVXZkQTNxdFpTRHBERFl3eUVRVkYzRmtK?=
 =?utf-8?B?QjhLYkZJeEZLYjhaeTZNM25yR2gwbnFSZndBTjk3dDJpSXZqWC9HM0hYcWVq?=
 =?utf-8?B?R1FOMDFuczl3K2dZRUYxdUxHVDNPQzR0ZTlOKzdZQTE5bE9HSGlIS0pBSFNH?=
 =?utf-8?B?ZWZFMzdrV1dxUWtBMWhUd3dyY2RJcEhzcDZ2T2RRSTdhcmszcUdKdi9idy9G?=
 =?utf-8?B?K3VJTHoxQmpaSkM3RVhvKzRVdFlRL21QRXZ2VTNNdHczVnl2VWdNL0p2S0Q4?=
 =?utf-8?B?R3UvNUZ3dHdZS2xVNFQzQWs5WE5BRGFMWWFxWm54YTlUZlhLSUpDTEZFWWgw?=
 =?utf-8?B?aTBWV2ZreHdGenN0QnBSOC91enA3ZFhuU2psc1ZFeVVMN0xvb2d3blE1bkJs?=
 =?utf-8?B?b3I4WXZlNVlJeWlwOHNjeVhUNEpqVkl5NnRFNjJCWEtXSWxzbXNVTWhmMlY3?=
 =?utf-8?B?cHVqK2FsT21GSzAwdTZVbWZaRXdNTmZYN3Fsa2dSV05EQWRXajhUSnhuSGV1?=
 =?utf-8?B?VmJnUjNpRFBtVFY3TURTa3VxZngxQ29tOFBrVkd1cGV2dkdIMTZRLzZROUJx?=
 =?utf-8?B?QXhtVVVBUDRmMEZDMytNalhrZUU3alVIVWFUcHYyV2NvUmdsQk9HTzc2MGhL?=
 =?utf-8?B?enpqV3BkYWl4eTB2dmNqNHoyZlBtdWJNQUV0RldFcm01LzloNmhCamlsdmZx?=
 =?utf-8?B?bTVtVTdNOEpiUHVWYU9JYXEyV01ZMll2YjlXWHF4UGlUV1hPZnQ3dmZySW8z?=
 =?utf-8?B?Y0tJUGMxK2VNSzFWeVIwTW5WaWpQUkJhTVNzbnk4UXY2UVJGU3R3OVNvME0x?=
 =?utf-8?B?YnlRSnRHV2pTakVTaFBWUm5Nc0xIdjZlSnVnQldORFhUellkRnBmNnNNQnlT?=
 =?utf-8?B?Y2MxV0g2OUVXREVZQm43bmRlT21VVFh2NCtma1pJM2owTGhDRVYwVnNERmpo?=
 =?utf-8?B?QkNJaUl6TnBJbHJIa2lDckhFLzE2Qm5IWHh4bjZZWVZvL2dHZnp0OUZDSlBp?=
 =?utf-8?B?M1NnZUc0dWdncVJya2FSdXp3dDVJNFBHYjZPSWZFemM0b1QvcGpYRUJQRTVZ?=
 =?utf-8?B?MUhydEVWbUVDNzhuMHNGYXI0bldPc0NHNnNaMDRFQlJzS3NSaFV6WVpPeEFF?=
 =?utf-8?B?THRIWm5Uc0JUU0svRFlLN0k5VnJpd29wdkg4YkFNNjN6SHhUcUQ3bTZTUEt2?=
 =?utf-8?B?ekd5WXhRRkhEbUgvdUoxZFdSaTkyVFNNN21ZbmRKZTB2bDlVSUxHelQ5RVNB?=
 =?utf-8?B?aGpaUEcrWUp3a29TZDh0aTAzc2ZWUUNEaThXRzR1Y1lmeE5La0FsMHBhUGtH?=
 =?utf-8?B?UHZmOStUamg1U0JaN3JvZjR0Wmw4THNwQ250VnlVR1NXVEpzQ0lnbk8vZ0N3?=
 =?utf-8?B?cWFodFNwKy9jRXVOR3pHd0N0N28rSWlVQ1Rua1phZks4aGtFYWpRNjRnWDVT?=
 =?utf-8?Q?4q9L3elYQ0BoyETOItrIhC6Cy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5038afe-a67d-4107-605f-08de28a779a2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9089.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 02:41:30.0056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8S0O2IM0R61PyjUtqzf+ZXcb2rKxvs5ukjgFyXhrZ9QZybYENDQ7NqRkVXwBp8tQZK/t67Z5Iql80ldVz6OSuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10306

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Call reset_control_deassert() to explicitly release reset to make sure
reset bits are cleared since platform like i.MX8ULP can't clear reset
bits automatically.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 4666afec362a8111516ec2424b0d68ce48a6892e..b6de7a33d6f65a13e2c950411f66077aebae2f8a 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -338,18 +338,14 @@ static int imx8mq_mipi_csi_sw_reset(struct csi_state *state)
 {
 	int ret;
 
-	/*
-	 * these are most likely self-clearing reset bits. to make it
-	 * more clear, the reset-imx7 driver should implement the
-	 * .reset() operation.
-	 */
 	ret = reset_control_assert(state->rst);
 	if (ret < 0) {
 		dev_err(state->dev, "Failed to assert resets: %d\n", ret);
 		return ret;
 	}
 
-	return 0;
+	/* Explicitly release reset to make sure reset bits are cleared. */
+	return reset_control_deassert(state->rst);
 }
 
 static void imx8mq_mipi_csi_set_params(struct csi_state *state)

-- 
2.34.1


