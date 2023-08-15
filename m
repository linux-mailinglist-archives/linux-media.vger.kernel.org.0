Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0E1277D55F
	for <lists+linux-media@lfdr.de>; Tue, 15 Aug 2023 23:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240320AbjHOVsJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Aug 2023 17:48:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240396AbjHOVsD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Aug 2023 17:48:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FFEA1FC3
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 14:47:59 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C98F6BE;
        Tue, 15 Aug 2023 23:46:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692136004;
        bh=ziWILugsYZWn7vgYiG5eCgPEz1vT6/GGQQ6ZyixNadU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KA+7aSpmAcSZTPz56B8Xm3RsgNNOHjaSzkWE+NAW9Jkq+NZhQ4+Joy29yXnrvMKdb
         dnsSisW4b18BYpnJ5d29H9YiF9rkmvaUFyFNTB2um45rzGPuFXMmAiTXGa54VMZxYh
         aMC3CM4kH7cp+7fb8KZZZFt9WaKPuf+BoePojSJo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v1 1/2] media: Pass struct device pointer to fwnode endpoint parsing functions
Date:   Wed, 16 Aug 2023 00:48:00 +0300
Message-ID: <20230815214801.6420-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230815214801.6420-1-laurent.pinchart@ideasonboard.com>
References: <20230815214801.6420-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l2_fwnode_endpoint_parse() and v4l2_fwnode_endpoint_alloc_parse()
functions print lots of debugging information with pr_debug(), which can
make the log confusing as the information isn't associated with a
device. Pass a struct device pointer to the functions to prepare for
replacing the pr_debug() calls with dev_dbg(). No functional change is
intended in this commit.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/adv748x/adv748x-core.c             |  2 +-
 drivers/media/i2c/adv7604.c                          |  3 ++-
 drivers/media/i2c/ar0521.c                           |  2 +-
 drivers/media/i2c/ccs/ccs-core.c                     |  2 +-
 drivers/media/i2c/hi556.c                            |  2 +-
 drivers/media/i2c/hi846.c                            |  2 +-
 drivers/media/i2c/hi847.c                            |  2 +-
 drivers/media/i2c/imx214.c                           |  2 +-
 drivers/media/i2c/imx219.c                           |  2 +-
 drivers/media/i2c/imx274.c                           |  2 +-
 drivers/media/i2c/imx290.c                           |  2 +-
 drivers/media/i2c/imx319.c                           |  2 +-
 drivers/media/i2c/imx334.c                           |  2 +-
 drivers/media/i2c/imx335.c                           |  2 +-
 drivers/media/i2c/imx355.c                           |  2 +-
 drivers/media/i2c/imx412.c                           |  2 +-
 drivers/media/i2c/imx415.c                           |  2 +-
 drivers/media/i2c/isl7998x.c                         |  2 +-
 drivers/media/i2c/max9286.c                          |  2 +-
 drivers/media/i2c/mt9m111.c                          |  2 +-
 drivers/media/i2c/mt9p031.c                          |  3 ++-
 drivers/media/i2c/mt9v032.c                          |  3 ++-
 drivers/media/i2c/og01a1b.c                          |  2 +-
 drivers/media/i2c/ov02a10.c                          |  2 +-
 drivers/media/i2c/ov08d10.c                          |  2 +-
 drivers/media/i2c/ov08x40.c                          |  2 +-
 drivers/media/i2c/ov13b10.c                          |  2 +-
 drivers/media/i2c/ov2659.c                           |  3 ++-
 drivers/media/i2c/ov2740.c                           |  2 +-
 drivers/media/i2c/ov4689.c                           |  2 +-
 drivers/media/i2c/ov5640.c                           |  2 +-
 drivers/media/i2c/ov5645.c                           |  2 +-
 drivers/media/i2c/ov5647.c                           |  6 +++++-
 drivers/media/i2c/ov5648.c                           |  2 +-
 drivers/media/i2c/ov5670.c                           |  3 ++-
 drivers/media/i2c/ov5675.c                           |  2 +-
 drivers/media/i2c/ov5693.c                           |  2 +-
 drivers/media/i2c/ov7251.c                           |  2 +-
 drivers/media/i2c/ov7670.c                           |  2 +-
 drivers/media/i2c/ov772x.c                           |  5 +++--
 drivers/media/i2c/ov8856.c                           |  2 +-
 drivers/media/i2c/ov8858.c                           |  2 +-
 drivers/media/i2c/ov8865.c                           |  2 +-
 drivers/media/i2c/ov9282.c                           |  2 +-
 drivers/media/i2c/ov9734.c                           |  2 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c             |  2 +-
 drivers/media/i2c/s5k5baf.c                          |  2 +-
 drivers/media/i2c/st-mipid02.c                       |  6 ++++--
 drivers/media/i2c/st-vgxy61.c                        |  2 +-
 drivers/media/i2c/tc358743.c                         |  3 ++-
 drivers/media/i2c/tc358746.c                         |  4 ++--
 drivers/media/i2c/tda1997x.c                         |  3 ++-
 drivers/media/i2c/tvp514x.c                          |  3 ++-
 drivers/media/i2c/tvp5150.c                          |  2 +-
 drivers/media/i2c/tvp7002.c                          |  3 ++-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c        |  2 +-
 drivers/media/platform/atmel/atmel-isi.c             |  2 +-
 drivers/media/platform/cadence/cdns-csi2rx.c         |  2 +-
 drivers/media/platform/cadence/cdns-csi2tx.c         |  3 ++-
 drivers/media/platform/intel/pxa_camera.c            |  2 +-
 drivers/media/platform/microchip/microchip-csi2dc.c  |  5 +++--
 .../media/platform/microchip/microchip-sama5d2-isc.c |  2 +-
 .../media/platform/microchip/microchip-sama7g5-isc.c |  2 +-
 drivers/media/platform/nxp/imx-mipi-csis.c           |  2 +-
 drivers/media/platform/qcom/camss/camss.c            |  2 +-
 drivers/media/platform/renesas/rcar-vin/rcar-core.c  |  4 ++--
 drivers/media/platform/renesas/rcar-vin/rcar-csi2.c  |  2 +-
 drivers/media/platform/renesas/renesas-ceu.c         |  3 ++-
 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c    |  2 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c    |  2 +-
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c  |  2 +-
 .../media/platform/samsung/exynos4-is/media-dev.c    |  3 ++-
 .../media/platform/samsung/exynos4-is/mipi-csis.c    |  3 ++-
 drivers/media/platform/st/stm32/stm32-dcmi.c         |  2 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c   |  2 +-
 .../platform/sunxi/sun6i-csi/sun6i_csi_bridge.c      |  2 +-
 .../platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c |  2 +-
 .../sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c      |  2 +-
 drivers/media/platform/ti/am437x/am437x-vpfe.c       |  2 +-
 drivers/media/platform/ti/cal/cal-camerarx.c         |  3 ++-
 drivers/media/platform/ti/davinci/vpif_capture.c     |  3 ++-
 drivers/media/platform/ti/omap3isp/isp.c             |  8 ++++----
 drivers/media/platform/xilinx/xilinx-csi2rxss.c      |  2 +-
 drivers/media/v4l2-core/v4l2-fwnode.c                |  7 ++++---
 .../staging/media/atomisp/pci/atomisp_csi2_bridge.c  |  2 +-
 .../media/deprecated/atmel/atmel-sama5d2-isc.c       |  2 +-
 .../media/deprecated/atmel/atmel-sama7g5-isc.c       |  2 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c           |  2 +-
 drivers/staging/media/imx/imx8mq-mipi-csi2.c         |  2 +-
 drivers/staging/media/max96712/max96712.c            |  2 +-
 .../staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c   |  2 +-
 drivers/staging/media/tegra-video/csi.c              |  2 +-
 drivers/staging/media/tegra-video/vi.c               |  2 +-
 drivers/staging/media/tegra-video/vip.c              |  2 +-
 include/media/v4l2-fwnode.h                          | 12 ++++++++++--
 95 files changed, 138 insertions(+), 106 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
