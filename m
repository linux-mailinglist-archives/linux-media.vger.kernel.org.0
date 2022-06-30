Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2E1562691
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 01:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230518AbiF3XIt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 19:08:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231417AbiF3XIs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 19:08:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CA7B3207C
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 16:08:36 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80BC2271F;
        Fri,  1 Jul 2022 01:07:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656630469;
        bh=4FeiZ7c73JZgToccpph3ANMssfP5Dr6G5nS5vimgzbc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=X4YGCb79EnKjCAD0YzY3jGXtd/35LxB9hABFAHrq7iCxmGbHnQ3Q8luRNwtF+YXXQ
         zIIJmjSORqBNBx5kg0jT9FMuBCAS1ylKKr0L15KcGA6CsY+PJOz/+8PoD6M0KSvO0u
         5jTtpFq3lBrFP9GZ9pw2JIjZy0aHt4dvlsrEhteg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v2 19/55] media: rkisp1: Split CSI handling to separate file
Date:   Fri,  1 Jul 2022 02:06:37 +0300
Message-Id: <20220630230713.10580-20-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Paul Elder <paul.elder@ideasonboard.com>

Not all ISP instances include a MIPI CSI-2 receiver. To prepare for
making it optional, move code related to the CSI-2 receiver to a
separate file.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Initialize csi->rkisp1
- Fix dev_err_probe() usage
- Fix white space issue
---
 .../media/platform/rockchip/rkisp1/Makefile   |   1 +
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  17 +-
 .../platform/rockchip/rkisp1/rkisp1-csi.c     | 193 ++++++++++++++++++
 .../platform/rockchip/rkisp1/rkisp1-csi.h     |  28 +++
 .../platform/rockchip/rkisp1/rkisp1-dev.c     |  32 +--
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 153 +-------------
 6 files changed, 257 insertions(+), 167 deletions(-)
 create mode 100644 drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
 create mode 100644 drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h

diff --git a/drivers/media/platform/rockchip/rkisp1/Makefile b/drivers/media/platform/rockchip/rkisp1/Makefile
index f7543a82aa10..b3844c4f7623 100644
--- a/drivers/media/platform/rockchip/rkisp1/Makefile
+++ b/drivers/media/platform/rockchip/rkisp1/Makefile
@@ -2,6 +2,7 @@
 
 rockchip-isp1-y := rkisp1-capture.o \
 		   rkisp1-common.o \
