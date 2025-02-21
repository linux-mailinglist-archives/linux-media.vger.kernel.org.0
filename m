Return-Path: <linux-media+bounces-26601-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2314AA3FA60
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 17:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5ECCE705611
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 16:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F2A321A429;
	Fri, 21 Feb 2025 15:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="oHHbYn1/"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011035.outbound.protection.outlook.com [52.101.125.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6C7217716;
	Fri, 21 Feb 2025 15:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153423; cv=fail; b=KBlrMpfpNECWaWV1YMcCJOFhc5LW9pppWq+3bqNdWfMI8nWVa/tdbiYI9PDnRvvFLi07x4XyXh0Tefx73MueR8IhuJ+dVCRUaBvxx3aCkNLxIDdkJ0V5LY7pGTko1VBucR951zHOUOKkMixL9eSmzDfHeexOY/o1aMIdKNhPO3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153423; c=relaxed/simple;
	bh=UW5hHbUy6F/nQQ3ZA5N1OXE5tULody86fDa54bsKEIs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L9XwwU9ZgLFalA2IH9ftiBN2t/BzrIPBiOFYy2785jnO6BzLm2Tn2JzCZDmwpOVixPk7hhY5Jw0Uez5t/TVpO/hHCpPLXmL+O/peMmVWV0P/AbOVRRabewnmw0BWQb92lV5nKicZmz1L7I9yNTIV2z0/xpKYQYUt4yKyx/Hnfcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=oHHbYn1/; arc=fail smtp.client-ip=52.101.125.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fhcr5DNfetvXATbqpUpxBhE+HQ47Mx7x7r+q6gN9QoDfvhbhxbQYxZSQCAXNRag3ffwqYxw5Xl1997JiyE9q9kkvbIvTNALo3Bp+UkeyN1wzW+U2DIHSTV1Cbsjnm4UB/yShmbNPIK5AGm8WMOGkJLwhPFICyJboJicue8E/sW+RMxl/CUGpfMdlkQrnB2QHR7875piIZ+4O2ZRL5J3nKpuqmnqgotDKWgPa8Q9vAF/H1vwBeLxMaqZCIKgthNuauvVHiVtA8C2kBa1p62ZzzgAHskwQwXbreCCJSSfXirLGA2XoLo0ELw8WPeiJXqcgByE8jfC3o7RLAKSj8NLpGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfX5GzW27tF7wcUIbX1rO/nYBVGXiWCEqwh00fpdLbI=;
 b=fEeSnNZBpYQN1/pI5+6DjMjiiJVDOCtwKvtjByPy7MsvSV0+lEeysk722fTxtPEMHEnAt93UqWUPmAj9YodOVZz6dSYH663ir/8WdAzSkjgpZCuCqoZAuStPr2eI7cytUYegK7oRZuuieTA8Ajz44bSVi69ZYx6uMErrapQ3SagM/UGZNTmQPZaAX9Zzah0BMQKZss4SgcqlPZjBLvGUqvwH9mGTOHW9/wb7rx7N8CV553vXyzoRVhMTg7QmWjBsWkDeyBEBivUiUtXMQTMqy9dhMML+WASdTpL8iW74jIFj/OSn+BCNNEwkbaO/68BLA15GgtyXiCubl7wSrFv86A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfX5GzW27tF7wcUIbX1rO/nYBVGXiWCEqwh00fpdLbI=;
 b=oHHbYn1/VFLAwibM9zvJN5uDOFHiKXFGiZIBOgItPo08H+3aKArhrzrKQrYw6lu8G/RJgLRF/Vpc5IbGp/Y5/ihMoZcS+UH4GuJr64ys2DBqFvSB76Qc/UiHGlYS4ZZzIraDKnsRikQTo3SIZ6tV++8q1d05w+u+hWpHER0pHsw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB6238.jpnprd01.prod.outlook.com (2603:1096:400:7d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 15:56:58 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 15:56:58 +0000
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
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/18] media: rzg2l-cru: csi2: Introduce SoC-specific D-PHY handling
Date: Fri, 21 Feb 2025 16:55:22 +0100
Message-Id: <20250221155532.576759-9-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 68d01f44-7d5a-4d46-2bdf-08dd52905f62
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6Vu6Wpi8DSDDVMOBGtG1Vd+E+dpoWOWVF3dSnJSlSiPV2/bkxAYie1/qWPwX?=
 =?us-ascii?Q?nCB68Si/BZUNtWfB4o5OpADTz/y8uKoNBDU8wfpkbqbR+wlRxJ+qKx3nQelg?=
 =?us-ascii?Q?rMo3OBlld/fxWaQQfh60HOd0Qd2XSC9uXS7oFjKJ4aGrU2kZISE+b1NxTePd?=
 =?us-ascii?Q?ELAc6cmNJYXeMs3til2/coWyMUu1aH/KiPxcU5IhRUUdFPiAl6uv5BzMNXwT?=
 =?us-ascii?Q?VdpMnTZ+HB/VlpF08xSv1AClpXGmeb/BbbLxPKK1ttNE9OJyM/JMeNhWOVBg?=
 =?us-ascii?Q?1cnwoVDRC71ZLSADGLsMm4Vu2WuBVN1SpjKw6hiAtGXdhi/8UJlXmbrQfzQt?=
 =?us-ascii?Q?xXYEky67qUzEwMRey64G6dmA7QSztM6pycMnULgiA1k5QsWdD9zAzl/Hn3XG?=
 =?us-ascii?Q?69Xy+qQ+m7wKBsS6Qjud0a8Fo5TRg1OanFKKWFTnHwlRMNdNxaGBJmeMyUbQ?=
 =?us-ascii?Q?2ehHhyadqzqV2FgalI86EBPF9aKBcUtZGdHE0b3MhbJaGYP3Bp32Ubrd6lIG?=
 =?us-ascii?Q?trEoouweIPxWyiBMtzJULmkNpR9DhHGbwZbxlujklsdUTnDaZr9Obfmaw9S2?=
 =?us-ascii?Q?LUCXGgjUgKkiCRfiXkxxxgbpcOPl2BP+FYk8h2XTTnNfamqWtaS2qBzhoc2j?=
 =?us-ascii?Q?VK6YYNP7tlXheWAismEn+Jb6ZG8NpeZKNFJMms0b/me/YsFY0jw/9B2oB77A?=
 =?us-ascii?Q?68xMxgrnv2lIH15BJIVx8xtlByzLa+uCnRXoirlF6WChy2Ktve3cUzFKTwOe?=
 =?us-ascii?Q?ynusMV/9VPzLJdLWjBSSN5Sug0f4pVdOrXEjOPE2bwcpS8t/s5axAPz45rOH?=
 =?us-ascii?Q?RXXr+arDhKss9MeXBZpRlpqbySdsHgpo5ANF069AgiWTQyHq85Io9maxT1zP?=
 =?us-ascii?Q?lzhN3Zs5aOTcMuz9UMZnWgHI6FrJAMdmvVV63D2Zuc2Pis2O8IOI7GhXruWr?=
 =?us-ascii?Q?f8hfxqCDz9tUqFcNcFwU4A4JG2XtU8pFpBu64LCRbGoigkPONHInrmwfnT3C?=
 =?us-ascii?Q?p49GYLLCtJ21IA1p24M6d1pLM1q8dzK1js3awDh2/4qd6K6N/ilcsDGrg9or?=
 =?us-ascii?Q?MSOh1vexiVye34//Y6oyyZ5d9rCoNznY8KG+wGhVMJGOtC+SdZgrncXF6zar?=
 =?us-ascii?Q?HArdaXNlJRcNRgmr1x4joFwT6xAyAFF3KZoPb2Cyjylju15KKHBCAkQ+EUIA?=
 =?us-ascii?Q?IricpiVFh3gtpKYBSQYfq6hp14r6QNYDf4ZcZenclBvSOgM2WzaNzgwy2L6F?=
 =?us-ascii?Q?89hr1ddUwyD43PP4NBSyDiJbJj3Bhnaq/9AMOo/BK6L/aI3mRkete3Peq1Mc?=
 =?us-ascii?Q?ZtcyOWHsOpGgGu7CeDL2lZD/B/D0HJaG1+BNCEHxjs+MIQcapg5/SGn6XQW7?=
 =?us-ascii?Q?ETQ/udHg0Cod//Kx1ctQ2nolvGWP4KpzDvbbEmYgK8k4hb0GPCQPkupWUs7V?=
 =?us-ascii?Q?BFqccnkVfUG7ql95aNZspPY+DecsSM/d?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1pWpxsdpADvIPJOfoDCXuhJYU+CnuqZ1aQqXcKF3GpSkYDHyEX7ATPZF5oYX?=
 =?us-ascii?Q?wb2eSzC+Mw0FPHvldoGKFFvCxJkHXvwbDx9bAbRO129fVCeK7IaG5tRyKmwt?=
 =?us-ascii?Q?V9xChc2prA35WCKhlT0CtSMTxVXofHIUHPgxGVD6HpqGSfz+7jOtlVAVaAXo?=
 =?us-ascii?Q?yREELjZaFMs8pJHcnGSuVsAGTZNKbLCkUpfzbocaa98tPP3B6LncpC2HWfza?=
 =?us-ascii?Q?g8pCLgRggyTTYw5nQtTheziJA/37kUAQPKW0a/WHMK6MIA8Xv3YaMU1DOanQ?=
 =?us-ascii?Q?wfNAdw3N2QXJ4NJ8xJdlXCFhFoPsQ5TMf1zpRMJk4NsqP931OIcyQoD0QeaP?=
 =?us-ascii?Q?g4JXYAGH7W4LP/wrwkKRoSestcE7IU63GkwTpb0NH0ryt2x2O/jyq+wIUWB+?=
 =?us-ascii?Q?ql0afSorCdGXGi8eHDkyxklm2VhXG5hkS2U/vQ1ImlLVA1iVVMtJa5+EXa+C?=
 =?us-ascii?Q?knW/f0CmjuNd2z1E3ze7zkh8Aj8arZJSFHdRxFD73LoydmeLbAew5OqSkjw6?=
 =?us-ascii?Q?p15bhERbnW8eWl4LacaGF9fH9dqdHsB1QWE8k/Z1tVs1d4yLX7aJP5Z24rGC?=
 =?us-ascii?Q?RRGJzMcKDWQbUR2tY+FsuZ6BqFoBhLTgs73YyGn0NjnmcsosXdhkJ1jgSXxd?=
 =?us-ascii?Q?thofzqug0FNJezxJaV3wOKz/RPaUEWJgCgHSsjf7i20wI65dnRGZG7KoOCh6?=
 =?us-ascii?Q?6YrCqrLQDYzPAxRnG563bV9XYBfSMHKc5sMMfeolDTdy28mPesdbZ5U/ZWrw?=
 =?us-ascii?Q?Ls4ovi39jQUy26BVP51KvpAVyRMNRLzFH0sRFeMHIAgXr5uU1nGNBScpiQOm?=
 =?us-ascii?Q?XCmAriifbDvoySpoEGLiEyITkbUVx/O00LA6kA3GG0TD/IYORzGt1/NB7SWT?=
 =?us-ascii?Q?AFYAecqVek+sxlMSz9flQoHFKJNzkC0Ftmysoj/kDCyKfzdK3aWy40qvO6Ow?=
 =?us-ascii?Q?Hs3iMnMntUnINbLLYV4SJ+MH7YITOPkk1i/j3sSJ4XCiR0MrzMrdOKERhONA?=
 =?us-ascii?Q?KZxSG3y8v/vi/hJd/m84lp9NGC+sTvvfpNG5ayc+ZGCGDqrzHPbrl6w4pL4l?=
 =?us-ascii?Q?2NmkmblcN0/YFz+r5Stewh6NUWFmw3IB+JLH2UOz4v8Y44nSoDzbyXltECvP?=
 =?us-ascii?Q?fkKFyIMR/t/9ezG7U88r3dp79NnpEcr6rEuTpd25/Y+hmA0q0SZ6mZC3k1Mq?=
 =?us-ascii?Q?YV2zmMW/UED3OBwMa2qpxbGsjUefM5/beAygi0sjZnNWEqtryArYZSSANxqM?=
 =?us-ascii?Q?Do7VHvkS/YJcaqJqXCNnybHEd5m6gG941s107AZf4rYNu0RBhCNJdYrBZX1m?=
 =?us-ascii?Q?+4PovKJ2KQxl1Ihb8p/Fva8RG2B2Q3LkJmLVtBIiK/JOouCkSPsexJc+1bmS?=
 =?us-ascii?Q?YXfaoVUMgNKByyATA3mbfUAXE9MzBvWF7K0MhwD5LkunhU0S/yzyRxuiVDj/?=
 =?us-ascii?Q?kpSuOk0OC9LYNfkiiprZtnBd9mkC3eEqQeQg6fOFv2XYjUXL+SAYFghcMTA6?=
 =?us-ascii?Q?8zPnVS5jgdzpV9yV3fVUpeMQrSfOxfX/8RoO8zb8ADuJCOE7nb5rkL3v9gSE?=
 =?us-ascii?Q?oElCAoShuTl6EhlexKh3HIXw2nakzoEuxjuCOcQSorIoQ+XjDhe+IEytmv4v?=
 =?us-ascii?Q?noryEymN58MBTlNHL3Qq4IU=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d01f44-7d5a-4d46-2bdf-08dd52905f62
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 15:56:58.8701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KsvRg+cQWmRhthIXOfPI8ntyG1Te8Bt4mWbhUmoEkIMhhHEGwcGka/YDXVZKNXJgIwl5ztaWaCVz6sT7jBnXVJfc58jdd7xse+Pm/bfeJvEToHtnK/IxSfyrtwCM3EwA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6238

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

In preparation for adding support for the RZ/V2H(P) SoC, where the D-PHY
differs from the existing RZ/G2L implementation, introduce a new
rzg2l_csi2_info structure. This structure provides function pointers for
SoC-specific D-PHY enable and disable operations.

Modify rzg2l_csi2_dphy_setting() to use these function pointers instead of
calling rzg2l_csi2_dphy_enable() and rzg2l_csi2_dphy_disable() directly.
Update the device match table to store the appropriate function pointers
for each compatible SoC.

This change prepares the driver for future extensions without affecting
the current functionality for RZ/G2L.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 24 ++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 4ccf7c5ea58b..3a4e720ba732 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -107,6 +107,7 @@ struct rzg2l_csi2 {
 	void __iomem *base;
 	struct reset_control *presetn;
 	struct reset_control *cmn_rstb;
+	const struct rzg2l_csi2_info *info;
 	struct clk *sysclk;
 	struct clk *vclk;
 	unsigned long vclk_rate;
@@ -123,6 +124,11 @@ struct rzg2l_csi2 {
 	bool dphy_enabled;
 };
 
+struct rzg2l_csi2_info {
+	int (*dphy_enable)(struct rzg2l_csi2 *csi2);
+	int (*dphy_disable)(struct rzg2l_csi2 *csi2);
+};
+
 struct rzg2l_csi2_timings {
 	u32 t_init;
 	u32 tclk_miss;
@@ -360,9 +366,9 @@ static int rzg2l_csi2_dphy_setting(struct v4l2_subdev *sd, bool on)
 	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
 
 	if (on)
-		return rzg2l_csi2_dphy_enable(csi2);
+		return csi2->info->dphy_enable(csi2);
 
-	return rzg2l_csi2_dphy_disable(csi2);
+	return csi2->info->dphy_disable(csi2);
 }
 
 static int rzg2l_csi2_mipi_link_enable(struct rzg2l_csi2 *csi2)
@@ -772,6 +778,10 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	if (!csi2)
 		return -ENOMEM;
 
+	csi2->info = of_device_get_match_data(dev);
+	if (!csi2->info)
+		return dev_err_probe(dev, -EINVAL, "Failed to get OF match data\n");
+
 	csi2->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(csi2->base))
 		return PTR_ERR(csi2->base);
@@ -890,8 +900,16 @@ static const struct dev_pm_ops rzg2l_csi2_pm_ops = {
 		       rzg2l_csi2_pm_runtime_resume, NULL)
 };
 
+static const struct rzg2l_csi2_info rzg2l_csi2_info = {
+	.dphy_enable = rzg2l_csi2_dphy_enable,
+	.dphy_disable = rzg2l_csi2_dphy_disable,
+};
+
 static const struct of_device_id rzg2l_csi2_of_table[] = {
-	{ .compatible = "renesas,rzg2l-csi2", },
+	{
+		.compatible = "renesas,rzg2l-csi2",
+		.data = &rzg2l_csi2_info,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_csi2_of_table);
-- 
2.34.1


