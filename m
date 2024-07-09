Return-Path: <linux-media+bounces-14739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0CA92B2A6
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 10:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A5872810F6
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 08:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED4D5153569;
	Tue,  9 Jul 2024 08:54:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2131.outbound.protection.partner.outlook.cn [139.219.17.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BFE28DB3;
	Tue,  9 Jul 2024 08:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720515268; cv=fail; b=ImSAEt9jaUOKIstU5oQBLYe62B4rFB6eMwK67tIdRThT1E/c2Cr7WzzhX1yfvV5LNeCJ5NFwyp4o0eB6nPxRKdmKzHd1Z7oacQaMnN+vITeON7rbeKp6q/Tu7m8gi3bsUlrXF2rclPdDpqYZNEe4VDWVlNlHR562sZnmKdg8GlU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720515268; c=relaxed/simple;
	bh=O2TpQH3aYr58MdlMZd0isYo1hG/MrS/qWM/6mVNG860=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uQdx5qsop9zQL06PH1Bh/dZuBwJjloW+6ULJX+hN+R3nXDh0fKuuIs6gcj5MlO+hugG6/Y2QXxPwzLStgRfimQkurlaXrjnwX8LgND1dpRgJB1/BmMfdttnGUzNt81MGkl3JCALEdKLI/EaSritHM4g2zDzuxlZkbx66uZMJbTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbywRAkctt2rsaZtEapae2RKIn20LKMIJ9Kp0lnila0JbJTtdzyilvkIMKtrDpdtbJflg+81N52IAoSqrHRu7LsxGaW522kyH7Xfkkr1lCY/AYvyvvzugsaOOgZwSaCEoK4xrRUWwXJSjSDqX4T+QVc8WB0csFCHEK8zsOUCUp1ixVB0ZSlZOlThdoH34VNc3R8Lsm22tJUfGXVwdZrY+rM7KyDVmvFS57zneuf3o17f3B8qOIxVyleka1mlZQbAqDpuvKL/i1zlZOQspKUYLLv1MJRat6lnIs07bj+isyzz9VP5xsd3QiC/LZ33vBXJvMrHy0Hl71UP/yH3XQ62dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jg8t6KA6xXaAbxDKOd9ejurVsKOaesP3cweja2TCY+4=;
 b=EC8790c5N4gM9Ov4x/92g7ISxuysJEYAespMAnyWmP7gUSekDI+NynMm/rn0dojZ96+pRImLHocOJrMrdvGySuOL43J91JgqjH9lXD0RK5rqZg3NJP1USkoA2TfyX4AWmTojeja79k6iotMb6ZyeMQmgV9aqnEL0eIkzP2nb5JUkTO1ghy6WkuaGU+1oF/ii/ckzsilboIK/JYhdaPK97lNfMfCWkVjUmb4MBID/1/y0Hg0IIIZZby2mc2D7fN7VNl7tEIxO1sxlqNWaunGshIaDryyWL3OJGvSv8CePX+nYe55gu7EL0H6ASNwm5i/59LLddVvJS2DE6qGnlmx+lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1271.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:18::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.37; Tue, 9 Jul
 2024 08:38:36 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.7741.033; Tue, 9 Jul 2024 08:38:36 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mingjia Zhang <mingjia.zhang@mediatek.com>
Cc: Jack Zhu <jack.zhu@starfivetech.com>,
	Keith Zhao <keith.zhao@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 04/14] staging: media: starfive: Add a params sink pad and a scd source pad for ISP
