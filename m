Return-Path: <linux-media+bounces-25799-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23934A2C186
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 12:31:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4443F3ABB05
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 11:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355EF1DF276;
	Fri,  7 Feb 2025 11:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eoaBQO2I"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2085.outbound.protection.outlook.com [40.107.21.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909881DEFF9;
	Fri,  7 Feb 2025 11:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738927829; cv=fail; b=taetZIaBZG/TcjG2l77cjoh+5zn4PngehbBNCYDiHTXsPQYbN5tdLgmCyXdEs93TbM+nsSyz4TlrySB26UZ3+aKo2F6pK1kO3pXY5AGVfCEBgVDfovL2X1M1oVQMGmh9BZesuX7I0cdnTLgSRPzwztSn0RZDaCWUAQ0AaQUMfCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738927829; c=relaxed/simple;
	bh=CDLcxrCX/9TBeVpP626ZgH0CqAMdFLXQunwIm7BFiKA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CsjdEwtjlCbSeVpPIw1hufJybv/j7mRBfCTUvP3SyWAH+g1lDLwF0UDY0YnjJwDQObM3AAyNEAgUKYlTjDK196c1YeQJf525TW5ccyu9YKimSUlBfyOxmDMIRMZlHJR74GEGb2NGoJsRlL0BBRlCNWYXkc+vaysU88tGXu/PziQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eoaBQO2I; arc=fail smtp.client-ip=40.107.21.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQB9F1MT7V2uIUOSD/+CbziwJOgrfzmSh7wJnm8W9fPOTS6zZ2YrXZkXk5EKS39djj8LHS7R8CHv85F054ydX9SpTDEvUVcdB7jnxUl8eloutN5CHbKH8C5uziaIOwodT9BhyMXMF+OcoC0WXTYrCVauioLWmRcQLQTH1JANQIrNDwaEDZrSTX2F2dj0pDEU/8BVvvWviUAxSZUZ/v+jKTPHUd/73atMfHdE6jnhYvyXghOH+hWrNNYzucAL60glSFoZR1BKocAC9N9imfcJG99dvf3KtNbnntikER9peLjlrfAIWqckDBfuD7dJ89wiKzEybk0tVVxjpgZ4iS8uUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/QB/IOk6Gvm9Qig9QeBdp18Hcjw1/uc02/6Fobq9OY=;
 b=zJDzHWW2834L4txlVJEXY08amfE8RQyDdqRVnt0Eg/qCYo+NSdaLPJfoJ4CR6TOQ/qTD75c+afuBpPc/Vbnfqty16ZB4TgaShgZ6qn7a7j34c04eBlWwaF10rxzEcuJrju71wa3YjFLkPTrXqF+48/KAOpZqfRp8SWMwvsdZe7h6t10dFXWyrm3HsB8QMv9+fRxccvvDAK4pl1lPvCxarCIdyyCU9XTe/dh+fOQhYbezfTj5L34mMqFaXkmCaRysEbeW6j2F9DiAH1qBq4fZDJrmaO+S+X/i5PXqCqgTtflzjMkVEMM070oeEOGfNCaW5t/iQlGYR9ufMTgSP7/JdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/QB/IOk6Gvm9Qig9QeBdp18Hcjw1/uc02/6Fobq9OY=;
 b=eoaBQO2IztOTF1vSk7FSHzOKiD2vFO4XIHqHwJTIWSaG0eA/30GFmjpkhcCMfbFAp9NPMbS8ZZ/g4yo8PK2piaTPFPbjjYmV7JugFu+yQyYyNc1MBGMiuiiBv3+GdqCoVkJKG5nvLxCUFIg6mhnIbie+wcLMgoSxGaVe4seydJ/o+WVNcaqNExH/muoTjcKTZW/vpWIF9ezmRl88Pp2BL8Erjfuw7327OLvjmX1erKwOPsfuzaWDhrlk2vyeFEx8e96zmb27+MpkP/l0+sBn1n6BTqGU5vya/J6xsK6B2MB1rrPy/cnLX0bc9usMQXkYRbvyzhCCgVWYByrJxLxDRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by PA4PR04MB9392.eurprd04.prod.outlook.com (2603:10a6:102:2ab::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Fri, 7 Feb
 2025 11:30:20 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%6]) with mapi id 15.20.8398.025; Fri, 7 Feb 2025
 11:30:20 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Julien Massot <julien.massot@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 4/5] media/i2c: max96717: add FSYNC support
