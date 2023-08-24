Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB10786943
	for <lists+linux-media@lfdr.de>; Thu, 24 Aug 2023 10:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240372AbjHXIBz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 24 Aug 2023 04:01:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237437AbjHXIBY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Aug 2023 04:01:24 -0400
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 537A6170B;
        Thu, 24 Aug 2023 01:01:19 -0700 (PDT)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
        by ex01.ufhost.com (Postfix) with ESMTP id E988F24E33F;
        Thu, 24 Aug 2023 16:01:12 +0800 (CST)
Received: from EXMBX073.cuchost.com (172.16.6.83) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 24 Aug
 2023 16:01:13 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX073.cuchost.com
 (172.16.6.83) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 24 Aug
 2023 16:01:12 +0800
From:   Jack Zhu <jack.zhu@starfivetech.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        <bryan.odonoghue@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-staging@lists.linux.dev>,
        <jack.zhu@starfivetech.com>, <changhuang.liang@starfivetech.com>
Subject: [PATCH v8 5/8] media: staging: media: starfive: camss: Add ISP driver
Date:   Thu, 24 Aug 2023 16:01:06 +0800
Message-ID: <20230824080109.89613-6-jack.zhu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230824080109.89613-1-jack.zhu@starfivetech.com>
References: <20230824080109.89613-1-jack.zhu@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX073.cuchost.com
 (172.16.6.83)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add ISP driver for StarFive Camera Subsystem.

Signed-off-by: Jack Zhu <jack.zhu@starfivetech.com>
---
 drivers/staging/media/starfive/camss/Makefile |   2 +
 .../staging/media/starfive/camss/stf_camss.h  |   3 +
 .../staging/media/starfive/camss/stf_isp.c    | 407 ++++++++++++++++
 .../staging/media/starfive/camss/stf_isp.h    | 428 +++++++++++++++++
 .../media/starfive/camss/stf_isp_hw_ops.c     | 445 ++++++++++++++++++
 5 files changed, 1285 insertions(+)
 create mode 100644 drivers/staging/media/starfive/camss/stf_isp.c
 create mode 100644 drivers/staging/media/starfive/camss/stf_isp.h
 create mode 100644 drivers/staging/media/starfive/camss/stf_isp_hw_ops.c

diff --git a/drivers/staging/media/starfive/camss/Makefile b/drivers/staging/media/starfive/camss/Makefile
index eb457917a914..cdf57e8c9546 100644
--- a/drivers/staging/media/starfive/camss/Makefile
+++ b/drivers/staging/media/starfive/camss/Makefile
@@ -5,6 +5,8 @@
 
 starfive-camss-objs += \
 		stf_camss.o \
+		stf_isp.o \
+		stf_isp_hw_ops.o \
 		stf_video.o
 
 obj-$(CONFIG_VIDEO_STARFIVE_CAMSS) += starfive-camss.o
diff --git a/drivers/staging/media/starfive/camss/stf_camss.h b/drivers/staging/media/starfive/camss/stf_camss.h
index 6110433e59f7..e0f7ee9f2583 100644
--- a/drivers/staging/media/starfive/camss/stf_camss.h
+++ b/drivers/staging/media/starfive/camss/stf_camss.h
@@ -18,6 +18,8 @@
 #include <media/v4l2-async.h>
 #include <media/v4l2-device.h>
 
