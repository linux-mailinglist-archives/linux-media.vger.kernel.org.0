Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 542B8472E0D
	for <lists+linux-media@lfdr.de>; Mon, 13 Dec 2021 14:53:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238244AbhLMNxP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Dec 2021 08:53:15 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:49184 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233710AbhLMNxO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Dec 2021 08:53:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1639403594; x=1670939594;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=esOOm8RQYV5P3dSThEjYu+7IvonP6Mhh0R8KFp/Qhkg=;
  b=fCoc5gvkOYb/Dsn+umPNUD4/Kr6ZwkdMOC3oNmUz/PJ/f5pfHClGBY31
   88oNC6XEPiOgPQ1okBpOfYFIb2EjEqOgMGIwG0HqOOc5lg2EY2ROhfD0C
   HON/YtvWcEmGKWih+srLSUE97MJ50iOVDigHxA3rpqsKOdOKRSQTfzgcz
   VKLXtoe0JhCXFVpoypF9gQ9lM4sFDXhTqASsYLq8lTmy5wVPpuardetH2
   BS9V+WlUaRKpHFM7rtQ81+kgL0FLHauaSh33B9Iwf8xtV/U8OJfEjzUCd
   +bk5vwBsXIXi5Yoj/d6Z2l9ntQfoFZWWDHO7kD4K5uzlXGHNah6voozkj
   Q==;
IronPort-SDR: C6FGPVFU57i6SBHwSf71K9Wuh3aWyFfBpNyxh0rLcOw4Ws7rLUq9lc/bdLv+XUWZ7cSLQ6NC7X
 QYSTa16O62An6cNM3oQZsOTERTuaRExt3AQE+85DzrzqvXJfOJIRdKF2u+tvg35GMedj7/SwgX
 QuGK2RG3XeRHO4n65nu/h8PZnw+hTczVqJC6sBZ2KAIdzj1otFnyw5/sHAYwiIf30mNyqwN91D
 3FO8zWLu2+L0/QEsnZDml+K7iqEC2oqq6EzBOkWmXYNhjVHVK2gJGohqPSEngp7DxxlUiPcNID
 0WJRwzFciWFRfIDMGv4mL1Ua
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; 
   d="scan'208";a="79361777"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Dec 2021 06:53:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 13 Dec 2021 06:53:13 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 13 Dec 2021 06:53:01 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <robh+dt@kernel.org>,
        <jacopo@jmondi.org>, <laurent.pinchart@ideasonboard.com>,
        <sakari.ailus@iki.fi>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <nicolas.ferre@microchip.com>,
        "Eugen Hristev" <eugen.hristev@microchip.com>
Subject: [PATCH v3 12/23] media: atmel: atmel-isc: implement media controller
Date:   Mon, 13 Dec 2021 15:49:29 +0200
Message-ID: <20211213134940.324266-13-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213134940.324266-1-eugen.hristev@microchip.com>
References: <20211213134940.324266-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Changes in v2:
- implement try formats

 drivers/media/platform/atmel/Makefile         |   2 +-
 drivers/media/platform/atmel/atmel-isc-base.c |  27 +-
 drivers/media/platform/atmel/atmel-isc-mc.c   | 287 ++++++++++++++++++
 drivers/media/platform/atmel/atmel-isc.h      |  36 +++
 .../media/platform/atmel/atmel-sama5d2-isc.c  |  14 +-
 .../media/platform/atmel/atmel-sama7g5-isc.c  |  12 +-
 6 files changed, 370 insertions(+), 8 deletions(-)
 create mode 100644 drivers/media/platform/atmel/atmel-isc-mc.c

diff --git a/drivers/media/platform/atmel/Makefile b/drivers/media/platform/atmel/Makefile
index 794e8f739287..aa7a18b428f6 100644
--- a/drivers/media/platform/atmel/Makefile
+++ b/drivers/media/platform/atmel/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 atmel-isc-objs = atmel-sama5d2-isc.o
 atmel-xisc-objs = atmel-sama7g5-isc.o