+		   rkisp1-csi.o \
 		   rkisp1-dev.o \
 		   rkisp1-isp.o \
 		   rkisp1-resizer.o \
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index f08b3dec1465..4ba30f172c8b 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -123,7 +123,6 @@ struct rkisp1_info {
  * @mbus_flags:		media bus (V4L2_MBUS_*) flags
  * @sd:			a pointer to v4l2_subdev struct of the sensor
  * @pixel_rate_ctrl:	pixel rate of the sensor, used to initialize the phy
- * @dphy:		a pointer to the phy
  */
 struct rkisp1_sensor_async {
 	struct v4l2_async_subdev asd;
@@ -134,7 +133,19 @@ struct rkisp1_sensor_async {
 	unsigned int mbus_flags;
 	struct v4l2_subdev *sd;
 	struct v4l2_ctrl *pixel_rate_ctrl;
+};
+
+/*
+ * struct rkisp1_csi - CSI receiver subdev
+ *
+ * @rkisp1: pointer to the rkisp1 device
+ * @dphy: a pointer to the phy
+ * @is_dphy_errctrl_disabled: if dphy errctrl is disabled (avoid endless interrupt)
+ */
+struct rkisp1_csi {
+	struct rkisp1_device *rkisp1;
 	struct phy *dphy;
+	bool is_dphy_errctrl_disabled;
 };
 
 /*
@@ -147,7 +158,6 @@ struct rkisp1_sensor_async {
  * @sink_fmt:			input format
  * @src_fmt:			output format
  * @ops_lock:			ops serialization
- * @is_dphy_errctrl_disabled:	if dphy errctrl is disabled (avoid endless interrupt)
  * @frame_sequence:		used to synchronize frame_id between video devices.
  */
 struct rkisp1_isp {
@@ -157,7 +167,6 @@ struct rkisp1_isp {
 	const struct rkisp1_mbus_info *sink_fmt;
 	const struct rkisp1_mbus_info *src_fmt;
 	struct mutex ops_lock; /* serialize the subdevice ops */
-	bool is_dphy_errctrl_disabled;
 	__u32 frame_sequence;
 };
 
@@ -402,6 +411,7 @@ struct rkisp1_debug {
  * @media_dev:	   media_device variable
  * @notifier:	   a notifier to register on the v4l2-async API to be notified on the sensor
  * @active_sensor: sensor in-use, set when streaming on
+ * @csi:	   internal CSI-2 receiver
  * @isp:	   ISP sub-device
  * @resizer_devs:  resizer sub-devices
  * @capture_devs:  capture devices
@@ -421,6 +431,7 @@ struct rkisp1_device {
 	struct media_device media_dev;
 	struct v4l2_async_notifier notifier;
 	struct rkisp1_sensor_async *active_sensor;
+	struct rkisp1_csi csi;
 	struct rkisp1_isp isp;
 	struct rkisp1_resizer resizer_devs[2];
 	struct rkisp1_capture capture_devs[2];
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
new file mode 100644
index 000000000000..b5732511459f
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Rockchip ISP1 Driver - CSI-2 Receiver
+ *
+ * Copyright (C) 2019 Collabora, Ltd.
+ * Copyright (C) 2022 Ideas on Board
+ *
+ * Based on Rockchip ISP1 driver by Rockchip Electronics Co., Ltd.
+ * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
+ */
+
+#include <linux/device.h>
+#include <linux/phy/phy.h>
+#include <linux/phy/phy-mipi-dphy.h>
+
+#include <media/v4l2-ctrls.h>
+
+#include "rkisp1-common.h"
+#include "rkisp1-csi.h"
+
+int rkisp1_config_mipi(struct rkisp1_csi *csi)
+{
+	struct rkisp1_device *rkisp1 = csi->rkisp1;
+	const struct rkisp1_mbus_info *sink_fmt = rkisp1->isp.sink_fmt;
+	unsigned int lanes = rkisp1->active_sensor->lanes;
+	u32 mipi_ctrl;
+
+	if (lanes < 1 || lanes > 4)
+		return -EINVAL;
+
+	mipi_ctrl = RKISP1_CIF_MIPI_CTRL_NUM_LANES(lanes - 1) |
+		    RKISP1_CIF_MIPI_CTRL_SHUTDOWNLANES(0xf) |
+		    RKISP1_CIF_MIPI_CTRL_ERR_SOT_SYNC_HS_SKIP |
+		    RKISP1_CIF_MIPI_CTRL_CLOCKLANE_ENA;
+
+	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_CTRL, mipi_ctrl);
+
+	/* V12 could also use a newer csi2-host, but we don't want that yet */
+	if (rkisp1->info->isp_ver == RKISP1_V12)
+		rkisp1_write(rkisp1, RKISP1_CIF_ISP_CSI0_CTRL0, 0);
+
+	/* Configure Data Type and Virtual Channel */
+	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_IMG_DATA_SEL,
+		     RKISP1_CIF_MIPI_DATA_SEL_DT(sink_fmt->mipi_dt) |
+		     RKISP1_CIF_MIPI_DATA_SEL_VC(0));
+
+	/* Clear MIPI interrupts */
+	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_ICR, ~0);
+
+	/*
+	 * Disable RKISP1_CIF_MIPI_ERR_DPHY interrupt here temporary for
+	 * isp bus may be dead when switch isp.
+	 */
+	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_IMSC,
+		     RKISP1_CIF_MIPI_FRAME_END | RKISP1_CIF_MIPI_ERR_CSI |
+		     RKISP1_CIF_MIPI_ERR_DPHY |
+		     RKISP1_CIF_MIPI_SYNC_FIFO_OVFLW(0x03) |
+		     RKISP1_CIF_MIPI_ADD_DATA_OVFLW);
+
+	dev_dbg(rkisp1->dev, "\n  MIPI_CTRL 0x%08x\n"
+		"  MIPI_IMG_DATA_SEL 0x%08x\n"
+		"  MIPI_STATUS 0x%08x\n"
+		"  MIPI_IMSC 0x%08x\n",
+		rkisp1_read(rkisp1, RKISP1_CIF_MIPI_CTRL),
+		rkisp1_read(rkisp1, RKISP1_CIF_MIPI_IMG_DATA_SEL),
+		rkisp1_read(rkisp1, RKISP1_CIF_MIPI_STATUS),
+		rkisp1_read(rkisp1, RKISP1_CIF_MIPI_IMSC));
+
+	return 0;
+}
+
+int rkisp1_mipi_csi2_start(struct rkisp1_csi *csi,
+			   struct rkisp1_sensor_async *sensor)
+{
+	struct rkisp1_device *rkisp1 = csi->rkisp1;
+	union phy_configure_opts opts;
+	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
+	s64 pixel_clock;
+
+	pixel_clock = v4l2_ctrl_g_ctrl_int64(sensor->pixel_rate_ctrl);
+	if (!pixel_clock) {
+		dev_err(rkisp1->dev, "Invalid pixel rate value\n");
+		return -EINVAL;
+	}
+
+	phy_mipi_dphy_get_default_config(pixel_clock,
+					 rkisp1->isp.sink_fmt->bus_width,
+					 sensor->lanes, cfg);
+	phy_set_mode(csi->dphy, PHY_MODE_MIPI_DPHY);
+	phy_configure(csi->dphy, &opts);
+	phy_power_on(csi->dphy);
+
+	return 0;
+}
+
+void rkisp1_mipi_csi2_stop(struct rkisp1_csi *csi)
+{
+	phy_power_off(csi->dphy);
+}
+
+void rkisp1_mipi_start(struct rkisp1_csi *csi)
+{
+	struct rkisp1_device *rkisp1 = csi->rkisp1;
+	u32 val;
+
+	val = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_CTRL);
+	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_CTRL,
+		     val | RKISP1_CIF_MIPI_CTRL_OUTPUT_ENA);
+}
+
+void rkisp1_mipi_stop(struct rkisp1_csi *csi)
+{
+	struct rkisp1_device *rkisp1 = csi->rkisp1;
+	u32 val;
+
+	/* Mask and clear interrupts. */
+	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_IMSC, 0);
+	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_ICR, ~0);
+
+	val = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_CTRL);
+	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_CTRL,
+		     val & (~RKISP1_CIF_MIPI_CTRL_OUTPUT_ENA));
+}
+
+irqreturn_t rkisp1_mipi_isr(int irq, void *ctx)
+{
+	struct device *dev = ctx;
+	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
+	u32 val, status;
+
+	status = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_MIS);
+	if (!status)
+		return IRQ_NONE;
+
+	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_ICR, status);
+
+	/*
+	 * Disable DPHY errctrl interrupt, because this dphy
+	 * erctrl signal is asserted until the next changes
+	 * of line state. This time is may be too long and cpu
+	 * is hold in this interrupt.
+	 */
+	if (status & RKISP1_CIF_MIPI_ERR_CTRL(0x0f)) {
+		val = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_IMSC);
+		rkisp1_write(rkisp1, RKISP1_CIF_MIPI_IMSC,
+			     val & ~RKISP1_CIF_MIPI_ERR_CTRL(0x0f));
+		rkisp1->csi.is_dphy_errctrl_disabled = true;
+	}
+
+	/*
+	 * Enable DPHY errctrl interrupt again, if mipi have receive
+	 * the whole frame without any error.
+	 */
+	if (status == RKISP1_CIF_MIPI_FRAME_END) {
+		/*
+		 * Enable DPHY errctrl interrupt again, if mipi have receive
+		 * the whole frame without any error.
+		 */
+		if (rkisp1->csi.is_dphy_errctrl_disabled) {
+			val = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_IMSC);
+			val |= RKISP1_CIF_MIPI_ERR_CTRL(0x0f);
+			rkisp1_write(rkisp1, RKISP1_CIF_MIPI_IMSC, val);
+			rkisp1->csi.is_dphy_errctrl_disabled = false;
+		}
+	} else {
+		rkisp1->debug.mipi_error++;
+	}
+
+	return IRQ_HANDLED;
+}
+
+int rkisp1_csi_init(struct rkisp1_device *rkisp1)
+{
+	struct rkisp1_csi *csi = &rkisp1->csi;
+
+	csi->rkisp1 = rkisp1;
+
+	csi->dphy = devm_phy_get(rkisp1->dev, "dphy");
+	if (IS_ERR(csi->dphy))
+		return dev_err_probe(rkisp1->dev, PTR_ERR(csi->dphy),
+				     "Couldn't get the MIPI D-PHY\n");
+
+	phy_init(csi->dphy);
+
+	return 0;
+}
+
+void rkisp1_csi_cleanup(struct rkisp1_device *rkisp1)
+{
+	struct rkisp1_csi *csi = &rkisp1->csi;
+
+	phy_exit(csi->dphy);
+}
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
new file mode 100644
index 000000000000..d97a4ee5c002
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+/*
+ * Rockchip ISP1 Driver - CSI-2 Receiver
+ *
+ * Copyright (C) 2019 Collabora, Ltd.
+ * Copyright (C) 2022 Ideas on Board
+ *
+ * Based on Rockchip ISP1 driver by Rockchip Electronics Co., Ltd.
+ * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
+ */
+#ifndef _RKISP1_CSI_H
+#define _RKISP1_CSI_H
+
+struct rkisp1_device;
+struct rkisp1_sensor_async;
+
+int rkisp1_csi_init(struct rkisp1_device *rkisp1);
+void rkisp1_csi_cleanup(struct rkisp1_device *rkisp1);
+
+int rkisp1_config_mipi(struct rkisp1_csi *csi);
+
+int rkisp1_mipi_csi2_start(struct rkisp1_csi *csi,
+			   struct rkisp1_sensor_async *sensor);
+void rkisp1_mipi_csi2_stop(struct rkisp1_csi *csi);
+void rkisp1_mipi_start(struct rkisp1_csi *csi);
+void rkisp1_mipi_stop(struct rkisp1_csi *csi);
+
+#endif /* _RKISP1_CSI_H */
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 813c013139ea..2afaa9f26f29 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -15,11 +15,11 @@
 #include <linux/of_graph.h>
 #include <linux/of_platform.h>
 #include <linux/pinctrl/consumer.h>