Date: Fri,  7 Feb 2025 13:29:56 +0200
Message-Id: <20250207112958.2571600-5-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207112958.2571600-1-laurentiu.palcu@oss.nxp.com>
References: <20250207112958.2571600-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR06CA0131.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::36) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|PA4PR04MB9392:EE_
X-MS-Office365-Filtering-Correlation-Id: d78a5335-8582-43cc-c1c0-08dd476acbf4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bcO9yzi9+ppi9Fm+VSaN8i1Hhp6oZa/clqx71ZZskb8+WbMxbJKOmK1jz2nv?=
 =?us-ascii?Q?EkuMtC3/W51XbMkFyOQIDPSNUEIYTidw31EnT+c2zFmV64IO5s29C7MQqtBp?=
 =?us-ascii?Q?syT1kRJL7Ypmefsu6RY8ln2b6Ip6k7A7BEhlXAiG4M/w6nRVZpSzRVQzjCLO?=
 =?us-ascii?Q?Re6bsFqw9LruD0CDt/cr58ZR9S2hzi2HK1uLOHux/LJIJ73XyBjzMSM7nLEI?=
 =?us-ascii?Q?UPgFyU4SpVm2o5x49yP1ZWB84N+xR0R/IKYprW+HM/o06h3TYtgiI21zjLgk?=
 =?us-ascii?Q?ntSh+wgGo48C0GNWgJiNOROs1LK3EwYnD6A1Ud9lesnzffudt0SFnvR59sWJ?=
 =?us-ascii?Q?74nngsOQyqw3yh6+h6F6wXg9vBYxPTfATwECtZ6etKbyFEwvn5ddcSN4qz2P?=
 =?us-ascii?Q?c2ynjFgnhnVvaEETN9uYKoa2ApQr2qwzLcivWaZ/91OlSJyknT+nl/35wDhS?=
 =?us-ascii?Q?+Buj0wfXbPdbNOAB8PVHNBqB6Vz1/S/X8XlsaLGIsIzdgViI4OhggfW0eJKR?=
 =?us-ascii?Q?TF9U4C1Bc5okmsdK2TjPPX/oDz5baVp3yO4Np5KqzVQt0/wzJvBfjxDvix2a?=
 =?us-ascii?Q?/bccVrHHgYypjozKe6bjWtfY2WsISYO7+IOh5I4HqXr/vF/38lXa5Y+k1Vni?=
 =?us-ascii?Q?+nQq9n4843wsS2AmWFCfBjVbpg0uilw3HsSaP7PgWDgzo1H1H9g26Jmu01da?=
 =?us-ascii?Q?jyE9yVtPpJRIBLpRjwd+4BuoxZoNwO5VpefTZhpQbNixF1BB3XOQDD+xnVQ/?=
 =?us-ascii?Q?lE9jLL9d01Gq+6O+IUCdEohIF2ASoVdl0LDn0Nk0bQkAA+WxsPXy0U8DKzd6?=
 =?us-ascii?Q?JiFKLAYDFPFB7Qr6PFZQMVPbitLWYuxg22c0ZZlCJ8Gh5Y6ntxRjzjIKaVjM?=
 =?us-ascii?Q?Um47w9ccegBMgjU/Fy/6KTijpdVQqrG8EFaWryV00gtrKLufVy64JsB0ywBq?=
 =?us-ascii?Q?iRfyiFcETf0tSUSeZ3DTP2QGFIJhHqKEs78yb8Tqtidbuxr+FfOQIbc0VF0v?=
 =?us-ascii?Q?P+trAzi6FoXzjbvAzzLb3n9WwBLIw4pAW58vE1+khHwXFJQK+iK+wMiy1xFq?=
 =?us-ascii?Q?BIWVa9naT3sZWM+MZxDQovkvPlWZc5d009I4Nt4LKc+4f7QWBIoLEfYmZkeF?=
 =?us-ascii?Q?u0bZvYWPsxF+ueeiVfZL8PEyd9HIY5vjyosWnZkZeWDlZuIoBny6DQpJ6qon?=
 =?us-ascii?Q?eZzbYqTp7zTHDVoyhfIMJcezfYDcRi1Qu6hFtPL9GYn1msyqdyWyndfH1uLU?=
 =?us-ascii?Q?P0tJyQUIxeLLX1tl/0Mp4bd2RxgKiDTttsC5IxzbHwEiqpG92ZbzrWrjXJtG?=
 =?us-ascii?Q?ccJHQrqhqkkc8Abh84d0lcQefSehpIJYcyoqr+HxcKP28o/rhVKtYcVGPzxB?=
 =?us-ascii?Q?kJG1v4SkkpEc50X5INbK6VWkdMp8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L+JNDu/jRAXMX4U2/HaD/g3hzEpkqt4gw30DPv3rpuYLtFVL+SpU++aoT1Ui?=
 =?us-ascii?Q?DqntxDYCHXLe1Klm0h9vjXXKnuafsek6dZuoI74o8OsEgHL9+lYDaNtGszcP?=
 =?us-ascii?Q?jChqcKIBai/f/uqXeaYmdpHL3bO+slt2q33bZ0QVR4PTCOA3TOWgL6Zyyh7/?=
 =?us-ascii?Q?uqvl0AOQj8qQgSotnA+130bfmr91MPE4WUeiBHYPPKg8JP9/mhSBx3FX88l8?=
 =?us-ascii?Q?YnROSxPjzk4TJ5IjYg+IiOD/nJZuzXMUezU9AcFEHG+i6rvNnq600jJto+qC?=
 =?us-ascii?Q?aIAw7RP6UuMq8f75tujsfEx9aUG8tS/HuLSFPDSENpwj6NlSdY0v/pIEbp7L?=
 =?us-ascii?Q?HpDbcsuCoPoMykKHzhGQp1s6JveHrOld9nQv/FU4W9z8dXSrxvoo3e4MwTu6?=
 =?us-ascii?Q?23B/uEo1xEWILdw0LTA6BENlzJtA98/mWxIeuA11UP0nA8/DiDCh+rPdN5vJ?=
 =?us-ascii?Q?VOTbJamBreSYB83tXl54gZtkoOCcYCqw7VbCibg+lt+/U+/ob36XSKDEJA6z?=
 =?us-ascii?Q?3ewXPt8Lht461tP3woxVAPcM0Z60/5vtf5b22qRXpQgJRMowpeWA2pAj4H9C?=
 =?us-ascii?Q?Q670itkY8YPQ99oIWUnnJEFt7kfhweUE9r2+YVG8KG6NaFKcCBc17L4HDNvr?=
 =?us-ascii?Q?VYOe/gLIe+Pki+lhfvaVzCHijF9b5sfC8TeVWp1mFGXJtwrCgunBWpUAvl3S?=
 =?us-ascii?Q?an1FVzhBqCrQl2IfJ4nnefDxFAdQW6HevSB6G38vhezu8C/cFlglHqH1cNwh?=
 =?us-ascii?Q?FNXTPvRNtfG26T1NgD4LDGV/DfC380WJwv1QJQWypesPFyzXsiDvLL+jtB3n?=
 =?us-ascii?Q?0zqI4s00C7s95U8qlnTLpOhKGZ/MMmipMcdNCGJHi1mKzyiEhQBLEGongUuD?=
 =?us-ascii?Q?3glQDxSaTr2r5GxnmjKYVcu30N0nRnrkrdXDQI4Ct7SPmuUsBplE7UDk7lx6?=
 =?us-ascii?Q?kMNbyydGjd2M3DbL5dYAE5LSgVm9fvq2sYPbXlDLttknkJnQLvvreQu58yIN?=
 =?us-ascii?Q?hNuZjmjMelFAJbc/4qQCp72anuC5VgeAtDNWXMkGFqMqk4ZST1Ld/hyXV7D0?=
 =?us-ascii?Q?v7Uy46iVVrC/lmPbnA4ndeZYNqez09txm06sjDtn5sGxJ9fh8uewUbnH4Nb1?=
 =?us-ascii?Q?LwGGYJF8PF49mCaRnisBKxJXw9PnmM/iEntqj2uk0nYWWRJE97JPNiLA918E?=
 =?us-ascii?Q?HoGpVyAlWQuyClxxC2ePXttifriDLJt39YiigAOFvDcMf/PsxV8poY+jeQJF?=
 =?us-ascii?Q?NOeM6SXMS9Vpbhs1ra84EDGPZEYZwlqctoTGi/tRfo4C0P3ZcrgYJz7Q1KcL?=
 =?us-ascii?Q?lPbcWZ/8RgnDiVD6TqR5lHweYeP3q8+gZbTB0PiuCWc+uqxFaohn44FsJyaU?=
 =?us-ascii?Q?PrN8DUh6HkuGTWs/UZ6xm15EgM6E95PN96/PCu1jv7bZSEVjLliXJs73ut06?=
 =?us-ascii?Q?hIXy0XkIpqwlJKtNie+pqyz4H3/CdcjR5M+b0JojWtc9DI05oyGbHH8+kZro?=
 =?us-ascii?Q?2m1VRjfihgNliI83qdmEpumNH48Sn1NxN4TNsudeUmtw34/hCsFfKb7UZ79h?=
 =?us-ascii?Q?qpXOIG9XIGHiWslxsKu6s7ilQsUTCs+PJJvyUrwIEqb/GAXRSrLk+nbUZ8uO?=
 =?us-ascii?Q?Tg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d78a5335-8582-43cc-c1c0-08dd476acbf4
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 11:30:17.2041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lq9oY+TM2cI6c1tE9iG1WemEqyVcYgixZGrqT9TJyXWk8LK5BexBXZyexzfzfIh4B/UTrWPYKmMsfldnO0X+ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9392

