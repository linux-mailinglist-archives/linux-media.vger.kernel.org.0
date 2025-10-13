Return-Path: <linux-media+bounces-44267-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EE4BD2AF3
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 13:02:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 165BA189BA74
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 11:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEC96305969;
	Mon, 13 Oct 2025 11:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BVaZymAn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F6D2FE04B;
	Mon, 13 Oct 2025 11:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760353306; cv=none; b=dE1iTUSVAyU4Th+2f2FHds+f6Hc4l8EG6Bg6HCgPuAab8yfLL2f6PyNpksKzRoMcl91ZZVjAehsix5mLPgyIfTf+IX6dI7YetTMuWOGmRjehW7vLbIIFIKAOC9r8YM7R53wdb3thoq+E91S1CCTo4ewo8XGQi0Khp+TByJ7twOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760353306; c=relaxed/simple;
	bh=uAibvNMvVnfTLnJ52wJT1Y/7MsQaryuDWSeF/uvqKDk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DgD7YQemonwu5COdw5Ni7vlA1/e8FxYtc0pna3tZ2IXKsz1wjOJOcltpYIg/R3ZAhuzuPLbsKGBr/TSuErxtUE+eC0JB7qPffgWwon2+n2Hult1/Kog9n/LuXjLG9Nfy66HGXj1fKBU0ivRnQjh3EQZE+9WvILoPow2zpi38hdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BVaZymAn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6C0C4CEF8;
	Mon, 13 Oct 2025 11:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760353305;
	bh=uAibvNMvVnfTLnJ52wJT1Y/7MsQaryuDWSeF/uvqKDk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BVaZymAn8M170COO5FxCHAzbGasw4dvw2PBqv5JhOpdOcMHr8bxMKHv7+Uid2Rdgw
	 uy7r+jbO5Bje1o4ESHKWtULgxrUoh7qTP4ebuO16+vG35tLV/YQExxeF80m2xWaA+m
	 DjuLqOiW4zaG3Rv1PAtLIKpLcMqK3nmPq02szeUyJsbKjf85IP5Q9qiQiQy9gHPW0C
	 CgWWM1gOx++123rUHfN6Pm0g0gVWVxYRNSPLC2SwENFDD84sI0qk+/Jl/1GWx/n1mm
	 5LcJNDW4GhyQLrTjK2aL56s1Qmsn+k+NNpJvCi7u0clBPMcZtH108vFMuZ6u4rVGPM
	 4s/x8tWItk3tw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 13 Oct 2025 13:01:35 +0200
Subject: [PATCH v4 3/4] media: tc358743: Fix the RGB MBUS format
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-csi-bgr-rgb-v4-3-55eab2caa69f@kernel.org>
References: <20251013-csi-bgr-rgb-v4-0-55eab2caa69f@kernel.org>
In-Reply-To: <20251013-csi-bgr-rgb-v4-0-55eab2caa69f@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mats Randgaard <matrandg@cisco.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hans.verkuil@cisco.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2

The tc358743 is an HDMI to MIPI-CSI2 bridge. It can output all three
HDMI 1.4 video formats: RGB 4:4:4, YCbCr 4:2:2, and YCbCr 4:4:4.

RGB 4:4:4 is converted to the MIPI-CSI2 RGB888 video format, and listed
in the driver as MEDIA_BUS_FMT_RGB888_1X24.

Most CSI2 receiver drivers then map MEDIA_BUS_FMT_RGB888_1X24 to
V4L2_PIX_FMT_RGB24.

However, V4L2_PIX_FMT_RGB24 is defined as having its color components in
the R, G and B order, from left to right. MIPI-CSI2 however defines the
RGB888 format with blue first.

This essentially means that the R and B will be swapped compared to what
V4L2_PIX_FMT_RGB24 defines.

The proper MBUS format would be BGR888, so let's use that.

