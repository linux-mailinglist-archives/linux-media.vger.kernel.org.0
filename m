Return-Path: <linux-media+bounces-26603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1355CA3FA23
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 17:07:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55E0D165C26
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 16:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49A921CA11;
	Fri, 21 Feb 2025 15:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="G3yZ1C8h"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011060.outbound.protection.outlook.com [52.101.125.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DB71E7C38;
	Fri, 21 Feb 2025 15:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153438; cv=fail; b=ZLFTq/p/Dg+yZgA7Zg47mfFXKcymZtyPdltWB2anBmx8qpKBDx3x+E9gh5aOcP1woLtsYKO724DJ1CQ5w/OvH65PdCUOkvP5QcAg8U6aZChsd/cT6WP3Cq1X7cCdfsmkczSuR3HfgfoR2j5It024RmXJzZQ7l3zMEjvA8oCK+3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153438; c=relaxed/simple;
	bh=5CDcBORnwLFMRk1+u44fUeXx8CBFAkm+lTkbJ6137TY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MAgCmpFabYlcCA7giV2GRmoBoqZz+aOBejqvcmA144t/yu0SIE0nS/vyImH10STYJvI7jzSeHaMOaf9DiS1hdHbBg9jnpLz3o7rJeQrBlma6uGpB7kBE81HPerjZKvZ4EcJb/D47lM5jJd/d0MFR0eyizyv8Ct0MNqRGGuprbJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=G3yZ1C8h; arc=fail smtp.client-ip=52.101.125.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iTADSh/l8mbxJf73M6QKS0+H3v3A8Q/jaWZIOQFgTHhhbwiwJ8ebOSeYZnPwmttIgSuYdzYKQwi4++dP2XbQs9FI3YdJBeaADgjWEt9AXCglcy+2qpokTmR27b/Dkwkhs/bIUV3EGDlM6y/Rr9fq6WMguPVaTAK97DwjAOaRd4AGkoBvJkppAvMnqphIB3no+plYdDpKGAdR93Qip9kW1RHhuYzzgeugkjf95LkRf6VxFKmlMwz6+NxgocjUodzB81pJKb+VD/mlCgUM5sTu6ubIsJQ4Z2LDq/E4s31O5ARcd3pYQBBmcs0mVJAP4/Rt6cYGzg1sei9CMn/GoAlylA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJ7Z10fm7V0DBep0xiiKRQ85rmemgNv5HGIRRA5TswA=;
 b=Yv3EbOqUoflh+r1mM7ZDY6B+qschy6cw9e+HsnYhtcD/SWShe0XkJIe6zBfeCP3GMiktVO1xBwMqSzt6jIDVDDgZwm02rTsW94ht85hHCd1EBGPhld6SU/o3qvw2Oiot+LKO2xENvhp2kwdYQETZcR5u+24pMz9cZF/dhjVBVBQFfOk9HHpTIDPREF4FlHe+o/TLyU/PXxnmB50AsEJMPi8w7l+zek5Em3wgwlD7lEUKHJ6nGLFgv3G9Ei1TyFzfpew88LUukMuGpfDEmV8eiuH21HYsiaFSzj5YCkajO1I/M1P9hBy6XvTqreajlpdgG+VByIRe3t0ePaSdpHk/cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJ7Z10fm7V0DBep0xiiKRQ85rmemgNv5HGIRRA5TswA=;
 b=G3yZ1C8hAIX9jMRrDW48D80QbrfTKuJYZQP1llAzVbSz3GbLMEZP4zfn2Ii92vzW8dbd7DwSKN1Knm+U6qEf7G3VrOUtrqDUa++GCtKe0ty01XCj4B4H71cZeagRztwAvYNnBxc5X9uR3mWWV1ZEKv2wMnKjAVD65aDcW/EWMsk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB6238.jpnprd01.prod.outlook.com (2603:1096:400:7d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 15:57:13 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 15:57:13 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/18] media: rzg2l-cru: csi2: Add support for RZ/V2H(P) SoC
Date: Fri, 21 Feb 2025 16:55:24 +0100
Message-Id: <20250221155532.576759-11-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::17) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYCPR01MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: 19635dbe-5330-40ec-b90d-08dd52906809
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lv/3zGPIfncrao4UztHTGdkETfhHjiQSaoRXSDT7sgPyf5hRb97ICYxjc/Z3?=
 =?us-ascii?Q?H/caCbFkd+uH1Wj510iHCJlFAsZWYCPkw294oHJ2EqUfcBDSZR8wt/Ob/CnT?=
 =?us-ascii?Q?K3FhBcydV0QI1h+/4uuA4rjdnrqEYHEd0WS/CUoQv8zAkRTZaSsgQzVUlAf/?=
 =?us-ascii?Q?K6MAi7/G0ZGSxI+ppBVcsEBy/9CsnXbedfs0l2Oze3rWtjnEW7zgdLhbZuFW?=
 =?us-ascii?Q?30re3gqR0gzhPCb5Q2H5P/Gn1v1NEa8U+Xx7rmA64m+Dd/ZBXqdvj/PLLXau?=
 =?us-ascii?Q?ckNtihAljbqh40BtQ1AFQP5pua17ruzw0LSynag4ErhpEWplKHzxwZxwQ7Qd?=
 =?us-ascii?Q?Cs7XtDfBT/LwuXCHQL2fcQV+HhOH/gZf7NH2dWoD6JyUwFomdaAmZjWnQm2C?=
 =?us-ascii?Q?/kmVPyp656JvtdSoeegdVZXzrWJIHcl2gXksZYOzqAe0URXfzbkBca6ZRs9N?=
 =?us-ascii?Q?iWeNfxo1OAtmioLbYp6LV8w9ZL7sUZgxwKwhf5X914hj/e1PrgEJBZzEgMHb?=
 =?us-ascii?Q?qF46KB0Hoo/gCpBC1xeT6EDp9EYlPR2KezAtYuhI/ek+bQLETfdM614n7oU3?=
 =?us-ascii?Q?JLJnEYfGwg3z3ORw7xXCNyUz7RX4nz/syDuXvrCpxqW1dccsdOgfOu9GTVuK?=
 =?us-ascii?Q?JlEv+0ofElb2uvvRcL+CSbtQtXi3AeuGVYTpeLrPIybvKad5C3qrl4w2u9un?=
 =?us-ascii?Q?SgB1fD2UI2xMscYxqwCe9U5bqoD6jwBsfiAwgZqqC9b/DMnTyJyV77A0haOg?=
 =?us-ascii?Q?egq7dZ6ZRMpWWpFz3NEI6AB4/G2q2uxw3TPRv90UiRC5ADBneJJ7MpVtl9A/?=
 =?us-ascii?Q?vJKyrUKKogfZQXDLcEHExvUy6kwzfdff7hqa4H2r8cjxySNarQihkMbk+Ctw?=
 =?us-ascii?Q?TLEH3hN/eLmDn+lVc4+eantD+YJtMmTbBqw7EA1hBPdL02oq2USz4YCO48lZ?=
 =?us-ascii?Q?k9WDLi8m9NBpWCJON24ImSBzBvemzd9gBjZQK4mbHillnlbiV2Rp2nCoM5H7?=
 =?us-ascii?Q?RKjq+UzGisdKHLHEquUlE/SyCMRa+3nYbgDBVt3OVYH5a5MSXFUYKLjx2f0o?=
 =?us-ascii?Q?on9QJWshhYHUW7AYcj6Ars1Vb4ZtvuJma3Bv+viO3Aqa2HflPaqWBH/x7FP1?=
 =?us-ascii?Q?6QhiSJ1D8LqkNMHjhQDQB1JPUb/TVR+7mM1tdsnccJ0toy2eG9qoAck+xKeP?=
 =?us-ascii?Q?B07b/nkK62rwx6ekE5qeW0Wf/bwq6g0mG2EupFunA5aeh+rs0u1iP14h5zb1?=
 =?us-ascii?Q?L3tvaxlbmHTni/wMMzA7KTtyvwm/I4NTScTsAYcrlutwnduY+YFBbzDzzOS+?=
 =?us-ascii?Q?2QMWMzNgDHSdAQGTIph1lCoV2bhwVWXqv4NPT5nFPEts3Pxeqx7JbdrWhTYk?=
 =?us-ascii?Q?gX1KiSWHB9pKKS7dWMDjniufNz7uMm0inYoLd/FscHi3QPEXOx3H4xndZbSd?=
 =?us-ascii?Q?RLiO9tfWBcUyhEwhRyQt6G2gXxUrlOmb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4eLIwUDGwKrKQcJRKKyo4gtjBh/TO+JnKL+h6o0mPvVb1kaHC2gcbvMU4IIo?=
 =?us-ascii?Q?SvHPwsv7slTyCOdSoBg8M8N9+E3zguZTMMazx7hSchT/d4jJn6k4oV/zC834?=
 =?us-ascii?Q?nVUTRQ0nLvmMxc/UCK7pt8f8eNPtMrL5mgX/k/xsWPJJZHQtuMJrPn+xbohj?=
 =?us-ascii?Q?N3VzO2MolvK1qR5/g1yMa+XRsLA+i4BfakddCVsXlGWGb9Kv9df20X/sZoLL?=
 =?us-ascii?Q?KuhA4BYQZJP7im9SP/5iopAh5FbzTp0aomVM+tUpoBZ2FZ9ji0cz80HrncdA?=
 =?us-ascii?Q?5/MPD2URRToG08AkN2J6Vu5RevMhPO88SU09TZARwXuNBK3ELXzqdyBU2M2t?=
 =?us-ascii?Q?Kn8vB+YAJFDbcDHenGp122iJR7fLAWOdCcbrTTcByv00DUygCU1/4hZGWNCv?=
 =?us-ascii?Q?JXlRnFP7sNaKKXfFXHEz13KtpS0fLZHEOwlMeMM50sgWkG62xjQbUaNhmPEr?=
 =?us-ascii?Q?SgQCT40PYQW2fBvSJ+/2747Za6vfyITB4r8IPvmVLdwt52B1721EcfyoCIJN?=
 =?us-ascii?Q?KBJBO31IiDf/gKqLDAhZzK/GxkL9+x33Hid/Yy/sYTBad2G1bncFQ76zZJVe?=
 =?us-ascii?Q?J4el840qdXxzVkxBTpx8kxF0dN+K1NfMq2dMNtKRB35ADrhtz84Xspgh+5Oa?=
 =?us-ascii?Q?FYilvDGUkMalmMbUES6w8X2fjU87NormH7SRJeKPQwCX7gg6JQIEGXVzWs4n?=
 =?us-ascii?Q?ncD8J3qJq0jhT2ZGC/TEGOfnGGGKISsY3vAucqGKMvDw2DbCHLpq1fX5bba9?=
 =?us-ascii?Q?+v4ZJhl7UAEAIw0ze8DPxtVyyjdcR8/zauk1cCGi0U3wHcM+jd4BS+k/oy6Z?=
 =?us-ascii?Q?7P6ZKhgZIjIo4x5L6cF0Gwj+LY+xBzEgb82+5luOjEfOUdzI3+NWOg/hGFfJ?=
 =?us-ascii?Q?WxGft+nX4bTwsSrNjqjtYCwMQZLgzhTF0EagvqNrZds+GNpdNe8WgfXR8zTj?=
 =?us-ascii?Q?8vcrcd4fciIK7Axw9rZBQe1Vx4u8jzRoqqkpT0GWmCITeCwWM7/BzzH+3Sa+?=
 =?us-ascii?Q?y8ujkAASkhj9bCQrqDKdCA7/gjJVxLXSf/PAcIs7ckYfwgpQDbhmNpA+fuRU?=
 =?us-ascii?Q?RUXLcD6J6E1+Uy7PZBkzu8Cenv2di81ozztXlXGuDBNWiq4hr3A/etkPpGzI?=
 =?us-ascii?Q?fbAZ7qHUzD8/4gYeVQM4a4z86FZJcuCOYScIr+94HRP48Gi+rdFKrUul5C6w?=
 =?us-ascii?Q?TBB2Q+DgKqIrsM92Y2n15d4jYwaY30KuS0F8DwTlGw7bmnBtlCdxTF8N9mCs?=
 =?us-ascii?Q?oH4ocBcLoZUpOQWCuAUYyAh0ft/ftDUK+A6r64aomDiGkUIN1g7B0Gr/n20Q?=
 =?us-ascii?Q?GN7zqpnpCp53Nh9UE5+ll3hG0fn/0DpS0Igg7BQiJ9vs0J3YBuGIq8vxpqfD?=
 =?us-ascii?Q?z3nCYNKM25rGdlOXOQ3FI/Bn7Q0fsee2OzoSQvY+6C7YpaTQt0kSNwKRS7xc?=
 =?us-ascii?Q?gqIV1Fxm9uSs/lJlwkGDbcMt24RJDeUV4CocyvmWdHakerUh3P66eX3AAWJJ?=
 =?us-ascii?Q?i6AoFiVCwk43FMVVNXAWmqezA4b1ubsxKOgnoPFjbOM7IDBqiP/Epekh9j0W?=
 =?us-ascii?Q?DGFLeXoMw0/ySol/orzmMyDjYhqK7B91KJ8HZHrdj0PUREXo0XpU961gH2uI?=
 =?us-ascii?Q?U6aUhe4VKLsZxEWJijUwIQQ=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19635dbe-5330-40ec-b90d-08dd52906809
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 15:57:13.3889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oFz9Gs3pAwq60pQRu2LewEDXghGTOP0VCQ/Dr8LlEH4536ZChKI168OK4BLpO0X9LLwwhjdIWanvnn5VV5lLFWwbPXBOEDTzmifo47ufCEmznYWs+KkoVKQCDb5ROXg/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6238

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The D-PHY on the RZ/V2H(P) SoC is different from the D-PHY on the RZ/G2L
SoC. To handle this difference, function pointers for D-PHY enable/disable
have been added, and the `struct rzg2l_csi2_info` pointer is passed as OF
data.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 771fa35558be..cd452c84f101 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -85,6 +85,15 @@
 					 CSIDPHYSKW0_UTIL_DL2_SKW_ADJ(1) | \
 					 CSIDPHYSKW0_UTIL_DL3_SKW_ADJ(1))
 
