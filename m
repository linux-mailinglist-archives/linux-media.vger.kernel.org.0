Return-Path: <linux-media+bounces-26602-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B130A3FA21
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 17:07:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81AF1441151
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 16:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A13721B9DE;
	Fri, 21 Feb 2025 15:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HZzegMLD"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010041.outbound.protection.outlook.com [52.101.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9B821B9D5;
	Fri, 21 Feb 2025 15:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153429; cv=fail; b=PkPULXOZb/+5AfG+XSTfNyZ41Fsn3ayD3xkTurd3e1ltPZC8nYgEFlorxjW+iII9PC879U3wfGWE8AikpU1wMGG6mN1D0FzmxQ/KYqoWGEkmR9VC0/F3k9vhB/NukWUx2tekLTBXrvAP0omht9jkUGYPvtSP3bQyc9FQbrUsoSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153429; c=relaxed/simple;
	bh=WKkwdYiL4CBa/DIu3RohlqULDM8g2a2N1ymi/k1HuDU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Lvh792aiyf5GfYwjeta0V3zF8vlqU0jYGOundkLJWWnzxTLgeT0+/O2Vp6hQvz6FwfG7T+f6r62PkLSCPgT5rGGVYFQl4JiQz7DaoUB+fjICzyupriOVmbwzlDLB+3c6sFzRqVQl68MfBUEZjCI0VE9dU43VDUaC9aJlRZqxSq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=HZzegMLD; arc=fail smtp.client-ip=52.101.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y3mWqsJGXSO1nf8VBhf9Ec9Sc5QTg6wyzz/I3TS9IgFywU2v7+sDuvevSps538xCuj7MdYCFUuKSPcBmCxLrJoPm8AMWYSb29F9Plp3J7I+FbJ6f4aEg0hu/ICtBUSiIaEQuDYIsFIbhxIZOuD8N1gwNVqImILKjGYun/l+I7znydzUz7BF2ap9llzczr8l6PuDEaPhme06XFOPIGtVicZYAhcs2bq0zcUyXJy2XUupypw6Lns2MAPoCDva6yQDC4CUTafW8BqDuHAF3EA1t+gd/J7H4FjSLiXLC7G45oVsQefRd8UVFhHEpJ9jzNFVV20kPV4bTpMbjTqS4ARBeGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhyGBc2Tk2OI/DoBghINmV5KUVjdxtEAm+DlKVq8uJY=;
 b=AkrADeJlix7r5wd5wvNHnImB15WpjqfPgmXAVlp5MXTD4ZVCcO1BG8j8k2cE+KVtUftF7gfNWs2AhH7xfhrdtdzEv6shSFOpwIN8NhWBFfRVCdNe65df3dN20dhCEyvJEKjJszuyNvZjfBpY31+GjLfDUQ97t6OccQJBmdLgQMY6YTsvHFv7SBn8Q252WJXMVifalH7KG49ka+GEB/RGyYqb6aK/GaaiVHoLz6bEy3p2r3H4CcVmOEACvKlr8sP2s9uK/mSlXPtToqfgdpeUC+wnxjkeO5ESZwxnnJ+kw4Rw8JJxBHpXND33cYtDY4Crxdc3934fC/xHzVeFFtrUww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhyGBc2Tk2OI/DoBghINmV5KUVjdxtEAm+DlKVq8uJY=;
 b=HZzegMLDBG/4FsT3ctxWZzCNjCIJpmy4BEDBsemg/E/tqcP0hx7io/d34nofOqt4F95KKP4wGe6Pl+UViy6BjW5dvkypw40icsC9RtJsQQB4MXZkEep4dU1PoTKyaC/teiPVrVne8OvZ+QG7m+2CGYNTliRHicjBsNKTkkZSxgg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB6238.jpnprd01.prod.outlook.com (2603:1096:400:7d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 15:57:06 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 15:57:06 +0000
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
Subject: [PATCH v2 09/18] media: rzg2l-cru: csi2: Make system clock optional for RZ/V2H(P) SoC
Date: Fri, 21 Feb 2025 16:55:23 +0100
Message-Id: <20250221155532.576759-10-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0eb37cce-bb9a-4f93-7c69-08dd5290639a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bf3mjmv6dKyYlm8dSP4slQ/WrKaa7261G7eRh06d/gQnN7bVGJiG6jgkVVJ8?=
 =?us-ascii?Q?Z17U+Nx9DHodgyVZxDY3CSKmxwl/Xr/WwTltxo0TiuddhjPaE7byCrzIeZN5?=
 =?us-ascii?Q?HwW6muvucDVbz88mOORBRoV4WDRX+n18AkCFRcJAizXcHn/I7nYLymikZsQa?=
 =?us-ascii?Q?DyKWBEBxgHNH/nheKzxROV6zjSt4onQZ1QtrOByCKMMHosRL85+gJpMA0X31?=
 =?us-ascii?Q?ALkFPT4vVuHZ3XLUlDOE3JVbfppeu9T8Y2PyxeBhK63g9ENSsB8GJrZlkR81?=
 =?us-ascii?Q?ELoSDNfAOxVLF5UZi3hRidwYsqba4YebB3pfOKKdc6d/a201SRFCV5xW1ewg?=
 =?us-ascii?Q?dtW5lMV0dXDUk6OoN3yP1tYdEYIHKn32kTjW9Iw52ehAlt05MoamLPQQMRQ4?=
 =?us-ascii?Q?d3OE5kwZSDmtn3WKoX/c354V1okqmcbQzyljk9NK7amXEniQVlRtUnsvkXGh?=
 =?us-ascii?Q?bS7kEgZ9s/V1WKsSdAGspD0BoFcaDxHmi5A2yVl3d/0hxK1G5wQfdHtPZyaa?=
 =?us-ascii?Q?9knmCxRi4ZyOXY3lrd0Pd6tfKL0TiM0MWhQI0tRcxGZYdElGqfEnibLWQksk?=
 =?us-ascii?Q?NWKO5axfHzZZvoC244qo7o6FD/sHCTkK4mopfJjUlUwsNPDx4h+EWobk+PPo?=
 =?us-ascii?Q?ujik+HGVcjqBPgSyUUsttGvoxPkx9Nk/OHVkq+EQyquLiGf/mQYJ9WC9Jwoq?=
 =?us-ascii?Q?+cXq9EnTAw6gaRqVh9VUrW2kodD1LS1saaaH43MwIke/JEcEkXhhyNccd6LU?=
 =?us-ascii?Q?MF26uoxi8Nbq1q7aPIN3xMauqQj3mBVD2kug6r8r1uuhP/ojL9QK+swzxSFk?=
 =?us-ascii?Q?80jmoCYMriZ+FCdbYhOrXjtyOyf9WcpWFA/T2mix7QemymctLLUXViZscUPO?=
 =?us-ascii?Q?dz+NcK0aIqulyFuyOG18SzPVQBOfwbAPIcdIZOxKyGyIslFMXVB4xQUIGYK+?=
 =?us-ascii?Q?bG60ZfkaguymtoIN2/yZ5t5OAXPlPCOwoVo5W7G8+90S2hiv2Hh9uCklHmuj?=
 =?us-ascii?Q?vT03pIibbgKtqgFVCdXZy2lypTk+68N6IZMah+tWKhRXGU+r8G/o6WYHtTm6?=
 =?us-ascii?Q?ZBUs9Rq7zO0gAUn8qKawLPOf5D84PTkUeE95bnbXjUFGGBQp3rqSElioxxzR?=
 =?us-ascii?Q?s5KG2CXCqlSQDdmvam73WcqmeVeKQu+QAvctMY8cnwVc8ThJQJgerwCvys4e?=
 =?us-ascii?Q?WAHBjMEDIg49+oWAhsJ9mfPNOPTCTk/QBo/4xq1aMBpE4xzBM0JMPBkyE6Zr?=
 =?us-ascii?Q?AnF63a4IjwvisXMQiPwLOY3Ri4YhvfF8sfEOf/g+PaaxotJPLWW01yTuDn+N?=
 =?us-ascii?Q?my8dAPpe5FVs+pu8llMHldTMhtzMy2gCfgbWgGrVuOi3P7Zl1D9SaMPt8Sjb?=
 =?us-ascii?Q?goZHaKA/wnlpAHEYcWmvGoZZWy2iiy5pzjScC15oC9lm2N7Jbn1KicD2XhGx?=
 =?us-ascii?Q?EytHatEv6LmLwo5o2NTvkbc88ch55pif?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mhZ4KS3IdyHr502dt9ZHmr1LYzhHkIaviPXPXNF2iGxXH88ydIhLFEb+j8JL?=
 =?us-ascii?Q?DdkwlP+GynoQKZE7YkS3OYTyrMAE/Ots9cZ8ak3SZfY0nyCkoFoJcMxCv34E?=
 =?us-ascii?Q?B2dcScYgWbu+AhNWiG381oJTFJ6QbtEdN1qtaZlcBsvbfO3VqkPIHZHHCGHy?=
 =?us-ascii?Q?d9neImLYgLTrPYsrDDwkPtTiaFAnX2FB5V/hu/EoGSoKOlVeMkUEmgv2Nvcf?=
 =?us-ascii?Q?2N2GIvyLYPJeWfYtUkfBjGhe7IPN97tGKtTmhTfaFJFNGM3PARMtSrU1OP0s?=
 =?us-ascii?Q?ZyLOJDtLeYsd+xPe7uAmaTJpqEWq43iqKX03XSm2Vb9PNSHGnwLPr2JNvlCi?=
 =?us-ascii?Q?XodlPQqQXm7NpwZF/e+GU1OlUir4OdzFLQ3WR5xJboZgG0EJ7TALKlZVdiTu?=
 =?us-ascii?Q?cDOOmrtp2hkh1VUtB4q+YriePfJ8R7qRY760AEwd9bWNq0hcIqW0a6YQ8Crd?=
 =?us-ascii?Q?A5jyR16tSNAxit/8E8KNR7dj22LDoaaQ2zNfTdh9B1bE8IkMpZvQFSxyIzZn?=
 =?us-ascii?Q?2KloCLfxfolNIJSbs1vd/FEbjqSHkdoSpXoulrv5njymtF3zXgsZ4RDkDqBT?=
 =?us-ascii?Q?nKG7j+aEKrLvHAQbBDrdObG3lPM0kts6uzgdXjpQxl9SlqcubuHHJ/tyJWyX?=
 =?us-ascii?Q?Xgc/AuTb0fk/tBfylLHy7l4rCGkVMwBYv9Yajmh7NAJW6I7dPnm1emdds8gH?=
 =?us-ascii?Q?XaQInOqmMWisv+L5boCvvjmhg66GdkemBpJCeYNFgPnSduUackjwDSBI2ys7?=
 =?us-ascii?Q?fMq4VxXHH06hAGdHNRhv0ZEDEfyv8Iu6nlj+F8ddAsEjxyHCd3hEphnaVKzO?=
 =?us-ascii?Q?xH8BkCo4VVW9bga0ycAiA3xTSc3/SqMR9CAG5ZRz6xRMNRE7B2egEADXGzbN?=
 =?us-ascii?Q?dSq8LVkYfQBOUpvoRRBDE9X4tWLWFj7zoyr8WtTgWWKb7e8G9gjZt3qbsJXy?=
 =?us-ascii?Q?L0RZZ7iGXD7m0+AcJ+ib/Bd28ALxMfQzce8G1tYJCehrEE17Ax53iVXKPpjX?=
 =?us-ascii?Q?N0GOufLLmc7/78PRN3Q5BZRtnonJ2fT2sEZa6Q83P2zPz8es1jkrRNTDjvwa?=
 =?us-ascii?Q?bnl6SDwiY2kMftADdUvxxytOCr3r9ZLYagw9hTWRJ/No2qLJSlCY1/SaM4pq?=
 =?us-ascii?Q?lwDCfRRfUl/HjLmwv9JfklsU24YhnJ/EtSkr89UzwsuRlrljSLZlQXRnfzkO?=
 =?us-ascii?Q?/R0b/aR/gLFGWc5brnPcPofp0vfqfOC77/STSbRcAN8Vm73HHqCQDvKC4EG/?=
 =?us-ascii?Q?Or2nfeMp7+Ntp5SLfus5tLKrLyzCV9lGogKSMsmYKt82bRxl8M5yc3J5R0Bh?=
 =?us-ascii?Q?NaJphpVD4dWao20O4+i3oMFzA4OtcXx8ywUGG9TqkVAyvW/y9pLzNiKeYPjA?=
 =?us-ascii?Q?kuWkCiYGVKulwpFwa3FokqlpnMgGaZpgun1IqOMGs7vHSUUkG88mC2ATORi1?=
 =?us-ascii?Q?Kp269GHke7FLXlWTnAZ5sJrWFWzKacirk20dDT71XnHaO8OdvDwqWm8aWP03?=
 =?us-ascii?Q?IoWKnlE5iYNGbzvdlnsET+0PZ/BSEC3vrp6TBJyqFB9L/zqS8yx5FuF3qAWN?=
 =?us-ascii?Q?dUHq4TVswtDKxAYbuwxarfLC4JD+yhUGb2k8qxGJOuDmXKQxBAJXugCOXUSE?=
 =?us-ascii?Q?dQ4H7quibCUeYl/oBPt1NjE=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb37cce-bb9a-4f93-7c69-08dd5290639a
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 15:57:05.9933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XYH37z2EagkXhfJoy+qigqzVelb/rnUrr+yhRawI+ENzXILU26fKe1vufmk0702Yhub60vm7+bf+5tG9rgol8pKGa7P2wLVpC4R4xyOXuPnh/s/4/gF9PaP5W+dEiBeJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6238

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/V2H(P) SoC does not provide a `system` clock for the CSI-2
interface. To accommodate this, use `devm_clk_get_optional()` instead
of `devm_clk_get()` when retrieving the clock.

This patch is in preparation for adding support for RZ/V2H(P) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 3a4e720ba732..771fa35558be 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -796,7 +796,7 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(csi2->presetn),
 				     "Failed to get cpg presetn\n");
 
-	csi2->sysclk = devm_clk_get(dev, "system");
+	csi2->sysclk = devm_clk_get_optional(dev, "system");
 	if (IS_ERR(csi2->sysclk))
 		return dev_err_probe(dev, PTR_ERR(csi2->sysclk),
 				     "Failed to get system clk\n");
-- 
2.34.1