-#include <linux/phy/phy.h>
-#include <linux/phy/phy-mipi-dphy.h>
+#include <linux/pm_runtime.h>
 #include <media/v4l2-fwnode.h>
 
 #include "rkisp1-common.h"
+#include "rkisp1-csi.h"
 
 /*
  * ISP Details
@@ -128,14 +128,6 @@ static int rkisp1_subdev_notifier_bound(struct v4l2_async_notifier *notifier,
 	}
 
 	s_asd->sd = sd;
-	s_asd->dphy = devm_phy_get(rkisp1->dev, "dphy");
-	if (IS_ERR(s_asd->dphy)) {
-		if (PTR_ERR(s_asd->dphy) != -EPROBE_DEFER)
-			dev_err(rkisp1->dev, "Couldn't get the MIPI D-PHY\n");
-		return PTR_ERR(s_asd->dphy);
-	}
-
-	phy_init(s_asd->dphy);
 
 	/* Create the link to the sensor. */
 	source_pad = media_entity_get_fwnode_pad(&sd->entity, s_asd->source_ep,
@@ -152,16 +144,6 @@ static int rkisp1_subdev_notifier_bound(struct v4l2_async_notifier *notifier,
 				     !s_asd->index ? MEDIA_LNK_FL_ENABLED : 0);
 }
 
