Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8B3437344
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 09:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232564AbhJVH47 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 03:56:59 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:17436 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232021AbhJVH4x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 03:56:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634889276; x=1666425276;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ixD6BMudf6IYcKYrLkBMIKtHCcNCXzIxfXYr4uC2V80=;
  b=HHJYS5xRTESoDxhPHgFfRtn3WhRLtUcHIW0H5AUgpyCheJN/X+WRUzvy
   qUQMPKcLoVr4QpKwa2CdpYAGOtwTHqS+apkbTpW+AsRGFq513gqe+iGzQ
   hHnYJPOxm1SpixcuBnI0gpMNmXBB1S/ITZvFhClIZSofmL56SZ0BMccY3
   NeH2Hfe+k470h+Ke3PsqG7a+v4U2sjhXXld7zaEbjKqOtF9aOD+QYKl4q
   HLgP7Nz9ebtJbBFm3QupSFtDjEEc5cDOOdO2Tipn808UB+4bPaaONVGOD
   SUfLUry6XLF0UrYMMZ5NHV7j3mgy0Z4Hf3eItDe6UkCWd9rhpSnnb5y7r
   Q==;
IronPort-SDR: P0Ti7Dz2K/kJGe2hJuwL1ipx4Ctd0Q18SI2YCPAlG4w40z2ShnC2A5sCvRI9oJ9TO1LyyRg5aO
 O1PyaIsz6FlbzJJuNn9hJi2nyHrz93UZBOaUy9bcCIvC2N3wvMe5E/QPEaBigVr5jhIVvVakhD
 asZWGU6bg4v2UgIu9F9UuGOiZx5bH0x/wX74kJKz7E4FUrXi0ELmKl7G1QUV5ZKZnZaLJS81/c
 aLhVorfuWI+VNjIBXSBVy+GGH3RGqRSOhNQ43Xu0aajT9yidYzUgBIoY7OmUjPMzgLpIYFzri6
 PjuXKByd8qyHAen2y3XQJ4L9
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; 
   d="scan'208";a="136538115"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Oct 2021 00:54:35 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 22 Oct 2021 00:54:34 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 22 Oct 2021 00:54:32 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <jacopo@jmondi.org>, <laurent.pinchart@ideasonboard.com>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 14/21] media: atmel: atmel-isc: implement media controller
Date:   Fri, 22 Oct 2021 10:52:40 +0300
Message-ID: <20211022075247.518880-15-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022075247.518880-1-eugen.hristev@microchip.com>
References: <20211022075247.518880-1-eugen.hristev@microchip.com>
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
 drivers/media/platform/atmel/Makefile         |   2 +-
 drivers/media/platform/atmel/atmel-isc-base.c |  20 +-
 drivers/media/platform/atmel/atmel-isc-mc.c   | 235 ++++++++++++++++++
 drivers/media/platform/atmel/atmel-isc.h      |  28 +++
 .../media/platform/atmel/atmel-sama5d2-isc.c  |  14 +-
 .../media/platform/atmel/atmel-sama7g5-isc.c  |  12 +-
 6 files changed, 306 insertions(+), 5 deletions(-)
 create mode 100644 drivers/media/platform/atmel/atmel-isc-mc.c

diff --git a/drivers/media/platform/atmel/Makefile b/drivers/media/platform/atmel/Makefile
index 1f6fe7427769..90220eaefa20 100644
--- a/drivers/media/platform/atmel/Makefile
+++ b/drivers/media/platform/atmel/Makefile
@@ -3,7 +3,7 @@ atmel-isc-objs = atmel-sama5d2-isc.o
 atmel-xisc-objs = atmel-sama7g5-isc.o
 
 obj-$(CONFIG_VIDEO_ATMEL_ISI) += atmel-isi.o
-obj-$(CONFIG_VIDEO_ATMEL_ISC_BASE) += atmel-isc-base.o atmel-isc-clk.o
+obj-$(CONFIG_VIDEO_ATMEL_ISC_BASE) += atmel-isc-base.o atmel-isc-clk.o atmel-isc-mc.o
 obj-$(CONFIG_VIDEO_ATMEL_ISC) += atmel-isc.o
 obj-$(CONFIG_VIDEO_ATMEL_XISC) += atmel-xisc.o
 obj-$(CONFIG_VIDEO_MICROCHIP_CSI2DC) += microchip-csi2dc.o
diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index f782a9c0c07d..a0e4bc75d1a2 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -1727,6 +1727,7 @@ static int isc_async_bound(struct v4l2_async_notifier *notifier,
 					      struct isc_device, v4l2_dev);
 	struct isc_subdev_entity *subdev_entity =
 		container_of(notifier, struct isc_subdev_entity, notifier);
