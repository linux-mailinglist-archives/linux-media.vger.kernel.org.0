Return-Path: <linux-media+bounces-20548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D789B59E1
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 03:23:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E61FF1C22782
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 02:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63954199FA0;
	Wed, 30 Oct 2024 02:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bOBgeVRb"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013051.outbound.protection.outlook.com [52.101.67.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4736A1991BD;
	Wed, 30 Oct 2024 02:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730254944; cv=fail; b=YyJ8qJJMq4Vf47zqWJujr2ViYasAF/kvIHfZ3jF4r8/hCRiGcMTphxs5/PJAWEB6K16B3vmIcC7EK6p1AQiMPHu42IOIlAQb1dwUH/kFY5rwqNwH1hTBR2Ls0gcZ7r62lEnOhHM9P6/lGlXOz3f+IX40+zp4kke42nvReazuctE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730254944; c=relaxed/simple;
	bh=Q249qcROMKLF1grc6bN9/23JwNByrYyjw+ixGk9KOPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WVJDjHQ6GLt4Sk5GFNv4GcvXtC7fg59ldhsk8LWaeOkipIWezy20wl0wDcVs5LtRln37L4CuNd94nUFZzUE+IoAk7IQ9LmLKI7ZbktWg9NOIBB5mOBL+nvBfICiT+jGekEM0Dq3tVX0OhU7sC2vv/9fFjHOZTxgWTCiot48dXlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bOBgeVRb; arc=fail smtp.client-ip=52.101.67.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZKwMWH70COJdHyok8tALWo5gL5R1mAk01P52G1CNDZ9IDlygPsyfg8Djd0HyA7/fqi2YP/Dcj3RzKUZ8rYOYCKvRzrbMTVEcbOYZP/h/0sXOfErR0tQbGiV3Ff7Qpu9ddwolcVcIz3xnevxw0DjzPbc1Ok01A+JtDIwrSu+Y6cT+nlhrYJ+8l7SwEPB6duhk+d9YvU2n/COGEewmIaBv87jf4FnWZ3SBW+fbZ0T0+cTmpkhJVMn+i8H8W6ir4hyA2UcXtlLbpQBciZhLOv0Yo3SIwDqWORAHh1v7ZskVfbZs8c6o2+FTezAEPlW1SQTUAUxH5gWHU7tMgSYClD+bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCbepeNg5bUGuvQ8pE2dwsEeKpIwNwNOTWxgIB3MnUw=;
 b=mxtocyX6TAAmN+OvTYSvBSWJbJA8UoOq+ChGDxyn3FqMLMjexxE8UOxpl2chZYeSawVhhQ9EQephJjvJbi8p6oVtmQloV3ZRnIgvoyyLSO5XM8P/EETGXkUA7R+weKn/IdyFtxEirBbyakQ1kR32fSFAdlsvgYk1oS/X7YQ/JUxklJryY8kXMOSP28xmbHGlXWZC1ImZBZRqxxxt5OVlh8X2BTPdyYshA3XcubGZsxnaBJRl6camoTWqPg+AfBIJoRQgLqZAHgIMZVYullUlQ4Yc0orYH213DZ6xRmEvCDBPYymPsbfZXorqfo17I0XKhi6NdS9TCSsP8N3vD4tZ2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCbepeNg5bUGuvQ8pE2dwsEeKpIwNwNOTWxgIB3MnUw=;
 b=bOBgeVRbY0XKUXqiDZjUUtJmOBcUh/6CGMUJhAdRrWrLWHd+i1145/SpvK1vwlMrLF8ajZZD57kVdN+PuDCWgZ8CGraA2sQVqhDfKaEaxLnoLMNCtp3Z/WKScZajpyVKi6CGoWmQAKB3NX8uFhu2MbEmd5Uj3zSO1uGrnnhO4fYuDrK3qB/UgbD/X4TECWd40JmXR3vsRxaO+leBmtsn2FOb2ZGPaVPmo27h7XAZ5TL8Lv449TNVAbj7PRmAfVLhbid+SEcJXOC8iuUDGnoRPmBsKlqoIOB5BfbHjvT7TuZ1z/kPrvUVSJlKHFuzSG+0r2iSGDnbqzSnNMIS8h2jrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB8705.eurprd04.prod.outlook.com (2603:10a6:20b:428::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 02:22:17 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 02:22:17 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: yunkec@google.com,
	nicolas@ndufresne.ca,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	ming.zhou@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC v4 2/4] media: v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL
