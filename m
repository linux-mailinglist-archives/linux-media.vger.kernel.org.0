Return-Path: <linux-media+bounces-23361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8609F0759
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 10:11:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEB68188C1C7
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 09:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906AD1B0F20;
	Fri, 13 Dec 2024 09:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lM7F+M84"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2086.outbound.protection.outlook.com [40.107.22.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471A6189F57;
	Fri, 13 Dec 2024 09:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734081059; cv=fail; b=TovxaFZU8gj037VrxrxS+RkhdeA6aq2+IBhf9z2qLtSkdhoPObCOqGBS9LRKtlOOZkzWjLz5RujH21Rtnw//8fFeS0Wn/S2LrrqJjiMHMWDb5OQqxRk2djZmyO6bWITJYmDu464UHp6TflpUyPsIq+za3VNB+hh8WelSZxu5mRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734081059; c=relaxed/simple;
	bh=Wi62B2VAZbOvbr4SHXzMF5W0bZY7FOiS3WDvifntrBc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Yt8kVwamvy26OrterewwztzJtydTSu+nEQ73aBtUl+FyG/kIq3zc+qg9aZ8I7fS2AAk6LDc7RR9NnPz6aYRfodsEELnS8bRa8ow022KeYllzUIEUbTP0c5oVMu/A5BaSsctnFykMYYLbns/qB1RM9eviCEs9Qa5/7CBJZy3lYuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lM7F+M84; arc=fail smtp.client-ip=40.107.22.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=obXo8eNRK643jt0gOuJ7y7DAxYkHhdSrWPxR9j0vOJ2rQluwunQfe0/L/3vWQ3loxQsSInngZBhEQ0eZpLnlrcVqgRKHro/hrt2MsXBkWLqotu6UzXuVesFD4fC8sR89rrzgUvlHkeEL+POYhFEVLYnvK9h+dGSHysrX6zErkzipsYleXUcham1XvqcnamIqCt9gFyg/40KlPuDD+pVvd7pR60bLSWqgy0n2qMVnSvTzIAmetSj8YQs6WDjQRZik8h5TDeKJvUE0Wfsi2Y8inZpgFuDTFmNLY0jVkx/2Q4sSF3g9hAK68BR1Q6tWzArwHy0Ibwq820PDDi1AS1QJyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLWGmKVAjJKySDdM8I4j97D5mUCy1JoJrs3CC66m33M=;
 b=rI0cRzFJa+wuExQk0g9VQn3ONwvl/uqHnhDtvg6xV7zXnBVeWUoV3n+LfgtwbCfcOKXQjzcbMA0+d66ypXxswzcKv6H+XbfgrXAQEYoizI0ZgPCkSmB1XR+doR1aZQc8Nn/VjF7d8hb0r6wnUqkRQYgkRM4t5mPR/7A1hAELxdToW+XCwUsocYBx7bdDpin4MFGmBgvd8VjhDGLl7Ua27+v+0NlnsCXmBVlreMaqb1HT7U5xC5JBc9bVmzc2S2A1nTOFOpv7qTl4E2/z/4jepvFgxCQkI5/O95HZJ/FKAc5qoYQCbkXH/7GL+Lnv4l0MQOb+p/2/6SUP3pOZaWAYtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLWGmKVAjJKySDdM8I4j97D5mUCy1JoJrs3CC66m33M=;
 b=lM7F+M84NYv1EYgKm61GNgsKYZyF/WftG+P3nWwdC+sL9KIKDNYmqWtF261SXK+3f4YUuBOCM3SWWVQWeryGLjrxfFF9yNV2cGw8I0jo7zNJdkAINNJxNk8s0E9SuvjEqA+cC9q/jafJxzMrZEHhmJe7DcXmu3zWyTGUKxKcSnZI3gLVGDkfgyd3Z/beHBEbngNqhwzd5Dwt7kD6qTgn5RyjLupMOH9AYHEfIlS1JP3Q5QNLxMUceLDhRY9py0Pjn/C58wy+SRTvIBdG0QvShU9Uesx2/9DqpBbjo6YdnCZPv+rE+jszYcDF4GRE+iN0Tg7+OmelVwyvHqvCGbPotg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PAXPR04MB9421.eurprd04.prod.outlook.com (2603:10a6:102:2b5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Fri, 13 Dec
 2024 09:10:51 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 09:10:51 +0000
From: Ming Qian <ming.qian@oss.nxp.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: nicolas@ndufresne.ca,
	shawnguo@kernel.org,
	robh+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@oss.nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] media: amphion: Support dmabuf and v4l2 buffer without binding
Date: Fri, 13 Dec 2024 18:10:30 +0900
Message-ID: <20241213091030.2936864-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0001.apcprd04.prod.outlook.com
 (2603:1096:4:197::12) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PAXPR04MB9421:EE_
