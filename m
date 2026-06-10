Return-Path: <linux-media+bounces-64369-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BRK9AucKKWr6PAMAu9opvQ
	(envelope-from <linux-media+bounces-64369-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 08:57:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7334F6666CE
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 08:57:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=nWOIcwK8;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64369-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64369-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD474313D5FA
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 06:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44329383319;
	Wed, 10 Jun 2026 06:56:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159583812F6
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 06:56:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781074568; cv=none; b=S5NOJjeTRLSiPPM3/UQSRJiCKHUowGYI41DCQ4H3q2ocS5kbTk4crldBgcVsyoKzz0L1vWzSO1aslaEhy/Iw0CY33u2k/FEjnGr4mAPZRt+8qweK83IOBym7nA86nLVFMhruYo319CoMDazD5je71TdJomehEuxzkyBalzwZTQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781074568; c=relaxed/simple;
	bh=4bfbk54eobez0nWMt6VBfNnYPVNo2Ianox68wNRDG/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Oz7BPFCRkaXDrhO1iYk2uXadKoDtFCxTNFCILEpPy0aTVhKjb4UItBZ5xATUwC/x9ixcg7zblTB0sH7jNFGM5RCz4d0PLnYvklc7QYO+YsgLtHaycKEwuQstPovEITF2cIRdhk23r5OOKka7mcBTbEdi+qC5CvL15Akr0n+X4tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nWOIcwK8; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:bcf2:9325:a9bd:32b:e71])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93F35517;
	Wed, 10 Jun 2026 08:55:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781074536;
	bh=4bfbk54eobez0nWMt6VBfNnYPVNo2Ianox68wNRDG/Q=;
	h=From:Date:Subject:To:Cc:From;
	b=nWOIcwK82Rw58rlEmHQfkEFzAZoeWyiGNmcJc/hWkRXiQf8gamv4yWAgMRguvpiT/
	 BFHoO8FacNMA9WSfDaBmZqOixoXJM52ssMy5Ep0hfXBxvAA+jDIFD7NG5AxpXgWkGf
	 pN1TBuwOco5/lrTwoeNB52q39bm9jYNrrqSwodp0=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 10 Jun 2026 12:24:38 +0530
Subject: [PATCH v2] media: i2c: imx219: Fix PIXEL_RATE for special binning
 mode
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-imx219-pixelrate-v2-1-45d1d201cd6b@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6DIBREr2L+ujRAhUhXvUfjAuFbf1LFgCE2h
 rsXe4Au30zmzQEJI2GCe3NAxEyJwlJBXhpwk11eyMhXBsml5pobRvMuhWEr7fiOdkPmtXNGK9W
 1nYQ6WyOOtTyVz77yRGkL8fN7yOJM/8iyYIJxeVPG46iHVjzIo01hGYKN/urCDH0p5Quw2fsat
 wAAAA==
X-Change-ID: 20260609-imx219-pixelrate-d6cc96558482
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9542;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=4bfbk54eobez0nWMt6VBfNnYPVNo2Ianox68wNRDG/Q=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqKQp++cuo1I09AKWv4KLoeOH9+316wUqvTbvuX
 NkHpdO5mB6JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaikKfgAKCRBD3pH5JJpx
 ReY1EACLIqGpQqLfjbFQV4iD4BzL/mn9OBaDet5Yt+NTHlDIeK9csIKtQeeprsviWzBuk2yOt68
 mqfwtEidSHtj3z0byQkzf61pwiYRLu76o705INme91uAntPvpsTaiMDD/9FB3eXpkLyWc3bRwhy
 enET89Z9R8z+wN9dXPoW0JRz9f0YTGSLv/tBMoXzWODj7ticBsDHBim0jD3cYaTFNiZq1wGHjBE
 VhUs/5X/jJ+yGAL3gX8hGQIu9aAVVg7qkXtrYAJttlB1Anu3HS12eHyfztzXSY/Y5ZqSbXNK1xp
 Wl4aFlVknRG2GsllUQlfqdDxD2rS8wgyf1F/vlRAUI2ec0aCaQ+2yxUmrRK4CScOyZXhGdcDi9r
 mRtQBnHy8kDJh8dbtUMSnj7Jai6bNEnyxgdMQCyq4y2rdNCl00gA2SUvzvqJYSK9qj5oirdiA1D
 CdbUarjmeTzUsh12ifPrN8YD7qV4K0dIvfFjXnHAZK5JQVXbzbLqE94O5DjZZkVEn9LG5IGi7P/
 OgxHLl/rDp4g7Diu4fjtlJFGjb2TUE/HTsjH9oONW14Hfm0wFmCAZTpwyVh6iSPPjqX3cDyBywK
 YZeJhscNyvw+rN8hs+i5w3LaHTB2dVHf8mg/vp752s9Hyd4Dv4lS5l5M5Cl/RVE4N8fKY8fEL2u
 WWe2gf2cm+CfjHg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64369-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:dave.stevenson@raspberrypi.com,m:mchehab@kernel.org,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:linux-media@vger.kernel.org,m:jai.luthra@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7334F6666CE