According to specs:

"""
Frame synchronization (FSYNC) is used to align images sent from multiple
sources in surround-view applications and is required for concatenation.
In FSYNC mode, the GMSL2 CSI-2 quad deserializer sends a sync signal to
each serializer; the serializers then send the signal to the connected
sensor.
"""

Since max96717 can be used in multi-sensor setups, we need FSYNC
support. For that, I added a DT property("maxim,fsync-config") that will
be used to configure the frame sync output pin and the RX ID of the
GPIO as sent by the deserializer chip.

Also, add the .request() callback for the gpiochip so that we can use
'gpio-reserved-ranges' in DT to exclude the pins that are used for
FSYNC from being used as GPIOs.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/media/i2c/max96717.c | 87 ++++++++++++++++++++++++++++++++----
 1 file changed, 79 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
index 6a668a004c717..47a3be195a971 100644
--- a/drivers/media/i2c/max96717.c
+++ b/drivers/media/i2c/max96717.c
@@ -70,13 +70,28 @@
 #define MAX96717_VTX_CHKB_ALT          CCI_REG8(0x275)
 
 /* GPIO */
-#define MAX96717_NUM_GPIO         11
-#define MAX96717_GPIO_REG_A(gpio) CCI_REG8(0x2be + (gpio) * 3)
-#define MAX96717_GPIO_OUT         BIT(4)
-#define MAX96717_GPIO_IN          BIT(3)
-#define MAX96717_GPIO_RX_EN       BIT(2)
-#define MAX96717_GPIO_TX_EN       BIT(1)
-#define MAX96717_GPIO_OUT_DIS     BIT(0)
+#define MAX96717_NUM_GPIO		11
+#define MAX96717_GPIO_REG_A(gpio)	CCI_REG8(0x2be + (gpio) * 3)
+#define MAX96717_GPIO_OUT		BIT(4)
+#define MAX96717_GPIO_IN		BIT(3)
+#define MAX96717_GPIO_RX_EN		BIT(2)
+#define MAX96717_GPIO_TX_EN		BIT(1)
+#define MAX96717_GPIO_OUT_DIS		BIT(0)
+#define MAX96717_GPIO_REG_B(gpio)	CCI_REG8(0x2bf + (gpio) * 3)
+#define MAX96717_GPIO_TX_ID_MASK	GENMASK(4, 0)
+#define MAX96717_GPIO_TX_ID_SHIFT	0
+#define MAX96717_OUT_TYPE		BIT(5)
+#define MAX96717_OUT_TYPE_PUSH_PULL	BIT(5)
+#define MAX96717_OUT_TYPE_OPEN_DRAIN	0
+#define MAX96717_PULL_UPDN_SEL_MASK	GENMASK(7, 6)
+#define MAX96717_PULL_UPDN_SEL_SHIFT	6
+#define MAX96717_GPIO_NO_PULL		0
+#define MAX96717_GPIO_PULL_UP		1
+#define MAX96717_GPIO_PULL_DOWN		2
+#define MAX96717_GPIO_REG_C(gpio)	CCI_REG8(0x2c0 + (gpio) * 3)
+#define MAX96717_GPIO_RX_ID_MASK	GENMASK(4, 0)
+#define MAX96717_GPIO_RX_ID_SHIFT	0
+#define MAX96717_OVR_RES_CFG		BIT(7)
 
 /* CMU */
 #define MAX96717_CMU_CMU2		CCI_REG8(0x0302)