Date: Wed, 30 Oct 2024 11:21:32 +0900
Message-ID: <20241030022134.1098589-3-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20241030022134.1098589-1-ming.qian@oss.nxp.com>
References: <20241030022134.1098589-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::6) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS8PR04MB8705:EE_
X-MS-Office365-Filtering-Correlation-Id: 9272d97f-40d1-4bbd-b62e-08dcf889ac6d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lOdWheNwPH55f1mqG87FHiryMp9pq4yvvAuvK1nNa+daS5R63Ui2lvGkPWq1?=
 =?us-ascii?Q?L6jo7xxXcGFrSI34K4qbfIHdic/mLZ7JKkZS02YAc6OiljnTBmKBYK3+Lfj4?=
 =?us-ascii?Q?NydviW5ei2hCy+GlHi0Qtw/c6reC+u+lVQNGknhYxzqjMuZyCQC3OSrSTMVm?=
 =?us-ascii?Q?klKPLsHpCXpj3llursuz8nFh/oSHy6DncCtFe0k1QZGSleRINwv6dVMdxPeN?=
 =?us-ascii?Q?MkR2CBZEC5ltKd2RCXbZPPBngj8xRunV1TeFy5NF3guF3ljLaYAE7aZyQ13D?=
 =?us-ascii?Q?Pc67EZZnKxkn4U3fZV+Tn2W3+RvruurBk8bJVSSSSUleDWUQXAR/8OU8Tr9n?=
 =?us-ascii?Q?Oq0yzKMzQE5kRobZN50XEc87UHYSUA8XS9mlSA1Di7dRXI5kTIqHQ7e5dNxd?=
 =?us-ascii?Q?Qk91ockw/FPNV3uXU0zGcILKBjgMup/ub74fUrwzsmE2/3D/5tGdcyYjrGy4?=
 =?us-ascii?Q?sZBIIUIAeonU4sX2thEWW4d5PzO59tiQOqpey/NO8JoVFhYTJMCOGzWJJhSJ?=
 =?us-ascii?Q?0DLKt4O1A2WNmjL89FlgJ+Qr5k9+PINmFC4ONb9pdGE/HPxRB18TuuuU5v2U?=
 =?us-ascii?Q?213jxyhrggx4tijeRkLdgRpb0Mpkro9OrBYWrbTPvkukr/m1PLsxI0lB9UlK?=
 =?us-ascii?Q?OQjZSuF0oUZjj8ZjWCYmIJFz6N4K1Z4ciD1PEvzB/SnPRhuhfvZO31I/5Yzi?=
 =?us-ascii?Q?ENq7MEw72XTpmWNHaXRGtfy4OuggYzNooG29v6O0rYCW8v9LVlOLVXT+7nVW?=
 =?us-ascii?Q?juKypCSOb+qdbuaJIdQm81/0vTE4X2HToOTnMgE2W22ygrhrk1yxoAvyhXiW?=
 =?us-ascii?Q?/LBK6kzeTFtiFTv1/TEvSDpDkDXzOjJFw952os5GNKDPcAIHvDa1pRFnEt9o?=
 =?us-ascii?Q?5ufeZQF76iz17t9ulfzO/52l7ytBAMTOMGZEUp9njWI3gKi33l9fyE3abtza?=
 =?us-ascii?Q?zhoirJCMpwYZdY7jAqdAex9Ux+DuLI+ECJudzGaUa9YYHdPywJPcc6Ndp9K5?=
 =?us-ascii?Q?Z6SWuUWKItiTdXuRHMXcdtGYQIYobOiv1jNDf1E+7rART4gPjIdFp2VwZl8Q?=
 =?us-ascii?Q?iGXiXeWec90ZMABSfg433bJG3uS3jpvEInSI/4KcnhqaF37+lIxTJLt9RADD?=
 =?us-ascii?Q?ztNInlgA/l5GncaNBVkXoYNWQgTGMvR9O2sP7TOmD51YzhhOZ0odOA3yixq4?=
 =?us-ascii?Q?YIsIyjYjmNFMgeVUWE6etMe1X/MEgD8rvDdKkQHPQPMxtn0LhfZB6YWdGr1m?=
 =?us-ascii?Q?fgG/KZWR2Yp+Amrau0Xbp7dXS3oE41SixjyDmUNCvgf18j/m2sulKD018hYI?=
 =?us-ascii?Q?TOnH5++3QtLa9+yt+UKjw8vasS/qZ1EXiqgfjAxdk1TqL1IGA4Kfoa9cUIbW?=
 =?us-ascii?Q?jWFKYw4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4cA8PmyKxyqrL+Fu/Jp3TAGc0VsDxzgVjy/Vu5CKofOputgYMZdEm9oA3kuo?=
 =?us-ascii?Q?Lf9J/L6+cr8JffXvBN3LAMa8QLDrV0XvgxTsw8LDtUkYgqIm+TKo0Qfawb2s?=
 =?us-ascii?Q?m4F4NaIeU23sTWpSk3mpO0w5vDb+2akM1ZHdg2vzJEIiHDYzwH0yevCy5oY2?=
 =?us-ascii?Q?AY8Y85ylEe22Wi5+ebMOzwn+/lB/50TLOtHbOkyKihlq7tJIN+xa0bxJ+JaD?=
 =?us-ascii?Q?s+NLS0hm1wSCDpN4/5aGOmt+f6wtawg6+qhFU05PJ+PEUvNxHIj/82TsllrW?=
 =?us-ascii?Q?aMxpZ47a6ebpV5dQxEsp07WXJfBaTDT8iHtA1HsQ00FVjZ073OLlCFqF77eb?=
 =?us-ascii?Q?sSBByPpcsPm0MsyMHQN1xOhK8oCrKVkHP9UKKr30zd68nvlLFptKCrMe2EeE?=
 =?us-ascii?Q?Xi6yxtls2dilDST/WCzKHrhPyjPlqAcztWxGD68J2HBBJ8J4oosp+pInxh+2?=
 =?us-ascii?Q?tlWVi5Id79IOM39UFj8Ld2Ef2+l0v2aOpgmT+DgfjU6eNTJuVIOBTaQU3N8h?=
 =?us-ascii?Q?dW0Y2MOIXDI9NaInLdNg5d2MGeVev8lD5nJnY3cwTduBMe/krdWOVsfsPs5j?=
 =?us-ascii?Q?hKGZp+S+FpqQs1aBruBxwRnkJCwMLqb/HIitF7PfL29zTe64EM7uM3TyyyPF?=
 =?us-ascii?Q?6xHrJZG3VOgg7BwdxMnzLNaEXfbNZzuMl7c3F8LXIZJPmJValnDJPLy+HsPJ?=
 =?us-ascii?Q?BfSnYqrazT9my9gYyvJlONxq+/4K/ZCBjpqIC2fSNjHWlMWeXHgv5I04SQos?=
 =?us-ascii?Q?9ZvNU5C3ry+u83fxDhYgoRRLMWbbAuSwmSFPsQr3T0DBnUn8sNa2HlshVYbD?=
 =?us-ascii?Q?M94+VlYuRTciQlqti9Tak4IDEdW72S54Waw6E6yAHW0jizua6FXhUnPKgezx?=
 =?us-ascii?Q?4mSOfW5mslagPdvDqeV4bylE4UEJPrEH6kggnC7poVyhvvZU1mS7dIT4+oYA?=
 =?us-ascii?Q?eiVuni5AbAocNwLpL4n4cpUQ6weNEVB1jLn0rHI4SYdGegJ0GVH0aTS4YAG0?=
 =?us-ascii?Q?edeE4VccZAfC06VSBCDeXMZzwILLyxS+IY9h+lQj4lqA+tWTBnMm/xsYtU4V?=
 =?us-ascii?Q?9M0CPkBX3q5Es4rqsYiI6n+I335EZL9cIZL7yohFpQtiW1EgymIL/BRURw5m?=
 =?us-ascii?Q?rH1eOW/C02HPCYI5zlL8rUgYOf7vpUAJR3Elin+ErEwXkLSIigpqe1oqiYly?=
 =?us-ascii?Q?kbyKj/2BSoqvTT0TNwwqGC1oZKCqZ8UG64hAYAwkKsqueGvoxJKSpqAQjrAf?=
 =?us-ascii?Q?Y+6KfHeNJ2HOFpKSZvR1CQXuxy26L9u0iA7rdJUf24o3sGX2uF0tzhuLnSm+?=
 =?us-ascii?Q?X4MLt+H+mVUFr4Lkg+hbyD80yQWmuP4rMN1szW07UE6Ckb8771Su05HlOkwG?=
 =?us-ascii?Q?wbVfk6XX/gA8HXl+DwIYB5MXEsbk3pEVD9RlA1KO7c4qj7qjiTqCExIPp0z5?=
 =?us-ascii?Q?2lreepSm4Q9MJAngmF1mO+rQUzKGdFWp41VyCnW4NHirh2vBV5H/M5LhEgT+?=
 =?us-ascii?Q?J+4proV6HdAHSkmtRpFKSoAsyZq9Wlmc+19RUxY5IMIOh9C3gS+3vdNxx61f?=
 =?us-ascii?Q?7Xft7qnq8I2V3gI3oiMHsUQWqNS13uFdFKUTmvEs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9272d97f-40d1-4bbd-b62e-08dcf889ac6d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 02:22:17.0755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9mLKeJclKe2CphdgM1JGbwy6oJMo0wcFjrOJUQBj6Q4nZ1+VM5an2u9yID5rFN0B5u4GiQJfXpLoBy05Pd5+/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8705

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Add the capability of retrieving the min and max values of a
compound control.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Yunke Cao <yunkec@google.com>
Signed-off-by: Ming Qian <ming.qian@nxp.com>
---
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  22 ++-
 .../media/v4l/vidioc-queryctrl.rst            |   9 +-
 .../media/videodev2.h.rst.exceptions          |   3 +
 drivers/media/i2c/imx214.c                    |   4 +-
 .../media/platform/qcom/venus/venc_ctrls.c    |   9 +-
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |  54 +++++--
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 153 +++++++++++++++---
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
 include/media/v4l2-ctrls.h                    |  60 ++++++-
 include/uapi/linux/videodev2.h                |   3 +
 10 files changed, 272 insertions(+), 49 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index b74a74ac06fc..b8698b85bd80 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -338,14 +338,26 @@ still cause this situation.
       - Which value of the control to get/set/try.
     * - :cspan:`2` ``V4L2_CTRL_WHICH_CUR_VAL`` will return the current value of
 	the control, ``V4L2_CTRL_WHICH_DEF_VAL`` will return the default