X-MS-Office365-Filtering-Correlation-Id: c8e5558b-c69e-4609-258c-08dd1b560a03
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TWaImWpE6yYe7zxnLzELTsFf1/mB1YMYuCPyMgdyFojnP/ZV6ABoSia3w3Hq?=
 =?us-ascii?Q?olOLRR+lxR3+pliPQYTQV5ZB97FFr4hcVQeFhfhTXS5okr7bncWQLYe3l13h?=
 =?us-ascii?Q?mUeXuv5dLLi/EaI2WK1eo1ZrdR4ubvzYP+4bpB2lzeHaMho9/isnbcrXUcxr?=
 =?us-ascii?Q?N2NYhgViISWlfpXXmTEFe51qCApZtnnNstctpcmIPlLKKEBz6cdC7O04hvah?=
 =?us-ascii?Q?PvT+uSU7K7+qCjbdE0EyArq17AfJXH+mz62Om7Ob88gxwkmteCKmfp7cPmCk?=
 =?us-ascii?Q?Ua9PsjsnrIby0T7hGEpJGiin4g1cUNWX6aFl0ooLPT2KZlvpPCaRRRoju/XN?=
 =?us-ascii?Q?gR1wugccKAbCqV/sBO2E04/KR56/bkunENp6VRUb/w8exyJY+O8qeMw0zhEd?=
 =?us-ascii?Q?XMLm4HWjmc8VhWtfOmWdhEqA7pvYl5yBznVQAQUzKUcFtMjHIeXMvbe8Nlbi?=
 =?us-ascii?Q?BM99d9tWjYpgZSD44YPeas2JT0Io0PshZeNJ8NuxusVRe2aSAIInLO4QZIf3?=
 =?us-ascii?Q?zaIQDMZjzy+J2YGIF47oJlRJ4gZtSffD+wXrSKs/xa4nPKIXxby1aZnTk1C+?=
 =?us-ascii?Q?FdsQEl3osUp667+RbjSoT1R7HyULtxMo9m1nhGhOgEKbXdpWH8UeU69IluoL?=
 =?us-ascii?Q?ZX8VDoByoWbrnoxoyMeX714ZcfsJdgCDZROelolIKCIoRmmXYiNoTNI79HJV?=
 =?us-ascii?Q?+GR1poljlCK2wyC+EGC3MpuVHlKHenRaCQfny+KtM98WeBfPpOt+ObD+MKZa?=
 =?us-ascii?Q?Wl554LkGKCn6049H+dYpdf73vObTmwkZ/5aqRWKkk7ZnygScCmRvIgAU/A7N?=
 =?us-ascii?Q?y5ikNDVl0CxNHY6WZU3yX1M9Zl88Q9awPt6NBnvK2Y3hdHpibHgzOIAjOtpn?=
 =?us-ascii?Q?tw560kDFOjh3QktZuo/voPvJMBKwoMvKcrJSniI9Ca/pCr5JHUHkfgGeffe8?=
 =?us-ascii?Q?fjHQd4ZUS4ZCkC4n5UpS933ISWL3qyn3svXu4lUqZ4d0JMS88pghYqHgi7ws?=
 =?us-ascii?Q?SzVi8+H+fl0JICty2uEDZnEd72Ry49mF48foQOjqIIanLepeHTx0ySuHumFU?=
 =?us-ascii?Q?2JGI3MbmQKgoD2jANUQHjyBC9IEZc1soYlZRCrBr2b4ybqSuzIT4QH8gTdlQ?=
 =?us-ascii?Q?5ofOZXVxScVioUtoVMl84wofMqHopFNjxYvfNsDb3HzyX5uSee38p/m2yEaO?=
 =?us-ascii?Q?m+Sjj9ichSRSEWUbPMo77ZWpLFR3p9cTY6HBZhq+pmRZPEKHbwiDqQ4GSJNi?=
 =?us-ascii?Q?NwUQgRnFGfz61MCkXkVgrIcYfB4wlfxgN84mXgALLrMeEyJs8Kn+i8KAhRXw?=
 =?us-ascii?Q?W2GWWcvHGcfMl2S9Nr1fIxQSTRThKRk4Pu7Hj9ep0rd4kS80JnYmMQzCCzk5?=
 =?us-ascii?Q?P9TFa02YLTanmYc/JuyB37yvjKzkfvT+DHuTxI58kcOJkoNDRQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GbMDnz7wCQn7zB9IXZoUqJ7V5WP5do/tzykv1mVgYASP98oRWB5Cj7BdpTQS?=
 =?us-ascii?Q?1rgcp0qv5f4YrmtU1Dv+VeUH2avwhA/ZqCNZG+drVzYnPgAgJdSLcWgovaYr?=
 =?us-ascii?Q?ftK+O2wSasSSfYB1gkVgQzhH18gaMp5fyScsemtFo4hj7LRzwFaLFXcj7l5o?=
 =?us-ascii?Q?fAKlef2qfuXcinjClLMepsomBGFUEgJ926HZ3xg/7JINl4s7qmRnLbzsJpss?=
 =?us-ascii?Q?LjzxnWuxbfo1lyWYZEJFGIAncOoVDMBoJpKFrulJwrlNnkEWARqKTl53v8MB?=
 =?us-ascii?Q?XBuiT6HyMHO85SIbN486IzW8jDPdztCHIxOq3xtKpyTNP7FFBtiHtFciimu5?=
 =?us-ascii?Q?UCk07I2KjB2w93JuLOIA/O/N9GkaCWoBY6o1m/I19szleKifZK9ycuSQuZ0U?=
 =?us-ascii?Q?pGQY03aJq/O+Y3w7mG4YSHmyjTHaUFbs4Hzf52CabkId+P+bkzgmU6ss5Plr?=
 =?us-ascii?Q?6Pn5AgeoIApgs4OiO7eYeHmozgbm23K8xs5OGw57Lap2zPSDqyJ4Zuwj/KMB?=
 =?us-ascii?Q?EV+DXhoE9c/6uBqMQQafTMyiOI//GyVaO7CDBI1QCtrs3etv500z+OwGJvNn?=
 =?us-ascii?Q?AoLnVZh83HyFSsvq7LQSWkg8s/VGBhcOAyvRyxulZ/9zUsr6oLs0M21uNB1W?=
 =?us-ascii?Q?G5mslME+QhzMA9eyvoYt/bzA60HHalcVGOjuCkd0tnx4I07fKiCGd1IcxP+e?=
 =?us-ascii?Q?RDWKdoDYFA0UI3/OQlKmmiUcB3kFKXehmOgstnQiSx0yw/mo/+XF1H5iE4h8?=
 =?us-ascii?Q?+eRAaiMJINhaG11tU3AelW3kA0rF9HbBkc7w/A0O5aZwkml2vT/QHSTzvDeq?=
 =?us-ascii?Q?PR5iCB7k+PPoW+vfrK7TuwYzOhRfAU0zvkU3zgSwCezmb0Lt9uAk6lgRErk8?=
 =?us-ascii?Q?gJBvE3/JlsGx0kYj27GOAPF4he/GFqg9poUlsnmmYPlPRWgUCIMAeDlNiSX9?=
 =?us-ascii?Q?2nEe6hQB9Ap8+QFR7si3Fb556EauFRmsH8kyL9+6iNM1gETTQGJ+R8Cduu4G?=
 =?us-ascii?Q?FcLT1buSOV8bPnAqXZZekvuMTmZL4tc91cqlJb1hbP2+FNuwHobYZWzQLm1X?=
 =?us-ascii?Q?30nBc+SIvvxYy7hHutzDk76Q266YNO8Bg0eA1+JYKlAhuhfPqdDoOZ6FqzER?=
 =?us-ascii?Q?xWWULrNMgZ1LdmZe/PZ+tT7vZ5pGtENDQ9DNwC8WAJFMWxUFfX/ZUw15PiXq?=
 =?us-ascii?Q?ZzsbrJnJ9Y6V8JuDVKSFACmYLTommhhAVpcTDAx9dtryzDTvFdDpxweGwl8+?=
 =?us-ascii?Q?jPuzcKESFSLNJeM++ZF3auhjtnt7cZ8JgZ3TUQu1uG98q5PTyPo/Q7QAe0Kp?=
 =?us-ascii?Q?tnWXKqe88CJ0x+Ztr2Hac/KK5qFNP2MkKpMuYhoSa6dIzQ56/G6UP0ZLErZF?=
 =?us-ascii?Q?RV8VoLCoG4Y57B9OLL0wGPSgw/nED77Kt8Nqnbe9zRZtIF8GPL7b0cHt9mDi?=
 =?us-ascii?Q?mE7eAQTHwkrT1SyGeovosuKC12y3th/r9Po+bROja9Zdt4ThUhiPLPdg4TNv?=
 =?us-ascii?Q?dYBSAbVKQ6A+F9RQuwQwzOUSEoRke9IfeVW1f6MTPAlHZBaKfAmEclLO5p4e?=
 =?us-ascii?Q?lmIjgpP+kJ4foElyvoc+GqDlL/CfgAlv/uBDkRTf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e5558b-c69e-4609-258c-08dd1b560a03
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 09:10:50.9188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oy81rEaNZ+ivFWCeStqrrVbqU8srrJNQKcIh2Qp8DMWEtyCsTQ9uYu6vCAcvb6SiTIqf3KlQJybXZbOst00tUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9421