+	int pad;
 
 	if (video_is_registered(&isc->video_dev)) {
 		v4l2_err(&isc->v4l2_dev, "only supports one sub-device.\n");
@@ -1735,6 +1736,16 @@ static int isc_async_bound(struct v4l2_async_notifier *notifier,
 
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
 
@@ -1910,7 +1921,8 @@ static int isc_async_complete(struct v4l2_async_notifier *notifier)
 	vdev->queue		= q;
 	vdev->lock		= &isc->lock;
 	vdev->ctrl_handler	= &isc->ctrls.handler;
-	vdev->device_caps	= V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_CAPTURE;
+	vdev->device_caps	= V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_CAPTURE |
+				  V4L2_CAP_IO_MC;
 	video_set_drvdata(vdev, isc);
 
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
@@ -1920,8 +1932,14 @@ static int isc_async_complete(struct v4l2_async_notifier *notifier)
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
index 000000000000..fe9ebb46e270
--- /dev/null
+++ b/drivers/media/platform/atmel/atmel-isc-mc.c
@@ -0,0 +1,235 @@
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
+#include <linux/clk.h>
+#include <linux/clkdev.h>
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-subdev.h>
+#include <media/videobuf2-dma-contig.h>
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
+
+	format->format = isc->scaler_format;
+
+	if (format->pad == 1) {
+		if (format->format.height > isc->max_height)
+			format->format.height = isc->max_height;
+		if (format->format.width > isc->max_width)
+			format->format.width = isc->max_width;
+	}
+
+	return 0;
+}
+
+static int isc_scaler_set_fmt(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state,
+			      struct v4l2_subdev_format *req_fmt)
+{
+	struct isc_device *isc = container_of(sd, struct isc_device, scaler_sd);
+
+	if (req_fmt->pad == 1) {
+		if (req_fmt->format.height > isc->max_height)
+			req_fmt->format.height = isc->max_height;
+		if (req_fmt->format.width > isc->max_width)
+			req_fmt->format.width = isc->max_width;
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
+static const struct v4l2_subdev_pad_ops isc_scaler_pad_ops = {
+	.enum_mbus_code = isc_scaler_enum_mbus_code,
+	.set_fmt = isc_scaler_set_fmt,
+	.get_fmt = isc_scaler_get_fmt,
+	.get_selection = isc_scaler_g_sel,
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
+
+void isc_mc_cleanup(struct isc_device *isc)
+{
+	media_entity_cleanup(&isc->video_dev.entity);
+}
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index dd45e9ca22a9..27292c50915e 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -176,6 +176,17 @@ struct isc_reg_offsets {
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
@@ -339,6 +350,19 @@ struct isc_device {
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
@@ -350,4 +374,8 @@ int isc_clk_init(struct isc_device *isc);
 void isc_subdev_cleanup(struct isc_device *isc);
 void isc_clk_cleanup(struct isc_device *isc);
 
+int isc_mc_init(struct isc_device *isc, u32 ver);
+int isc_mc_register(struct isc_device *isc);
+void isc_mc_cleanup(struct isc_device *isc);
+
 #endif
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index e29a9193bac8..8c088ad899ea 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -528,6 +528,12 @@ static int atmel_isc_probe(struct platform_device *pdev)
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
@@ -537,7 +543,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	ret = clk_prepare_enable(isc->ispck);
 	if (ret) {
 		dev_err(dev, "failed to enable ispck: %d\n", ret);
-		goto cleanup_subdev;
+		goto isc_probe_mc_init_err;
 	}
 
 	/* ispck should be greater or equal to hclock */
@@ -547,7 +553,6 @@ static int atmel_isc_probe(struct platform_device *pdev)
 		goto unprepare_clk;
 	}
 
-	regmap_read(isc->regmap, ISC_VERSION + isc->offsets.version, &ver);
 	dev_info(dev, "Microchip ISC version %x\n", ver);
 
 	return 0;
@@ -555,6 +560,9 @@ static int atmel_isc_probe(struct platform_device *pdev)
 unprepare_clk:
 	clk_disable_unprepare(isc->ispck);
 
+isc_probe_mc_init_err:
+	isc_mc_cleanup(isc);
+
 cleanup_subdev:
 	isc_subdev_cleanup(isc);
 
@@ -575,6 +583,8 @@ static int atmel_isc_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 
+	isc_mc_cleanup(isc);
+
 	isc_subdev_cleanup(isc);
 
 	v4l2_device_unregister(&isc->v4l2_dev);
diff --git a/drivers/media/platform/atmel/atmel-sama7g5-isc.c b/drivers/media/platform/atmel/atmel-sama7g5-isc.c
index 6a5d3f7ce75e..3484971ff9be 100644
--- a/drivers/media/platform/atmel/atmel-sama7g5-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama7g5-isc.c
@@ -522,15 +522,23 @@ static int microchip_xisc_probe(struct platform_device *pdev)
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
 
@@ -551,6 +559,8 @@ static int microchip_xisc_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 
+	isc_mc_cleanup(isc);
+
 	isc_subdev_cleanup(isc);
 
 	v4l2_device_unregister(&isc->v4l2_dev);
-- 
2.25.1