When using the special analog binning mode the sensor requires the frame
length to be programmed in units of 2xLines, but it still produces the
same number of lines overall.

Earlier we used to double the pixel rate reported to userspace, to avoid
negative values for the vertical blanking control. But in the new raw
sensor model, we have to expose the sensor's frame length and line
length directly to the userspace through new controls, which requires we
keep the pixel rate value the same.

There is sufficient range available in the line length register, so we
can halve the value computed and passed to userspace as V4L2_CID_HBLANK
instead, and thereby keep the same pixel rate.

Whether the new controls for frame length and line length should also
scale similarly to give userspace a consistent view, as opposed to the
sensor's awkward register programming model, is left as a decision for
later.

While at it, also drop the pixel_rate member from struct imx219 as we no
longer access or modify it. And simplify the hblank computation during
mode changes to default to the minimum value instead of trying to retain
the old line length. That would be unnecessarily complicated, and most
applications anyway modify the blankings freely to achieve their desired
framerate.

Link: https://lore.kernel.org/all/178091757893.16054.4583389270412251379@freya/
Link: https://lore.kernel.org/all/20260409201501.975242-65-sakari.ailus@linux.intel.com/
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
This is a follow-up to the discussion done on Sakari's proposed fix for
the same issue:
https://lore.kernel.org/all/178091466607.16054.13972332068848565738@freya/

Tested on Raspberry Pi 5 with libcamera, which can still hit the same
FPS ranges as before for both binned and non-binned modes.
---
Changes in v2:
- Set vblank step size to fll_factor
- Drop pixel_rate variable as we don't scale it anymore
- Use variables for new hblank and hblank_max values in set_pad_format
- Fix commit message and code comments with Dave's suggestions
- Set hblank to default value on mode change as opposed to retaining the
  LLP value set by user (Dave, I've kept your Tested-by, but please feel
                         free to drop it if you disagree)
- Link to v1: https://lore.kernel.org/r/20260609-imx219-pixelrate-v1-1-02359def6b41@ideasonboard.com
---
 drivers/media/i2c/imx219.c | 104 ++++++++++++++++++++++++++-------------------
 1 file changed, 61 insertions(+), 43 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 7da02ce5da15..ec65349e63f9 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -348,7 +348,6 @@ struct imx219 {
 
 	struct v4l2_ctrl_handler ctrl_handler;
 	/* V4L2 Controls */
-	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *exposure;
 	struct v4l2_ctrl *vflip;
@@ -420,7 +419,30 @@ static void imx219_get_binning(struct v4l2_subdev_state *state, u8 *bin_h,
 
 }
 
-static inline u32 imx219_get_rate_factor(struct v4l2_subdev_state *state)
+/*
+ * When using the special binning mode the sensor requires the FRAME_LENGTH to
+ * be programmed in units of 2xLines, but it still outputs the same number of
+ * lines overall.
+ *
+ * FRAME_LENGTH = (output height + vblank) / 2
+ *
+ * If we go ahead with it and set `vblank = FRAME_LENGTH - height` it would
+ * make the control value negative.
+ *
+ * Instead we can compensate for it in the horizontal dimension, as LINE_LENGTH
+ * has enough room, so both blanking values stay positive.
+ *
+ * LINE_LENGTH = (output width + hblank) * 2
+ *
+ * So the blanking values when using the special binning mode are:
+ *
+ * vblank = FRAME_LENGTH * 2 - height
+ * hblank = LINE_LENGTH / 2 - width
+ *
+ * where FRAME_LENGTH and LINE_LENGTH are the values programmed in the sensor
+ * registers.
+ */
+static inline u32 imx219_get_fll_factor(struct v4l2_subdev_state *state)
 {
 	u8 bin_h, bin_v;
 
@@ -440,12 +462,12 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
 	const struct v4l2_mbus_framefmt *format;
 	struct v4l2_subdev_state *state;
-	u32 rate_factor;
+	u32 fll_factor;
 	int ret = 0;
 
 	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
 	format = v4l2_subdev_state_get_format(state, 0);
-	rate_factor = imx219_get_rate_factor(state);
+	fll_factor = imx219_get_fll_factor(state);
 
 	if (ctrl->id == V4L2_CID_VBLANK) {
 		int exposure_max, exposure_def;
@@ -478,7 +500,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_EXPOSURE:
 		cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
-			  ctrl->val / rate_factor, &ret);
+			  ctrl->val / fll_factor, &ret);
 		break;
 	case V4L2_CID_DIGITAL_GAIN:
 		cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
@@ -495,11 +517,11 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_VBLANK:
 		cci_write(imx219->regmap, IMX219_REG_FRM_LENGTH_A,
-			  (format->height + ctrl->val) / rate_factor, &ret);
+			  (format->height + ctrl->val) / fll_factor, &ret);
 		break;
 	case V4L2_CID_HBLANK:
 		cci_write(imx219->regmap, IMX219_REG_LINE_LENGTH_A,
-			  format->width + ctrl->val, &ret);
+			  (format->width + ctrl->val) * fll_factor, &ret);
 		break;
 	case V4L2_CID_TEST_PATTERN_RED:
 		cci_write(imx219->regmap, IMX219_REG_TESTP_RED,
@@ -555,11 +577,10 @@ static int imx219_init_controls(struct imx219 *imx219)
 		return ret;
 
 	/* By default, PIXEL_RATE is read only */
-	imx219->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
-					       V4L2_CID_PIXEL_RATE,
-					       imx219_get_pixel_rate(imx219),
-					       imx219_get_pixel_rate(imx219), 1,
-					       imx219_get_pixel_rate(imx219));
+	v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops, V4L2_CID_PIXEL_RATE,
+			  imx219_get_pixel_rate(imx219),
+			  imx219_get_pixel_rate(imx219), 1,
+			  imx219_get_pixel_rate(imx219));
 
 	imx219->link_freq =
 		v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx219_ctrl_ops,
