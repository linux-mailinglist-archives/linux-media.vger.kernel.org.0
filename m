Return-Path: <linux-media+bounces-25692-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E19DA29731
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 18:21:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F21C4188690C
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 17:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEDA81FF1B3;
	Wed,  5 Feb 2025 17:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ickdBm+d"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011026.outbound.protection.outlook.com [52.101.70.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E412B1FECA3;
	Wed,  5 Feb 2025 17:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738775973; cv=fail; b=Ww2LAWATHU5wsIoLnlWTj/80InKOvQiL4TdJ52T2HQjzFELlV1u5uo48Xxz1yVfRB/KhwY7HzM2+17glBc1GQmpca4h8TF/0Wgiv3uvU+zinoB4VkIG0fdjWKqyf0wc7Cu4sxKs0r/rrC3wD8p+HglDM5XRsSdc39ngA9j2pGAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738775973; c=relaxed/simple;
	bh=YwaQAFv7SVgbj48n0s54O3mdgshlh8nFKGY5Gt9T2k0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rcwuLfY8vUk6HnE+rybg6LMU15K6O8DZKc/W/FzQwOGnTDRZi52XserHaxZQVJdJIAzTCH+JOHCx0ZiUSoaM5uTQflWoRdZVNk+eqqDVpVIlYJVuRzFu2RPEfrvtri5RD/MIG4d9tGcUCtV5R2WK2+uj5VFes4rzr/VHOnY9Mw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ickdBm+d; arc=fail smtp.client-ip=52.101.70.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WF9Q0RZw9FAjtxvhSXvfiqFrQLvENXocP4m0dgeTFuw8kgkHIknS4PxWZ2YuYYXmnuVFuaVRKAshSPxDQm7/vZYSrxF0gFE5opUf+FvemCNA/XMimGoJbuyaIO5oUDN9GhNSUkVr82hQnZbGVCc0jaSpNS9AQ2JcCJX2afe7+kFavYDh3st9kEWFmSyUDfu4y1yK4Gt+cdQYFpAuRyAVsBPWnpzFvmRFhXxl+sPEasVAFG98W551czFiW6jgdfDLqeNobLOJt75zQEqIM2wzqxqi7gCq6DEQGT/qYpMZEJW4Tw3P8aO0+QgN0+ctrjcZSdfFY16TMu/A4Rfa/lg6BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+QMViTnjFczWFJXxnd/3ssiliyhgDa8kwrhz/zTAcw=;
 b=RcUZru9Bucia8G6wd6NtMWlB76Xb234P22XOrbtwuzJ2RmpuqHmDBL8OCYE7mDeZw83HwwbAVq2A36scEfPpuADK2xJVPm/RGZwk0zlY2Y5DZtVJLxKfb7V8CcKpM26gb2JGuBkxxLDMA9UmaA5ZgB9586PqYy4haSXAWBeKGhT1OjF64Xs1TKLlofYaw6HMZbIWloyBGlcoysn48Dr6pU96j+Uc/wJVqRjDvX0meJmfo7o3rlIYrWblBOLljpafQfsnpix/6As2FDZF0HL+XJjwyR5kYgWaBnqwDnBf+gQSDe+kl/pwGC/zNMavo5a2kD1pHWQyOuum6oT2T50LMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+QMViTnjFczWFJXxnd/3ssiliyhgDa8kwrhz/zTAcw=;
 b=ickdBm+dagiOLq986JXdKSeKzM5AV61WTjD7Edy4+lqsSjVK+PStpyNsq7mTFXn3tSDR5uV30klIeetP0dhU2ecSkJgXZOu7LXCaU0yIvQP3rzeD5Cfkc0M+tA/51sd1wTZRMeojkNK7FTf9MkrUejiKKKPd9CbqfnpbKRH9izcflVGnTqzTnGrjT24Nwp2EmKpiadNhQrkhiySAGyOAhZpDFfRMzGcIP9/r4wL6ALxoDmZAlm8FCNYa9K6A4hqVeBB1RQV/AbVe5hWk7tX3Q8Y0ONgInQOl1gdz4HbNIo5mvxY6KeX2Eb664wF0YcSfG0f5su3gTlHVHHc1abC4ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10546.eurprd04.prod.outlook.com (2603:10a6:800:274::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Wed, 5 Feb
 2025 17:19:27 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 17:19:27 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 05 Feb 2025 12:18:16 -0500
Subject: [PATCH v2 07/14] media: imx8-isi: Add support for i.MX8QM and
 i.MX8QXP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-8qxp_camera-v2-7-731a3edf2744@nxp.com>
References: <20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com>
In-Reply-To: <20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Robby Cai <robby.cai@nxp.com>, 
 Robert Chiras <robert.chiras@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738775920; l=3454;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=dxIwPYJjEmyVIyfrbRNsRlao+LWPK1YkIsCM24ytfo0=;
 b=z+0Nw9Sq21NcT4ulJy7GmKPdX8CSComoGxbmGA/mwB2ks8IyaSCIq9VCAPGAgs6jiXhywloPb
 B6F4Ni6eVG/DNz6VJfcVNm2KmQzzJIpmlUKp1ck2E+aIj/5/7Uu8m3m
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10546:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b082e94-bcb8-4202-685a-08dd46093e70
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?d1J3NUVCcTBEaElIekJmWHJ0OG03OXlGcEsyMzdJRlpmU1Foa0k2dm90NnJJ?=
 =?utf-8?B?dXcwUE54amRWWFJwNkYxME1Ld09HamVRR0lHYlB0R1lRb0JzQVBEUi9FU3Br?=
 =?utf-8?B?M3BpMUh2eE4wbnJtZUxIZG9oRVQwZUo5ZUJlT1pTRUNVMFhhZWoxRTVKUFdI?=
 =?utf-8?B?YUdwVHB2blR6UUxYWVRkb3dTUHRMWEpKelY2UlJOK3o0QkQyMFFXSjAxVHFt?=
 =?utf-8?B?Rlp6OTkzazlTaE5iRkM2NmRQWWRQb1N5dWFlZ3lKQ0JLTzJQU0FINXg2ME0y?=
 =?utf-8?B?aGZyU1hlUkcvdEhPMVRDWlQ1eEdKRTFXS05BdUNVSzRjSzkzYlFXd0luOCtX?=
 =?utf-8?B?cS82RGFpZnNrUUpUNVE4a2g0aTRUdXVnUkUybGtWOXFxU25CY1ZYeVRQTHph?=
 =?utf-8?B?Qlp3dzZKc1M2VW5yYXNYSXd6YjhVQ0pxdmVJSmtxWC9DZ3hOOStoWW41TXkx?=
 =?utf-8?B?NE42Rk0rUXUzMnV2UFRUd3pjajFpTWQwdWhiaUV6aEFMd0Q2d3ZrdWVjNlRy?=
 =?utf-8?B?bWY0bnpoUDZGQ2xHODNVemxzaUx2NGsyRVJVVC81cVplSzRYRlA0Um1maDM5?=
 =?utf-8?B?TG9QSDdBWTlJYXJJM2FFQzVVZ0FMdVBHWXFSVGdObktJYWZUaGh3b00yUW9n?=
 =?utf-8?B?RW1ydEVhbCtWd2QwSjNmT0crTUhaWnhOVGVNS0ZCRW9VdG5Eem1Hb25CZ3c0?=
 =?utf-8?B?MW1oZnZ0cFFQWU15c21WYlU1YzAzblQyaUo1Y3BNK2FGK1hKeEU3VmN0ZFZW?=
 =?utf-8?B?WFBqWUwwR2x3NDBEeWlYZU5QOGpXU0VFZnVJYklxWWphekxOdTQ1TURVc0Np?=
 =?utf-8?B?RkJ1dTA4OS96bnZKbU1jZWQwcHNwb25NNmlBTEVtVjU0N1lUaGxhUnp5N2lW?=
 =?utf-8?B?L3NOLzBuN25MNnhTbkRHMllZeXd1TFBMeXNablpEV3NwRWt6VVR3Wm95aTFq?=
 =?utf-8?B?K1hpLzBxVE45dUlDUDBNdGFiS1pUMzJENmVwbmF3ZmNEUnlKRVJoYlJkK0J0?=
 =?utf-8?B?RW95a0xZekpHempmQ3BxeTJlOWUycTZ4eFh0WERwVzhqaTJqWWs2dUtmakdi?=
 =?utf-8?B?T0J4L04vMkRpQ3htL242L0E5RjV3aXR1b0xpdnNJQVc0S2pnb3B2ZmRsbUla?=
 =?utf-8?B?bFh6akQyNkI3WjA2WFVjU0ZNZkVYUGk1cjVVTVJ2OVFxWnQrS1E2QVgwNFVD?=
 =?utf-8?B?U003dGJ2M3JBM3k1MzNpMWZPTC9GYVNoTXdoZy9EMjVnTVl4NFB6Ujk1c3J1?=
 =?utf-8?B?a0hHQ3d2WHhmWGpITlFzalZmNVhLbGlYVHp5eUJFRXp4MTFGL0Y0akN5Um1a?=
 =?utf-8?B?U1BISEdCZG1Kd054Z1BHRzhYUk01Q0RRN1FOUGthY2FHQnhoZHRWbjEvcWIv?=
 =?utf-8?B?dFV5cHovcHV6NS9SU3U0b1d0N2VBc3pSSDhmZFJzQk1vVzk2aEptSjlRNnBV?=
 =?utf-8?B?NXFhdWZtUGQzNG9mVXJ2TDZSK09hODlVaFA5MlRsbTZuVTEyWW4wMjJBK0Mx?=
 =?utf-8?B?RFNTTVczUXl1NHQ4U2Nkd1M2dVR0K05lTFFCczAzNmk0ZlI0SWxkblJlT2xR?=
 =?utf-8?B?cVJxQzYvajlUS3h5UEdWQVFZVDVwd3VMcHhIZmtuWWNXRmc5Y0xJK2UyZjU5?=
 =?utf-8?B?dmI2RGpJVkxxRG8xL256eGxmbnBvb2lWV05keG43bUhjMm90YkhjMUxDTDlD?=
 =?utf-8?B?b0g3eFk3TWd5L0R0QVJUM0lrVDVKS21UNWt2T0pGNk5jN0lsZFlpVUsremJ0?=
 =?utf-8?B?RC9kVXFMbmxKMnRYMHNKMDlEKy9mY0Fqa2hFcU9HN0JMeFBEUHBpM3l1b0k3?=
 =?utf-8?B?MURMYmVnUWtjemx3cUtaRDI5UENoT0llQmpFUldkYm9ZYmpBdC9xbXNxdlcr?=
 =?utf-8?B?d0RKeEx0blNveVBXN29PT0RvVGo3Lyt6L3hqQlkydnZzby9Yc2Q5bTAzYit3?=
 =?utf-8?B?WTBsUlZqanF0Q3JvaGx2NHRUY294clVwVXRsVTBsYTJFR2NzTWlHandyR25x?=
 =?utf-8?B?VWFFZ1JMbVlRPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WDRac05RaklQMmpHMERpMklKYVdwWXMwNkVhNHlvUGdjeEs2YWhzWElzdEN3?=
 =?utf-8?B?TkFaRll0UVUwZDBGODlSOVdxT0ZCVDJBQVZuS2c5TWhHblJGUkwzV3BDRjJR?=
 =?utf-8?B?NktDclZPNnhLY25mQVBReGJoSUJVQTdwbkkvT2V1MDN3VmVpalFCdzFRVW51?=
 =?utf-8?B?K24ydXNQekoyb1Zna2dtQzkwNHVpbCtSWHhZcHR4RkhRTlZ4ZWxHeGFlbEdF?=
 =?utf-8?B?SndiQWt0VTQ2ZStJQ3laNkVWNktnOU84TjVUbUFhdElNdlNEdTB3SE5iQTMx?=
 =?utf-8?B?SFprZTlDSzJKSHBVbldzV0pkY2lxTHlPSkdRakgwT243b3RMMy83d1N0OWI4?=
 =?utf-8?B?cWtjeE5VM1lEb2NUdndRbTRPUGEzVzBibU1oY3BKSUYzZ1h0ekZBNU0zckwx?=
 =?utf-8?B?cC9jOTUyTXFaREIvcEd2YVF4ZVBEa3FxZXQ2L3NvTWxYdVV2ZndCUTlkbFh1?=
 =?utf-8?B?bzM5Z0RLVWlxS3hPd3Nsa1FWc1dHdThiSStTUlNkdFljZUhERTMwdnVmYWFX?=
 =?utf-8?B?Zm5leWI4d1MvRUJsUGNFMFJ6SmZRTlpuRGpnaW1IVTUvS2pDREZnbFZxZVNN?=
 =?utf-8?B?UWdXaFNNZDYwczdmY3FsYXdKR2orQStLMGZoclZobTJ3L1gxWFc2TkJodkZS?=
 =?utf-8?B?Z0NyWGZGMGU2VUJHS1RydGdrRWo5MjRBSnpvRmxZazRoMDZvUmllQ3BXaVNt?=
 =?utf-8?B?eURkQk15Yk9GSXQ1TVplNVNla3FMb0tFa0FyWFZZeXpveXNVeHpXMjlwVjdl?=
 =?utf-8?B?K3U3bERnc2ZhWnRoMEZPVE9aZGg2enliR3J0dE9GVVpIbXNFdlB0aXBnTVBS?=
 =?utf-8?B?RUF5cllSZGtXckJFSDZFSGZyR3MyT1ZndHdUd1YrUE53L1BjZGdaWGZUZUFo?=
 =?utf-8?B?SGtQdUs1TzJSdWlXWnlzVG9YLzUyUmxFOE9ldUhNakRFcnRCL290eDVkTkdm?=
 =?utf-8?B?TjB0WWRjSWI2QkE4ekhrd1BicU4wWjdTQ3hLd3cwZnlMejFnMkdQeXU0eFJK?=
 =?utf-8?B?WUlrTlRYb3N4ZGJ1YmE3UlJxNmh2K2Y0SW01MUYyU2NCaHNjMGhDZWQ0a3Bz?=
 =?utf-8?B?cGJJYVh0WTE4WDc2RlEySDJyYzhwclNsV0hBQVBJc1hac3hYMXpvVXk3OGdj?=
 =?utf-8?B?dGgzTUQrZkphcXlBWER3OUk0UEg2ZVhSSXI3ak90SVAzVVNiQ3lOVzg3VmNt?=
 =?utf-8?B?OG9xMXVuUDI5cmRNbDRneStWY0l5ZzF4TGFVWEZwcVpRMmNodEZZZURRZFcz?=
 =?utf-8?B?ZmVsRDNRUlNFdFA5ZXg3eEV6S1crZ20xNVZ4aFVZMDdsdFpqaFpwNW91NTZR?=
 =?utf-8?B?RnkzSys0RjVqMTdDR3pxVVJacEZvYSswTHN2OEtlYjNNa01OTUI2WngySFJq?=
 =?utf-8?B?RmhHYk5GTUtGbXpZMGJOeU5oZmwva0EvT0cwRVZDaFF6RU9IMXI1UkpaN1Zs?=
 =?utf-8?B?aFRZbW9HK05zOGFoR21Ib2Z3VXRwdmtqakE4bmllWllUUlQrT25YTWx3ZzJI?=
 =?utf-8?B?Q04wMisydTNpSXZ1TzJoV1I1bFk0WVluN0J5YXhqRHZYS1Y5TlQwb2lVcFBV?=
 =?utf-8?B?K2dGQlppSkNtMUdIMnpLWElVQzNyaXBDMmVjMVFCVG5BcWxQSXVCcnN4d2Rr?=
 =?utf-8?B?UTZuUEpVeVUyUUdZeE1UR2owMExGeU5JUk1NdHo5MTl4aUhicWphNlFQTUJK?=
 =?utf-8?B?YmZLV1hVNWZCMGc0Y3huaWFzc1JXVVBSaitGV1NSSGRqcjBMaEREUlNRdk4y?=
 =?utf-8?B?SFU4MVZ0MVNqbEZ4anE3TUtTcU1BbnQwbHR2WTFnMkxObUg5MnN6bEdTQ1dT?=
 =?utf-8?B?bzFrVHl1QmFEZ1FTYk83WkY1TDVtc2hyZG5zNjAvZUc1WUc2b0Y2V0hJTGZV?=
 =?utf-8?B?UU1NV0gxQloxcHZxeXUydkpRU2ZHa0ZqT3FEUmxsRmFCZER4YUpIelRsWndU?=
 =?utf-8?B?emVtUlFFdWd6di9ITWFObU8zcU1yYmZMTDBpZ08vekhhQTY3V1BRcG9aazNU?=
 =?utf-8?B?ZUZnYldqUDhDNk0ydHNaM21WZUxSdzBQVmNtSFB3QVdWa2xWcE5UaWlwK2Y2?=
 =?utf-8?B?NmpoWnltTG1UNWV1NWEybVZzS2hZMExZNUl0Q202RHhPS25BdHNvMk13Vnly?=
 =?utf-8?Q?1r7H2hPWJGXDTJcxu9eEdTIJg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b082e94-bcb8-4202-685a-08dd46093e70
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 17:19:27.3772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ewW1pdpd1KjBdvrt0Jbay9QQ5B+RecPPVg1tQJINWbfTIThV65IQZGPon2eh1nGAzbgdUwr4v1MDCFUDIf1ByQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10546

From: Robert Chiras <robert.chiras@nxp.com>

Add compatibles and platform data for i.MX8QM and i.MX8QXP platforms.
There are 8 ISI channels on i.MX8QM while there are only 5 channels on
i.MX8QXP.

Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v1 to v2
- remove intenal review tags
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 47 ++++++++++++++++++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  2 +
 2 files changed, 49 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 1e79b1211b603..a3237d76f7aa5 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -274,6 +274,25 @@ static const struct mxc_isi_set_thd mxc_imx8_isi_thd_v1 = {
 	.panic_set_thd_v = { .mask = 0xf0000, .offset = 16, .threshold = 0x7 },
 };
 
+static const struct clk_bulk_data mxc_imx8qm_clks[] = {
+	{ .id = "per0" },
+	{ .id = "per1" },
+	{ .id = "per2" },
+	{ .id = "per3" },
+	{ .id = "per4" },
+	{ .id = "per5" },
+	{ .id = "per6" },
+	{ .id = "per7" },
+};
+
+static const struct clk_bulk_data mxc_imx8qxp_clks[] = {
+	{ .id = "per0" },
+	{ .id = "per4" },
+	{ .id = "per5" },
+	{ .id = "per6" },
+	{ .id = "per7" },
+};
+
 static const struct clk_bulk_data mxc_imx8mn_clks[] = {
 	{ .id = "axi" },
 	{ .id = "apb" },
@@ -334,6 +353,32 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
 	.has_36bit_dma		= false,
 };
 
+static const struct mxc_isi_plat_data mxc_imx8qm_data = {
+	.model			= MXC_ISI_IMX8QM,
+	.num_ports		= 5,
+	.num_channels		= 8,
+	.reg_offset		= 0x10000,
+	.ier_reg		= &mxc_imx8_isi_ier_v1,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.clks			= mxc_imx8qm_clks,
+	.num_clks		= ARRAY_SIZE(mxc_imx8qm_clks),
+	.buf_active_reverse	= true,
+	.has_36bit_dma		= false,
+};
+
+static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
+	.model			= MXC_ISI_IMX8QXP,
+	.num_ports		= 5,
+	.num_channels		= 5,
+	.reg_offset		= 0x10000,
+	.ier_reg		= &mxc_imx8_isi_ier_v1,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.clks			= mxc_imx8qxp_clks,
+	.num_clks		= ARRAY_SIZE(mxc_imx8qxp_clks),
+	.buf_active_reverse	= true,
+	.has_36bit_dma		= false,
+};
+
 /* -----------------------------------------------------------------------------
  * Power management
  */
@@ -541,6 +586,8 @@ static void mxc_isi_remove(struct platform_device *pdev)
 static const struct of_device_id mxc_isi_of_match[] = {
 	{ .compatible = "fsl,imx8mn-isi", .data = &mxc_imx8mn_data },
 	{ .compatible = "fsl,imx8mp-isi", .data = &mxc_imx8mp_data },
+	{ .compatible = "fsl,imx8qm-isi", .data = &mxc_imx8qm_data },
+	{ .compatible = "fsl,imx8qxp-isi", .data = &mxc_imx8qxp_data },
 	{ .compatible = "fsl,imx8ulp-isi", .data = &mxc_imx8ulp_data },
 	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
 	{ /* sentinel */ },
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 9c7fe9e5f941f..496cad3f9423d 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -158,6 +158,8 @@ struct mxc_gasket_ops {
 enum model {
 	MXC_ISI_IMX8MN,
 	MXC_ISI_IMX8MP,
+	MXC_ISI_IMX8QM,
+	MXC_ISI_IMX8QXP,
 	MXC_ISI_IMX8ULP,
 	MXC_ISI_IMX93,
 };

-- 
2.34.1


