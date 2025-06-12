Return-Path: <linux-media+bounces-34623-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C793AD70DC
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 14:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14B147A66C8
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 12:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092A524468A;
	Thu, 12 Jun 2025 12:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a9KSBiqt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A5C242D74;
	Thu, 12 Jun 2025 12:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749732840; cv=none; b=u8nzp6EtiVs6ymJ19EUH8gsFKGUnHtp2+2tz/em5vEWMLLHk5PpmgB1a7NU4pMNANcFSoc8rVKsQOAw3j/LMXK+DZfgZPDaGK5bs6RHRWEqPKSAHUax0BCVNeqzZ6vXChciLmBPKokaJzgKi5fcIBb1RnSlPBJhOkIzEGY/yqq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749732840; c=relaxed/simple;
	bh=ZBCgrd9sHXn1llOMmgl1QZ1JUWMTyWciOFWEbRfQRz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F4CIaHoSlhpSJCSHz+UTte+ZBB9KzcoEUnsYC4UrGaUHTTmXiFPiXUMK2g5z2rRkNttafpeNdQoSZYaK8UoI81xLlGSEafkqAzp5UqtxIX6F2IQ0mt9+LR2GzpOBHEJHSYvBZge58hclpX9YbR1r84HAfcGbR0O1C+nhRuY/cZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9KSBiqt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CEA5C4CEED;
	Thu, 12 Jun 2025 12:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749732839;
	bh=ZBCgrd9sHXn1llOMmgl1QZ1JUWMTyWciOFWEbRfQRz8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=a9KSBiqtIb3cobtv+erAVdJxYqcwDZ8j1i9Mce7vV7rjD6PkvBu+9Mx6yRj99Cr6V
	 965tCb/soPJDXAS/G4eNGjX/bL475/Q4ltePVtrZut6KwRIvIuEkouPHaxYIqWgn64
	 sO718mm9R64V/Tw0mVjS+v7fELkWdFCyo52MwZoar4/NDWg2LIu789z4SgBR4lO354
	 2QDDr1ABbOV7JS2lY3G8YPlgiG9WTE1QNKbWK46epluiLELY28wP1s2Whs7Ii2V3Lv
	 QzzQU3nK5r3L9mULdnw2vXMhGffINKAB+5y+R/clxzcbdeRqhEZEDzGAb/RccUjFNB
	 9yEXN6fGSpG7w==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 12 Jun 2025 14:53:41 +0200
Subject: [PATCH 3/4] media: tc358743: Fix the RGB MBUS format
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-csi-bgr-rgb-v1-3-dc8a309118f8@kernel.org>
References: <20250612-csi-bgr-rgb-v1-0-dc8a309118f8@kernel.org>
In-Reply-To: <20250612-csi-bgr-rgb-v1-0-dc8a309118f8@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Mats Randgaard <matrandg@cisco.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hans.verkuil@cisco.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3407; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ZBCgrd9sHXn1llOMmgl1QZ1JUWMTyWciOFWEbRfQRz8=;
 b=kA0DAAkTJ1/OGaI9vnYByyZiAGhKzduh3pZnJKDgORyDuF5Soo86AukCh2BiJ0G4eYd43L1iz
 oiVBAATCQAdFiEE5BxWy6eHo3pAP6n4J1/OGaI9vnYFAmhKzdsACgkQJ1/OGaI9vnZZawGAk/09
 eRSuD0w7WvMj1ZufjA1Tpr1hHnhInO2HCaLPHKfhb+4Zw4UX3ovko0JhMXMpAYCMBCAZfl2sWpd
 Myc9L64zukiNoTQoFV0QmQXu+rzUhW6PwI6hIk4U+fu9xmzg1EUI=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The tc358743 is an HDMI to MIPI-CSI2 bridge. It supports two of the
three HDMI 1.4 video formats: RGB 4:4:4 and YCbCr 422.

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
 drivers/media/i2c/tc358743.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index ca0b0b9bda1755313f066ba36ab218873b9ae438..a1c164a7716a10b0cb9ff38f88c0513b45f24771 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -688,11 +688,11 @@ static void tc358743_set_csi_color_space(struct v4l2_subdev *sd)
 		mutex_lock(&state->confctl_mutex);
 		i2c_wr16_and_or(sd, CONFCTL, ~MASK_YCBCRFMT,
 				MASK_YCBCRFMT_422_8_BIT);
 		mutex_unlock(&state->confctl_mutex);
 		break;
-	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_BGR888_1X24:
 		v4l2_dbg(2, debug, sd, "%s: RGB 888 24-bit\n", __func__);
 		i2c_wr8_and_or(sd, VOUT_SET2,
 				~(MASK_SEL422 | MASK_VOUT_422FIL_100) & 0xff,
 				0x00);
 		i2c_wr8_and_or(sd, VI_REP, ~MASK_VOUT_COLOR_SEL & 0xff,
@@ -1353,11 +1353,11 @@ static int tc358743_log_status(struct v4l2_subdev *sd)
 			(i2c_rd16(sd, CSI_STATUS) & MASK_S_HLT) ?
 			"yes" : "no");
 	v4l2_info(sd, "Color space: %s\n",
 			state->mbus_fmt_code == MEDIA_BUS_FMT_UYVY8_1X16 ?
 			"YCbCr 422 16-bit" :
-			state->mbus_fmt_code == MEDIA_BUS_FMT_RGB888_1X24 ?
+			state->mbus_fmt_code == MEDIA_BUS_FMT_BGR888_1X24 ?
 			"RGB 888 24-bit" : "Unsupported");
 
 	v4l2_info(sd, "-----%s status-----\n", is_hdmi(sd) ? "HDMI" : "DVI-D");
 	v4l2_info(sd, "HDCP encrypted content: %s\n",
 			hdmi_sys_status & MASK_S_HDCP ? "yes" : "no");
@@ -1691,11 +1691,11 @@ static int tc358743_enum_mbus_code(struct v4l2_subdev *sd,
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
 	default:
@@ -1753,11 +1753,11 @@ static int tc358743_set_fmt(struct v4l2_subdev *sd,
 
 	if (ret)
 		return ret;
 
 	switch (code) {
-	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_BGR888_1X24:
 	case MEDIA_BUS_FMT_UYVY8_1X16:
 		break;
 	default:
 		return -EINVAL;
 	}
@@ -2172,11 +2172,11 @@ static int tc358743_probe(struct i2c_client *client)
 	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
 	err = media_entity_pads_init(&sd->entity, 1, &state->pad);
 	if (err < 0)
 		goto err_hdl;
 
-	state->mbus_fmt_code = MEDIA_BUS_FMT_RGB888_1X24;
+	state->mbus_fmt_code = MEDIA_BUS_FMT_BGR888_1X24;
 
 	sd->dev = &client->dev;
 
 	mutex_init(&state->confctl_mutex);
 

-- 
2.49.0