+#include "stf_isp.h"
+
 enum stf_port_num {
 	STF_PORT_DVP = 0,
 	STF_PORT_CSI2RX
@@ -49,6 +51,7 @@ struct stfcamss {
 	struct media_device media_dev;
 	struct media_pipeline pipe;
 	struct device *dev;
+	struct stf_isp_dev isp_dev;
 	struct v4l2_async_notifier notifier;
 	void __iomem *syscon_base;
 	void __iomem *isp_base;
diff --git a/drivers/staging/media/starfive/camss/stf_isp.c b/drivers/staging/media/starfive/camss/stf_isp.c
new file mode 100644
index 000000000000..7d9740965e7e
--- /dev/null
+++ b/drivers/staging/media/starfive/camss/stf_isp.c
@@ -0,0 +1,407 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * stf_isp.c
+ *
+ * StarFive Camera Subsystem - ISP Module
+ *
+ * Copyright (C) 2021-2023 StarFive Technology Co., Ltd.
+ */
+#include <media/v4l2-rect.h>
+
+#include "stf_camss.h"
+
+#define SINK_FORMATS_INDEX	0
+#define SOURCE_FORMATS_INDEX	1
+
+static int isp_set_selection(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state,
+			     struct v4l2_subdev_selection *sel);
+
+static const struct stf_isp_format isp_formats_sink[] = {
+	{ MEDIA_BUS_FMT_SRGGB10_1X10, 10 },
+	{ MEDIA_BUS_FMT_SGRBG10_1X10, 10 },
+	{ MEDIA_BUS_FMT_SGBRG10_1X10, 10 },
+	{ MEDIA_BUS_FMT_SBGGR10_1X10, 10 },
+};
+
+static const struct stf_isp_format isp_formats_source[] = {
+	{ MEDIA_BUS_FMT_YUYV8_1_5X8, 8 },
+};
+
+static const struct stf_isp_format_table isp_formats_st7110[] = {
+	{ isp_formats_sink, ARRAY_SIZE(isp_formats_sink) },
+	{ isp_formats_source, ARRAY_SIZE(isp_formats_source) },
+};
+
+static const struct stf_isp_format *
+stf_g_fmt_by_mcode(const struct stf_isp_format_table *fmt_table, u32 mcode)
+{
+	unsigned int i;
+
+	for (i = 0; i < fmt_table->nfmts; i++) {
+		if (fmt_table->fmts[i].code == mcode)
+			return &fmt_table->fmts[i];
+	}
+
+	return NULL;
+}
+
+int stf_isp_init(struct stfcamss *stfcamss)
+{
+	struct stf_isp_dev *isp_dev = &stfcamss->isp_dev;
+
+	isp_dev->stfcamss = stfcamss;
+	isp_dev->formats = isp_formats_st7110;
+	isp_dev->nformats = ARRAY_SIZE(isp_formats_st7110);
+	isp_dev->current_fmt = &isp_formats_source[0];
+
+	return 0;
+}
+
+static int isp_set_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct stf_isp_dev *isp_dev = v4l2_get_subdevdata(sd);
+	struct v4l2_subdev_state *sd_state;
+	struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_rect *crop;
+
+	sd_state = v4l2_subdev_lock_and_get_active_state(sd);
+	fmt = v4l2_subdev_get_pad_format(sd, sd_state, STF_ISP_PAD_SINK);
+	crop = v4l2_subdev_get_pad_crop(sd, sd_state, STF_ISP_PAD_SRC);
+
+	if (enable) {
+		stf_isp_reset(isp_dev);
+		stf_isp_init_cfg(isp_dev);
+		stf_isp_settings(isp_dev, crop, fmt->code);
+		stf_isp_stream_set(isp_dev);
+	}
+
+	v4l2_subdev_call(isp_dev->source_subdev, video, s_stream, enable);
+
+	v4l2_subdev_unlock_state(sd_state);
+	return 0;
+}
+
+static void isp_try_format(struct stf_isp_dev *isp_dev,
+			   struct v4l2_subdev_state *state,
+			   unsigned int pad,
+			   struct v4l2_mbus_framefmt *fmt)
+{
+	const struct stf_isp_format_table *formats;
+
+	if (pad >= STF_ISP_PAD_MAX) {
+		fmt->colorspace = V4L2_COLORSPACE_SRGB;
+		return;
+	}
+
+	if (pad == STF_ISP_PAD_SINK)
+		formats = &isp_dev->formats[SINK_FORMATS_INDEX];
+	else if (pad == STF_ISP_PAD_SRC)
+		formats = &isp_dev->formats[SOURCE_FORMATS_INDEX];
+
+	fmt->width = clamp_t(u32, fmt->width, STFCAMSS_FRAME_MIN_WIDTH,
+			     STFCAMSS_FRAME_MAX_WIDTH);
+	fmt->height = clamp_t(u32, fmt->height, STFCAMSS_FRAME_MIN_HEIGHT,
+			      STFCAMSS_FRAME_MAX_HEIGHT);
+	fmt->height &= ~0x1;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	fmt->flags = 0;
+
+	if (!stf_g_fmt_by_mcode(formats, fmt->code))
+		fmt->code = formats->fmts[0].code;
+}
+
+static int isp_enum_mbus_code(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state,
+			      struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct stf_isp_dev *isp_dev = v4l2_get_subdevdata(sd);
+	const struct stf_isp_format_table *formats;
+
+	if (code->pad == STF_ISP_PAD_SINK) {
+		formats = &isp_dev->formats[SINK_FORMATS_INDEX];
+		code->code = formats->fmts[code->index].code;
+	} else {
+		struct v4l2_mbus_framefmt *sink_fmt;
+
+		sink_fmt = v4l2_subdev_get_pad_format(sd, state,
+						      STF_ISP_PAD_SRC);
+
+		code->code = sink_fmt->code;
+		if (!code->code)
+			return -EINVAL;
+	}
+	code->flags = 0;
+
+	return 0;
+}
+
+static int isp_enum_frame_size(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_state *state,
+			       struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct stf_isp_dev *isp_dev = v4l2_get_subdevdata(sd);
+	struct v4l2_mbus_framefmt format;
+
+	if (fse->index != 0)
+		return -EINVAL;
+
+	format.code = fse->code;
+	format.width = 1;
+	format.height = 1;
+	isp_try_format(isp_dev, state, fse->pad, &format);
+	fse->min_width = STFCAMSS_FRAME_MIN_WIDTH;
+	fse->min_height = STFCAMSS_FRAME_MIN_HEIGHT;
+
+	if (format.code != fse->code)
+		return -EINVAL;
+
+	format.code = fse->code;
+	format.width = -1;
+	format.height = -1;
+	isp_try_format(isp_dev, state, fse->pad, &format);
+	fse->max_width = STFCAMSS_FRAME_MAX_WIDTH;
+	fse->max_height = STFCAMSS_FRAME_MAX_HEIGHT;
+
+	return 0;
+}
+
+static int isp_set_format(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_state *state,
+			  struct v4l2_subdev_format *fmt)
+{
+	struct stf_isp_dev *isp_dev = v4l2_get_subdevdata(sd);
+	struct v4l2_mbus_framefmt *format;
+
+	format = v4l2_subdev_get_pad_format(sd, state, fmt->pad);
+	if (!format)
+		return -EINVAL;
+
+	isp_try_format(isp_dev, state, fmt->pad, &fmt->format);
+	*format = fmt->format;
+
+	isp_dev->current_fmt = stf_g_fmt_by_mcode(&isp_dev->formats[fmt->pad],
+						  fmt->format.code);
+
+	/* Propagate to in crop */
+	if (fmt->pad == STF_ISP_PAD_SINK) {
+		struct v4l2_subdev_selection sel = { 0 };
+
+		/* Reset sink pad compose selection */
+		sel.which = fmt->which;
+		sel.pad = STF_ISP_PAD_SINK;
+		sel.target = V4L2_SEL_TGT_CROP;
+		sel.r.width = fmt->format.width;
+		sel.r.height = fmt->format.height;
+		isp_set_selection(sd, state, &sel);
+	}
+
+	return 0;
+}
+
+static const struct v4l2_rect stf_frame_min_crop = {
+	.width = STFCAMSS_FRAME_MIN_WIDTH,
+	.height = STFCAMSS_FRAME_MIN_HEIGHT,
+	.top = 0,
+	.left = 0,
+};
+
+static void isp_try_crop(struct stf_isp_dev *isp_dev,
+			 struct v4l2_subdev_state *state,
+			 struct v4l2_rect *crop)
+{
+	struct v4l2_mbus_framefmt *fmt =
+		v4l2_subdev_get_pad_format(&isp_dev->subdev, state,
+					   STF_ISP_PAD_SINK);
+
+	const struct v4l2_rect bounds = {
+		.width = fmt->width,
+		.height = fmt->height,
+		.left = 0,
+		.top = 0,
+	};
+
+	v4l2_rect_set_min_size(crop, &stf_frame_min_crop);
+	v4l2_rect_map_inside(crop, &bounds);
+}
+
+static int isp_get_selection(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state,
+			     struct v4l2_subdev_selection *sel)
+{
+	struct v4l2_subdev_format fmt = { 0 };
+	struct v4l2_rect *rect;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		if (sel->pad == STF_ISP_PAD_SINK) {
+			fmt.format = *v4l2_subdev_get_pad_format(sd, state,
+								 sel->pad);
+			sel->r.left = 0;
+			sel->r.top = 0;
+			sel->r.width = fmt.format.width;
+			sel->r.height = fmt.format.height;
+		} else if (sel->pad == STF_ISP_PAD_SRC) {
+			rect = v4l2_subdev_get_pad_crop(sd, state, sel->pad);
+			sel->r = *rect;
+		}
+		break;
+
+	case V4L2_SEL_TGT_CROP:
+		rect = v4l2_subdev_get_pad_crop(sd, state, sel->pad);
+		if (!rect)
+			return -EINVAL;
+
+		sel->r = *rect;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int isp_set_selection(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state,
+			     struct v4l2_subdev_selection *sel)
+{
+	struct stf_isp_dev *isp_dev = v4l2_get_subdevdata(sd);
+	struct v4l2_rect *rect;
+
+	if (sel->target != V4L2_SEL_TGT_CROP)
+		return -EINVAL;
+
+	if (sel->target == V4L2_SEL_TGT_CROP &&
+	    sel->pad == STF_ISP_PAD_SINK) {
+		struct v4l2_subdev_selection crop = { 0 };
+
+		rect = v4l2_subdev_get_pad_crop(sd, state, sel->pad);
+		if (!rect)
+			return -EINVAL;
+
+		isp_try_crop(isp_dev, state, &sel->r);
+		*rect = sel->r;
+
+		/* Reset source crop selection */
+		crop.which = sel->which;
+		crop.pad = STF_ISP_PAD_SRC;
+		crop.target = V4L2_SEL_TGT_CROP;
+		crop.r = *rect;
+		isp_set_selection(sd, state, &crop);
+	} else if (sel->target == V4L2_SEL_TGT_CROP &&
+		   sel->pad == STF_ISP_PAD_SRC) {
+		struct v4l2_subdev_format fmt = { 0 };
+
+		rect = v4l2_subdev_get_pad_crop(sd, state, sel->pad);
+		if (!rect)
+			return -EINVAL;
+
+		isp_try_crop(isp_dev, state, &sel->r);
+		*rect = sel->r;
+
+		/* Reset source pad format width and height */
+		fmt.which = sel->which;
+		fmt.pad = STF_ISP_PAD_SRC;
+		fmt.format.width = rect->width;
+		fmt.format.height = rect->height;
+		isp_set_format(sd, state, &fmt);
+	}
+
+	dev_dbg(isp_dev->stfcamss->dev, "pad: %d sel(%d,%d)/%dx%d\n",
+		sel->pad, sel->r.left, sel->r.top, sel->r.width, sel->r.height);
+
+	return 0;
+}
+
+static int isp_init_formats(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_subdev_format format = {
+		.pad = STF_ISP_PAD_SINK,
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.format = {
+			.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+			.width = 1920,
+			.height = 1080
+		}
+	};
+
+	return isp_set_format(sd, sd_state, &format);
+}
+
+static const struct v4l2_subdev_video_ops isp_video_ops = {
+	.s_stream = isp_set_stream,
+};
+
+static const struct v4l2_subdev_pad_ops isp_pad_ops = {
+	.init_cfg = isp_init_formats,
+	.enum_mbus_code = isp_enum_mbus_code,
+	.enum_frame_size = isp_enum_frame_size,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = isp_set_format,
+	.get_selection = isp_get_selection,
+	.set_selection = isp_set_selection,
+};
+
+static const struct v4l2_subdev_ops isp_v4l2_ops = {
+	.video = &isp_video_ops,
+	.pad = &isp_pad_ops,
+};
+
+static const struct media_entity_operations isp_media_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+int stf_isp_register(struct stf_isp_dev *isp_dev, struct v4l2_device *v4l2_dev)
+{
+	struct v4l2_subdev *sd = &isp_dev->subdev;
+	struct media_pad *pads = isp_dev->pads;
+	int ret;
+
+	v4l2_subdev_init(sd, &isp_v4l2_ops);
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	snprintf(sd->name, ARRAY_SIZE(sd->name), "stf_isp");
+	v4l2_set_subdevdata(sd, isp_dev);
+
+	pads[STF_ISP_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	pads[STF_ISP_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
+
+	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
+	sd->entity.ops = &isp_media_ops;
+	ret = media_entity_pads_init(&sd->entity, STF_ISP_PAD_MAX, pads);
+	if (ret) {
+		dev_err(isp_dev->stfcamss->dev,
+			"Failed to init media entity: %d\n", ret);
+		return ret;
+	}
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		goto err_entity_cleanup;
+
+	ret = v4l2_device_register_subdev(v4l2_dev, sd);
+	if (ret) {
+		dev_err(isp_dev->stfcamss->dev,
+			"Failed to register subdev: %d\n", ret);
+		goto err_subdev_cleanup;
+	}
+
+	return 0;
+
+err_subdev_cleanup:
+	v4l2_subdev_cleanup(sd);
+err_entity_cleanup:
+	media_entity_cleanup(&sd->entity);
+	return ret;
+}
+
+int stf_isp_unregister(struct stf_isp_dev *isp_dev)
+{
+	v4l2_device_unregister_subdev(&isp_dev->subdev);
+	v4l2_subdev_cleanup(&isp_dev->subdev);
+	media_entity_cleanup(&isp_dev->subdev.entity);
+
+	return 0;
+}
diff --git a/drivers/staging/media/starfive/camss/stf_isp.h b/drivers/staging/media/starfive/camss/stf_isp.h
new file mode 100644
index 000000000000..7d2ae369f050
--- /dev/null
+++ b/drivers/staging/media/starfive/camss/stf_isp.h
@@ -0,0 +1,428 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * stf_isp.h
+ *
+ * StarFive Camera Subsystem - ISP Module
+ *
+ * Copyright (C) 2021-2023 StarFive Technology Co., Ltd.
+ */
+
+#ifndef STF_ISP_H
+#define STF_ISP_H
+
+#include <media/v4l2-subdev.h>
+
+#include "stf_video.h"
+
+#define ISP_RAW_DATA_BITS			12
+#define SCALER_RATIO_MAX			1
+#define STF_ISP_REG_OFFSET_MAX			0x0fff
+#define STF_ISP_REG_DELAY_MAX			100
+
+/* isp registers */
+#define ISP_REG_CSI_INPUT_EN_AND_STATUS		0x000
+#define CSI_SCD_ERR				BIT(6)
+#define CSI_ITU656_ERR				BIT(4)
+#define CSI_ITU656_F				BIT(3)
+#define CSI_SCD_DONE				BIT(2)
+#define CSI_BUSY_S				BIT(1)
+#define CSI_EN_S				BIT(0)
+
+#define ISP_REG_CSIINTS				0x008
+#define CSI_INTS(n)				((n) << 16)
+#define CSI_SHA_M(n)				((n) << 0)
+#define CSI_INTS_MASK				GENMASK(17, 16)
+
+#define ISP_REG_CSI_MODULE_CFG			0x010
+#define CSI_DUMP_EN				BIT(19)
+#define CSI_VS_EN				BIT(18)
+#define CSI_SC_EN				BIT(17)
+#define CSI_OBA_EN				BIT(16)
+#define CSI_AWB_EN				BIT(7)
+#define CSI_LCCF_EN				BIT(6)
+#define CSI_OECFHM_EN				BIT(5)
+#define CSI_OECF_EN				BIT(4)
+#define CSI_LCBQ_EN				BIT(3)
+#define CSI_OBC_EN				BIT(2)
+#define CSI_DEC_EN				BIT(1)
+#define CSI_DC_EN				BIT(0)
+
+#define ISP_REG_SENSOR				0x014
+#define DVP_SYNC_POL(n)				((n) << 2)
+#define ITU656_EN(n)				((n) << 1)
+#define IMAGER_SEL(n)				((n) << 0)
+
+#define ISP_REG_RAW_FORMAT_CFG			0x018
+#define SMY13(n)				((n) << 14)
+#define SMY12(n)				((n) << 12)
+#define SMY11(n)				((n) << 10)
+#define SMY10(n)				((n) << 8)
+#define SMY3(n)					((n) << 6)
+#define SMY2(n)					((n) << 4)
+#define SMY1(n)					((n) << 2)
+#define SMY0(n)					((n) << 0)
+
+#define ISP_REG_PIC_CAPTURE_START_CFG		0x01c
+#define VSTART_CAP(n)				((n) << 16)
+#define HSTART_CAP(n)				((n) << 0)
+
+#define ISP_REG_PIC_CAPTURE_END_CFG		0x020
+#define VEND_CAP(n)				((n) << 16)
+#define HEND_CAP(n)				((n) << 0)
+
+#define ISP_REG_DUMP_CFG_0			0x024
+#define ISP_REG_DUMP_CFG_1			0x028
+#define DUMP_ID(n)				((n) << 24)
+#define DUMP_SHT(n)				((n) << 20)
+#define DUMP_BURST_LEN(n)			((n) << 16)
+#define DUMP_SD(n)				((n) << 0)
+#define DUMP_BURST_LEN_MASK			GENMASK(17, 16)
+#define DUMP_SD_MASK				GENMASK(15, 0)
+
+#define ISP_REG_DEC_CFG				0x030
+#define DEC_V_KEEP(n)				((n) << 24)
+#define DEC_V_PERIOD(n)				((n) << 16)
+#define DEC_H_KEEP(n)				((n) << 8)
+#define DEC_H_PERIOD(n)				((n) << 0)
+
+#define ISP_REG_OBC_CFG				0x034
+#define OBC_W_H(y)				((y) << 4)
+#define OBC_W_W(x)				((x) << 0)
+
+#define ISP_REG_DC_CFG_1			0x044
+#define DC_AXI_ID(n)				((n) << 0)
+
+#define ISP_REG_LCCF_CFG_0			0x050
+#define Y_DISTANCE(y)				((y) << 16)
+#define X_DISTANCE(x)				((x) << 0)
+
+#define ISP_REG_LCCF_CFG_1			0x058
+#define LCCF_MAX_DIS(n)				((n) << 0)
+
+#define ISP_REG_LCBQ_CFG_0			0x074
+#define H_LCBQ(y)				((y) << 12)
+#define W_LCBQ(x)				((x) << 8)
+
+#define ISP_REG_LCBQ_CFG_1			0x07c
+#define Y_COOR(y)				((y) << 16)
+#define X_COOR(x)				((x) << 0)
+
+#define ISP_REG_LCCF_CFG_2			0x0e0
+#define ISP_REG_LCCF_CFG_3			0x0e4
+#define ISP_REG_LCCF_CFG_4			0x0e8
+#define ISP_REG_LCCF_CFG_5			0x0ec
+#define LCCF_F2_PAR(n)				((n) << 16)
+#define LCCF_F1_PAR(n)				((n) << 0)
+
+#define ISP_REG_OECF_X0_CFG0			0x100
+#define ISP_REG_OECF_X0_CFG1			0x104
+#define ISP_REG_OECF_X0_CFG2			0x108
+#define ISP_REG_OECF_X0_CFG3			0x10c
+#define ISP_REG_OECF_X0_CFG4			0x110
+#define ISP_REG_OECF_X0_CFG5			0x114
+#define ISP_REG_OECF_X0_CFG6			0x118
+#define ISP_REG_OECF_X0_CFG7			0x11c
+
+#define ISP_REG_OECF_Y3_CFG0			0x1e0
+#define ISP_REG_OECF_Y3_CFG1			0x1e4
+#define ISP_REG_OECF_Y3_CFG2			0x1e8
+#define ISP_REG_OECF_Y3_CFG3			0x1ec
+#define ISP_REG_OECF_Y3_CFG4			0x1f0
+#define ISP_REG_OECF_Y3_CFG5			0x1f4
+#define ISP_REG_OECF_Y3_CFG6			0x1f8
+#define ISP_REG_OECF_Y3_CFG7			0x1fc
+
+#define ISP_REG_OECF_S0_CFG0			0x200
+#define ISP_REG_OECF_S3_CFG7			0x27c
+#define OCEF_PAR_H(n)				((n) << 16)
+#define OCEF_PAR_L(n)				((n) << 0)
+
+#define ISP_REG_AWB_X0_CFG_0			0x280
+#define ISP_REG_AWB_X0_CFG_1			0x284
+#define ISP_REG_AWB_X1_CFG_0			0x288
+#define ISP_REG_AWB_X1_CFG_1			0x28c
+#define ISP_REG_AWB_X2_CFG_0			0x290
+#define ISP_REG_AWB_X2_CFG_1			0x294
+#define ISP_REG_AWB_X3_CFG_0			0x298
+#define ISP_REG_AWB_X3_CFG_1			0x29c
+#define AWB_X_SYMBOL_H(n)			((n) << 16)
+#define AWB_X_SYMBOL_L(n)			((n) << 0)
+
+#define ISP_REG_AWB_Y0_CFG_0			0x2a0
+#define ISP_REG_AWB_Y0_CFG_1			0x2a4
+#define ISP_REG_AWB_Y1_CFG_0			0x2a8
+#define ISP_REG_AWB_Y1_CFG_1			0x2ac
+#define ISP_REG_AWB_Y2_CFG_0			0x2b0
+#define ISP_REG_AWB_Y2_CFG_1			0x2b4
+#define ISP_REG_AWB_Y3_CFG_0			0x2b8
+#define ISP_REG_AWB_Y3_CFG_1			0x2bc
+#define AWB_Y_SYMBOL_H(n)			((n) << 16)
+#define AWB_Y_SYMBOL_L(n)			((n) << 0)
+
+#define ISP_REG_AWB_S0_CFG_0			0x2c0
+#define ISP_REG_AWB_S0_CFG_1			0x2c4
+#define ISP_REG_AWB_S1_CFG_0			0x2c8
+#define ISP_REG_AWB_S1_CFG_1			0x2cc
+#define ISP_REG_AWB_S2_CFG_0			0x2d0
+#define ISP_REG_AWB_S2_CFG_1			0x2d4
+#define ISP_REG_AWB_S3_CFG_0			0x2d8
+#define ISP_REG_AWB_S3_CFG_1			0x2dc
+#define AWB_S_SYMBOL_H(n)			((n) << 16)
+#define AWB_S_SYMBOL_L(n)			((n) << 0)
+
+#define ISP_REG_OBCG_CFG_0			0x2e0
+#define ISP_REG_OBCG_CFG_1			0x2e4
+#define ISP_REG_OBCG_CFG_2			0x2e8
+#define ISP_REG_OBCG_CFG_3			0x2ec
+#define ISP_REG_OBCO_CFG_0			0x2f0
+#define ISP_REG_OBCO_CFG_1			0x2f4
+#define ISP_REG_OBCO_CFG_2			0x2f8
+#define ISP_REG_OBCO_CFG_3			0x2fc
+#define GAIN_D_POINT(x)				((x) << 24)
+#define GAIN_C_POINT(x)				((x) << 16)
+#define GAIN_B_POINT(x)				((x) << 8)
+#define GAIN_A_POINT(x)				((x) << 0)
+#define OFFSET_D_POINT(x)			((x) << 24)
+#define OFFSET_C_POINT(x)			((x) << 16)
+#define OFFSET_B_POINT(x)			((x) << 8)
+#define OFFSET_A_POINT(x)			((x) << 0)
+
+#define ISP_REG_ISP_CTRL_0			0xa00
+#define ISPC_LINE				BIT(27)
+#define ISPC_SC					BIT(26)
+#define ISPC_CSI				BIT(25)
+#define ISPC_ISP				BIT(24)
+#define ISPC_ENUO				BIT(20)
+#define ISPC_ENLS				BIT(17)
+#define ISPC_ENSS1				BIT(12)
+#define ISPC_ENSS0				BIT(11)
+#define ISPC_RST				BIT(1)
+#define ISPC_EN					BIT(0)
+#define ISPC_RST_MASK				BIT(1)
+#define ISPC_INT_ALL_MASK			GENMASK(27, 24)
+
+#define ISP_REG_ISP_CTRL_1			0xa08
+#define CTRL_SAT(n)				((n) << 28)
+#define CTRL_DBC				BIT(22)
+#define CTRL_CTC				BIT(21)
+#define CTRL_YHIST				BIT(20)
+#define CTRL_YCURVE				BIT(19)
+#define CTRL_CTM				BIT(18)
+#define CTRL_BIYUV				BIT(17)
+#define CTRL_SCE				BIT(8)
+#define CTRL_EE					BIT(7)
+#define CTRL_CCE				BIT(5)
+#define CTRL_RGE				BIT(4)
+#define CTRL_CME				BIT(3)
+#define CTRL_AE					BIT(2)
+#define CTRL_CE					BIT(1)
+#define CTRL_SAT_MASK				GENMASK(31, 28)
+
+#define ISP_REG_PIPELINE_XY_SIZE		0xa0c
+#define H_ACT_CAP(n)				((n) << 16)
+#define W_ACT_CAP(n)				((n) << 0)
+
+#define ISP_REG_ICTC				0xa10
+#define GF_MODE(n)				((n) << 30)
+#define MAXGT(n)				((n) << 16)
+#define MINGT(n)				((n) << 0)
+
+#define ISP_REG_IDBC				0xa14
+#define BADGT(n)				((n) << 16)
+#define BADXT(n)				((n) << 0)
+
+#define ISP_REG_ICFAM				0xa1c
+#define CROSS_COV(n)				((n) << 4)
+#define HV_W(n)					((n) << 0)
+
+#define ISP_REG_CS_GAIN				0xa30
+#define CMAD(n)					((n) << 16)
+#define CMAB(n)					((n) << 0)
+
+#define ISP_REG_CS_THRESHOLD			0xa34
+#define CMD(n)					((n) << 16)
+#define CMB(n)					((n) << 0)
+
+#define ISP_REG_CS_OFFSET			0xa38
+#define VOFF(n)					((n) << 16)
+#define UOFF(n)					((n) << 0)
+
+#define ISP_REG_CS_HUE_F			0xa3c
+#define SIN(n)					((n) << 16)
+#define COS(n)					((n) << 0)
+
+#define ISP_REG_CS_SCALE			0xa40
+
+#define ISP_REG_IESHD				0xa50
+#define SHAD_UP_M				BIT(1)
+#define SHAD_UP_EN				BIT(0)
+
+#define ISP_REG_YADJ0				0xa54
+#define YOIR(n)					((n) << 16)
+#define YIMIN(n)				((n) << 0)
+
+#define ISP_REG_YADJ1				0xa58
+#define YOMAX(n)				((n) << 16)
+#define YOMIN(n)				((n) << 0)
+
+#define ISP_REG_Y_PLANE_START_ADDR		0xa80
+#define ISP_REG_UV_PLANE_START_ADDR		0xa84
+#define ISP_REG_STRIDE				0xa88
+
+#define ISP_REG_ITIIWSR				0xb20
+#define ITI_HSIZE(n)				((n) << 16)
+#define ITI_WSIZE(n)				((n) << 0)
+
+#define ISP_REG_ITIDWLSR			0xb24
+#define ISP_REG_ITIPDFR				0xb38
+#define ISP_REG_ITIDRLSR			0xb3C
+
+#define ISP_REG_DNYUV_YSWR0			0xc00
+#define ISP_REG_DNYUV_YSWR1			0xc04
+#define ISP_REG_DNYUV_CSWR0			0xc08
+#define ISP_REG_DNYUV_CSWR1			0xc0c
+#define YUVSW5(n)				((n) << 20)
+#define YUVSW4(n)				((n) << 16)
+#define YUVSW3(n)				((n) << 12)
+#define YUVSW2(n)				((n) << 8)
+#define YUVSW1(n)				((n) << 4)
+#define YUVSW0(n)				((n) << 0)
+
+#define ISP_REG_DNYUV_YDR0			0xc10
+#define ISP_REG_DNYUV_YDR1			0xc14
+#define ISP_REG_DNYUV_YDR2			0xc18
+#define ISP_REG_DNYUV_CDR0			0xc1c
+#define ISP_REG_DNYUV_CDR1			0xc20
+#define ISP_REG_DNYUV_CDR2			0xc24
+#define CURVE_D_H(n)				((n) << 16)
+#define CURVE_D_L(n)				((n) << 0)
+
+#define ISP_REG_ICAMD_0				0xc40
+#define ISP_REG_ICAMD_12			0xc70
+#define ISP_REG_ICAMD_20			0xc90
+#define ISP_REG_ICAMD_24			0xca0
+#define ISP_REG_ICAMD_25			0xca4
+#define DNRM_F(n)				((n) << 16)
+#define CCM_M_DAT(n)				((n) << 0)
+
+#define ISP_REG_GAMMA_VAL0			0xe00
+#define ISP_REG_GAMMA_VAL1			0xe04
+#define ISP_REG_GAMMA_VAL2			0xe08
+#define ISP_REG_GAMMA_VAL3			0xe0c
+#define ISP_REG_GAMMA_VAL4			0xe10
+#define ISP_REG_GAMMA_VAL5			0xe14
+#define ISP_REG_GAMMA_VAL6			0xe18
+#define ISP_REG_GAMMA_VAL7			0xe1c
+#define ISP_REG_GAMMA_VAL8			0xe20
+#define ISP_REG_GAMMA_VAL9			0xe24
+#define ISP_REG_GAMMA_VAL10			0xe28
+#define ISP_REG_GAMMA_VAL11			0xe2c
+#define ISP_REG_GAMMA_VAL12			0xe30
+#define ISP_REG_GAMMA_VAL13			0xe34
+#define ISP_REG_GAMMA_VAL14			0xe38
+#define GAMMA_S_VAL(n)				((n) << 16)
+#define GAMMA_VAL(n)				((n) << 0)
+
+#define ISP_REG_R2Y_0				0xe40
+#define ISP_REG_R2Y_1				0xe44
+#define ISP_REG_R2Y_2				0xe48
+#define ISP_REG_R2Y_3				0xe4c
+#define ISP_REG_R2Y_4				0xe50
+#define ISP_REG_R2Y_5				0xe54
+#define ISP_REG_R2Y_6				0xe58
+#define ISP_REG_R2Y_7				0xe5c
+#define ISP_REG_R2Y_8				0xe60
+
+#define ISP_REG_SHARPEN0			0xe80
+#define ISP_REG_SHARPEN1			0xe84
+#define ISP_REG_SHARPEN2			0xe88
+#define ISP_REG_SHARPEN3			0xe8c
+#define ISP_REG_SHARPEN4			0xe90
+#define ISP_REG_SHARPEN5			0xe94
+#define ISP_REG_SHARPEN6			0xe98
+#define ISP_REG_SHARPEN7			0xe9c
+#define ISP_REG_SHARPEN8			0xea0
+#define ISP_REG_SHARPEN9			0xea4
+#define ISP_REG_SHARPEN10			0xea8
+#define ISP_REG_SHARPEN11			0xeac
+#define ISP_REG_SHARPEN12			0xeb0
+#define ISP_REG_SHARPEN13			0xeb4
+#define ISP_REG_SHARPEN14			0xeb8
+#define S_DELTA(n)				((n) << 16)
+#define S_WEIGHT(n)				((n) << 8)
+
+#define ISP_REG_SHARPEN_FS0			0xebc
+#define ISP_REG_SHARPEN_FS1			0xec0
+#define ISP_REG_SHARPEN_FS2			0xec4
+#define ISP_REG_SHARPEN_FS3			0xec8
+#define ISP_REG_SHARPEN_FS4			0xecc
+#define ISP_REG_SHARPEN_FS5			0xed0
+#define S_FACTOR(n)				((n) << 24)
+#define S_SLOPE(n)				((n) << 0)
+
+#define ISP_REG_SHARPEN_WN			0xed4
+#define PDIRF(n)				((n) << 28)
+#define NDIRF(n)				((n) << 24)
+#define WSUM(n)					((n) << 0)
+
+#define ISP_REG_IUVS1				0xed8
+#define UVDIFF2(n)				((n) << 16)
+#define UVDIFF1(n)				((n) << 0)
+
+#define ISP_REG_IUVS2				0xedc
+#define UVF(n)					((n) << 24)
+#define UVSLOPE(n)				((n) << 0)
+
+#define ISP_REG_IUVCKS1				0xee0
+#define UVCKDIFF2(n)				((n) << 16)
+#define UVCKDIFF1(n)				((n) << 0)
+
+#define ISP_REG_IUVCKS2				0xee4
+
+#define ISP_REG_ISHRPET				0xee8
+#define TH(n)					((n) << 8)
+#define EN(n)					((n) << 0)
+
+#define ISP_REG_YCURVE_0			0xf00
+#define ISP_REG_YCURVE_63			0xffc
+
+#define IMAGE_MAX_WIDTH				1920
+#define IMAGE_MAX_HEIGH				1080
+
+/* pad id for media framework */
+enum stf_isp_pad_id {
+	STF_ISP_PAD_SINK = 0,
+	STF_ISP_PAD_SRC,
+	STF_ISP_PAD_MAX
+};
+
+struct stf_isp_format {
+	u32 code;
+	u8 bpp;
+};
+
+struct stf_isp_format_table {
+	const struct stf_isp_format *fmts;
+	int nfmts;
+};
+
+struct stf_isp_dev {
+	struct stfcamss *stfcamss;
+	struct v4l2_subdev subdev;
+	struct media_pad pads[STF_ISP_PAD_MAX];
+	const struct stf_isp_format_table *formats;
+	unsigned int nformats;
+	struct v4l2_subdev *source_subdev;
+	const struct stf_isp_format *current_fmt;
+};
+
+int stf_isp_reset(struct stf_isp_dev *isp_dev);
+void stf_isp_init_cfg(struct stf_isp_dev *isp_dev);
+void stf_isp_settings(struct stf_isp_dev *isp_dev,
+		      struct v4l2_rect *crop, u32 mcode);
+void stf_isp_stream_set(struct stf_isp_dev *isp_dev);
+int stf_isp_init(struct stfcamss *stfcamss);
+int stf_isp_register(struct stf_isp_dev *isp_dev, struct v4l2_device *v4l2_dev);
+int stf_isp_unregister(struct stf_isp_dev *isp_dev);
+
+#endif /* STF_ISP_H */
diff --git a/drivers/staging/media/starfive/camss/stf_isp_hw_ops.c b/drivers/staging/media/starfive/camss/stf_isp_hw_ops.c
new file mode 100644
index 000000000000..a5d6e928714e
--- /dev/null
+++ b/drivers/staging/media/starfive/camss/stf_isp_hw_ops.c
@@ -0,0 +1,445 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * stf_isp_hw_ops.c
+ *
+ * Register interface file for StarFive ISP driver
+ *
+ * Copyright (C) 2021-2023 StarFive Technology Co., Ltd.
+ *
+ */
+
+#include "stf_camss.h"
+
+static void stf_isp_config_obc(struct stfcamss *stfcamss)
+{
+	u32 reg_val, reg_add;
+
+	stf_isp_reg_write(stfcamss, ISP_REG_OBC_CFG, OBC_W_H(11) | OBC_W_W(11));
+
+	reg_val = GAIN_D_POINT(0x40) | GAIN_C_POINT(0x40) |
+		  GAIN_B_POINT(0x40) | GAIN_A_POINT(0x40);
+	for (reg_add = ISP_REG_OBCG_CFG_0; reg_add <= ISP_REG_OBCG_CFG_3;) {
+		stf_isp_reg_write(stfcamss, reg_add, reg_val);
+		reg_add += 4;
+	}
+
+	reg_val = OFFSET_D_POINT(0) | OFFSET_C_POINT(0) |
+		  OFFSET_B_POINT(0) | OFFSET_A_POINT(0);
+	for (reg_add = ISP_REG_OBCO_CFG_0; reg_add <= ISP_REG_OBCO_CFG_3;) {
+		stf_isp_reg_write(stfcamss, reg_add, reg_val);
+		reg_add += 4;
+	}
+}
+
+static void stf_isp_config_oecf(struct stfcamss *stfcamss)
+{
+	u32 reg_add, par_val;
+	u16 par_h, par_l;
+
+	par_h = 0x10; par_l = 0;
+	par_val = OCEF_PAR_H(par_h) | OCEF_PAR_L(par_l);
+	for (reg_add = ISP_REG_OECF_X0_CFG0; reg_add <= ISP_REG_OECF_Y3_CFG0;) {
+		stf_isp_reg_write(stfcamss, reg_add, par_val);
+		reg_add += 0x20;
+	}
+
+	par_h = 0x40; par_l = 0x20;
+	par_val = OCEF_PAR_H(par_h) | OCEF_PAR_L(par_l);
+	for (reg_add = ISP_REG_OECF_X0_CFG1; reg_add <= ISP_REG_OECF_Y3_CFG1;) {
+		stf_isp_reg_write(stfcamss, reg_add, par_val);
+		reg_add += 0x20;
+	}
+
+	par_h = 0x80; par_l = 0x60;
+	par_val = OCEF_PAR_H(par_h) | OCEF_PAR_L(par_l);
+	for (reg_add = ISP_REG_OECF_X0_CFG2; reg_add <= ISP_REG_OECF_Y3_CFG2;) {
+		stf_isp_reg_write(stfcamss, reg_add, par_val);
+		reg_add += 0x20;
+	}
+
+	par_h = 0xc0; par_l = 0xa0;
+	par_val = OCEF_PAR_H(par_h) | OCEF_PAR_L(par_l);
+	for (reg_add = ISP_REG_OECF_X0_CFG3; reg_add <= ISP_REG_OECF_Y3_CFG3;) {
+		stf_isp_reg_write(stfcamss, reg_add, par_val);
+		reg_add += 0x20;
+	}
+
+	par_h = 0x100; par_l = 0xe0;
+	par_val = OCEF_PAR_H(par_h) | OCEF_PAR_L(par_l);
+	for (reg_add = ISP_REG_OECF_X0_CFG4; reg_add <= ISP_REG_OECF_Y3_CFG4;) {
+		stf_isp_reg_write(stfcamss, reg_add, par_val);
+		reg_add += 0x20;
+	}
+
+	par_h = 0x200; par_l = 0x180;
+	par_val = OCEF_PAR_H(par_h) | OCEF_PAR_L(par_l);
+	for (reg_add = ISP_REG_OECF_X0_CFG5; reg_add <= ISP_REG_OECF_Y3_CFG5;) {
+		stf_isp_reg_write(stfcamss, reg_add, par_val);
+		reg_add += 0x20;
+	}
+
+	par_h = 0x300; par_l = 0x280;
+	par_val = OCEF_PAR_H(par_h) | OCEF_PAR_L(par_l);
+	for (reg_add = ISP_REG_OECF_X0_CFG6; reg_add <= ISP_REG_OECF_Y3_CFG6;) {
+		stf_isp_reg_write(stfcamss, reg_add, par_val);
+		reg_add += 0x20;
+	}
+
+	par_h = 0x3fe; par_l = 0x380;
+	par_val = OCEF_PAR_H(par_h) | OCEF_PAR_L(par_l);
+	for (reg_add = ISP_REG_OECF_X0_CFG7; reg_add <= ISP_REG_OECF_Y3_CFG7;) {
+		stf_isp_reg_write(stfcamss, reg_add, par_val);
+		reg_add += 0x20;
+	}
+
+	par_h = 0x80; par_l = 0x80;
+	par_val = OCEF_PAR_H(par_h) | OCEF_PAR_L(par_l);
+	for (reg_add = ISP_REG_OECF_S0_CFG0; reg_add <= ISP_REG_OECF_S3_CFG7;) {
+		stf_isp_reg_write(stfcamss, reg_add, par_val);
+		reg_add += 4;
+	}
+}
+
+static void stf_isp_config_lccf(struct stfcamss *stfcamss)
+{
+	u32 reg_add;
+
+	stf_isp_reg_write(stfcamss, ISP_REG_LCCF_CFG_0,
+			  Y_DISTANCE(0x21C) | X_DISTANCE(0x3C0));
+	stf_isp_reg_write(stfcamss, ISP_REG_LCCF_CFG_1, LCCF_MAX_DIS(0xb));
+
+	for (reg_add = ISP_REG_LCCF_CFG_2; reg_add <= ISP_REG_LCCF_CFG_5;) {
+		stf_isp_reg_write(stfcamss, reg_add,
+				  LCCF_F2_PAR(0x0) | LCCF_F1_PAR(0x0));
+		reg_add += 4;
+	}
+}
+
+static void stf_isp_config_awb(struct stfcamss *stfcamss)
+{
+	u32 reg_val, reg_add;
+	u16 symbol_h, symbol_l;
+
+	symbol_h = 0x0; symbol_l = 0x0;
+	reg_val = AWB_X_SYMBOL_H(symbol_h) | AWB_X_SYMBOL_L(symbol_l);
+
+	for (reg_add = ISP_REG_AWB_X0_CFG_0; reg_add <= ISP_REG_AWB_X3_CFG_1;) {
+		stf_isp_reg_write(stfcamss, reg_add, reg_val);
+		reg_add += 4;
+	}
+
+	symbol_h = 0x0, symbol_l = 0x0;
+	reg_val = AWB_Y_SYMBOL_H(symbol_h) | AWB_Y_SYMBOL_L(symbol_l);
+
+	for (reg_add = ISP_REG_AWB_Y0_CFG_0; reg_add <= ISP_REG_AWB_Y3_CFG_1;) {
+		stf_isp_reg_write(stfcamss, reg_add, reg_val);
+		reg_add += 4;
+	}
+
+	symbol_h = 0x80, symbol_l = 0x80;
+	reg_val = AWB_S_SYMBOL_H(symbol_h) | AWB_S_SYMBOL_L(symbol_l);
+
+	for (reg_add = ISP_REG_AWB_S0_CFG_0; reg_add <= ISP_REG_AWB_S3_CFG_1;) {
+		stf_isp_reg_write(stfcamss, reg_add, reg_val);
+		reg_add += 4;
+	}
+}
+
+static void stf_isp_config_grgb(struct stfcamss *stfcamss)
+{
+	stf_isp_reg_write(stfcamss, ISP_REG_ICTC,
+			  GF_MODE(1) | MAXGT(0x140) | MINGT(0x40));
+	stf_isp_reg_write(stfcamss, ISP_REG_IDBC, BADGT(0x200) | BADXT(0x200));
+}
+
+static void stf_isp_config_cfa(struct stfcamss *stfcamss)
+{
+	stf_isp_reg_write(stfcamss, ISP_REG_RAW_FORMAT_CFG,
+			  SMY13(0) | SMY12(1) | SMY11(0) | SMY10(1) | SMY3(2) |
+			  SMY2(3) | SMY1(2) | SMY0(3));
+	stf_isp_reg_write(stfcamss, ISP_REG_ICFAM, CROSS_COV(3) | HV_W(2));
+}
+
+static void stf_isp_config_ccm(struct stfcamss *stfcamss)
+{
+	u32 reg_add;
+
+	stf_isp_reg_write(stfcamss, ISP_REG_ICAMD_0, DNRM_F(6) | CCM_M_DAT(0));
+
+	for (reg_add = ISP_REG_ICAMD_12; reg_add <= ISP_REG_ICAMD_20;) {
+		stf_isp_reg_write(stfcamss, reg_add, CCM_M_DAT(0x80));
+		reg_add += 0x10;
+	}
+
+	stf_isp_reg_write(stfcamss, ISP_REG_ICAMD_24, CCM_M_DAT(0x700));
+	stf_isp_reg_write(stfcamss, ISP_REG_ICAMD_25, CCM_M_DAT(0x200));
+}
+
+static void stf_isp_config_gamma(struct stfcamss *stfcamss)
+{
+	u32 reg_val, reg_add;
+	u16 gamma_slope_v, gamma_v;
+
+	gamma_slope_v = 0x2400; gamma_v = 0x0;
+	reg_val = GAMMA_S_VAL(gamma_slope_v) | GAMMA_VAL(gamma_v);
+	stf_isp_reg_write(stfcamss, ISP_REG_GAMMA_VAL0, reg_val);
+
+	gamma_slope_v = 0x800; gamma_v = 0x20;
+	for (reg_add = ISP_REG_GAMMA_VAL1; reg_add <= ISP_REG_GAMMA_VAL7;) {
+		reg_val = GAMMA_S_VAL(gamma_slope_v) | GAMMA_VAL(gamma_v);
+		stf_isp_reg_write(stfcamss, reg_add, reg_val);
+		reg_add += 4;
+		gamma_v += 0x20;
+	}
+
+	gamma_v = 0x100;
+	for (reg_add = ISP_REG_GAMMA_VAL8; reg_add <= ISP_REG_GAMMA_VAL13;) {
+		reg_val = GAMMA_S_VAL(gamma_slope_v) | GAMMA_VAL(gamma_v);
+		stf_isp_reg_write(stfcamss, reg_add, reg_val);
+		reg_add += 4;
+		gamma_v += 0x80;
+	}
+
+	gamma_v = 0x3fe;
+	reg_val = GAMMA_S_VAL(gamma_slope_v) | GAMMA_VAL(gamma_v);
+	stf_isp_reg_write(stfcamss, ISP_REG_GAMMA_VAL14, reg_val);
+}
+
+static void stf_isp_config_r2y(struct stfcamss *stfcamss)
+{
+	stf_isp_reg_write(stfcamss, ISP_REG_R2Y_0, 0x4C);
+	stf_isp_reg_write(stfcamss, ISP_REG_R2Y_1, 0x97);
+	stf_isp_reg_write(stfcamss, ISP_REG_R2Y_2, 0x1d);
+	stf_isp_reg_write(stfcamss, ISP_REG_R2Y_3, 0x1d5);
+	stf_isp_reg_write(stfcamss, ISP_REG_R2Y_4, 0x1ac);
+	stf_isp_reg_write(stfcamss, ISP_REG_R2Y_5, 0x80);
+	stf_isp_reg_write(stfcamss, ISP_REG_R2Y_6, 0x80);
+	stf_isp_reg_write(stfcamss, ISP_REG_R2Y_7, 0x194);
+	stf_isp_reg_write(stfcamss, ISP_REG_R2Y_8, 0x1ec);
+}
+
+static void stf_isp_config_y_curve(struct stfcamss *stfcamss)
+{
+	u32 reg_add;
+	u16 y_curve;
+
+	y_curve = 0x0;
+	for (reg_add = ISP_REG_YCURVE_0; reg_add <= ISP_REG_YCURVE_63;) {
+		stf_isp_reg_write(stfcamss, reg_add, y_curve);
+		reg_add += 4;
+		y_curve += 0x10;
+	}
+}
+
+static void stf_isp_config_sharpen(struct stfcamss *sc)
+{
+	u32 reg_add;
+
+	stf_isp_reg_write(sc, ISP_REG_SHARPEN0, S_DELTA(0x7) | S_WEIGHT(0xf));
+	stf_isp_reg_write(sc, ISP_REG_SHARPEN1, S_DELTA(0x18) | S_WEIGHT(0xf));
+	stf_isp_reg_write(sc, ISP_REG_SHARPEN2, S_DELTA(0x80) | S_WEIGHT(0xf));
+	stf_isp_reg_write(sc, ISP_REG_SHARPEN3, S_DELTA(0x100) | S_WEIGHT(0xf));
+	stf_isp_reg_write(sc, ISP_REG_SHARPEN4, S_DELTA(0x10) | S_WEIGHT(0xf));
+	stf_isp_reg_write(sc, ISP_REG_SHARPEN5, S_DELTA(0x60) | S_WEIGHT(0xf));
+	stf_isp_reg_write(sc, ISP_REG_SHARPEN6, S_DELTA(0x100) | S_WEIGHT(0xf));
+	stf_isp_reg_write(sc, ISP_REG_SHARPEN7, S_DELTA(0x190) | S_WEIGHT(0xf));
+	stf_isp_reg_write(sc, ISP_REG_SHARPEN8, S_DELTA(0x0) | S_WEIGHT(0xf));
+
+	for (reg_add = ISP_REG_SHARPEN9; reg_add <= ISP_REG_SHARPEN14;) {
+		stf_isp_reg_write(sc, reg_add, S_WEIGHT(0xf));
+		reg_add += 4;
+	}
+
+	for (reg_add = ISP_REG_SHARPEN_FS0; reg_add <= ISP_REG_SHARPEN_FS5;) {
+		stf_isp_reg_write(sc, reg_add, S_FACTOR(0x10) | S_SLOPE(0x0));
+		reg_add += 4;
+	}
+
+	stf_isp_reg_write(sc, ISP_REG_SHARPEN_WN,
+			  PDIRF(0x8) | NDIRF(0x8) | WSUM(0xd7c));
+	stf_isp_reg_write(sc, ISP_REG_IUVS1, UVDIFF2(0xC0) | UVDIFF1(0x40));
+	stf_isp_reg_write(sc, ISP_REG_IUVS2, UVF(0xff) | UVSLOPE(0x0));
+	stf_isp_reg_write(sc, ISP_REG_IUVCKS1,
+			  UVCKDIFF2(0xa0) | UVCKDIFF1(0x40));
+}
+
+static void stf_isp_config_dnyuv(struct stfcamss *stfcamss)
+{
+	u32 reg_val;
+
+	reg_val = YUVSW5(7) | YUVSW4(7) | YUVSW3(7) | YUVSW2(7) |
+		  YUVSW1(7) | YUVSW0(7);
+	stf_isp_reg_write(stfcamss, ISP_REG_DNYUV_YSWR0, reg_val);
+	stf_isp_reg_write(stfcamss, ISP_REG_DNYUV_CSWR0, reg_val);
+
+	reg_val = YUVSW3(7) | YUVSW2(7) | YUVSW1(7) | YUVSW0(7);
+	stf_isp_reg_write(stfcamss, ISP_REG_DNYUV_YSWR1, reg_val);
+	stf_isp_reg_write(stfcamss, ISP_REG_DNYUV_CSWR1, reg_val);
+
+	reg_val = CURVE_D_H(0x60) | CURVE_D_L(0x40);
+	stf_isp_reg_write(stfcamss, ISP_REG_DNYUV_YDR0, reg_val);
+	stf_isp_reg_write(stfcamss, ISP_REG_DNYUV_CDR0, reg_val);
+
+	reg_val = CURVE_D_H(0xd8) | CURVE_D_L(0x90);
+	stf_isp_reg_write(stfcamss, ISP_REG_DNYUV_YDR1, reg_val);
+	stf_isp_reg_write(stfcamss, ISP_REG_DNYUV_CDR1, reg_val);
+
+	reg_val = CURVE_D_H(0x1e6) | CURVE_D_L(0x144);
+	stf_isp_reg_write(stfcamss, ISP_REG_DNYUV_YDR2, reg_val);
+	stf_isp_reg_write(stfcamss, ISP_REG_DNYUV_CDR2, reg_val);
+}
+
+static void stf_isp_config_sat(struct stfcamss *stfcamss)
+{
+	stf_isp_reg_write(stfcamss, ISP_REG_CS_GAIN, CMAD(0x0) | CMAB(0x100));
+	stf_isp_reg_write(stfcamss, ISP_REG_CS_THRESHOLD, CMD(0x1f) | CMB(0x1));
+	stf_isp_reg_write(stfcamss, ISP_REG_CS_OFFSET, VOFF(0x0) | UOFF(0x0));
+	stf_isp_reg_write(stfcamss, ISP_REG_CS_HUE_F, SIN(0x0) | COS(0x100));
+	stf_isp_reg_write(stfcamss, ISP_REG_CS_SCALE, 0x8);
+	stf_isp_reg_write(stfcamss, ISP_REG_YADJ0, YOIR(0x401) | YIMIN(0x1));
+	stf_isp_reg_write(stfcamss, ISP_REG_YADJ1, YOMAX(0x3ff) | YOMIN(0x1));
+}
+
+int stf_isp_reset(struct stf_isp_dev *isp_dev)
+{
+	stf_isp_reg_set_bit(isp_dev->stfcamss, ISP_REG_ISP_CTRL_0,
+			    ISPC_RST_MASK, ISPC_RST);
+	stf_isp_reg_set_bit(isp_dev->stfcamss, ISP_REG_ISP_CTRL_0,
+			    ISPC_RST_MASK, 0);
+
+	return 0;
+}
+
+void stf_isp_init_cfg(struct stf_isp_dev *isp_dev)
+{
+	stf_isp_reg_write(isp_dev->stfcamss, ISP_REG_DC_CFG_1, DC_AXI_ID(0x0));
+	stf_isp_reg_write(isp_dev->stfcamss, ISP_REG_DEC_CFG,
+			  DEC_V_KEEP(0x0) |
+			  DEC_V_PERIOD(0x0) |
+			  DEC_H_KEEP(0x0) |
+			  DEC_H_PERIOD(0x0));
+
+	stf_isp_config_obc(isp_dev->stfcamss);
+	stf_isp_config_oecf(isp_dev->stfcamss);
+	stf_isp_config_lccf(isp_dev->stfcamss);
+	stf_isp_config_awb(isp_dev->stfcamss);
+	stf_isp_config_grgb(isp_dev->stfcamss);
+	stf_isp_config_cfa(isp_dev->stfcamss);
+	stf_isp_config_ccm(isp_dev->stfcamss);
+	stf_isp_config_gamma(isp_dev->stfcamss);
+	stf_isp_config_r2y(isp_dev->stfcamss);
+	stf_isp_config_y_curve(isp_dev->stfcamss);
+	stf_isp_config_sharpen(isp_dev->stfcamss);
+	stf_isp_config_dnyuv(isp_dev->stfcamss);
+	stf_isp_config_sat(isp_dev->stfcamss);
+
+	stf_isp_reg_write(isp_dev->stfcamss, ISP_REG_CSI_MODULE_CFG,
+			  CSI_DUMP_EN | CSI_SC_EN | CSI_AWB_EN |
+			  CSI_LCCF_EN | CSI_OECF_EN | CSI_OBC_EN | CSI_DEC_EN);
+	stf_isp_reg_write(isp_dev->stfcamss, ISP_REG_ISP_CTRL_1,
+			  CTRL_SAT(1) | CTRL_DBC | CTRL_CTC | CTRL_YHIST |
+			  CTRL_YCURVE | CTRL_BIYUV | CTRL_SCE | CTRL_EE |
+			  CTRL_CCE | CTRL_RGE | CTRL_CME | CTRL_AE | CTRL_CE);
+}
+
+static void stf_isp_config_crop(struct stfcamss *stfcamss,
+				struct v4l2_rect *crop)
+{
+	u32 bpp = stfcamss->isp_dev.current_fmt->bpp;
+	u32 val;
+
+	val = VSTART_CAP(crop->top) | HSTART_CAP(crop->left);
+	stf_isp_reg_write(stfcamss, ISP_REG_PIC_CAPTURE_START_CFG, val);
+
+	val = VEND_CAP(crop->height + crop->top - 1) |
+	      HEND_CAP(crop->width + crop->left - 1);
+	stf_isp_reg_write(stfcamss, ISP_REG_PIC_CAPTURE_END_CFG, val);
+
+	val = H_ACT_CAP(crop->height) | W_ACT_CAP(crop->width);
+	stf_isp_reg_write(stfcamss, ISP_REG_PIPELINE_XY_SIZE, val);
+
+	val = ALIGN(crop->width * bpp / 8, STFCAMSS_FRAME_WIDTH_ALIGN_8);
+	stf_isp_reg_write(stfcamss, ISP_REG_STRIDE, val);
+}
+
+static void stf_isp_config_raw_fmt(struct stfcamss *stfcamss, u32 mcode)
+{
+	u32 val, val1;
+
+	switch (mcode) {
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+		/* 3 2 3 2 1 0 1 0 B Gb B Gb Gr R Gr R */
+		val = SMY13(3) | SMY12(2) | SMY11(3) | SMY10(2) |
+		      SMY3(1) | SMY2(0) | SMY1(1) | SMY0(0);
+		val1 = CTRL_SAT(0x0);
+		break;
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+		/* 2 3 2 3 0 1 0 1, Gb B Gb B R Gr R Gr */
+		val = SMY13(2) | SMY12(3) | SMY11(2) | SMY10(3) |
+		      SMY3(0) | SMY2(1) | SMY1(0) | SMY0(1);
+		val1 = CTRL_SAT(0x2);
+		break;
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+		/* 1 0 1 0 3 2 3 2, Gr R Gr R B Gb B Gb */
+		val = SMY13(1) | SMY12(0) | SMY11(1) | SMY10(0) |
+		      SMY3(3) | SMY2(2) | SMY1(3) | SMY0(2);
+		val1 = CTRL_SAT(0x3);
+		break;
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+		/* 0 1 0 1 2 3 2 3 R Gr R Gr Gb B Gb B */
+		val = SMY13(0) | SMY12(1) | SMY11(0) | SMY10(1) |
+		      SMY3(2) | SMY2(3) | SMY1(2) | SMY0(3);
+		val1 = CTRL_SAT(0x1);
+		break;
+	default:
+		val = SMY13(0) | SMY12(1) | SMY11(0) | SMY10(1) |
+		      SMY3(2) | SMY2(3) | SMY1(2) | SMY0(3);
+		val1 = CTRL_SAT(0x1);
+		break;
+	}
+	stf_isp_reg_write(stfcamss, ISP_REG_RAW_FORMAT_CFG, val);
+	stf_isp_reg_set_bit(stfcamss, ISP_REG_ISP_CTRL_1, CTRL_SAT_MASK, val1);
+}
+
+void stf_isp_settings(struct stf_isp_dev *isp_dev,
+		      struct v4l2_rect *crop, u32 mcode)
+{
+	struct stfcamss *stfcamss = isp_dev->stfcamss;
+
+	stf_isp_config_crop(stfcamss, crop);
+	stf_isp_config_raw_fmt(stfcamss, mcode);
+
+	stf_isp_reg_set_bit(stfcamss, ISP_REG_DUMP_CFG_1,
+			    DUMP_BURST_LEN_MASK | DUMP_SD_MASK,
+			    DUMP_BURST_LEN(3));
+
+	stf_isp_reg_write(stfcamss, ISP_REG_ITIIWSR,
+			  ITI_HSIZE(IMAGE_MAX_HEIGH) |
+			  ITI_WSIZE(IMAGE_MAX_WIDTH));
+	stf_isp_reg_write(stfcamss, ISP_REG_ITIDWLSR, 0x960);
+	stf_isp_reg_write(stfcamss, ISP_REG_ITIDRLSR, 0x960);
+	stf_isp_reg_write(stfcamss, ISP_REG_SENSOR, IMAGER_SEL(1));
+}
+
+void stf_isp_stream_set(struct stf_isp_dev *isp_dev)
+{
+	struct stfcamss *stfcamss = isp_dev->stfcamss;
+
+	stf_isp_reg_write_delay(stfcamss, ISP_REG_ISP_CTRL_0,
+				ISPC_ENUO | ISPC_ENLS | ISPC_RST, 10);
+	stf_isp_reg_write_delay(stfcamss, ISP_REG_ISP_CTRL_0,
+				ISPC_ENUO | ISPC_ENLS, 10);
+	stf_isp_reg_write(stfcamss, ISP_REG_IESHD, SHAD_UP_M);
+	stf_isp_reg_write_delay(stfcamss, ISP_REG_ISP_CTRL_0,
+				ISPC_ENUO | ISPC_ENLS | ISPC_EN, 10);
+	stf_isp_reg_write_delay(stfcamss, ISP_REG_CSIINTS,
+				CSI_INTS(1) | CSI_SHA_M(4), 10);
+	stf_isp_reg_write_delay(stfcamss, ISP_REG_CSIINTS,
+				CSI_INTS(2) | CSI_SHA_M(4), 10);
+	stf_isp_reg_write_delay(stfcamss, ISP_REG_CSI_INPUT_EN_AND_STATUS,
+				CSI_EN_S, 10);
+}
-- 
2.34.1

