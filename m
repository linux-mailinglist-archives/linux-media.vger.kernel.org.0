Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3730D1FB3B7
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 16:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729593AbgFPOJ7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 10:09:59 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:56759 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729586AbgFPOJ6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 10:09:58 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 8025FE000B;
        Tue, 16 Jun 2020 14:09:54 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 09/10] media: rcar-csi2: Negotiate data lanes number
Date:   Tue, 16 Jun 2020 16:12:44 +0200
Message-Id: <20200616141244.49407-10-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200616141244.49407-1-jacopo+renesas@jmondi.org>
References: <20200616141244.49407-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the newly introduced get_mbus_config() subdevice pad operation to
retrieve the remote subdevice MIPI CSI-2 bus configuration and configure
the number of active data lanes accordingly.

In order to be able to call the remote subdevice operation cache the
index of the remote pad connected to the single CSI-2 input port.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 74 +++++++++++++++++++--
 1 file changed, 67 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index 151e6a90c5fb..b3aee0860443 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -363,6 +363,7 @@ struct rcar_csi2 {
 	struct v4l2_async_notifier notifier;
 	struct v4l2_async_subdev asd;
 	struct v4l2_subdev *remote;
+	unsigned int remote_pad;
 
 	struct v4l2_mbus_framefmt mf;
 
@@ -408,13 +409,14 @@ static void rcsi2_exit_standby(struct rcar_csi2 *priv)
 	reset_control_deassert(priv->rstc);
 }
 
-static int rcsi2_wait_phy_start(struct rcar_csi2 *priv)
+static int rcsi2_wait_phy_start(struct rcar_csi2 *priv,
+				unsigned int active_lanes)
 {
 	unsigned int timeout;
 
 	/* Wait for the clock and data lanes to enter LP-11 state. */
 	for (timeout = 0; timeout <= 20; timeout++) {
-		const u32 lane_mask = (1 << priv->lanes) - 1;
+		const u32 lane_mask = (1 << active_lanes) - 1;
 
 		if ((rcsi2_read(priv, PHCLM_REG) & PHCLM_STOPSTATECKL)  &&
 		    (rcsi2_read(priv, PHDLM_REG) & lane_mask) == lane_mask)
@@ -446,7 +448,8 @@ static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
 	return 0;
 }
 
-static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp)
+static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
+			   unsigned int active_lanes)
 {
 	struct v4l2_subdev *source;
 	struct v4l2_ctrl *ctrl;
@@ -471,15 +474,63 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp)
 	 * bps = link_freq * 2
 	 */
 	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * bpp;
-	do_div(mbps, priv->lanes * 1000000);
+	do_div(mbps, active_lanes * 1000000);
 
 	return mbps;
 }
 
+static int rcsi2_config_active_lanes(struct rcar_csi2 *priv,
+				     unsigned int *active_lanes)
+{
+	struct v4l2_mbus_config mbus_config = { 0 };
+	unsigned int num_lanes = (-1U);
+	int ret;
+
+	*active_lanes = priv->lanes;
+	ret = v4l2_subdev_call(priv->remote, pad, get_mbus_config,
+			       priv->remote_pad, &mbus_config);
+	if (ret == -ENOIOCTLCMD) {
+		dev_dbg(priv->dev, "No remote mbus configuration available\n");
+		return 0;
+	}
+
+	if (ret) {
+		dev_err(priv->dev, "Failed to get remote mbus configuration\n");
+		return ret;
+	}
+
+	if (mbus_config.type != V4L2_MBUS_CSI2_DPHY) {
+		dev_err(priv->dev, "Unsupported media bus type %u\n",
+			mbus_config.type);
+		return -EINVAL;
+	}
+
+	if (mbus_config.flags & V4L2_MBUS_CSI2_1_LANE)
+		num_lanes = 1;
+	else if (mbus_config.flags & V4L2_MBUS_CSI2_2_LANE)
+		num_lanes = 2;
+	else if (mbus_config.flags & V4L2_MBUS_CSI2_3_LANE)
+		num_lanes = 3;
+	else if (mbus_config.flags & V4L2_MBUS_CSI2_4_LANE)
+		num_lanes = 4;
+
+	if (num_lanes > priv->lanes) {
+		dev_err(priv->dev,
+			"Unsupported mbus config: too many data lanes %u\n",
+			num_lanes);
+		return -EINVAL;
+	}
+
+	*active_lanes = num_lanes;
+
+	return 0;
+}
+
 static int rcsi2_start_receiver(struct rcar_csi2 *priv)
 {
 	const struct rcar_csi2_format *format;
 	u32 phycnt, vcdt = 0, vcdt2 = 0, fld = 0;
+	unsigned int active_lanes;
 	unsigned int i;
 	int mbps, ret;
 
@@ -521,10 +572,18 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
 			fld |= FLD_FLD_NUM(1);
 	}
 
+	/*
+	 * Get the number of active data lanes inspecting the remote mbus
+	 * configuration.
+	 */
+	ret = rcsi2_config_active_lanes(priv, &active_lanes);
+	if (ret)
+		return ret;
+
 	phycnt = PHYCNT_ENABLECLK;
-	phycnt |= (1 << priv->lanes) - 1;
+	phycnt |= (1 << active_lanes) - 1;
 
-	mbps = rcsi2_calc_mbps(priv, format->bpp);
+	mbps = rcsi2_calc_mbps(priv, format->bpp, active_lanes);
 	if (mbps < 0)
 		return mbps;
 
@@ -571,7 +630,7 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
 	rcsi2_write(priv, PHYCNT_REG, phycnt | PHYCNT_SHUTDOWNZ);
 	rcsi2_write(priv, PHYCNT_REG, phycnt | PHYCNT_SHUTDOWNZ | PHYCNT_RSTZ);
 
-	ret = rcsi2_wait_phy_start(priv);
+	ret = rcsi2_wait_phy_start(priv, active_lanes);
 	if (ret)
 		return ret;
 
@@ -748,6 +807,7 @@ static int rcsi2_notify_bound(struct v4l2_async_notifier *notifier,
 	}
 
 	priv->remote = subdev;
+	priv->remote_pad = pad;
 
 	dev_dbg(priv->dev, "Bound %s pad: %d\n", subdev->name, pad);
 
-- 
2.27.0

