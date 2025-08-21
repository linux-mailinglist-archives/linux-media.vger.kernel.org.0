Return-Path: <linux-media+bounces-40673-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB44B305E6
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CA9EAE85E5
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A87B35FC38;
	Thu, 21 Aug 2025 20:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="avuCclTF"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013019.outbound.protection.outlook.com [40.107.162.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9DC35E4DC;
	Thu, 21 Aug 2025 20:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807473; cv=fail; b=H1F5mu0deMns/PIit+ev7biBzLqTo2UxafsEnAjqWtgPKFQi5QSto9WQF0YtUiPKSyKCiNcladSTtLE2RIdpIBbUJpc2EA5i1YJCaqBxG7+ofE5aACP7JEVKETbAjRGrqVhxfBrRPMaj09qSvBMmQKNkYXdNVWMgsdhYn5ZT4Z4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807473; c=relaxed/simple;
	bh=vLyAn5GtDIw5OZwos/W3CqNAfHCStIGMfdU+MZAuv3c=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=unyqmdUrnZUW+p3kOioy2orXrETNwFDwSvDD95tqERm+TxCIqUtRaKT49Khsga6mcFOQ5mympYy1yubafWWj2JNYmWarTXnSB7ksYGGl0BsN2lWHmrTOY1RxGBJoX08gaFzA53QW/8gS6IJdQ4MXWvkF7y0g9kiTbMopeYloRtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=avuCclTF; arc=fail smtp.client-ip=40.107.162.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJmP+7BW62SLeVzkZ2HS5iP2ZEwsUlqEpxJezEb/yBb0+5YHcjd0VXrOsJRybz0qvU9n3WqDK1iFbXshFLDa2QpUTp+cWVvP+Azdy7XOA74BJ4nZbj2uSxaFCUa9z9087h5CLXUvMoHtwel+xqfH+80yjNg/ewlOJApRasPwRRAEOTSkL86nRrppGIaxdj+c8h1mr4HOSmYO6YdegjLcBHKrszq9eUvrgTtj4YdaJvFmr2Wsecp4YGbI2RIi3v8Ig1zI2ls9TixYvNY/0lVQVKJLWHOOpczFJaXF8CSZ+EpbqKEiuTKCwaptyBBdSuM2+fZv++/5rNDwvi4RrJzEIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjKsY+K6hVQFxwCyihNqgD5l30BqHuDohdw214ma8sQ=;
 b=EkuRVWlOK/sPdaRmuz7iGeL75/dHJUL/bF8hR2yIiJCYWFpGKJZzzk/yxLiAn1juL4J4TL0Ij2KPrcWBxYN7K4J1MuWpL+tCwuOQ3v0LmaIjicxL24BNGW/TKR9xkg8Lf6ziSBvzDIJFxGAKNvAxtve7RTs4PcNWLt0+fKabAzb9U5CzaXvVP4otaccYLIZJAbALsHk0Jy/Ga42I+a8H0htdtwsjt5EOTL+7RWs3RFUnBX6Q9McDSmOcwr+hMSy3YoQH/YuPeVHv140bZ1lPy6YVHJRPH35yXgOA0GqiJfcXbs86zCKBsLftb9MSuDJx8ftcqjmwMJ/mS6mo8/agBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjKsY+K6hVQFxwCyihNqgD5l30BqHuDohdw214ma8sQ=;
 b=avuCclTFsNwxrfMQ8TOx8fKFwEHLo8U1PbAko5OZA27gZnWtMVyUSA03DzJ7cB5zOt7aBhOrFCeshuvBXkotgzTzqXWUJxPXwid9tWTrLAHHXNqbF49V20aRf7iDKeto0uIB32sB6t9/qMcltTvjdpvJRZmcqXCpSDtrFsmF6H2/FLsn1h8fZF1AYxqSuSrErWIJd/wC2+PuC9p6734CFu1BslhnRL3DJ6mTjXG4qitGxmNix5GaesNVZOwsDLpqj4xO08OcfdlgPaOIxWWNV3s8KhG1JkRh8p9MRh+lr+JPE5lwmrgpAAbAQfMEloaAE7HwiqXOmHv1P2Y2uqOo+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8438.eurprd04.prod.outlook.com (2603:10a6:20b:411::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Thu, 21 Aug
 2025 20:17:49 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:17:49 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 21 Aug 2025 16:15:51 -0400
Subject: [PATCH v3 16/31] media: staging: media: imx6-mipi-csi2: use
 runtime_pm frame to control clks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-95_cam-v3-16-c9286fbb34b9@nxp.com>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
In-Reply-To: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Eugen Hristev <eugen.hristev@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-staging@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807362; l=3877;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=vLyAn5GtDIw5OZwos/W3CqNAfHCStIGMfdU+MZAuv3c=;
 b=DJg2obFH2kFJMRrgqA7/8AEgneo2NdeJMMLsFpwdJitXJRNtoti0GwLDGhlDRDDn1GE9IUjwQ
 wqQ6YyVoyDjDavhlJURhrGFWD79MWgGRH15jBcBN0U7l5oJz8Iw/5Fi
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::13) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 4943533d-d239-446b-9f8e-08dde0efcc9c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|19092799006|52116014|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?blMvRFBDa2UzaGdkL1JKaVVpL1FWckdPL203c3V1bVRTVWNYUjFRYUQ4aVZB?=
 =?utf-8?B?N2t6Sm1odmF3OWdWRG5rbVlNU0JNTzFIaTRPN3FGdUszUDFBak9zTE9JNmJy?=
 =?utf-8?B?cVhQR1NkRmJBZFB2RnlVdzlTVlFEQ0tLaFJGMVIwbUVDTHVmcTRCN0JON1U3?=
 =?utf-8?B?d2NLcXo4SHJUcGd6NU5EREFuWFJObjdkRzlydHNYNnBBV08rU1hqblA3anV1?=
 =?utf-8?B?SDg4Wm1NQkVSbEpkWUtUenc2dG9PVDdDSjNBem5OY1FZMmtjZGxtazZ6eE00?=
 =?utf-8?B?eTZDTXErc3hqQ2ZoT2VRUmRhM1c0d0JOeFRXTWFvektxWEZyeVA5anpSa0pu?=
 =?utf-8?B?Qk1SaXJkZlBWMzJQcG1XT1ZpaFVMSGc3cmhaZ0tySXJQU2wzOGFoTGsxNnJN?=
 =?utf-8?B?UFNVc01JWSthSjIyWHVOdXFDTCt5T1dmYUJyM0lHLzdrV2RGc3pDcHJZVmxU?=
 =?utf-8?B?VTJFVUpMZ2JCaG9GOWtWdXF1V053cTQrM2dGRlowZlV5SDM2Qm1NeVMwOXV2?=
 =?utf-8?B?YzZ0dTRDbUR4bFliOER3aEZNakcrREhldHlOL0ZhbFFZeUNiVnJqdVYrM2ZE?=
 =?utf-8?B?OEh5V3lPK0I2WEJxaDFmSUNOQUtweUM3OUcvcG4xbFhuUW8rTVlJUWZ0RFBD?=
 =?utf-8?B?WXlOV0FNWHFBUmxZNVR6MUVBdGxJMU9TMVNPNWk5akVMTVFXRit6NTFmNDdY?=
 =?utf-8?B?ZS9uSzJmZlBBYWFrQ0ZseVVWUGwvMHBPd3VLSk1WS3M1SThiZXpuZTlCaDRK?=
 =?utf-8?B?SFVTY0Q2YVNySWhjNzJGOWNvTWdTT01VcDZ1RWlaM0J3OFhyMXZKdURaN1d1?=
 =?utf-8?B?Tm5qd2xZUFhUNUZua3JHWW1waUhTc0VjUGR5MGNZL2VlNTVHVEE2bFFUSDNn?=
 =?utf-8?B?YmdsMThIdlpkc2kraEV1aG1VT3U4ai9UdW1LcnYzZlZ3K2NleWliR1BZajZ3?=
 =?utf-8?B?TXByaWpSK2kzK09DUHBhQVh0ZEhwQ3BHZjd0SStzYU44dzc0cHNKSzFYcVln?=
 =?utf-8?B?OEFON2Z6cFlSS2JMZkpwQmNkNHNmN0tkNlB6amFiMjdEbmZ4OE10TTNHM1Iw?=
 =?utf-8?B?bGhXMGNrbFNxbFZ6NUpKbG56Zkc5dmJRUm9EYURoV3RDdEV1VkljNW1NOTIr?=
 =?utf-8?B?MHZRVzBKSHlZNlRBYmR0d3lsQmZ3aXQ3SStoamVjNnlpQmZzcjQxOC82Q3Zv?=
 =?utf-8?B?SmprQmJjT2N2ckZqZlJwYWkyVEdLL2hzZEZHSWJzaXlrYWExeUx1Z3Z5QjFN?=
 =?utf-8?B?aEF3dUwrUFhPeEhNSDhxMFBGdlF1YjFQTFdvVFk5VlNPMVhSMUlNc1FtOGxn?=
 =?utf-8?B?SzFubGQ3dEtHNGl0T3BkdklGWFNxaHRkdDN6TXU3cVRIb0VXRjB2ZmpSMDNJ?=
 =?utf-8?B?OW00VFNUS1hrc1A1MTNpZWZmaXFveWo2bm5TTVVYaDV0Q0RhaDRlNC92bnNj?=
 =?utf-8?B?T0hCRGJZaWZtclFpRjdLWjhkcmp0ZlRNeHdQcDE2QjBFd2xpVS9WYjFjeTRq?=
 =?utf-8?B?Q2hqRnJwL280KzRxR1REQWZGZEdJUzYyZ3lreC9oTjArUFJ3ZGViZEtLRUV0?=
 =?utf-8?B?dUp5OGFEZXpwemx1QXcyQ25LWUIrTmROQ3JPUDh0TVFjZ1B1VGFDQVZPWmdr?=
 =?utf-8?B?M3dNUkMxcGpUcWtpaFk4STBhdGlqcHZBL1RWNW4xeXl1NHJpL2g3dGFsaE1z?=
 =?utf-8?B?Y3A2UjhqR2tGSWpLcmpnWE92ekhKZHRoMC96Z1FyS2VlbDZ4QjdiaG1QWXpG?=
 =?utf-8?B?UnVjUEkxcmM2bGxaamQ5b2JoTWg4d0NlTWxTOW1zcFhCL2hGbEEvMU9mb1h5?=
 =?utf-8?B?azJydnl5N2h1YzJSUEYyM3d3Q1BiTTVCVGV1RDhQWGUzVHNiYUp4SjNMZWZJ?=
 =?utf-8?B?ZFZBS1FjZm9hMTlTYWRXTUsyUGIwVzE4U1RuK09HcDFVSjVUc3kzTWpUeVF1?=
 =?utf-8?B?ako3VUMzOFFHVVR4MUxtdDlUSlRkMk5sMmdtekdvTFptMzE0ZXMzZTJlRVpD?=
 =?utf-8?Q?A2s8i426s9JpUwpJ+qbMXTolIgkp/8=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(7416014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?SUltZWhVVHdSWUQvdnQ3cE9WMmcrSjVMUG05bzBDMW9pMXBqeUhhdUVYSDZh?=
 =?utf-8?B?TEUyMHNJUDlXVUowQlBWVlZub3IvQlV1QlByaHB1QmVHMXZwV3RrYXhtVHdI?=
 =?utf-8?B?Y0xuVmdLMUJKeE43ajUva2tKTnV6UVBFR0ovck9YRnc1L05BUE94K1ZBZ0Rq?=
 =?utf-8?B?ckxyMGdVUmh1STJ5cmRqY1BYTHlUU3d4OVYzSHVZcjgwa2FhVXp1bE53WTJ2?=
 =?utf-8?B?K3llYnZQRlJrVmJSU01pYXJBUmdZMkpQTWdVTjZHNVRoWGIxOHBmcWZMUVJT?=
 =?utf-8?B?Ykl3T2xOdlNyZk90bmN6a3l5RWg4V2M4YzYzQmhlUkhaenY0TVZuRnBpL1RV?=
 =?utf-8?B?Lzc2czNHZFZUMHNRU3Evc3lSTVVwMUk2c1dKZnBnMFhvQUR1cjQxTk9SSkVs?=
 =?utf-8?B?Qy9EL2JibC9ZdlVxdjdqK2p2d0xoellKVVRCdHBPUzNlQ2V2UDA5cDJkZGp0?=
 =?utf-8?B?K1B5Q3dqMzJXRE1MN0l0NUFnQ0ZIMno5TW52YVQ1dmI0WEhwNmVEbUJlYnFH?=
 =?utf-8?B?bWVlWUhpRXRNdnRidU1LVkFVTVMwajM2b1BIYU54ZVNaRld1M3A1UXA5M1VN?=
 =?utf-8?B?Q3RiRUs4NDNzc3NyK1VoVFN6elJ4ZFpLaWNRU0RKV3BOWHlKNWZvQUJiRFJy?=
 =?utf-8?B?RmNLd1NpNmZYMFZxeWpQQVYwQXora3ByKzVwdFpxZWEzVVRQNktvc2hrRnRP?=
 =?utf-8?B?aTEyMnE0V1ZNZGNWNmVPaU1NYSs3cEpiVHl0UDVzWEo3d0N5YVJXRnZCZ2VT?=
 =?utf-8?B?cDM4aGZDZVZ3alZ1OU9RTVByT2JHQ3IybW51OHNtNUlCWkxtUDJOTWFtM3Zz?=
 =?utf-8?B?M2dPU3hQM1pVS2pzMFExQnZ5VWhRUTM2eE1LeFFtdkNXOStLSUcrQ2JxNEpp?=
 =?utf-8?B?b2NqM3NZTW1rcTFIS0tOTFYyNUdGL1RmUi9vTGhaZXN2blVDNUNCWjlLbnc1?=
 =?utf-8?B?NER4bnNBOTdWV2ZUakNObTFTWm1FcDA1Y3NHb01UQkNpQzNGVkJwdEFUcjV2?=
 =?utf-8?B?aVNDKytOcWN1UVkrVFNXQmJoWkplOCtjTlpBc1VldEt3SmQ2OTVPMEFrcGd5?=
 =?utf-8?B?cUhzdFVqUTJ6azlBUVBUVXR5WC8wQTgrNGRJckpubStzV0M4TWRHWDRrenRq?=
 =?utf-8?B?UERjZlZ1YVhhUlFzYUZ5UHcrWVRNZmt0bTgvdGpuZFJjckJMU2tvdGxDbExK?=
 =?utf-8?B?QXFQdnB3Ykc1VnR2dytGdzNnOVBLc2dqSUhqMHVpcS9pWVpSM21UUGFRSjVY?=
 =?utf-8?B?aC9sdk11ZVdzQjQwN2NjSkFZMUdoRmMwTkQ4SG9qMU52OVNMS1p3NEVvUVJt?=
 =?utf-8?B?MjFGRGxIM3RES0Q1cHZDZUx5eDFuc0JSRnFPbno1eDkxeTZWZkNhanBKQVIw?=
 =?utf-8?B?eEFCVTZJd09mWExDSkNrQ2IySWFFbFVxcGpTdXhFV0oycHB6Y1piUFBpNFh6?=
 =?utf-8?B?cE9BNUlhT3BQRzh4SGtvTTdpdmI5ZldWSUxpSWNmMUxlVWlrTFViK0ZPb09R?=
 =?utf-8?B?TXdnNWk2RVNJUzF1WUx1ZE8wY1hhc3Fad1RPcXd3SFU5RlZBMjlkT3NsNVBK?=
 =?utf-8?B?VHRYT0tvcDlzL09NVXl0NTQ4LzZGeGpxQ0FldDBUcWZzNlo2N1kybTBzbkRX?=
 =?utf-8?B?d2p4dXhkRnlPZG5LSXZRZnBhdlduajBpbDBwdm9pRkhpYnh4amJEZEdSZFph?=
 =?utf-8?B?dmFPRGVqZEVtSklhNTViZ2JaS0FSTTRtWW5ydTRtM2ZLS0JDUEs2RTJXMzNi?=
 =?utf-8?B?VFFrSnhuZXpJMGtRS2dhOFQ2RmRFMUV2MFFGRlJqV1EwdHlnMXlkMW5mUGJO?=
 =?utf-8?B?dFZ6QXJjcEEzQzVFYnZGa1BQNy91MmhoNFdCWVh0WGErWGQrVmVxWVFYZUpM?=
 =?utf-8?B?MEtSd0Y2T3gyeGlCWE1Ia3ZtRlRzUVZnaVpvaHJhd2V5NG1JcG1OTWpWTXgw?=
 =?utf-8?B?ZlN5RGV0bXd5VStGUUxkOWErU2ZVaHgzOFFJK2FPZlRHbEhXbXpYRmxFSWMr?=
 =?utf-8?B?QzBuWUl6RmM4YWo1bW45WTRVdkVjeU12T280TlRSME9tVjNXeDZuLzIzR3lW?=
 =?utf-8?B?RVcxZEZ0OWpxdTJpRlA1czVGY0FzQkZJeDI0bWJpOEtnZ1E3ZGwrR0FDaTJU?=
 =?utf-8?Q?86vc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4943533d-d239-446b-9f8e-08dde0efcc9c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:17:49.2827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PeKU/7x2ocVmHJzJgaYB5exXyEo0I4BnQJNNFFphZgR+CxOWEhSxWMi1r4moFGdAw6riuZwyB+IYHo3mfE6oHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8438

Enable runtime pm and use runtime pm API to control clocks.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/staging/media/imx/imx6-csi2.c      |  4 ++++
 drivers/staging/media/imx/imx6-mipi-csi2.c | 11 ++++++++---
 include/media/dw-mipi-csi2.h               | 18 ++++++++++++++++++
 3 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-csi2.c b/drivers/staging/media/imx/imx6-csi2.c
index 696644aa04c83b1f2877b2b2315202627d927e96..e5192bcd886958a27f4255fca1055ae0a94866ef 100644
--- a/drivers/staging/media/imx/imx6-csi2.c
+++ b/drivers/staging/media/imx/imx6-csi2.c
@@ -154,6 +154,9 @@ static void csi2_remove(struct platform_device *pdev)
 	dw_mipi_csi2_deinit(csi2);
 }
 
+static DEFINE_RUNTIME_DEV_PM_OPS(imx6_csi2_pm_ops, dw_mipi_csi2_runtime_suspend,
+				 dw_mipi_csi2_runtime_resume, NULL);
+
 static const struct of_device_id csi2_dt_ids[] = {
 	{ .compatible = "fsl,imx6-mipi-csi2"},
 	{ /* sentinel */ }
@@ -164,6 +167,7 @@ static struct platform_driver csi2_driver = {
 	.driver = {
 		.name = "imx6-mipi-csi2",
 		.of_match_table = csi2_dt_ids,
+		.pm = pm_ptr(&imx6_csi2_pm_ops),
 	},
 	.probe = csi2_probe,
 	.remove = csi2_remove,
diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 8a8741e1c688756ee755e9a13991ccca893e5b5c..22e0021fab17f3c8e9a6c41c2f2109f5112dd6e5 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -273,7 +273,7 @@ static int csi2_start(struct dw_mipi_csi2_dev *csi2)
 	unsigned int lanes;
 	int ret;
 
-	ret = clk_bulk_prepare_enable(csi2->num_clks, csi2->clks);
+	ret = pm_runtime_resume_and_get(csi2->dev);
 	if (ret)
 		return ret;
 
@@ -323,7 +323,7 @@ static int csi2_start(struct dw_mipi_csi2_dev *csi2)
 err_assert_reset:
 	csi2_enable(csi2, false);
 err_disable_clk:
-	clk_bulk_disable_unprepare(csi2->num_clks, csi2->clks);
+	pm_runtime_put(csi2->dev);
 	return ret;
 }
 
@@ -334,7 +334,8 @@ static void csi2_stop(struct dw_mipi_csi2_dev *csi2)
 	v4l2_subdev_call(csi2->src_sd, video, post_streamoff);
 
 	csi2_enable(csi2, false);
-	clk_bulk_disable_unprepare(csi2->num_clks, csi2->clks);
+
+	pm_runtime_put(csi2->dev);
 }
 
 /*
@@ -634,6 +635,8 @@ int dw_mipi_csi2_init(struct platform_device *pdev, struct dw_mipi_csi2_dev *csi
 
 	csi2->tstif.write = dw_mipi_csi2_phy_write;
 
+	platform_set_drvdata(pdev, csi2);
+
 	if (!config)
 		return -EINVAL;
 
@@ -669,6 +672,8 @@ int dw_mipi_csi2_init(struct platform_device *pdev, struct dw_mipi_csi2_dev *csi
 	if (csi2->num_clks < 0)
 		return dev_err_probe(&pdev->dev, csi2->num_clks, "Failed to get clocks\n");
 
+	devm_pm_runtime_enable(&pdev->dev);
+
 	return csi2_async_register(csi2);
 
 }
diff --git a/include/media/dw-mipi-csi2.h b/include/media/dw-mipi-csi2.h
index 935c664440aae82d69f0253a551b91ec4ff2724e..3d70c1f4f38e7d663f9b043d8903ce57d630d1b1 100644
--- a/include/media/dw-mipi-csi2.h
+++ b/include/media/dw-mipi-csi2.h
@@ -3,6 +3,8 @@
 #ifndef __DW_MIPI_CSI2_COMMON_
 #define __DW_MIPI_CSI2_COMMON_
 
+#include <linux/pm_runtime.h>
+
 #include <media/v4l2-common.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -86,5 +88,21 @@ int dw_mipi_csi2_init(struct platform_device *pdev,
 
 void dw_mipi_csi2_deinit(struct dw_mipi_csi2_dev *csi2);
 
+static inline int dw_mipi_csi2_runtime_suspend(struct device *dev)
+{
+	struct dw_mipi_csi2_dev *csi2 = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(csi2->num_clks, csi2->clks);
+
+	return 0;
+}
+
+static inline int dw_mipi_csi2_runtime_resume(struct device *dev)
+{
+	struct dw_mipi_csi2_dev *csi2 = dev_get_drvdata(dev);
+
+	return clk_bulk_prepare_enable(csi2->num_clks, csi2->clks);
+}
+
 #endif
 

-- 
2.34.1


