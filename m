Return-Path: <linux-media+bounces-27395-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EC8A4C6C1
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:22:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04420188DA3B
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C936B2417E4;
	Mon,  3 Mar 2025 16:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="E5F4Pbg5"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011010.outbound.protection.outlook.com [52.101.125.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB441DA31D;
	Mon,  3 Mar 2025 16:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018276; cv=fail; b=qedfikaAZcz6gPIykQWTD4//winKvw/YHhTgotWPjN4kDwQbDf+5ziqc4dbuKL/wmrxiwdUDazczbLp8qA+6c3GNRBHqBHreeQO8LcJ3wJ/rynHAb/iboXlmZIBX2lTnVP552+3CwkdHcBuxOUhUXPGYYmXkJOqj9dI4NyhNf3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018276; c=relaxed/simple;
	bh=UKg1zHxKodbLnM5Z092xPJYbiyi9RVS9v5F4Nm3UE9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H2IM5sKpu7kAwrVvEnrG7NljmFSGnBtat+l2ZhSkmnAktTovyVR+hzwVZNbrkwuziCNZHwwZPacgtwOQ7LYv4ry0yowxEMNU3sE+M5IVd/2ZiUjrKAOUkkGq6Y0AEIxeXz7BI1zdRqqss6AGo2YTW2F7SW5ySPQk4TTi10Ikbj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=E5F4Pbg5; arc=fail smtp.client-ip=52.101.125.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bnvmrNzFXwhacQRCaG94Tf9WzZ/9LDeGu/P4zt52HOJWFNX+LtUwSqk3MvzYJ8WCShd4DiKbkqOCOwwiG+oN3HPNCIKYZB8NEAM9eGAoqJG9kH14XRL6I1aHDstf/gXtjlJRZgyOzvxkSdB8op+7bzavCUzLLpj1uJaFQTv4/rYqaulhrQS0exLk4cx1Yti+r/4wogJnNy8ie9hpzAIxvg9yAynhR2VojtHQZp5ZHI6hqksfazbO5ex0C/85Sww+8JLyt4WiJkyF0uj73ApcjmgUGkltu70QY1wEs+yqSThQ6wo9WNiS/LWmm1dWHxjcnmvvGI0u/1hWs6NQqjkMQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1pltHDZfhSIrend9oly11YbV+aY6f95m/p4zfVuq1c=;
 b=JygZsew6N8PnCdt8bG1mEWqUFeuwoQvHFc/k+WU9slZ9CcKdSunXOQ3qbZ2BiqMVy63QI2rbPi0FJgxOcHzDuOWT49ZPlKYYz0BOLqG0keZbMesAICVu8oh9kgAmzcwk7g6D658k0VCnwk2JNlIU2g/wPkS36B3bhc4MaQDQHJBPcSXz8Aef7lsYoAFxg/wBzlMRVQarHqROjthK0NWZdjphyACo19SjEL7glVeNNqy6n1A6HzfHEMisD6ch7B1yTqVKwkP/F3wi9Y2n/avBf3Bt1s1pG+gBxcQV5F9Pl91Xrw10cEeQkeazWrgB+M8/tnprMfiH+VFkdbkS052n1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1pltHDZfhSIrend9oly11YbV+aY6f95m/p4zfVuq1c=;
 b=E5F4Pbg5urNEES/ClpuIzKvktd/0muHcekN5glNrciNaqrHbsChJUCrwdDgUpWFtqXnOpCYKBMvW8fB261Zahkxd5IN8lSCGGu6xxXEJ1X4w4OkcDYmQvIWrmZTgATUijGe3fbgQeEvYhj/pjHBYZwIK9WMJbiHFrKbIqUp+cM4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TY1PR01MB10752.jpnprd01.prod.outlook.com (2603:1096:400:321::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 16:11:11 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 16:11:11 +0000
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
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 14/17] media: rzg2l-cru: Add IRQ handler to OF data
Date: Mon,  3 Mar 2025 17:07:54 +0100
Message-ID: <20250303160834.3493507-15-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303160834.3493507-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250303160834.3493507-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::6) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TY1PR01MB10752:EE_
X-MS-Office365-Filtering-Correlation-Id: 78642434-beea-41d9-7d27-08dd5a6e03a9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YGqiBjc1WX3RJHsbM9jTqdDQQWgJEL7qhXDR2qae0bi1gMZwyEUoiSRnWWpN?=
 =?us-ascii?Q?2lz7illIaT7eQonTszyVnXu5l26rBhZpslyYqvP2WeqADkVFngJGuNKQr1zw?=
 =?us-ascii?Q?jNUuN4xH/9HX9Yz6gm8nM4seDQqog9IplI92joeOOWufK8VDDVu7nD48D6Yh?=
 =?us-ascii?Q?3UVjy3IAL9/WgHuTSLpd8biwV0C0lJA4jCMYR+jhvZoohJ9HSdPe6E4Hlny7?=
 =?us-ascii?Q?npBleiELs+YywFTglf1r/h3I73Oln2nuaoREMhGbpH+h4ST7bAMuGQi0wURQ?=
 =?us-ascii?Q?UEcnFTM/EUi8oVCQ3TL6SnDrCL7WPXh/gpNS4vj5sWeE5mdmKsA0lPd036WL?=
 =?us-ascii?Q?wf/xeSIDHiA2b6IM0+sGapbhCuntL4N+0Tj+bqqT2ep2MaCaSkyQPJ+GEKDx?=
 =?us-ascii?Q?xH61xYpbtGOjMVuh6ZxNd/ZqOxeq15XNInmuM1Ou++WhkGY3yCX7NY0fpvKJ?=
 =?us-ascii?Q?9u/6IHc4i3FVrDDF/bRmpKX18cqxXWD1Y4miq8LRgbPLekUUy7r/yrS3C1wt?=
 =?us-ascii?Q?pX/7jM1e1Y3YnDOW8MKG+ZGW7bezjOfwZbCizCfbqdI8urHR5Vq5pBA7SDH1?=
 =?us-ascii?Q?1Y/j463mFZdI5o/pJ5ZMWFPIFmGLnvn1CAU+eEujOOgRxdA0hwHqeZu14wN5?=
 =?us-ascii?Q?NLOFJNHCbyCQRwN5m1tolcp/yrjrc8d3wLe+neBepGfAGOae9TMYIU/d6fdu?=
 =?us-ascii?Q?MjAAIid9SP3YjzbACf5NinK/mCwO/eAt9AdKiD4i3rPJF8V5vBLiJxCzYOcS?=
 =?us-ascii?Q?bmDvdS0kraVHvVYkhLRW4T6TCLntsPSmorJ74qmPHt96ZI1G9tBkUSEGw7wT?=
 =?us-ascii?Q?xVS5gHShkoIm5eyx4IQOq88PjQIRqjeeinMqtzfYTaLZMIWZ7Gl5CuTPwtk0?=
 =?us-ascii?Q?BxK3zQmh7TLpx08hYRYmWBvgfywzY7ZlYpcmQk6GMULSo6jdU1DjFkG4vc+a?=
 =?us-ascii?Q?UV2qDqv6MDNKba14+7jYKzhPOz43MsdgOWf6XL11q9/1giKgmgQiYo4xzhLn?=
 =?us-ascii?Q?IDUXSF/wxdQHoEZRWgpfu2rslwgRmkISSSDDGO1BMa7veUHAMoVHV4YC/FQn?=
 =?us-ascii?Q?65LY/HfHcbt5kDuD8tSa6wt3bzro+oyOujp3cNkwMaMLM78V72rTtBsdppPU?=
 =?us-ascii?Q?4rFful1c5NM06XJn9Zrz1nzC4ZsvLLEuXkImOTYk0wrGTXkchtN9Yt0I2IxQ?=
 =?us-ascii?Q?Irkdq2lqZ/M2G2SU3H7mrzXZ4HAfqGVm23WhbnjeQYVz5luM9I5u+vAXZi46?=
 =?us-ascii?Q?WXYbafVcJbrEalIyFKr7GrAUmWXq/UjcRqmQ2NoNu0DWzgqajzG7mf5OpuO9?=
 =?us-ascii?Q?NHs2yHb+DWk87eAW8bftM446LEHHgfcdfr3gENGv9/PY3caIEnJMJ6xKXRK0?=
 =?us-ascii?Q?R6vA7sKwf83MvwqEugzh3i2GrCautxbsWokfUVxIMPD8qEaCGqCgzgphP4+N?=
 =?us-ascii?Q?pxs6Cef8TkuePkX2OCqZDGaOmDFevNq1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qAX3BqI3OqcX1gY/SPZwpVtHw3UqhSzROcSQHR5cr6K4dYZm8hB0giSQyOh3?=
 =?us-ascii?Q?JMD6w0iXmIOurZ0BIytbkJAgI3qpcnaZ517+S76adELDZRZdHqZZjJxmykDt?=
 =?us-ascii?Q?U3U4Co7p8q8aYoIN5H/pglKaEhJ9ePZETSkOqC/AlNs+XXW/b906oeC7BuHM?=
 =?us-ascii?Q?H8f3N37KDNGHF2fb4pqAidF8Eq/0nCsVYwYhSROv+pz7zFPZPhEVJ79VUv0D?=
 =?us-ascii?Q?70MN7RMhgw88Br3WiDLUCqpfp4ZhTxL11Pv0FzZrWmyi0e2CINOuPKYGtcHW?=
 =?us-ascii?Q?bI9URaS4mV+sw1KM4AsBJSURA0HkNdi54d0eMinznhOybh6UllCKf+yu7DLy?=
 =?us-ascii?Q?8jgouzCOjjQD3pSF/hU3Ay7zeTbH2+d7/1EhzxUt8Qo2fXDJQvSKzY2aavDC?=
 =?us-ascii?Q?01e9RCM/dmwhiub5Yyye/YbLvS+WuVh4TCX7z6GV6Nw7mb+3Dmt/b/suytPM?=
 =?us-ascii?Q?FNj3eInFwnuQPkyFLKR0QXDJC9TxuZQEW7gCk/08hboaMFhm3DwiUB9Y6912?=
 =?us-ascii?Q?jnc3WW2R4KKvptx3Ye8i+MpoMkdE7KMPlLzsZZ6E/NbtW+BXUlXqOrvKzNki?=
 =?us-ascii?Q?5gqW+h2Hl4NGoFrfpekKuGdqoJCeJ8iSqRCHVOUQbeCC8ottvGNSqCY2sf6S?=
 =?us-ascii?Q?/z8UB5vZ18CRU1+4bYKd4+ZHMca/92hH4wKvMcBFanv17OvtVpzLDNAWO92y?=
 =?us-ascii?Q?z4TEG7J3Q2HNO4JyYY5HFjnmVdYZU/j9wd8y9A61Qf9jqW+oi1ngn9bBkO74?=
 =?us-ascii?Q?QvPkh+BwuGMBFolFqXhdZLo33yDSkZQNTWWYXZaPrufNGGbEYQtqmdGyqwDJ?=
 =?us-ascii?Q?PvhK0/8vButa950BvQtnMROrEGbs/2GAkzxZZRh39rqmf3454zlhBpJewOcs?=
 =?us-ascii?Q?zNAv2/BPUYxrrWcW21xPo66YAfyHT6noo8/+bNNf+aM4q+nOQSja2j104G8+?=
 =?us-ascii?Q?yklSQLnniPjPwG1L1Mi5aIYbb03Reqx8OJjz7PlvwKSKQbdh7u0U/jXPgDS/?=
 =?us-ascii?Q?5OdxsfN2W2Fc2dJ/Dhgi5Oh9e6BGS0hTbgOnD2bFqbbnfvXGKdtkLR5evUgJ?=
 =?us-ascii?Q?Tssjf+t6rHmpmFwVhmKwmaeXd+18vBKKMOBoPHa8ZDcCqs23zivPd69FuGf7?=
 =?us-ascii?Q?c6eaX+88TP0CDW0D+a8oJwZUTayQfyaNaKfKGS9Y4TE5HENxBVuTOKsHwo7j?=
 =?us-ascii?Q?3deM9cfm7IczRPQUIokbcelRNG3EJligLCVGgYWJs8ycRcoO/Wj4IzjVwxHi?=
 =?us-ascii?Q?fRM9EGu1SAfQSLCwL2oOD5LvD36mQvZvYptd0EU5mvoByxneE8TSqZerE9wX?=
 =?us-ascii?Q?O1ZLu8q5xUKUE/wwcK5QF1ajtfAbKO3Szlalr1WmHa34/06PLiInxGdTrLVB?=
 =?us-ascii?Q?odFKLv8WTsJZ3tlZ+L46ecD9LVsbwvLkOuTWdAnsBqeVknSrNEJvMfmJhG/+?=
 =?us-ascii?Q?RAISJhmbQpvz1V7qTayHwAD38ulDmHzLJeBVBkXa9mqMyjDaYFUcBfyTP5e4?=
 =?us-ascii?Q?tR4aGfdjM6I9JmjfsqPbiI41nPWzb9K7J4PfXoOZgFvAVkH/UwnHJbFgIYfQ?=
 =?us-ascii?Q?IDXoHtMcRmxI+5YJx6DgOrWhg8lHsmNLgnUwieEo978LMaEelUF+grT7kHgG?=
 =?us-ascii?Q?k4oaueeg+1PlpHMRUlKF2uQ=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78642434-beea-41d9-7d27-08dd5a6e03a9
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 16:11:11.1803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xDIiZASgxaE6il4YH3FfAIFLMuuVeG5Gvo6af/EuCxqEEMDJOLoBkASOmWgwm+CQWyzwrg2aV0vySK2qlzfSPHG7G5qqjkW7NnUlymg3XA+dCEZfgjsJgzNeXWIcjejz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10752

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add `irq_handler` to the `rzg2l_cru_info` structure and pass it as part of
the OF data. This prepares for supporting RZ/G3E and RZ/V2H(P) SoCs, which
require a different IRQ handler. Update the IRQ request code to use the
handler from the OF data.