-	value of the control and ``V4L2_CTRL_WHICH_REQUEST_VAL`` indicates that
-	these controls have to be retrieved from a request or tried/set for
-	a request. In the latter case the ``request_fd`` field contains the
+	value of the control, ``V4L2_CTRL_WHICH_MIN_VAL`` will return the minimum
+	value of the control, and ``V4L2_CTRL_WHICH_MAX_VAL`` will return the maximum
+	value of the control. ``V4L2_CTRL_WHICH_REQUEST_VAL`` indicates that
+	the control value has to be retrieved from a request or tried/set for
+	a request. In that case the ``request_fd`` field contains the
 	file descriptor of the request that should be used. If the device
 	does not support requests, then ``EACCES`` will be returned.
 
-	When using ``V4L2_CTRL_WHICH_DEF_VAL`` be aware that you can only
-	get the default value of the control, you cannot set or try it.
+	When using ``V4L2_CTRL_WHICH_DEF_VAL``, ``V4L2_CTRL_WHICH_MIN_VAL``
+	or ``V4L2_CTRL_WHICH_MAX_VAL`` be aware that you can only get the
+	default/minimum/maximum value of the control, you cannot set or try it.
+
+	Whether a control supports querying the minimum and maximum values using
+	``V4L2_CTRL_WHICH_MIN_VAL`` and ``V4L2_CTRL_WHICH_MAX_VAL`` is indicated
+	by the ``V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX`` flag. Most non-compound
+	control types support this. For controls with compound types, the
+	definition of minimum/maximum values are provided by
+	the control documentation. If a compound control does not document the
+	meaning of minimum/maximum value, then querying the minimum or maximum
+	value will result in the error code -EINVAL.
 
 	For backwards compatibility you can also use a control class here
 	(see :ref:`ctrl-class`). In that case all controls have to
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 56d5c8b0b88b..3815732f6a9b 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -447,7 +447,10 @@ See also the examples in :ref:`control`.
       - n/a
       - A struct :c:type:`v4l2_rect`, containing a rectangle described by
 	the position of its top-left corner, the width and the height. Units
