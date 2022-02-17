Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22EA14BA22A
	for <lists+linux-media@lfdr.de>; Thu, 17 Feb 2022 14:59:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241538AbiBQN7C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Feb 2022 08:59:02 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241497AbiBQN65 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Feb 2022 08:58:57 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 460B92B048E;
        Thu, 17 Feb 2022 05:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1645106322; x=1676642322;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ggl1ZGStI+KwBTS1IdDq0NhOMwSKVrkLIbCHIBB6v2A=;
  b=SqEfV1gkmtcl19+gRcQsBo8ubz1SOSexNQzlO+uQzUHx/6XJyiQdJDVK
   xoowb1f3DfmqlQmWFGOh4hPx4JHaXsUSqKscF6N1bXmEWF/3ztCCFB3bA
   f3YYkrUnKDu9LvDnBDSpkfeCINu46a7i9xHlH9yQxz3Ps5CSF6J+ckVxG
   90dXC93zcb0kzPowRSAFy2gHi55x4OhYTtKopbdDB+YCtEVRLHi7oKXJP
   g2jrFBbUzzGtxL2XNJqOlDp0MXPu1x/vxTrR140OaqxOYMUuz7AY7ij0t
   7B7SfCNNe+59KhS4AcWPnWIdl5by6Jq4mkX4SBuDRbIrqhtlwQDkTQ7cw
   A==;
IronPort-SDR: CLkmNoBPfACrAVEeqEOYgTvGtzy1vAoqo8aTMT8qvL41GQU6iZcvvtA6McKggRBn9GPs5VX76N
 f/ttm7rwK+sSmN+tR+JNez/1yM/h7SoH1kZkhBwbgP3qveH2uFmdt8MG6/K6OM+6Y1HbWBDdqf
 G2Bh4kGqKJRRO6j8hqKwi7C2VMin6Og9F72raGmnnJ6wqJxZKU19jsVlIeaoiSUR5plAmX7mbr
 xYNaz+HKdznwGkIqoivkJOfd0A2UXFjzvkH0MZAR15W/WgvHgow4wOq31xKaaR/tooD4sVBa2r
 gnHnEqpJQG31nfDbb+qOnYBH
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; 
   d="scan'208";a="86082230"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Feb 2022 06:58:35 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 17 Feb 2022 06:58:34 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Thu, 17 Feb 2022 06:58:28 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <jacopo@jmondi.org>,
        <hverkuil-cisco@xs4all.nl>, <nicolas.ferre@microchip.com>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <claudiu.beznea@microchip.com>,
        "Eugen Hristev" <eugen.hristev@microchip.com>
Subject: [PATCH v5 04/13] media: atmel: atmel-isc: implement media controller
Date:   Thu, 17 Feb 2022 15:56:36 +0200
Message-ID: <20220217135645.1427466-5-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217135645.1427466-1-eugen.hristev@microchip.com>
References: <20220217135645.1427466-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement the support for media-controller.
This means that the capabilities of the driver have changed and now
it also advertises the IO_MC .
The driver will register it's media device, and add the video entity to this
media device. The subdevices are registered to the same media device.
The ISC will have a base entity which is auto-detected as atmel_isc_base.
It will also register a subdevice that allows cropping of the incoming frame
to the maximum frame size supported by the ISC.
The ISC will create a link between the subdevice that is asynchronously
registered and the atmel_isc_scaler entity.
Then, the atmel_isc_scaler and atmel_isc_base are connected through another
link.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
Changes in v5:
- reworked s_fmt to pass the same format from sink to source
- simplified enum_mbus_code
- separated tgt and bounds to report correctly in g_sel

Changes in v4:
As suggested by Jacopo:
- renamed atmel_isc_mc to atmel_isc_scaler.c
- moved init_mc/clean_mc to isc_base file

Changes in v2:
- implement try formats

 drivers/media/platform/atmel/Makefile         |   2 +-
 drivers/media/platform/atmel/atmel-isc-base.c |  73 ++++-
 .../media/platform/atmel/atmel-isc-scaler.c   | 261 ++++++++++++++++++
 drivers/media/platform/atmel/atmel-isc.h      |  40 +++
 .../media/platform/atmel/atmel-sama5d2-isc.c  |  14 +-
 .../media/platform/atmel/atmel-sama7g5-isc.c  |  12 +-
 6 files changed, 394 insertions(+), 8 deletions(-)
 create mode 100644 drivers/media/platform/atmel/atmel-isc-scaler.c

