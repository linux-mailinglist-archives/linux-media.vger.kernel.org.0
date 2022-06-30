Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26EE55626E6
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 01:19:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232111AbiF3XLh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 19:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232159AbiF3XLf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 19:11:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D99F10551
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 16:11:30 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38BFC2A4F;
        Fri,  1 Jul 2022 01:08:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656630489;
        bh=/3AoZhQqUQbVZqavOWitWJhADZEuur7NZVJYIoJ7AxI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nHX9h4A1ujCObg8sNJQKBaWxiuw3EUs+qvNbV3neRLL/Ksamt3YCXPXCujosiWWmk
         6HJATJft01fqLGNDU7D8IfapB25DJzmlajhr4TDA2yOCbbgdlvEwCWpnCFJXQ/Zu6Y
         Dnv6d4uWGgqwm9Mz2+4FdjaMpbtj45iWDCCne55U=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v2 49/55] media: rkisp1: Configure gasket on i.MX8MP
Date:   Fri,  1 Jul 2022 02:07:07 +0300
Message-Id: <20220630230713.10580-50-laurent.pinchart@ideasonboard.com>
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

The i.MX8MP has a gasket between the CSI-2 receiver and the ISP.
Configure and enable it when starting the ISP, and disable it when
stopping.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-common.h  |   5 +
 .../platform/rockchip/rkisp1/rkisp1-dev.c     |  16 +++
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 128 +++++++++++++++++-
 3 files changed, 147 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index dedfcf3466c8..7e2aa0a2b86d 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -24,6 +24,7 @@
 #include "rkisp1-regs.h"
 
 struct dentry;