Add `enable_interrupts` and `disable_interrupts` function pointers to the
`rzg2l_cru_info` structure and pass them as part of the OF data. This
prepares for supporting RZ/G3E and RZ/V2H(P) SoCs, which require different
interrupt configurations.

Implement `rzg2l_cru_enable_interrupts()` and
`rzg2l_cru_disable_interrupts()` functions and update the code to use them
instead of directly writing to interrupt registers.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Squashed patch 15 and 14
 - Collected tag

 .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  5 ++++-
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  8 ++++++++
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 19 ++++++++++++++-----
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 7e94ae803967..302f792cb415 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -278,7 +278,7 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	ret = devm_request_irq(dev, irq, rzg2l_cru_irq, 0,
+	ret = devm_request_irq(dev, irq, cru->info->irq_handler, 0,
 			       KBUILD_MODNAME, cru);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to request irq\n");
@@ -359,6 +359,9 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
 	.max_height = 4095,
 	.image_conv = ICnMC,
 	.regs = rzg2l_cru_regs,
+	.irq_handler = rzg2l_cru_irq,
+	.enable_interrupts = rzg2l_cru_enable_interrupts,
+	.disable_interrupts = rzg2l_cru_disable_interrupts,
 };
 
 static const struct of_device_id rzg2l_cru_of_id_table[] = {
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index ca156772b949..3f694044d8cd 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -34,6 +34,8 @@ enum rzg2l_csi2_pads {
 	RZG2L_CRU_IP_SOURCE,
 };
 
+struct rzg2l_cru_dev;
+
 /**
  * enum rzg2l_cru_dma_state - DMA states
  * @RZG2L_CRU_DMA_STOPPED:   No operation in progress
@@ -83,6 +85,9 @@ struct rzg2l_cru_info {
 	unsigned int max_height;
 	u16 image_conv;
 	const u16 *regs;
+	irqreturn_t (*irq_handler)(int irq, void *data);
+	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
+	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
 };
 
 /**
@@ -177,4 +182,7 @@ const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code);
 const struct rzg2l_cru_ip_format *rzg2l_cru_ip_format_to_fmt(u32 format);
 const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
 
+void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
+void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
+
 #endif
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 5033c8d98639..8995aa254c17 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -300,8 +300,7 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
 	spin_lock_irqsave(&cru->qlock, flags);
 
 	/* Disable and clear the interrupt */
-	rzg2l_cru_write(cru, CRUnIE, 0);
-	rzg2l_cru_write(cru, CRUnINTS, 0x001F0F0F);
+	cru->info->disable_interrupts(cru);
 
 	/* Stop the operation of image conversion */
 	rzg2l_cru_write(cru, ICnEN, 0);
@@ -393,6 +392,17 @@ static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
 	return fd.entry[0].bus.csi2.vc;
 }
 
+void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru)
+{
+	rzg2l_cru_write(cru, CRUnIE, CRUnIE_EFE);
+}
+
+void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru)
+{
+	rzg2l_cru_write(cru, CRUnIE, 0);
+	rzg2l_cru_write(cru, CRUnINTS, 0x001f000f);
+}
+
 int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 {
 	struct v4l2_mbus_framefmt *fmt = rzg2l_cru_ip_get_src_fmt(cru);
@@ -414,8 +424,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	rzg2l_cru_write(cru, CRUnRST, CRUnRST_VRESETN);
 
 	/* Disable and clear the interrupt before using */
-	rzg2l_cru_write(cru, CRUnIE, 0);
-	rzg2l_cru_write(cru, CRUnINTS, 0x001f000f);
+	cru->info->disable_interrupts(cru);
 
 	/* Initialize the AXI master */
 	rzg2l_cru_initialize_axi(cru);
@@ -428,7 +437,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	}
 
 	/* Enable interrupt */
-	rzg2l_cru_write(cru, CRUnIE, CRUnIE_EFE);
+	cru->info->enable_interrupts(cru);
 
 	/* Enable image processing reception */
 	rzg2l_cru_write(cru, ICnEN, ICnEN_ICEN);
-- 
2.43.0


