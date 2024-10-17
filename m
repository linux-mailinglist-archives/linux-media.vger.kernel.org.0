Return-Path: <linux-media+bounces-19784-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6989A1E23
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 11:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8FD41C20CC4
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 09:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236361DA0E0;
	Thu, 17 Oct 2024 09:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="M9SllDs4"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2085.outbound.protection.outlook.com [40.107.21.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6C01D95B3;
	Thu, 17 Oct 2024 09:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729156842; cv=fail; b=n1s6kxZqJJIajlkwqqJBfYFGtmVOqcBe9mTYHgj3DM6CifB9mfLDkj5jp+7Jchkvz6Ltyoorgb+MHZwX0C5EGVI5MvO8y/PUreWi62gTZTroOhsRJEbprzbox/47mWXrJpJLGxMwAqb8ujgNZsWAxyScAHeBuop7UGWjO+RoH6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729156842; c=relaxed/simple;
	bh=V9uQS5qYmiXssOXx3/jo+h9bUk3tmEJA4+u5KYczP+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IALCzAqSRcrmElYBiWpBX4zP7hfRsRsSwlJ7PYY9y4zIKOJONSZ2Xlzkjb6KvhO6paeMGaRxFRtgRR2eoxEzH1MrMByVFaobhH+imNp1byTED7US9o+HhyYwIilRT9ISGxviA6t+yKiC3TVrY5cMZ04ohor+XTAGeZNuq/rNPjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=M9SllDs4; arc=fail smtp.client-ip=40.107.21.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e64ppHKrKlyOIV+iAZ7XfDq3DSdbWay27dD4DuhLSLbluGt3rElJ2c3sgX4dTqk12u9D6+g2sPhagD0Z4SJEvfn7n8Jl24y7Bvo++IArkWQmgwn+T5A1bPD3sz5oAuSjdUIgbqIoec8jszXIrl8cl5YdD62LWiGb/fVdeFqW2EI8KbO9wzWgZvRo/0M4KXPnCbFFsa0GQu4dT8X3kKoXAFPWiAhPUKVQ244O41v/AkjjqccU0YmYKomHljIBvFm4F1g/PMJCyl11jYx6kvzFvBRN7ub5+/Co355k8BFgzUAqRWqpkBxPtDavSmn1/NpAjqDEFBOCb6Wpd8CfR8cQ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3oKuxRFkA9yHb1hrfi99zYa7fO58IZs40h8sxAWj0U=;
 b=MWhytjmWIPHDXU5LysnP6O4H6p01ViKKFMnbeQXQKJflYgn+8ZgQCfPlF+3CTWBnSuiXM6habcZO0R52Yit9XusNhv7HtCl7IHQ/CDRVVQynTONW77dMWLS9dHBmvg3J3/pRST7f+E1otCaC9EO7UvRxeXE+UjSNwIrcZx53Uj7DnL3LN87VJVrU+Hmo/GfMhK4dqZtW6JXiRqLJzXcRYucX/jRYlKbbM7+5YEIJoQaTG5fH7Cjcn7sqeDjz7Cmi+yDD2EwfwohupkwBgtucCcJaRu1lw7/kgwXBabwetClTS41xHjYmLL2eS9k5+BUtdaCLke85O82Si3hgyvYoXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3oKuxRFkA9yHb1hrfi99zYa7fO58IZs40h8sxAWj0U=;
 b=M9SllDs4VJY7zqyGbKI+sghP/RvIr2UksIwBHmLTdb+/2BnklPlNfoma4drPWYM4RrRgu7l5LVfobvJz/4iXZ8+Y8k5T4UzgrnUZY+AAAcRrqTm0QEMRLqIbkrBDcMBFBwzuKu47pf3P6PvmTHKBsI2I2nkqZtw+pkaIuzCyL9nyT0cTyLR0nDU/eXGLsbsmNj6Gj9EDkTrqSafl8EA3Zuew5CDUKLOhltk1ldD76sz40d5H3o/YWm+HQIl+vncdrYRkj3afmvnHj/Ib6flj1JhW4sM/D0lgpx24t8g7SEzu2mSo0Pb21iL8AZs22rr1+VxecMtJLd2nkVUt6g/umQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB9061.eurprd04.prod.outlook.com (2603:10a6:20b:444::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 09:20:35 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 09:20:35 +0000
From: Ming Qian <ming.qian@nxp.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: yunkec@google.com,
	nicolas@ndufresne.ca,
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
Subject: [RFC 2/6] media: vivid: Add an rectangle control
Date: Thu, 17 Oct 2024 18:19:47 +0900
Message-ID: <20241017091951.2160314-3-ming.qian@nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20241017091951.2160314-1-ming.qian@nxp.com>
References: <20241017091951.2160314-1-ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0129.apcprd02.prod.outlook.com
 (2603:1096:4:188::19) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS8PR04MB9061:EE_
X-MS-Office365-Filtering-Correlation-Id: d05e3b88-eb36-4c3a-c98f-08dcee8cf4cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ngBTSlgCZs+hrHL0CEfxET8XV5G9iggIlzaQwNOkz1NWkUcNArFP0kbxBlsa?=
 =?us-ascii?Q?RLvVb8GNrNRMkZSoEyjMe7Ez5109nqKPdgk2zDgueJEdguEx+iPMSmNQ6pdx?=
 =?us-ascii?Q?2lmqfde2ps0Dp3M9muX0CSXC9wR8L/1aZEsRfvtuAifyRvnx9HTdgQtAfQzy?=
 =?us-ascii?Q?Y9KIepGh9fYvxOl4dAWk1kZuyIzvIS6nw41Rf/eM8eEOO/TzD5MymSje3l/F?=
 =?us-ascii?Q?fjwxPgpQ4lPpf0DN77kNR6Dwfe7R0QG21RR0YW3xpKoJNWhuwPDyW4q4zIgE?=
 =?us-ascii?Q?xW4D5i03wblg1ZSxoidE5FLL2x7VX14NUp4ESfUnrduGNut3nfyM8EQ5N1ya?=
 =?us-ascii?Q?pKc0kduAf//YDhri/EL0CPn3nlcMDF1Gml1ljqI4qfPiWYcwYkGKNmyz4WfN?=
 =?us-ascii?Q?gTlc8sElpFK5oR2XyzVulH3rshOCIgX32sLoK24bSPNoASP1v0NkugvZPWSq?=
 =?us-ascii?Q?aZXDLR5R74ngQIbHXev40+M26lOjYlMGYwTgqwVRfAyePyjsYdM57zcZjo0K?=
 =?us-ascii?Q?xTfD2Br38kGD+bR92C67OrZuHAkNw9lC1WxnqGWTpRwc9GdGqqQfHbvA1OPb?=
 =?us-ascii?Q?jqt8NzMGW5jT8KfOtSRyelSoXnLi9H22SNCRbHYCvnGMlCUIpsBjlz4SeVI3?=
 =?us-ascii?Q?CGziPssnloBVTqgeaJpFsvAahj3nrcwzHHfhZcuCr2pBtIO+uh1BhGPpG6OV?=
 =?us-ascii?Q?Mpwj2zSyQgS614UY38TkuVgxrxkyBkxACABFs2ou+fyeF7kcNDZx8AZ50U4x?=
 =?us-ascii?Q?DkXJguFJ56UZj95SU3nVjzzoR3lKjzF75AwlDqV6NlFen8UGrmoLFp/PafUW?=
 =?us-ascii?Q?oGsyr3SzVYUEQpVm7dTeDKG7Od5aNGDeWU+OEerUWoGu/uiCvOasZ4wW9vzb?=
 =?us-ascii?Q?MtKLEpyX55vmu1QpuYooUZ5/DiFKVyEu8Uej1uNoxOiJQEOpXqi0+MYi9DV5?=
 =?us-ascii?Q?Kyhzcmlww2DlkKGsIjKXxPCxaPAX40lqSNcPDRkjy409MPtgkl9Z3jB/HDgd?=
 =?us-ascii?Q?1nC/ac4kW3Mew7lWD/jBdPWPjIMUwppLvkUXLN+dOFtBdDTSiDkWYpRYc4q9?=
 =?us-ascii?Q?fcHhOAVZQXGIaTGzEitGfB7UdTQ5dZF5REInc0iU0q/JSMNxmlA7baRkMNP8?=
 =?us-ascii?Q?cNlYzzEDTfqvmmZCP6jH75T4KO/g0aPrtcshG7HMBKd8oU3BYZ7GTAaJii8/?=
 =?us-ascii?Q?Xs3J4MYPiTF80Xx57SG7RfzZHDRYO6UAYlSEU4P9U74COM02A3Mf+QWjWE57?=
 =?us-ascii?Q?oN9N6tlRXvcXp+IZwgyH7Ze1Hi79EAr1D4JGfbwUr2NH6H9ZXMlrVZepr1Zk?=
 =?us-ascii?Q?GmAUQKC847Yx9nQAl40vtKg2+BKgQe8o/N6DAM/58fyAlH8G36C9YUzTWwok?=
 =?us-ascii?Q?MSfk6aQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SGLzGu4G/vb/aR0QSAOjHHcJ+MGQra6kmMAZw1xzV0LWp1laphoU4XKLvfWY?=
 =?us-ascii?Q?ufCNfrUd5goMaaB8H/7VErYB9QzMAN2x3BjfheHQ59wVxQtzVY9UZn2Br2R/?=
 =?us-ascii?Q?SSy/CD/XNggeX2LwEzSlhBzTMn4jb2V5r4/cLvrEbwjnJAPRVyYaXdAkcY8G?=
 =?us-ascii?Q?k+FrOYUb2B4+0RefXsjSQ2ZsySRNi2GKpBxXq6siuTKigdLsC8xsoVjJTFUI?=
 =?us-ascii?Q?swqtJjM1GagsfEU3wnvEpeJq113GeN0QpdYfgaEHREip1tMkrirYymCbgdji?=
 =?us-ascii?Q?8H2eJUCMR+UabvfVwoINPP+V2I3r1MIa/0Svhb39X2B4DOSLQ3pkVVQgmALP?=
 =?us-ascii?Q?XQ4BMX0zw4481AolGx/tooukH6O5dTj9CrPj5m9B9WCkrE+ZaGqI/BxQp9ZC?=
 =?us-ascii?Q?+RM1U92pKQG5949z6OFnhDwTeE912f46E1A+gb9TXW+Z+a0d9u2b/VsCpUvA?=
 =?us-ascii?Q?05gQAvrK0zQyXlFmz6BaEFt4VYAKChzNV1QpSEfuiIiuYK7WlhQ5QZhCL9b+?=
 =?us-ascii?Q?ShVUuHaJYnmVIxHb4VSLOaJq3sUL+caU4cuXnivknCusxBtaTCGUSIX/45yx?=
 =?us-ascii?Q?jpdphQ3Tc/21IkPdu9ac9lbKBWyPvv9hZESMRkNmgVR7Qm2vjiCwYrtmNUWL?=
 =?us-ascii?Q?RUM5n4aqQDhEVNIAbrD1BoAPNj0kkHgqrSUD/IEwWrDdjAJhTHZ34DMOONT5?=
 =?us-ascii?Q?wB0GuVrU0b1SEr8UPFCqpI13QIF4g02uy12aSnNBT22KriZiNN9E0F4OnVLu?=
 =?us-ascii?Q?438I49LXT5oYXQ5nwL/O0BVu3N0LIe2vol8TvR7t2lWeJVIxMQhz5nNC7tAz?=
 =?us-ascii?Q?SMiA4xNwPKIylRQEI3KGzzi3dgzy7RX4eThxMJaGZJWFruUqpucKe0J5Ww7x?=
 =?us-ascii?Q?biX+nhyaKW8eV+8cw+FxwmWaqseLmsRAGlCOBjhwra+Zx6AZNfjCpmxI0taI?=
 =?us-ascii?Q?3tj8i2pSGURd/kt1zRVWBrv0x5R5GPZgg7Rvz7K1bMlrKiuP98nj5XyzciKF?=
 =?us-ascii?Q?XeeE4bgru8ixk2CAcRGyCnPrraV5t+knH4xtvmthsyigBb5g5ZOTfr1ALIhS?=
 =?us-ascii?Q?B29pJqW3LsFR7zgRWc/55oL/WQeHiD0mECQL5QF3EL7LZ07qdxw25qBwq6Wo?=
 =?us-ascii?Q?7jMn/4wl7IUwI5HleHT9A4CugfVLUquxosfyQUnG+w/9qqLFoawlV999+Tzs?=
 =?us-ascii?Q?65Lu+8ZIXjDcYNdII716YGeXaefr+xciXDI2PUp0pZAtUoD+arjdaQFh6pLa?=
 =?us-ascii?Q?bRVGrdIFj4GyRkhcbu0IMZEmI1a9Fv8G9mfov4prLZ6WYJ4wyhUP1Q4ZLwu1?=
 =?us-ascii?Q?JFnyOQDIEOw5+q0QSFzOA+dzKCKmM+paAr9j/zqnBSdevoimardSKVdR1CE+?=
 =?us-ascii?Q?Cj1S/Sf1J1etEmD6uemCblfKRV98sVRoAY7NI4r+Mp6VEZH6RHBN0rRqQuzp?=
 =?us-ascii?Q?oRqmCcsQTKRymlH3ww8CEZZc1hPQMXdMXbdcnufQ7qEomDWxLoOyNP7sSO5/?=
 =?us-ascii?Q?F+GRsnJOsQYPo7yVcJb37DhWZVK47BKs0u3yKfrbN+9o/osPGF17JZFM0oRC?=
 =?us-ascii?Q?EVtWrM84Kh7CqjCudxc/Y7by1JY7Odr0ep/+R/2B?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d05e3b88-eb36-4c3a-c98f-08dcee8cf4cc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 09:20:35.1503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SMzgxNs9oMpG831hNkXgqt3fT9uTViIcqwgEL5C26y1eU+yvQ9P1Fc1H/XAsCxvYns68Q12ocwlg9LnUb9MYnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9061

From: Yunke Cao <yunkec@google.com>

This control represents a generic read/write rectangle.
It supports V4L2_CTRL_WHICH_MIN/MAX_VAL.

Signed-off-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/test-drivers/vivid/vivid-ctrls.c    | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index 8bb38bc7b8cc..bed5f4fb0c69 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -37,6 +37,7 @@
 #define VIVID_CID_U8_PIXEL_ARRAY	(VIVID_CID_CUSTOM_BASE + 14)
 #define VIVID_CID_S32_ARRAY		(VIVID_CID_CUSTOM_BASE + 15)
 #define VIVID_CID_S64_ARRAY		(VIVID_CID_CUSTOM_BASE + 16)
+#define VIVID_CID_RECT			(VIVID_CID_CUSTOM_BASE + 17)
 
 #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
 #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
@@ -360,6 +361,38 @@ static const struct v4l2_ctrl_config vivid_ctrl_ro_int32 = {
 	.step = 1,
 };
 
+static const struct v4l2_rect rect_def = {
+	.top = 100,
+	.left = 200,
+	.width = 300,
+	.height = 400,
+};
+
+static const struct v4l2_rect rect_min = {
+	.top = 0,
+	.left = 0,
+	.width = 1,
+	.height = 1,
+};
+
+static const struct v4l2_rect rect_max = {
+	.top = 0,
+	.left = 0,
+	.width = 1000,
+	.height = 2000,
+};
+
+static const struct v4l2_ctrl_config vivid_ctrl_rect = {
+	.ops = &vivid_user_gen_ctrl_ops,
+	.id = VIVID_CID_RECT,
+	.name = "Rect",
+	.type = V4L2_CTRL_TYPE_RECT,
+	.flags = V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX,
+	.p_def.p_const = &rect_def,
+	.p_min.p_const = &rect_min,
+	.p_max.p_const = &rect_max,
+};
+
 /* Framebuffer Controls */
 
 static int vivid_fb_s_ctrl(struct v4l2_ctrl *ctrl)
@@ -1685,6 +1718,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 	dev->int_menu = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_int_menu, NULL);
 	dev->ro_int32 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_ro_int32, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_area, NULL);
+	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_rect, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);
-- 
2.43.0-rc1