+struct regmap;
 
 /*
  * flags on the 'direction' field in struct rkisp1_mbus_info' that indicate
@@ -442,6 +443,8 @@ struct rkisp1_debug {
  * @dev:	   a pointer to the struct device
  * @clk_size:	   number of clocks
  * @clks:	   array of clocks
+ * @gasket:	   the gasket - i.MX8MP only
+ * @gasket_id:	   the gasket ID (0 or 1) - i.MX8MP only
  * @v4l2_dev:	   v4l2_device variable
  * @media_dev:	   media_device variable
  * @notifier:	   a notifier to register on the v4l2-async API to be notified on the sensor
@@ -462,6 +465,8 @@ struct rkisp1_device {
 	struct device *dev;
 	unsigned int clk_size;
 	struct clk_bulk_data clks[RKISP1_MAX_BUS_CLK];
+	struct regmap *gasket;
+	unsigned int gasket_id;
 	struct v4l2_device v4l2_dev;
 	struct media_device media_dev;
 	struct v4l2_async_notifier notifier;
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index a41f89807dd7..b6643020b831 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -10,6 +10,7 @@
 
 #include <linux/clk.h>
 #include <linux/interrupt.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
@@ -579,6 +580,21 @@ static int rkisp1_probe(struct platform_device *pdev)
 		return ret;
 	rkisp1->clk_size = info->clk_size;
 
+	if (info->isp_ver == IMX8MP_V10) {
+		unsigned int id;
+
+		rkisp1->gasket = syscon_regmap_lookup_by_phandle_args(dev->of_node,
+								      "fsl,blk-ctrl",
+								      1, &id);
+		if (IS_ERR(rkisp1->gasket)) {
+			ret = PTR_ERR(rkisp1->gasket);
+			dev_err(dev, "failed to get gasket: %d\n", ret);
+			return ret;
+		}
+
+		rkisp1->gasket_id = id;
+	}
+
 	pm_runtime_enable(&pdev->dev);
 
 	ret = pm_runtime_resume_and_get(&pdev->dev);
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 383a3ec83ca9..a3c7d4d88387 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -10,6 +10,7 @@
 
 #include <linux/iopoll.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/videodev2.h>
 #include <linux/vmalloc.h>
 
@@ -87,6 +88,115 @@ rkisp1_isp_get_pad_crop(struct rkisp1_isp *isp,
 		return v4l2_subdev_get_try_crop(&isp->sd, &state, pad);
 }
 
+/* -----------------------------------------------------------------------------
+ * Media block control (i.MX8MP only)
+ */
+
+#define ISP_DEWARP_CONTROL				0x0138
+
+#define ISP_DEWARP_CONTROL_MIPI_CSI2_HS_POLARITY	BIT(22)
+#define ISP_DEWARP_CONTROL_MIPI_CSI2_VS_SEL_RISING	(0 << 20)
+#define ISP_DEWARP_CONTROL_MIPI_CSI2_VS_SEL_NEGATIVE	(1 << 20)
+#define ISP_DEWARP_CONTROL_MIPI_CSI2_VS_SEL_POSITIVE	(2 << 20)
+#define ISP_DEWARP_CONTROL_MIPI_CSI2_VS_SEL_FALLING	(3 << 20)
+#define ISP_DEWARP_CONTROL_MIPI_CSI2_VS_SEL_MASK	GENMASK(21, 20)
+#define ISP_DEWARP_CONTROL_MIPI_ISP2_LEFT_JUST_MODE	BIT(19)
+#define ISP_DEWARP_CONTROL_MIPI_ISP2_DATA_TYPE(dt)	((dt) << 13)
+#define ISP_DEWARP_CONTROL_MIPI_ISP2_DATA_TYPE_MASK	GENMASK(18, 13)
+
+#define ISP_DEWARP_CONTROL_MIPI_CSI1_HS_POLARITY	BIT(12)
+#define ISP_DEWARP_CONTROL_MIPI_CSI1_VS_SEL_RISING	(0 << 10)
+#define ISP_DEWARP_CONTROL_MIPI_CSI1_VS_SEL_NEGATIVE	(1 << 10)
+#define ISP_DEWARP_CONTROL_MIPI_CSI1_VS_SEL_POSITIVE	(2 << 10)
+#define ISP_DEWARP_CONTROL_MIPI_CSI1_VS_SEL_FALLING	(3 << 10)
+#define ISP_DEWARP_CONTROL_MIPI_CSI1_VS_SEL_MASK	GENMASK(11, 10)
+#define ISP_DEWARP_CONTROL_MIPI_ISP1_LEFT_JUST_MODE	BIT(9)
+#define ISP_DEWARP_CONTROL_MIPI_ISP1_DATA_TYPE(dt)	((dt) << 3)
+#define ISP_DEWARP_CONTROL_MIPI_ISP1_DATA_TYPE_MASK	GENMASK(8, 3)
+
+#define ISP_DEWARP_CONTROL_GPR_ISP_1_DISABLE		BIT(1)
+#define ISP_DEWARP_CONTROL_GPR_ISP_0_DISABLE		BIT(0)
+
+static int rkisp1_gasket_enable(struct rkisp1_device *rkisp1,
+				struct media_pad *source)
+{
+	struct v4l2_subdev *source_sd;
+	struct v4l2_mbus_frame_desc fd;
+	unsigned int dt;
+	u32 mask;
+	u32 val;
+	int ret;
+
+	/*
+	 * Configure and enable the gasket with the CSI-2 data type. Set the
+	 * vsync polarity as active high, as that is what the ISP is configured
+	 * to expect in ISP_ACQ_PROP. Enable left justification, as the i.MX8MP
+	 * ISP has a 16-bit wide input and expects data to be left-aligned.
+	 */
+
+	source_sd = media_entity_to_v4l2_subdev(source->entity);
+	ret = v4l2_subdev_call(source_sd, pad, get_frame_desc,
+			       source->index, &fd);
+	if (ret) {
+		dev_err(rkisp1->dev,
+			"failed to get frame descriptor from '%s':%u: %d\n",
+			source_sd->name, 0, ret);
+		return ret;
+	}
+
+	if (fd.num_entries != 1) {
+		dev_err(rkisp1->dev, "invalid frame descriptor for '%s':%u\n",
+			source_sd->name, 0);
+		return -EINVAL;
+	}
+
+	dt = fd.entry[0].bus.csi2.dt;
+
+	if (rkisp1->gasket_id == 0) {
+		mask = ISP_DEWARP_CONTROL_MIPI_CSI1_HS_POLARITY
+		     | ISP_DEWARP_CONTROL_MIPI_CSI1_VS_SEL_MASK
+		     | ISP_DEWARP_CONTROL_MIPI_ISP1_LEFT_JUST_MODE
+		     | ISP_DEWARP_CONTROL_MIPI_ISP1_DATA_TYPE_MASK
+		     | ISP_DEWARP_CONTROL_GPR_ISP_0_DISABLE;
+		val = ISP_DEWARP_CONTROL_MIPI_CSI1_VS_SEL_POSITIVE
+		    | ISP_DEWARP_CONTROL_MIPI_ISP1_LEFT_JUST_MODE
+		    | ISP_DEWARP_CONTROL_MIPI_ISP1_DATA_TYPE(dt);
+	} else {
+		mask = ISP_DEWARP_CONTROL_MIPI_CSI2_HS_POLARITY
+		     | ISP_DEWARP_CONTROL_MIPI_CSI2_VS_SEL_MASK
+		     | ISP_DEWARP_CONTROL_MIPI_ISP2_LEFT_JUST_MODE
+		     | ISP_DEWARP_CONTROL_MIPI_ISP2_DATA_TYPE_MASK
+		     | ISP_DEWARP_CONTROL_GPR_ISP_1_DISABLE;
+		val = ISP_DEWARP_CONTROL_MIPI_CSI2_VS_SEL_POSITIVE
+		    | ISP_DEWARP_CONTROL_MIPI_ISP2_LEFT_JUST_MODE
+		    | ISP_DEWARP_CONTROL_MIPI_ISP2_DATA_TYPE(dt);
+	}
+
+	regmap_update_bits(rkisp1->gasket, ISP_DEWARP_CONTROL, mask, val);
+
+	return 0;
+}
+
+static void rkisp1_gasket_disable(struct rkisp1_device *rkisp1)
+{
+	u32 mask;
+	u32 val;
+
+	if (rkisp1->gasket_id == 1) {
+		mask = ISP_DEWARP_CONTROL_MIPI_ISP2_LEFT_JUST_MODE
+		     | ISP_DEWARP_CONTROL_MIPI_ISP2_DATA_TYPE_MASK
+		     | ISP_DEWARP_CONTROL_GPR_ISP_1_DISABLE;
+		val = ISP_DEWARP_CONTROL_GPR_ISP_1_DISABLE;
+	} else {
+		mask = ISP_DEWARP_CONTROL_MIPI_ISP1_LEFT_JUST_MODE
+		     | ISP_DEWARP_CONTROL_MIPI_ISP1_DATA_TYPE_MASK
+		     | ISP_DEWARP_CONTROL_GPR_ISP_0_DISABLE;
+		val = ISP_DEWARP_CONTROL_GPR_ISP_0_DISABLE;
+	}
+
+	regmap_update_bits(rkisp1->gasket, ISP_DEWARP_CONTROL, mask, val);
+}
+
 /* ----------------------------------------------------------------------------
  * Camera Interface registers configurations
  */
