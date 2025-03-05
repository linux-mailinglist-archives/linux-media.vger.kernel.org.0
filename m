Return-Path: <linux-media+bounces-27577-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 79469A4FB75
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:15:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C2C916C4DB
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF9E12066FB;
	Wed,  5 Mar 2025 10:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="tdkcFAK5"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2051.outbound.protection.outlook.com [40.107.22.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9042063F0;
	Wed,  5 Mar 2025 10:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741169716; cv=fail; b=mAzCbMlUW1NM6e5OlNgppldGhIQNwk3yDGTezQEjnpBloztCdfXfJZ2DBVfq5sTbKhh53gqc8A8idkvqx5wFaPRxGZw0eTgPuOrEtp2Nze3MKJAbz1o9bRW6gk80s+tuQEl0OB9iBvYO65VA+iZTom3M6xZzz7LOsYLcca1dzU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741169716; c=relaxed/simple;
	bh=ePXuJNWdpOZlGn2gH7V87F6kU2+F+hVkzMycSuwWpMs=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=tKL2JyIVpne0lfjGQi4NocoxsTMODi7tdB6B0CfYj5kuMEZpvW2FqOll3EUq1dHfkC/sW7pkgWG5auWFgXbLAlXBsxoB1AaE1r9M2aOYjpLPp9/7TU74IJcHBTSE1bk/Gb0SqX0j8UA38Qmx27G90ZBAH+BAf1MS3xnfUaIc1GY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=tdkcFAK5; arc=fail smtp.client-ip=40.107.22.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3b9Z/+8oWClYGG34tdstNFYuJ/2vjZaZ4E+VtIBP77Lc4e0TvTHUbAsOiwA4AdeZZy8u4Yugtdq5Y1sZmqgU0pazmeqqwg9dpYJJwAOxvHf3Mew4Ypj4fKpCXlAKoJW0ZdxRQVu+ES7Oh71ALqMJt1PJCkpbxNqqdK/10xS9t/USzTYzUUtPyariuH5UyYjgk+XCNLOK37P+0roAwT/+uRb2ljrAMy8RSDVVejqNvfaDm9gkWTqDRC0OzQQV3aHloiJeN68RVTMp/Tx3CizhI0M74OUzVJ4BygylLXWHblz88cTS9u1yD9ald7v95h18RdlbkZg2hqsTqMB/airTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3u1YfspjywiNtpC+zpVZUPLFtqoDQ4X7OEe+gcBjag=;
 b=YgynhSEA7u3niU/gEBRTb5Xv/0t2wGm0/TkgCHwyUuqLl4PNkY/xz6fcRoRHBiQGptymFmTCSdZMS5j91j8ssK5+CSF6VNIkRtTX7woe9ZUeDRT+ZHvUXamjn+b3GRWlhp+rplJ5Y6x6U5eSQxTHC+7gJ1nP6nDhpcjHodCs5jkhx6fpbQPvgjXWDwLC5rv1OcXbRT1jsshW/NDNugJoGPzXqu352vKGy+j0hAyaRFrzZ0r9aqu/5SmVyoYX4bFYFXuDLKUBxONPUfh/OzDPRXHtN8dXLegVxgRZ/f4vpyeUyrc1TgVGtbQB1QZTd683p0hyLY+x4nLf8vX4r4th4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3u1YfspjywiNtpC+zpVZUPLFtqoDQ4X7OEe+gcBjag=;
 b=tdkcFAK5OxURDUHb+xVmR3Vuv3ilwbGs7st9UUtnoS+h+kCUTqvhEGiyeYZ/x4PoTGNxaIgVJqvvqxMUIIS5uAgAMsEG+tATfu4vCJAZYF/zRw8yjXzVIvvXHJlzumME+yZ1JkaZ63IT0fw7GkzyRGRs2OHz0fXoWVgJMOSWEmnziuiGzvnYLcS9vgKkBGn9xOIG2UUUNLqesXJK9/H57vV+lfOAhbtxZazEwa0ZgZBBBV4CkUA9RDoFCN6BCMabTzIuTqzdugWkxTfaPGSqb30T+srEyyXMdOvgCR/Xt4jx1VV3CcqtgQSONmgH5S0qiSg4jtarhvxl0Rx/mY43iQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by AM9PR03MB7266.eurprd03.prod.outlook.com (2603:10a6:20b:261::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 10:15:10 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%7]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 10:15:10 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v3 0/6] MT9M114 driver bugfix and improvements
