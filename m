Return-Path: <linux-media+bounces-27066-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA85A4649E
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 16:27:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D882A7A49CC
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53F621D3E7;
	Wed, 26 Feb 2025 15:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="lPdZaAoZ"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011053.outbound.protection.outlook.com [52.101.125.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58014227EA3;
	Wed, 26 Feb 2025 15:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740583569; cv=fail; b=sEBS5Q1+yqEDZRvEn00rWcc/Ckn0c0PMbUrg/tAPePphC/JZuhCwc0GNHDejQt0D5fUn8dxMUaFhlDnast0M/9UguGMgbSQViTFfLGfJYPh+hbB+CuEqwqndlMqbf0lSLjoCe5uxQo0xwddFoD2wjPTYnkjUIudGzDNL90+o3eQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740583569; c=relaxed/simple;
	bh=HsfbftITW5fd4UAh+3xyB67wD6ITcjCaKdzsXSBD5XY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lUCmCbwnJZPeFBfQ58YmPJpCORy1aL/Vu58iPPUc9o6pc/VvGcVwxJtyEJSS4ktSrcdu1CJMFwFEdFsd0jDCQetTEmSe//kns9j1wai4/IF70M62++x1tufQItEEYYHZJZwTtYnm9lMVQFtuSlpyC1FJDKBVITPJGrR1B5B/Mz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=lPdZaAoZ; arc=fail smtp.client-ip=52.101.125.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZngfQBUhPXcWZuQzBkHgnVqvqbs2Xgr91sKHuLOEGWmxgkLmw82o16AHDN9xk0WpgBlkZFcjU3trrGtAv0TiwtS+LKGkLmKnTHUfjKtcxvQDFuJ8dBVxOrho85JQVH5qBzI1kSle6p2poryvR610eh9NSPXyH2hVvgcHlNJ6fR6PvrhZs54jmTPHeU0pATjTS5Z+a5f9dO8VZEfsZZYcTkNH7fY8aoQfrUPMLjHa07dgQI9N1rdV9QbBV0O17mO2+VkF9B6D5TcS5YIFOOikaw6ntkKEVU+5B6LeAk0aLevgbWZjOhtLd2MymiiqFL3vP60tX98rbndkAjtof9GVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxD99Mokwvg6veNRRvfJy1z0QYpISgAvXyQloHsmRL4=;
 b=Mp9DHIKGj6/pY+YObKSBVT2dg1gMwSddQJVzMfTUUeLJB+pajOl7Lux2xQgXUMKc78kdaoNMFHdO3Uc4Blbq2QqRiCrGDuDTyPcJYOp2nXDHCAGSXHLy6Vw0OnFzFc1ESid7n0lQrOMzf77t/I9+6VMpCkndRBACVyrGn9+7bTYeU8MKn9eSWePafdZwPpHJg4qfGCMtnBQOPE4tp8iLlVx6JztKssvHVDAD9r7YPjiiwl/h3kGw1U4LVl9zLW1dBuQWJiI4fkAuFOUYa2katlpaIqkCj++ukD3F8lr8PiW+n0KqcYX3hvTIlDQJ+paTWrJY5o/5rQTgMwkYdQBMoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxD99Mokwvg6veNRRvfJy1z0QYpISgAvXyQloHsmRL4=;
 b=lPdZaAoZEjmIhfcfdWuQYTRw2mUUoave6Arn+cTNao8SSRPcKQBu2BKfFP2/Miif0alYJl+pBJ+/3gi5iW14nvCG25fekTKbVDVRP9a3WNQnf3kzBjFMtCwIgGBwPtBwIq6HXVxK8IcU6Pyq9slfvWELMiVwju14zov7VHgdPpQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB10248.jpnprd01.prod.outlook.com (2603:1096:604:1e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.22; Wed, 26 Feb
 2025 15:26:04 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 15:26:04 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/17] media: rzg2l-cru: rzg2l-core: Use devm_pm_runtime_enable()
Date: Wed, 26 Feb 2025 16:23:31 +0100
Message-ID: <20250226152418.1132337-8-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226152418.1132337-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250226152418.1132337-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::13) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB10248:EE_
X-MS-Office365-Filtering-Correlation-Id: e8d7e8fa-5eee-428d-f5d8-08dd5679e260
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wC5bDpfDtbxqYImO7H6jzdEIyN6cm3XPqpgk+VX6DjF/Q/ZWdBSWJtEHIeB5?=
 =?us-ascii?Q?PxezG4guvMP8lDzRTfj+N1R8cFyxi2R2t8ExQm8uxrx4Evq9bcJvo5MTBiGU?=
 =?us-ascii?Q?GD/TckCzYJHP8YDPsG7mUG1xJlCnUXe65M8RRzZ1/sHI9Z2+8v6pTh4pmFQo?=
 =?us-ascii?Q?MhUv6kM/eJsqlsgwvYI3L8iFKvLXa70q/7gke8CAzk1Y/Jjodl9QMxdundPm?=
 =?us-ascii?Q?ETxT49LgXKqF1DKQPKULaSdyBIWcM9Da9nfwcivgD7k3zT/ImYOTqbUcsUkK?=
 =?us-ascii?Q?O1uQta+XsTj1S3Yz/575n4cnhzz2F3R7lep6kHANkLaPFHV3ltVyMG11l7mI?=
 =?us-ascii?Q?ChqH+UEYzBQCgJmVAmwGVlkCFbyQTzOW8gwFG/zDKP3Tyd+rExJ4PHkS1b7o?=
 =?us-ascii?Q?nbPbCiAV90m1pSfWd4oq5M4fliTkcKBz5Zz+/gtUWvBx/gabv5JpFu2pGLzi?=
 =?us-ascii?Q?O4Bt2aqC4BLZgoIAYEUZU6DHMBXOrTgiHLPzaaJl9ugC0yItp1vAN2gjcnNq?=
 =?us-ascii?Q?RXF1KCLyB712Uy71aDSp5+ZVaWUHwl7clw1GTcK7ywplUaydd5bijaS6QGwq?=
 =?us-ascii?Q?xFgZtSZP4KzKywE1VOIrBXEIIBqSOEL9TBGP3mPETLAjahrDGhCPKSTIaGoh?=
 =?us-ascii?Q?PIDg3p8oOKLOFShP/Lr8gGv/Q2gs2I7ZMxWlXsDAAXycZcT1XrCbbt3Jrw3p?=
 =?us-ascii?Q?01cu/xwIhGs+8/kGOCQkxhSinLnbpjfgkJDjhpqDCsKGxjPC1/qJfp7nFKtm?=
 =?us-ascii?Q?em6q2TYeoN4CoCFA2KkqBUkEM4OG1u4GPTAfdMz8C9M+zs7oaz9VpcdVbBR0?=
 =?us-ascii?Q?rNQivUSwjTVJYqGuAzg+WBhK83BqikYeJ/OY9071wLMHLA7RmvKZqVO28wCu?=
 =?us-ascii?Q?/7LObS/e9sX1Dy64fmIph210GpnJD0t62phI9mnBxEAmDV579reOtwLNqWqH?=
 =?us-ascii?Q?Qh21Eg1WZyMspSZ2vA4c4cHRix6CxnyGRTpZAOXjYqMpQ4vrv5n9NXWoor8J?=
 =?us-ascii?Q?Z7v52gLDUcVtIllxNAXrCauy8tOzCDttTXMz4IypGRkmGjHBn4EERsS/sQHs?=
 =?us-ascii?Q?CzUJnx50g//TWhMWtu8kHNitK5SPz/sfIjodu8IJNUFKydQr9X4FecfA2GLP?=
 =?us-ascii?Q?cihpaQn2EdaA4bj6qbkIeVgB7yrIqye2F4kphzwJ7wO/9DoH9oBVSeos6OXF?=
 =?us-ascii?Q?dMPnGducTbE22cJH3YLVLXalNVodyeKaxG2jHTnxjOimpFCIevMSDFv2qdrp?=
 =?us-ascii?Q?S7ISHS/7I60tktco1ScUptO4BX4bBXJ98ESCCoFDHMuV0ErvgDCCMwlJMF9J?=
 =?us-ascii?Q?+D8fplmSXtTulohvJrdttNElAfTw9PsF/p5syqE4Aw6snH0RM721aPWQ3K1O?=
 =?us-ascii?Q?1XwsDjqFDzSdG/vdv8aCKFwgfXQ28BIRh06Sp6+xS8+Ma3EQKQYs2CNo7Fm0?=
 =?us-ascii?Q?msCyXcqY+ShqrrVrIaURU++G/8nTvVV5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LRweLsyGdGHA6v/sMtM1g+rhFoDVS6UHtIer5vQll/YliGVcCOqZUgZcmZAp?=
 =?us-ascii?Q?Of3hlUxEhYK5Mw0yNwpqCif/EGUcZ8VvutFzrhCXExpvijwpHFoP/zNYUcVK?=
 =?us-ascii?Q?1WOK3/q5aPdSh9th3TSOpFV13W7fr7j54BeTgAbShDSa3ffOTtGXhQgYB3SH?=
 =?us-ascii?Q?Btu+E8jmEHM8OPKTaNx6YYAxPHApicw1zst+4S4KyJ6mQxh5QTWAWdNMosPe?=
 =?us-ascii?Q?IEX8g/QPDQ2Id+hobfoULBzXiIWbkNVkG0n6sdrdhIQsNuHQRmbv0y2Nf3BF?=
 =?us-ascii?Q?s9htf49nOu5KnT5sOLXrqyE/ddm8zQ+p1b5HBKnNkcLXJfhFPCwbxqhMx5bV?=
 =?us-ascii?Q?o6ORaDS5PiWh8mA6PE+2Ppu+gLyTD45hmJeVAHCxohQJko+eu7z4lxB5+p35?=
 =?us-ascii?Q?De+tWC4VdT42u1ljrPkFazhJYjOY3paE+bPdG+hXo8Cl6A8XmBgukl9HwYGO?=
 =?us-ascii?Q?pOAmlTt0hTp7D548SwnQma8xilFUCP6e5XtsZ0HcVfPOWbIM2uvYdVhwM2YC?=
 =?us-ascii?Q?y5YKifxKPfctzafAQ6yN8pQ8tW1b9Jrs+xeV+ptWFYNrxEW9C/qnPUimFIbE?=
 =?us-ascii?Q?/P7yGYEZZk02H04dizW+M8WSc/Qy1AIZ4/gRMlhVvYsTm6mc2Hr1quX4EFK7?=
 =?us-ascii?Q?6YlL0q4s5HaYCmj9f8TOzA/wXkUzAhwZzliaNYrilzwf9jhUcrvAxCSawd2b?=
 =?us-ascii?Q?qP+OEwBUwGbT64ZBJKvQzvMdZJ/TV+FpykyG7LARHgjIBDEQLm2JkXOuQmse?=
 =?us-ascii?Q?xRV5/IdjHanaYiBdIMhPoXh/0KVdeAn/Az3qf1jp93rvwkhNVcQTE4TNAczs?=
 =?us-ascii?Q?jao3z0v9++cOfV7j1Ru5jkGK62q1mxYXsRdF9VDivPQ6K4LUrewa9qsIJg7S?=
 =?us-ascii?Q?+AiOD4WqiTuc6I5K9a8ditcbIGrXV3zUqqXzGkrHhRrPt+beHzW/hGxrAXHX?=
 =?us-ascii?Q?XFQHpu0El345yfT8tsU0ykXbaH19zHzlDruXrRnEEvirpYwsauOHapnShfO3?=
 =?us-ascii?Q?yISFz5ZlYVOeOBOpio9pr6W6TLShVrXwbt+o9qytyeKoyhVZrLhmvtVpgHDc?=
 =?us-ascii?Q?DRLeSOasD79Cbvjd945/hTl8Jt0sxDS0hqpeQ/Ao100terneZmOFWB3KWvjB?=
 =?us-ascii?Q?x0Nx9amElDzf0T+9FKcT3O9eDmMVlJZTCUaYKlkK+pKzB1z6FEYCooXBFeIR?=
 =?us-ascii?Q?D2uZ7nXR/jaGay+6W1IsizvAnAjhyMvdX/kLSRSbkqIpWncBZuZEVuolUUYK?=
 =?us-ascii?Q?paTKGxJaAsohj3J69nqkXl9Exddh/YEyaIA4Ulww8TO7Zqfi00N7NNxv1tst?=
 =?us-ascii?Q?4/IiwgMRholcUZRYsrJy9Rkma6bgXVgndL1uToMTFnI/ETTF/oLjxL930JrR?=
 =?us-ascii?Q?Shy2sJnmNmQlp4/Oo3okCx2u0xeyJdEbYzhGFPU56Y9iUAJhWztXnf7Vrj/Y?=
 =?us-ascii?Q?A7+6AXL1348ejLstC/Remso4aVfk9OHoNuMS2K22HrjjK+y0F5ucfYyfTqqb?=
 =?us-ascii?Q?5FXgCiTRTe21o2/XuxuCNsRr159mVjx8qx6GReNiO8IxoBtVzS91kARxbb4z?=
 =?us-ascii?Q?+4xShsGF8IOef4LPwWMOkAFd6baHROiwhPkz1v7+afLLBb+qFMfnL/EudUIl?=
 =?us-ascii?Q?zE9o5OYbTUaiUS5t9cRXp5I=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d7e8fa-5eee-428d-f5d8-08dd5679e260
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:26:04.8713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AltB/LGvmiSVZ6Vv0ytTFoSpnGYmn+3+XWu0xO5iG30QCuUVKaM0Pu2GpjxwYgBycz7hPMvtxMeXfuc+eNuuBZH7YbKQpYwhXtPJRDSY7C/WKwlNBLzBQTMX7AePqDYU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10248

Use newly added devm_pm_runtime_enable() into rzg2l_cru_probe() and
drop unnecessary pm_runtime_disable() from rzg2l_cru_probe() and
rzg2l_csi2_remove().

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v1:
 - Fixed DMA leak as suggested by LPinchart
 - Collected tags

Changes since v2:
 - Collected tags

 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 70fed0ce45ea..eed9d2bd0841 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -287,7 +287,9 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 
 	cru->num_buf = RZG2L_CRU_HW_BUFFER_DEFAULT;
 	pm_suspend_ignore_children(dev, true);
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		goto error_dma_unregister;
 
 	ret = rzg2l_cru_media_init(cru);
 	if (ret)
@@ -297,7 +299,6 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 
 error_dma_unregister:
 	rzg2l_cru_dma_unregister(cru);
-	pm_runtime_disable(dev);
 
 	return ret;
 }
@@ -306,8 +307,6 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
 {
 	struct rzg2l_cru_dev *cru = platform_get_drvdata(pdev);
 
-	pm_runtime_disable(&pdev->dev);
-
 	v4l2_async_nf_unregister(&cru->notifier);
 	v4l2_async_nf_cleanup(&cru->notifier);
 
-- 
2.43.0


