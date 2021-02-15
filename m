Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5BF31B4D7
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:40:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbhBOEkR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:40:17 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46098 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbhBOEkN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:40:13 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E58B12CDB;
        Mon, 15 Feb 2021 05:29:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363346;
        bh=/pR5nF1xvomwbqomWg76ZzkZ7G5rurCkow1alj4VwWM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ChJxsjdjcE6Bb0loe1q/V0FxuGnUp7+P093UCr/v8llQtDC7AHt9xpib1A0fNnlQp
         K+p4HdVTACgUU+QjgJR9zdJsfptWdxuYoWqwGVCRUXSesOyogWciSXwQsEyDGOb+bq
         ZxsAK2gBjssWg1gFdQLfefagViHbMPZPDOU266vE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 70/77] media: imx: imx7_mipi_csis: Calculate Ths_settle from source lane rate
Date:   Mon, 15 Feb 2021 06:27:34 +0200
Message-Id: <20210215042741.28850-71-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
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
Changes since v1:

- Unlock mutex in mipi_csis_link_setup() error path
- Use v4l2_get_link_freq()
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 43 ++++++++++++++++++++--
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 333ab3966b5b..4a51d2440b64 100644
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
 
-- 
Regards,

Laurent Pinchart