-static void rkisp1_subdev_notifier_unbind(struct v4l2_async_notifier *notifier,
-					  struct v4l2_subdev *sd,
-					  struct v4l2_async_subdev *asd)
-{
-	struct rkisp1_sensor_async *s_asd =
-		container_of(asd, struct rkisp1_sensor_async, asd);
-
-	phy_exit(s_asd->dphy);
-}
-
 static int rkisp1_subdev_notifier_complete(struct v4l2_async_notifier *notifier)
 {
 	struct rkisp1_device *rkisp1 =
@@ -180,7 +162,6 @@ static void rkisp1_subdev_notifier_destroy(struct v4l2_async_subdev *asd)
 
 static const struct v4l2_async_notifier_operations rkisp1_subdev_notifier_ops = {
 	.bound = rkisp1_subdev_notifier_bound,
-	.unbind = rkisp1_subdev_notifier_unbind,
 	.complete = rkisp1_subdev_notifier_complete,
 	.destroy = rkisp1_subdev_notifier_destroy,
 };
@@ -540,14 +521,20 @@ static int rkisp1_probe(struct platform_device *pdev)
 		goto err_unreg_v4l2_dev;
 	}
 
-	ret = rkisp1_entities_register(rkisp1);
+	ret = rkisp1_csi_init(rkisp1);
 	if (ret)
 		goto err_unreg_media_dev;
 
