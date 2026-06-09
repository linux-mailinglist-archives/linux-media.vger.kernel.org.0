Return-Path: <linux-media+bounces-64268-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6czPJGO7J2oO1QIAu9opvQ
	(envelope-from <linux-media+bounces-64268-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 09:06:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E333F65D085
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 09:06:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=nJENqv6X;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64268-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64268-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FD843043478
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 07:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB7E3D6497;
	Tue,  9 Jun 2026 07:04:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA13352012
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 07:03:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780988640; cv=none; b=hF8METWYCaMNNJHn8x14/bfGC2oCN7J4XMAEbBdvqFQ5f9UVVZlqz/l1UtzCZJPFlAKIk5LX8w9jCpJkfdheIhh6mLSdCFpteG74fbnFH5DBKZcCCjjZqaHSUa1xjzkkzwQp2eIAjqIWbtQlXoHboDih65AB+3jDRRvS+E0VASA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780988640; c=relaxed/simple;
	bh=DJuAclAFc0re2JS/P/1aFJGDhfFCdZ+hJxi3q/v16GE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=szGo36L7ixDIGAtcoHTboONn+gO3GEPDrDbA7s+bkzOE/8FZIQs5e+U/ePwm7IjcB1vS4fBr+Z8ZLEmzGBzrVpkJYa+XfyaXMO47wogOUK2h1gmPAgTSb5A2X6I4cINvmhiDGPSQh+Gpr8UWJm1GUqmreKuax5I9y4AeRtioRcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nJENqv6X; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:bcf2:9325:a9bd:32b:e71])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0EE7921C;
	Tue,  9 Jun 2026 09:03:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780988604;
	bh=DJuAclAFc0re2JS/P/1aFJGDhfFCdZ+hJxi3q/v16GE=;
	h=From:Date:Subject:To:Cc:From;
	b=nJENqv6XkSK9Deau4uj5cbXsojfpBgg/eoIttM8mboK1qZ1iWSog/NVG7mIpyjjEh
	 LOM9BC2AIG9zB74KSZHKXTEgIRdaDnBGmpB3M5tmOjRpzrA+o2lZe0q9ZlApbn3h3G
	 v3yZEFjYZ21fPQYO0Se2cKORQXA7gUCL7nxvNYLk=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 09 Jun 2026 12:33:30 +0530
Subject: [PATCH] media: i2c: imx219: Drop the hack of doubling PIXEL_RATE
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-imx219-pixelrate-v1-1-02359def6b41@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/xWMWwqAIBAArxL7nWBLinaV6EN0q4VerBFBdPfsc
 xhmHsgkTBm66gGhizPvW4GmriDOYZtIcSoMqNFqq73i9cbGq4NvWiScpJKN0VtjXOsQSnYIjUX
 +y3543w8aqD10YgAAAA==
X-Change-ID: 20260609-imx219-pixelrate-d6cc96558482
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6852;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=DJuAclAFc0re2JS/P/1aFJGDhfFCdZ+hJxi3q/v16GE=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqJ7rK/4mtOgFJPKEEuovroc4RAW6A8LhBciSua
 WDhZ+ZTCVGJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaie6ygAKCRBD3pH5JJpx
 RSgVD/9F0hSgnHsxq3eq68Nxsuvu/0g4lXWbWhIm1+rCrB/H18nhgnPQoYo28fm2l80TbSDFbrp
 CwaMdd+01s7Z/mkdFm2+tNGVVJ3WxzDdDlWgr9607JXsz7at/ZKkzNFQKfZN3K8b1FbagE+gmHQ
 aFH71HVrvgK7ne2MOAjTjv7FMoe5Kf5gweLX3Wbw5GyKE88zYtHExSeawcmBy/Or9G9KZX1x9om
 16+hSk7ZVVD7CjbhiMi3tbzoGsSvLdE5rvGRmtdoMuPz4okMNyGtE7ionoYXQBD33a75TBMXYSr
 izz1F5jkd2Z0l+7ItqzcI1ypl0AltgMl4vuRmSIw7XZz5r8Vv1hEJZuGpgLTW7eFyvLCpV8QIzs
 MQsoS+mC3qWE6js/MoT5YimJ4D4jTY3JbqPnwhJCZeE0JogEC893+0i9s2QM7bk0OVEhMh14k4F
 A+OtyyhFE5OTlcsZ15AuOIOW6gXAD6tyAAFs1lxCBf47oJUeVC2QkL9YvsA85MDPMjXxkHy/v+/
 SURJg3JCMdu31EK6McerRaVnO1zEzv075jwTXUl7JEKO3xcT9ahGjp7OoY27lNGgP9o4MfM68zf
 AKukAwbDt+e0+1l1/PqPX1iuZcsuyBYtsBHnbZxXzAHzMTfJq/5mTiYJgbqGWchKpWZUD5mm3bj
 3Z3AtBHMesZzYmQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64268-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:dave.stevenson@raspberrypi.com,m:mchehab@kernel.org,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:linux-media@vger.kernel.org,m:jai.luthra@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E333F65D085