From: Ming Qian <ming.qian@nxp.com>

When using VB2_DMABUF, the relationship between dma-buf and v4l2 buffer
may not one-to-one, a single dma-buf may be queued via different
v4l2 buffers, and different dma-bufs may be queued via the same
v4l2 buffer, so it's not appropriate to use the v4l2 buffer index
as the frame store id.

We can generate a frame store id according to the dma address.
Then for a given dma-buf, the id is fixed.

Driver now manages the frame store and vb2-buffer states independently.

When a dmabuf is queued via another v4l2 buffer before the buffer is
released by firmware, need to pend it until firmware release it.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
---
v2
-- fix an uninitialized issue reported by media-ci

 drivers/media/platform/amphion/vdec.c     | 232 ++++++++++++++++++----
 drivers/media/platform/amphion/vpu.h      |   7 +-
 drivers/media/platform/amphion/vpu_dbg.c  |  15 +-
 drivers/media/platform/amphion/vpu_v4l2.c |  11 +
 4 files changed, 218 insertions(+), 47 deletions(-)

diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
index 61d5598ee6a1..a26cb0c264c9 100644
--- a/drivers/media/platform/amphion/vdec.c
+++ b/drivers/media/platform/amphion/vdec.c
@@ -26,6 +26,7 @@
 #include "vpu_cmds.h"
 #include "vpu_rpc.h"
 