Date: Tue,  9 Jul 2024 01:38:14 -0700
Message-Id: <20240709083824.430473-5-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
References: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0031.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::16) To ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1271:EE_
X-MS-Office365-Filtering-Correlation-Id: e00b2c81-c1c9-4575-912b-08dc9ff28677
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|41320700013|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	UaFKij3yCnhLI+aaMuDZiCKi0+v6dhC+6QdbvQdDIfariXivCsboDRrSSuIwxd8htrwywM25mE8KCiBLl6sL8KkXGa01hdVRO52vznYnanXqYSiYzDyEUdRSBo5/617frgysMwCaV9aucZvkfZGmWfssx4IPNZ1vL6jU2TNimHVKuMYsXOdeMf29XvMt8LtIpLDvFYUgq4tNRfSnrBGSAhK/ThDaNu8NHnkgDgvFqCmLbvx01KHt1Z7oKLVJgQORBM5vcZ5vzxc0na73WkuM2xyIMXAY0Ayt4IuNPIj2nWVlbitcG6VV+leKptnPEWgErYvTJPHQfsMSyvYmEd3f+O/r+t2SpKxDvVf1Ovm6kyRs0jocrqFIwykRA5DvDsr2TMFA3Vb+PM4pej2D8WFVjPf9ZHZK2YLJWnp9ohf+oGi1l0cuca93NdTDy6Wf14j9LcMuf9f+bfQSEZtyLjeuFhdH7Knlr2+wbMs+hBbNasrUP2to6Pd1jIQxdk7ut3rGNRthvnq40No33zE+gBOgOU/NZ5nA9qw+fxDfVTrmJMYSQMbGMSPQqfkLDoJGV6K85a9PJHFMuagxS/9TWUb9BDyTVKZXKxn66Ldbc9FckIfYHANTAEp5TyxFLsULUCep
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1GJWlKsuwPnhNPcu1eSzoIPb337lJBj7+X8ERquJisrywN58QD3oBNjww6Mx?=
 =?us-ascii?Q?d703mzMyq9P9gJtR1tVXzHpxmLQFdRQWTZLk+KWz05ZvEU7Tkzgsl9O946S+?=
 =?us-ascii?Q?4MLJsGlpid1iANGX3GrKGeEWJ4Sutc7G/G3Se+IOz48u8iW8UAAW3P2yo+Je?=
 =?us-ascii?Q?bLCbPThr4krimo1HTeOEJpMfPcoZrUGvScnz3qzXTRzhR4ib/68D/IgaWJ2Z?=
 =?us-ascii?Q?mRVbnzUXvaC5NSAAXdB2LSWM264TFqN9ExJ3vQ5+uIx4ylvt9arBiB6DQOKG?=
 =?us-ascii?Q?mgyYq42ybanWLqC6trvKAI6WsJU/LrAHoTdGQhm3pqPi60ceRCjSzd8ArmyL?=
 =?us-ascii?Q?Idh08kl34DM3n/Pw9ElVRs0ec+i+qzc2ACCrwYalkrUmYFNq0RHo/FyohaXf?=
 =?us-ascii?Q?20yWQUUPJ9/9aDuOuayMTrlN7E3Q/xZrCCCHXAsxEl3OYcVlUwXECP/Pkudu?=
 =?us-ascii?Q?xL0ecpp3EL170RSceSJ9umuugcInkV0mq/hRRuNP6pEC//zSmxYCxh6p6vx6?=
 =?us-ascii?Q?NOfQNLoKI6ArvnD9pN04PNumHRO7I6ffWvIdOeh9whdkX3NloKrb+I4+b3nb?=
 =?us-ascii?Q?Cu6fFUFB2+v0EBp6gLfZD77a7svDWROvsNoSuqjdHCJhQW1n0ACfyQGbtCxc?=
 =?us-ascii?Q?cg3MQ7BQ9NU+9Y+gkZnG8yUvVlQHqMRGd5AONbpapJEdzoheRyFv0Syx29LA?=
 =?us-ascii?Q?Kn5ASWN2aTMYOJOcl8PgpfDyRHZDY6odHkPSZ/xmg5I6bTtVVd/YngN3hII/?=
 =?us-ascii?Q?Wz2AJdZsI47DH+h4D8VqDfTNTvOlS+pExjooLciT7ZjsO2K7sBAr8KytMo/7?=
 =?us-ascii?Q?X8f6/Egaw9d04aryTbkJCfhk9autMpanSsRQEl3k/RDA8yDEe8r9p/wTD6xg?=
 =?us-ascii?Q?5a4I8212CIza34dlSqXhleSxjNdMWn/JnyVqL6rGD4kAzrrjY1INTXdZV/70?=
 =?us-ascii?Q?jiCPF62kpTqRvSb8omYiNew0hp2bxcVAwTUZqlunVmiAku+7z649f2HcXxKO?=
 =?us-ascii?Q?Xxth/cb0/CV0QfprAeFKTVjjVsYMs0JJGcs1IQl0oI7WDGawcTe4TnM5lKoJ?=
 =?us-ascii?Q?mAg2rv2AQlsxZITE5JEM37Z/w/zYBRdMa5gYEkaIOukZ1F28SoI4kXDM2/mS?=
 =?us-ascii?Q?R60QBKKWXFRoxW4cMTlYgVXGoio+ghcqViTeIqiDyS3QaG3mY4Lx5u/QGWLi?=
 =?us-ascii?Q?rLvQeUkm4b1GYe1iZZ9hUxDIdk+6YGc93va3wQXLIgkWjVUdzcAVoQMCUcvv?=
 =?us-ascii?Q?JJ1psyKbWr+9ANbNjiw1wsPpvtFNNNfVnXr+rA+9JNO6L/T0bxCz88eYjaxr?=
 =?us-ascii?Q?2h3ZwxCLczNACEWl/K7dfzqwhbfM9ELSLP/tWXESBSb9OEs/3rLKmqmC8nym?=
 =?us-ascii?Q?SsaYqjIKERPi+iHSwfD/rkFdABa5kOpbCav4g/q1CqcE4SUaBENHLCDRJgZ4?=
 =?us-ascii?Q?fIBmHd5ldlo5BYtb8PM2qvEckRmjT4/pRMkYnGXuKnIWjcUaKmLcyJ7wFqGD?=
 =?us-ascii?Q?JSBTZxKx+7WmFnd7GIsP8ZmgfofunoKWi6HK0dK/7jSlQkk1FDWtuyHSPu8h?=
 =?us-ascii?Q?1lUsVQj2ptCAUP6n7Vtyor5Bg3ML+UHhe1q7G5iA8U9be0As4pJfbYL6JFej?=
 =?us-ascii?Q?TLkaQryqF0xGzhXxAKet2aw=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e00b2c81-c1c9-4575-912b-08dc9ff28677
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 08:38:36.7851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QqvAFyrJoZ7lEqjlc4Wg77A52/q64iJgyhews/FAb2gD3TEuRAxYRatgZ72hKXc+qwFd99yKjzyfFKzZ3tFZEJkTsJE283gj3uIGh6WrnTUUgdOOsuusZUMc0fKZvUSx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1271

