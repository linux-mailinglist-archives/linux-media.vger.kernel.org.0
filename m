Return-Path: <linux-media+bounces-19824-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6285A9A346D
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 07:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20221285126
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 05:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7715181D00;
	Fri, 18 Oct 2024 05:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="l6MgY4KH"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2084.outbound.protection.outlook.com [40.107.21.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B83188008;
	Fri, 18 Oct 2024 05:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729230356; cv=fail; b=IdiuB0reyE9b3AQsyKo4S4MgQebWF0aEoFxr6KNMJQZZuRiBz4HYottIYbQ/4dYbSQO5H1fdO4pkzUkgHb+3u2syw0UKCwINOBloxsag+PH2PWJvAU0wlexvYl0buhEpY+onM5ySFFo6z4fRouthHV+uQVx4XSAqnomn+3iBDJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729230356; c=relaxed/simple;
	bh=uOwMQIkZ9RIxIpbFlViNiVIbaql1bLSvdFZewvkcJzk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r0T/4SAM6qT+7VMi+NXE++8Jd2agFXmDp+L+y2+BgR4bOY4nOtUQ0mrX6EewG+hwq7WLq3fmBgqVuTDirrVzm15o9lgpLCGmjWDw7HJ/eXAFhui6aAySC649WsqkQkzp3FUjqEblDhtiSOEwQh6vkFcmwTfxcaIt/py3yw7+t60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=l6MgY4KH; arc=fail smtp.client-ip=40.107.21.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h/YSOx+9mjeabYNuluM64oohnVQF7SJxUfwV2O07Q80/WEeD60QbdTuOdWdZIojf6Q6D22I+I0YER/mSlcP0tdSM1woM2CKjRKkyJ2gS0YZxb49ByZ8mhtskHM61o+9u0+XuIIhJkDIpJ2OVVg0ynoJ2Mo9uFkGwvCYXhWNuj8ORlpEC5LTt6Ld9wbpUeWpHoUmfGPZRtASji4TURBk7wXfdPATlgQ/1PgMUepuQWpueZeEco8bdEznQ6vOqCNWOUush+CzJc8E8i7V5hqgqIK/mer6qCQQ6SxRiRKWXyo6tJ7iMUBLGcUD5KbCURJa+xZ9zv4eLvPjTUl3x9rGVNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZsrsilQB6hYf/CppEdLlZz46gXU+VJmSX74tnVqkasg=;
 b=K3+zhNI5VS6IKWb6QOdCtjpVCycJVK3rFo5kROJWK80HB9VKaxcf1k0HYRQGDcxQMJNjPWHGZZhCriS8q/tXZ8qKKouDzEYW6l53mPc2BGdRGZr2QJnvlUCh28Nq+QPk0lCD34hhtePobCfjNuUqMF+kPOxn1YnhI1/EHhJ58X0T5J0hXRtyfaiVCVk/kkYRr0wxnCcwjVAZUuxbLEFfUsUNUZPF0koIW4np0lhKcGgNWo8CGz/+L14eSA/iZJ6GoEqGbe/E+G0854mCUIQlEDRrZRDjHpfTGCpq/e40fTx0/Q0l8uDyRLVoZRtgKcdn/KalbuiJ+G8M/UH124phRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZsrsilQB6hYf/CppEdLlZz46gXU+VJmSX74tnVqkasg=;
 b=l6MgY4KHgdS8yON9Q8CXD2YDYJVHhOk3hcQuz9yHXDpl4s2a7YMrdRrZVqkQViVUrvkuok53pM4CZR2eEWns9PSq762BYA6O/JfF36tl/DPGKR0RyFxM2croMlfed5JbvqkwuxWGs0tN49Ge++JOcmSXZI8EyFRC9pHZHqBD1ZmWbELbBeHcC0rKpoMQLwbC47Wg0xcvKLqVqDTVEE0Xb758GXUI2fXgord8zAq2Bls6gtXgR3Ba6bMGIEcGRNy1dvAslOR2/NTGFM6gKZ6/lLUsikrTtxvfO+93uj2aTwIUILIhVhRJAj4ERglNirJqXcZTSyOXcsMPxHQHtVZ/sA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AM9PR04MB8537.eurprd04.prod.outlook.com (2603:10a6:20b:434::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.22; Fri, 18 Oct
 2024 05:45:51 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 05:45:51 +0000
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
	ming.zhou@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@oss.nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC v2 6/6] media: vivid: Add a video region ctrl
Date: Fri, 18 Oct 2024 14:44:48 +0900
Message-ID: <20241018054448.3190423-7-ming.qian@nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20241018054448.3190423-1-ming.qian@nxp.com>
References: <20241018054448.3190423-1-ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AM9PR04MB8537:EE_
X-MS-Office365-Filtering-Correlation-Id: 04d5cf1c-7e08-4454-e7f0-08dcef381fc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WvfrIRCagXW6lgJodzE7r8+87vi5sXwmT8XO/FYX2Cf2Di7UTyd7Dgx/pF1X?=
 =?us-ascii?Q?I4nlnL3WsODVAG8E7VU4lSHlkyNE4XE77X3Mqck35WVjJFyh9zRzJLOKNzcK?=
 =?us-ascii?Q?iRSS/wP0lTpu9p8O0PC3sQDn8tE0p9azg1Q/UHWUmfebYLvmKB/x3dPxa+G3?=
 =?us-ascii?Q?AvhJSGgFpzJa3OqHzzb/28ZOlCKLaPR2ppxLEkWdjMbpNkrvBfqs2PbuGStj?=
 =?us-ascii?Q?Lyg+7WQ/bJbKBlYYHEKn4k79+koRsOCkjEL2Q0jLdDYcTJ2dstJ7aWcyg8Mo?=
 =?us-ascii?Q?9JwKQdNkM/rU8UqRUReK4pPvBy+k3AuvaNOo1S4PCShb0GWh3Vqr1NadIc2U?=
 =?us-ascii?Q?DYNzNhdMqarApYPWHlAFYauICPVW+AigPC8o1Yrt8Dg2Mzos7bC77vTRefNz?=
 =?us-ascii?Q?HqWtwcQd4vXvyzNoxgLEL22sufiOtFstA0g/yO+mjnJ4J06nVhOgWhA5zgh6?=
 =?us-ascii?Q?4x9B0p5yOYzT+LOOiUb4Cwc/amcnZcWaHgky07qGwLoK6WwUBgHLvoKRd3M1?=
 =?us-ascii?Q?yn6hBfNer7k3CIHU0WqozOST7ez7AgFbiFjIjehLl6qgkte8Z9Y5TvAaqhqA?=
 =?us-ascii?Q?a1y88EHgd3sbHRANwq84uD/WfnPabWzvONvfgbAf5cKCjG4onMBu4FVEMNzW?=
 =?us-ascii?Q?BTWCpLsIvPigJmSksAvm/azVsEICofbRkBBCWjTF5y/xs6ZLZIgJzhYdc2ex?=
 =?us-ascii?Q?xNpbgZIdLdkstRY28WEqzLVVWAVilMVOCT7LsBeAPWsrVOZ/Sw4WqSzCwhos?=
 =?us-ascii?Q?LZzrtqI4t3cTIKAhrPLpubYLwVCvkPQxQTL8KLhf1MaGPLHoI5cVKDVNAAZG?=
 =?us-ascii?Q?AM6e8r2vLV/+pyIHH++SEsfMavHnfeqBaH4j+UMEfSQ/eCrCum1XAfyC0bPX?=
 =?us-ascii?Q?ZLU4TIa4abqVrlSWINEeehvY15e1bUrnIBy3bdFJh0xO+/HHh8G0GAEJRGzG?=
 =?us-ascii?Q?jB19gNNX3LI9PJUzkLHieGr3DhQ8fydia4jpwynv8P/efE7tv2N+G13yggS9?=
 =?us-ascii?Q?24Yygi9TWntn/L6jDNv4omYS56thVNa6OzOkmSLRNpCe9FF+8e+7hAopOVBQ?=
 =?us-ascii?Q?4pG4J5mlbt8jHTnW3pjkzvsWXc3JntE/RKWsZcZoGZd1iQVsW2LIxGClT4Vw?=
 =?us-ascii?Q?t/38ORfXkwjjGjC1jvsq/5UygqzlzWaOLU6LmamWmeTQOWLvgy7GUJMINO8M?=
 =?us-ascii?Q?aCASxgMlemJuOJYPGmU978ly0NqjPOwPV+9rzvHFLRqEq3eazZhM9EQn9T/6?=
 =?us-ascii?Q?aff8w3WTdYCk2aiXWpk5x6YSlQ7kotz++cykMxwc1uFdrtWfv5+DncndviLa?=
 =?us-ascii?Q?voAGBKD6sWk5sruimLKmSNTlmOdMLsExE2KLOHX+VyHlx4suyx+2TniJt9s+?=
 =?us-ascii?Q?kIFGDuI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kh3FGxBie9ilP2sqY89/KKJF03yfbnGjatde1c98iw7FRsDOQZLhrfxPOrIk?=
 =?us-ascii?Q?wLapakohB1rBlmiLVM77T+cFJugtc50JT5M68jhQbch57g4PxDiqyK2gokXr?=
 =?us-ascii?Q?ru5nBbWk9Fg9G5QP/M+kGbUAB0/DwI61FQdYrNfxazbbFtjZ6kelVhkkhL8l?=
 =?us-ascii?Q?myajekf7A5+DAipSccSA8G+lCCN0FWPian97znnrQ0S4J/QIHUxByA/Wu0O0?=
 =?us-ascii?Q?LAHCD4OEqx0NFbA8RXoZc61N0JaW+Z0Htd0Fzx4ijqmObbpVXv1XbjL3wqnH?=
 =?us-ascii?Q?jo5FrORIJpq3wHbyg/jn6SCMnBIe3moJvTM0TIH5buECPp/T62geIXt5TuJ5?=
 =?us-ascii?Q?GBdZp7fz5usFFSOrB+kTL9z8RJVCZaMXzCotjx60T9GVOCZujeoFWFJZi8IM?=
 =?us-ascii?Q?HxOf8wEtr/EqoSm11czDqAuUB0ec5QhCZxuGCt9LHxb9pjyyaKFTBYY/69Up?=
 =?us-ascii?Q?p8GHZekPrlcVWro4uYolcfrzCNgc45UBsLOG3W2o/1tMdvA7IgjPqOdFfvcI?=
 =?us-ascii?Q?jFooyRVvaMSjDXCx6hsb9ML1waKDHhZi/ca4d2WEkgXbuEvxNK2IVpt2paA0?=
 =?us-ascii?Q?o6vObA8VGID2tubCpW6KjKnHv/RpHvP4HYrfSdFFeE1Re/ifwwhCFMd8H8Ha?=
 =?us-ascii?Q?zVWYyUbmnaR575Gcs2iTto1pO/43fruWtE0C42cGHNYQIkYVTdvTqvrXqJUN?=
 =?us-ascii?Q?zKK9Fg4KU93Q15yJpnfeek4RzFyCKUv67ZQOx4a7AxdHOmJ+Kk1t1fuX2a0O?=
 =?us-ascii?Q?/q1IARGTqK/flyTrDgNZ8G+koOety/5sEOdH4YZYfqC3Rnv+we6jRBVuoOWU?=
 =?us-ascii?Q?WbnP1nQiu5ltMHi6yNnb/4WgE6uKSPncGCdF26jKMTXYEg+dmqA3FQ1Fl64u?=
 =?us-ascii?Q?GDSVj4IYGL1HqMBoksZ/JSBwGhwUdOi2dgtOIIR+PEt1mPPRmebvItXzgc0N?=
 =?us-ascii?Q?HM3Lt33uCk3lMKH1qlxzo+70fH3poYK7DlRV9D9yeOtuYzpFhcTswBLX75La?=
 =?us-ascii?Q?j9RUW0DWmMmaGIyepgkom7WftSd3JXo0qQs86+e63KY0LXHI3wLtHqpEOYuA?=
 =?us-ascii?Q?rMP5mrt32YSkbmj0cwWuksCvMRDRzJ+z29j8qDMXxNBPvh8Vh5VpgvlnJHin?=
 =?us-ascii?Q?bXFw1MidF3jifiSP4YHhXfU7ZRLXoP6PERPSvdneCfKyiAjTHZCIrrwXvAFC?=
 =?us-ascii?Q?Jvso8ISrONexfaYEqQlTKxg+4D0hIocs/p6hW+QpaQdcADWCNR596H2HCArZ?=
 =?us-ascii?Q?SsgSBmW86iUBEUMpYKYfNtfgGs1LhwUA2a8NPNsfy5oqmSwkBMZL80lFJwsx?=
 =?us-ascii?Q?KrYWCjbiZ0BAz9kkY5xVk6lI4hh8JG4J+l/8agdoOa/V2PuMXUm6rSNEPIxQ?=
 =?us-ascii?Q?u7sfvmQjsZ2i9689awxUi4t7p6Mtv1jpbVIdvx3FjDoaO26iQUPydtePHkhH?=
 =?us-ascii?Q?yzGyisp7YA9h5NwBwFX/Nnp6I5DNt0VUJ3TXw5VXoi3TR0W63qYNPfFNRVbj?=
 =?us-ascii?Q?0sqRX68wF0ft59e0HUodmcHV2o38dMinb+w3Hw1fcdfXZlPCebu8HCr9+kQD?=
 =?us-ascii?Q?7she2CW1ARA14+FvPqvrpS3EDxnf0hda8WLaHf6T?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d5cf1c-7e08-4454-e7f0-08dcef381fc1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 05:45:51.1571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wO+OUdwEYc8HR+W5VTIl/VMc4mwdEyXPlsRWJvsNr2Ekkz0xEy480E2Zerx+eCqtdbOBUtiqc2hMPqaea/2N3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8537

This control represents a generic read/write region.
It supports V4L2_CTRL_WHICH_MIN/MAX_VAL.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: TaoJiang <tao.jiang_2@nxp.com>
---
 .../media/test-drivers/vivid/vivid-ctrls.c    | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index bed5f4fb0c69..6ea64bea13de 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -38,6 +38,7 @@
 #define VIVID_CID_S32_ARRAY		(VIVID_CID_CUSTOM_BASE + 15)
 #define VIVID_CID_S64_ARRAY		(VIVID_CID_CUSTOM_BASE + 16)
 #define VIVID_CID_RECT			(VIVID_CID_CUSTOM_BASE + 17)
+#define VIVID_CID_REGION		(VIVID_CID_CUSTOM_BASE + 18)
 
 #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
 #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
@@ -393,6 +394,32 @@ static const struct v4l2_ctrl_config vivid_ctrl_rect = {
 	.p_max.p_const = &rect_max,
 };
 
+static const struct v4l2_ctrl_video_region_param region_def = {
+	.rect = { 0, 0, 0, 0 },
+	.parameter = 0,
+};
+
+static const struct v4l2_ctrl_video_region_param region_min = {
+	.rect = { 0, 0, 0, 0 },
+	.parameter = -51,
+};
+
+static const struct v4l2_ctrl_video_region_param region_max = {
+	.rect = { 0, 0, 1920, 1080 },
+	.parameter = 51,
+};
+
+static const struct v4l2_ctrl_config vivid_ctrl_region = {
+	.ops = &vivid_user_gen_ctrl_ops,
+	.id = VIVID_CID_REGION,
+	.name = "Region",
+	.type = V4L2_CTRL_TYPE_REGION,
+	.flags = V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX,
+	.p_def.p_const = &region_def,
+	.p_min.p_const = &region_min,
+	.p_max.p_const = &region_max,
+};
+
 /* Framebuffer Controls */
 
 static int vivid_fb_s_ctrl(struct v4l2_ctrl *ctrl)
@@ -1719,6 +1746,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 	dev->ro_int32 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_ro_int32, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_area, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_rect, NULL);
+	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_region, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);
-- 
2.43.0-rc1


