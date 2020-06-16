Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F9241FB3AD
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 16:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729096AbgFPOJs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 10:09:48 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:51609 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729492AbgFPOJq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 10:09:46 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 54B07E000C;
        Tue, 16 Jun 2020 14:09:41 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 04/10] media: pxa_camera: Use the new set_mbus_config op
Date:   Tue, 16 Jun 2020 16:12:39 +0200
Message-Id: <20200616141244.49407-5-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200616141244.49407-1-jacopo+renesas@jmondi.org>
References: <20200616141244.49407-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the PXA camera driver to use the new set_mbus_config pad operation.
For this platform the change is not only cosmetic, as the pxa driver is
currently the only driver in mainline to make use of the g_mbus_config
and s_mbus_config video operations.

The existing driver semantic is the following:
- Collect all supported mbus config flags from the remote end
- Match them with the supported PXA mbus configuration flags
- If the remote subdevice allows multiple options for for VSYNC, HSYNC
  and PCLK polarity, use platform data requested settings

The semantic of the new get_mbus_config and set_mbus_config differs from
the corresponding video ops, particularly in the fact get_mbus_config
reports the current mbus configuration and not the set of supported
configuration options, with set_mbus_config always reporting the actual
mbus configuration applied to the remote subdevice.

Adapt the driver to perform the following
- Set the remote subdevice mbus configuration according to the PXA
  platform data preferences.
- If the applied configuration differs from the requested one (i.e. the
  remote subdevice does not allow changing one setting) make sure that
  - The remote end does not claim for DATA_ACTIVE_LOW, which seems not
    supported by the platform
  - The bus mastering roles match

While at there remove a few checks performed on the media bus
configuration at get_format() time as they do not belong there.

Compile-tested only.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/pxa_camera.c | 189 ++++++++--------------------
 1 file changed, 51 insertions(+), 138 deletions(-)

diff --git a/drivers/media/platform/pxa_camera.c b/drivers/media/platform/pxa_camera.c
index 3c5fe737d36f..3a2cd28178da 100644
--- a/drivers/media/platform/pxa_camera.c
+++ b/drivers/media/platform/pxa_camera.c
@@ -605,42 +605,6 @@ static const struct pxa_mbus_pixelfmt *pxa_mbus_get_fmtdesc(
 	return pxa_mbus_find_fmtdesc(code, mbus_fmt, ARRAY_SIZE(mbus_fmt));
 }
 