-	depend on the use case.
+	depend on the use case. Support for ``V4L2_CTRL_WHICH_MIN_VAL`` and
+	``V4L2_CTRL_WHICH_MAX_VAL`` is optional and depends on the
+	``V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX`` flag. See the documentation of
+	the specific control on how to interpret the minimum and maximum values.
     * - ``V4L2_CTRL_TYPE_H264_SPS``
       - n/a
       - n/a
@@ -664,6 +667,10 @@ See also the examples in :ref:`control`.
 	``dims[0]``. So setting the control with a differently sized
 	array will change the ``elems`` field when the control is
 	queried afterwards.
+    * - ``V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX``
+      - 0x1000
+      - This control supports getting minimum and maximum values using
+	vidioc_g_ext_ctrls with V4L2_CTRL_WHICH_MIN/MAX_VAL.
 
 Return Value
 ============
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 3cf1380b52b0..35d3456cc812 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -396,6 +396,7 @@ replace define V4L2_CTRL_FLAG_HAS_PAYLOAD control-flags
 replace define V4L2_CTRL_FLAG_EXECUTE_ON_WRITE control-flags
 replace define V4L2_CTRL_FLAG_MODIFY_LAYOUT control-flags
 replace define V4L2_CTRL_FLAG_DYNAMIC_ARRAY control-flags
+replace define V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX control-flags
 
 replace define V4L2_CTRL_FLAG_NEXT_CTRL control
 replace define V4L2_CTRL_FLAG_NEXT_COMPOUND control
@@ -570,6 +571,8 @@ ignore define V4L2_CTRL_DRIVER_PRIV
 ignore define V4L2_CTRL_MAX_DIMS
 ignore define V4L2_CTRL_WHICH_CUR_VAL
 ignore define V4L2_CTRL_WHICH_DEF_VAL
+ignore define V4L2_CTRL_WHICH_MIN_VAL
+ignore define V4L2_CTRL_WHICH_MAX_VAL
 ignore define V4L2_CTRL_WHICH_REQUEST_VAL
 ignore define V4L2_OUT_CAP_CUSTOM_TIMINGS
 ignore define V4L2_CID_MAX_CTRLS
diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 4962cfe7c83d..b0439005ec71 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -774,7 +774,9 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 	imx214->unit_size = v4l2_ctrl_new_std_compound(ctrl_hdlr,
 				NULL,
 				V4L2_CID_UNIT_CELL_SIZE,
-				v4l2_ctrl_ptr_create((void *)&unit_size));
+				v4l2_ctrl_ptr_create((void *)&unit_size),
+				v4l2_ctrl_ptr_create(NULL),
+				v4l2_ctrl_ptr_create(NULL));
 
 	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx214_ctrl_ops, &props);
 
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index d9d2a293f3ef..7f370438d655 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -607,11 +607,16 @@ int venc_ctrl_init(struct venus_inst *inst)
 
 	v4l2_ctrl_new_std_compound(&inst->ctrl_handler, &venc_ctrl_ops,
 				   V4L2_CID_COLORIMETRY_HDR10_CLL_INFO,
-				   v4l2_ctrl_ptr_create(&p_hdr10_cll));
+				   v4l2_ctrl_ptr_create(&p_hdr10_cll),
+				   v4l2_ctrl_ptr_create(NULL),
+				   v4l2_ctrl_ptr_create(NULL));
 
 	v4l2_ctrl_new_std_compound(&inst->ctrl_handler, &venc_ctrl_ops,
 				   V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY,
-				   v4l2_ctrl_ptr_create((void *)&p_hdr10_mastering));
+				   v4l2_ctrl_ptr_create((void *)&p_hdr10_mastering),
+				   v4l2_ctrl_ptr_create(NULL),
+				   v4l2_ctrl_ptr_create(NULL));
+
 
 	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
 			       V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE,
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index e5a364efd5e6..d44fbad95c11 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -94,6 +94,22 @@ static int def_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
 	return ptr_to_user(c, ctrl, ctrl->p_new);
 }
 
