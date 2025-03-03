Return-Path: <linux-media+bounces-27399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC10A4C6D1
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:23:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D108818986FD
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 790C2248176;
	Mon,  3 Mar 2025 16:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="p6zBsV9B"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010052.outbound.protection.outlook.com [52.101.229.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2102459FF;
	Mon,  3 Mar 2025 16:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018309; cv=fail; b=JTuaVKD/kDOewIqB1Kqe27glokLfNt4ZJRNFkahdG60Xor+q07umMegvdjay0tempGE6rrNWJuLUjHcj0NAi8n2Lov5EKrF7Za7cbAUm+zb2V+GZNYH+WYpVH2vGFvOWDHHLg9lC6CTSprzhq1Twt4DBx/mVbizYuLStLWgu95I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018309; c=relaxed/simple;
	bh=CaS/CDnLD7o86AmxmwND7alaNpZdq5pdgCZzUQcGeeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZMmjQX6QbJLrJg+9qEmp9OAh5VgOOyudJjJ5nGAPyre5Gc3pwWwhG5FCQI/6n2cffTxYSQroVyg2dD84g6JyHBltmaDSe7nzOJFE7SDl60H1TA4y1QG/URximTThtAiKjdWFI3S4HmLSpPEd30ut1jyR3mwhJP9qyu3GJL7h+Pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=p6zBsV9B; arc=fail smtp.client-ip=52.101.229.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGBwFsifmA8MfNCQ2u9sgrCb6ahkUO0I4itlCukquWh1CJ0OLsDdD4XiCNuDm6MrFRfmk+Hp+wwGg1x/1T/S1TfRCh4yZDiqX1ceewlqQ20hFWJ1hoEjcW2OQ0j+nqJdxzz3pv/FUKXL9pFu9Z8CEjjRcSQ/ChbexMzm/OWx55knjuy60mNwEYjAWAS8O4SYDUvMd0XSD1VegGyRkltkbpNgyJGnXMTbIGcORI/SnbceXS/MFdO3SE23ZRKaTWNG1LSjvyCHtnGta0bvYHWsxZVJx34rdS/6I/jQNlWvUIL5YNsmWpCBhIKXzwkANppIbrJSM+0xiL/c05HiF+F8Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sw16YKN4G2mEsAChfKpY5vdhRPoJgzowPfjttkP/4Dw=;
 b=j4Zi1ctphOUAClDJ21xSu8x5ZdYEpPIZwWzomWMifhIrEnfaTNOdzr9QeksU+dT5vHDeDywcXi8RpqZUbyB7scwh5n4IzPwokIvpeP25RaWTvK638QBpKNBTqzuqoCFirD0uVt8hMqQOrj4zkuOyrAvn/0ik20nxRsYFOM7ZR05aaGSufqsvMz4Oy2b4xfttpLlQCwKQhDHpKk0jx8w1270ttLfLnAK+gzc9FG8nv29FR3cc2nhNk596iyJAW2PQnI5u3b40Duj9fpsSThe+/avvzyXTXV9vegP0n1Tzyoxmi2267xXJWerp2lSbXZAe3RWUj5qCjKZCb09pwQiVTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sw16YKN4G2mEsAChfKpY5vdhRPoJgzowPfjttkP/4Dw=;
 b=p6zBsV9B748eNub7tqoIqA3KnqbWdDbIfgGOE6g5mM7Usz1fv1NiV0YmH8jXG4JmLe4jnjBp7fMsAXmUtqR34gxI5I8R2tDFEWk0VW+fPS1nfHFQV2/V1FHOiEViJGVJAwRbdsiiAt0e/R+0X/65TwfmVIvzGS4xHyPq+LkGi4c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TY1PR01MB10752.jpnprd01.prod.outlook.com (2603:1096:400:321::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 16:11:44 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 16:11:44 +0000
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
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 17/17] media: rzg2l-cru: Add support for RZ/G3E SoC
Date: Mon,  3 Mar 2025 17:07:57 +0100
Message-ID: <20250303160834.3493507-18-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 29d5da76-25e4-48ac-0354-08dd5a6e17b0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x9VpFV5mkmTzrlDEmJY8ZsIq6F6MuxXjdR16AVLpHaHfBY8J0Luy5qrP7yls?=
 =?us-ascii?Q?p2un2qxbjLDEJAmft5c95cfkrJG6fDPcfMMwYKSV0Dhx4m3M9brDDexNud6x?=
 =?us-ascii?Q?YH7XzcGmCGlw8OzFnGz/IF7P+bBhMOe+yng3IHTuvBlkAqlYsq97lxzVhw7R?=
 =?us-ascii?Q?EW2ZH9eM+fkQuSvs7KSjogC84SJS4/++TWAmKTUeN1+dcx3LYzZqyRo7qF01?=
 =?us-ascii?Q?ASOQW9XB99GvBKmfvekyRZqUqOqCjbqU0oplRCRTBOGhyU4DiU9zem6//A7T?=
 =?us-ascii?Q?lTu2RibyWl31kSS22PKNm617BNyprkkNi3xEXDNI9iWNu065KL9RvRB0vB5p?=
 =?us-ascii?Q?jBp2NUp/HJ6YbtT1ynNgRUnIVuqjW2msBaEXi/N/kzk7LNL24q7hhZZYMQcN?=
 =?us-ascii?Q?JkvYzaHLfhnhvld8DTWty918enw+tKMey+tbAtpAuupUCcpCufpYl+O0/W2O?=
 =?us-ascii?Q?u0ZnQoyFre4JcAv66e2yHLlYM+O1zFz9A1LXmBt/uU1c5QYaUSnjlnZwFXdD?=
 =?us-ascii?Q?GvfubOpyGqopY42JEt0jfH4/kNpIwyQuYDoeOIA2KL7+iYvDxe/iIbbtozly?=
 =?us-ascii?Q?Kc1NVekT6crpIVk1ZTE1xY5XsAx8qhlBepo+UvD0nTgAWiOzGrMAee7EWLKy?=
 =?us-ascii?Q?HJCNk7/rckbCTEqVMZOkrR1eut37vDMUcH/ny5CFm9jHbd7nmTj/cenLb2Zd?=
 =?us-ascii?Q?mLdb1Dc/ZaGzlqw1B5/METvRNmeMZipETYufuPTkWDpwKqj/1p/z4yDgbdav?=
 =?us-ascii?Q?AJZMRCI7I0VHaG/AtJDKWtrA7LaJTmVRWLI3N/BOhoAgcWr+miqO502+iHEt?=
 =?us-ascii?Q?j0yMdJC8n1Zzj7kn/jUqO5tHscCQwUYD2KD7XESsSpjsZhrwOIuYh1pmyJ3w?=
 =?us-ascii?Q?S8estBgbCUloTOP4xsRqEjiLii/Ah8Db8uo2uj7zHcZyZObdWz/YcOk8roKI?=
 =?us-ascii?Q?ovbslJrki6MO4ZU2ZE+HpcioxbsFle8xVdAVleLu0/Vuy+2afbo+Qxvoful0?=
 =?us-ascii?Q?5fIz0Q/bQ1x8tvDNGBUU66nWRBl1K6zqyFeeeSkK3ezCBIDOJPZiOKYcldFa?=
 =?us-ascii?Q?t9B36IuiThah4XZiFVTytDFW7jk0g+6o/fbKJOHuL1+UsppHSOtuLoz793G5?=
 =?us-ascii?Q?iu3jNfysM77jFILd/NEndSICsTK0KhVxBB3lUJsalU9Tob0KyJY9Uq/TKxo/?=
 =?us-ascii?Q?2iK5FPMr3A+2dIP5ehrSPECIGlXECMK51x1yMzWA71f4miKk98wgTUG1Hvso?=
 =?us-ascii?Q?QMOcBuJxJ9lkggsquWM+Fg5x5qxg75+0St3DNdCmFozP8+fgLLn7XrJwhEr8?=
 =?us-ascii?Q?yUCRwREyVPnMYSM3zNDAV9AQLEt5UJdnUucN86SVWLIWYrE4Svlzn0wcFa2V?=
 =?us-ascii?Q?QcWEyJmKi1FYLPEWSEieOjDQWCh9fY+mgfxX7i0sWNaf8an3vfXeHvu8P4bI?=
 =?us-ascii?Q?a/zqM+/LvpdMDZCkjOnEw4pL4C/yeYnC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FY4RVsCzJYAUmEZjoywbNLwA3gX3VD69zEFCDoRq2dODzTqywOHNkBEqKupZ?=
 =?us-ascii?Q?oSUWWuYHlzSPMMnL58GX+HS1z6rSt8GCnMWVeqmsrkaSCyieYP5/c1V/TeRw?=
 =?us-ascii?Q?UEL3fnJP8iDjxD88mhUtOETfbLD3pkwQNYofR/1tCc1Z6tCAUWH7jxloIoI1?=
 =?us-ascii?Q?MakepF+sEfeEmjsoml9x/w68NxnODGvdc5xbtRyovmkRbENwKIUYeaoFcZGb?=
 =?us-ascii?Q?oMG3kKwlK7eFBRUurMBXl9pZzq4Ql/83++vsR0tl/JOzJZdCqKqJCMSJro1b?=
 =?us-ascii?Q?kgxLXMvOEXlBujYqVQefgLXOcq5Ckj8fZ7fEQCEOosLJcyUX63bDu1HZrFIW?=
 =?us-ascii?Q?E9Xub2vIOmU60rhzUD4Bxm5eEF2WHH9sZzqCBZ1fDsEFf/8r58jWvlH14lml?=
 =?us-ascii?Q?ad1l2txfDyHUO7XK9q+V+5V7DNjq78lHS8sIBSGNaTy77Kuh5E45Uy06PNP/?=
 =?us-ascii?Q?dqPerRwrpsVq5qAugDLVPJWXuUQKJBP90yXgk01Za6cViUgvnL9bpyoaXYCJ?=
 =?us-ascii?Q?Qusbv7s1DHaPwhzMXnY3qXAT/qM/8exz+V1A02k+jXEFyhHVimgjT+HZCsXf?=
 =?us-ascii?Q?sowjHoPGgY3XxIhbg9woEYIl///N2ZRsGED9dWu78r/nH78xtZYyW8cygIFs?=
 =?us-ascii?Q?AO1NxmK2Yw5WJ41plq2jKcZNFr6Hac5p7+LWkCGkJEQJAftt+EYsrtO9YRsM?=
 =?us-ascii?Q?6mGZoV9/40wIGaqryXI13ra6C/QmeCVM/0FwqOmLQll7Rj43xSLZ1HoSjIYQ?=
 =?us-ascii?Q?bc4Jgx5O/Qjj0Z1BPc6i1I1OAwjPnEJgx7c9q2dEipz/s+SdvIfImGYvg6u/?=
 =?us-ascii?Q?BeQILWVK8Vd/RA6DgmuVBpKG5GGU0hRGGEvTPfCF8tDeGeWOPR2hCGA30GNF?=
 =?us-ascii?Q?M+Qe2uIV/iWrzvbyi7iifMv+p/4u5t1A3X6t3iBbMieZucxgQbxI1f7d7jbt?=
 =?us-ascii?Q?JSqC26/UpXSZiTkIeNComQOV7b1T+h1JfHjXxy7zJvOaBkjxE2nPu/RRFotD?=
 =?us-ascii?Q?ahXPyU7uL1cB9fykwF3sDasv+JiYAuSlAR9z1zc4FBZ/9x+xtHeYG4TFE1dj?=
 =?us-ascii?Q?ZeV8/b0nARXGMccXQw5sUw49QRAVEnYE+3VOl56vvM6AO0W3A1c9jEnqK7Di?=
 =?us-ascii?Q?8ztjd+z87Imwnygazyo++xE+3md/4LCqewircrhQNZPhPEdpArn+7tpJN0Qo?=
 =?us-ascii?Q?ChN2jGXNfbX5olSwPZJ6hB+rmg4PqddWSW+L3te7Nn0oIdpcAITP30VIHado?=
 =?us-ascii?Q?V20JYOJUto35NTdxREAAh+/Udfw99aJ9SBvaute8KeWml+DQaM28upuu0rZG?=
 =?us-ascii?Q?pctzYc1HJ7UU4O2Pv6VjAgNlfSOjJcrhBjn8fh/yaGJ5xdASFM2rkm2cWknI?=
 =?us-ascii?Q?/AecIFDklZt3ayMLRavvBhxqxduuvUQHjpCdZgprDROxewyFBqONZYowliG6?=
 =?us-ascii?Q?soxAaOU+MMdCmUO6QI2mN5lqb0f6WUhEruDVhxGHCCzLiu5r2W9eEz9vrrqo?=
 =?us-ascii?Q?6tfFWGeRuDkiu5zZbnqkINypqklLZDNMmLbVnCspVNyV0w8enE3FTWIfug2m?=
 =?us-ascii?Q?R8WtuvIaz7aNYWGTqioMLrhDbkD48q7yRlc8t2i0yPuu3mJMutTeJkgsTo7p?=
 =?us-ascii?Q?yeEHZjtbEg74seMNnL06FSg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d5da76-25e4-48ac-0354-08dd5a6e17b0
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 16:11:44.8160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z1GFlAMKjZ43oCf5CUxxBBvWn7O7rvXX5dYWX5WqeMIxlSOyEVssVpUr58JRsuDkSu7sYLu62TRsnPpAuCAsfyaq9C/n80nN2lEfscwqA1w03XhkPg3iuHUGVDkQ6gi+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10752

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The CRU block on the Renesas RZ/G3E SoC is similar to the one found on
the Renesas RZ/G2L SoC, with the following differences:

- Additional registers rzg3e_cru_regs.
- A different irq handler rzg3e_cru_irq.
- A different rzg3e_cru_csi2_setup.
- A different max input width.
- Additional stride register.

Introduce rzg3e_cru_info struct to handle differences between RZ/G2L
and RZ/G3E and related RZ/G3E functions:

 - rzg3e_cru_enable_interrupts()
 - rzg3e_cru_enable_interrupts()
 - rz3e_fifo_empty()
 - rzg3e_cru_csi2_setup()
 - rzg3e_cru_get_current_slot()

Add then support for the RZ/G3E SoC CRU block with the new compatible
string "renesas,r9a09g047-cru".

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Use dma_addr_t with buf_addr directly instead of splitting that into
   cru->mem_banks (high and low address) as suggested by LPinchart.
 - Moved and improved stride adjustment into rzg2l_cru_format_align()
   as suggested by LPinchart.
 - Use csi_vc into rzg3e_cru_csi2_setup() instead of cru->svc_channel as
   suggested by LPinchart
 - Added has_stride field to handle soc differences as suggested by LPinchart.

Changes since v3:
 - Fixed kernel test robot warnings from rzg3e_cru_get_current_slot() and
   rzg3e_cru_irq()

 .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  62 +++++++
 .../renesas/rzg2l-cru/rzg2l-cru-regs.h        |  25 +++
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  13 ++
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 171 +++++++++++++++++-
 4 files changed, 270 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 3ae0cd83af16..1356be14eda8 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -290,6 +290,12 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 		return ret;
 
 	cru->num_buf = RZG2L_CRU_HW_BUFFER_DEFAULT;
+	cru->buf_addr = devm_kmalloc_array(dev, cru->num_buf,
+					   sizeof(dma_addr_t), GFP_KERNEL);
+	if (!cru->buf_addr)
+		return dev_err_probe(dev, -ENOMEM,
+				     "Failed to init buf addr\n");
+
 	pm_suspend_ignore_children(dev, true);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
@@ -321,6 +327,58 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
 	rzg2l_cru_dma_unregister(cru);
 }
 