StarFive ISP can use params sink pad to transmit ISP parameters and use
scd source pad to capture statistics collection data.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../staging/media/starfive/camss/stf-isp.c    | 77 +++++++++++++++++--
 .../staging/media/starfive/camss/stf-isp.h    |  2 +
 2 files changed, 71 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/starfive/camss/stf-isp.c b/drivers/staging/media/starfive/camss/stf-isp.c
index 4e6e26736852..0ebffd09842a 100644
--- a/drivers/staging/media/starfive/camss/stf-isp.c
+++ b/drivers/staging/media/starfive/camss/stf-isp.c
@@ -21,13 +21,23 @@ static const struct stf_isp_format isp_formats_sink[] = {
 	{ MEDIA_BUS_FMT_SBGGR10_1X10, 10 },
 };
 
+static const struct stf_isp_format isp_formats_sink_params[] = {
+	{ MEDIA_BUS_FMT_METADATA_FIXED },
+};
+
 static const struct stf_isp_format isp_formats_source[] = {
 	{ MEDIA_BUS_FMT_YUYV8_1_5X8, 8 },
 };
 
+static const struct stf_isp_format isp_formats_source_scd[] = {
+	{ MEDIA_BUS_FMT_METADATA_FIXED },
+};
+
 static const struct stf_isp_format_table isp_formats_st7110[] = {
 	{ isp_formats_sink, ARRAY_SIZE(isp_formats_sink) },
+	{ isp_formats_sink_params, ARRAY_SIZE(isp_formats_sink_params) },
 	{ isp_formats_source, ARRAY_SIZE(isp_formats_source) },
+	{ isp_formats_source_scd, ARRAY_SIZE(isp_formats_source_scd) },
 };
 
 static const struct stf_isp_format *