+/* Helper function: copy the minimum control value back to the caller */
+static int min_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
+{
+	ctrl->type_ops->minimum(ctrl, 0, ctrl->p_new);
+
+	return ptr_to_user(c, ctrl, ctrl->p_new);
+}
+
+/* Helper function: copy the maximum control value back to the caller */
+static int max_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
+{
+	ctrl->type_ops->maximum(ctrl, 0, ctrl->p_new);
+
+	return ptr_to_user(c, ctrl, ctrl->p_new);
+}
+
 /* Helper function: copy the caller-provider value as the new control value */
 static int user_to_new(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
 {
@@ -229,8 +245,8 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
 		cs->error_idx = i;
 
 		if (cs->which &&
-		    cs->which != V4L2_CTRL_WHICH_DEF_VAL &&
-		    cs->which != V4L2_CTRL_WHICH_REQUEST_VAL &&
+		    (cs->which < V4L2_CTRL_WHICH_DEF_VAL ||
+		     cs->which > V4L2_CTRL_WHICH_MAX_VAL) &&
 		    V4L2_CTRL_ID2WHICH(id) != cs->which) {
 			dprintk(vdev,
 				"invalid which 0x%x or control id 0x%x\n",
@@ -259,6 +275,15 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
 			return -EINVAL;
 		}
 
+		if (!(ctrl->flags & V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX) &&
+		    (cs->which == V4L2_CTRL_WHICH_MIN_VAL ||
+		     cs->which == V4L2_CTRL_WHICH_MAX_VAL)) {
+			dprintk(vdev,
+				"invalid which 0x%x or control id 0x%x\n",
+				cs->which, id);
+			return -EINVAL;
+		}
+
 		if (ctrl->cluster[0]->ncontrols > 1)
 			have_clusters = true;
 		if (ctrl->cluster[0] != ctrl)
@@ -368,8 +393,8 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
  */
 static int class_check(struct v4l2_ctrl_handler *hdl, u32 which)
 {
-	if (which == 0 || which == V4L2_CTRL_WHICH_DEF_VAL ||
-	    which == V4L2_CTRL_WHICH_REQUEST_VAL)
+	if (which == 0 || (which >= V4L2_CTRL_WHICH_DEF_VAL &&
+			   which <= V4L2_CTRL_WHICH_MAX_VAL))
 		return 0;
 	return find_ref_lock(hdl, which | 1) ? 0 : -EINVAL;
 }
@@ -389,10 +414,12 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
 	struct v4l2_ctrl_helper *helpers = helper;
 	int ret;
 	int i, j;
-	bool is_default, is_request;
+	bool is_default, is_request, is_min, is_max;
 
 	is_default = (cs->which == V4L2_CTRL_WHICH_DEF_VAL);
 	is_request = (cs->which == V4L2_CTRL_WHICH_REQUEST_VAL);
+	is_min = (cs->which == V4L2_CTRL_WHICH_MIN_VAL);
+	is_max = (cs->which == V4L2_CTRL_WHICH_MAX_VAL);
 
 	cs->error_idx = cs->count;
 	cs->which = V4L2_CTRL_ID2WHICH(cs->which);
@@ -432,13 +459,14 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
 
 		/*
 		 * g_volatile_ctrl will update the new control values.
-		 * This makes no sense for V4L2_CTRL_WHICH_DEF_VAL and
+		 * This makes no sense for V4L2_CTRL_WHICH_DEF_VAL,
+		 * V4L2_CTRL_WHICH_MIN_VAL, V4L2_CTRL_WHICH_MAX_VAL and
 		 * V4L2_CTRL_WHICH_REQUEST_VAL. In the case of requests
 		 * it is v4l2_ctrl_request_complete() that copies the
 		 * volatile controls at the time of request completion
 		 * to the request, so you don't want to do that again.
 		 */
-		if (!is_default && !is_request &&
+		if (!is_default && !is_request && !is_min && !is_max &&
 		    ((master->flags & V4L2_CTRL_FLAG_VOLATILE) ||
 		    (master->has_volatiles && !is_cur_manual(master)))) {
 			for (j = 0; j < master->ncontrols; j++)
@@ -467,6 +495,10 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
 				ret = -ENOMEM;
 			else if (is_request && ref->p_req_valid)
 				ret = req_to_user(cs->controls + idx, ref);
+			else if (is_min)
+				ret = min_to_user(cs->controls + idx, ref->ctrl);
+			else if (is_max)
+				ret = max_to_user(cs->controls + idx, ref->ctrl);
 			else if (is_volatile)
 				ret = new_to_user(cs->controls + idx, ref->ctrl);
 			else
@@ -564,9 +596,11 @@ int try_set_ext_ctrls_common(struct v4l2_fh *fh,
 
 	cs->error_idx = cs->count;
 
-	/* Default value cannot be changed */
-	if (cs->which == V4L2_CTRL_WHICH_DEF_VAL) {
-		dprintk(vdev, "%s: cannot change default value\n",
+	/* Default/minimum/maximum values cannot be changed */
+	if (cs->which == V4L2_CTRL_WHICH_DEF_VAL ||
+	    cs->which == V4L2_CTRL_WHICH_MIN_VAL ||
+	    cs->which == V4L2_CTRL_WHICH_MAX_VAL) {
+		dprintk(vdev, "%s: cannot change default/min/max value\n",
 			video_device_node_name(vdev));
 		return -EINVAL;
 	}
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 4c8744c8cd96..a3abbde5379b 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -182,29 +182,64 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	}
 }
 
-void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
-			    union v4l2_ctrl_ptr ptr)
+static void std_min_compound(const struct v4l2_ctrl *ctrl, u32 idx, union v4l2_ctrl_ptr ptr)
+{
+	void *p = ptr.p + idx * ctrl->elem_size;
+
+	if (ctrl->p_min.p_const)
+		memcpy(p, ctrl->p_min.p_const, ctrl->elem_size);
+	else
+		memset(p, 0, ctrl->elem_size);
+}
+
+static void std_max_compound(const struct v4l2_ctrl *ctrl, u32 idx, union v4l2_ctrl_ptr ptr)
+{
+	void *p = ptr.p + idx * ctrl->elem_size;
+
+	if (ctrl->p_max.p_const)
+		memcpy(p, ctrl->p_max.p_const, ctrl->elem_size);
+	else
+		memset(p, 0, ctrl->elem_size);
+}
+
+static void __v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
+				     u32 which, union v4l2_ctrl_ptr ptr)
 {
 	unsigned int i;
 	u32 tot_elems = ctrl->elems;
 	u32 elems = tot_elems - from_idx;
+	s64 value;
 
-	if (from_idx >= tot_elems)
+	switch (which) {
+	case V4L2_CTRL_WHICH_DEF_VAL:
+		value = ctrl->default_value;
+		break;
+	case V4L2_CTRL_WHICH_MAX_VAL:
+		value = ctrl->maximum;
+		break;
+	case V4L2_CTRL_WHICH_MIN_VAL:
+		value = ctrl->minimum;
+		break;
+	default:
 		return;
+	}
 
 	switch (ctrl->type) {
 	case V4L2_CTRL_TYPE_STRING:
+		if (which == V4L2_CTRL_WHICH_DEF_VAL)
+			value = ctrl->minimum;
+
 		for (i = from_idx; i < tot_elems; i++) {
 			unsigned int offset = i * ctrl->elem_size;
 
-			memset(ptr.p_char + offset, ' ', ctrl->minimum);
-			ptr.p_char[offset + ctrl->minimum] = '\0';
+			memset(ptr.p_char + offset, ' ', value);
+			ptr.p_char[offset + value] = '\0';
 		}
 		break;
 	case V4L2_CTRL_TYPE_INTEGER64:
-		if (ctrl->default_value) {
+		if (value) {
 			for (i = from_idx; i < tot_elems; i++)
-				ptr.p_s64[i] = ctrl->default_value;
+				ptr.p_s64[i] = value;
 		} else {
 			memset(ptr.p_s64 + from_idx, 0, elems * sizeof(s64));
 		}
@@ -214,9 +249,9 @@ void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
 	case V4L2_CTRL_TYPE_MENU:
 	case V4L2_CTRL_TYPE_BITMASK:
 	case V4L2_CTRL_TYPE_BOOLEAN:
-		if (ctrl->default_value) {
+		if (value) {
 			for (i = from_idx; i < tot_elems; i++)
-				ptr.p_s32[i] = ctrl->default_value;
+				ptr.p_s32[i] = value;
 		} else {
 			memset(ptr.p_s32 + from_idx, 0, elems * sizeof(s32));
 		}
@@ -226,32 +261,63 @@ void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
 		memset(ptr.p_s32 + from_idx, 0, elems * sizeof(s32));
 		break;
 	case V4L2_CTRL_TYPE_U8:
-		memset(ptr.p_u8 + from_idx, ctrl->default_value, elems);
+		memset(ptr.p_u8 + from_idx, value, elems);
 		break;
 	case V4L2_CTRL_TYPE_U16:
-		if (ctrl->default_value) {
+		if (value) {
 			for (i = from_idx; i < tot_elems; i++)
-				ptr.p_u16[i] = ctrl->default_value;
+				ptr.p_u16[i] = value;
 		} else {
 			memset(ptr.p_u16 + from_idx, 0, elems * sizeof(u16));
 		}
 		break;
 	case V4L2_CTRL_TYPE_U32:
-		if (ctrl->default_value) {
+		if (value) {
 			for (i = from_idx; i < tot_elems; i++)
-				ptr.p_u32[i] = ctrl->default_value;
+				ptr.p_u32[i] = value;
 		} else {
 			memset(ptr.p_u32 + from_idx, 0, elems * sizeof(u32));
 		}
 		break;
 	default:
-		for (i = from_idx; i < tot_elems; i++)
-			std_init_compound(ctrl, i, ptr);
+		for (i = from_idx; i < tot_elems; i++) {
+			switch (which) {
+			case V4L2_CTRL_WHICH_DEF_VAL:
+				std_init_compound(ctrl, i, ptr);
+				break;
+			case V4L2_CTRL_WHICH_MAX_VAL:
+				std_max_compound(ctrl, i, ptr);
+				break;
+			case V4L2_CTRL_WHICH_MIN_VAL:
+				std_min_compound(ctrl, i, ptr);
+				break;
+			}
+		}
 		break;
 	}
 }
+
+void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
+			    union v4l2_ctrl_ptr ptr)
+{
+	__v4l2_ctrl_type_op_init(ctrl, from_idx, V4L2_CTRL_WHICH_DEF_VAL, ptr);
+}
 EXPORT_SYMBOL(v4l2_ctrl_type_op_init);
 
+void v4l2_ctrl_type_op_minimum(const struct v4l2_ctrl *ctrl, u32 from_idx,
+			       union v4l2_ctrl_ptr ptr)
+{
+	__v4l2_ctrl_type_op_init(ctrl, from_idx, V4L2_CTRL_WHICH_MIN_VAL, ptr);
+}
+EXPORT_SYMBOL(v4l2_ctrl_type_op_minimum);
+
+void v4l2_ctrl_type_op_maximum(const struct v4l2_ctrl *ctrl, u32 from_idx,
+			       union v4l2_ctrl_ptr ptr)
+{
+	__v4l2_ctrl_type_op_init(ctrl, from_idx, V4L2_CTRL_WHICH_MAX_VAL, ptr);
+}
+EXPORT_SYMBOL(v4l2_ctrl_type_op_maximum);
+
 void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 {
 	union v4l2_ctrl_ptr ptr = ctrl->p_cur;
@@ -1296,6 +1362,8 @@ EXPORT_SYMBOL(v4l2_ctrl_type_op_validate);
 static const struct v4l2_ctrl_type_ops std_type_ops = {
 	.equal = v4l2_ctrl_type_op_equal,
 	.init = v4l2_ctrl_type_op_init,
+	.minimum = v4l2_ctrl_type_op_minimum,
+	.maximum = v4l2_ctrl_type_op_maximum,
 	.log = v4l2_ctrl_type_op_log,
 	.validate = v4l2_ctrl_type_op_validate,
 };
@@ -1768,7 +1836,10 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 			s64 min, s64 max, u64 step, s64 def,
 			const u32 dims[V4L2_CTRL_MAX_DIMS], u32 elem_size,
 			u32 flags, const char * const *qmenu,
-			const s64 *qmenu_int, const union v4l2_ctrl_ptr p_def,
+			const s64 *qmenu_int,
+			const union v4l2_ctrl_ptr p_def,
+			const union v4l2_ctrl_ptr p_min,
+			const union v4l2_ctrl_ptr p_max,
 			void *priv)
 {
 	struct v4l2_ctrl *ctrl;
@@ -1892,6 +1963,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 		break;
 	}
 
+	if (type < V4L2_CTRL_COMPOUND_TYPES &&
+	    type != V4L2_CTRL_TYPE_BUTTON &&
+	    type != V4L2_CTRL_TYPE_CTRL_CLASS &&
+	    type != V4L2_CTRL_TYPE_STRING)
+		flags |= V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
+
 	/* Sanity checks */
 	if (id == 0 || name == NULL || !elem_size ||
 	    id >= V4L2_CID_PRIVATE_BASE ||
@@ -1900,6 +1977,7 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 		handler_set_err(hdl, -ERANGE);
 		return NULL;
 	}
+
 	err = check_range(type, min, max, step, def);
 	if (err) {
 		handler_set_err(hdl, err);
@@ -1941,6 +2019,10 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 
 	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p_const)
 		sz_extra += elem_size;
+	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_min.p_const)
+		sz_extra += elem_size;
+	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_max.p_const)
+		sz_extra += elem_size;
 
 	ctrl = kvzalloc(sizeof(*ctrl) + sz_extra, GFP_KERNEL);
 	if (ctrl == NULL) {
@@ -2006,6 +2088,22 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 		memcpy(ctrl->p_def.p, p_def.p_const, elem_size);
 	}
 
+	if (flags & V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX) {
+		void *ptr = ctrl->p_def.p;
+
+		if (p_min.p_const) {
+			ptr += elem_size;
+			ctrl->p_min.p = ptr;
+			memcpy(ctrl->p_min.p, p_min.p_const, elem_size);
+		}
+
+		if (p_max.p_const) {
+			ptr += elem_size;
+			ctrl->p_max.p = ptr;
+			memcpy(ctrl->p_max.p, p_max.p_const, elem_size);
+		}
+	}
+
 	ctrl->type_ops->init(ctrl, 0, ctrl->p_cur);
 	cur_to_new(ctrl);
 
@@ -2056,7 +2154,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct v4l2_ctrl_handler *hdl,
 			type, min, max,
 			is_menu ? cfg->menu_skip_mask : step, def,
 			cfg->dims, cfg->elem_size,
-			flags, qmenu, qmenu_int, cfg->p_def, priv);
+			flags, qmenu, qmenu_int, cfg->p_def, cfg->p_min,
+			cfg->p_max, priv);
 	if (ctrl)
 		ctrl->is_private = cfg->is_private;
 	return ctrl;
@@ -2081,7 +2180,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_std(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     min, max, step, def, NULL, 0,
-			     flags, NULL, NULL, ptr_null, NULL);
+			     flags, NULL, NULL, ptr_null, ptr_null,
+			     ptr_null, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std);
 
@@ -2114,7 +2214,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     0, max, mask, def, NULL, 0,
-			     flags, qmenu, qmenu_int, ptr_null, NULL);
+			     flags, qmenu, qmenu_int, ptr_null, ptr_null,
+			     ptr_null, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std_menu);
 