diff --git a/drivers/media/platform/atmel/Makefile b/drivers/media/platform/atmel/Makefile
index 794e8f739287..f02d03df89d6 100644
--- a/drivers/media/platform/atmel/Makefile
+++ b/drivers/media/platform/atmel/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 atmel-isc-objs = atmel-sama5d2-isc.o
 atmel-xisc-objs = atmel-sama7g5-isc.o
-atmel-isc-common-objs = atmel-isc-base.o atmel-isc-clk.o
+atmel-isc-common-objs = atmel-isc-base.o atmel-isc-clk.o atmel-isc-scaler.o
 
 obj-$(CONFIG_VIDEO_ATMEL_ISI) += atmel-isi.o
 obj-$(CONFIG_VIDEO_ATMEL_ISC_BASE) += atmel-isc-common.o
diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 67b4a2323fed..74f575544e09 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -1712,6 +1712,7 @@ static int isc_async_bound(struct v4l2_async_notifier *notifier,
 					      struct isc_device, v4l2_dev);
 	struct isc_subdev_entity *subdev_entity =
 		container_of(notifier, struct isc_subdev_entity, notifier);
+	int pad;
 
 	if (video_is_registered(&isc->video_dev)) {
 		v4l2_err(&isc->v4l2_dev, "only supports one sub-device.\n");
@@ -1720,6 +1721,16 @@ static int isc_async_bound(struct v4l2_async_notifier *notifier,
 
 	subdev_entity->sd = subdev;
 
+	pad = media_entity_get_fwnode_pad(&subdev->entity, asd->match.fwnode,
+					  MEDIA_PAD_FL_SOURCE);
+	if (pad < 0) {
+		v4l2_err(&isc->v4l2_dev, "failed to find pad for %s\n",
+			 subdev->name);
+		return pad;
+	}
+
+	isc->remote_pad = pad;
+
 	return 0;
 }
 
@@ -1734,8 +1745,8 @@ static void isc_async_unbind(struct v4l2_async_notifier *notifier,
 	v4l2_ctrl_handler_free(&isc->ctrls.handler);
 }
 
-static struct isc_format *find_format_by_code(struct isc_device *isc,
-					      unsigned int code, int *index)
+struct isc_format *isc_find_format_by_code(struct isc_device *isc,
+					   unsigned int code, int *index)
 {
 	struct isc_format *fmt = &isc->formats_list[0];
 	unsigned int i;
@@ -1751,6 +1762,7 @@ static struct isc_format *find_format_by_code(struct isc_device *isc,
 
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(isc_find_format_by_code);
 
 static int isc_formats_init(struct isc_device *isc)
 {
@@ -1767,7 +1779,7 @@ static int isc_formats_init(struct isc_device *isc)
 	       NULL, &mbus_code)) {
 		mbus_code.index++;
 
-		fmt = find_format_by_code(isc, mbus_code.code, &i);
+		fmt = isc_find_format_by_code(isc, mbus_code.code, &i);
 		if (!fmt) {
 			v4l2_warn(&isc->v4l2_dev, "Mbus code %x not supported\n",
 				  mbus_code.code);
@@ -1893,7 +1905,8 @@ static int isc_async_complete(struct v4l2_async_notifier *notifier)
 	vdev->queue		= q;
 	vdev->lock		= &isc->lock;
 	vdev->ctrl_handler	= &isc->ctrls.handler;
-	vdev->device_caps	= V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_CAPTURE;
+	vdev->device_caps	= V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_CAPTURE |
+				  V4L2_CAP_IO_MC;
 	video_set_drvdata(vdev, isc);
 
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
@@ -1903,8 +1916,18 @@ static int isc_async_complete(struct v4l2_async_notifier *notifier)
 		goto isc_async_complete_err;
 	}
 
+	ret = isc_scaler_link(isc);
+	if (ret < 0)
+		goto isc_async_complete_unregister_device;
+
+	ret = media_device_register(&isc->mdev);
+	if (ret < 0)
+		goto isc_async_complete_unregister_device;
 	return 0;
 
+isc_async_complete_unregister_device:
+	video_unregister_device(vdev);
+
 isc_async_complete_err:
 	mutex_destroy(&isc->lock);
 	return ret;
@@ -1971,6 +1994,48 @@ int isc_pipeline_init(struct isc_device *isc)
 }
 EXPORT_SYMBOL_GPL(isc_pipeline_init);
 
+int isc_mc_init(struct isc_device *isc, u32 ver)
+{
+	const struct of_device_id *match;
+	int ret;
+
+	isc->video_dev.entity.function = MEDIA_ENT_F_IO_V4L;
+	isc->video_dev.entity.flags = MEDIA_ENT_FL_DEFAULT;
+	isc->pads[ISC_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+
+	ret = media_entity_pads_init(&isc->video_dev.entity, ISC_PADS_NUM,
+				     isc->pads);
+	if (ret < 0) {
+		dev_err(isc->dev, "media entity init failed\n");
+		return ret;
+	}
+
+	isc->mdev.dev = isc->dev;
+
+	match = of_match_node(isc->dev->driver->of_match_table,
+			      isc->dev->of_node);
+
+	strscpy(isc->mdev.driver_name, KBUILD_MODNAME,
+		sizeof(isc->mdev.driver_name));
+	strscpy(isc->mdev.model, match->compatible, sizeof(isc->mdev.model));
+	snprintf(isc->mdev.bus_info, sizeof(isc->mdev.bus_info), "platform:%s",
+		 isc->v4l2_dev.name);
+	isc->mdev.hw_revision = ver;
+
+	media_device_init(&isc->mdev);
+
+	isc->v4l2_dev.mdev = &isc->mdev;
+
+	return isc_scaler_init(isc);
+}
+EXPORT_SYMBOL_GPL(isc_mc_init);
+
+void isc_mc_cleanup(struct isc_device *isc)
+{
+	media_entity_cleanup(&isc->video_dev.entity);
+}
+EXPORT_SYMBOL_GPL(isc_mc_cleanup);
+
 /* regmap configuration */
 #define ATMEL_ISC_REG_MAX    0xd5c
 const struct regmap_config isc_regmap_config = {
diff --git a/drivers/media/platform/atmel/atmel-isc-scaler.c b/drivers/media/platform/atmel/atmel-isc-scaler.c
new file mode 100644
index 000000000000..0c1f49db47b4
--- /dev/null
+++ b/drivers/media/platform/atmel/atmel-isc-scaler.c
@@ -0,0 +1,261 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Microchip Image Sensor Controller (ISC) Scaler entity support
+ *
+ * Copyright (C) 2022 Microchip Technology, Inc.
+ *
+ * Author: Eugen Hristev <eugen.hristev@microchip.com>
+ *
+ */
+
+#include <media/media-device.h>
+#include <media/media-entity.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-subdev.h>
+
+#include "atmel-isc-regs.h"
+#include "atmel-isc.h"
+
+static int isc_scaler_get_fmt(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state,
+			      struct v4l2_subdev_format *format)
+{
+	struct isc_device *isc = container_of(sd, struct isc_device, scaler_sd);
+	struct v4l2_mbus_framefmt *v4l2_try_fmt;
+
+	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
+		v4l2_try_fmt = v4l2_subdev_get_try_format(sd, sd_state,
+							  format->pad);
+		format->format = *v4l2_try_fmt;
+
+		return 0;
+	}
+
+	if (format->pad == ISC_SCALER_PAD_SOURCE)
+		format->format = isc->scaler_format_source;
+	else
+		format->format = isc->scaler_format_sink;
+
+	return 0;
+}
+
+static int isc_scaler_set_fmt(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state,
+			      struct v4l2_subdev_format *req_fmt)
+{
+	struct isc_device *isc = container_of(sd, struct isc_device, scaler_sd);
+	struct v4l2_mbus_framefmt *v4l2_try_fmt;
+	struct isc_format *fmt;
+	unsigned int i;
+
+	/* Source format is fixed, we cannot change it */
+	if (req_fmt->pad == ISC_SCALER_PAD_SOURCE) {
+		req_fmt->format = isc->scaler_format_source;
+		return 0;
+	}
+
+	/* There is no limit on the frame size on the sink pad */
+	v4l_bound_align_image
+		(&req_fmt->format.width, 16, UINT_MAX, 0,
+		 &req_fmt->format.height, 16, UINT_MAX, 0, 0);
+
+	req_fmt->format.colorspace = V4L2_COLORSPACE_SRGB;
+	req_fmt->format.field = V4L2_FIELD_NONE;
+	req_fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	req_fmt->format.quantization = V4L2_QUANTIZATION_DEFAULT;
+	req_fmt->format.xfer_func = V4L2_XFER_FUNC_DEFAULT;
+
+	fmt = isc_find_format_by_code(isc, req_fmt->format.code, &i);
+
+	if (!fmt)
+		fmt = &isc->formats_list[0];
+
+	req_fmt->format.code = fmt->mbus_code;
+
+	if (req_fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
+		v4l2_try_fmt = v4l2_subdev_get_try_format(sd, sd_state,
+							  req_fmt->pad);
+		*v4l2_try_fmt = req_fmt->format;
+		/* Trying on the sink pad makes the source pad change too */
+		v4l2_try_fmt =
+			 v4l2_subdev_get_try_format(sd, sd_state,
+						    ISC_SCALER_PAD_SOURCE);
+		*v4l2_try_fmt = req_fmt->format;
+
+		v4l_bound_align_image(&v4l2_try_fmt->width,
+				      16, isc->max_width, 0,
+				      &v4l2_try_fmt->height,
+				      16, isc->max_height, 0, 0);
+		/* if we are just trying, we are done */
+		return 0;
+	}
+
+	isc->scaler_format_sink = req_fmt->format;
+
+	/* The source pad is the same as the sink, but we have to crop it */
+	isc->scaler_format_source = isc->scaler_format_sink;
+	v4l_bound_align_image
+		(&isc->scaler_format_source.width, 16, isc->max_width, 0,
+		 &isc->scaler_format_source.height, 16, isc->max_height, 0, 0);
+
+	return 0;
+}
+
+static int isc_scaler_enum_mbus_code(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *sd_state,
+				     struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct isc_device *isc = container_of(sd, struct isc_device, scaler_sd);
+
+	/*
+	 * All formats supported by the ISC are supported by the scaler.
+	 * Advertise the formats which the ISC can take as input, as the scaler
+	 * entity cropping is part of the PFE module (parallel front end)
+	 */
+	if (code->index < isc->formats_list_size) {
+		code->code = isc->formats_list[code->index].mbus_code;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int isc_scaler_g_sel(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *sd_state,
+			    struct v4l2_subdev_selection *sel)
+{
+	struct isc_device *isc = container_of(sd, struct isc_device, scaler_sd);
+
+	if (sel->pad == ISC_SCALER_PAD_SOURCE)
+		return -EINVAL;
+
+	if (sel->target == V4L2_SEL_TGT_CROP_BOUNDS) {
+		/* bounds are the input format received */
+		sel->r.height = isc->scaler_format_sink.height;
+		sel->r.width = isc->scaler_format_sink.width;
+		sel->r.left = 0;
+		sel->r.top = 0;
+	} else if (sel->target == V4L2_SEL_TGT_CROP) {
+		/*
+		 * crop is done to the output format,
+		 * limited by ISC maximum size
+		 */
+		sel->r.height = isc->scaler_format_source.height;
+		sel->r.width = isc->scaler_format_source.width;
+		sel->r.left = 0;
+		sel->r.top = 0;
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int isc_scaler_init_cfg(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_mbus_framefmt *v4l2_try_fmt =
+		v4l2_subdev_get_try_format(sd, sd_state, 0);
+	struct isc_device *isc = container_of(sd, struct isc_device, scaler_sd);
+
+	*v4l2_try_fmt = isc->scaler_format_source;
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops isc_scaler_pad_ops = {
+	.enum_mbus_code = isc_scaler_enum_mbus_code,
+	.set_fmt = isc_scaler_set_fmt,
+	.get_fmt = isc_scaler_get_fmt,
+	.get_selection = isc_scaler_g_sel,
+	.init_cfg = isc_scaler_init_cfg,
+};
+
+static const struct v4l2_subdev_ops xisc_scaler_subdev_ops = {
+	.pad = &isc_scaler_pad_ops,
+};
+
+int isc_scaler_init(struct isc_device *isc)
+{
+	int ret;
+
+	v4l2_subdev_init(&isc->scaler_sd, &xisc_scaler_subdev_ops);
+
+	isc->scaler_sd.owner = THIS_MODULE;
+	isc->scaler_sd.dev = isc->dev;
+	snprintf(isc->scaler_sd.name, sizeof(isc->scaler_sd.name),
+		 "atmel_isc_scaler");
+
+	isc->scaler_sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	isc->scaler_sd.entity.function = MEDIA_ENT_F_PROC_VIDEO_SCALER;
+	isc->scaler_pads[ISC_SCALER_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	isc->scaler_pads[ISC_SCALER_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+
+	isc->scaler_format_source.height = isc->max_height;
+	isc->scaler_format_source.width = isc->max_width;
+	isc->scaler_format_source.code = isc->formats_list[0].mbus_code;
+	isc->scaler_format_source.colorspace = V4L2_COLORSPACE_SRGB;
+	isc->scaler_format_source.field = V4L2_FIELD_NONE;
+	isc->scaler_format_source.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	isc->scaler_format_source.quantization = V4L2_QUANTIZATION_DEFAULT;
+	isc->scaler_format_source.xfer_func = V4L2_XFER_FUNC_DEFAULT;
+
+	isc->scaler_format_sink = isc->scaler_format_source;
+
+	ret = media_entity_pads_init(&isc->scaler_sd.entity,
+				     ISC_SCALER_PADS_NUM,
+				     isc->scaler_pads);
+	if (ret < 0) {
+		dev_err(isc->dev, "scaler sd media entity init failed\n");
+		return ret;
+	}
+	ret = v4l2_device_register_subdev(&isc->v4l2_dev, &isc->scaler_sd);
+	if (ret < 0) {
+		dev_err(isc->dev, "scaler sd failed to register subdev\n");
+		return ret;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(isc_scaler_init);
+
+int isc_scaler_link(struct isc_device *isc)
+{
+	int ret;
+
+	ret = media_create_pad_link(&isc->current_subdev->sd->entity,
+				    isc->remote_pad, &isc->scaler_sd.entity,
+				    ISC_SCALER_PAD_SINK,
+				    MEDIA_LNK_FL_ENABLED |
+				    MEDIA_LNK_FL_IMMUTABLE);
+
+	if (ret < 0) {
+		dev_err(isc->dev, "Failed to create pad link: %s to %s\n",
+			isc->current_subdev->sd->entity.name,
+			isc->scaler_sd.entity.name);
+		return ret;
+	}
+
+	dev_dbg(isc->dev, "link with %s pad: %d\n",
+		isc->current_subdev->sd->name, isc->remote_pad);
+
+	ret = media_create_pad_link(&isc->scaler_sd.entity,
+				    ISC_SCALER_PAD_SOURCE,
+				    &isc->video_dev.entity, ISC_PAD_SINK,
+				    MEDIA_LNK_FL_ENABLED |
+				    MEDIA_LNK_FL_IMMUTABLE);
+
+	if (ret < 0) {
+		dev_err(isc->dev, "Failed to create pad link: %s to %s\n",
+			isc->scaler_sd.entity.name,
+			isc->video_dev.entity.name);
+		return ret;
+	}
+
+	dev_dbg(isc->dev, "link with %s pad: %d\n", isc->scaler_sd.name,
+		ISC_SCALER_PAD_SOURCE);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(isc_scaler_link);
+
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index f9ad7ec6bd13..c1ca3916700e 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -183,6 +183,17 @@ struct isc_reg_offsets {
 	u32 his_entry;
 };
 
+enum isc_mc_pads {
+	ISC_PAD_SINK	= 0,
+	ISC_PADS_NUM	= 1,
+};
+
+enum isc_scaler_pads {
+	ISC_SCALER_PAD_SINK	= 0,
+	ISC_SCALER_PAD_SOURCE	= 1,
+	ISC_SCALER_PADS_NUM	= 2,
+};
+
 /*
  * struct isc_device - ISC device driver data/config struct
  * @regmap:		Register map
@@ -258,6 +269,14 @@ struct isc_reg_offsets {
  *			be used as an input to the controller
  * @controller_formats_size:	size of controller_formats array
  * @formats_list_size:	size of formats_list array
+ * @pads:		media controller pads for isc video entity
+ * @mdev:		media device that is registered by the isc
+ * @remote_pad:		remote pad on the connected subdevice
+ * @scaler_sd:		subdevice for the scaler that isc registers
+ * @scaler_pads:	media controller pads for the scaler subdevice
+ * @scaler_format_sink:	current format for the scaler subdevice on the sink pad
+ * @scaler_format_source:	current format for the scaler subdevice on the
+ *			source pad
  */
 struct isc_device {
 	struct regmap		*regmap;
@@ -346,6 +365,20 @@ struct isc_device {
 	struct isc_format		*formats_list;
 	u32				controller_formats_size;
 	u32				formats_list_size;
+
+	struct {
+		struct media_pad		pads[ISC_PADS_NUM];
+		struct media_device		mdev;
+
+		u32				remote_pad;
+	};
+
+	struct {
+		struct v4l2_subdev		scaler_sd;
+		struct media_pad		scaler_pads[ISC_SCALER_PADS_NUM];
+		struct v4l2_mbus_framefmt	scaler_format_sink;
+		struct v4l2_mbus_framefmt	scaler_format_source;
+	};
 };
 
 extern const struct regmap_config isc_regmap_config;
@@ -357,4 +390,11 @@ int isc_clk_init(struct isc_device *isc);
 void isc_subdev_cleanup(struct isc_device *isc);
 void isc_clk_cleanup(struct isc_device *isc);
 
+int isc_scaler_link(struct isc_device *isc);
+int isc_scaler_init(struct isc_device *isc);
+int isc_mc_init(struct isc_device *isc, u32 ver);
+void isc_mc_cleanup(struct isc_device *isc);
+
+struct isc_format *isc_find_format_by_code(struct isc_device *isc,
+					   unsigned int code, int *index);
 #endif
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index c5b9563e36cb..c244682ea22f 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -553,6 +553,12 @@ static int atmel_isc_probe(struct platform_device *pdev)
 			break;
 	}
 
+	regmap_read(isc->regmap, ISC_VERSION + isc->offsets.version, &ver);
+
+	ret = isc_mc_init(isc, ver);
+	if (ret < 0)
+		goto isc_probe_mc_init_err;
+
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 	pm_request_idle(dev);
@@ -562,7 +568,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	ret = clk_prepare_enable(isc->ispck);
 	if (ret) {
 		dev_err(dev, "failed to enable ispck: %d\n", ret);
-		goto cleanup_subdev;
+		goto isc_probe_mc_init_err;
 	}
 
 	/* ispck should be greater or equal to hclock */
@@ -572,7 +578,6 @@ static int atmel_isc_probe(struct platform_device *pdev)
 		goto unprepare_clk;
 	}
 
-	regmap_read(isc->regmap, ISC_VERSION + isc->offsets.version, &ver);
 	dev_info(dev, "Microchip ISC version %x\n", ver);
 
 	return 0;
@@ -580,6 +585,9 @@ static int atmel_isc_probe(struct platform_device *pdev)
 unprepare_clk:
 	clk_disable_unprepare(isc->ispck);
 
+isc_probe_mc_init_err:
+	isc_mc_cleanup(isc);
+
 cleanup_subdev:
 	isc_subdev_cleanup(isc);
 
@@ -600,6 +608,8 @@ static int atmel_isc_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 
+	isc_mc_cleanup(isc);
+
 	isc_subdev_cleanup(isc);
 
 	v4l2_device_unregister(&isc->v4l2_dev);
diff --git a/drivers/media/platform/atmel/atmel-sama7g5-isc.c b/drivers/media/platform/atmel/atmel-sama7g5-isc.c
index 07a80b08bc54..9dc75eed0098 100644
--- a/drivers/media/platform/atmel/atmel-sama7g5-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama7g5-isc.c
@@ -547,15 +547,23 @@ static int microchip_xisc_probe(struct platform_device *pdev)
 			break;
 	}
 
+	regmap_read(isc->regmap, ISC_VERSION + isc->offsets.version, &ver);
+
+	ret = isc_mc_init(isc, ver);
+	if (ret < 0)
+		goto isc_probe_mc_init_err;
+
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 	pm_request_idle(dev);
 
-	regmap_read(isc->regmap, ISC_VERSION + isc->offsets.version, &ver);
 	dev_info(dev, "Microchip XISC version %x\n", ver);
 
 	return 0;
 
+isc_probe_mc_init_err:
+	isc_mc_cleanup(isc);
+
 cleanup_subdev:
 	isc_subdev_cleanup(isc);
 
@@ -576,6 +584,8 @@ static int microchip_xisc_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 
+	isc_mc_cleanup(isc);
+
 	isc_subdev_cleanup(isc);
 
 	v4l2_device_unregister(&isc->v4l2_dev);
-- 
2.25.1