Date: Wed,  5 Mar 2025 11:14:47 +0100
Message-Id: <20250305101453.708270-1-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0124.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::21) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|AM9PR03MB7266:EE_
X-MS-Office365-Filtering-Correlation-Id: 747d6e0c-68c5-4c14-9397-08dd5bce9c91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j563a9Tk2wMpr+AVjno3jhs015TIeT2g5x8oBzDDDVc9p9wVBPkhokN6PGM6?=
 =?us-ascii?Q?8qz9lQ4cnoG0Qv45MYUqsWpixLnKJES+Vl44JyQZEACf/qQvy0mPOljVKBNe?=
 =?us-ascii?Q?8CqKy1IRYASSPc9/v2ES0OdkFO3iYqhxZzPg38a6CAQvsW/pijCtxbNZTw82?=
 =?us-ascii?Q?QwCrGNXP2aDxR7eUn/SIBRTt82PaCRCTyB9M1aYPKYr2OVloCLqe0IaLHlxE?=
 =?us-ascii?Q?8waqz+BRZ/6J3jzmdH8tFrB3g3hLdNKzl5Ue/tTuJ84T7oJCYuC8INL5Mm0O?=
 =?us-ascii?Q?XPBcC1i+rJxehc2iCY45U7e7aElDIbv/ydPWuQtWBbWnU9azloRmRNCj+Acc?=
 =?us-ascii?Q?JzsJWrFwsUmEWsYruLiwf+opwmgfeq9wpKrOAr4CVEj4J+thIhe/xuvK6Zv8?=
 =?us-ascii?Q?ywRoUYsSJqMI97K6RrdE5ZHFYDY25c6kLZgMv3ebJBLT8kAjDwGcLpPdhPZq?=
 =?us-ascii?Q?oCncAwBvsdPFLG3eLcaA/A9kHUsivJhr2mxSQKt+Usyv6nPnn+addibv1LZd?=
 =?us-ascii?Q?IdKY47QMuC9eQN5E3RVXQZdUJvpcLVjsleeoOJtfkj9d5dAnUZY5Q2l2Rqy0?=
 =?us-ascii?Q?T0LZOF5CTEWhQwYbeLOJQzFfDSL8vmAKHwWtFL2Uhm91OKePeEDDKtgtvVqK?=
 =?us-ascii?Q?fjn4hldZmtIIB1craUJSYxIZt02ohA2f+9iBuqv6qi7mcM5JSdf7osFi6t/L?=
 =?us-ascii?Q?tEiPQvipE06gopP67Kw33y1msECtiLUuerJo82y+GmPE2nHXd9mcmHo4N6zl?=
 =?us-ascii?Q?UsOUsgV89IZhCsh0U/3dyThiG3vBXduebpIewP05C89r8y8jV5zL2E6ZX/8O?=
 =?us-ascii?Q?jgHGlOtoiCuhIQ/Gftg8jsjckDKKF9+3OiGBQovivItYwiKrdMnrEXSWggzf?=
 =?us-ascii?Q?J0gQF+q2ubnjbRFp28IBInO0aXcP/Vo6uMyGdoYC7m8vQUvK8SNys1iEQiOR?=
 =?us-ascii?Q?0BkU5wpjb5OWr3tBcyEUZFaZMEXlW49B6jagSCVw7cxtxj0JhTqFegFK5svf?=
 =?us-ascii?Q?XcZYmsQ+/CN80ymjLbrIwG4gweoBXhqnllHVp3xlQwohdEQfLObUiYN/iW3F?=
 =?us-ascii?Q?+AQk70pv7tgaABOHXxVFCGxy+d2FdoUF2rywH6ekKJZ5LDUT4/Do+uLYemD3?=
 =?us-ascii?Q?PW6dKTUsFhpfiuHsPXGwzep1X7JOYQbznwy2vG8Fx5g2N8Xzo4DsLfXIplNS?=
 =?us-ascii?Q?dqVBa7SNKFCZ/jRY3k3rdJ9wl4K7n1IbisxdlPRDhe7HW4mKPKWpwZrltFL4?=
 =?us-ascii?Q?kYkwIO+X61dZt+omkx3EQO0JpTRVM++lYakrqPRxaBUN8+EhSKfq60pUwYE3?=
 =?us-ascii?Q?WTNXdx/TnuclpXr5E/1o55ERTnknhGH0YxLmJtjBSFhhzMrHHUto/G7ZOPZ+?=
 =?us-ascii?Q?3B4tm08FXsWc+m2u1+vJ/m+Z/mXOLgbOv77QaBsCRR2Q1JJxwgfJKfY78uAU?=
 =?us-ascii?Q?SeQuOntRHJ6Fw8YQBOwjiZTtUHPiJWiu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6/OJ6U4hop5d0XFSJqU3s3b8S73OTHYFN1Ikqw9xP+tg+YoPjfYaDb7zqpA8?=
 =?us-ascii?Q?1aa9zKpSjhxZ4YSAAWeCauO3NNyHOaaY8LRd03o3pQ+mPEe7cqbqFWZs4m08?=
 =?us-ascii?Q?HDekNawwFcy+PGLH93nFI6vJRYhPuul0yaYXhLzl7vu81qo2MjTYTfsqRk3q?=
 =?us-ascii?Q?ETAmvJczWyNeV2gABqOSWDIhNHeffB+jytUxN1fcSZ2b6Ws04kIw0xME2vXH?=
 =?us-ascii?Q?s7AG/GVeM6N6M8CDEqOxMj+eHZSclBeCffKVo77wocSANR/dpB22CfXBC8Ut?=
 =?us-ascii?Q?S/MC8H2TD4MVYbt0Aad6b/injXZ/Xl7IaxKlE2I1uT/+CJkWVHEY+XLtq7Rj?=
 =?us-ascii?Q?Ap6VftyrbegCghL1UtxUgj6A80PywupegpbjqsCg5PpvH8z2myfEsAo8nlYD?=
 =?us-ascii?Q?o+Tv1x9X/SBGrY7FD3i7S18PHXXXH1joGbhlyIs5Uo9Ft/KUDydx1MEs11Ic?=
 =?us-ascii?Q?2e+z5a/NSGsak2cmrNZVKDobZN4sGrVhujtGNkmXHLoyBXY3K1sjC5uIdYuW?=
 =?us-ascii?Q?0HMvEPyqDJ5PEeXkOaj7yifVC2mz7MYY86u1V97UlbB7Gp3eJ1eRc6HlQapF?=
 =?us-ascii?Q?Gj6Cak+fm2RK9csr1IRsmvOtTEgIXKHNfntjTKfmO2PjyXZ7jfVb5SjNM7xR?=
 =?us-ascii?Q?fDZqeVJO6ElHCog/s5RVkSiGaWI+StwYMTJMaaEjUbiDuH3mRCQ3vr51xrnW?=
 =?us-ascii?Q?z1T9o1oQjgiwXTXWOTsg0vL8ULOGGSaN4Uq5m9qUToWsmIPKOwEbHo3JTcgL?=
 =?us-ascii?Q?h+kf6o7l9b1AxNoJv86xQ0ZsZogMzQPha6YUoltD21GE33B3nutTD/8PvxMn?=
 =?us-ascii?Q?bdYjukkHGG0lbA8nbNerV3O3+FSJkr0WCxhOJsusHRy/S1DjdlslAoMSTfsp?=
 =?us-ascii?Q?GbONNvz5K249ZuhD4doQsYHcfF1kIT9FPudIZg24mCqFWyK/qpBNJfZ70bgO?=
 =?us-ascii?Q?5GJjnGt+G1MKo7PSXVCqndUZaBGGxAm0yolTEef79YuA3aBbvJ87om8qk+c0?=
 =?us-ascii?Q?s40W9yB6XSyeNKoeQAiic+pNPodycUgISwB7jKrvfYzbmAZsRqjGXEiZezlt?=
 =?us-ascii?Q?qXkznzQ9eS6kRLZDeromqSdap4/rY2NwCCBGrys7gxY7xQuYtIxnXhtEE6M9?=
 =?us-ascii?Q?g2Fsr8kshGXGChLIwhb+UCvdiZoy7q5knuJIk53elWTSjjfuZJCSSlPNOPYS?=
 =?us-ascii?Q?TGJ5STgAz6MP4uutshAVAdA1flbTpi0N33DDkXjeBtzOy/z/VDYMh7RvTEfE?=
 =?us-ascii?Q?nf+p8pDI8QheYSvi8JP/0+2Fy8xufZJcTuZDEK2nqCOrAXPWkatG1tMgkXom?=
 =?us-ascii?Q?qhbjzdUO7Yk7uT15trTZwVCwhzB1fiatc/l3DinVBxk/DvPaSjn9M40DJRWl?=
 =?us-ascii?Q?zrVFzoS1+AeJUna1eP7/GPFZtu1lF7mlWyizJjREaSPk5AqVKxDeO0V6GzV9?=
 =?us-ascii?Q?VoHI8wWm7/cvtX8xEOSUw3fPALAsEs8br2r9VxaH/GHMoTu/+RSEAfNYAWxL?=
 =?us-ascii?Q?OEaU01FNoNUjI1dH4qSMP6+cgZnShu0Dj22WFuUzXcwmdmn69bf4BVUPDsvg?=
 =?us-ascii?Q?YrV8tEe4SpZW0jpMkAPSUPoZx23s9XKP/8AgB8s+?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 747d6e0c-68c5-4c14-9397-08dd5bce9c91
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 10:15:10.6190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A/YqNQSabIpds5BF4wz8pFkDrGNGCfvujfzt474/JzNvqwGzlQ1VSibBg0pS1m1x+jDwImyL8guzhJn/jjOQzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7266