index 3eb6d5e8f082..45bb9a9faeb4 100644
--- a/drivers/media/i2c/adv748x/adv748x-core.c
+++ b/drivers/media/i2c/adv748x/adv748x-core.c
@@ -616,7 +616,7 @@ static int adv748x_parse_csi2_lanes(struct adv748x_state *state,
 	if (port != ADV748X_PORT_TXA && port != ADV748X_PORT_TXB)
 		return 0;
 
-	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &vep);
+	ret = v4l2_fwnode_endpoint_parse(state->dev, of_fwnode_handle(ep), &vep);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index b202a85fbeaa..81bb4304ef3e 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -3209,7 +3209,8 @@ static int adv76xx_parse_dt(struct adv76xx_state *state)
 	if (!endpoint)
 		return -EINVAL;
 
-	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(endpoint), &bus_cfg);
+	ret = v4l2_fwnode_endpoint_parse(&state->i2c_clients[ADV76XX_PAGE_IO]->dev,
+					 of_fwnode_handle(endpoint), &bus_cfg);
 	of_node_put(endpoint);
 	if (ret)
 		return ret;
diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index a4e39871e8f7..f6df268c2358 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -1071,7 +1071,7 @@ static int ar0521_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
-	ret = v4l2_fwnode_endpoint_parse(endpoint, &ep);
+	ret = v4l2_fwnode_endpoint_parse(dev, endpoint, &ep);
 	fwnode_handle_put(endpoint);
 	if (ret) {
 		dev_err(dev, "could not parse endpoint\n");
diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 49e0d9a09530..31f7e1457f8b 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3206,7 +3206,7 @@ static int ccs_get_hwconfig(struct ccs_sensor *sensor, struct device *dev)
 	 * Note that we do need to rely on detecting the bus type between CSI-2
 	 * D-PHY and CCP2 as the old bindings did not require it.
 	 */
-	rval = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	rval = v4l2_fwnode_endpoint_alloc_parse(dev, ep, &bus_cfg);
 	if (rval)
 		goto out_err;
 
diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index 50e78f5b058c..3e3d8a5920ed 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -1208,7 +1208,7 @@ static int hi556_check_hwcfg(struct device *dev)
 	if (!ep)
 		return -ENXIO;
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	ret = v4l2_fwnode_endpoint_alloc_parse(dev, ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
 		return ret;
diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index fa0038749a3b..37b3ac60df9f 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -2003,7 +2003,7 @@ static int hi846_parse_dt(struct hi846 *hi846, struct device *dev)
 		return -ENXIO;
 	}
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	ret = v4l2_fwnode_endpoint_alloc_parse(dev, ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret) {
 		dev_err(dev, "failed to parse endpoint node: %d\n", ret);
diff --git a/drivers/media/i2c/hi847.c b/drivers/media/i2c/hi847.c
index 7cdce392e137..d1b448acb62e 100644
--- a/drivers/media/i2c/hi847.c
+++ b/drivers/media/i2c/hi847.c
@@ -2864,7 +2864,7 @@ static int hi847_check_hwcfg(struct device *dev)
 	if (!ep)
 		return -ENXIO;
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	ret = v4l2_fwnode_endpoint_alloc_parse(dev, ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
 		return ret;
diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 2f9c8582f940..2989a810d2dc 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -886,7 +886,7 @@ static int imx214_parse_fwnode(struct device *dev)
 		return -EINVAL;
 	}
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
+	ret = v4l2_fwnode_endpoint_alloc_parse(dev, endpoint, &bus_cfg);
 	if (ret) {
 		dev_err(dev, "parsing endpoint node failed\n");
 		goto done;
diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index d737d5e9a4a6..93fae398163a 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -1396,7 +1396,7 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
 		return -EINVAL;
 	}
 
-	if (v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg)) {
+	if (v4l2_fwnode_endpoint_alloc_parse(dev, endpoint, &ep_cfg)) {
 		dev_err(dev, "could not parse endpoint\n");
 		goto error_out;
 	}
diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index f33b692e6951..f270443ee98d 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -1971,7 +1971,7 @@ static int imx274_fwnode_parse(struct device *dev)
 		return -EINVAL;
 	}
 
-	ret = v4l2_fwnode_endpoint_parse(endpoint, &ep);
+	ret = v4l2_fwnode_endpoint_parse(dev, endpoint, &ep);
 	fwnode_handle_put(endpoint);
 	if (ret == -ENXIO) {
 		dev_err(dev, "Unsupported bus type, should be CSI2\n");
diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index b3f832e9d7e1..81a86a6d69fd 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1535,7 +1535,7 @@ static int imx290_parse_dt(struct imx290 *imx290)
 		return -EINVAL;
 	}
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep);
+	ret = v4l2_fwnode_endpoint_alloc_parse(imx290->dev, endpoint, &ep);
 	fwnode_handle_put(endpoint);
 	if (ret == -ENXIO) {
 		dev_err(imx290->dev, "Unsupported bus type, should be CSI2\n");
diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c
index a2140848d0d6..2e1a43337571 100644
--- a/drivers/media/i2c/imx319.c
+++ b/drivers/media/i2c/imx319.c
@@ -2382,7 +2382,7 @@ static struct imx319_hwcfg *imx319_get_hwcfg(struct device *dev)
 	if (!ep)
 		return NULL;
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	ret = v4l2_fwnode_endpoint_alloc_parse(dev, ep, &bus_cfg);
 	if (ret)
 		goto out_err;
 
diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index d722c9b7cd31..304c66687e0c 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -1103,7 +1103,7 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
 	if (!ep)
 		return -ENXIO;
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	ret = v4l2_fwnode_endpoint_alloc_parse(imx334->dev, ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
 		return ret;
diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index 482a0b7f040a..be33b45e3c7a 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -807,7 +807,7 @@ static int imx335_parse_hw_config(struct imx335 *imx335)
 	if (!ep)
 		return -ENXIO;
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	ret = v4l2_fwnode_endpoint_alloc_parse(imx335->dev, ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
 		return ret;
diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 6571a98b1e9e..79e998dfdcf6 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1671,7 +1671,7 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
 	if (!ep)
 		return NULL;
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	ret = v4l2_fwnode_endpoint_alloc_parse(dev, ep, &bus_cfg);
 	if (ret)
 		goto out_err;
 
diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index c7e862ae4040..9191974f2b82 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -969,7 +969,7 @@ static int imx412_parse_hw_config(struct imx412 *imx412)
 	if (!ep)
 		return -ENXIO;
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	ret = v4l2_fwnode_endpoint_alloc_parse(imx412->dev, ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
 		return ret;
diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index 4b5d1ee9cc6b..2ea512a6ac3c 100644
--- a/drivers/media/i2c/imx415.c
+++ b/drivers/media/i2c/imx415.c
@@ -1086,7 +1086,7 @@ static int imx415_parse_hw_config(struct imx415 *sensor)
 	if (!ep)
 		return -ENXIO;
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	ret = v4l2_fwnode_endpoint_alloc_parse(sensor->dev, ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
 		return ret;
diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
index 92e49d95363d..3b6c28a81d9d 100644
--- a/drivers/media/i2c/isl7998x.c
+++ b/drivers/media/i2c/isl7998x.c
@@ -1493,7 +1493,7 @@ static int isl7998x_probe(struct i2c_client *client)
 	if (!ep)
 		return dev_err_probe(dev, -EINVAL, "Missing endpoint node\n");
 
-	ret = v4l2_fwnode_endpoint_parse(ep, &endpoint);
+	ret = v4l2_fwnode_endpoint_parse(dev, ep, &endpoint);
 	fwnode_handle_put(ep);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to parse endpoint\n");
diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 88c58e0c49aa..117961b25a20 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1487,7 +1487,7 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 			int ret;
 
 			ret = v4l2_fwnode_endpoint_parse(
-					of_fwnode_handle(node), &vep);
+					dev, of_fwnode_handle(node), &vep);
 			if (ret) {
 				of_node_put(node);
 				return ret;
diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
index 2878d328fc01..80ebf20b7dd0 100644
--- a/drivers/media/i2c/mt9m111.c
+++ b/drivers/media/i2c/mt9m111.c
@@ -1233,7 +1233,7 @@ static int mt9m111_probe_fw(struct i2c_client *client, struct mt9m111 *mt9m111)
 	if (!np)
 		return -EINVAL;
 
-	ret = v4l2_fwnode_endpoint_parse(np, &bus_cfg);
+	ret = v4l2_fwnode_endpoint_parse(&client->dev, np, &bus_cfg);
 	if (ret)
 		goto out_put_fw;
 
diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index 348f1e1098fb..e69607c0acb0 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -1084,7 +1084,8 @@ mt9p031_get_pdata(struct i2c_client *client)
 	if (!np)
 		return NULL;
 
-	if (v4l2_fwnode_endpoint_parse(of_fwnode_handle(np), &endpoint) < 0)
+	if (v4l2_fwnode_endpoint_parse(&client->dev, of_fwnode_handle(np),
+				       &endpoint) < 0)
 		goto done;
 
 	pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
diff --git a/drivers/media/i2c/mt9v032.c b/drivers/media/i2c/mt9v032.c
index 00e7bc6e3235..8ab30d7277ca 100644
--- a/drivers/media/i2c/mt9v032.c
+++ b/drivers/media/i2c/mt9v032.c
@@ -1011,7 +1011,8 @@ mt9v032_get_pdata(struct i2c_client *client)
 	if (!np)
 		return NULL;
 
-	if (v4l2_fwnode_endpoint_parse(of_fwnode_handle(np), &endpoint) < 0)
+	if (v4l2_fwnode_endpoint_parse(&client->dev, of_fwnode_handle(np),
+				       &endpoint) < 0)
 		goto done;
 
 	pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index b5948759342e..b43fcac7ba47 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -976,7 +976,7 @@ static int og01a1b_check_hwcfg(struct device *dev)
 	if (!ep)
 		return -ENXIO;
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	ret = v4l2_fwnode_endpoint_alloc_parse(dev, ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
 		return ret;
diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
index 741d977a76f3..fd333b56339e 100644
--- a/drivers/media/i2c/ov02a10.c
+++ b/drivers/media/i2c/ov02a10.c
@@ -821,7 +821,7 @@ static int ov02a10_check_hwcfg(struct device *dev, struct ov02a10 *ov02a10)
 	if (!ep)
 		return -ENXIO;
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	ret = v4l2_fwnode_endpoint_alloc_parse(dev, ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
 		return ret;
diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
index 7d55d4ca24de..26228ad98821 100644
--- a/drivers/media/i2c/ov08d10.c
+++ b/drivers/media/i2c/ov08d10.c
@@ -1375,7 +1375,7 @@ static int ov08d10_get_hwcfg(struct ov08d10 *ov08d10, struct device *dev)
 	if (!ep)
 		return -ENXIO;
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	ret = v4l2_fwnode_endpoint_alloc_parse(dev, ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
 		return ret;
diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 77bcdcd0824c..75996c8b341b 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -3172,7 +3172,7 @@ static int ov08x40_check_hwcfg(struct device *dev)
 	if (!ep)
 		return -ENXIO;
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	ret = v4l2_fwnode_endpoint_alloc_parse(dev, ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
 		return ret;
diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index 6110fb1e6bc6..79a6ae3627fb 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -1348,7 +1348,7 @@ static int ov13b10_check_hwcfg(struct device *dev)
 	if (!ep)
 		return -ENXIO;
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	ret = v4l2_fwnode_endpoint_alloc_parse(dev, ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
 		return ret;
diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index 5429bd2eb053..a009c7435b7d 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -1402,7 +1402,8 @@ ov2659_get_pdata(struct i2c_client *client)
 	if (!endpoint)
 		return NULL;
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(of_fwnode_handle(endpoint),
+	ret = v4l2_fwnode_endpoint_alloc_parse(&client->dev,
+					       of_fwnode_handle(endpoint),
 					       &bus_cfg);
 	if (ret) {
 		pdata = NULL;
diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 158d934733c3..0e7827cbcd3e 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1006,7 +1006,7 @@ static int ov2740_check_hwcfg(struct device *dev)
 	if (!ep)
 		return -ENXIO;
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	ret = v4l2_fwnode_endpoint_alloc_parse(dev, ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
 		return ret;
diff --git a/drivers/media/i2c/ov4689.c b/drivers/media/i2c/ov4689.c
index fda217d2cb10..0ddc40f7a1a0 100644
--- a/drivers/media/i2c/ov4689.c
+++ b/drivers/media/i2c/ov4689.c
@@ -851,7 +851,7 @@ static int ov4689_check_hwcfg(struct device *dev)
 	if (!endpoint)
 		return -EINVAL;
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
+	ret = v4l2_fwnode_endpoint_alloc_parse(dev, endpoint, &bus_cfg);
 	fwnode_handle_put(endpoint);
 	if (ret)
 		return ret;
diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 36b509714c8c..5cefac2a6e98 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -3856,7 +3856,7 @@ static int ov5640_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
-	ret = v4l2_fwnode_endpoint_parse(endpoint, &sensor->ep);
+	ret = v4l2_fwnode_endpoint_parse(dev, endpoint, &sensor->ep);
 	fwnode_handle_put(endpoint);
 	if (ret) {
 		dev_err(dev, "Could not parse endpoint\n");
diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index a70db7e601a4..9e6cc51bffa0 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -1059,7 +1059,7 @@ static int ov5645_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
-	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(endpoint),
+	ret = v4l2_fwnode_endpoint_parse(dev, of_fwnode_handle(endpoint),
 					 &ov5645->ep);
 
 	of_node_put(endpoint);
diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 8de398423b7c..97a7f0485e99 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -97,6 +97,7 @@ struct ov5647_mode {
 };
 
 struct ov5647 {
+	struct device			*dev;
 	struct v4l2_subdev		sd;
 	struct media_pad		pad;
 	struct mutex			lock;
@@ -1373,7 +1374,8 @@ static int ov5647_parse_dt(struct ov5647 *sensor, struct device_node *np)
 	if (!ep)
 		return -EINVAL;
 
-	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &bus_cfg);
+	ret = v4l2_fwnode_endpoint_parse(sensor->dev, of_fwnode_handle(ep),
+					 &bus_cfg);
 	if (ret)
 		goto out;
 
@@ -1399,6 +1401,8 @@ static int ov5647_probe(struct i2c_client *client)
 	if (!sensor)
 		return -ENOMEM;
 
+	sensor->dev = dev;
+
 	if (IS_ENABLED(CONFIG_OF) && np) {
 		ret = ov5647_parse_dt(sensor, np);
 		if (ret) {
diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
index aa10eb4e3991..3ed234145c95 100644
--- a/drivers/media/i2c/ov5648.c
+++ b/drivers/media/i2c/ov5648.c
@@ -2464,7 +2464,7 @@ static int ov5648_probe(struct i2c_client *client)
 
 	sensor->endpoint.bus_type = V4L2_MBUS_CSI2_DPHY;
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(handle, &sensor->endpoint);
+	ret = v4l2_fwnode_endpoint_alloc_parse(dev, handle, &sensor->endpoint);
 	fwnode_handle_put(handle);
 	if (ret) {
 		dev_err(dev, "failed to parse endpoint node\n");
diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index d722348b938b..4b0dc790adb7 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2726,7 +2726,8 @@ static int ov5670_probe(struct i2c_client *client)
 	ov5670->endpoint.bus_type = V4L2_MBUS_CSI2_DPHY;
 	ov5670->endpoint.bus.mipi_csi2.num_data_lanes = 2;
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(handle, &ov5670->endpoint);
+	ret = v4l2_fwnode_endpoint_alloc_parse(&client->dev, handle,
+					       &ov5670->endpoint);
 	fwnode_handle_put(handle);
 	if (ret)
 		return dev_err_probe(&client->dev, ret, "Endpoint parse failed\n");
diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index 700c4b69846f..065e971e90ad 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -1273,7 +1273,7 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675, struct device *dev)
 	if (!ep)
 		return -ENXIO;
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	ret = v4l2_fwnode_endpoint_alloc_parse(dev, ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
 		return ret;
diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 7f9212cce239..975bf474fdc6 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -1363,7 +1363,7 @@ static int ov5693_check_hwcfg(struct ov5693_device *ov5693)
 	if (!endpoint)
 		return -EPROBE_DEFER; /* Could be provided by cio2-bridge */
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
+	ret = v4l2_fwnode_endpoint_alloc_parse(ov5693->dev, endpoint, &bus_cfg);
 	fwnode_handle_put(endpoint);
 	if (ret)
 		return ret;
diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 675fb37a6fea..b47ceedb5888 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1467,7 +1467,7 @@ static int ov7251_check_hwcfg(struct ov7251 *ov7251)
 	if (!endpoint)
 		return -EPROBE_DEFER; /* could be provided by cio2-bridge */
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
+	ret = v4l2_fwnode_endpoint_alloc_parse(ov7251->dev, endpoint, &bus_cfg);
 	fwnode_handle_put(endpoint);
 	if (ret)
 		return dev_err_probe(ov7251->dev, ret,
diff --git a/drivers/media/i2c/ov7670.c b/drivers/media/i2c/ov7670.c
index 2f55491ef571..e1b6267a6f8f 100644
--- a/drivers/media/i2c/ov7670.c
+++ b/drivers/media/i2c/ov7670.c
@@ -1833,7 +1833,7 @@ static int ov7670_parse_dt(struct device *dev,
 	if (!ep)
 		return -EINVAL;
 
-	ret = v4l2_fwnode_endpoint_parse(ep, &bus_cfg);
+	ret = v4l2_fwnode_endpoint_parse(dev, ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
 		return ret;
diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
index 386d69c8e074..2ab4c2c3234e 100644
--- a/drivers/media/i2c/ov772x.c
+++ b/drivers/media/i2c/ov772x.c
@@ -1391,11 +1391,12 @@ static int ov772x_parse_dt(struct i2c_client *client,
 	 * time. v4l2_fwnode_endpoint_alloc_parse() will not fail if
 	 * 'bus-type' is not specified.
 	 */
-	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	ret = v4l2_fwnode_endpoint_alloc_parse(&client->dev, ep, &bus_cfg);
 	if (ret) {
 		bus_cfg = (struct v4l2_fwnode_endpoint)
 			  { .bus_type = V4L2_MBUS_BT656 };
-		ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+		ret = v4l2_fwnode_endpoint_alloc_parse(&client->dev, ep,
+						       &bus_cfg);
 		if (ret)
 			goto error_fwnode_put;
 	}
diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index f053c3a7676a..eede88ce8221 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -2354,7 +2354,7 @@ static int ov8856_get_hwcfg(struct ov8856 *ov8856, struct device *dev)
 	if (!ep)
 		return -ENXIO;
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	ret = v4l2_fwnode_endpoint_alloc_parse(dev, ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
 		return ret;
diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3af6125a2eee..453f1d6975fd 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1849,7 +1849,7 @@ static int ov8858_parse_of(struct ov8858 *ov8858)
 		return -EINVAL;
 	}
 
-	ret = v4l2_fwnode_endpoint_parse(endpoint, &vep);
+	ret = v4l2_fwnode_endpoint_parse(dev, endpoint, &vep);
 	if (ret) {
 		dev_err(dev, "Failed to parse endpoint: %d\n", ret);
 		fwnode_handle_put(endpoint);
diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index f2213c6158d3..ad1c449f6e8e 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2987,7 +2987,7 @@ static int ov8865_probe(struct i2c_client *client)
 
 	sensor->endpoint.bus_type = V4L2_MBUS_CSI2_DPHY;
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(handle, &sensor->endpoint);
+	ret = v4l2_fwnode_endpoint_alloc_parse(dev, handle, &sensor->endpoint);
 	fwnode_handle_put(handle);
 	if (ret) {
 		dev_err(dev, "failed to parse endpoint node\n");
diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 068c7449f50e..1692a748ab6c 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -1156,7 +1156,7 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
 	if (!ep)
 		return -ENXIO;
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	ret = v4l2_fwnode_endpoint_alloc_parse(ov9282->dev, ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
 		return ret;
diff --git a/drivers/media/i2c/ov9734.c b/drivers/media/i2c/ov9734.c
index b6244772bc59..80410be2ff98 100644
--- a/drivers/media/i2c/ov9734.c
+++ b/drivers/media/i2c/ov9734.c
@@ -898,7 +898,7 @@ static int ov9734_check_hwcfg(struct device *dev)
 	if (!ep)
 		return -ENXIO;
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	ret = v4l2_fwnode_endpoint_alloc_parse(dev, ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
 		return ret;
diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-core.c b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
index ed5b10731a14..84edd2ba7b85 100644
--- a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
+++ b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
@@ -1561,7 +1561,7 @@ static int s5c73m3_get_dt_data(struct s5c73m3 *state)
 		return 0;
 	}
 
-	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(node_ep), &ep);
+	ret = v4l2_fwnode_endpoint_parse(dev, of_fwnode_handle(node_ep), &ep);
 	of_node_put(node_ep);
 	if (ret)
 		return ret;
diff --git a/drivers/media/i2c/s5k5baf.c b/drivers/media/i2c/s5k5baf.c
index 67da2045f543..bf113183080b 100644
--- a/drivers/media/i2c/s5k5baf.c
+++ b/drivers/media/i2c/s5k5baf.c
@@ -1842,7 +1842,7 @@ static int s5k5baf_parse_device_node(struct s5k5baf *state, struct device *dev)
 		return -EINVAL;
 	}
 
-	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(node_ep), &ep);
+	ret = v4l2_fwnode_endpoint_parse(dev, of_fwnode_handle(node_ep), &ep);
 	of_node_put(node_ep);
 	if (ret)
 		return ret;
diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index 906553a28676..e6462fb3373c 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -892,7 +892,8 @@ static int mipid02_parse_rx_ep(struct mipid02_dev *bridge)
 		goto error;
 	}
 
-	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep_node), &ep);
+	ret = v4l2_fwnode_endpoint_parse(&client->dev, of_fwnode_handle(ep_node),
+					 &ep);
 	if (ret) {
 		dev_err(&client->dev, "Could not parse v4l2 endpoint %d\n",
 			ret);
@@ -953,7 +954,8 @@ static int mipid02_parse_tx_ep(struct mipid02_dev *bridge)
 		goto error;
 	}
 
-	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep_node), &ep);
+	ret = v4l2_fwnode_endpoint_parse(&client->dev, of_fwnode_handle(ep_node),
+					 &ep);
 	if (ret) {
 		dev_err(&client->dev, "Could not parse v4l2 endpoint\n");
 		goto error_of_node_put;
diff --git a/drivers/media/i2c/st-vgxy61.c b/drivers/media/i2c/st-vgxy61.c
index 30f82ca344c4..9125bae1116d 100644
--- a/drivers/media/i2c/st-vgxy61.c
+++ b/drivers/media/i2c/st-vgxy61.c
@@ -1504,7 +1504,7 @@ static int vgxy61_tx_from_ep(struct vgxy61_dev *sensor,
 	unsigned int p, l, i;
 	int ret;
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(handle, &ep);
+	ret = v4l2_fwnode_endpoint_alloc_parse(&client->dev, handle, &ep);
 	if (ret)
 		return -EINVAL;
 
diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 15f8163be9bf..777ed9935d84 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -1901,7 +1901,8 @@ static int tc358743_probe_of(struct tc358743_state *state)
 		return -EINVAL;
 	}
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(of_fwnode_handle(ep), &endpoint);
+	ret = v4l2_fwnode_endpoint_alloc_parse(dev, of_fwnode_handle(ep),
+					       &endpoint);
 	if (ret) {
 		dev_err(dev, "failed to parse endpoint\n");
 		goto put_node;
diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index 3f7e147ef594..3392ea7af020 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -1316,7 +1316,7 @@ tc358746_init_output_port(struct tc358746 *tc358746, unsigned long refclk)
 	/* Currently we only support 'parallel in' -> 'csi out' */
 	vep = &tc358746->csi_vep;
 	vep->bus_type = V4L2_MBUS_CSI2_DPHY;
-	err = v4l2_fwnode_endpoint_alloc_parse(ep, vep);
+	err = v4l2_fwnode_endpoint_alloc_parse(dev, ep, vep);
 	fwnode_handle_put(ep);
 	if (err) {
 		dev_err(dev, "Failed to parse source endpoint\n");
@@ -1454,7 +1454,7 @@ static int tc358746_async_register(struct tc358746 *tc358746)
 	if (!ep)
 		return -ENOTCONN;
 
-	err = v4l2_fwnode_endpoint_parse(ep, &vep);
+	err = v4l2_fwnode_endpoint_parse(tc358746->sd.dev, ep, &vep);
 	if (err) {
 		fwnode_handle_put(ep);
 		return err;
diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index 325e99125941..a4d76ae3f7b2 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -2311,7 +2311,8 @@ static int tda1997x_parse_dt(struct tda1997x_state *state)
 	if (!ep)
 		return -EINVAL;
 
-	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &bus_cfg);
+	ret = v4l2_fwnode_endpoint_parse(&state->client->dev, of_fwnode_handle(ep),
+					 &bus_cfg);
 	if (ret) {
 		of_node_put(ep);
 		return ret;
diff --git a/drivers/media/i2c/tvp514x.c b/drivers/media/i2c/tvp514x.c
index aa6d4b67b6d5..cae8091b8bf3 100644
--- a/drivers/media/i2c/tvp514x.c
+++ b/drivers/media/i2c/tvp514x.c
@@ -991,7 +991,8 @@ tvp514x_get_pdata(struct i2c_client *client)
 	if (!endpoint)
 		return NULL;
 
-	if (v4l2_fwnode_endpoint_parse(of_fwnode_handle(endpoint), &bus_cfg))
+	if (v4l2_fwnode_endpoint_parse(&client->dev, of_fwnode_handle(endpoint),
+				       &bus_cfg))
 		goto done;
 
 	pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index c7fb35ee3f9d..1ff4612bbd6c 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -2076,7 +2076,7 @@ static int tvp5150_parse_dt(struct tvp5150 *decoder, struct device_node *np)
 		dev_err(dev, "Error no output endpoint available\n");
 		goto err_free;
 	}
-	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep_np), &bus_cfg);
+	ret = v4l2_fwnode_endpoint_parse(dev, of_fwnode_handle(ep_np), &bus_cfg);
 	of_node_put(ep_np);
 	if (ret)
 		goto err_free;
diff --git a/drivers/media/i2c/tvp7002.c b/drivers/media/i2c/tvp7002.c
index a2d7bc799849..8024ebe2d79e 100644
--- a/drivers/media/i2c/tvp7002.c
+++ b/drivers/media/i2c/tvp7002.c
@@ -897,7 +897,8 @@ tvp7002_get_pdata(struct i2c_client *client)
 	if (!endpoint)
 		return NULL;
 
-	if (v4l2_fwnode_endpoint_parse(of_fwnode_handle(endpoint), &bus_cfg))
+	if (v4l2_fwnode_endpoint_parse(&client->dev, of_fwnode_handle(endpoint),
+				       &bus_cfg))
 		goto done;
 
 	pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 34984a7474ed..56abe18ce763 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -1470,7 +1470,7 @@ static int cio2_parse_firmware(struct cio2_device *cio2)
 		if (!ep)
 			continue;
 
-		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+		ret = v4l2_fwnode_endpoint_parse(dev, ep, &vep);
 		if (ret)
 			goto err_parse;
 
diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
index c29e04864445..a0d6688fca26 100644
--- a/drivers/media/platform/atmel/atmel-isi.c
+++ b/drivers/media/platform/atmel/atmel-isi.c
@@ -837,7 +837,7 @@ static int atmel_isi_parse_dt(struct atmel_isi *isi,
 		return -EINVAL;
 	}
 
-	err = v4l2_fwnode_endpoint_parse(of_fwnode_handle(np), &ep);
+	err = v4l2_fwnode_endpoint_parse(&pdev->dev, of_fwnode_handle(np), &ep);
 	of_node_put(np);
 	if (err) {
 		dev_err(&pdev->dev, "Could not parse the endpoint\n");
diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 9755d1c8ceb9..3bfa5bd65df4 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -375,7 +375,7 @@ static int csi2rx_parse_dt(struct csi2rx_priv *csi2rx)
 		return -EINVAL;
 
 	fwh = of_fwnode_handle(ep);
-	ret = v4l2_fwnode_endpoint_parse(fwh, &v4l2_ep);
+	ret = v4l2_fwnode_endpoint_parse(csi2rx->dev, fwh, &v4l2_ep);
 	if (ret) {
 		dev_err(csi2rx->dev, "Could not parse v4l2 endpoint\n");
 		of_node_put(ep);
diff --git a/drivers/media/platform/cadence/cdns-csi2tx.c b/drivers/media/platform/cadence/cdns-csi2tx.c
index 1e0400b7803e..880f0e22702d 100644
--- a/drivers/media/platform/cadence/cdns-csi2tx.c
+++ b/drivers/media/platform/cadence/cdns-csi2tx.c
@@ -504,7 +504,8 @@ static int csi2tx_check_lanes(struct csi2tx_priv *csi2tx)
 	if (!ep)
 		return -EINVAL;
 
-	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &v4l2_ep);
+	ret = v4l2_fwnode_endpoint_parse(csi2tx->dev, of_fwnode_handle(ep),
+					 &v4l2_ep);
 	if (ret) {
 		dev_err(csi2tx->dev, "Could not parse v4l2 endpoint\n");
 		goto out;
diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
index 9ed3c2e063de..2088d4f8ebaa 100644
--- a/drivers/media/platform/intel/pxa_camera.c
+++ b/drivers/media/platform/intel/pxa_camera.c
@@ -2213,7 +2213,7 @@ static int pxa_camera_pdata_from_dt(struct device *dev,
 		return -EINVAL;
 	}
 
-	err = v4l2_fwnode_endpoint_parse(of_fwnode_handle(np), &ep);
+	err = v4l2_fwnode_endpoint_parse(dev, of_fwnode_handle(np), &ep);
 	if (err) {
 		dev_err(dev, "could not parse endpoint\n");
 		goto out;
diff --git a/drivers/media/platform/microchip/microchip-csi2dc.c b/drivers/media/platform/microchip/microchip-csi2dc.c
index bfb3edcf018a..3173ea8987d7 100644
--- a/drivers/media/platform/microchip/microchip-csi2dc.c
+++ b/drivers/media/platform/microchip/microchip-csi2dc.c
@@ -570,7 +570,8 @@ static int csi2dc_of_parse(struct csi2dc_device *csi2dc,
 		return -EINVAL;
 	}
 
-	ret = v4l2_fwnode_endpoint_parse(input_fwnode, &input_endpoint);
+	ret = v4l2_fwnode_endpoint_parse(csi2dc->dev, input_fwnode,
+					 &input_endpoint);
 	if (ret) {
 		dev_err(csi2dc->dev, "endpoint not defined at %pOF\n", of_node);
 		goto csi2dc_of_parse_err;
@@ -596,7 +597,7 @@ static int csi2dc_of_parse(struct csi2dc_device *csi2dc,
 				(of_fwnode_handle(of_node), input_fwnode);
 
 	if (output_fwnode)
-		ret = v4l2_fwnode_endpoint_parse(output_fwnode,
+		ret = v4l2_fwnode_endpoint_parse(csi2dc->dev, output_fwnode,
 						 &output_endpoint);
 
 	fwnode_handle_put(output_fwnode);
diff --git a/drivers/media/platform/microchip/microchip-sama5d2-isc.c b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
index 746f4a2fa9f6..ff6656cb60fe 100644
--- a/drivers/media/platform/microchip/microchip-sama5d2-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
@@ -367,7 +367,7 @@ static int isc_parse_dt(struct device *dev, struct isc_device *isc)
 		if (!epn)
 			return 0;
 
-		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
+		ret = v4l2_fwnode_endpoint_parse(dev, of_fwnode_handle(epn),
 						 &v4l2_epn);
 		if (ret) {
 			ret = -EINVAL;
diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
index 79ae696764d0..9ae2c319d05b 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -353,7 +353,7 @@ static int xisc_parse_dt(struct device *dev, struct isc_device *isc)
 		if (!epn)
 			return 0;
 
-		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
+		ret = v4l2_fwnode_endpoint_parse(dev, of_fwnode_handle(epn),
 						 &v4l2_epn);
 		if (ret) {
 			ret = -EINVAL;
diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 05d52762e792..dfcb14b1d09d 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1259,7 +1259,7 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
 	if (!ep)
 		return -ENOTCONN;
 
-	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+	ret = v4l2_fwnode_endpoint_parse(csis->dev, ep, &vep);
 	if (ret)
 		goto err_parse;
 
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 1ef26aea3eae..0c2cfedf6500 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1039,7 +1039,7 @@ static int camss_of_parse_endpoint_node(struct device *dev,
 	struct v4l2_fwnode_endpoint vep = { { 0 } };
 	unsigned int i;
 
-	v4l2_fwnode_endpoint_parse(of_fwnode_handle(node), &vep);
+	v4l2_fwnode_endpoint_parse(dev, of_fwnode_handle(node), &vep);
 
 	csd->interface.csiphy_id = vep.base.port;
 
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 3c4f5eb93be1..6983936e3684 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -319,7 +319,7 @@ static int rvin_group_parse_of(struct rvin_dev *vin, unsigned int port,
 		return 0;
 
 	fwnode = fwnode_graph_get_remote_endpoint(ep);
-	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+	ret = v4l2_fwnode_endpoint_parse(vin->dev, ep, &vep);
 	fwnode_handle_put(ep);
 	if (ret) {
 		vin_err(vin, "Failed to parse %pOF\n", to_of_node(fwnode));
@@ -664,7 +664,7 @@ static int rvin_parallel_parse_of(struct rvin_dev *vin)
 		return 0;
 
 	fwnode = fwnode_graph_get_remote_endpoint(ep);
-	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+	ret = v4l2_fwnode_endpoint_parse(vin->dev, ep, &vep);
 	fwnode_handle_put(ep);
 	if (ret) {
 		vin_err(vin, "Failed to parse %pOF\n", to_of_node(fwnode));
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
index 7a134c0eff57..6efedb654608 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
@@ -1105,7 +1105,7 @@ static int rcsi2_parse_dt(struct rcar_csi2 *priv)
 		return -EINVAL;
 	}
 
-	ret = v4l2_fwnode_endpoint_parse(ep, &v4l2_ep);
+	ret = v4l2_fwnode_endpoint_parse(priv->dev, ep, &v4l2_ep);
 	if (ret) {
 		dev_err(priv->dev, "Could not parse v4l2 endpoint\n");
 		fwnode_handle_put(ep);
diff --git a/drivers/media/platform/renesas/renesas-ceu.c b/drivers/media/platform/renesas/renesas-ceu.c
index 5c9e27f8c94b..3c8aeb4ededd 100644
--- a/drivers/media/platform/renesas/renesas-ceu.c
+++ b/drivers/media/platform/renesas/renesas-ceu.c
@@ -1559,7 +1559,8 @@ static int ceu_parse_dt(struct ceu_device *ceudev)
 			goto error_cleanup;
 		}
 
-		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &fw_ep);
+		ret = v4l2_fwnode_endpoint_parse(ceudev->dev,
+						 of_fwnode_handle(ep), &fw_ep);
 		if (ret) {
 			dev_err(ceudev->dev,
 				"Unable to parse endpoint #%u: %d.\n", i, ret);
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 7a71370fcc32..c64e1e237323 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -147,7 +147,7 @@ static int rzg2l_cru_mc_parse_of(struct rzg2l_cru_dev *cru)
 		return 0;
 
 	fwnode = fwnode_graph_get_remote_endpoint(ep);
-	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+	ret = v4l2_fwnode_endpoint_parse(cru->dev, ep, &vep);
 	fwnode_handle_put(ep);
 	if (ret) {
 		dev_err(cru->dev, "Failed to parse %pOF\n", to_of_node(fwnode));
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index d6489c62b081..ba0eef3fb64d 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -658,7 +658,7 @@ static int rzg2l_csi2_parse_dt(struct rzg2l_csi2 *csi2)
 		return -EINVAL;
 	}
 
-	ret = v4l2_fwnode_endpoint_parse(ep, &v4l2_ep);
+	ret = v4l2_fwnode_endpoint_parse(csi2->dev, ep, &v4l2_ep);
 	if (ret) {
 		dev_err(csi2->dev, "Could not parse v4l2 endpoint\n");
 		fwnode_handle_put(ep);
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 4762cb32353d..0e250be314fc 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -227,7 +227,7 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
 		}
 
 		/* Parse the endpoint and validate the bus type. */
-		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+		ret = v4l2_fwnode_endpoint_parse(rkisp1->dev, ep, &vep);
 		if (ret) {
 			dev_err(rkisp1->dev, "failed to parse endpoint %pfw\n",
 				ep);
diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.c b/drivers/media/platform/samsung/exynos4-is/media-dev.c
index c9cb9a216fae..ff2c8d5be7c8 100644
--- a/drivers/media/platform/samsung/exynos4-is/media-dev.c
+++ b/drivers/media/platform/samsung/exynos4-is/media-dev.c
@@ -405,7 +405,8 @@ static int fimc_md_parse_one_endpoint(struct fimc_md *fmd,
 	struct v4l2_fwnode_endpoint endpoint = { .bus_type = 0 };
 	int ret;
 
-	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &endpoint);
+	ret = v4l2_fwnode_endpoint_parse(&fmd->pdev->dev, of_fwnode_handle(ep),
+					 &endpoint);
 	if (ret) {
 		of_node_put(ep);
 		return ret;
diff --git a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
index 686ca8753ba2..3b9529dc8b13 100644
--- a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
+++ b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
@@ -735,7 +735,8 @@ static int s5pcsis_parse_dt(struct platform_device *pdev,
 		return -EINVAL;
 	}
 	/* Get port node and validate MIPI-CSI channel id. */
-	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(node), &endpoint);
+	ret = v4l2_fwnode_endpoint_parse(&pdev->dev, of_fwnode_handle(node),
+					 &endpoint);
 	if (ret)
 		goto err;
 
diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index dad6e22e4ce4..6581e17e199a 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -1957,7 +1957,7 @@ static int dcmi_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(np), &ep);
+	ret = v4l2_fwnode_endpoint_parse(&pdev->dev, of_fwnode_handle(np), &ep);
 	of_node_put(np);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not parse the endpoint\n");
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index d6e7d1b36083..4e183a39dd1b 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -129,7 +129,7 @@ static int sun4i_csi_notifier_init(struct sun4i_csi *csi)
 	if (!ep)
 		return -EINVAL;
 
-	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+	ret = v4l2_fwnode_endpoint_parse(csi->dev, ep, &vep);
 	if (ret)
 		goto out;
 
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
index 4db950973ce2..906cec6d0c9f 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
@@ -720,7 +720,7 @@ static int sun6i_csi_bridge_source_setup(struct sun6i_csi_device *csi_dev,
 	if (!handle)
 		return -ENODEV;
 
-	ret = v4l2_fwnode_endpoint_parse(handle, endpoint);
+	ret = v4l2_fwnode_endpoint_parse(dev, handle, endpoint);
 	if (ret)
 		goto complete;
 
diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
index dce130b4c9f6..99eabd041881 100644
--- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
@@ -474,7 +474,7 @@ sun6i_mipi_csi2_bridge_source_setup(struct sun6i_mipi_csi2_device *csi2_dev)
 
 	endpoint->bus_type = V4L2_MBUS_CSI2_DPHY;
 
-	ret = v4l2_fwnode_endpoint_parse(handle, endpoint);
+	ret = v4l2_fwnode_endpoint_parse(dev, handle, endpoint);
 	if (ret)
 		goto complete;
 
diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
index 23d32e198aaa..41a59e4d717f 100644
--- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
@@ -511,7 +511,7 @@ sun8i_a83t_mipi_csi2_bridge_source_setup(struct sun8i_a83t_mipi_csi2_device *csi
 
 	endpoint->bus_type = V4L2_MBUS_CSI2_DPHY;
 
-	ret = v4l2_fwnode_endpoint_parse(handle, endpoint);
+	ret = v4l2_fwnode_endpoint_parse(dev, handle, endpoint);
 	if (ret)
 		goto complete;
 
diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
index ffe1887cc429..467717143d5a 100644
--- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
@@ -2338,7 +2338,7 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
 			sdinfo->vpfe_param.if_type = VPFE_RAW_BAYER;
 		}
 
-		err = v4l2_fwnode_endpoint_parse(of_fwnode_handle(endpoint),
+		err = v4l2_fwnode_endpoint_parse(dev, of_fwnode_handle(endpoint),
 						 &bus_cfg);
 		if (err) {
 			dev_err(dev, "Could not parse the endpoint\n");
diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
index 16ae52879a79..b20057aa820f 100644
--- a/drivers/media/platform/ti/cal/cal-camerarx.c
+++ b/drivers/media/platform/ti/cal/cal-camerarx.c
@@ -539,7 +539,8 @@ static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
 	}
 
 	endpoint->bus_type = V4L2_MBUS_CSI2_DPHY;
-	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep_node), endpoint);
+	ret = v4l2_fwnode_endpoint_parse(phy->cal->dev, of_fwnode_handle(ep_node),
+					 endpoint);
 	if (ret < 0) {
 		phy_err(phy, "Failed to parse endpoint\n");
 		goto done;
diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
index 44d269d6038c..a80669ee7e4e 100644
--- a/drivers/media/platform/ti/davinci/vpif_capture.c
+++ b/drivers/media/platform/ti/davinci/vpif_capture.c
@@ -1546,7 +1546,8 @@ vpif_capture_get_pdata(struct platform_device *pdev)
 		chan->inputs[i].input.std = V4L2_STD_ALL;
 		chan->inputs[i].input.capabilities = V4L2_IN_CAP_STD;
 
-		err = v4l2_fwnode_endpoint_parse(of_fwnode_handle(endpoint),
+		err = v4l2_fwnode_endpoint_parse(&pdev->dev,
+						 of_fwnode_handle(endpoint),
 						 &bus_cfg);
 		if (err) {
 			dev_err(&pdev->dev, "Could not parse the endpoint\n");
diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
index f3aaa9e76492..4e1d116dd5aa 100644
--- a/drivers/media/platform/ti/omap3isp/isp.c
+++ b/drivers/media/platform/ti/omap3isp/isp.c
@@ -2165,7 +2165,7 @@ static int isp_parse_of_endpoints(struct isp_device *isp)
 
 		dev_dbg(isp->dev, "parsing parallel interface\n");
 
-		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+		ret = v4l2_fwnode_endpoint_parse(isp->dev, ep, &vep);
 
 		if (!ret) {
 			isd = v4l2_async_nf_add_fwnode_remote(&isp->notifier,
@@ -2194,16 +2194,16 @@ static int isp_parse_of_endpoints(struct isp_device *isp)
 		dev_dbg(isp->dev, "parsing serial interface %u, node %pOF\n", i,
 			to_of_node(ep));
 
-		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+		ret = v4l2_fwnode_endpoint_parse(isp->dev, ep, &vep);
 		if (ret == -ENXIO) {
 			vep = (struct v4l2_fwnode_endpoint)
 				{ .bus_type = V4L2_MBUS_CSI1 };
-			ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+			ret = v4l2_fwnode_endpoint_parse(isp->dev, ep, &vep);
 
 			if (ret == -ENXIO) {
 				vep = (struct v4l2_fwnode_endpoint)
 					{ .bus_type = V4L2_MBUS_CCP2 };
-				ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+				ret = v4l2_fwnode_endpoint_parse(isp->dev, ep, &vep);
 			}
 		}
 
diff --git a/drivers/media/platform/xilinx/xilinx-csi2rxss.c b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
index 5b53745fe44e..5db655d9a6c2 100644
--- a/drivers/media/platform/xilinx/xilinx-csi2rxss.c
+++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
@@ -923,7 +923,7 @@ static int xcsi2rxss_parse_of(struct xcsi2rxss_state *xcsi2rxss)
 		return -EINVAL;
 	}
 
-	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+	ret = v4l2_fwnode_endpoint_parse(dev, ep, &vep);
 	fwnode_handle_put(ep);
 	if (ret) {
 		dev_err(dev, "error parsing sink port");
diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 049c2f2001ea..b65966641872 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -493,7 +493,7 @@ static int __v4l2_fwnode_endpoint_parse(struct fwnode_handle *fwnode,
 	return 0;
 }
 
-int v4l2_fwnode_endpoint_parse(struct fwnode_handle *fwnode,
+int v4l2_fwnode_endpoint_parse(struct device *dev, struct fwnode_handle *fwnode,
 			       struct v4l2_fwnode_endpoint *vep)
 {
 	int ret;
@@ -516,7 +516,8 @@ void v4l2_fwnode_endpoint_free(struct v4l2_fwnode_endpoint *vep)
 }
 EXPORT_SYMBOL_GPL(v4l2_fwnode_endpoint_free);
 
-int v4l2_fwnode_endpoint_alloc_parse(struct fwnode_handle *fwnode,
+int v4l2_fwnode_endpoint_alloc_parse(struct device *dev,
+				     struct fwnode_handle *fwnode,
 				     struct v4l2_fwnode_endpoint *vep)
 {
 	int rval;
@@ -822,7 +823,7 @@ v4l2_async_nf_fwnode_parse_endpoint(struct device *dev,
 		goto out_err;
 	}
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &vep);
+	ret = v4l2_fwnode_endpoint_alloc_parse(dev, endpoint, &vep);
 	if (ret) {
 		dev_warn(dev, "unable to parse V4L2 fwnode endpoint (%d)\n",
 			 ret);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index 0d12ba78d9c1..9cf0bb9f0336 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -840,7 +840,7 @@ int atomisp_csi2_bridge_parse_firmware(struct atomisp_device *isp)
 		if (!ep)
 			continue;
 
-		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+		ret = v4l2_fwnode_endpoint_parse(isp->dev, ep, &vep);
 		if (ret)
 			goto err_parse;
 
diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
index cc86ebcc76af..4fe2beb8d15a 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
@@ -347,7 +347,7 @@ static int isc_parse_dt(struct device *dev, struct isc_device *isc)
 		if (!epn)
 			return 0;
 
-		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
+		ret = v4l2_fwnode_endpoint_parse(dev, of_fwnode_handle(epn),
 						 &v4l2_epn);
 		if (ret) {
 			ret = -EINVAL;
diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
index 68ef3374d25e..83a452427cb8 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
@@ -333,7 +333,7 @@ static int xisc_parse_dt(struct device *dev, struct isc_device *isc)
 		if (!epn)
 			return 0;
 
-		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
+		ret = v4l2_fwnode_endpoint_parse(dev, of_fwnode_handle(epn),
 						 &v4l2_epn);
 		if (ret) {
 			ret = -EINVAL;
diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index ab565b4e29ec..1b157b077c7a 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -687,7 +687,7 @@ static int csi2_async_register(struct csi2_dev *csi2)
 	if (!ep)
 		return -ENOTCONN;
 
-	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+	ret = v4l2_fwnode_endpoint_parse(csi2->dev, ep, &vep);
 	if (ret)
 		goto err_parse;
 
diff --git a/drivers/staging/media/imx/imx8mq-mipi-csi2.c b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
index ca2efcc21efe..550358c83e27 100644
--- a/drivers/staging/media/imx/imx8mq-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
@@ -599,7 +599,7 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
 	if (!ep)
 		return -ENOTCONN;
 
-	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+	ret = v4l2_fwnode_endpoint_parse(state->dev, ep, &vep);
 	if (ret)
 		goto err_parse;
 
diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index c44145284aa1..8c1ec8f879a8 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -353,7 +353,7 @@ static int max96712_parse_dt(struct max96712_priv *priv)
 		return -EINVAL;
 	}
 
-	ret = v4l2_fwnode_endpoint_parse(ep, &v4l2_ep);
+	ret = v4l2_fwnode_endpoint_parse(&priv->client->dev, ep, &v4l2_ep);
 	fwnode_handle_put(ep);
 	if (ret) {
 		dev_err(&priv->client->dev, "Could not parse v4l2 endpoint\n");
diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
index 1ca4673df2b3..9ecf6bc34159 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
@@ -463,7 +463,7 @@ static int sun6i_isp_proc_source_setup(struct sun6i_isp_device *isp_dev,
 	if (!handle)
 		return -ENODEV;
 
-	ret = v4l2_fwnode_endpoint_parse(handle, endpoint);
+	ret = v4l2_fwnode_endpoint_parse(dev, handle, endpoint);
 	if (ret)
 		goto complete;
 
diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 052172017b3b..5ff42cdb6805 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -548,7 +548,7 @@ static int tegra_csi_channels_alloc(struct tegra_csi *csi)
 			continue;
 
 		fwh = of_fwnode_handle(ep);
-		ret = v4l2_fwnode_endpoint_parse(fwh, &v4l2_ep);
+		ret = v4l2_fwnode_endpoint_parse(csi->dev, fwh, &v4l2_ep);
 		of_node_put(ep);
 		if (ret) {
 			dev_err(csi->dev,
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 79284c3b6cae..5329db064bdd 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1289,7 +1289,7 @@ static int tegra_vi_channels_alloc(struct tegra_vi *vi)
 
 		ep = of_graph_get_endpoint_by_regs(parent, 0, 0);
 		of_node_put(parent);
-		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep),
+		ret = v4l2_fwnode_endpoint_parse(vi->dev, of_fwnode_handle(ep),
 						 &v4l2_ep);
 		of_node_put(ep);
 		if (ret)
diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
index a1ab886acc18..d42c570ac0ad 100644
--- a/drivers/staging/media/tegra-video/vip.c
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -130,7 +130,7 @@ static int tegra_vip_channel_of_parse(struct tegra_vip *vip)
 	}
 
 	fwh = of_fwnode_handle(ep);
-	err = v4l2_fwnode_endpoint_parse(fwh, &v4l2_ep);
+	err = v4l2_fwnode_endpoint_parse(dev, fwh, &v4l2_ep);
 	of_node_put(ep);
 	if (err) {
 		dev_err_probe(dev, err, "%pOF: failed to parse v4l2 endpoint\n", np);
diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index 394d798f3dfa..479e4f82c3a3 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -186,6 +186,7 @@ enum v4l2_fwnode_bus_type {
 
 /**
  * v4l2_fwnode_endpoint_parse() - parse all fwnode node properties
+ * @dev: the device parsing the endpoint
  * @fwnode: pointer to the endpoint's fwnode handle
  * @vep: pointer to the V4L2 fwnode data structure
  *
@@ -216,6 +217,8 @@ enum v4l2_fwnode_bus_type {
  *
  * The function does not change the V4L2 fwnode endpoint state if it fails.
  *
+ * The @dev argument is used to provide context in kernel log message.
+ *
  * NOTE: This function does not parse "link-frequencies" property as its size is
  * not known in advance. Please use v4l2_fwnode_endpoint_alloc_parse() if you
  * need properties of variable size.
@@ -225,7 +228,8 @@ enum v4l2_fwnode_bus_type {
  *	   %-EINVAL on parsing failure
  *	   %-ENXIO on mismatching bus types
  */
-int v4l2_fwnode_endpoint_parse(struct fwnode_handle *fwnode,
+int v4l2_fwnode_endpoint_parse(struct device *dev,
+			       struct fwnode_handle *fwnode,
 			       struct v4l2_fwnode_endpoint *vep);
 
 /**
@@ -240,6 +244,7 @@ void v4l2_fwnode_endpoint_free(struct v4l2_fwnode_endpoint *vep);
 
 /**
  * v4l2_fwnode_endpoint_alloc_parse() - parse all fwnode node properties
+ * @dev: the device parsing the endpoint
  * @fwnode: pointer to the endpoint's fwnode handle
  * @vep: pointer to the V4L2 fwnode data structure
  *
@@ -270,6 +275,8 @@ void v4l2_fwnode_endpoint_free(struct v4l2_fwnode_endpoint *vep);
  *
  * The function does not change the V4L2 fwnode endpoint state if it fails.
  *
+ * The @dev argument is used to provide context in kernel log message.
+ *
  * v4l2_fwnode_endpoint_alloc_parse() has two important differences to
  * v4l2_fwnode_endpoint_parse():
  *
@@ -283,7 +290,8 @@ void v4l2_fwnode_endpoint_free(struct v4l2_fwnode_endpoint *vep);
  *	   %-EINVAL on parsing failure
  *	   %-ENXIO on mismatching bus types
  */
-int v4l2_fwnode_endpoint_alloc_parse(struct fwnode_handle *fwnode,
+int v4l2_fwnode_endpoint_alloc_parse(struct device *dev,
+				     struct fwnode_handle *fwnode,
 				     struct v4l2_fwnode_endpoint *vep);
 
 /**
-- 
Regards,

Laurent Pinchart