+	ret = rkisp1_entities_register(rkisp1);
+	if (ret)
+		goto err_cleanup_csi;
+
 	rkisp1_debug_init(rkisp1);
 
 	return 0;
 
+err_cleanup_csi:
+	rkisp1_csi_cleanup(rkisp1);
 err_unreg_media_dev:
 	media_device_unregister(&rkisp1->media_dev);
 err_unreg_v4l2_dev:
@@ -565,6 +552,7 @@ static int rkisp1_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&rkisp1->notifier);
 
 	rkisp1_entities_unregister(rkisp1);
+	rkisp1_csi_cleanup(rkisp1);
 	rkisp1_debug_cleanup(rkisp1);
 
 	media_device_unregister(&rkisp1->media_dev);
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 56781b53dd83..c05148dd32c0 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -9,8 +9,6 @@
  */
 
 #include <linux/iopoll.h>
-#include <linux/phy/phy.h>
-#include <linux/phy/phy-mipi-dphy.h>
 #include <linux/pm_runtime.h>
 #include <linux/videodev2.h>
 #include <linux/vmalloc.h>
@@ -18,6 +16,7 @@
 #include <media/v4l2-event.h>
 
 #include "rkisp1-common.h"
+#include "rkisp1-csi.h"
 
 #define RKISP1_DEF_SINK_PAD_FMT MEDIA_BUS_FMT_SRGGB10_1X10
 #define RKISP1_DEF_SRC_PAD_FMT MEDIA_BUS_FMT_YUYV8_2X8
@@ -265,55 +264,6 @@ static int rkisp1_config_dvp(struct rkisp1_device *rkisp1)
 	return 0;
 }
 