+/* DPHY registers on RZ/V2H(P) SoC */
+#define CRUm_S_TIMCTL			0x41c
+#define CRUm_S_TIMCTL_S_HSSETTLECTL(x)	((x) << 8)
+
+#define CRUm_S_DPHYCTL_MSB		0x434
+#define CRUm_S_DPHYCTL_MSB_DESKEW	BIT(1)
+
+#define CRUm_SWAPCTL			0x438
+
 #define VSRSTS_RETRIES			20
 
 #define RZG2L_CSI2_MIN_WIDTH		320
@@ -139,6 +148,30 @@ struct rzg2l_csi2_timings {
 	u32 max_hsfreq;
 };
 
+struct rzv2h_csi2_s_hssettlectl {
+	unsigned int hsfreq;
+	u16 s_hssettlectl;
+};
+
+static const struct rzv2h_csi2_s_hssettlectl rzv2h_s_hssettlectl[] = {
+	{   90,  1 }, {  130,  2 }, {  180,  3 },
+	{  220,  4 }, {  270,  5 }, {  310,  6 },
+	{  360,  7 }, {  400,  8 }, {  450,  9 },
+	{  490, 10 }, {  540, 11 }, {  580, 12 },
+	{  630, 13 }, {  670, 14 }, {  720, 15 },
+	{  760, 16 }, {  810, 17 }, {  850, 18 },
+	{  900, 19 }, {  940, 20 }, {  990, 21 },
+	{ 1030, 22 }, { 1080, 23 }, { 1120, 24 },
+	{ 1170, 25 }, { 1220, 26 }, { 1260, 27 },
+	{ 1310, 28 }, { 1350, 29 }, { 1400, 30 },
+	{ 1440, 31 }, { 1490, 32 }, { 1530, 33 },
+	{ 1580, 34 }, { 1620, 35 }, { 1670, 36 },
+	{ 1710, 37 }, { 1760, 38 }, { 1800, 39 },
+	{ 1850, 40 }, { 1890, 41 }, { 1940, 42 },
+	{ 1980, 43 }, { 2030, 44 }, { 2070, 45 },
+	{ 2100, 46 },
+};
+
 static const struct rzg2l_csi2_timings rzg2l_csi2_global_timings[] = {
 	{
 		.max_hsfreq = 80,
@@ -427,6 +460,58 @@ static int rzg2l_csi2_mipi_link_disable(struct rzg2l_csi2 *csi2)
 	return 0;
 }
 
+static int rzv2h_csi2_dphy_disable(struct rzg2l_csi2 *csi2)
+{
+	int ret;
+
+	/* Reset the CRU (D-PHY) */
+	ret = reset_control_assert(csi2->cmn_rstb);
+	if (ret)
+		return ret;
+
+	csi2->dphy_enabled = false;
+
+	return 0;
+}
+
+static int rzv2h_csi2_dphy_enable(struct rzg2l_csi2 *csi2)
+{
+	unsigned int i;
+	u16 hssettle;
+	int mbps;
+
+	mbps = rzg2l_csi2_calc_mbps(csi2);
+	if (mbps < 0)
+		return mbps;
+
+	csi2->hsfreq = mbps;
+
+	rzg2l_csi2_write(csi2, CRUm_SWAPCTL, 0);
+
+	for (i = 0; i < ARRAY_SIZE(rzv2h_s_hssettlectl); i++) {
+		if (csi2->hsfreq <= rzv2h_s_hssettlectl[i].hsfreq)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(rzv2h_s_hssettlectl))
+		return -EINVAL;
+
+	hssettle = rzv2h_s_hssettlectl[i].s_hssettlectl;
+	rzg2l_csi2_write(csi2, CRUm_S_TIMCTL,
+			 CRUm_S_TIMCTL_S_HSSETTLECTL(hssettle));
+
+	if (csi2->hsfreq > 1500)
+		rzg2l_csi2_set(csi2, CRUm_S_DPHYCTL_MSB,
+			       CRUm_S_DPHYCTL_MSB_DESKEW);
+	else
+		rzg2l_csi2_clr(csi2, CRUm_S_DPHYCTL_MSB,
+			       CRUm_S_DPHYCTL_MSB_DESKEW);
+
+	csi2->dphy_enabled = true;
+
+	return 0;
+}
+
 static int rzg2l_csi2_mipi_link_setting(struct v4l2_subdev *sd, bool on)
 {
 	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
@@ -900,12 +985,21 @@ static const struct dev_pm_ops rzg2l_csi2_pm_ops = {
 		       rzg2l_csi2_pm_runtime_resume, NULL)
 };
 
+static const struct rzg2l_csi2_info rzv2h_csi2_info = {
+	.dphy_enable = rzv2h_csi2_dphy_enable,
+	.dphy_disable = rzv2h_csi2_dphy_disable,
+};
+
 static const struct rzg2l_csi2_info rzg2l_csi2_info = {
 	.dphy_enable = rzg2l_csi2_dphy_enable,
 	.dphy_disable = rzg2l_csi2_dphy_disable,
 };
 
 static const struct of_device_id rzg2l_csi2_of_table[] = {
+	{
+		.compatible = "renesas,r9a09g057-csi2",
+		.data = &rzv2h_csi2_info,
+	},
 	{
 		.compatible = "renesas,rzg2l-csi2",
 		.data = &rzg2l_csi2_info,
-- 
2.34.1