@@ -303,6 +413,9 @@ static void rkisp1_isp_stop(struct rkisp1_isp *isp)
 		     RKISP1_CIF_VI_IRCL_MIPI_SW_RST |
 		     RKISP1_CIF_VI_IRCL_ISP_SW_RST);
 	rkisp1_write(rkisp1, RKISP1_CIF_VI_IRCL, 0x0);
+
+	if (rkisp1->info->isp_ver == IMX8MP_V10)
+		rkisp1_gasket_disable(rkisp1);
 }
 
 static void rkisp1_config_clk(struct rkisp1_isp *isp)
@@ -327,19 +440,28 @@ static void rkisp1_config_clk(struct rkisp1_isp *isp)
 	}
 }
 
-static void rkisp1_isp_start(struct rkisp1_isp *isp)
+static int rkisp1_isp_start(struct rkisp1_isp *isp, struct media_pad *source)
 {
 	struct rkisp1_device *rkisp1 = isp->rkisp1;
 	u32 val;
+	int ret;
 
 	rkisp1_config_clk(isp);
 
+	if (rkisp1->info->isp_ver == IMX8MP_V10) {
+		ret = rkisp1_gasket_enable(rkisp1, source);
+		if (ret)
+			return ret;
+	}
+
 	/* Activate ISP */
 	val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_CTRL);
 	val |= RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD |
 	       RKISP1_CIF_ISP_CTRL_ISP_ENABLE |
 	       RKISP1_CIF_ISP_CTRL_ISP_INFORM_ENABLE;
 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_CTRL, val);
+
+	return 0;
 }
 
 /* ----------------------------------------------------------------------------
@@ -772,7 +894,9 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 	if (ret)
 		goto mutex_unlock;
 
-	rkisp1_isp_start(isp);
+	ret = rkisp1_isp_start(isp, source_pad);
+	if (ret)
+		goto mutex_unlock;
 
 	ret = v4l2_subdev_call(rkisp1->source, video, s_stream, true);
 	if (ret) {
-- 
Regards,

Laurent Pinchart