-static int rkisp1_config_mipi(struct rkisp1_device *rkisp1)
-{
-	const struct rkisp1_mbus_info *sink_fmt = rkisp1->isp.sink_fmt;
-	unsigned int lanes = rkisp1->active_sensor->lanes;
-	u32 mipi_ctrl;
-
-	if (lanes < 1 || lanes > 4)
-		return -EINVAL;
-
-	mipi_ctrl = RKISP1_CIF_MIPI_CTRL_NUM_LANES(lanes - 1) |
-		    RKISP1_CIF_MIPI_CTRL_SHUTDOWNLANES(0xf) |
-		    RKISP1_CIF_MIPI_CTRL_ERR_SOT_SYNC_HS_SKIP |
-		    RKISP1_CIF_MIPI_CTRL_CLOCKLANE_ENA;
-
-	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_CTRL, mipi_ctrl);
-
-	/* V12 could also use a newer csi2-host, but we don't want that yet */
-	if (rkisp1->info->isp_ver == RKISP1_V12)
-		rkisp1_write(rkisp1, RKISP1_CIF_ISP_CSI0_CTRL0, 0);
-
-	/* Configure Data Type and Virtual Channel */
-	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_IMG_DATA_SEL,
-		     RKISP1_CIF_MIPI_DATA_SEL_DT(sink_fmt->mipi_dt) |
-		     RKISP1_CIF_MIPI_DATA_SEL_VC(0));
-
-	/* Clear MIPI interrupts */
-	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_ICR, ~0);
-	/*
-	 * Disable RKISP1_CIF_MIPI_ERR_DPHY interrupt here temporary for
-	 * isp bus may be dead when switch isp.
-	 */
-	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_IMSC,
-		     RKISP1_CIF_MIPI_FRAME_END | RKISP1_CIF_MIPI_ERR_CSI |
-		     RKISP1_CIF_MIPI_ERR_DPHY |
-		     RKISP1_CIF_MIPI_SYNC_FIFO_OVFLW(0x03) |
-		     RKISP1_CIF_MIPI_ADD_DATA_OVFLW);
-
-	dev_dbg(rkisp1->dev, "\n  MIPI_CTRL 0x%08x\n"
-		"  MIPI_IMG_DATA_SEL 0x%08x\n"
-		"  MIPI_STATUS 0x%08x\n"
-		"  MIPI_IMSC 0x%08x\n",
-		rkisp1_read(rkisp1, RKISP1_CIF_MIPI_CTRL),
-		rkisp1_read(rkisp1, RKISP1_CIF_MIPI_IMG_DATA_SEL),
-		rkisp1_read(rkisp1, RKISP1_CIF_MIPI_STATUS),
-		rkisp1_read(rkisp1, RKISP1_CIF_MIPI_IMSC));
-
-	return 0;
-}
-
 /* Configure MUX */
 static int rkisp1_config_path(struct rkisp1_device *rkisp1)
 {
@@ -326,7 +276,7 @@ static int rkisp1_config_path(struct rkisp1_device *rkisp1)
 		ret = rkisp1_config_dvp(rkisp1);
 		dpcl |= RKISP1_CIF_VI_DPCL_IF_SEL_PARALLEL;
 	} else if (sensor->mbus_type == V4L2_MBUS_CSI2_DPHY) {
-		ret = rkisp1_config_mipi(rkisp1);
+		ret = rkisp1_config_mipi(&rkisp1->csi);
 		dpcl |= RKISP1_CIF_VI_DPCL_IF_SEL_MIPI;
 	}
 
@@ -360,17 +310,14 @@ static void rkisp1_isp_stop(struct rkisp1_device *rkisp1)
 	 * Stop ISP(isp) ->wait for ISP isp off
 	 */
 	/* stop and clear MI, MIPI, and ISP interrupts */
-	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_IMSC, 0);
-	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_ICR, ~0);
-
 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IMSC, 0);
 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ICR, ~0);
 
 	rkisp1_write(rkisp1, RKISP1_CIF_MI_IMSC, 0);
 	rkisp1_write(rkisp1, RKISP1_CIF_MI_ICR, ~0);
-	val = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_CTRL);
-	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_CTRL,
-		     val & (~RKISP1_CIF_MIPI_CTRL_OUTPUT_ENA));
+
+	rkisp1_mipi_stop(&rkisp1->csi);
+
 	/* stop ISP */
 	val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_CTRL);
 	val &= ~(RKISP1_CIF_ISP_CTRL_ISP_INFORM_ENABLE |
@@ -417,11 +364,9 @@ static void rkisp1_isp_start(struct rkisp1_device *rkisp1)
 	rkisp1_config_clk(rkisp1);
 
 	/* Activate MIPI */
-	if (sensor->mbus_type == V4L2_MBUS_CSI2_DPHY) {
-		val = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_CTRL);
-		rkisp1_write(rkisp1, RKISP1_CIF_MIPI_CTRL,
-			     val | RKISP1_CIF_MIPI_CTRL_OUTPUT_ENA);
-	}
+	if (sensor->mbus_type == V4L2_MBUS_CSI2_DPHY)
+		rkisp1_mipi_start(&rkisp1->csi);
+
 	/* Activate ISP */
 	val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_CTRL);
 	val |= RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD |
@@ -814,35 +759,6 @@ static const struct v4l2_subdev_pad_ops rkisp1_isp_pad_ops = {
  * Stream operations
  */
 
-static int rkisp1_mipi_csi2_start(struct rkisp1_isp *isp,
-				  struct rkisp1_sensor_async *sensor)
-{
-	struct rkisp1_device *rkisp1 =
-		container_of(isp->sd.v4l2_dev, struct rkisp1_device, v4l2_dev);
-	union phy_configure_opts opts;
-	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
-	s64 pixel_clock;
-
-	pixel_clock = v4l2_ctrl_g_ctrl_int64(sensor->pixel_rate_ctrl);
-	if (!pixel_clock) {
-		dev_err(rkisp1->dev, "Invalid pixel rate value\n");
-		return -EINVAL;
-	}
-
-	phy_mipi_dphy_get_default_config(pixel_clock, isp->sink_fmt->bus_width,
-					 sensor->lanes, cfg);
-	phy_set_mode(sensor->dphy, PHY_MODE_MIPI_DPHY);
-	phy_configure(sensor->dphy, &opts);
-	phy_power_on(sensor->dphy);
-
-	return 0;
-}
-
-static void rkisp1_mipi_csi2_stop(struct rkisp1_sensor_async *sensor)
-{
-	phy_power_off(sensor->dphy);
-}
-
 static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct rkisp1_device *rkisp1 =
@@ -856,7 +772,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 				 false);
 
 		rkisp1_isp_stop(rkisp1);
-		rkisp1_mipi_csi2_stop(rkisp1->active_sensor);
+		rkisp1_mipi_csi2_stop(&rkisp1->csi);
 		return 0;
 	}
 
@@ -878,7 +794,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 	if (ret)
 		goto mutex_unlock;
 
-	ret = rkisp1_mipi_csi2_start(&rkisp1->isp, rkisp1->active_sensor);
+	ret = rkisp1_mipi_csi2_start(&rkisp1->csi, rkisp1->active_sensor);
 	if (ret)
 		goto mutex_unlock;
 
@@ -888,7 +804,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 			       true);
 	if (ret) {
 		rkisp1_isp_stop(rkisp1);
-		rkisp1_mipi_csi2_stop(rkisp1->active_sensor);
+		rkisp1_mipi_csi2_stop(&rkisp1->csi);
 		goto mutex_unlock;
 	}
 
@@ -993,53 +909,6 @@ void rkisp1_isp_unregister(struct rkisp1_device *rkisp1)
  * Interrupt handlers
  */
 
-irqreturn_t rkisp1_mipi_isr(int irq, void *ctx)
-{
-	struct device *dev = ctx;
-	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
-	u32 val, status;
-
-	status = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_MIS);
-	if (!status)
-		return IRQ_NONE;
-
-	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_ICR, status);
-
-	/*
-	 * Disable DPHY errctrl interrupt, because this dphy
-	 * erctrl signal is asserted until the next changes
-	 * of line state. This time is may be too long and cpu
-	 * is hold in this interrupt.
-	 */
-	if (status & RKISP1_CIF_MIPI_ERR_CTRL(0x0f)) {
-		val = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_IMSC);
-		rkisp1_write(rkisp1, RKISP1_CIF_MIPI_IMSC,
-			     val & ~RKISP1_CIF_MIPI_ERR_CTRL(0x0f));
-		rkisp1->isp.is_dphy_errctrl_disabled = true;
-	}
-
-	/*
-	 * Enable DPHY errctrl interrupt again, if mipi have receive
-	 * the whole frame without any error.
-	 */
-	if (status == RKISP1_CIF_MIPI_FRAME_END) {
-		/*
-		 * Enable DPHY errctrl interrupt again, if mipi have receive
-		 * the whole frame without any error.
-		 */
-		if (rkisp1->isp.is_dphy_errctrl_disabled) {
-			val = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_IMSC);
-			val |= RKISP1_CIF_MIPI_ERR_CTRL(0x0f);
-			rkisp1_write(rkisp1, RKISP1_CIF_MIPI_IMSC, val);
-			rkisp1->isp.is_dphy_errctrl_disabled = false;
-		}
-	} else {
-		rkisp1->debug.mipi_error++;
-	}
-
-	return IRQ_HANDLED;
-}
-
 static void rkisp1_isp_queue_event_sof(struct rkisp1_isp *isp)
 {
 	struct v4l2_event event = {
-- 
Regards,

Laurent Pinchart

