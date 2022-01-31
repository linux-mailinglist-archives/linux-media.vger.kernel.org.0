Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3F614A4962
	for <lists+linux-media@lfdr.de>; Mon, 31 Jan 2022 15:32:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236963AbiAaOcm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Jan 2022 09:32:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236914AbiAaOcl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Jan 2022 09:32:41 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D903C061714
        for <linux-media@vger.kernel.org>; Mon, 31 Jan 2022 06:32:40 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id C4D68FF80E;
        Mon, 31 Jan 2022 14:32:36 +0000 (UTC)
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
Subject: [PATCH 11/21] media: ov5640: Add VBLANK control
Date:   Mon, 31 Jan 2022 15:32:35 +0100
Message-Id: <20220131143245.128089-12-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220131143245.128089-1-jacopo@jmondi.org>
References: <20220131143245.128089-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the VBLANK control which allows to select the duration of the
frame vertical blankings and allows to control the framerate.

The VBLANK control also modifies the exposure time range, which cannot
exceed the maximum frame length.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5640.c | 50 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index b2961e8e07c3..6eeb50724195 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -31,6 +31,10 @@
 
 #define OV5640_LINK_RATE_MAX	490000000U
 
+/* FIXME: not documented. */
+#define OV5640_MIN_VBLANK	24
+#define OV5640_MAX_VTS		1968
+
 #define OV5640_DEFAULT_SLAVE_ID 0x3c
 
 #define OV5640_REG_SYS_RESET02		0x3002
@@ -267,6 +271,7 @@ struct ov5640_ctrls {
 	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *vblank;
 	struct {
 		struct v4l2_ctrl *auto_exp;
 		struct v4l2_ctrl *exposure;
@@ -2531,6 +2536,7 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
 	struct v4l2_mbus_framefmt *fmt = &sensor->fmt;
 	enum ov5640_pixel_rate_id pixel_rate_id = mode->pixel_rate;
 	u32 num_lanes = sensor->ep.bus.mipi_csi2.num_data_lanes;
+	s64 exposure_val, exposure_max;
 	unsigned int hblank;
 	unsigned int i = 0;
 	u32 pixel_rate;
@@ -2586,6 +2592,20 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
 	__v4l2_ctrl_modify_range(sensor->ctrls.hblank,
 				 hblank, hblank, 1, hblank);
 
+	__v4l2_ctrl_modify_range(sensor->ctrls.vblank,
+				 OV5640_MIN_VBLANK,
+				 OV5640_MAX_VTS - mode->crop.height, 1,
+				 mode->vblank_def);
+	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, mode->vblank_def);
+
+	exposure_max = mode->crop.height + mode->vblank_def - OV5640_MIN_VBLANK;
+	exposure_val = clamp((s64)sensor->ctrls.exposure->val,
+			     (s64)sensor->ctrls.exposure->minimum,
+			     (s64)exposure_max);
+	__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
+				 sensor->ctrls.exposure->minimum,
+				 exposure_max, 1, exposure_val);
+
 	return 0;
 }
 
@@ -2958,6 +2978,15 @@ static int ov5640_set_ctrl_vflip(struct ov5640_dev *sensor, int value)
 			      (BIT(2) | BIT(1)) : 0);
 }
 
+static int ov5640_set_ctrl_vblank(struct ov5640_dev *sensor, int value)
+{
+	const struct ov5640_mode_info *mode = sensor->current_mode;
+
+	/* Update the VTOT timing register value. */
+	return ov5640_write_reg16(sensor, OV5640_REG_TIMING_VTS,
+				  mode->crop.height + value);
+}
+
 static int ov5640_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
@@ -2988,10 +3017,22 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
+	const struct ov5640_mode_info *mode = sensor->current_mode;
 	int ret;
 
 	/* v4l2_ctrl_lock() locks our own mutex */
 
+	switch (ctrl->id) {
+	case V4L2_CID_VBLANK:
+		/* Update the exposure range to the newly programmed vblank. */
+		unsigned int max = mode->crop.height + ctrl->val - OV5640_MIN_VBLANK;
+
+		__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
+					 sensor->ctrls.exposure->minimum,
+					 max, sensor->ctrls.exposure->step, max);
+		break;
+	}
+
 	/*
 	 * If the device is not powered up by the host driver do
 	 * not apply any controls to H/W at this time. Instead
@@ -3031,6 +3072,9 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_VFLIP:
 		ret = ov5640_set_ctrl_vflip(sensor, ctrl->val);
 		break;
+	case V4L2_CID_VBLANK:
+		ret = ov5640_set_ctrl_vblank(sensor, ctrl->val);
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -3050,6 +3094,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 	const struct v4l2_ctrl_ops *ops = &ov5640_ctrl_ops;
 	struct ov5640_ctrls *ctrls = &sensor->ctrls;
 	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
+	unsigned int max_vblank;
 	unsigned int hblank;
 	int ret;
 
@@ -3073,6 +3118,11 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 	ctrls->hblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK, hblank,
 					  hblank, 1, hblank);
 
+	max_vblank = OV5640_MAX_VTS - mode->crop.height;
+	ctrls->vblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK,
+					  OV5640_MIN_VBLANK, max_vblank,
+					  1, mode->vblank_def);
+
 	/* Auto/manual white balance */
 	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
 					   V4L2_CID_AUTO_WHITE_BALANCE,
-- 
2.35.0