@@ -2146,7 +2247,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     0, max, mask, def, NULL, 0,
-			     flags, qmenu, NULL, ptr_null, NULL);
+			     flags, qmenu, NULL, ptr_null, ptr_null,
+			     ptr_null, NULL);
 
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std_menu_items);
@@ -2154,7 +2256,9 @@ EXPORT_SYMBOL(v4l2_ctrl_new_std_menu_items);
 /* Helper function for standard compound controls */
 struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
 				const struct v4l2_ctrl_ops *ops, u32 id,
-				const union v4l2_ctrl_ptr p_def)
+				const union v4l2_ctrl_ptr p_def,
+				const union v4l2_ctrl_ptr p_min,
+				const union v4l2_ctrl_ptr p_max)
 {
 	const char *name;
 	enum v4l2_ctrl_type type;
@@ -2168,7 +2272,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     min, max, step, def, NULL, 0,
-			     flags, NULL, NULL, p_def, NULL);
+			     flags, NULL, NULL, p_def, p_min, p_max, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std_compound);
 
@@ -2192,7 +2296,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     0, max, 0, def, NULL, 0,
-			     flags, NULL, qmenu_int, ptr_null, NULL);
+			     flags, NULL, qmenu_int, ptr_null, ptr_null,
+			     ptr_null, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_int_menu);
 
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 0304daa8471d..bfdba96e938c 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -893,7 +893,9 @@ static bool check_ext_ctrls(struct v4l2_ext_controls *c, unsigned long ioctl)
 			return false;
 		break;
 	case V4L2_CTRL_WHICH_DEF_VAL:
