Return-Path: <linux-media+bounces-24029-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E029FBA90
	for <lists+linux-media@lfdr.de>; Tue, 24 Dec 2024 09:38:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0156318854FF
	for <lists+linux-media@lfdr.de>; Tue, 24 Dec 2024 08:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC550191F98;
	Tue, 24 Dec 2024 08:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="i1uNolwV"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2089.outbound.protection.outlook.com [40.107.21.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECB318DF93;
	Tue, 24 Dec 2024 08:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735029481; cv=fail; b=mjdBquT9pXvoM7Dr23Jwkk2mjj/9D94YM1BRBAMaSdk0O203/i5kfjaFnX/D/8UEP69KkH8gZCmPleZ4NcNzlJ6DusXvIkqc0s+SWDVUFDzRbJjC0iA2afFu1S3+mWA/JPLktgikAu7bBCjAwGGsysrVRB+Nrk2ISp+4qeJiwvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735029481; c=relaxed/simple;
	bh=xmc8rBvKEdDxkVkSblBH00rUXZGWgcVSfA3TatQ01Mo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gVbVcYzfSCrQyIZakC6rOZaCHh404KtL5SOkqwvVspkUzhQ9qg4sb8QgGpKe0TI//vAHOTucM0UMlvPsBIfp0ZsiI7Xx/5d6MwruFHNSabMetiHsnkX+QtmJipqqrmVaO/jx/KlEnKTlKYrqKB4Nna+xr9IBEbDwKe5miNn4YT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=i1uNolwV; arc=fail smtp.client-ip=40.107.21.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m9/QhrkJEgG5oN/Td+oK72dWd93S9jqh8uTnqVJ1mdy8U3cldRvlnsZIdHLWrGBI4HQozVmJUGlju+KZYsHjP5BHiMZNMGa6oBjhAywZ8GQZAqu6C8voNZdplhmiMmzGbeQTJQ6tlYQUyl3ZqKAaT7I76+S81wV9qmmOFnKKQ4TFnn7yotNeREzg4i+Q8z+u+aOD/6gBm4bNrSyPGa9g/W6QsBkk49TBAtAqY+8VRIwkiISY6e/NBnLjM+plhyDmlz/SiyaRSghHMO9BNmUrArb2JF3QoS7rUNMQMh4tjMrVnOrgXPoWulNBpPaDxVl7g3JcAIKIHBbLHZ6z22FNNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MFHNgqkglGLsXI38VMWANcg2s7mUAUypyhEOSIXqjV8=;
 b=Iq143Ni0ag537cxFWugFrI/I7N6xH5d6741kXwb7wp+SY905FBJOdUxh1TXp/bwfXIQjLH+xa2KBe+Vpl4D6o1WW8hwJfPSWtQml/I4aEVm4yp8685Q7UnhH2JNewoK/UD3nVKUMhD29YKw5JPDKsfPXaR6QyjpfXi3nIltr680GuXqOcl2xKr8f/hNVFl91foSQFlD+Z0NdnqfAOxLOD+E5bYy8Hf/3jZyFs1B/NbDb1zBBqXb6mhRTw78N7HxVXgCavj7fcaiE5F4FrbkqVWp7aKoI4NFLqsqu73OvWvy4V/ncVJhmpU6fyc3/g3OVZ1ytAvsUjIYnXYO0bM0eyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFHNgqkglGLsXI38VMWANcg2s7mUAUypyhEOSIXqjV8=;
 b=i1uNolwVtfCaWoWPCU6CMJARCJ2Qlls9jb2s98PMj0DN8oHY+MXsuPRgdcPcSEghjNFm23uZvCJM/9PuosH+K6kUH1YcdaOuq69JDR70+n/RI8LnFh7KLsuQy3F6iS4yk71UKa0upO5VIsvXGzHKpkZAQp/RdL+GymldDE6Bn/HGtQfhpdwnqHaJ/i/EXA+Csme5Qt3/WtvszWK1X0UZZBcmd8KqMe/Ry49YPiS0V9VamHGVFwzW6pd+rvZFelUetjRmfA8nUmUAgZaIXzVMm4iBWmM3rGSicjf8wtZKJo/dD8nPFK5hcY6E986rP5cVnAYfOa674BeowNlPtD/Dqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS1PR04MB9501.eurprd04.prod.outlook.com (2603:10a6:20b:4d2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Tue, 24 Dec
 2024 08:37:47 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8272.013; Tue, 24 Dec 2024
 08:37:47 +0000
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
Subject: [PATCH v4] media: amphion: Support dmabuf and v4l2 buffer without binding
Date: Tue, 24 Dec 2024 17:37:25 +0900
Message-ID: <20241224083725.2278012-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::10) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS1PR04MB9501:EE_
X-MS-Office365-Filtering-Correlation-Id: 26138ac0-a152-49f6-c5d7-08dd23f63e85
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F/A8amPXwlKtnbgCL0SM9nFFYF8SRa886elQ3iTdfWquMP+oMECGhyw5AXa6?=
 =?us-ascii?Q?P8Blit5p6fa0HKbhufjb8k067P0UxeZQ7SEPJ+cp1G38EvapQgZRt4xr6t1U?=
 =?us-ascii?Q?uLvyXL/IWGLJKkkDew5Zc6hx034Bqcam5LooLwtWG25/mLbsmxeOcCFE7Rom?=
 =?us-ascii?Q?ti7sMXGYnCsFQggE7qvD8KTXueLblQTj5rBAgw/zgqEhi0wV470MyBBrQngz?=
 =?us-ascii?Q?uZMNMrvSKPQ++5+mBMgyEhZTZi7fJnuJjxK7rgmLbiKxrpY6zKuTIonqGX4k?=
 =?us-ascii?Q?BX9dBSf4SSWhZjpDAS2o4v+XAL3K881ntbmVw8i9GHcrsT6snFDZ67P0+9Q2?=
 =?us-ascii?Q?twqYyUXggYKh+OcNhbRtDoPTwmUFddREea+5hOQO+srhAEh1lfplZ9HpqZfN?=
 =?us-ascii?Q?QoMl5TNJaXIaDDqeUaEtQsgqyyaugE3hl/sX7c1wiSBVVP828t4o5KvJhqNA?=
 =?us-ascii?Q?wyBJeHjKK9775Qy68Br15Ml5Zui0zzmmjvspgqEiECspmjNnHeKZ2i+kTZyp?=
 =?us-ascii?Q?dttyknTiPrVS/BmCWuWxiCTjISNJeYKCV5GoDR/y46QK3sEJRwKofDjhJ1kJ?=
 =?us-ascii?Q?YnqdnH0x2qCBqhlFiRl2bomoqwBKxYRASxM9oBVH2BaMe1zCAAxHwR83Rf+Q?=
 =?us-ascii?Q?cIrvR801yMv47ZjMXl3a8nKjwUNP3/COFAo62bWCz+1OAjhn9IDj3dfF1NNh?=
 =?us-ascii?Q?wNPDTSjVWftAxjbXdtcT5jnfpurYLilTAxnOee+7/ERiToJyQPWSzBvkAyW/?=
 =?us-ascii?Q?tZ3Y7P4ZO58YFiKhlCXlwc7pvXms1ljhDOeajiAqHl4kpqC0hW7M0vyBlWjC?=
 =?us-ascii?Q?BVoh9Jc372HY7OQlaY3O576FsrUEsjlpeDks8E/MnM+HrjqrTKQJ5YlqyU0J?=
 =?us-ascii?Q?cUtD6sPOPeJcKy3vc1S8/rG7ctexNmLq103RwTb8WgRvjLNq/nQJePEbQa4c?=
 =?us-ascii?Q?ec2/Sqto4iDxycYLPxOY4zLsD4tNEei4NWYuqpUFSoIsgTPM8gIKUVANha3z?=
 =?us-ascii?Q?jamy3tG/1dybh3qYqajHe0d26ya4XC7eo3KRarK4wgy6Tri8/iyZye15iBpM?=
 =?us-ascii?Q?bCo9Gi6pS7GpdfNY3jkpG1poC1s/I1+IK1Y1P/6eZYhvsjHSfkfNBZ3JhTRR?=
 =?us-ascii?Q?CdCEYU/DUDHHWSPnV2oq92NiW/LqEhlFfWmd+eOKKylsGuVPACjq/Zui3M7r?=
 =?us-ascii?Q?JdNtl2Eel3HKOfK9b+UyWitBqQIkLTd46lgr6G8EoP0U29BaXEwxwpEaveOd?=
 =?us-ascii?Q?ZrtQoldH29rjVwxksy8EUiJbhq7Eju06/fXUK/LLbN8fb7yqxJVtMaAPxPG4?=
 =?us-ascii?Q?Kk4Zu3bfGydz84xxC7tSnwPz4wzljhTfitzoEtakL0bm2i2N1fsbJ0P4HLfD?=
 =?us-ascii?Q?GRurTh28aBHHPSNJFj1N2p9eP48Qv0qyux9p2abrt4jc/cTh0fyRuBy0Gm71?=
 =?us-ascii?Q?jOc1drb1zk9MYEn4B1RT+xDS5/BxMbgn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R1v6dXdotXG2rhhD+4eaJDyi4tRwBgesHLRpzl91xLTzhYzqFOdGtsXWR1aY?=
 =?us-ascii?Q?80WbxuwRnztBD6885dlGv7fqVdDNv+IvhCEcdUvVAebCtsEJBYRWP/JPk3V5?=
 =?us-ascii?Q?yN/4eacUHGyCvCDreyq/v0VCV31+JcPm6oupDY+nktMetHAfJ/mBdJJ7X33i?=
 =?us-ascii?Q?8kKPSclicNkU8hkNRFGKTPrgVQpMkAjpXcfJj5yFUCuMjyztvojPFerAsz8U?=
 =?us-ascii?Q?nLrZt+dtAT/tpfbOp5k7C2HZLhAh9pV2ufRDA3eellofp7pxVSmgXRE3eHE5?=
 =?us-ascii?Q?snsunDCKNyU9wfBqSO9b/qvQ8ekTcJOeNpjj2AAAcgVCdDnH1D5HE9xIJLbx?=
 =?us-ascii?Q?b9kJz6+c6BAFE6WUstyZsK27hEs6gLaFKBUmvcVsas4zeK0umidjBUNc+NP6?=
 =?us-ascii?Q?y6BO/f3XsEqAOw+QXxr0wOGW6MNnnXV2JHYIyQuoPR/p44q9ZxmUx/cK5lfA?=
 =?us-ascii?Q?qtbL/F8QOeORFhfaEjae2ud8NZrrxtSvyO+qvUzDFNI1NguwZigQwGo+akli?=
 =?us-ascii?Q?rh5dNdlrEPI+mr+Gvp902OyNd7k+piwjP1zbN+n/dAJo7BQxMC3x4GPMnHL5?=
 =?us-ascii?Q?bAE/IatlZm8wxY6wZTY/p5u+Y0QeDg31ujSEkqccKx+c/8qWogkvrjI1bE7K?=
 =?us-ascii?Q?5K+Zz+DLw+NxKipNuTFaCqvqf+IAygRvB+H5ZyBtvmUi8Y5Is900ygOK9E85?=
 =?us-ascii?Q?/RNLakvqL7OyF5wUWXP2wpkAWSrtLQlqP/yw0qFWQOZqCe/qCcR7+yhFylQt?=
 =?us-ascii?Q?/pPh/oMN2+XiL+go9wUTG5Dm4XYkQ8ZRUd+NfGZVTfV7t/+bEgMysYRfuDU3?=
 =?us-ascii?Q?TERgWiZ6y/uvBFoxoWRIRYGXRYCfQC42osS1QshYeYFCVV31OUZ3tmrp4XDB?=
 =?us-ascii?Q?h0FXtnz+XkXdYd65Qpl7UviEm9HwOvhu8rU1iIjjk26gTsrBUZ6ye5S4hH5i?=
 =?us-ascii?Q?yzu4CuvP7oF0n5PFBjEYIg+zncSeQ1xpjR16jOwhtXrKXZdp9zPutaYlKPUW?=
 =?us-ascii?Q?/Oh/cKrhCbT00sr+rDaAdzjoADZkC6cEJzOPfW/dyrJGGrAu7Vw64TIeYdpA?=
 =?us-ascii?Q?GjRbmQJtKV66x8s9dXSUBFATTC2nvabrJmjtqrhsQqSqP4uJomR7KOjhzOnD?=
 =?us-ascii?Q?l8oLo9BENhYgJYski6w9faVe4ggJhnCwVlXqpop5ulFeYOR4AjWOACGeN5Ye?=
 =?us-ascii?Q?uHFJMCh47zZvc4eFpWkl+URaQHkTNaCTYUfLj10U6Kk/5gEd9ACaMMcxB9Kp?=
 =?us-ascii?Q?J7jNKaH4WGZdJfmM/iW2Mn3p+G88RNkXarLA65+5MmOOlKb6CZXbSobjb6nT?=
 =?us-ascii?Q?7sXt2Scp8zjmqMJ62IG8uoiBjIoscYMDsOahJBRc8TFX3PkzrlS0U8q4GmA3?=
 =?us-ascii?Q?eMtGFjOSxnqjyw+i8EGdSjDubKUhfMZt+ksIMcHQd4tQpxRbfMw691qE8el9?=
 =?us-ascii?Q?A858UgVativnxJPV8rnUo8haU+DoWovPWG7XzSYgiKR96Is1vZ1yHoCsyOlh?=
 =?us-ascii?Q?amO9/a9/KThLFuGGBxoS99xRQbHOtliSbCEWtcuF6GRBp7V9BrdABbDgeQn5?=
 =?us-ascii?Q?6yhh0L87dXnga/Lv+pm1aZUHciVijkbSWxZcj16Y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26138ac0-a152-49f6-c5d7-08dd23f63e85
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 08:37:47.6495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cGNbHpIUZVEdkKSn/0pbEdI5At2f/BvrfynMqsfMBgYnTWgS2U89808tY8WlOkGgs2tMGn2UPoql48u/SJqx+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9501

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

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
v4
- remove unnecessary 'out of memory' message
v3
-- fix a typo in NULL pointer check
v2
-- fix an uninitialized issue reported by media-ci

 drivers/media/platform/amphion/vdec.c     | 233 +++++++++++++++++-----
 drivers/media/platform/amphion/vpu.h      |   7 +-
 drivers/media/platform/amphion/vpu_dbg.c  |  15 +-
 drivers/media/platform/amphion/vpu_v4l2.c |  11 +
 4 files changed, 218 insertions(+), 48 deletions(-)

diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
index 61d5598ee6a1..b752afc6276f 100644
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
@@ -289,6 +299,63 @@ static int vdec_ctrl_init(struct vpu_inst *inst)
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
+	if (!new_slots) {
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
@@ -745,11 +812,11 @@ static int vdec_frame_decoded(struct vpu_inst *inst, void *arg)
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
@@ -770,11 +837,13 @@ static int vdec_frame_decoded(struct vpu_inst *inst, void *arg)
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
@@ -797,11 +866,11 @@ static struct vpu_vb2_buffer *vdec_find_buffer(struct vpu_inst *inst, u32 luma)
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
@@ -835,11 +904,11 @@ static void vdec_buf_done(struct vpu_inst *inst, struct vpu_frame_info *frame)
 
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
@@ -852,10 +921,11 @@ static void vdec_buf_done(struct vpu_inst *inst, struct vpu_frame_info *frame)
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
@@ -1083,18 +1153,30 @@ static int vdec_response_frame(struct vpu_inst *inst, struct vb2_v4l2_buffer *vb
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
@@ -1109,12 +1191,13 @@ static int vdec_response_frame(struct vpu_inst *inst, struct vb2_v4l2_buffer *vb
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
@@ -1175,25 +1258,47 @@ static void vdec_recycle_buffer(struct vpu_inst *inst, struct vb2_v4l2_buffer *v
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
 
@@ -1324,39 +1429,29 @@ static void vdec_event_req_fs(struct vpu_inst *inst, struct vpu_fs_info *fs)
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
@@ -1552,6 +1647,11 @@ static void vdec_cleanup(struct vpu_inst *inst)
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
@@ -1683,11 +1783,43 @@ static int vdec_stop_session(struct vpu_inst *inst, u32 type)
 	return 0;
 }
 
-static int vdec_get_debug_info(struct vpu_inst *inst, char *str, u32 size, u32 i)
+static int vdec_get_slot_debug_info(struct vpu_inst *inst, char *str, u32 size, u32 i)
 {
 	struct vdec_t *vdec = inst->priv;
+	struct vpu_vb2_buffer *vpu_buf;
 	int num = -1;
 
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
+static int vdec_get_debug_info(struct vpu_inst *inst, char *str, u32 size, u32 i)
+{
+	struct vdec_t *vdec = inst->priv;
+	int num;
+
 	switch (i) {
 	case 0:
 		num = scnprintf(str, size,
@@ -1741,6 +1873,7 @@ static int vdec_get_debug_info(struct vpu_inst *inst, char *str, u32 size, u32 i
 				vdec->codec_info.vui_present);
 		break;
 	default:
+		num = vdec_get_slot_debug_info(inst, str, size, i - 10);
 		break;
 	}
 
@@ -1764,6 +1897,8 @@ static struct vpu_inst_ops vdec_inst_ops = {
 	.get_debug_info = vdec_get_debug_info,
 	.wait_prepare = vpu_inst_unlock,
 	.wait_finish = vpu_inst_lock,
+	.attach_frame_store = vdec_attach_frame_store,
+	.reset_frame_store = vdec_reset_frame_store,
 };
 
 static void vdec_init(struct file *file)
@@ -1804,6 +1939,14 @@ static int vdec_open(struct file *file)
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


