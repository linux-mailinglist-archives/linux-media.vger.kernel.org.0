Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9012A4C107B
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 11:41:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239665AbiBWKlm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 05:41:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239653AbiBWKlk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 05:41:40 -0500
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4FB939BA3
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 02:41:11 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id A0471240011;
        Wed, 23 Feb 2022 10:41:06 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH v3 06/27] media: ov5640: Update pixel_rate and link_freq
Date:   Wed, 23 Feb 2022 11:40:13 +0100
Message-Id: <20220223104034.91550-7-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220223104034.91550-1-jacopo@jmondi.org>
References: <20220223104034.91550-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
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
---
 drivers/media/i2c/ov5640.c | 66 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 64 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index b1a282f453e3..17ad815f7bdf 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -31,6 +31,8 @@
 
 #define OV5640_DEFAULT_SLAVE_ID 0x3c
 
+#define OV5640_LINK_RATE_MAX		490000000U
+
 #define OV5640_REG_SYS_RESET02		0x3002
 #define OV5640_REG_SYS_CLOCK_ENABLE02	0x3006
 #define OV5640_REG_SYS_CTRL0		0x3008
@@ -2412,6 +2414,66 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
+{
+	const struct ov5640_mode_info *mode = sensor->current_mode;
+	struct v4l2_mbus_framefmt *fmt = &sensor->fmt;
+	enum ov5640_pixel_rate_id pixel_rate_id = mode->pixel_rate;
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
@@ -2451,8 +2513,8 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
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