Doubling the PIXEL_RATE for the special analogue binning mode was always
a hack done to make the userspace framerate calculations happy, as the
sensor's PLL has always been unchanged.

After analyzing the sensor behaviour with minimum possible values for
frame and line length for different binning modes, it is likely that the
sensor is doing averaging in the analogue domain for 4 pixels when the
special binning mode is used. So use that to model the userspace
blanking controls, instead of the hack of doubling the pixel rate.

This has an additional benefit to make it easier to move to the new raw
sensor model, where we have to expose the sensor's frame length and line
length registers directly to the userspace through new controls, thus
requiring the pixel rate control to match the sensor read out.

Whether those new controls should also scale to give userspace a
"correct" view of the sensor internals, as opposed to the sensor's
register programming model is left as a decision for later.

Link: https://lore.kernel.org/all/178091757893.16054.4583389270412251379@freya/
Link: https://lore.kernel.org/all/20260409201501.975242-65-sakari.ailus@linux.intel.com/
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
This is a follow-up to the discussion done on Sakari's proposed fix for
the same issue:
https://lore.kernel.org/all/178091466607.16054.13972332068848565738@freya/

Tested on Raspberry Pi 5 with libcamera, which can still hit the same
FPS ranges as before for both binned/non-binned modes.
---
 drivers/media/i2c/imx219.c | 65 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 49 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 7da02ce5da15..534d9ba0588c 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -420,7 +420,33 @@ static void imx219_get_binning(struct v4l2_subdev_state *state, u8 *bin_h,
 
 }
 
-static inline u32 imx219_get_rate_factor(struct v4l2_subdev_state *state)
+/*
+ * When doing the special binning the sensor does the averaging in the analogue
+ * domain (before ADC) for both H/V dimensions and reads out only a quarter of
+ * the pixels. The sensor programming model convolutes this by never changing
+ * the line length values and expecting frame length to be in units of 2xLines.
+ *
+ * FLL = (output height + vblank) / 2
+ *
+ * If we go ahead with it and set `vblank = FLL - height` it would make the
+ * control value negative.
+ *
+ * So we instead keep the userspace sane by adjusting the blanking controls to
+ * match the sensor read-out instead of the broken register model.
+ *
+ * Thus compensate LLP in the other direction,
+ *
+ * LLP = (output width + hblank) * 2
+ *
+ * So the blanking values are:
+ *
+ * vblank = FLL * 2 - height
+ * hblank = LLP / 2 - width
+ *
+ * where FLL and LLP are the values in the registers using the sensor
+ * programming model.
+ */
+static inline u32 imx219_get_fll_factor(struct v4l2_subdev_state *state)
 {
 	u8 bin_h, bin_v;
 
@@ -440,12 +466,12 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -478,7 +504,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_EXPOSURE:
 		cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
-			  ctrl->val / rate_factor, &ret);
+			  ctrl->val / fll_factor, &ret);
 		break;
 	case V4L2_CID_DIGITAL_GAIN:
 		cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
@@ -495,11 +521,11 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -884,6 +910,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 		int exposure_def;
 		int hblank, llp_min;
 		int pixel_rate;
+		int fll_factor;
 
 		/* Update limits and set FPS to default */
 		ret = __v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
@@ -910,20 +937,28 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 			return ret;
 
 		/*
-		 * With analog binning the default minimum line length of 3448
-		 * can cause artefacts with RAW10 formats, because the ADC
-		 * operates on two lines together. So we switch to a higher
-		 * minimum of 3560.
+		 * With special analog binning the default minimum line length
+		 * of 3448 can cause artefacts with RAW10 formats because the
+		 * sensor is averaging 4 pixels in analogue domain as opposed
+		 * to just 2, increasing the minimum time to read it out.
+		 *
+		 * So we switch to a higher minimum of 3560.
 		 */
 		imx219_get_binning(state, &bin_h, &bin_v);
 		llp_min = (bin_h & bin_v) == IMX219_BINNING_X2_ANALOG ?
 				  IMX219_BINNED_LLP_MIN : IMX219_LLP_MIN;
+
+		fll_factor = imx219_get_fll_factor(state);
 		ret = __v4l2_ctrl_modify_range(imx219->hblank,
-					       llp_min - mode->width,
-					       IMX219_LLP_MAX - mode->width, 1,
-					       llp_min - mode->width);
+					       (llp_min / fll_factor) -
+					       mode->width,
+					       (IMX219_LLP_MAX / fll_factor) -
+					       mode->width, 1,
+					       (llp_min / fll_factor) -
+					       mode->width);
 		if (ret)
 			return ret;
+
 		/*
 		 * Retain PPL setting from previous mode so that the
 		 * line time does not change on a mode change.
@@ -936,9 +971,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 		if (ret)
 			return ret;
 
-		/* Scale the pixel rate based on the mode specific factor */
-		pixel_rate = imx219_get_pixel_rate(imx219) *
-			     imx219_get_rate_factor(state);
+		pixel_rate = imx219_get_pixel_rate(imx219);
 		ret = __v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
 					       pixel_rate, 1, pixel_rate);
 		if (ret)

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260609-imx219-pixelrate-d6cc96558482

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