@@ -880,15 +901,19 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		int exposure_max;
-		int exposure_def;
-		int hblank, llp_min;
-		int pixel_rate;
+		int exposure_max, exposure_def;
+		int llp_min, hblank, hblank_max;
+		u32 fll_factor = imx219_get_fll_factor(state);
 
-		/* Update limits and set FPS to default */
+		/*
+		 * Update VBLANK range and default value to match the mode.
+		 * Also fix the step-size to fll_factor, as we halve the values
+		 * before writing to the register when special binning is used.
+		 */
 		ret = __v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
-					       IMX219_FLL_MAX - mode->height, 1,
-					       mode->fll_def - mode->height);
+					       IMX219_FLL_MAX - mode->height,
+					       fll_factor, mode->fll_def -
+					       mode->height);
 		if (ret)
 			return ret;
 
@@ -910,37 +935,30 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 			return ret;
 
 		/*
-		 * With analog binning the default minimum line length of 3448
-		 * can cause artefacts with RAW10 formats, because the ADC
-		 * operates on two lines together. So we switch to a higher
-		 * minimum of 3560.
+		 * With special analog binning the default minimum line length
+		 * of 3448 can cause artefacts with RAW10 formats, possibly
+		 * because the sensor is averaging 4 pixels in the analogue
+		 * domain as opposed to just 2, but we don't know for sure.
+		 *
+		 * The datasheet is lacking on this topic but experimental
+		 * results and some vendor tables point to using a higher
+		 * minimum of 3560, which fixes the issue.
 		 */
 		imx219_get_binning(state, &bin_h, &bin_v);
 		llp_min = (bin_h & bin_v) == IMX219_BINNING_X2_ANALOG ?
 				  IMX219_BINNED_LLP_MIN : IMX219_LLP_MIN;
-		ret = __v4l2_ctrl_modify_range(imx219->hblank,
-					       llp_min - mode->width,
-					       IMX219_LLP_MAX - mode->width, 1,
-					       llp_min - mode->width);
-		if (ret)
-			return ret;
-		/*
-		 * Retain PPL setting from previous mode so that the
-		 * line time does not change on a mode change.
-		 * Limits have to be recomputed as the controls define
-		 * the blanking only, so PPL values need to have the
-		 * mode width subtracted.
-		 */
-		hblank = prev_line_len - mode->width;
-		ret = __v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
+
+		hblank = (llp_min / fll_factor) - mode->width;
+		hblank_max = (IMX219_LLP_MAX / fll_factor) - mode->width;
+		ret = __v4l2_ctrl_modify_range(imx219->hblank, hblank,
+					       hblank_max, 1, hblank);
 		if (ret)
 			return ret;
 
-		/* Scale the pixel rate based on the mode specific factor */
-		pixel_rate = imx219_get_pixel_rate(imx219) *
-			     imx219_get_rate_factor(state);
-		ret = __v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
-					       pixel_rate, 1, pixel_rate);
+		/*
+		 * Update HBLANK to default value.
+		 */
+		ret = __v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
 		if (ret)
 			return ret;
 	}

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260609-imx219-pixelrate-d6cc96558482

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