Hi,

this patch series contains the following bugfix and improvements
for the MT9M114 camera driver:

Changelog:

v2 -> v3:
- Dropped PATCH 2 ("media: mt9m114: Add get_mbus_config").
  Based on the comments, this issure won't be fixed in the MT9M114
  driver but in "imx-media-csi.c" in a separate patch.
- Renumbered patches accordingly.
- Fix the incomplete renaming of the DT property from 'pad-slew-rate'
  to 'onnn,slew-rate' in PATCH 1 and 6.
- Fix checkpatch formatting suggestions in PATCH 2 and 6.

v1 -> v2:
- Fix the subjects of the patches
- Dropped PATCH 1 ("Add bypass-pll DT-binding") as it can be automatically
  detected if the PLL should be bypassed.
- Renumbered patches accordingly
- Switch to uint32, add default value and clarify documentation in PATCH 1
- Add 'Fixes' and 'Cc' tags as suggested in PATCH 6

Link to v1 discussion:
https://lore.kernel.org/linux-media/20250226153929.274562-1-mathis.foerst@mt.com/
Link to v2 discussion:
https://lore.kernel.org/linux-media/20250304103647.34235-1-mathis.foerst@mt.com/


Bugfixes:
- Fix a deadlock when using the V4L2 pad-ops get/set_frame_interval

New Features:
- Bypass the internal PLL if EXTCLK matches the configured link_frequency
- Make the slew-rate of the output pads configurable via DT
- Allow to change the cropping configuration and the horizontal/vertical
  flipping while the sensor is in streaming state

Thanks,
Mathis

Mathis Foerst (6):
  media: dt-bindings: mt9m114: Add onnn,slew-rate DT-binding
  media: mt9m114: Bypass PLL if required
  media: mt9m114: Factor out mt9m114_configure_pa
  media: mt9m114: Allow set_selection while streaming
  media: mt9m114: Fix deadlock in get_frame_interval/set_frame_interval
  media: mt9m114: Set pad-slew-rate

 .../bindings/media/i2c/onnn,mt9m114.yaml      |   9 +
 drivers/media/i2c/mt9m114.c                   | 172 ++++++++++++------
 2 files changed, 130 insertions(+), 51 deletions(-)

-- 
2.34.1