@@ -93,13 +103,19 @@ static void isp_try_format(struct stf_isp_dev *isp_dev,
 
 	formats = &isp_dev->formats[pad];
 
-	fmt->width = clamp_t(u32, fmt->width, STFCAMSS_FRAME_MIN_WIDTH,
-			     STFCAMSS_FRAME_MAX_WIDTH);
-	fmt->height = clamp_t(u32, fmt->height, STFCAMSS_FRAME_MIN_HEIGHT,
-			      STFCAMSS_FRAME_MAX_HEIGHT);
-	fmt->height &= ~0x1;
+	if (pad != STF_ISP_PAD_SRC_SCD && pad != STF_ISP_PAD_SINK_PARAMS) {
+		fmt->width = clamp_t(u32, fmt->width, STFCAMSS_FRAME_MIN_WIDTH,
+				     STFCAMSS_FRAME_MAX_WIDTH);
+		fmt->height = clamp_t(u32, fmt->height, STFCAMSS_FRAME_MIN_HEIGHT,
+				      STFCAMSS_FRAME_MAX_HEIGHT);
+		fmt->height &= ~0x1;
+		fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	} else {
+		fmt->width = 1;
+		fmt->height = 1;
+	}
+
 	fmt->field = V4L2_FIELD_NONE;
-	fmt->colorspace = V4L2_COLORSPACE_SRGB;
 	fmt->flags = 0;
 
 	if (!stf_g_fmt_by_mcode(formats, fmt->code))
@@ -119,7 +135,7 @@ static int isp_enum_mbus_code(struct v4l2_subdev *sd,
 
 		formats = &isp_dev->formats[code->pad];
 		code->code = formats->fmts[code->index].code;
-	} else {
+	} else if (code->pad == STF_ISP_PAD_SRC) {
 		struct v4l2_mbus_framefmt *sink_fmt;
 
 		if (code->index >= ARRAY_SIZE(isp_formats_source))
@@ -131,6 +147,10 @@ static int isp_enum_mbus_code(struct v4l2_subdev *sd,
 		code->code = sink_fmt->code;
 		if (!code->code)
 			return -EINVAL;
+	} else {
+		if (code->index > 0)
+			return -EINVAL;
+		code->code = MEDIA_BUS_FMT_METADATA_FIXED;
 	}
 	code->flags = 0;
 
@@ -151,6 +171,9 @@ static int isp_set_format(struct v4l2_subdev *sd,
 	isp_try_format(isp_dev, state, fmt->pad, &fmt->format);
 	*format = fmt->format;
 
+	if (fmt->pad == STF_ISP_PAD_SRC_SCD || fmt->pad == STF_ISP_PAD_SINK_PARAMS)
+		return 0;
+
 	isp_dev->current_fmt = stf_g_fmt_by_mcode(&isp_dev->formats[fmt->pad],
 						  fmt->format.code);
 
@@ -202,6 +225,9 @@ static int isp_get_selection(struct v4l2_subdev *sd,
 	struct v4l2_subdev_format fmt = { 0 };
 	struct v4l2_rect *rect;
 
+	if (sel->pad == STF_ISP_PAD_SRC_SCD || sel->pad == STF_ISP_PAD_SINK_PARAMS)
+		return -EINVAL;
+
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP_BOUNDS:
 		if (sel->pad == STF_ISP_PAD_SINK) {
@@ -239,6 +265,9 @@ static int isp_set_selection(struct v4l2_subdev *sd,
 	struct stf_isp_dev *isp_dev = v4l2_get_subdevdata(sd);
 	struct v4l2_rect *rect;
 
+	if (sel->pad == STF_ISP_PAD_SRC_SCD || sel->pad == STF_ISP_PAD_SINK_PARAMS)
+		return -EINVAL;
+
 	if (sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
 
@@ -296,8 +325,38 @@ static int isp_init_formats(struct v4l2_subdev *sd,
 			.height = 1080
 		}
 	};
+	struct v4l2_subdev_format format_params = {
+		.pad = STF_ISP_PAD_SINK_PARAMS,
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.format = {
+			.code = MEDIA_BUS_FMT_METADATA_FIXED,
+			.width = 1,
+			.height = 1
+		}
+	};
+	struct v4l2_subdev_format format_scd = {
+		.pad = STF_ISP_PAD_SRC_SCD,
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.format = {
+			.code = MEDIA_BUS_FMT_METADATA_FIXED,
+			.width = 1,
+			.height = 1
+		}
+	};
+	int ret;
+
+	/* Init for STF_ISP_PAD_SINK and STF_ISP_PAD_SRC pad */
+	ret = isp_set_format(sd, sd_state, &format);
+	if (ret < 0)
+		return ret;
+
+	/* Init for STF_ISP_PAD_SINK_PARAMS pad */
+	ret = isp_set_format(sd, sd_state, &format_params);
+	if (ret < 0)
+		return ret;
 
-	return isp_set_format(sd, sd_state, &format);
+	/* Init for STF_ISP_PAD_SRC_SCD pad */
+	return isp_set_format(sd, sd_state, &format_scd);
 }
 
 static const struct v4l2_subdev_video_ops isp_video_ops = {
@@ -338,7 +397,9 @@ int stf_isp_register(struct stf_isp_dev *isp_dev, struct v4l2_device *v4l2_dev)
 	v4l2_set_subdevdata(sd, isp_dev);
 
 	pads[STF_ISP_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	pads[STF_ISP_PAD_SINK_PARAMS].flags = MEDIA_PAD_FL_SINK;
 	pads[STF_ISP_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
+	pads[STF_ISP_PAD_SRC_SCD].flags = MEDIA_PAD_FL_SOURCE;
 
 	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
 	sd->entity.ops = &isp_media_ops;
diff --git a/drivers/staging/media/starfive/camss/stf-isp.h b/drivers/staging/media/starfive/camss/stf-isp.h
index 955cbb048363..bc7e7b0736fa 100644
--- a/drivers/staging/media/starfive/camss/stf-isp.h
+++ b/drivers/staging/media/starfive/camss/stf-isp.h
@@ -392,7 +392,9 @@
 /* pad id for media framework */
 enum stf_isp_pad_id {
 	STF_ISP_PAD_SINK = 0,
+	STF_ISP_PAD_SINK_PARAMS,
 	STF_ISP_PAD_SRC,
+	STF_ISP_PAD_SRC_SCD,
 	STF_ISP_PAD_MAX
 };
 
-- 
2.25.1