@@ -125,6 +140,11 @@ enum max96717_vpg_mode {
 	MAX96717_VPG_GRADIENT = 2,
 };
 
+struct max96717_fsync_desc {
+	int pin;
+	int rx_id;
+};
+
 struct max96717_priv {
 	struct i2c_client		  *client;
 	struct regmap			  *regmap;
@@ -141,6 +161,7 @@ struct max96717_priv {
 	struct clk_hw                     clk_hw;
 	struct gpio_chip                  gpio_chip;
 	enum max96717_vpg_mode            pattern;
+	struct max96717_fsync_desc	  fsync;
 };
 
 static inline struct max96717_priv *sd_to_max96717(struct v4l2_subdev *sd)
@@ -364,6 +385,7 @@ static int max96717_gpiochip_probe(struct max96717_priv *priv)
 	gc->get_direction = max96717_gpio_get_direction;
 	gc->direction_input = max96717_gpio_direction_in;
 	gc->direction_output = max96717_gpio_direction_out;
+	gc->request = gpiochip_generic_request;
 	gc->set = max96717_gpiochip_set;
 	gc->get = max96717_gpiochip_get;
 	gc->of_gpio_n_cells = 2;
@@ -386,6 +408,26 @@ static int max96717_gpiochip_probe(struct max96717_priv *priv)
 	return 0;
 }
 