-		/* Default value cannot be changed */
+	case V4L2_CTRL_WHICH_MIN_VAL:
+	case V4L2_CTRL_WHICH_MAX_VAL:
+		/* Default, minimum or maximum value cannot be changed */
 		if (ioctl == VIDIOC_S_EXT_CTRLS ||
 		    ioctl == VIDIOC_TRY_EXT_CTRLS) {
 			c->error_idx = c->count;
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index b0db167a3ac4..4bce1af5259a 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -133,6 +133,8 @@ struct v4l2_ctrl_ops {
  *
  * @equal: return true if all ctrl->elems array elements are equal.
  * @init: initialize the value for array elements from from_idx to ctrl->elems.
+ * @minimum: set the value to the minimum value of the control.
+ * @maximum: set the value to the maximum value of the control.
  * @log: log the value.
  * @validate: validate the value for ctrl->new_elems array elements.
  *	Return 0 on success and a negative value otherwise.
@@ -142,6 +144,10 @@ struct v4l2_ctrl_type_ops {
 		      union v4l2_ctrl_ptr ptr1, union v4l2_ctrl_ptr ptr2);
 	void (*init)(const struct v4l2_ctrl *ctrl, u32 from_idx,
 		     union v4l2_ctrl_ptr ptr);
+	void (*minimum)(const struct v4l2_ctrl *ctrl, u32 idx,
+			union v4l2_ctrl_ptr ptr);
+	void (*maximum)(const struct v4l2_ctrl *ctrl, u32 idx,
+			union v4l2_ctrl_ptr ptr);
 	void (*log)(const struct v4l2_ctrl *ctrl);
 	int (*validate)(const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr ptr);
 };
@@ -247,6 +253,12 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
  * @p_def:	The control's default value represented via a union which
  *		provides a standard way of accessing control types
  *		through a pointer (for compound controls only).
+ * @p_min:	The control's minimum value represented via a union which
+ *		provides a standard way of accessing control types
+ *		through a pointer (for compound controls only).
+ * @p_max:	The control's maximum value represented via a union which
+ *		provides a standard way of accessing control types
+ *		through a pointer (for compound controls only).
  * @p_cur:	The control's current value represented via a union which
  *		provides a standard way of accessing control types
  *		through a pointer.
@@ -306,6 +318,8 @@ struct v4l2_ctrl {
 	} cur;
 
 	union v4l2_ctrl_ptr p_def;
+	union v4l2_ctrl_ptr p_min;
+	union v4l2_ctrl_ptr p_max;
 	union v4l2_ctrl_ptr p_new;
 	union v4l2_ctrl_ptr p_cur;
 };
