Return-Path: <linux-media+bounces-29882-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88247A83C41
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 10:15:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 350657B00ED
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7D520C00D;
	Thu, 10 Apr 2025 08:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="N86/2Ijj"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010037.outbound.protection.outlook.com [52.101.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B36D20B810;
	Thu, 10 Apr 2025 08:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272846; cv=fail; b=kdslujGuUpPHf5Nft8SlE7SUyk7gkreAQmrIAoGFDva68q1oOWZoh1AK6rhen/r4LIq2tA81Y8k8pjE3ePO288uxWdVkKnRWxtUkcAFSLyfIqfGyOqNdsy05ymar6ntvulW4cibwX2HJHngGvTY5OUcHp4yQoo9+f3ZKaG3v/qU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272846; c=relaxed/simple;
	bh=66xXUnrKZNA3NU6Ssqm6z65XlrTcnHLH1W3SnVeC/48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lnrFAnz8UEFApdFqmSTr2YPX47/2OdPVv64SDyR3Ow7/1/zD0UJsCdtNJDzPHlc1Gs05tVS6/8A3VjmpR+S6H+gw1UzbtODfhVwkNMDBB7mXX5SnUnTxhI8BTyzRGPiokoOJrWJQ+pV7fcyCKFW/Axr+D3rBQozR5eoBcTyVezg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=N86/2Ijj; arc=fail smtp.client-ip=52.101.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ex1Bym8l3le3Zw36v7G0OpmWZBfg82xGm7GYJXOGzD2/2K9UQ9vBCDYsMKYzJsruXf/Ha1wwO5n7baPhLi4Wt/tMdgiNhoq+MaTsukcewp4T5oTU/RO8zh+oLADNsrFoSyuQm1HKgHcR+94WWgWNq68nwTtCdEsPjhqxoJ9rLClqfD17wDJeTiGzWYXQF6Wm5FB4ilPpWOy6HrnaT79JBpxMkjU8mxjSLdIDbuX3F8/Hw3Ja8uJZBI7lt89+UFBIKy3ircbJ96z2B7B9GMwFnPRgl2CHh1yl+2ilG+zDKSEjCWU3T/1SkkeTwpq8gH0ArDms5LOFR1hr6hZvFetfPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Omc5F4uisa8utpUKhjmd6yIlHr37k/GjyLMcJmSW1zI=;
 b=tqSKkEelk9raqxaVmGJKTZawNPXkL/AWB8c5nsYShjK/GuSF9cxvjZEAH+4btLQ1Mq/MjCv82zAnC3V+WJLtVWRkH1cFi2GF26F8scP7og5nnHyKz0XeU66Ju++AeBfPN+4aEaizJ+ur8abRvSwd6c5pNpDiF7zMYOBIndjNJ1HZSRqiyYc79TvHkwEdcAgu1AlpdiXgh1Ing5izsYRbOyQZb/NjAdNcO6K+pPQMAoOaKOBTv8cZupkdP+A2G5fG2PJk2gBIV9gVDfA59YUozMphyzc+6iDKyh+DfIM7pwq85jFlIkSXHCCeWadz+ZIzs0XOPpzSQ8j3bBT3ECEVzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Omc5F4uisa8utpUKhjmd6yIlHr37k/GjyLMcJmSW1zI=;
 b=N86/2IjjetMRjl44fbo6F0I03z5Cf6l8afgPOxj4041Yc0Bxzyju4fx02eOxyfxzvJF8d9NhujiyjR2tsC8J+AEqbbFOYGXlMQgcMN6YxpWfmuo/JCJ+VPq4GQjccjG97ZH9xpQZrcarpBldmf8pJGxJV7klRb5fuFexWaPQHV8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB10119.jpnprd01.prod.outlook.com (2603:1096:400:1ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Thu, 10 Apr
 2025 08:13:57 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 08:13:57 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 04/17] media: rzg2l-cru: csi2: Use local variable for struct device in rzg2l_csi2_probe()
Date: Thu, 10 Apr 2025 10:12:08 +0200
Message-ID: <20250410081300.3133959-5-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410081300.3133959-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250410081300.3133959-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0285.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::19) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYCPR01MB10119:EE_
X-MS-Office365-Filtering-Correlation-Id: f912fde5-c7d9-44ca-b6bb-08dd7807a451
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MDusV7li/WXYBwnF7dJmUm/WWSrGxL0f39J1FDSfW4giaQyB/xT+AsgPTace?=
 =?us-ascii?Q?7WnWERIOPs2bWg3UJH9bZind6CO4K7BjEJWRRT8MFVMu+rdRlj4oZsYqgxfb?=
 =?us-ascii?Q?3xwu3sC/hm20gZCiAw1QwVY1QuxVDFdtRrsJB4Mtc0yNZJlIsLsgDqYW5c0B?=
 =?us-ascii?Q?Keiv140gJcGkVOwQtN3JZIKMKhA2IpNJY6KN2Ymya9WUgDYb/YCg0ID+A1V/?=
 =?us-ascii?Q?g/yFnHP0OqCEY8dAaiE1JPi3MotZChbehryCIvRMX/vWMhr5TqlBRxWRNyQS?=
 =?us-ascii?Q?EnpE9YRFRjPl8BgcPt6gJfeb8xJ4SkCBaWTbUAFgkQLTK9pHPGJT+fbDQR75?=
 =?us-ascii?Q?3Q8YsbXrGoLVtpKrPkKpfDObGutgpkAVKv9+lz9JUysHm8aqyiuanTi7CrUK?=
 =?us-ascii?Q?52AAMSJSPmSI1M0ZQY+1q1D1GhPDskPYBya1uaPfcZSALNM3NqFwLSUnQKIf?=
 =?us-ascii?Q?s6o0ctiRgIsIP0M8672t8P5s+U7kUIeYuxnNYdysdB0NRNDoaTzi44BgysxX?=
 =?us-ascii?Q?aBa/Iq/lX/hw8Z+MGXZSA7A2TmTwKH5d74MdB/I0hXtsdOfEEuqE5XuHSfX2?=
 =?us-ascii?Q?av/XwIrIS0Tg/OVQj5Vxwc8qEITNUubepLoQZzVQh6wz7xEv5hl4xSY8i1c6?=
 =?us-ascii?Q?7X5D3vHy2xkuXEu9b6w2mY7P0Ya6u5KZ1FKWJlxfrKexcyeSzXjopE3xdRqh?=
 =?us-ascii?Q?7oP/2waf6uAdCG8+ocQN3ul01ptJyqfQYcI+uKULUKWfL/59k4sBiBAddokX?=
 =?us-ascii?Q?b/hWprbnX21AxNFXqreFjhBHyihVgWjRS9IVi+i2aYjJb0HB1sIdYbG3fljT?=
 =?us-ascii?Q?TnIl/za92NTdhDAs3tkri5PsFv5qdMXtAx8sT3HIxekh4uFPYPmmkwfS9Lul?=
 =?us-ascii?Q?2OvNGuWnUd7Ayq/wVszFlgnQSzEwtmSV9lntIfU6wEJFa2X7A4bpMMkFJRrM?=
 =?us-ascii?Q?639oVa2H3MB03mz9XltZ3twtimxNcO4jPb50Z9cF3/fURdHkfWLfQLfmumEW?=
 =?us-ascii?Q?XjkHFW7uAm3XBX1QhXrV3x563WTOT1+GiVoOyCsyv/ykTIhSbFo8xBda/v4B?=
 =?us-ascii?Q?PKqvaRRwkSOfYsWcvsiHqiBwt983ExAk7lbYR/7ZaTuCzaEypirFtuC/64tU?=
 =?us-ascii?Q?SsUY9TRH0HUFdBhAMF0dC/lg2Nz57PE3i/QmlkFTMxqVbFqk+gFlx+2PCtrq?=
 =?us-ascii?Q?CqUslrzf3XTc+QWoWi/Kx+Gkd7oj1+/q4+zJamX1+oKZr7jgc6ThcYBj9H2R?=
 =?us-ascii?Q?w4/46G6pEjdkqZbRB1lIkg/wWBGN3gcwRYeWHP8Me+Q+l5B0LmICKxAjikio?=
 =?us-ascii?Q?LMzxD33vO5lfHcO+YJ8VQhu26vyz5P5Yn6KtnBdwZfhXG7hBzfpAGDJqEdl5?=
 =?us-ascii?Q?FtNWoUc4Aubkg1SHjTxmTJ9Tfzp4l1gNn+kxUdwyMeFL5tjxA3SJvD+PgRaI?=
 =?us-ascii?Q?ti5so+8yOuHvOVhH/wjhfRYcnQ0K91H54NbmOSnu1VVV7F8y49sYpg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M6QzlgWjxmVJ3tlb+dVdMPXRK7IIM24AZlUfI6pN4k2LU4trCUVIKfhXhJvg?=
 =?us-ascii?Q?OKnF/Ga6Duv8slDeG/0VNGI0aLZZ5jDGqHs0z0DRqBtBx7WAZ55YxlI6cw5U?=
 =?us-ascii?Q?8fvvBIXojXKZ8P2RDOFIoWtcGLdpC30CHTX8UoDwYgu1n2pQzGHUKqlG82Jr?=
 =?us-ascii?Q?bJkLZoAsnqIVuvMfZjQDoaXfupIsiqXfuZC/nh7cavJ6UGl515KO0K10NZWF?=
 =?us-ascii?Q?Pz5Of4K0fkPWBJPCieLMIQuChPcSrC90G/YnLCrcci/nOMNV5ikwCUU1GSFg?=
 =?us-ascii?Q?AkFdGPAZF8maw9SzWo84afxv7HWoQ2cIsAC7QNF0A1hhi7jPCsF2H9MTZYUA?=
 =?us-ascii?Q?L+eWutEsImwn53SW1kHqN9fJiLHntamoFY6Ey7lmCfmLJK+aALvaFLnE1CLg?=
 =?us-ascii?Q?logwwSSIUdE9L9MoV8UsW5jwqHpkVEf/QccAqAplnuD5r03iFkKriL7XVkAA?=
 =?us-ascii?Q?8+uN37BTmzPRtICB1GtBDgqi6C5X9eh30f96ecrOaKpW7TzvBLYHpnVv/Nzo?=
 =?us-ascii?Q?nDbmxhX14qoGzMS/LJIyVhWOetO4cyRIAnx4s/J+oeu97odcM33kCf5HpXWK?=
 =?us-ascii?Q?4M/E7OTbHkNpDT6ndk/2Q2qowvwst5/ko0wP6Pmkb/WUKgUk9/AyKR24jUVo?=
 =?us-ascii?Q?LmlnVNdKTiv2LClwAb50wmfOSBw8MGbOPBhOBQ+mtbcMtIkFQ/KSOF51dX23?=
 =?us-ascii?Q?gTKtUosfXXVYOPZYdN/Wh3Hn5GPzZMOKK/U9P9N0CQpOThwvTFL8gVUyAlGS?=
 =?us-ascii?Q?ufTEfLqswpZV6tnxPDVs5dFejtShDS12iJn54yoiDkDzGR4RKx419jBAQmvn?=
 =?us-ascii?Q?Z5GLmUGuYv5PUgk9rmWQoxQssfFf7uO82KEWFo4wnUkQ5eM7IuU1im4dqluj?=
 =?us-ascii?Q?Jl0d1H2TkZef/GGTnDRKOsVoiAUtSxCYFz4xHjRy0ukziasxjFqsIb1NX/Ji?=
 =?us-ascii?Q?/LriYKRjkRQJIMNmKTNtlktgPJl/hNvCi0VuRC4Ns944xpqQBts0kBwIscWa?=
 =?us-ascii?Q?/sNiRailR41EnKTR1mtKPkDc3uWMmw3Nj8ltY1xU/M4KbEFaiKFMfnyCZKdi?=
 =?us-ascii?Q?Mlut7hQsFLL598vJxZ31+yCMcAbp019eFdM8LTsPhYvE5boYoQllDBcKFlXq?=
 =?us-ascii?Q?JoR3d+uyAHpneLH5fI6fXa6+ZY4Oy2TzMIlHNZDBZzF9FCOjsgexQA5+1PFH?=
 =?us-ascii?Q?T0pU/YPSt2vR1lbjYytBn4U0vQg5sJe9wLSxl4aeX+iI8GKnGarsTHCcASS3?=
 =?us-ascii?Q?dCsGcgpsxHX5ZnoSr3HVd7TyegDKcn7bnJB8PJEGqs/3lgZRd0LXD/jBPll3?=
 =?us-ascii?Q?n4RBHWyKTdL9FQyktH7NBWc5OGhRJT3dZ7OvKAWvuXkZIGDIS8AuqpmfTmmo?=
 =?us-ascii?Q?YdqUYVD0WCSdrI3/JPY+8EUAod19pyXzMLOBSQLVepPmauYyXkJK5+vuJbQ+?=
 =?us-ascii?Q?r7mns91p9BO/0r8rxcK4XXoNyWVQLCtbcTUeWkKJ7EaLF1jqVkn/HTrF2lQR?=
 =?us-ascii?Q?uy2LV8BqkYd0i918KJdEkH5DWbec/C+XBnwk5BajwJZzaiRHB9V/gy9r1uEL?=
 =?us-ascii?Q?sDvss3s8WnQXR/J1c/B4W9w2aFRX6urrSsijQEB9/3Gk8gGJg8bw5oXS8Wor?=
 =?us-ascii?Q?8T/Kl1CU4ujZXxjVZ6bYjtg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f912fde5-c7d9-44ca-b6bb-08dd7807a451
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 08:13:57.6709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dmPFfczXUuGC5CGkL74stmB98vrTn+tF6sM3o1IZVAPlnlphDXKhS7g1xIHvGwY7z2kR7RcyCBCm+2/xauvqt4t12pwagPewISlw3QsynTwEMQid+Vg9VQKduF6I7XmB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10119

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use a local variable for the struct device pointers. This increases code
readability with shortened lines.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v1:
 - Fixed commit msg and commit body as suggested by LPinchart
 - Collected tags

 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 31 ++++++++++---------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 881e910dce023..948f1917b830d 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -764,10 +764,11 @@ static const struct media_entity_operations rzg2l_csi2_entity_ops = {
 
 static int rzg2l_csi2_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct rzg2l_csi2 *csi2;
 	int ret;
 
-	csi2 = devm_kzalloc(&pdev->dev, sizeof(*csi2), GFP_KERNEL);
+	csi2 = devm_kzalloc(dev, sizeof(*csi2), GFP_KERNEL);
 	if (!csi2)
 		return -ENOMEM;
 
@@ -775,28 +776,28 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	if (IS_ERR(csi2->base))
 		return PTR_ERR(csi2->base);
 
-	csi2->cmn_rstb = devm_reset_control_get_exclusive(&pdev->dev, "cmn-rstb");
+	csi2->cmn_rstb = devm_reset_control_get_exclusive(dev, "cmn-rstb");
 	if (IS_ERR(csi2->cmn_rstb))
-		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->cmn_rstb),
+		return dev_err_probe(dev, PTR_ERR(csi2->cmn_rstb),
 				     "Failed to get cpg cmn-rstb\n");
 