+#define VDEC_SLOT_CNT_DFT		32
 #define VDEC_MIN_BUFFER_CAP		8
 #define VDEC_MIN_BUFFER_OUT		8
 
@@ -41,6 +42,14 @@ struct vdec_fs_info {
 	u32 tag;
 };
 
+struct vdec_frame_store_t {
+	struct vpu_vb2_buffer *curr;
+	struct vpu_vb2_buffer *pend;
+	dma_addr_t addr;
+	unsigned int state;
+	u32 tag;
+};
+
 struct vdec_t {
 	u32 seq_hdr_found;
 	struct vpu_buffer udata;
@@ -48,7 +57,8 @@ struct vdec_t {
 	struct vpu_dec_codec_info codec_info;
 	enum vpu_codec_state state;
 
-	struct vpu_vb2_buffer *slots[VB2_MAX_FRAME];
+	struct vdec_frame_store_t *slots;
+	u32 slot_count;
 	u32 req_frame_count;
 	struct vdec_fs_info mbi;
 	struct vdec_fs_info dcp;
@@ -289,6 +299,64 @@ static int vdec_ctrl_init(struct vpu_inst *inst)
 	return 0;
 }
 
+static void vdec_attach_frame_store(struct vpu_inst *inst, struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vpu_vb2_buffer *vpu_buf = to_vpu_vb2_buffer(vbuf);
+	struct vdec_t *vdec = inst->priv;
+	struct vdec_frame_store_t *new_slots = NULL;
+	dma_addr_t addr;
+	int i;
+
+	addr = vpu_get_vb_phy_addr(vb, 0);
+	for (i = 0; i < vdec->slot_count; i++) {
+		if (addr == vdec->slots[i].addr) {
+			if (vdec->slots[i].curr && vdec->slots[i].curr != vpu_buf) {
+				vpu_set_buffer_state(vbuf, VPU_BUF_STATE_CHANGED);
+				vdec->slots[i].pend = vpu_buf;
+			} else {
+				vpu_set_buffer_state(vbuf, vdec->slots[i].state);
+			}
+			vpu_buf->fs_id = i;
+			return;
+		}
+	}
+
+	for (i = 0; i < vdec->slot_count; i++) {
+		if (!vdec->slots[i].addr) {
+			vdec->slots[i].addr = addr;
+			vpu_buf->fs_id = i;
+			return;
+		}
+	}
+
+	new_slots = vzalloc(sizeof(*vdec->slots) * vdec->slot_count * 2);
+	if (!vdec->slots) {
+		dev_err(inst->dev, "fail to alloc frame store\n");
+		vpu_set_buffer_state(vbuf, VPU_BUF_STATE_ERROR);
+		return;
+	}
+
+	memcpy(new_slots, vdec->slots, sizeof(*vdec->slots) * vdec->slot_count);
+	vfree(vdec->slots);
+	vdec->slots = new_slots;
+	vdec->slot_count *= 2;
+
+	vdec->slots[i].addr = addr;
+	vpu_buf->fs_id = i;
+}
+
+static void vdec_reset_frame_store(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
+
+	if (!vdec->slots || !vdec->slot_count)
+		return;
+
+	vpu_trace(inst->dev, "inst[%d] reset slots\n", inst->id);
+	memset(vdec->slots, 0, sizeof(*vdec->slots) * vdec->slot_count);
+}
+
 static void vdec_handle_resolution_change(struct vpu_inst *inst)
 {
 	struct vdec_t *vdec = inst->priv;
@@ -745,11 +813,11 @@ static int vdec_frame_decoded(struct vpu_inst *inst, void *arg)
 	struct vb2_v4l2_buffer *src_buf;
 	int ret = 0;
 
-	if (!info || info->id >= ARRAY_SIZE(vdec->slots))
+	if (!info || info->id >= vdec->slot_count)
 		return -EINVAL;
 
 	vpu_inst_lock(inst);
-	vpu_buf = vdec->slots[info->id];
+	vpu_buf = vdec->slots[info->id].curr;
 	if (!vpu_buf) {
 		dev_err(inst->dev, "[%d] decoded invalid frame[%d]\n", inst->id, info->id);
 		ret = -EINVAL;
@@ -770,11 +838,13 @@ static int vdec_frame_decoded(struct vpu_inst *inst, void *arg)
 	if (vpu_get_buffer_state(vbuf) == VPU_BUF_STATE_DECODED)
 		dev_info(inst->dev, "[%d] buf[%d] has been decoded\n", inst->id, info->id);
 	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_DECODED);
+	vdec->slots[info->id].state = VPU_BUF_STATE_DECODED;
 	vdec->decoded_frame_count++;
 	if (vdec->params.display_delay_enable) {
 		struct vpu_format *cur_fmt;
 
 		cur_fmt = vpu_get_format(inst, inst->cap_format.type);
+		vdec->slots[info->id].state = VPU_BUF_STATE_READY;
 		vpu_set_buffer_state(vbuf, VPU_BUF_STATE_READY);
 		for (int i = 0; i < vbuf->vb2_buf.num_planes; i++)
 			vb2_set_plane_payload(&vbuf->vb2_buf,
@@ -797,11 +867,11 @@ static struct vpu_vb2_buffer *vdec_find_buffer(struct vpu_inst *inst, u32 luma)
 	struct vdec_t *vdec = inst->priv;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(vdec->slots); i++) {
-		if (!vdec->slots[i])
+	for (i = 0; i < vdec->slot_count; i++) {
+		if (!vdec->slots[i].curr)
 			continue;
-		if (luma == vdec->slots[i]->luma)
-			return vdec->slots[i];
+		if (luma == vdec->slots[i].addr)
+			return vdec->slots[i].curr;
 	}
 
 	return NULL;
@@ -835,11 +905,11 @@ static void vdec_buf_done(struct vpu_inst *inst, struct vpu_frame_info *frame)
 
 	cur_fmt = vpu_get_format(inst, inst->cap_format.type);
 	vbuf = &vpu_buf->m2m_buf.vb;
-	if (vbuf->vb2_buf.index != frame->id)
-		dev_err(inst->dev, "[%d] buffer id(%d, %d) dismatch\n",
-			inst->id, vbuf->vb2_buf.index, frame->id);
+	if (vpu_buf->fs_id != frame->id)
+		dev_err(inst->dev, "[%d] buffer id(%d(%d), %d) dismatch\n",
+			inst->id, vpu_buf->fs_id, vbuf->vb2_buf.index, frame->id);
 
-	if (vpu_get_buffer_state(vbuf) == VPU_BUF_STATE_READY && vdec->params.display_delay_enable)
+	if (vdec->params.display_delay_enable)
 		return;
 
 	if (vpu_get_buffer_state(vbuf) != VPU_BUF_STATE_DECODED)
@@ -852,10 +922,11 @@ static void vdec_buf_done(struct vpu_inst *inst, struct vpu_frame_info *frame)
 	vbuf->sequence = vdec->sequence;
 	dev_dbg(inst->dev, "[%d][OUTPUT TS]%32lld\n", inst->id, vbuf->vb2_buf.timestamp);
 
-	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
 	vpu_inst_lock(inst);
+	vdec->slots[vpu_buf->fs_id].state = VPU_BUF_STATE_READY;
 	vdec->display_frame_count++;
 	vpu_inst_unlock(inst);
+	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
 	dev_dbg(inst->dev, "[%d] decoded : %d, display : %d, sequence : %d\n",
 		inst->id, vdec->decoded_frame_count, vdec->display_frame_count, vdec->sequence);
 }
@@ -1083,18 +1154,30 @@ static int vdec_response_frame(struct vpu_inst *inst, struct vb2_v4l2_buffer *vb
 	if (!vbuf)
 		return -EINVAL;
 
-	if (vdec->slots[vbuf->vb2_buf.index]) {
-		dev_err(inst->dev, "[%d] repeat alloc fs %d\n",
-			inst->id, vbuf->vb2_buf.index);
+	vpu_buf = to_vpu_vb2_buffer(vbuf);
+	if (vpu_buf->fs_id < 0 || vpu_buf->fs_id >= vdec->slot_count) {
+		dev_err(inst->dev, "invalid fs %d for v4l2 buffer %d\n",
+			vpu_buf->fs_id, vbuf->vb2_buf.index);
 		return -EINVAL;
 	}
 
+	if (vdec->slots[vpu_buf->fs_id].curr) {
+		if (vdec->slots[vpu_buf->fs_id].curr != vpu_buf) {
+			vpu_set_buffer_state(vbuf, VPU_BUF_STATE_CHANGED);
+			vdec->slots[vpu_buf->fs_id].pend = vpu_buf;
+		} else {
+			vpu_set_buffer_state(vbuf, vdec->slots[vpu_buf->fs_id].state);
+		}
+		dev_err(inst->dev, "[%d] repeat alloc fs %d (v4l2 index %d)\n",
+			inst->id, vpu_buf->fs_id, vbuf->vb2_buf.index);
+		return -EAGAIN;
+	}
+
 	dev_dbg(inst->dev, "[%d] state = %s, alloc fs %d, tag = 0x%x\n",
 		inst->id, vpu_codec_state_name(inst->state), vbuf->vb2_buf.index, vdec->seq_tag);
-	vpu_buf = to_vpu_vb2_buffer(vbuf);
 
 	memset(&info, 0, sizeof(info));
-	info.id = vbuf->vb2_buf.index;
+	info.id = vpu_buf->fs_id;
 	info.type = MEM_RES_FRAME;
 	info.tag = vdec->seq_tag;
 	info.luma_addr = vpu_get_vb_phy_addr(&vbuf->vb2_buf, 0);
@@ -1109,12 +1192,13 @@ static int vdec_response_frame(struct vpu_inst *inst, struct vb2_v4l2_buffer *vb
 	if (ret)
 		return ret;
 
-	vpu_buf->tag = info.tag;
 	vpu_buf->luma = info.luma_addr;
 	vpu_buf->chroma_u = info.chroma_addr;
 	vpu_buf->chroma_v = 0;
 	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_INUSE);
-	vdec->slots[info.id] = vpu_buf;
+	vdec->slots[info.id].tag = info.tag;
+	vdec->slots[info.id].curr = vpu_buf;
+	vdec->slots[info.id].state = VPU_BUF_STATE_INUSE;
 	vdec->req_frame_count--;
 
 	return 0;
@@ -1175,25 +1259,47 @@ static void vdec_recycle_buffer(struct vpu_inst *inst, struct vb2_v4l2_buffer *v
 	v4l2_m2m_buf_queue(inst->fh.m2m_ctx, vbuf);
 }
 
-static void vdec_clear_slots(struct vpu_inst *inst)
+static void vdec_release_curr_frame_store(struct vpu_inst *inst, u32 id)
 {
 	struct vdec_t *vdec = inst->priv;
 	struct vpu_vb2_buffer *vpu_buf;
 	struct vb2_v4l2_buffer *vbuf;
+
+	if (id >= vdec->slot_count)
+		return;
+	if (!vdec->slots[id].curr)
+		return;
+
+	vpu_buf = vdec->slots[id].curr;
+	vbuf = &vpu_buf->m2m_buf.vb;
+
+	vdec_response_fs_release(inst, id, vdec->slots[id].tag);
+	if (vpu_buf->fs_id == id) {
+		if (vpu_buf->state != VPU_BUF_STATE_READY)
+			vdec_recycle_buffer(inst, vbuf);
+		vpu_set_buffer_state(vbuf, VPU_BUF_STATE_IDLE);
+	}
+
+	vdec->slots[id].curr = NULL;
+	vdec->slots[id].state = VPU_BUF_STATE_IDLE;
+
+	if (vdec->slots[id].pend) {
+		vpu_set_buffer_state(&vdec->slots[id].pend->m2m_buf.vb, VPU_BUF_STATE_IDLE);
+		vdec->slots[id].pend = NULL;
+	}
+}
+
+static void vdec_clear_slots(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(vdec->slots); i++) {
-		if (!vdec->slots[i])
+	for (i = 0; i < vdec->slot_count; i++) {
+		if (!vdec->slots[i].curr)
 			continue;
 
-		vpu_buf = vdec->slots[i];
-		vbuf = &vpu_buf->m2m_buf.vb;
-
 		vpu_trace(inst->dev, "clear slot %d\n", i);
-		vdec_response_fs_release(inst, i, vpu_buf->tag);
-		vdec_recycle_buffer(inst, vbuf);
-		vdec->slots[i]->state = VPU_BUF_STATE_IDLE;
-		vdec->slots[i] = NULL;
+		vdec_release_curr_frame_store(inst, i);
 	}
 }
 
@@ -1324,39 +1430,29 @@ static void vdec_event_req_fs(struct vpu_inst *inst, struct vpu_fs_info *fs)
 static void vdec_evnet_rel_fs(struct vpu_inst *inst, struct vpu_fs_info *fs)
 {
 	struct vdec_t *vdec = inst->priv;
-	struct vpu_vb2_buffer *vpu_buf;
-	struct vb2_v4l2_buffer *vbuf;
 
-	if (!fs || fs->id >= ARRAY_SIZE(vdec->slots))
+	if (!fs || fs->id >= vdec->slot_count)
 		return;
 	if (fs->type != MEM_RES_FRAME)
 		return;
 
-	if (fs->id >= vpu_get_num_buffers(inst, inst->cap_format.type)) {
+	if (fs->id >= vdec->slot_count) {
 		dev_err(inst->dev, "[%d] invalid fs(%d) to release\n", inst->id, fs->id);
 		return;
 	}
 
 	vpu_inst_lock(inst);
-	vpu_buf = vdec->slots[fs->id];
-	vdec->slots[fs->id] = NULL;
-
-	if (!vpu_buf) {
+	if (!vdec->slots[fs->id].curr) {
 		dev_dbg(inst->dev, "[%d] fs[%d] has bee released\n", inst->id, fs->id);
 		goto exit;
 	}
 
-	vbuf = &vpu_buf->m2m_buf.vb;
-	if (vpu_get_buffer_state(vbuf) == VPU_BUF_STATE_DECODED) {
+	if (vdec->slots[fs->id].state == VPU_BUF_STATE_DECODED) {
 		dev_dbg(inst->dev, "[%d] frame skip\n", inst->id);
 		vdec->sequence++;
 	}
 
-	vdec_response_fs_release(inst, fs->id, vpu_buf->tag);
-	if (vpu_get_buffer_state(vbuf) != VPU_BUF_STATE_READY)
-		vdec_recycle_buffer(inst, vbuf);
-
-	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_IDLE);
+	vdec_release_curr_frame_store(inst, fs->id);
 	vpu_process_capture_buffer(inst);
 
 exit:
@@ -1552,6 +1648,11 @@ static void vdec_cleanup(struct vpu_inst *inst)
 		return;
 
 	vdec = inst->priv;
+	if (vdec) {
+		vfree(vdec->slots);
+		vdec->slots = NULL;
+		vdec->slot_count = 0;
+	}
 	vfree(vdec);
 	inst->priv = NULL;
 	vfree(inst);
@@ -1683,6 +1784,38 @@ static int vdec_stop_session(struct vpu_inst *inst, u32 type)
 	return 0;
 }
 
+static int vdec_get_slot_debug_info(struct vpu_inst *inst, char *str, u32 size, u32 i)
+{
+	struct vdec_t *vdec = inst->priv;
+	struct vpu_vb2_buffer *vpu_buf;
+	int num = -1;
+
+	vpu_inst_lock(inst);
+	if (i >= vdec->slot_count || !vdec->slots[i].addr)
+		goto exit;
+
+	vpu_buf = vdec->slots[i].curr;
+
+	num = scnprintf(str, size, "slot[%2d] :", i);
+	if (vpu_buf) {
+		num += scnprintf(str + num, size - num, " %2d",
+				 vpu_buf->m2m_buf.vb.vb2_buf.index);
+		num += scnprintf(str + num, size - num, "; state = %d", vdec->slots[i].state);
+	} else {
+		num += scnprintf(str + num, size - num, " -1");
+	}
+
+	if (vdec->slots[i].pend)
+		num += scnprintf(str + num, size - num, "; %d",
+				 vdec->slots[i].pend->m2m_buf.vb.vb2_buf.index);
+
+	num += scnprintf(str + num, size - num, "\n");
+exit:
+	vpu_inst_unlock(inst);
+
+	return num;
+}
+
 static int vdec_get_debug_info(struct vpu_inst *inst, char *str, u32 size, u32 i)
 {
 	struct vdec_t *vdec = inst->priv;
@@ -1741,6 +1874,7 @@ static int vdec_get_debug_info(struct vpu_inst *inst, char *str, u32 size, u32 i
 				vdec->codec_info.vui_present);
 		break;
 	default:
+		num = vdec_get_slot_debug_info(inst, str, size, i - 10);
 		break;
 	}
 
@@ -1764,6 +1898,8 @@ static struct vpu_inst_ops vdec_inst_ops = {
 	.get_debug_info = vdec_get_debug_info,
 	.wait_prepare = vpu_inst_unlock,
 	.wait_finish = vpu_inst_lock,
+	.attach_frame_store = vdec_attach_frame_store,
+	.reset_frame_store = vdec_reset_frame_store,
 };
 
 static void vdec_init(struct file *file)
@@ -1804,6 +1940,14 @@ static int vdec_open(struct file *file)
 		return -ENOMEM;
 	}
 
+	vdec->slots = vzalloc(sizeof(*vdec->slots) * VDEC_SLOT_CNT_DFT);
+	if (!vdec->slots) {
+		vfree(vdec);
+		vfree(inst);
+		return -ENOMEM;
+	}
+	vdec->slot_count = VDEC_SLOT_CNT_DFT;
+
 	inst->ops = &vdec_inst_ops;
 	inst->formats = vdec_formats;
 	inst->type = VPU_CORE_TYPE_DEC;
diff --git a/drivers/media/platform/amphion/vpu.h b/drivers/media/platform/amphion/vpu.h
index 22f0da26ccec..76bfd6b26170 100644
--- a/drivers/media/platform/amphion/vpu.h
+++ b/drivers/media/platform/amphion/vpu.h
@@ -223,6 +223,8 @@ struct vpu_inst_ops {
 	int (*get_debug_info)(struct vpu_inst *inst, char *str, u32 size, u32 i);
 	void (*wait_prepare)(struct vpu_inst *inst);
 	void (*wait_finish)(struct vpu_inst *inst);
+	void (*attach_frame_store)(struct vpu_inst *inst, struct vb2_buffer *vb);
+	void (*reset_frame_store)(struct vpu_inst *inst);
 };
 
 struct vpu_inst {
@@ -296,7 +298,8 @@ enum {
 	VPU_BUF_STATE_DECODED,
 	VPU_BUF_STATE_READY,
 	VPU_BUF_STATE_SKIP,
-	VPU_BUF_STATE_ERROR
+	VPU_BUF_STATE_ERROR,
+	VPU_BUF_STATE_CHANGED
 };
 
 struct vpu_vb2_buffer {
@@ -305,8 +308,8 @@ struct vpu_vb2_buffer {
 	dma_addr_t chroma_u;
 	dma_addr_t chroma_v;
 	unsigned int state;
-	u32 tag;
 	u32 average_qp;
+	s32 fs_id;
 };
 
 void vpu_writel(struct vpu_dev *vpu, u32 reg, u32 val);
diff --git a/drivers/media/platform/amphion/vpu_dbg.c b/drivers/media/platform/amphion/vpu_dbg.c
index 940e5bda5fa3..497ae4e8a229 100644
--- a/drivers/media/platform/amphion/vpu_dbg.c
+++ b/drivers/media/platform/amphion/vpu_dbg.c
@@ -48,6 +48,7 @@ static char *vpu_stat_name[] = {
 	[VPU_BUF_STATE_READY] = "ready",
 	[VPU_BUF_STATE_SKIP] = "skip",
 	[VPU_BUF_STATE_ERROR] = "error",
+	[VPU_BUF_STATE_CHANGED] = "changed",
 };
 
 static inline const char *to_vpu_stat_name(int state)
@@ -164,6 +165,7 @@ static int vpu_dbg_instance(struct seq_file *s, void *data)
 	for (i = 0; i < vb2_get_num_buffers(vq); i++) {
 		struct vb2_buffer *vb;
 		struct vb2_v4l2_buffer *vbuf;
+		struct vpu_vb2_buffer *vpu_buf;
 
 		vb = vb2_get_buffer(vq, i);
 		if (!vb)
@@ -173,13 +175,24 @@ static int vpu_dbg_instance(struct seq_file *s, void *data)
 			continue;
 
 		vbuf = to_vb2_v4l2_buffer(vb);
+		vpu_buf = to_vpu_vb2_buffer(vbuf);
 
 		num = scnprintf(str, sizeof(str),
-				"capture[%2d] state = %10s, %8s\n",
+				"capture[%2d] state = %10s, %8s",
 				i, vb2_stat_name[vb->state],
 				to_vpu_stat_name(vpu_get_buffer_state(vbuf)));
 		if (seq_write(s, str, num))
 			return 0;
+
+		if (vpu_buf->fs_id >= 0) {
+			num = scnprintf(str, sizeof(str), "; fs %d", vpu_buf->fs_id);
+			if (seq_write(s, str, num))
+				return 0;
+		}
+
+		num = scnprintf(str, sizeof(str), "\n");
+		if (seq_write(s, str, num))
+			return 0;
 	}
 
 	num = scnprintf(str, sizeof(str), "sequence = %d\n", inst->sequence);
diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
index 45707931bc4f..74668fa362e2 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.c
+++ b/drivers/media/platform/amphion/vpu_v4l2.c
@@ -501,14 +501,25 @@ static int vpu_vb2_queue_setup(struct vb2_queue *vq,
 		call_void_vop(inst, release);
 	}
 
+	if (V4L2_TYPE_IS_CAPTURE(vq->type))
+		call_void_vop(inst, reset_frame_store);
+
 	return 0;
 }
 
 static int vpu_vb2_buf_init(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vpu_vb2_buffer *vpu_buf = to_vpu_vb2_buffer(vbuf);
+	struct vpu_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
 
+	vpu_buf->fs_id = -1;
 	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_IDLE);
+
+	if (!inst->ops->attach_frame_store || V4L2_TYPE_IS_OUTPUT(vb->type))
+		return 0;
+
+	call_void_vop(inst, attach_frame_store, vb);
 	return 0;
 }
 
-- 
2.43.0-rc1


