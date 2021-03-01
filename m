Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A76583284F9
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 17:49:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235130AbhCAQqs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 11:46:48 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:44422 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233322AbhCAQld (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 11:41:33 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7540941;
        Mon,  1 Mar 2021 17:40:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1614616850;
        bh=kMfBkHDN7RFEJlDQXSSKlUfAQW+ErvHAIP4DY0y8wlc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=R2HsYgxy8wTX4KMB6CpcqZbj6YhFkSa1kl3Q6B2Q3NQ4e0fzn7ihhs3FqoB852gQz
         i0Lf1Uan46CbMqxPN+oNVqM2xpfES/JwaropHoMGGugRr9Wk0kAr/jBEcafJXMxHqQ
         vykFwrSNfjKmlXRe/LF/4yJZW61MjLBFnQ1+6Wfo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2.1 70/77] media: imx: imx7_mipi_csis: Calculate Ths_settle from source lane rate
Date:   Mon,  1 Mar 2021 18:40:19 +0200
Message-Id: <20210301164019.13031-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-71-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-71-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Ths_settle timing parameter depends solely on the lane data rate of
the source. Calculate it at runtime instead of requiring it to be
specified in the device tree.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v2:

- Don't print hs_settle at probe time
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 48 ++++++++++++++++++----
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 333ab3966b5b..e1728240b494 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -24,6 +24,7 @@
 #include <linux/reset.h>
 #include <linux/spinlock.h>
 
+#include <media/v4l2-common.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-mc.h>
@@ -482,6 +483,39 @@ static void __mipi_csis_set_format(struct csi_state *state)
 	mipi_csis_write(state, MIPI_CSIS_ISPRESOL_CH0, val);
 }
 
+static int mipi_csis_calculate_params(struct csi_state *state)
+{
+	s64 link_freq;
+	u32 lane_rate;
+
+	/* Calculate the line rate from the pixel rate. */
+	link_freq = v4l2_get_link_freq(state->src_sd->ctrl_handler,
+				       state->csis_fmt->width,
+				       state->bus.num_data_lanes * 2);
+	if (link_freq < 0) {
+		dev_err(state->dev, "Unable to obtain link frequency: %d\n",
+			(int)link_freq);
+		return link_freq;
+	}
+
+	lane_rate = link_freq * 2;
+
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
+	dev_dbg(state->dev, "lane rate %u, Ths_settle %u\n",
+		lane_rate, state->hs_settle);
+
+	return 0;
+}
+
 static void mipi_csis_set_params(struct csi_state *state)
 {
 	int lanes = state->bus.num_data_lanes;
@@ -608,9 +642,13 @@ static void mipi_csis_log_counters(struct csi_state *state, bool non_errors)
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
@@ -943,9 +981,6 @@ static int mipi_csis_parse_dt(struct platform_device *pdev,
 	if (IS_ERR(state->mrst))
 		return PTR_ERR(state->mrst);
 
-	/* Get MIPI CSI-2 bus configuration from the endpoint node. */
-	of_property_read_u32(node, "fsl,csis-hs-settle", &state->hs_settle);
-
 	return 0;
 }
 
@@ -1143,9 +1178,8 @@ static int mipi_csis_probe(struct platform_device *pdev)
 			goto unregister_all;
 	}
 
-	dev_info(&pdev->dev, "lanes: %d, hs_settle: %d, freq: %u\n",
-		 state->bus.num_data_lanes, state->hs_settle,
-		 state->clk_frequency);
+	dev_info(&pdev->dev, "lanes: %d, freq: %u\n",
+		 state->bus.num_data_lanes, state->clk_frequency);
 
 	return 0;
 
-- 
Regards,

Laurent Pinchart