+static const u16 rzg3e_cru_regs[] = {
+	[CRUnCTRL] = 0x0,
+	[CRUnIE] = 0x4,
+	[CRUnIE2] = 0x8,
+	[CRUnINTS] = 0xc,
+	[CRUnINTS2] = 0x10,
+	[CRUnRST] = 0x18,
+	[AMnMB1ADDRL] = 0x40,
+	[AMnMB1ADDRH] = 0x44,
+	[AMnMB2ADDRL] = 0x48,
+	[AMnMB2ADDRH] = 0x4c,
+	[AMnMB3ADDRL] = 0x50,
+	[AMnMB3ADDRH] = 0x54,
+	[AMnMB4ADDRL] = 0x58,
+	[AMnMB4ADDRH] = 0x5c,
+	[AMnMB5ADDRL] = 0x60,
+	[AMnMB5ADDRH] = 0x64,
+	[AMnMB6ADDRL] = 0x68,
+	[AMnMB6ADDRH] = 0x6c,
+	[AMnMB7ADDRL] = 0x70,
+	[AMnMB7ADDRH] = 0x74,
+	[AMnMB8ADDRL] = 0x78,
+	[AMnMB8ADDRH] = 0x7c,
+	[AMnMBVALID] = 0x88,
+	[AMnMADRSL] = 0x8c,
+	[AMnMADRSH] = 0x90,
+	[AMnAXIATTR] = 0xec,
+	[AMnFIFOPNTR] = 0xf8,
+	[AMnAXISTP] = 0x110,
+	[AMnAXISTPACK] = 0x114,
+	[AMnIS] = 0x128,
+	[ICnEN] = 0x1f0,
+	[ICnSVCNUM] = 0x1f8,
+	[ICnSVC] = 0x1fc,
+	[ICnIPMC_C0] = 0x200,
+	[ICnMS] = 0x2d8,
+	[ICnDMR] = 0x304,
+};
+
+static const struct rzg2l_cru_info rzg3e_cru_info = {
+	.max_width = 4095,
+	.max_height = 4095,
+	.image_conv = ICnIPMC_C0,
+	.has_stride = true,
+	.regs = rzg3e_cru_regs,
+	.irq_handler = rzg3e_cru_irq,
+	.enable_interrupts = rzg3e_cru_enable_interrupts,
+	.disable_interrupts = rzg3e_cru_disable_interrupts,
+	.fifo_empty = rz3e_fifo_empty,
+	.csi_setup = rzg3e_cru_csi2_setup,
+};
+
 static const u16 rzg2l_cru_regs[] = {
 	[CRUnCTRL] = 0x0,
 	[CRUnIE] = 0x4,
@@ -367,6 +425,10 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
 };
 
 static const struct of_device_id rzg2l_cru_of_id_table[] = {
+	{
+		.compatible = "renesas,r9a09g047-cru",
+		.data = &rzg3e_cru_info,
+	},
 	{
 		.compatible = "renesas,rzg2l-cru",
 		.data = &rzgl2_cru_info,
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
index 86c320286246..52324b076674 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
@@ -14,8 +14,13 @@
 
 #define CRUnIE_EFE			BIT(17)
 
+#define CRUnIE2_FSxE(x)			BIT(((x) * 3))
+#define CRUnIE2_FExE(x)			BIT(((x) * 3) + 1)
+
 #define CRUnINTS_SFS			BIT(16)
 
+#define CRUnINTS2_FSxS(x)		BIT(((x) * 3))
+
 #define CRUnRST_VRESETN			BIT(0)
 
 /* Memory Bank Base Address (Lower) Register for CRU Image Data */
@@ -32,7 +37,14 @@
 #define AMnAXIATTR_AXILEN		(0xf)
 
 #define AMnFIFOPNTR_FIFOWPNTR		GENMASK(7, 0)
+#define AMnFIFOPNTR_FIFOWPNTR_B0	AMnFIFOPNTR_FIFOWPNTR
+#define AMnFIFOPNTR_FIFOWPNTR_B1	GENMASK(15, 8)
 #define AMnFIFOPNTR_FIFORPNTR_Y		GENMASK(23, 16)
+#define AMnFIFOPNTR_FIFORPNTR_B0	AMnFIFOPNTR_FIFORPNTR_Y
+#define AMnFIFOPNTR_FIFORPNTR_B1	GENMASK(31, 24)
+
+#define AMnIS_IS_MASK			GENMASK(14, 7)
+#define AMnIS_IS(x)			((x) << 7)
 
 #define AMnAXISTP_AXI_STOP		BIT(0)
 
@@ -40,6 +52,11 @@
 
 #define ICnEN_ICEN			BIT(0)
 
+#define ICnSVC_SVC0(x)			(x)
+#define ICnSVC_SVC1(x)			((x) << 4)
+#define ICnSVC_SVC2(x)			((x) << 8)
+#define ICnSVC_SVC3(x)			((x) << 12)
+
 #define ICnMC_CSCTHR			BIT(5)
 #define ICnMC_INF(x)			((x) << 16)
 #define ICnMC_VCSEL(x)			((x) << 22)
@@ -52,7 +69,9 @@
 enum rzg2l_cru_common_regs {
 	CRUnCTRL,	/* CRU Control */
 	CRUnIE,		/* CRU Interrupt Enable */
+	CRUnIE2,	/* CRU Interrupt Enable(2) */
 	CRUnINTS,	/* CRU Interrupt Status */
+	CRUnINTS2,	/* CRU Interrupt Status(2) */
 	CRUnRST, 	/* CRU Reset */
 	AMnMB1ADDRL,	/* Bank 1 Address (Lower) for CRU Image Data */
 	AMnMB1ADDRH,	/* Bank 1 Address (Higher) for CRU Image Data */
@@ -72,12 +91,18 @@ enum rzg2l_cru_common_regs {
 	AMnMB8ADDRH,    /* Bank 8 Address (Higher) for CRU Image Data */
 	AMnMBVALID,	/* Memory Bank Enable for CRU Image Data */
 	AMnMBS,		/* Memory Bank Status for CRU Image Data */
+	AMnMADRSL,	/* VD Memory Address Lower Status Register */
+	AMnMADRSH,	/* VD Memory Address Higher Status Register */
 	AMnAXIATTR,	/* AXI Master Transfer Setting Register for CRU Image Data */
 	AMnFIFOPNTR,	/* AXI Master FIFO Pointer for CRU Image Data */
 	AMnAXISTP,	/* AXI Master Transfer Stop for CRU Image Data */
 	AMnAXISTPACK,	/* AXI Master Transfer Stop Status for CRU Image Data */
+	AMnIS,		/* Image Stride Setting Register */
 	ICnEN,		/* CRU Image Processing Enable */
+	ICnSVCNUM,	/* CRU SVC Number Register */
+	ICnSVC,		/* CRU VC Select Register */
 	ICnMC,		/* CRU Image Processing Main Control */
+	ICnIPMC_C0,	/* CRU Image Converter Main Control 0 */
 	ICnMS,		/* CRU Module Status */
 	ICnDMR,		/* CRU Data Output Mode */
 	RZG2L_CRU_MAX_REG,
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index ccaba5220f1c..d68d83340686 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -85,6 +85,7 @@ struct rzg2l_cru_info {
 	unsigned int max_height;
 	u16 image_conv;
 	const u16 *regs;
+	bool has_stride;
 	irqreturn_t (*irq_handler)(int irq, void *data);
 	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
 	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
@@ -108,6 +109,8 @@ struct rzg2l_cru_info {
  * @vdev:		V4L2 video device associated with CRU
  * @v4l2_dev:		V4L2 device
  * @num_buf:		Holds the current number of buffers enabled
+ * @svc_channel:	SVC0/1/2/3 to use for RZ/G3E
+ * @buf_addr:		Memory addresses where current video data is written.
  * @notifier:		V4L2 asynchronous subdevs notifier
  *
  * @ip:			Image processing subdev info
@@ -144,6 +147,9 @@ struct rzg2l_cru_dev {
 	struct v4l2_device v4l2_dev;
 	u8 num_buf;
 
+	u8 svc_channel;
+	dma_addr_t *buf_addr;
+
 	struct v4l2_async_notifier notifier;
 
 	struct rzg2l_cru_ip ip;
@@ -175,6 +181,7 @@ void rzg2l_cru_dma_unregister(struct rzg2l_cru_dev *cru);
 int rzg2l_cru_video_register(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_video_unregister(struct rzg2l_cru_dev *cru);
 irqreturn_t rzg2l_cru_irq(int irq, void *data);
+irqreturn_t rzg3e_cru_irq(int irq, void *data);
 
 const struct v4l2_format_info *rzg2l_cru_format_from_pixel(u32 format);
 
@@ -188,10 +195,16 @@ const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
 
 void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
+void rzg3e_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
+void rzg3e_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
 
 bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru);
+bool rz3e_fifo_empty(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
 			  const struct rzg2l_cru_ip_format *ip_fmt,
 			  u8 csi_vc);
+void rzg3e_cru_csi2_setup(struct rzg2l_cru_dev *cru,
+			  const struct rzg2l_cru_ip_format *ip_fmt,
+			  u8 csi_vc);
 
 #endif
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index a3c4e2a0bef6..518420ad5586 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -31,6 +31,9 @@
 #define RZG2L_CRU_DEFAULT_FIELD		V4L2_FIELD_NONE
 #define RZG2L_CRU_DEFAULT_COLORSPACE	V4L2_COLORSPACE_SRGB
 
+#define RZG2L_CRU_STRIDE_MAX		32640
+#define RZG2L_CRU_STRIDE_ALIGN		128
+
 struct rzg2l_cru_buffer {
 	struct vb2_v4l2_buffer vb;
 	struct list_head list;
@@ -184,6 +187,8 @@ static void rzg2l_cru_set_slot_addr(struct rzg2l_cru_dev *cru,
 	/* Currently, we just use the buffer in 32 bits address */
 	rzg2l_cru_write(cru, AMnMBxADDRL(slot), addr);
 	rzg2l_cru_write(cru, AMnMBxADDRH(slot), 0);
+
+	cru->buf_addr[slot] = addr;
 }
 
 /*
@@ -224,6 +229,7 @@ static void rzg2l_cru_fill_hw_slot(struct rzg2l_cru_dev *cru, int slot)
 
 static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
 {
+	const struct rzg2l_cru_info *info = cru->info;
 	unsigned int slot;
 	u32 amnaxiattr;
 
@@ -236,12 +242,39 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
 	for (slot = 0; slot < cru->num_buf; slot++)
 		rzg2l_cru_fill_hw_slot(cru, slot);
 
+	if (info->has_stride) {
+		u32 stride = cru->format.bytesperline;
+		u32 amnis;
+
+		stride /= RZG2L_CRU_STRIDE_ALIGN;
+		amnis = rzg2l_cru_read(cru, AMnIS) & ~AMnIS_IS_MASK;
+		rzg2l_cru_write(cru, AMnIS, amnis | AMnIS_IS(stride));
+	}
+
 	/* Set AXI burst max length to recommended setting */
 	amnaxiattr = rzg2l_cru_read(cru, AMnAXIATTR) & ~AMnAXIATTR_AXILEN_MASK;
 	amnaxiattr |= AMnAXIATTR_AXILEN;
 	rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
 }
 
+void rzg3e_cru_csi2_setup(struct rzg2l_cru_dev *cru,
+			  const struct rzg2l_cru_ip_format *ip_fmt,
+			  u8 csi_vc)
+{
+	const struct rzg2l_cru_info *info = cru->info;
+	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
+
+	icnmc |= (rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MASK);
+
+	/* Set virtual channel CSI2 */
+	icnmc |= ICnMC_VCSEL(csi_vc);
+
+	rzg2l_cru_write(cru, ICnSVCNUM, csi_vc);
+	rzg2l_cru_write(cru, ICnSVC, ICnSVC_SVC0(0) | ICnSVC_SVC1(1) |
+			ICnSVC_SVC2(2) | ICnSVC_SVC3(3));
+	rzg2l_cru_write(cru, info->image_conv, icnmc);
+}
+
 void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
 			  const struct rzg2l_cru_ip_format *ip_fmt,
 			  u8 csi_vc)
@@ -290,6 +323,19 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 	return 0;
 }
 
+bool rz3e_fifo_empty(struct rzg2l_cru_dev *cru)
+{
+	u32 amnfifopntr = rzg2l_cru_read(cru, AMnFIFOPNTR);
+
+	if ((((amnfifopntr & AMnFIFOPNTR_FIFORPNTR_B1) >> 24) ==
+	     ((amnfifopntr & AMnFIFOPNTR_FIFOWPNTR_B1) >> 8)) &&
+	    (((amnfifopntr & AMnFIFOPNTR_FIFORPNTR_B0) >> 16) ==
+	     (amnfifopntr & AMnFIFOPNTR_FIFOWPNTR_B0)))
+		return true;
+
+	return false;
+}
+
 bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
 {
 	u32 amnfifopntr, amnfifopntr_w, amnfifopntr_r_y;
@@ -401,6 +447,20 @@ static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
 	return fd.entry[0].bus.csi2.vc;
 }
 
+void rzg3e_cru_enable_interrupts(struct rzg2l_cru_dev *cru)
+{
+	rzg2l_cru_write(cru, CRUnIE2, CRUnIE2_FSxE(cru->svc_channel));
+	rzg2l_cru_write(cru, CRUnIE2, CRUnIE2_FExE(cru->svc_channel));
+}
+
+void rzg3e_cru_disable_interrupts(struct rzg2l_cru_dev *cru)
+{
+	rzg2l_cru_write(cru, CRUnIE, 0);
+	rzg2l_cru_write(cru, CRUnIE2, 0);
+	rzg2l_cru_write(cru, CRUnINTS, rzg2l_cru_read(cru, CRUnINTS));
+	rzg2l_cru_write(cru, CRUnINTS2, rzg2l_cru_read(cru, CRUnINTS2));
+}
+
 void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru)
 {
 	rzg2l_cru_write(cru, CRUnIE, CRUnIE_EFE);
@@ -423,6 +483,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	if (ret < 0)
 		return ret;
 	csi_vc = ret;
+	cru->svc_channel = csi_vc;
 
 	spin_lock_irqsave(&cru->qlock, flags);
 
@@ -601,6 +662,107 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
 	return IRQ_RETVAL(handled);
 }
 
+static int rzg3e_cru_get_current_slot(struct rzg2l_cru_dev *cru)
+{
+	u64 amnmadrs;
+	unsigned int slot;
+
+	/*
+	 * When AMnMADRSL is read, AMnMADRSH of the higher-order
+	 * address also latches the address.
+	 *
+	 * AMnMADRSH must be read after AMnMADRSL has been read.
+	 */
+	amnmadrs = rzg2l_cru_read(cru, AMnMADRSL);
+	amnmadrs |= ((u64)rzg2l_cru_read(cru, AMnMADRSH) << 32);
+
+	/* Ensure amnmadrs is within this buffer range */
+	for (slot = 0; slot < cru->num_buf; slot++)
+		if (amnmadrs >= cru->buf_addr[slot] &&
+		    amnmadrs < cru->buf_addr[slot] + cru->format.sizeimage)
+			return slot;
+
+	dev_err(cru->dev, "Invalid MB address 0x%llx (out of range)\n", amnmadrs);
+	return -EINVAL;
+}
+
+irqreturn_t rzg3e_cru_irq(int irq, void *data)
+{
+	struct rzg2l_cru_dev *cru = data;
+	unsigned int handled = 0;
+	unsigned long flags;
+	u32 irq_status;
+	int slot;
+
+	spin_lock_irqsave(&cru->qlock, flags);
+	irq_status = rzg2l_cru_read(cru, CRUnINTS2);
+	if (!irq_status)
+		goto done;
+
+	dev_dbg(cru->dev, "CRUnINTS2 0x%x\n", irq_status);
+
+	handled = 1;
+
+	rzg2l_cru_write(cru, CRUnINTS2, rzg2l_cru_read(cru, CRUnINTS2));
+
+	/* Nothing to do if capture status is 'RZG2L_CRU_DMA_STOPPED' */
+	if (cru->state == RZG2L_CRU_DMA_STOPPED) {
+		dev_dbg(cru->dev, "IRQ while state stopped\n");
+		goto done;
+	}
+
+	if (cru->state == RZG2L_CRU_DMA_STOPPING) {
+		if (irq_status & CRUnINTS2_FSxS(0) ||
+		    irq_status & CRUnINTS2_FSxS(1) ||
+		    irq_status & CRUnINTS2_FSxS(2) ||
+		    irq_status & CRUnINTS2_FSxS(3))
+			dev_dbg(cru->dev, "IRQ while state stopping\n");
+		goto done;
+	}
+
+	slot = rzg3e_cru_get_current_slot(cru);
+	if (slot < 0)
+		goto done;
+
+	dev_dbg(cru->dev, "Current written slot: %d\n", slot);
+	cru->buf_addr[slot] = 0;
+
+	/*
+	 * To hand buffers back in a known order to userspace start
+	 * to capture first from slot 0.
+	 */
+	if (cru->state == RZG2L_CRU_DMA_STARTING) {
+		if (slot != 0) {
+			dev_dbg(cru->dev, "Starting sync slot: %d\n", slot);
+			goto done;
+		}
+		dev_dbg(cru->dev, "Capture start synced!\n");
+		cru->state = RZG2L_CRU_DMA_RUNNING;
+	}
+
+	/* Capture frame */
+	if (cru->queue_buf[slot]) {
+		cru->queue_buf[slot]->field = cru->format.field;
+		cru->queue_buf[slot]->sequence = cru->sequence;
+		cru->queue_buf[slot]->vb2_buf.timestamp = ktime_get_ns();
+		vb2_buffer_done(&cru->queue_buf[slot]->vb2_buf,
+				VB2_BUF_STATE_DONE);
+		cru->queue_buf[slot] = NULL;
+	} else {
+		/* Scratch buffer was used, dropping frame. */
+		dev_dbg(cru->dev, "Dropping frame %u\n", cru->sequence);
+	}
+
+	cru->sequence++;
+
+	/* Prepare for next frame */
+	rzg2l_cru_fill_hw_slot(cru, slot);
+
+done:
+	spin_unlock_irqrestore(&cru->qlock, flags);
+	return IRQ_RETVAL(handled);
+}
+
 static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count)
 {
 	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vq);
@@ -782,7 +944,14 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 	v4l_bound_align_image(&pix->width, 320, info->max_width, 1,
 			      &pix->height, 240, info->max_height, 2, 0);
 
-	pix->bytesperline = pix->width * fmt->bpp;
+	if (info->has_stride) {
+		u32 stride = clamp(pix->bytesperline, pix->width * fmt->bpp,
+				   RZG2L_CRU_STRIDE_MAX);
+		pix->bytesperline = round_up(stride, RZG2L_CRU_STRIDE_ALIGN);
+	} else {
+		pix->bytesperline = pix->width * fmt->bpp;
+	}
+
 	pix->sizeimage = pix->bytesperline * pix->height;
 
 	dev_dbg(cru->dev, "Format %ux%u bpl: %u size: %u\n",
-- 
2.43.0


