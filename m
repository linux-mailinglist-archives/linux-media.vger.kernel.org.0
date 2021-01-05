Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB7B2EAEE1
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:41:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728302AbhAEPj7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:39:59 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38168 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726020AbhAEPj6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:39:58 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E6621C0F;
        Tue,  5 Jan 2021 16:30:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860622;
        bh=i/K4hxRXhBchzvr+PHocUGVxHncxjzy73rc21n+Ym90=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SuqG5TLxabyn8HJbCm49RaI1gwA+EaRYCB0/JsxSTbfSztAOFanXXjG0EUVQGgOH2
         ajjr8Y5ogSPrLzs6u08B7zPsZnE+gRFiiPhVOZIvX1wXQv8EZ9Ynb0tfjzpqsIYCOH
         r5JPrSfS9JAdUWRYcT+6fhHug1+P0HtDKjsl3LrU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 68/75] media: imx: imx7_mipi_csis: Calculate Ths_settle from source pixel rate
Date:   Tue,  5 Jan 2021 17:28:45 +0200
Message-Id: <20210105152852.5733-69-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Ths_settle timing parameter depends solely on the pixel rate of the
source. Calculate it at runtime instead of requiring it to be specified
in the device tree.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 65 ++++++++++++++++++----
 1 file changed, 53 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 3c68ee8b2a59..c83450ac37fa 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -24,6 +24,7 @@
 #include <linux/reset.h>
 #include <linux/spinlock.h>
 
+#include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-mc.h>
@@ -233,7 +234,11 @@ struct csi_state {
 	struct media_pad pads[CSIS_PADS_NUM];
 	struct v4l2_subdev mipi_sd;
 	struct v4l2_async_notifier notifier;
-	struct v4l2_subdev *src_sd;
+
+	struct {
+		struct v4l2_subdev *sd;
+		struct v4l2_ctrl *pixel_rate;
+	} src;
 
 	u8 index;
 	struct platform_device *pdev;
@@ -482,6 +487,31 @@ static void __mipi_csis_set_format(struct csi_state *state)
 	mipi_csis_write(state, MIPI_CSIS_ISPRESOL_CH0, val);
 }
 
+static int mipi_csis_calculate_params(struct csi_state *state)
+{
+	u64 pixel_rate;
+	u32 lane_rate;
+
+	/* Calculate the line rate from the pixel rate. */
+	pixel_rate = v4l2_ctrl_g_ctrl_int64(state->src.pixel_rate);
+	lane_rate = div_u64(pixel_rate, state->bus.num_data_lanes)
+		  * state->csis_fmt->width;
+	if (lane_rate < 80000000 || lane_rate > 1500000000) {
+		dev_dbg(state->dev, "Out-of-bound lane rate %u\n", lane_rate);
+		return -EINVAL;
+	}
+
+	/*
+	 * The HSSETTLE counter value is document in a table, but can also
+	 * easily be calculated.
+	 */
+	state->hs_settle = (lane_rate - 5000000) / 45000000;
+	dev_dbg(state->dev, "pixel rate %llu, lane rate %u, Ths_settle %u\n",
+		pixel_rate, lane_rate, state->hs_settle);
+
+	return 0;
+}
+
 static void mipi_csis_set_params(struct csi_state *state)
 {
 	int lanes = state->bus.num_data_lanes;
@@ -608,16 +638,20 @@ static void mipi_csis_log_counters(struct csi_state *state, bool non_errors)
 static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
 {
 	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
-	int ret = 0;
+	int ret;
 
 	if (enable) {
+		ret = mipi_csis_calculate_params(state);
+		if (ret < 0)
+			return ret;
+
 		mipi_csis_clear_counters(state);
 		ret = pm_runtime_get_sync(&state->pdev->dev);
 		if (ret < 0) {
 			pm_runtime_put_noidle(&state->pdev->dev);
 			return ret;
 		}
-		ret = v4l2_subdev_call(state->src_sd, core, s_power, 1);
+		ret = v4l2_subdev_call(state->src.sd, core, s_power, 1);
 		if (ret < 0 && ret != -ENOIOCTLCMD)
 			return ret;
 	}
@@ -630,7 +664,7 @@ static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
 		}
 
 		mipi_csis_start_stream(state);
-		ret = v4l2_subdev_call(state->src_sd, video, s_stream, 1);
+		ret = v4l2_subdev_call(state->src.sd, video, s_stream, 1);
 		if (ret < 0)
 			goto unlock;
 
@@ -638,8 +672,8 @@ static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
 
 		state->flags |= ST_STREAMING;
 	} else {
-		v4l2_subdev_call(state->src_sd, video, s_stream, 0);
-		ret = v4l2_subdev_call(state->src_sd, core, s_power, 0);
+		v4l2_subdev_call(state->src.sd, video, s_stream, 0);
+		ret = v4l2_subdev_call(state->src.sd, core, s_power, 0);
 		if (ret == -ENOIOCTLCMD)
 			ret = 0;
 		mipi_csis_stop_stream(state);
@@ -677,14 +711,24 @@ static int mipi_csis_link_setup(struct media_entity *entity,
 	mutex_lock(&state->lock);
 
 	if (flags & MEDIA_LNK_FL_ENABLED) {
-		if (state->src_sd) {
+		if (state->src.sd) {
 			ret = -EBUSY;
 			goto out;
 		}
 
-		state->src_sd = remote_sd;
+		state->src.pixel_rate = v4l2_ctrl_find(remote_sd->ctrl_handler,
+						       V4L2_CID_PIXEL_RATE);
+		if (!state->src.pixel_rate) {
+			dev_err(state->dev,
+				"source %s has no pixel rate control\n",
+				remote_sd->name);
+			return -EINVAL;
+		}
+
+		state->src.sd = remote_sd;
 	} else {
-		state->src_sd = NULL;
+		state->src.pixel_rate = NULL;
+		state->src.sd = NULL;
 	}
 
 out:
@@ -943,9 +987,6 @@ static int mipi_csis_parse_dt(struct platform_device *pdev,
 	if (IS_ERR(state->mrst))
 		return PTR_ERR(state->mrst);
 
-	/* Get MIPI CSI-2 bus configuration from the endpoint node. */
-	of_property_read_u32(node, "fsl,csis-hs-settle", &state->hs_settle);
-
 	return 0;
 }
 
-- 
Regards,

Laurent Pinchart

