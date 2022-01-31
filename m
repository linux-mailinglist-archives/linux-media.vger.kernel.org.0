Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D04A4A495C
	for <lists+linux-media@lfdr.de>; Mon, 31 Jan 2022 15:32:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236910AbiAaOcV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Jan 2022 09:32:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236851AbiAaOcV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Jan 2022 09:32:21 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2B42C061714
        for <linux-media@vger.kernel.org>; Mon, 31 Jan 2022 06:32:20 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 8C781FF80B;
        Mon, 31 Jan 2022 14:32:16 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 05/21] media: ov5640: Update pixel_rate and link_freq
Date:   Mon, 31 Jan 2022 15:32:29 +0100
Message-Id: <20220131143245.128089-6-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220131143245.128089-1-jacopo@jmondi.org>
References: <20220131143245.128089-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After having set a new format re-calculate the pixel_rate and link_freq
control values and update them when in MIPI mode.

Take into account the limitation of the link frequency having to be
strictly smaller than 1GHz when computing the desired link_freq, and
adjust the resulting pixel_rate acounting for the clock tree
configuration.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5640.c | 63 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 61 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 8322b99eb2b7..457f76030163 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -2375,6 +2375,65 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
+{
+	const struct ov5640_mode_info *mode = sensor->current_mode;
+	struct v4l2_mbus_framefmt *fmt = &sensor->fmt;
+	enum ov5640_pixel_rate_id pixel_rate_id = mode->pixel_rate;
+	u32 num_lanes = sensor->ep.bus.mipi_csi2.num_data_lanes;
+	unsigned int i = 0;
+	u32 pixel_rate;
+	s64 link_freq;
+	u32 bpp;
+
+	/*
+	 * Update the pixel rate control value.
+	 *
+	 * For DVP mode, maintain the pixel rate calculation using fixed FPS.
+	 */
+	if (!ov5640_is_mipi(sensor)) {
+		__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
+					 ov5640_calc_pixel_rate(sensor));
+
+		return 0;
+	}
+
+	/*
+	 * The MIPI CSI-2 link frequency should comply with the CSI-2
+	 * specifications and be lower than 1GHz.
+	 *
+	 * Start from the suggested pixel_rate for the current mode and
+	 * progressively slow it down if it exceeds 1GHz.
+	 */
+	bpp = ov5640_code_to_bpp(fmt->code);
+	do {
+		pixel_rate = ov5640_pixel_rates[pixel_rate_id];
+		link_freq = pixel_rate * bpp / (2 * num_lanes);
+	} while (link_freq >= 1000000000U &&
+		 ++pixel_rate_id < OV5640_NUM_PIXEL_RATES);
+
+	/*
+	 * Higher link rates require the clock tree to be programmed with
+	 * 'mipi_div' = 1; this has the effect of halving the actual output
+	 * pixel rate in the MIPI domain.
+	 *
+	 * Adjust the pixel rate control value to report it correctly to
+	 * userspace.
+	 */
+	if (link_freq > OV5640_LINK_RATE_MAX)
+		pixel_rate /= 2;
+
+	for (i = 0; i < ARRAY_SIZE(ov5640_csi2_link_freqs); ++i) {
+		if (ov5640_csi2_link_freqs[i] == link_freq)
+			break;
+	}
+
+	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate, pixel_rate);
+	__v4l2_ctrl_s_ctrl(sensor->ctrls.link_freq, i);
+
+	return 0;
+}
+
 static int ov5640_set_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
@@ -2414,8 +2473,8 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
 	/* update format even if code is unchanged, resolution might change */
 	sensor->fmt = *mbus_fmt;
 
-	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
-				 ov5640_calc_pixel_rate(sensor));
+	ov5640_update_pixel_rate(sensor);
+
 out:
 	mutex_unlock(&sensor->lock);
 	return ret;
-- 
2.35.0