+static int max96717_fsync_setup(struct max96717_priv *priv)
+{
+	int ret = 0;
+
+	if (priv->fsync.pin == -1)
+		return 0;
+
+	cci_update_bits(priv->regmap, MAX96717_GPIO_REG_C(priv->fsync.pin),
+			MAX96717_GPIO_RX_ID_MASK,
+			priv->fsync.rx_id << MAX96717_GPIO_RX_ID_SHIFT, &ret);
+
+	cci_update_bits(priv->regmap, MAX96717_GPIO_REG_B(priv->fsync.pin),
+			MAX96717_PULL_UPDN_SEL_MASK,
+			1 << MAX96717_PULL_UPDN_SEL_SHIFT, &ret);
+
+	return cci_update_bits(priv->regmap, MAX96717_GPIO_REG_A(priv->fsync.pin),
+			       MAX96717_GPIO_RX_EN | MAX96717_GPIO_OUT_DIS,
+			       MAX96717_GPIO_RX_EN, &ret);
+}
+
 static int _max96717_set_routing(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *state,
 				 struct v4l2_subdev_krouting *routing)
@@ -1037,7 +1079,8 @@ static int max96717_parse_dt(struct max96717_priv *priv)
 	struct v4l2_fwnode_endpoint vep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
 	struct fwnode_handle *ep_fwnode;
 	unsigned char num_data_lanes;
-	int ret;
+	int ret, count;
+	u32 dt_val[2];
 
 	ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
 						    MAX96717_PAD_SINK, 0, 0);
@@ -1058,6 +1101,30 @@ static int max96717_parse_dt(struct max96717_priv *priv)
 
 	priv->mipi_csi2 = vep.bus.mipi_csi2;
 
+	priv->fsync.pin = -1;
+	count = fwnode_property_present(dev_fwnode(dev), "maxim,fsync-config");
+	if (count > 0) {
+		ret = fwnode_property_read_u32_array(dev_fwnode(dev), "maxim,fsync-config",
+						     dt_val, count);
+		if (ret) {
+			dev_err(dev, "Unable to read FSYNC config from DT.\n");
+			return ret;
+		}
+
+		priv->fsync.rx_id = dt_val[0];
+		if (priv->fsync.rx_id > 31) {
+			dev_err(dev, "Wrong GPIO RX ID. Allowed: 0 -> 31\n");
+			return -EINVAL;
+		}
+
+		priv->fsync.pin = dt_val[1];
+		if (priv->fsync.pin >= MAX96717_NUM_GPIO) {
+			dev_err(dev, "Wrong GPIO pin used for FSYNC. Allowed: 0 -> %d\n",
+				MAX96717_NUM_GPIO - 1);
+			return -EINVAL;
+		}
+	}
+
 	return 0;
 }
 
@@ -1092,6 +1159,10 @@ static int max96717_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, ret,
 				     "Failed to init gpiochip\n");
 
+	ret = max96717_fsync_setup(priv);
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "Failed to setup FSYNC\n");
+
 	ret = max96717_register_clkout(priv);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to register clkout\n");
-- 
2.34.1


