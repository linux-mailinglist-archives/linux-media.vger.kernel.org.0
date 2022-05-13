Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3851052638E
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 16:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241744AbiEMOOh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 10:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239918AbiEMOOb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 10:14:31 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59470DF24
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:14:29 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 946EB100013;
        Fri, 13 May 2022 14:14:27 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     sakari.ailus@iki.fi, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v7 06/28] media: ov5640: Update pixel_rate and link_freq
Date:   Fri, 13 May 2022 16:13:54 +0200
Message-Id: <20220513141416.120552-7-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513141416.120552-1-jacopo@jmondi.org>
References: <20220513141416.120552-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        RCVD_IN_BL_SPAMCOP_NET,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

[Adjust link_freq calculation]
Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 drivers/media/i2c/ov5640.c | 85 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 83 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index aa1d2e7fb819..3aac84aea5ea 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -31,6 +31,8 @@
 
 #define OV5640_DEFAULT_SLAVE_ID 0x3c
 
+#define OV5640_LINK_RATE_MAX		490000000U
+
 #define OV5640_REG_SYS_RESET02		0x3002
 #define OV5640_REG_SYS_CLOCK_ENABLE02	0x3006
 #define OV5640_REG_SYS_CTRL0		0x3008
@@ -220,6 +222,18 @@ static const struct ov5640_pixfmt {
 	},
 };
 
+static u32 ov5640_code_to_bpp(u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(ov5640_formats); ++i) {
+		if (ov5640_formats[i].code == code)
+			return ov5640_formats[i].bpp;
+	}
+
+	return 0;
+}
+
 /*
  * FIXME: remove this when a subdev API becomes available
  * to set the MIPI CSI-2 virtual channel.
@@ -325,6 +339,7 @@ struct ov5640_dev {
 	const struct ov5640_mode_info *last_mode;
 	enum ov5640_frame_rate current_fr;
 	struct v4l2_fract frame_interval;
+	s64 current_link_freq;
 
 	struct ov5640_ctrls ctrls;
 
@@ -2400,6 +2415,71 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
+{
+	const struct ov5640_mode_info *mode = sensor->current_mode;
+	enum ov5640_pixel_rate_id pixel_rate_id = mode->pixel_rate;
+	struct v4l2_mbus_framefmt *fmt = &sensor->fmt;
+	unsigned int i = 0;
+	u32 pixel_rate;
+	s64 link_freq;
+	u32 num_lanes;
+	u32 bpp;
+
+	/*
+	 * Update the pixel rate control value.
+	 *
+	 * For DVP mode, maintain the pixel rate calculation using fixed FPS.
+	 */
+	if (!ov5640_is_csi2(sensor)) {
+		__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
+					 ov5640_calc_pixel_rate(sensor));
+
+		return 0;
+	}
+
+	/*
+	 * The MIPI CSI-2 link frequency should comply with the CSI-2
+	 * specification and be lower than 1GHz.
+	 *
+	 * Start from the suggested pixel_rate for the current mode and
+	 * progressively slow it down if it exceeds 1GHz.
+	 */
+	num_lanes = sensor->ep.bus.mipi_csi2.num_data_lanes;
+	bpp = ov5640_code_to_bpp(fmt->code);
+	do {
+		pixel_rate = ov5640_pixel_rates[pixel_rate_id];
+		link_freq = pixel_rate * bpp / (2 * num_lanes);
+	} while (link_freq >= 1000000000U &&
+		 ++pixel_rate_id < OV5640_NUM_PIXEL_RATES);
+
+	sensor->current_link_freq = link_freq;
+
+	/*
+	 * Higher link rates require the clock tree to be programmed with
+	 * 'mipi_div' = 1; this has the effect of halving the actual output
+	 * pixel rate in the MIPI domain.
+	 *
+	 * Adjust the pixel rate and link frequency control value to report it
+	 * correctly to userspace.
+	 */
+	if (link_freq > OV5640_LINK_RATE_MAX) {
+		pixel_rate /= 2;
+		link_freq /= 2;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(ov5640_csi2_link_freqs); ++i) {
+		if (ov5640_csi2_link_freqs[i] == link_freq)
+			break;
+	}
+	WARN_ON(i == ARRAY_SIZE(ov5640_csi2_link_freqs));
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
@@ -2439,8 +2519,8 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
 	/* update format even if code is unchanged, resolution might change */
 	sensor->fmt = *mbus_fmt;
 
-	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
-				 ov5640_calc_pixel_rate(sensor));
+	ov5640_update_pixel_rate(sensor);
+
 out:
 	mutex_unlock(&sensor->lock);
 	return ret;
@@ -3198,6 +3278,7 @@ static int ov5640_probe(struct i2c_client *client)
 	sensor->current_mode =
 		&ov5640_mode_data[OV5640_MODE_VGA_640_480];
 	sensor->last_mode = sensor->current_mode;
+	sensor->current_link_freq = OV5640_DEFAULT_LINK_FREQ;
 
 	sensor->ae_target = 52;
 
-- 
2.35.1