@@ -425,6 +439,8 @@ struct v4l2_ctrl_handler {
  * @step:	The control's step value for non-menu controls.
  * @def:	The control's default value.
  * @p_def:	The control's default value for compound controls.
+ * @p_min:	The control's minimum value for compound controls.
+ * @p_max:	The control's maximum value for compound controls.
  * @dims:	The size of each dimension.
  * @elem_size:	The size in bytes of the control.
  * @flags:	The control's flags.
@@ -454,6 +470,8 @@ struct v4l2_ctrl_config {
 	u64 step;
 	s64 def;
 	union v4l2_ctrl_ptr p_def;
+	union v4l2_ctrl_ptr p_min;
+	union v4l2_ctrl_ptr p_max;
 	u32 dims[V4L2_CTRL_MAX_DIMS];
 	u32 elem_size;
 	u32 flags;
@@ -723,17 +741,25 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
  * @ops:       The control ops.
  * @id:        The control ID.
  * @p_def:     The control's default value.
+ * @p_min:     The control's minimum value.
+ * @p_max:     The control's maximum value.
  *
- * Sames as v4l2_ctrl_new_std(), but with support to compound controls, thanks
- * to the @p_def field. Use v4l2_ctrl_ptr_create() to create @p_def from a
- * pointer. Use v4l2_ctrl_ptr_create(NULL) if the default value of the
- * compound control should be all zeroes.
+ * Same as v4l2_ctrl_new_std(), but with support for compound controls.
+ * To fill in the @p_def, @p_min and @p_max fields, use v4l2_ctrl_ptr_create()
+ * to convert a pointer to a const union v4l2_ctrl_ptr.
+ * Use v4l2_ctrl_ptr_create(NULL) if you want the default, minimum or maximum
+ * value of the compound control to be all zeroes.
+ * If the compound control does not set the ``V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX``
+ * flag, then it does not has minimum and maximum values. In that case just use
+ * v4l2_ctrl_ptr_create(NULL) for the @p_min and @p_max arguments.
  *
  */
 struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
 					     const struct v4l2_ctrl_ops *ops,
 					     u32 id,
-					     const union v4l2_ctrl_ptr p_def);
+					     const union v4l2_ctrl_ptr p_def,
+					     const union v4l2_ctrl_ptr p_min,
+					     const union v4l2_ctrl_ptr p_max);
 
 /**
  * v4l2_ctrl_new_int_menu() - Create a new standard V4L2 integer menu control.
@@ -1571,6 +1597,30 @@ bool v4l2_ctrl_type_op_equal(const struct v4l2_ctrl *ctrl,
 void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
 			    union v4l2_ctrl_ptr ptr);
 
+/**
+ * v4l2_ctrl_type_op_minimum - Default v4l2_ctrl_type_ops minimum callback.
+ *
+ * @ctrl: The v4l2_ctrl pointer.
+ * @from_idx: Starting element index.
+ * @ptr: The v4l2 control value.
+ *
+ * Return: void
+ */
+void v4l2_ctrl_type_op_minimum(const struct v4l2_ctrl *ctrl, u32 from_idx,
+			       union v4l2_ctrl_ptr ptr);
+
+/**
+ * v4l2_ctrl_type_op_maximum - Default v4l2_ctrl_type_ops maximum callback.
+ *
+ * @ctrl: The v4l2_ctrl pointer.
+ * @from_idx: Starting element index.
+ * @ptr: The v4l2 control value.
+ *
+ * Return: void
+ */
+void v4l2_ctrl_type_op_maximum(const struct v4l2_ctrl *ctrl, u32 from_idx,
+			       union v4l2_ctrl_ptr ptr);
+
 /**
  * v4l2_ctrl_type_op_log - Default v4l2_ctrl_type_ops log callback.
  *
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index c1c2ae150d30..c8cb2796130f 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1912,6 +1912,8 @@ struct v4l2_ext_controls {
 #define V4L2_CTRL_WHICH_CUR_VAL   0
 #define V4L2_CTRL_WHICH_DEF_VAL   0x0f000000
 #define V4L2_CTRL_WHICH_REQUEST_VAL 0x0f010000
+#define V4L2_CTRL_WHICH_MIN_VAL   0x0f020000
+#define V4L2_CTRL_WHICH_MAX_VAL   0x0f030000
 
 enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_INTEGER	     = 1,
@@ -2019,6 +2021,7 @@ struct v4l2_querymenu {
 #define V4L2_CTRL_FLAG_EXECUTE_ON_WRITE	0x0200
 #define V4L2_CTRL_FLAG_MODIFY_LAYOUT	0x0400
 #define V4L2_CTRL_FLAG_DYNAMIC_ARRAY	0x0800
+#define V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX 0x1000
 
 /*  Query flags, to be ORed with the control ID */
 #define V4L2_CTRL_FLAG_NEXT_CTRL	0x80000000
-- 
2.43.0-rc1