-	csi2->presetn = devm_reset_control_get_shared(&pdev->dev, "presetn");
+	csi2->presetn = devm_reset_control_get_shared(dev, "presetn");
 	if (IS_ERR(csi2->presetn))
-		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->presetn),
+		return dev_err_probe(dev, PTR_ERR(csi2->presetn),
 				     "Failed to get cpg presetn\n");
 
-	csi2->sysclk = devm_clk_get(&pdev->dev, "system");
+	csi2->sysclk = devm_clk_get(dev, "system");
 	if (IS_ERR(csi2->sysclk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->sysclk),
+		return dev_err_probe(dev, PTR_ERR(csi2->sysclk),
 				     "Failed to get system clk\n");
 
-	csi2->vclk = devm_clk_get(&pdev->dev, "video");
+	csi2->vclk = devm_clk_get(dev, "video");
 	if (IS_ERR(csi2->vclk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->vclk),
+		return dev_err_probe(dev, PTR_ERR(csi2->vclk),
 				     "Failed to get video clock\n");
 	csi2->vclk_rate = clk_get_rate(csi2->vclk);
 
-	csi2->dev = &pdev->dev;
+	csi2->dev = dev;
 
 	platform_set_drvdata(pdev, csi2);
 
@@ -804,18 +805,18 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	pm_runtime_enable(&pdev->dev);
+	pm_runtime_enable(dev);
 
 	ret = rzg2l_validate_csi2_lanes(csi2);
 	if (ret)
 		goto error_pm;
 
-	csi2->subdev.dev = &pdev->dev;
+	csi2->subdev.dev = dev;
 	v4l2_subdev_init(&csi2->subdev, &rzg2l_csi2_subdev_ops);
 	csi2->subdev.internal_ops = &rzg2l_csi2_internal_ops;
-	v4l2_set_subdevdata(&csi2->subdev, &pdev->dev);
+	v4l2_set_subdevdata(&csi2->subdev, dev);
 	snprintf(csi2->subdev.name, sizeof(csi2->subdev.name),
-		 "csi-%s", dev_name(&pdev->dev));
+		 "csi-%s", dev_name(dev));
 	csi2->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
 
 	csi2->subdev.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
@@ -852,7 +853,7 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&csi2->notifier);
 	media_entity_cleanup(&csi2->subdev.entity);
 error_pm:
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_disable(dev);
 
 	return ret;
 }
-- 
2.43.0