-static unsigned int pxa_mbus_config_compatible(const struct v4l2_mbus_config *cfg,
-					unsigned int flags)
-{
-	unsigned long common_flags;
-	bool hsync = true, vsync = true, pclk, data, mode;
-	bool mipi_lanes, mipi_clock;
-
-	common_flags = cfg->flags & flags;
-
-	switch (cfg->type) {
-	case V4L2_MBUS_PARALLEL:
-		hsync = common_flags & (V4L2_MBUS_HSYNC_ACTIVE_HIGH |
-					V4L2_MBUS_HSYNC_ACTIVE_LOW);
-		vsync = common_flags & (V4L2_MBUS_VSYNC_ACTIVE_HIGH |
-					V4L2_MBUS_VSYNC_ACTIVE_LOW);
-		/* fall through */
-	case V4L2_MBUS_BT656:
-		pclk = common_flags & (V4L2_MBUS_PCLK_SAMPLE_RISING |
-				       V4L2_MBUS_PCLK_SAMPLE_FALLING);
-		data = common_flags & (V4L2_MBUS_DATA_ACTIVE_HIGH |
-				       V4L2_MBUS_DATA_ACTIVE_LOW);
-		mode = common_flags & (V4L2_MBUS_MASTER | V4L2_MBUS_SLAVE);
-		return (!hsync || !vsync || !pclk || !data || !mode) ?
-			0 : common_flags;
-	case V4L2_MBUS_CSI2_DPHY:
-		mipi_lanes = common_flags & V4L2_MBUS_CSI2_LANES;
-		mipi_clock = common_flags & (V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK |
-					     V4L2_MBUS_CSI2_CONTINUOUS_CLOCK);
-		return (!mipi_lanes || !mipi_clock) ? 0 : common_flags;
-	default:
-		WARN_ON(1);
-		return -EINVAL;
-	}
-	return 0;
-}
-
 /**
  * struct pxa_camera_format_xlate - match between host and sensor formats
  * @code: code of a sensor provided format
@@ -1231,31 +1195,6 @@ static irqreturn_t pxa_camera_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static int test_platform_param(struct pxa_camera_dev *pcdev,
-			       unsigned char buswidth, unsigned long *flags)
-{
-	/*
-	 * Platform specified synchronization and pixel clock polarities are
-	 * only a recommendation and are only used during probing. The PXA270
-	 * quick capture interface supports both.
-	 */
-	*flags = (pcdev->platform_flags & PXA_CAMERA_MASTER ?
-		  V4L2_MBUS_MASTER : V4L2_MBUS_SLAVE) |
-		V4L2_MBUS_HSYNC_ACTIVE_HIGH |
-		V4L2_MBUS_HSYNC_ACTIVE_LOW |
-		V4L2_MBUS_VSYNC_ACTIVE_HIGH |
-		V4L2_MBUS_VSYNC_ACTIVE_LOW |
-		V4L2_MBUS_DATA_ACTIVE_HIGH |
-		V4L2_MBUS_PCLK_SAMPLE_RISING |
-		V4L2_MBUS_PCLK_SAMPLE_FALLING;
-
-	/* If requested data width is supported by the platform, use it */
-	if ((1 << (buswidth - 1)) & pcdev->width_flags)
-		return 0;
-
-	return -EINVAL;
-}
-
 static void pxa_camera_setup_cicr(struct pxa_camera_dev *pcdev,
 				  unsigned long flags, __u32 pixfmt)
 {
@@ -1598,99 +1537,78 @@ static int pxa_camera_init_videobuf2(struct pxa_camera_dev *pcdev)
  */
 static int pxa_camera_set_bus_param(struct pxa_camera_dev *pcdev)
 {
+	unsigned int bus_width = pcdev->current_fmt->host_fmt->bits_per_sample;
 	struct v4l2_mbus_config cfg = {.type = V4L2_MBUS_PARALLEL,};
 	u32 pixfmt = pcdev->current_fmt->host_fmt->fourcc;
-	unsigned long bus_flags, common_flags;
+	int mbus_config;
 	int ret;
 
-	ret = test_platform_param(pcdev,
-				  pcdev->current_fmt->host_fmt->bits_per_sample,
-				  &bus_flags);
-	if (ret < 0)
-		return ret;
-
-	ret = sensor_call(pcdev, video, g_mbus_config, &cfg);
-	if (!ret) {
-		common_flags = pxa_mbus_config_compatible(&cfg,
-							  bus_flags);
-		if (!common_flags) {
-			dev_warn(pcdev_to_dev(pcdev),
-				 "Flags incompatible: camera 0x%x, host 0x%lx\n",
-				 cfg.flags, bus_flags);
-			return -EINVAL;
-		}
-	} else if (ret != -ENOIOCTLCMD) {
-		return ret;
-	} else {
-		common_flags = bus_flags;
+	if (!((1 << (bus_width - 1)) & pcdev->width_flags)) {
+		dev_err(pcdev_to_dev(pcdev), "Unsupported bus width %u",
+			bus_width);
+		return -EINVAL;
 	}
 
 	pcdev->channels = 1;
 
 	/* Make choices, based on platform preferences */
-	if ((common_flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH) &&
-	    (common_flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)) {
-		if (pcdev->platform_flags & PXA_CAMERA_HSP)
-			common_flags &= ~V4L2_MBUS_HSYNC_ACTIVE_HIGH;
-		else
-			common_flags &= ~V4L2_MBUS_HSYNC_ACTIVE_LOW;
-	}
+	mbus_config = 0;
+	if (pcdev->platform_flags & PXA_CAMERA_MASTER)
+		mbus_config |= V4L2_MBUS_MASTER;
+	else
+		mbus_config |= V4L2_MBUS_SLAVE;
 
-	if ((common_flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH) &&
-	    (common_flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)) {
-		if (pcdev->platform_flags & PXA_CAMERA_VSP)
-			common_flags &= ~V4L2_MBUS_VSYNC_ACTIVE_HIGH;
-		else
-			common_flags &= ~V4L2_MBUS_VSYNC_ACTIVE_LOW;
-	}
+	if (pcdev->platform_flags & PXA_CAMERA_HSP)
+		mbus_config |= V4L2_MBUS_HSYNC_ACTIVE_HIGH;
+	else
+		mbus_config |= V4L2_MBUS_HSYNC_ACTIVE_LOW;
 
-	if ((common_flags & V4L2_MBUS_PCLK_SAMPLE_RISING) &&
-	    (common_flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)) {
-		if (pcdev->platform_flags & PXA_CAMERA_PCP)
-			common_flags &= ~V4L2_MBUS_PCLK_SAMPLE_RISING;
-		else
-			common_flags &= ~V4L2_MBUS_PCLK_SAMPLE_FALLING;
-	}
+	if (pcdev->platform_flags & PXA_CAMERA_VSP)
+		mbus_config |= V4L2_MBUS_VSYNC_ACTIVE_HIGH;
+	else
+		mbus_config |= V4L2_MBUS_VSYNC_ACTIVE_LOW;
 
-	cfg.flags = common_flags;
-	ret = sensor_call(pcdev, video, s_mbus_config, &cfg);
+	if (pcdev->platform_flags & PXA_CAMERA_PCP)
+		mbus_config |= V4L2_MBUS_PCLK_SAMPLE_RISING;
+	else
+		mbus_config |= V4L2_MBUS_PCLK_SAMPLE_FALLING;
+	mbus_config |= V4L2_MBUS_DATA_ACTIVE_HIGH;
+
+	cfg.flags = mbus_config;
+	ret = sensor_call(pcdev, pad, set_mbus_config, 0, &cfg);
 	if (ret < 0 && ret != -ENOIOCTLCMD) {
-		dev_dbg(pcdev_to_dev(pcdev),
-			"camera s_mbus_config(0x%lx) returned %d\n",
-			common_flags, ret);
+		dev_err(pcdev_to_dev(pcdev),
+			"Failed to call set_mbus_config: %d\n", ret);
 		return ret;
 	}
 
-	pxa_camera_setup_cicr(pcdev, common_flags, pixfmt);
-
-	return 0;
-}
-
-static int pxa_camera_try_bus_param(struct pxa_camera_dev *pcdev,
-				    unsigned char buswidth)
-{
-	struct v4l2_mbus_config cfg = {.type = V4L2_MBUS_PARALLEL,};
-	unsigned long bus_flags, common_flags;
-	int ret = test_platform_param(pcdev, buswidth, &bus_flags);
-
-	if (ret < 0)
-		return ret;
+	/*
+	 * If the requested media bus configuration has not been fully applied
+	 * make sure it is supported by the platform.
+	 *
+	 * PXA does not support V4L2_MBUS_DATA_ACTIVE_LOW and the bus mastering
+	 * roles should match.
+	 */
+	if (cfg.flags != mbus_config) {
+		unsigned int pxa_mbus_role = mbus_config & (V4L2_MBUS_MASTER |
+							    V4L2_MBUS_SLAVE);
+		if (pxa_mbus_role != (cfg.flags & (V4L2_MBUS_MASTER |
+						   V4L2_MBUS_SLAVE))) {
+			dev_err(pcdev_to_dev(pcdev),
+				"Unsupported mbus configuration: bus mastering\n");
+			return -EINVAL;
+		}
 
-	ret = sensor_call(pcdev, video, g_mbus_config, &cfg);
-	if (!ret) {
-		common_flags = pxa_mbus_config_compatible(&cfg,
-							  bus_flags);
-		if (!common_flags) {
-			dev_warn(pcdev_to_dev(pcdev),
-				 "Flags incompatible: camera 0x%x, host 0x%lx\n",
-				 cfg.flags, bus_flags);
+		if (cfg.flags & V4L2_MBUS_DATA_ACTIVE_LOW) {
+			dev_err(pcdev_to_dev(pcdev),
+				"Unsupported mbus configuration: DATA_ACTIVE_LOW\n");
 			return -EINVAL;
 		}
-	} else if (ret == -ENOIOCTLCMD) {
-		ret = 0;
 	}
 
-	return ret;
+	pxa_camera_setup_cicr(pcdev, cfg.flags, pixfmt);
+
+	return 0;
 }
 
 static const struct pxa_mbus_pixelfmt pxa_camera_formats[] = {
@@ -1738,11 +1656,6 @@ static int pxa_camera_get_formats(struct v4l2_device *v4l2_dev,
 		return 0;
 	}
 
-	/* This also checks support for the requested bits-per-sample */
-	ret = pxa_camera_try_bus_param(pcdev, fmt->bits_per_sample);
-	if (ret < 0)
-		return 0;
-
 	switch (code.code) {
 	case MEDIA_BUS_FMT_UYVY8_2X8:
 		formats++;
-- 
2.27.0

