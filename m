Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9E525263B0
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 16:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245084AbiEMOQI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 10:16:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344793AbiEMOQE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 10:16:04 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 089B260D86
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652451363; x=1683987363;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wI8IUUv6SFFNOHFG0vYn6vVpKPdAuZiMfbNaROKxZRU=;
  b=amQxyyY1d4eMmM2n5pQ1I+hJZRfms/oddb8vKEbt1Zibut99XUN4M5p7
   8DCTCWjC63VzF3lQLJABsntjNprtePcT9s2w3mmhIJ01zKRZPKkrnIYf1
   55HF9CI73aioI2XThlcCtIM6RKk9bzGxXm3fct3rDzqpSS6ND9JXW1Xqp
   ES7VJtWy0aip8FAUvmzhRhx3ItLKq/6E1s4kKWkydaTQghOCdS0+suEiL
   JOLIF70yvOQg6TUlP+uzVH2AlVNWXwlYkyjfxocoUGsBvRSZovuqw+d5m
   5y4MD79Qq6JMYNa8oD7BtxV4jD6s/klSboGbrJ1s4YFbPNKkwxhnJBCtx
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="269984502"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="269984502"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:16:02 -0700
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="659103651"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:15:57 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id D6EE821264;
        Fri, 13 May 2022 17:15:49 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1npW57-0001fr-5k; Fri, 13 May 2022 17:15:49 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
        mirela.rabulea@nxp.com, xavier.roumegue@oss.nxp.com,
        tomi.valkeinen@ideasonboard.com, hugues.fruchet@st.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aford173@gmail.com,
        festevam@gmail.com, Eugen.Hristev@microchip.com,
        jbrunet@baylibre.com, paul.elder@ideasonboard.com,
        eddy.khan@vergesense.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v7 06/28] media: ov5640: Update pixel_rate and link_freq
Date:   Fri, 13 May 2022 17:15:26 +0300
Message-Id: <20220513141548.6344-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220513141548.6344-1-sakari.ailus@linux.intel.com>
References: <20220513141548.6344-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jacopo Mondi <jacopo@jmondi.org>

After having set a new format re-calculate the pixel_rate and link_freq
control values and update them when in MIPI mode.

Take into account the limitation of the link frequency having to be
strictly smaller than 1GHz when computing the desired link_freq, and
adjust the resulting pixel_rate acounting for the clock tree
configuration.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Acked-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Tested-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

[Adjust link_freq calculation]
Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov5640.c | 73 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 71 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index aa1d2e7fb8190..5d7383369a4cc 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -31,6 +31,8 @@
 
 #define OV5640_DEFAULT_SLAVE_ID 0x3c
 
+#define OV5640_LINK_RATE_MAX		490000000U
+
 #define OV5640_REG_SYS_RESET02		0x3002
 #define OV5640_REG_SYS_CLOCK_ENABLE02	0x3006
 #define OV5640_REG_SYS_CTRL0		0x3008
@@ -325,6 +327,7 @@ struct ov5640_dev {
 	const struct ov5640_mode_info *last_mode;
 	enum ov5640_frame_rate current_fr;
 	struct v4l2_fract frame_interval;
+	s64 current_link_freq;
 
 	struct ov5640_ctrls ctrls;
 
@@ -2400,6 +2403,71 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
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
@@ -2439,8 +2507,8 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
 	/* update format even if code is unchanged, resolution might change */
 	sensor->fmt = *mbus_fmt;
 
-	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
-				 ov5640_calc_pixel_rate(sensor));
+	ov5640_update_pixel_rate(sensor);
+
 out:
 	mutex_unlock(&sensor->lock);
 	return ret;
@@ -3198,6 +3266,7 @@ static int ov5640_probe(struct i2c_client *client)
 	sensor->current_mode =
 		&ov5640_mode_data[OV5640_MODE_VGA_640_480];
 	sensor->last_mode = sensor->current_mode;
+	sensor->current_link_freq = OV5640_DEFAULT_LINK_FREQ;
 
 	sensor->ae_target = 52;
 
-- 
2.30.2