-atmel-isc-common-objs = atmel-isc-base.o atmel-isc-clk.o
+atmel-isc-common-objs = atmel-isc-base.o atmel-isc-clk.o atmel-isc-mc.o
 
 obj-$(CONFIG_VIDEO_ATMEL_ISI) += atmel-isi.o
 obj-$(CONFIG_VIDEO_ATMEL_ISC_BASE) += atmel-isc-common.o
diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index d0542b97a391..b0c3ed21f372 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -1726,6 +1726,7 @@ static int isc_async_bound(struct v4l2_async_notifier *notifier,
 					      struct isc_device, v4l2_dev);
 	struct isc_subdev_entity *subdev_entity =
 		container_of(notifier, struct isc_subdev_entity, notifier);
+	int pad;
 
 	if (video_is_registered(&isc->video_dev)) {
 		v4l2_err(&isc->v4l2_dev, "only supports one sub-device.\n");
@@ -1734,6 +1735,16 @@ static int isc_async_bound(struct v4l2_async_notifier *notifier,
 
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
 
@@ -1748,8 +1759,8 @@ static void isc_async_unbind(struct v4l2_async_notifier *notifier,
 	v4l2_ctrl_handler_free(&isc->ctrls.handler);
 }
 
-static struct isc_format *find_format_by_code(struct isc_device *isc,
-					      unsigned int code, int *index)
+struct isc_format *isc_find_format_by_code(struct isc_device *isc,
+					   unsigned int code, int *index)
 {
 	struct isc_format *fmt = &isc->formats_list[0];
 	unsigned int i;
@@ -1765,6 +1776,7 @@ static struct isc_format *find_format_by_code(struct isc_device *isc,
 
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(isc_find_format_by_code);
 
 static int isc_formats_init(struct isc_device *isc)
 {
@@ -1781,7 +1793,7 @@ static int isc_formats_init(struct isc_device *isc)
 	       NULL, &mbus_code)) {
 		mbus_code.index++;
 
-		fmt = find_format_by_code(isc, mbus_code.code, &i);
+		fmt = isc_find_format_by_code(isc, mbus_code.code, &i);
 		if (!fmt) {
 			v4l2_warn(&isc->v4l2_dev, "Mbus code %x not supported\n",
 				  mbus_code.code);
@@ -1909,7 +1921,8 @@ static int isc_async_complete(struct v4l2_async_notifier *notifier)
 	vdev->queue		= q;
 	vdev->lock		= &isc->lock;
 	vdev->ctrl_handler	= &isc->ctrls.handler;
-	vdev->device_caps	= V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_CAPTURE;
+	vdev->device_caps	= V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_CAPTURE |
+				  V4L2_CAP_IO_MC;
 	video_set_drvdata(vdev, isc);
 
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
@@ -1919,8 +1932,14 @@ static int isc_async_complete(struct v4l2_async_notifier *notifier)
 		goto isc_async_complete_err;
 	}
 
+	ret = isc_mc_register(isc);
+	if (ret < 0)
+		goto isc_async_complete_unregister_device;
 	return 0;
 
+isc_async_complete_unregister_device:
+	video_unregister_device(vdev);
+
 isc_async_complete_err:
 	mutex_destroy(&isc->lock);
 	return ret;
diff --git a/drivers/media/platform/atmel/atmel-isc-mc.c b/drivers/media/platform/atmel/atmel-isc-mc.c
new file mode 100644
index 000000000000..2aea81d77b2f
--- /dev/null
+++ b/drivers/media/platform/atmel/atmel-isc-mc.c
@@ -0,0 +1,287 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Microchip Image Sensor Controller (ISC) Media Controller support
+ *
+ * Copyright (C) 2021 Microchip Technology, Inc.
+ *
+ * Author: Eugen Hristev <eugen.hristev@microchip.com>
+ *
+ */
+
+#include <media/v4l2-device.h>
+#include <media/v4l2-subdev.h>
+
+#include "atmel-isc-regs.h"
+#include "atmel-isc.h"
+
+static const struct media_device_ops isc_media_ops = {
+};
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
+	format->format = isc->scaler_format;
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
+	if (req_fmt->pad == ISC_SCALER_PAD_SOURCE)
+		v4l_bound_align_image
+			(&req_fmt->format.width, 16, isc->max_width, 0,
+			 &req_fmt->format.height, 16, isc->max_height, 0, 0);
+	else
+		v4l_bound_align_image
+			(&req_fmt->format.width, 16, 10000, 0,
+			 &req_fmt->format.height, 16, 10000, 0, 0);
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
+		/* Trying on the pad sink makes the source sink change too */
+		if (req_fmt->pad == ISC_SCALER_PAD_SINK) {
+			v4l2_try_fmt =
+				v4l2_subdev_get_try_format(sd, sd_state,
+							   ISC_SCALER_PAD_SOURCE);
+			*v4l2_try_fmt = req_fmt->format;
+
+			v4l_bound_align_image(&v4l2_try_fmt->width,
+					      16, isc->max_width, 0,
+					      &v4l2_try_fmt->height,
+					      16, isc->max_height, 0, 0);
+		}
+		/* if we are just trying, we are done */
+		return 0;
+	}
+
+	isc->scaler_format = req_fmt->format;
+
+	return 0;
+}
+
+static int isc_scaler_enum_mbus_code(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *sd_state,
+				     struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct isc_device *isc = container_of(sd, struct isc_device, scaler_sd);
+	int supported_index = 0;
+	int i;
+
+	for (i = 0; i < isc->formats_list_size; i++) {
+		if (!isc->formats_list[i].sd_support)
+			continue;
+		if (supported_index == code->index) {
+			code->code = isc->formats_list[i].mbus_code;
+			return 0;
+		}
+		supported_index++;
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
+	if (sel->target != V4L2_SEL_TGT_CROP_BOUNDS &&
+	    sel->target != V4L2_SEL_TGT_CROP)
+		return -EINVAL;
+
+	sel->r.height = isc->max_height;
+	sel->r.width = isc->max_width;
+
+	sel->r.left = 0;
+	sel->r.top = 0;
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
+	*v4l2_try_fmt = isc->scaler_format;
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
+static int isc_init_own_sd(struct isc_device *isc)
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
+	isc->scaler_format.height = isc->max_height;
+	isc->scaler_format.width = isc->max_width;
+	isc->scaler_format.code = isc->formats_list[0].mbus_code;
+	isc->scaler_format.colorspace = V4L2_COLORSPACE_SRGB;
+	isc->scaler_format.field = V4L2_FIELD_NONE;
+	isc->scaler_format.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	isc->scaler_format.quantization = V4L2_QUANTIZATION_DEFAULT;
+	isc->scaler_format.xfer_func = V4L2_XFER_FUNC_DEFAULT;
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
+
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
+	isc->mdev.ops = &isc_media_ops;
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
+	return isc_init_own_sd(isc);
+}
+EXPORT_SYMBOL_GPL(isc_mc_init);
+
+int isc_mc_register(struct isc_device *isc)
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
+		v4l2_err(&isc->v4l2_dev,
+			 "Failed to create pad link: %s to %s\n",
+			 isc->current_subdev->sd->entity.name,
+			 isc->scaler_sd.entity.name);
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
+		v4l2_err(&isc->v4l2_dev,
+			 "Failed to create pad link: %s to %s\n",
+			 isc->scaler_sd.entity.name,
+			 isc->video_dev.entity.name);
+		return ret;
+	}
+
+	dev_dbg(isc->dev, "link with %s pad: %d\n", isc->scaler_sd.name,
+		ISC_SCALER_PAD_SOURCE);
+
+	return media_device_register(&isc->mdev);
+}
+EXPORT_SYMBOL_GPL(isc_mc_register);
+
+void isc_mc_cleanup(struct isc_device *isc)
+{
+	media_entity_cleanup(&isc->video_dev.entity);
+}
+EXPORT_SYMBOL_GPL(isc_mc_cleanup);
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index 07fa6dbf8460..0b6370d7775f 100644
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
@@ -258,6 +269,12 @@ struct isc_reg_offsets {
  *			be used as an input to the controller
  * @controller_formats_size:	size of controller_formats array
  * @formats_list_size:	size of formats_list array
+ * @pads:		media controller pads for isc video entity
+ * @mdev:		media device that is registered by the isc
+ * @remote_pad:		remote pad on the connected subdevice
+ * @scaler_sd:		subdevice for the scaler that isc registers
+ * @scaler_pads:	media controller pads for the scaler subdevice
+ * @scaler_format:	current format for the scaler subdevice
  */
 struct isc_device {
 	struct regmap		*regmap;
@@ -346,6 +363,19 @@ struct isc_device {
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
+		struct v4l2_mbus_framefmt	scaler_format;
+	};
 };
 
 extern const struct regmap_config isc_regmap_config;
@@ -357,4 +387,10 @@ int isc_clk_init(struct isc_device *isc);
 void isc_subdev_cleanup(struct isc_device *isc);
 void isc_clk_cleanup(struct isc_device *isc);
 
+int isc_mc_init(struct isc_device *isc, u32 ver);
+int isc_mc_register(struct isc_device *isc);
+void isc_mc_cleanup(struct isc_device *isc);
+
+struct isc_format *isc_find_format_by_code(struct isc_device *isc,
+					   unsigned int code, int *index);
 #endif
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index 1b2063cce0f7..a3e4c32a66c4 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -529,6 +529,12 @@ static int atmel_isc_probe(struct platform_device *pdev)
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
@@ -538,7 +544,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	ret = clk_prepare_enable(isc->ispck);
 	if (ret) {
 		dev_err(dev, "failed to enable ispck: %d\n", ret);
-		goto cleanup_subdev;
+		goto isc_probe_mc_init_err;
 	}
 
 	/* ispck should be greater or equal to hclock */
@@ -548,7 +554,6 @@ static int atmel_isc_probe(struct platform_device *pdev)
 		goto unprepare_clk;
 	}
 
-	regmap_read(isc->regmap, ISC_VERSION + isc->offsets.version, &ver);
 	dev_info(dev, "Microchip ISC version %x\n", ver);
 
 	return 0;
@@ -556,6 +561,9 @@ static int atmel_isc_probe(struct platform_device *pdev)
 unprepare_clk:
 	clk_disable_unprepare(isc->ispck);
 
+isc_probe_mc_init_err:
+	isc_mc_cleanup(isc);
+
 cleanup_subdev:
 	isc_subdev_cleanup(isc);
 
@@ -576,6 +584,8 @@ static int atmel_isc_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 
+	isc_mc_cleanup(isc);
+
 	isc_subdev_cleanup(isc);
 
 	v4l2_device_unregister(&isc->v4l2_dev);
diff --git a/drivers/media/platform/atmel/atmel-sama7g5-isc.c b/drivers/media/platform/atmel/atmel-sama7g5-isc.c
index 2b1082295c13..d2ac80b1ccc3 100644
--- a/drivers/media/platform/atmel/atmel-sama7g5-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama7g5-isc.c
@@ -523,15 +523,23 @@ static int microchip_xisc_probe(struct platform_device *pdev)
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
 
@@ -552,6 +560,8 @@ static int microchip_xisc_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 
+	isc_mc_cleanup(isc);
+
 	isc_subdev_cleanup(isc);
 
 	v4l2_device_unregister(&isc->v4l2_dev);
-- 
2.25.1