Fixes: d32d98642de6 ("[media] Driver for Toshiba TC358743 HDMI to CSI-2 bridge")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/media/i2c/tc358743.c | 53 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 44 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index a0ca19359c43145988535d7816012ef607555b87..feb089d8de724dd25801a0fb621c768542e05254 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -754,10 +754,11 @@ static void tc358743_set_ref_clk(struct v4l2_subdev *sd)
 }
 
 static void tc358743_set_csi_color_space(struct v4l2_subdev *sd)
 {
 	struct tc358743_state *state = to_state(sd);
+	struct device *dev = &state->i2c_client->dev;
 
 	switch (state->mbus_fmt_code) {
 	case MEDIA_BUS_FMT_UYVY8_1X16:
 		v4l2_dbg(2, debug, sd, "%s: YCbCr 422 16-bit\n", __func__);
 		i2c_wr8_and_or(sd, VOUT_SET2,
@@ -769,11 +770,21 @@ static void tc358743_set_csi_color_space(struct v4l2_subdev *sd)
 		i2c_wr16_and_or(sd, CONFCTL, ~MASK_YCBCRFMT,
 				MASK_YCBCRFMT_422_8_BIT);
 		mutex_unlock(&state->confctl_mutex);
 		break;
 	case MEDIA_BUS_FMT_RGB888_1X24:
-		v4l2_dbg(2, debug, sd, "%s: RGB 888 24-bit\n", __func__);
+		/*
+		 * The driver was initially introduced with RGB888
+		 * support, but CSI really means BGR.
+		 *
+		 * Since we might have applications that would have
+		 * hard-coded the RGB888, let's support both.
+		 */
+		dev_warn_once(dev, "RGB format isn't actually supported by the hardware. The application should be fixed to use BGR.");
+		fallthrough;
+	case MEDIA_BUS_FMT_BGR888_1X24:
+		v4l2_dbg(2, debug, sd, "%s: BGR 888 24-bit\n", __func__);
 		i2c_wr8_and_or(sd, VOUT_SET2,
 				~(MASK_SEL422 | MASK_VOUT_422FIL_100) & 0xff,
 				0x00);
 		i2c_wr8_and_or(sd, VI_REP, ~MASK_VOUT_COLOR_SEL & 0xff,
 				MASK_VOUT_COLOR_RGB_FULL);
@@ -1430,15 +1441,30 @@ static int tc358743_log_status(struct v4l2_subdev *sd)
 			(i2c_rd16(sd, CSI_STATUS) & MASK_S_RXACT) ?
 			"yes" : "no");
 	v4l2_info(sd, "Stopped: %s\n",
 			(i2c_rd16(sd, CSI_STATUS) & MASK_S_HLT) ?
 			"yes" : "no");
-	v4l2_info(sd, "Color space: %s\n",
-			state->mbus_fmt_code == MEDIA_BUS_FMT_UYVY8_1X16 ?
-			"YCbCr 422 16-bit" :
-			state->mbus_fmt_code == MEDIA_BUS_FMT_RGB888_1X24 ?
-			"RGB 888 24-bit" : "Unsupported");
+
+	switch (state->mbus_fmt_code) {
+	case MEDIA_BUS_FMT_BGR888_1X24:
+		/*
+		 * The driver was initially introduced with RGB888
+		 * support, but CSI really means BGR.
+		 *
+		 * Since we might have applications that would have
+		 * hard-coded the RGB888, let's support both.
+		 */
+	case MEDIA_BUS_FMT_RGB888_1X24:
+		v4l2_info(sd, "Color space: BGR 888 24-bit\n");
+		break;
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+		v4l2_info(sd, "Color space: YCbCr 422 16-bit\n");
+		break;
+	default:
+		v4l2_info(sd, "Color space: Unsupported\n");
+		break;
+	}
 
 	v4l2_info(sd, "-----%s status-----\n", is_hdmi(sd) ? "HDMI" : "DVI-D");
 	v4l2_info(sd, "HDCP encrypted content: %s\n",
 			hdmi_sys_status & MASK_S_HDCP ? "yes" : "no");
 	v4l2_info(sd, "Input color space: %s %s range\n",
@@ -1771,24 +1797,32 @@ static int tc358743_enum_mbus_code(struct v4l2_subdev *sd,
 		struct v4l2_subdev_state *sd_state,
 		struct v4l2_subdev_mbus_code_enum *code)
 {
 	switch (code->index) {
 	case 0:
-		code->code = MEDIA_BUS_FMT_RGB888_1X24;
+		code->code = MEDIA_BUS_FMT_BGR888_1X24;
 		break;
 	case 1:
 		code->code = MEDIA_BUS_FMT_UYVY8_1X16;
 		break;
+	case 2:
+		/*
+		 * We need to keep RGB888 for backward compatibility,
+		 * but we should list it last for userspace to pick BGR.
+		 */
+		code->code = MEDIA_BUS_FMT_RGB888_1X24;
+		break;
 	default:
 		return -EINVAL;
 	}
 	return 0;
 }
 
 static u32 tc358743_g_colorspace(u32 code)
 {
 	switch (code) {
+	case MEDIA_BUS_FMT_BGR888_1X24:
 	case MEDIA_BUS_FMT_RGB888_1X24:
 		return V4L2_COLORSPACE_SRGB;
 	case MEDIA_BUS_FMT_UYVY8_1X16:
 		return V4L2_COLORSPACE_SMPTE170M;
 	default:
@@ -1822,11 +1856,12 @@ static int tc358743_set_fmt(struct v4l2_subdev *sd,
 	struct tc358743_state *state = to_state(sd);
 
 	u32 code = format->format.code; /* is overwritten by get_fmt */
 	int ret = tc358743_get_fmt(sd, sd_state, format);
 
-	if (code == MEDIA_BUS_FMT_RGB888_1X24 ||
+	if (code == MEDIA_BUS_FMT_BGR888_1X24 ||
+	    code == MEDIA_BUS_FMT_RGB888_1X24 ||
 	    code == MEDIA_BUS_FMT_UYVY8_1X16)
 		format->format.code = code;
 	format->format.colorspace = tc358743_g_colorspace(format->format.code);
 
 	if (ret)
@@ -2242,11 +2277,11 @@ static int tc358743_probe(struct i2c_client *client)
 	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
 	err = media_entity_pads_init(&sd->entity, 1, &state->pad);
 	if (err < 0)
 		goto err_hdl;
 
-	state->mbus_fmt_code = MEDIA_BUS_FMT_RGB888_1X24;
+	state->mbus_fmt_code = MEDIA_BUS_FMT_BGR888_1X24;
 
 	sd->dev = &client->dev;
 
 	mutex_init(&state->confctl_mutex);
 

-- 
2.51.0


