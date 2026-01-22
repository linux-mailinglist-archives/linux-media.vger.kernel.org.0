Return-Path: <linux-media+bounces-51322-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFgiNGHYcWk+MgAAu9opvQ
	(envelope-from <linux-media+bounces-51322-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 08:57:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DB862B9C
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 08:57:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C346C56B0D9
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 07:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E71947798B;
	Thu, 22 Jan 2026 07:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TNbMgTKG"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013043.outbound.protection.outlook.com [52.101.72.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F953339843;
	Thu, 22 Jan 2026 07:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769068218; cv=fail; b=sNkdthcmg7fGInDKKphqc3nEMRn64sFxLw3sRsNF7WhZ28RAN1rwhysYxTor495KHI3lRUjbVee/YMJaTGypSjA4/ZPdGGZ7INwnG9P7KCx/npPfwfZPL/+UbtW38BFNtHQdxb2XDPXubTh/gGfd1Hx87vO2d/+kRL6GBEQDZG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769068218; c=relaxed/simple;
	bh=Wf2c/p2gsyEMQhRyjbEpS0InlNyUZ4fnQH5i9hbAtHs=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=SRybfukB4oGZRZMP1hs93DyC5E/nixe9IU46fdNjpMAlnsMbhf9Ci/usmsAd50MD3FKpuiektudIdKyvnXbhxv7/tZVg03lgyjOpI0nnjVs3Hma/dRoyI61kS52ak2YQLQ/qsjI+4ngzYNe4yQgzni8Zl07KNMuX+PFX/Ktey0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TNbMgTKG; arc=fail smtp.client-ip=52.101.72.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFSl0czfDCaF3Uac6bvQfbs7WvTvllfpANmOsrLIFgBUCZJKPd/1pN7PVn6FoHg3mXNls8HRC1/j3lZnf/oyzbdUwpbmHadqsguO9W74zOS0MXhMXcJa9JfLx1F+1GBeUjpy+SOB4ZAf9aRsXnFTpr7wdsNpw0rHESA/r4pucjFtJLx1zKmVlg9AURxAMCVJLvu+AXiC7tXWghQH6aqf4JCdhE7jn/8eXt2EDJxmfIqU3WxIEWTRup+rjHK1aY4uG/LKg8/+LPzzE9rkXqsZY/aIzMXAOJoh6NT0jtxhdiN/ulWIEYjSwHVzbdJloSDMDb0oC6N2wh6BGrpIJN0rUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgXC+U6CmilI+bLbuqgymxy1hIlnkXZp701qbhFuI18=;
 b=c0PHfbjRYYxM8goHt/V1caFY8c8bGfdBzzHI1yEOM6MphZR/7lXi8fLY+pEoz3dAWTIZVaXr0h9C6KdhU8GqaO8W2ZXxxECi46QHjgqulkYNIGXD9REWwL6V+r3cyQuJU2+8FoYo/kLq/JSemeOhTVr3poBOBK4BFWsO3guhD21MaLzZmZ/SJKRkhxIfIcpUZ9lCL2H1n5ZxeBzQrZfub+EEbiJ+mzEdNm+dgwVRirpCy49QSQION0NBqiqDJvzinDAyvh3mi9stIGAAucuOCkX5rKjs7cymJfRnL2/vLsX5+t5cNAFGRwVddBpSqqNWacUuHyJxlFDZ7V/ewZIvhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgXC+U6CmilI+bLbuqgymxy1hIlnkXZp701qbhFuI18=;
 b=TNbMgTKGGqB+tcwciXH2YXq9B/XSAEqmOuUXSRWkOwYshArXbOZjpSwXfQbpNvCwXuXaUbOqAsMgFUXCx11MkRA1CTRRyQsAMTDuufBhgY8iHf8/kj/28UqSmXZQcJuPzwYRPhbfLHtbJFGryNjwbBAQrBAR45fbfe6ljQHwIcdYrh4PWkOmgtw7MRKsZjVk8YMPCut36jkOu2FzWEoWeejyMBLvq2EjIx82lxf/QdfWbBLeB0WZeIzLvBmk9BZLiA/wwbL9ub07VmX+H1mscOd/UGVmGFxurTog1XsdA7EwSO3fCanhM95ngvMV/a2U8xe8i1ToZ/jhA+PaetN1Qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DB9PR04MB9749.eurprd04.prod.outlook.com (2603:10a6:10:4ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 07:50:01 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 07:50:01 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v4 0/2] media: nxp: Add CSI Pixel Formatter support
Date: Thu, 22 Jan 2026 15:49:33 +0800
Message-Id: <20260122-csi_formatter-v4-0-6f6fcad1c33a@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI3WcWkC/13MQQ6CMBCF4auQrq3pDFBaV97DGAN0kC6kpCUEQ
 7i7BRciy/eS759ZIG8psEsyM0+jDdZ1cWSnhNVt2T2JWxM3Q4E5AOa8DvbROP8qh4E8J2lQpyB
 NTZJF03tq7LT1bve4WxsG599bfoT1/ZZQpIfSCFxwqjQBZEWVabp2U3+u3YutnRF3FoqjxWglg
 lRlowSC+Lfp3uqjTaNVUgkjjSqEhp9dluUDyaJGnSABAAA=
X-Change-ID: 20251125-csi_formatter-e6d29316dce6
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769068198; l=6022;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=Wf2c/p2gsyEMQhRyjbEpS0InlNyUZ4fnQH5i9hbAtHs=;
 b=gOzgq4j4x3/LYv36/uTcFtmCuP0cApFJf7So6D+9oVLx0lPYuKJq4lKky4VqErUz+a5/fzDVf
 wawcQ90/S7rB3PznlOrFulHiqfectF0f+9DjOSTey/a9HTDloHxsOD2
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR04CA0211.apcprd04.prod.outlook.com
 (2603:1096:4:187::19) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DB9PR04MB9749:EE_
X-MS-Office365-Filtering-Correlation-Id: a66df167-dde5-4767-e919-08de598ad8d3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|52116014|38350700014|921020|19052099003;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?emoweDRPNWtkSTkzb3JmMHZlTzJnRTdTTTA4K2YzVVBoeGFWanZEeW1BQmZP?=
 =?utf-8?B?NzJDZCsrRDBOdWlIWHFYZmNaVUZ0SkRUWWpoWjdXTkVZRlBjV0ZlVEcvNWxM?=
 =?utf-8?B?VU5DUGpodXBJdG9UVFcwV0Y1a1pvWDFqTVdZYk0xQ1V0d0w4WGQzMUx6TnI2?=
 =?utf-8?B?VC9QV2w1NVNYcGZubWtsVFEvS3l2WW9HVGNpMFNpSTlROTAweUVUeTlRa3NB?=
 =?utf-8?B?am1zWUNETW4yUVViTVJTVS80b3VHTkZyV0EzYnVwRTV1dVlyNTdSNHF3WGpw?=
 =?utf-8?B?WFZzNE0vbUhOY2xKejZROEtaRlIrYU9CQnhMWVFXQ2J2ZjNxVGhFTzhFYklH?=
 =?utf-8?B?ZWRJWGc3cy9vdzA3TDliazd6a3h4d01QOUNac3A5THRId1p1YktScVlDV25l?=
 =?utf-8?B?VDV6Y0IxeGlKamVYQjUzNDN6YXNHU0xWcVBRSGpFM3c0alVMazhLSW9YaWpQ?=
 =?utf-8?B?ZXVPU1BxeWRjM0NLdTh6S2F4S0FPRDhlYlJCV09hbUI0Y09ITEt5Tk5WTkY4?=
 =?utf-8?B?UGVDKy9MYi9EemthVDVsVGZQK1l2eVFXZUFyVk4vcmZMd3Nadi9sZnZYb2Qx?=
 =?utf-8?B?SkJsSU9UenlLZkV6VVpPcmdRQzJ4YncyODN0VmtZNzByV3RyalBVblVFQWxJ?=
 =?utf-8?B?V1ZibWh4R25BZWlFRDUrQUw5WHNpeUlhR241R0dKOERXNzRrMGlTNWR5VEty?=
 =?utf-8?B?STJ3NWdENkFSeE5EQXBMMHFrSjhwWUFacXhJNllINjdwSFBGNG1rZVFQbTEw?=
 =?utf-8?B?QWdiaSsrYWU2NVdYUHRBVFNHcmtwSVl3RGRLOGxRWGF0c0lsa296ZzRWSjla?=
 =?utf-8?B?cGNDdkx1SkNMeGZUTklWdkE1VWdSdVRnazZwS1NlZ0trWnlPMDVaNTVnSHZr?=
 =?utf-8?B?ZkNyejR2dEtCTmFuUnhxR0lEd3ZVZ2sxQjBLa0dXVW9kbE9Zd0ZKeDVtakZi?=
 =?utf-8?B?UzhmbEJ3QTZKazNkSjV4SEZ0dDdsNmtmcVVIdi9DNDlici9vV3dMdVNieTJj?=
 =?utf-8?B?Y3h5a3NZN2x2VUZYM3Q0Nm9pQm9HQWZQQTZCVklPazAzMzBlOS9KQ0VXUzQv?=
 =?utf-8?B?WnBpbkhTaUNOaTk2dTAxNkdibzcwS0Z5YXFqQmU4RlNwS1hyQS9DVTl2SXdp?=
 =?utf-8?B?NDVURUs2cjFCTGlOcm9EaGk3YitSRkdZbmR6T05sczcyY29GeElzc0FLYUls?=
 =?utf-8?B?a0IzR2VwQWttMW1DcUFaMGw2SjFpdUFSSVNSeWdQUWhNcDVvU01maEN1WUtH?=
 =?utf-8?B?cFlsZlJteWsvVENFN25mdzNPa2JHQkNQbWEyeFB4NVJFV2tDYjR5V3ZQOVJm?=
 =?utf-8?B?VFJ3SE5WZG1DZzVObHZhOGJUUUkxU2h6SFlVSXJBZ05YR0FuNjdiVkFlUWht?=
 =?utf-8?B?QklrY2JreE9uU0tJWGFxWEVJSXE0ZnRRNFlXdHB4VnhTNHM1M2hPWFhTajZR?=
 =?utf-8?B?N09kRVN6SXkwMHNGb2c1djJXd2UzS3V0Y1ByYUorMGtydldsYm4xUkRwQVly?=
 =?utf-8?B?VWdkczNjUG5KRllXeEkxQkNYNjMydFROM3lkSnJmTGd2MHFOUmRETWl1Nzlu?=
 =?utf-8?B?WExXKzNaTFBsNC9xclI3cTBaUm85VkZMWU40MlBkVEs2aEVnZFJCS2I0elhW?=
 =?utf-8?B?akJITHo4cS9JdEF0RFYxWE5JeEM3aGpheGROdUg3ZCthSVkyN3JOeDFjU2dp?=
 =?utf-8?B?QjRYcS9OOFU1aGxyMVVhT0FVWTZ5a0JPR3NrUFdMd2tjTzRVdlViL29hQ0NQ?=
 =?utf-8?B?V0hrYzN4OEdSQkJwdkMwQUlNVFhaaDRxOVUrMm43eDBpTGN4MHRTc3cweGxs?=
 =?utf-8?B?cTAvdTlURFAreHAzNFYrMCtKdW9FcWVjcElJTDd0MGV2V0lUNnpBc3J6Qktp?=
 =?utf-8?B?UzJiTTBEeHpyVjZLY3p6WWMwQzJFWW1ONU5SYXpoY09YUU54dnQydzBLbGpS?=
 =?utf-8?B?b3RWTmM0ajBKRmtvK3cyUml5cXRGRkFoQmVZdUFCcCs1WVhyK3lIRVZHeEN5?=
 =?utf-8?B?MmpwWEhtbHFSYzRSSUllNTRIMVJLL0tvdnl2YWdWWk5Kay9LK0pTMXcwRDJ3?=
 =?utf-8?B?cDZFZDJ0VkpxMXVLekdCWk9tRU95UlluRUVrc1Raa0J1N25neXNqTllQNERh?=
 =?utf-8?B?Wkd3T2U4dCt3endpZkdHQnlXSUlublRJSFZoTGpidkxaa0MzamRYZjl2OHFJ?=
 =?utf-8?B?S1FxUEp5Mnh5L05wc2oxWi85b1N0TWN5bXpSWHJWMlZrZUx5VXRJamh0ZDFQ?=
 =?utf-8?B?UUFvM0tOdjJBQjVXQ2pKTzBVYnBBPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(52116014)(38350700014)(921020)(19052099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NmRLeHJYdkx2SzlLeW4xOTRJY2d3QnNnZzF3UVFRazc2cFMvelZxYUlSSVhu?=
 =?utf-8?B?bXd2Y0p2cTY2UTJEcjIvOUlPZkM0WXVVMjZrWmtaUys3RGVoUHlILzNVNVRR?=
 =?utf-8?B?WStRVkplMlhnRVE4NEZjVmh5d2VDektlMERVbDk2SDl0bjJOM005M3RzTERE?=
 =?utf-8?B?cmhrUmpGVG9qN0J0SnIwV2ozdzdHWjc2akgrQ2Q0YWJWTFpGVjBWMHJZNTVR?=
 =?utf-8?B?d09oN2FZMGF2eHhuL3JkY0xXZ0NianJyeEhFUDdmNkUxem4weW9GRFIyTy9n?=
 =?utf-8?B?R1ZnRW9FUW93dWxWcjRiQytVRmo5VG1mMFdjaTAxV2Ewejc4ZDJ5QmNhL1Rv?=
 =?utf-8?B?TjdpdHNxVFlZNitpL2hpODJzd3EzTUNWQU42YTBCdWFTdkg3cURybExpQkZi?=
 =?utf-8?B?TUNVS0M2SXA3RUlReERab0c1SnNXaTJFSUtpTFp3MGdZZUMwdmtCUUZOdTMy?=
 =?utf-8?B?eGJwSmp0cHRMeTRYU0dOVjJxT1I5Q2VjVkw1Z2RYR01tNWZOYWlPeFRUU1lz?=
 =?utf-8?B?OXJaa3lYamRLOEV0N0JsbTE4eWJQN1oxNFJkVmZtdERQMkZwbUNURnpHdzNz?=
 =?utf-8?B?RmN1OHNzN3hJUHNNQkRWV1BWR1ZOQlU4VTY5a2FHV0dkSGZ0SkhiK0Ntc0Ro?=
 =?utf-8?B?cnhqSWkxcmEwOXRIT0lXMDlzUGkrZnUxOWhjb1N0Q2UxUGpNdHJLN2FFck9M?=
 =?utf-8?B?aURWV1c5dTFNcEVsQ2FOVXFYdkZidStpRjQ3ZjJoUitDNGRuVFRTU3hQTy9n?=
 =?utf-8?B?Q0pOYXlvZUQwdS9GempXZllIbzM1dzVtWFdwNDlteE9SWWpWaGVwVFVjY2hV?=
 =?utf-8?B?bWI5KzB1N05xVEhDL0pYYncxSWU0SHc3QmU0MW9BNlBTT0VUc0o3M2U2Z1hi?=
 =?utf-8?B?ekhMMjQrWWcrdVJKc2ZrNzRXWVV6dis5RWxRZ3B3ZG9pdHZzc2JwZGZ3cGV2?=
 =?utf-8?B?WU5lbTlkK0xsMWR3VlNiMVF3bE1VcmRpYWV6VlkrWm00ZmEwVDgyM2dSZFlN?=
 =?utf-8?B?YjdnMVlYaEV0di9rRjAzcjd2akY3VTF4bkNVZDhMa3ExekZRTGFTYy9DaVp0?=
 =?utf-8?B?Y2ljZ2NzOXhqdWxqTlF0ZnBIMUJ6MnJRbkZFWWxFQll3RlNrNnI4Y2VuTDdW?=
 =?utf-8?B?b0QwclJLZ1oxTSs5UVBWS0JpOU9FdzdjUjlMRjR3b2dESTNtRTNTdGJ2VEFO?=
 =?utf-8?B?ZEJ2T2NoTDhkdmpjYS9Ld2hVWkNHaUdzckRJc0hmNVN5UUthUnRhS0dxUTJT?=
 =?utf-8?B?RjZvalVIOHkyUk5BU0g4NkkydWNIN0ZXeWlzdTVqeDBEKzFDb09KSE1PbC9q?=
 =?utf-8?B?dzhZV2c1clNzR2dlSllsUXRPeWdQemtvd2QzdkpXQW5UcTZVVkxiY2VNVTRZ?=
 =?utf-8?B?L29OZW1Ma0VTS0NUZElYQXdZemJ6dXVSMGNrWjhUREJxamh6dk9Yam1abDBu?=
 =?utf-8?B?cGVrVXBLUVA4clUxb0hGaEdXQXFvVW93MUVaak13UTlSZFRwN0hVZFNLcFI2?=
 =?utf-8?B?Y0dybjI0ckVTVlFNRmZrTU5KNE1TbXZGamp6NzhCOUErVUpPRjlXQzF0L0hp?=
 =?utf-8?B?b1Rxa1NsblkxS0pHVDUrYzFGQTJqRERldE1RWG95YW9hTDZGdndUM1FBTWpa?=
 =?utf-8?B?R1I5RVF0dmtOV3lFM21nQ3lveXhEYmtrNlJ5TGxVclVOMFFVOEZzUkhYM0gv?=
 =?utf-8?B?NFVuYUl6WEMrYXVNblIzYzUvOE03YnNNbmdOUXlENkZqV1A3SmJRdUNSbW04?=
 =?utf-8?B?YWQzUXRvMTNmWXY4S3hSZ044MVVidy8yUFZUOHpKUEc4SWNkZFdmNFhBd1pF?=
 =?utf-8?B?RkRaODNEbXE0V3NJaHhmOStsQzQ2ODhONllXSWZydkp1ZHB1L1U4aVFRVlRV?=
 =?utf-8?B?Wkl1NFhvL0VXUzIxOVpONjJTVHpJR2FEYU8rRUJQcWFuTnkxMGw1eHNVT3BW?=
 =?utf-8?B?Wm9kR2xnNTcvdlcrdkYzTFdmdGtVdUdOaEZjRjI1bkQwZkZZenFwYkxEWGta?=
 =?utf-8?B?aGpyczcycEtiVEpHc29SbFpVYXhoSFlRTFlaUFJrRXBRVWRHZkwrMGJjL0Fo?=
 =?utf-8?B?dnZDWGNEUHFVQnFsK3hEYzV0NUpRdHo2UjRQbFFiUEhlSG93elFqalplMDdu?=
 =?utf-8?B?bWJuc3RJTWIyY0w2ODhMSThRZTNRV2NURzBqWWtoT3QvQkpNdXQyUmdkQlNZ?=
 =?utf-8?B?VTZ2L2Jtc01lc0xLWFpXQlMxWUNWMGFtc3IyNUp1YjhSMENGdUc4VzFNTlN5?=
 =?utf-8?B?azhYeUlGRitLZ0dYMG91SGhhOWxnSUxPUnd5ME1kNXZaR0gzZ20xNEhReXZi?=
 =?utf-8?B?L0ZOaHl2TmVTMS9mdERGcFBkaWdkRGszcmRyOWd0aGZJVzBiOTQxQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a66df167-dde5-4767-e919-08de598ad8d3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 07:50:01.5424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tpn1bBU0Vik+w6eFTQgWtfiL0uFc6JY3B5J4w/PI9czmRK0MJGkKzX8tJVBC5PGGznni+itr1nRjzMlbO5xkBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9749
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : No valid SPF, DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51322-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,ideasonboard.com,nxp.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,nxp.com:mid,nxp.com:email,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: A9DB862B9C
X-Rspamd-Action: no action

CSI Pixel Formatter is a module found on i.MX95. It could unpack the
pixels received by the formatter and reformat them to meet the pixel
link format requirement.

This patch series adds a new V4L2 driver for CSI Pixel Formatter.

v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

Compliance test for device /dev/v4l-subdev9:

Driver Info:
	Driver version   : 6.18.0
	Capabilities     : 0x00000002
		Streams Support
	Client Capabilities: 0x0000000000000003
streams interval-uses-which
Required ioctls:
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev9 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Sub-Device routing ioctls:
	test Try VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK
	test Active VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev9: 47, Succeeded: 47, Failed: 0, Warnings: 0

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v4:
- Rebase to latest media/next.
- Add comments to describe the index field in formatter_dt_to_index_map array.
- Link to v3: https://lore.kernel.org/r/20251219-csi_formatter-v3-0-8680d6d87091@nxp.com

Changes in v3:
- Rename nxp,imx9-csi-formatter.yaml to fsl,imx9-csi-formatter.yaml.
- Drop clock-names property.
- Drop macro IMX95_PD_CAMERA definition and use a constant directly.
  [PATCH 1/2] media: dt-bindings: Add CSI Pixel Formatter DT bindings
- Remove the assignment driver.owner = THIS_MODULE.
- Assign struct fwnode_handle *ep __free(fwnode_handle) when definition.
- Update yaml file name for csi formatter in MAINTAINERS.
  [PATCH 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver
- Link to v2: https://lore.kernel.org/r/20251217-csi_formatter-v2-0-62168af80210@nxp.com

Changes in v2:
- Delete "|" for description key. 
- Add empty line between child node and property.
- Delete labels for endpoint of child nodes.
  [PATCH 1/2] media: dt-bindings: Add CSI Pixel Formatter DT bindings

- Update commit message.
- Use the value defined by bellow macros directly since they are used only once.
  #define CSI_FORMATTER_DEF_MBUS_CODE	MEDIA_BUS_FMT_UYVY8_1X16
  #define CSI_FORMATTER_DEF_PIX_WIDTH	1920U
  #define CSI_FORMATTER_DEF_PIX_HEIGHT	1080U
  #define CSI_FORMATTER_MAX_PIX_WIDTH	0xffff
  #define CSI_FORMATTER_MAX_PIX_HEIGHT	0xffff
- Use macro pm_ptr() to fix build warning when CONFIG_PM is disabled. 
- Finish route loop by break statement, instead of goto.
- Return dev_err_probe() when meet errors in probe() function instead of dev_err().
- Remove MODULE_ALIAS().
- Refine .enable(.dsable)_stream callback implementation, include bellow changes:
  Add stream checking.
  Fix potential pm runtime count unbalance issue.
  Add stop stream error handling when enabling remote subdev stream.
- Use __free(fwnode_handle) to drop reference to a device node automatically.
  [PATCH 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver

- Link to v1: https://lore.kernel.org/r/20251203-csi_formatter-v1-0-eb9e1147b49e@nxp.com

---
Guoniu Zhou (2):
      media: dt-bindings: Add CSI Pixel Formatter DT bindings
      media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver

 .../bindings/media/fsl,imx9-csi-formatter.yaml     |  87 ++
 MAINTAINERS                                        |   8 +
 drivers/media/platform/nxp/Kconfig                 |  14 +
 drivers/media/platform/nxp/Makefile                |   1 +
 drivers/media/platform/nxp/imx9-csi-formatter.c    | 884 +++++++++++++++++++++
 5 files changed, 994 insertions(+)
---
base-commit: eb4ee870747c3a77a9c3c84d84efb64bd481013a
change-id: 20251125-csi_formatter-e6d29316dce6

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


