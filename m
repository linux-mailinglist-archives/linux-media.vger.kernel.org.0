Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C662D52639A
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 16:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244447AbiEMOQ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 10:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245607AbiEMOQJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 10:16:09 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCEAE1116F1
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652451368; x=1683987368;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rh8nWKQJjqs9OgSMo3yWC19FNQhJwpB5pfTtAiwNs0Y=;
  b=OzsAKGcumb8GXA8kPdOc/W1M4alXynAAK73s9rTdMpBinJIYmkrowKwS
   q96gS/6ZvoKKsOg3fDIIISnm3WDCYsu/urD8sOm702pwqdbxd+t11Hl9G
   Uyyj3xN5J8UzE6u7l99yNf7sfyVtwVa6dzhh/z/PT4loIZ65hy9FCumKW
   ANfkmep2WjL88Wzcl7uqLEzguEf6+biNixVRd//F0+tzlvUC+BSMjUyOW
   SPW/Who+hIigjPwTOB73SejBssV35Lv5d4WhoBr5PCS7XhB2iWkzxjI7C
   JhCFClIhU2WZZ8+WDY65Y2ZOWtMrnVdsRvehFvGXGsLJbP7mIRRFlDRV7
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="252360899"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="252360899"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:16:08 -0700
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="554232206"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:16:03 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id E39A921697;
        Fri, 13 May 2022 17:15:50 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1npW58-0001gW-99; Fri, 13 May 2022 17:15:50 +0300
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
Subject: [PATCH v7 16/28] media: ov5640: Add VBLANK control
Date:   Fri, 13 May 2022 17:15:36 +0300
Message-Id: <20220513141548.6344-17-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220513141548.6344-1-sakari.ailus@linux.intel.com>
References: <20220513141548.6344-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jacopo Mondi <jacopo@jmondi.org>

Add the VBLANK control which allows to select the duration of the
frame vertical blankings and allows to control the framerate.

The VBLANK control also modifies the exposure time range, which cannot
exceed the maximum frame length.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Acked-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Tested-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov5640.c | 52 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index aa93cc980c410..4534821f4af0f 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -36,6 +36,10 @@
 #define OV5640_PIXEL_ARRAY_WIDTH	2592
 #define OV5640_PIXEL_ARRAY_HEIGHT	1944
 
+/* FIXME: not documented. */
+#define OV5640_MIN_VBLANK	24
+#define OV5640_MAX_VTS		3375
+
 #define OV5640_DEFAULT_SLAVE_ID 0x3c
 
 #define OV5640_LINK_RATE_MAX		490000000U
@@ -310,6 +314,7 @@ struct ov5640_ctrls {
 	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *vblank;
 	struct {
 		struct v4l2_ctrl *auto_exp;
 		struct v4l2_ctrl *exposure;
@@ -2701,6 +2706,7 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
 	enum ov5640_pixel_rate_id pixel_rate_id = mode->pixel_rate;
 	struct v4l2_mbus_framefmt *fmt = &sensor->fmt;
 	const struct ov5640_timings *timings;
+	s32 exposure_val, exposure_max;
 	unsigned int hblank;
 	unsigned int i = 0;
 	u32 pixel_rate;
@@ -2764,6 +2770,19 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
 	__v4l2_ctrl_modify_range(sensor->ctrls.hblank,
 				 hblank, hblank, 1, hblank);
 
+	__v4l2_ctrl_modify_range(sensor->ctrls.vblank, OV5640_MIN_VBLANK,
+				 OV5640_MAX_VTS - mode->height, 1,
+				 timings->vblank_def);
+	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, timings->vblank_def);
+
+	exposure_max = timings->crop.height + timings->vblank_def - 4;
+	exposure_val = clamp_t(s32, sensor->ctrls.exposure->val,
+			       sensor->ctrls.exposure->minimum,
+			       exposure_max);
+	__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
+				 sensor->ctrls.exposure->minimum,
+				 exposure_max, 1, exposure_val);
+
 	return 0;
 }
 
@@ -3136,6 +3155,15 @@ static int ov5640_set_ctrl_vflip(struct ov5640_dev *sensor, int value)
 			      (BIT(2) | BIT(1)) : 0);
 }
 
+static int ov5640_set_ctrl_vblank(struct ov5640_dev *sensor, int value)
+{
+	const struct ov5640_mode_info *mode = sensor->current_mode;
+
+	/* Update the VTOT timing register value. */
+	return ov5640_write_reg16(sensor, OV5640_REG_TIMING_VTS,
+				  mode->height + value);
+}
+
 static int ov5640_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
@@ -3166,10 +3194,25 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
+	const struct ov5640_mode_info *mode = sensor->current_mode;
+	const struct ov5640_timings *timings;
+	unsigned int exp_max;
 	int ret;
 
 	/* v4l2_ctrl_lock() locks our own mutex */
 
+	switch (ctrl->id) {
+	case V4L2_CID_VBLANK:
+		/* Update the exposure range to the newly programmed vblank. */
+		timings = ov5640_timings(sensor, mode);
+		exp_max = mode->height + ctrl->val - 4;
+		__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
+					 sensor->ctrls.exposure->minimum,
+					 exp_max, sensor->ctrls.exposure->step,
+					 timings->vblank_def);
+		break;
+	}
+
 	/*
 	 * If the device is not powered up by the host driver do
 	 * not apply any controls to H/W at this time. Instead
@@ -3209,6 +3252,9 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_VFLIP:
 		ret = ov5640_set_ctrl_vflip(sensor, ctrl->val);
 		break;
+	case V4L2_CID_VBLANK:
+		ret = ov5640_set_ctrl_vblank(sensor, ctrl->val);
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -3229,6 +3275,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 	struct ov5640_ctrls *ctrls = &sensor->ctrls;
 	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
 	const struct ov5640_timings *timings;
+	unsigned int max_vblank;
 	unsigned int hblank;
 	int ret;
 
@@ -3254,6 +3301,11 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 	ctrls->hblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK, hblank,
 					  hblank, 1, hblank);
 
+	max_vblank = OV5640_MAX_VTS - mode->height;
+	ctrls->vblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK,
+					  OV5640_MIN_VBLANK, max_vblank,
+					  1, timings->vblank_def);
+
 	/* Auto/manual white balance */
 	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
 					   V4L2_CID_AUTO_WHITE_BALANCE,
-- 
2.30.2

