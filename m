Return-Path: <linux-media+bounces-67669-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GfVhGml0V2rEOQEAu9opvQ
	(envelope-from <linux-media+bounces-67669-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:52:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E2275DC9A
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:52:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=UM2t7D22;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67669-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-67669-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F1EE230577EA
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 11:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB831480335;
	Wed, 15 Jul 2026 11:44:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2CB47DD65
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 11:44:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115872; cv=none; b=Wp5mrlhPdkDF0fvCud+nDL/wroMq7mlp0hEmDdf0xla7l//DyP/grblUbWar3N3QzVR7WMR/RM4Hyjh/qRIBm/dzIdn3njvwF8DyvcGJRhFtYjoVDqALyxS29mWnV3xm7msxxdGVl9GoJ+ZL135o9IU/HuKdZu70Wxhese36SrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115872; c=relaxed/simple;
	bh=RJLHcjeyXOdM+p7phfbtKuYXQOj/5YoCC9QQP9TuAQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KlAsfZDcU8zt+i9elaDC9xTu0jXCDo2XLV5jxK2WERf0mQHD/fNZQrMBiy0t1H0QAAbjZSvfD2qr7LJkLQsm/lUcJci0HL7g0rAUt26LChuZgDDrDTf4aRR6japeSTzR00dk/fy902jeo5pqgQREfLNHJJbw6tJKyi20xDlEFT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=UM2t7D22; arc=none smtp.client-ip=209.85.221.47
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-472326ca506so4359234f8f.2
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 04:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115868; x=1784720668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLcaTX0gw19qqcTHrDGxxCdqe+mBz3YklcK14/J/bAU=;
        b=UM2t7D22VajEj9kW6A7wTFfzxJ65fZRiUrjKD24UnVC0Pn4thwLJxKrAjeU1R6WcQS
         zRua2BvH1EAAL2kk4iMtdeq84AMYyLovu3bl0k2igVHMeIOc+fpMeCOg3oSNkY3gAKZG
         TfHvW9R59tUs+7X/kAdyxFrDjX1WjFonJX9OPTfk8SCmRFRyK7vNKnF18l3rMNqJ/Cc/
         ySdr3thweSaqnGqwgyuh3LiGj5+RtkAbO+PsREYbxkX2BoWFCfPqCKSoQ4D37Tqco6Ef
         I0mIVBTU81gdd58Ve3DnWtu0TIMh7H3yWs0uWDWoQRkq15g5GS4KHFyGwiESK6b0hIUq
         q74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115868; x=1784720668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uLcaTX0gw19qqcTHrDGxxCdqe+mBz3YklcK14/J/bAU=;
        b=KAIDNqOimRMHG5qgvmL8M8VYAYf0ylkSXlZX+JhZQZdMrolsQh25S1AEyOr8TMIY9t
         QxiI2IKsXEJ31TtBrVUO1XjTPXu21m7RTLfP9ikT3zNbba6aIZs+mnR0Dt/0hzENh89e
         YQprykyy/VjRfvUd6nxibqSDK/Cv6Olxtm7UHXk4HXN+nUvshsDtrPTye4R+79DeU8MF
         mEM2yl4PuDEGyF8EBNX2grigb8+T0j1+bHyMFFiLnrn6Ee7SNZTteCbRhAxVvxkI0nTs
         DB+XGlcPT6Qjy5SrSiqHVzLSPuN0+GIBAs310OEK7oQiCL3oe0PxRAHPnijtOUuAjWfo
         dXSw==
X-Gm-Message-State: AOJu0YxNEi+ei6jgjUOsxku5OJvsgPApXzCRhPp7F3ZxObQhipX4PdcT
	72eWGRWuyiwN0OtYw+57KPWKMbdaZbbt1GSCOGmIZ9CWbUTohPZB9gxTC3BGTzVbNtc=
X-Gm-Gg: AfdE7clvqHj9XjnHXj442NTpJR4A3mR14jSS9c4RNV9+o5jWEQ3VeLqY8dqMAVtkhAf
	YEZNf5PxSow5bnZiMcDODTaOvoYfaoYY3ARphLvnL5kxVy1QhHtzJ+piB1mUs9TiwH+2ORkBz/S
	k+E+c/uO7sxB8S8iFbxaBIu9WzjQhX2GRkR992LzrmHEVU3oiXP8e6xK34tWK7OfFWbflKcF34s
	oDvyCyycuG7/chkhGObgTBA85SPLABEMJIExJi/oP1hSUoS93hpUg5TmTUi0UgyznKZxNXrb7op
	fLPy8XjdPeW4Zy45ZTWRhZbZbSSnCNqYfBxqjoE0rhBpuvjhzkP4pLsFmG8JzkhwVE2zCbbpkHo
	xuxJvG9y129MDb1yzbbBu7Ze9hFYMEn2N50LMRsFWCTP5ZxHwbA5uAT0Kr/50m4zoC9JpG7Ilat
	txG0Io9vldV8FuVqgk4t1qjBg1r97vDHu/zdM5PzRg22BheKy+Xy+KeChorSEzsa89
X-Received: by 2002:a05:6000:2dc6:b0:47f:4c49:430e with SMTP id ffacd0b85a97d-47f4c494388mr6124368f8f.13.1784115867887;
        Wed, 15 Jul 2026 04:44:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:27 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 12:43:33 +0100
Subject: [PATCH v4 20/21] media: imx355: Switch to using the subdev state
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-media-imx355-v4-20-f7f966fb9ffd@raspberrypi.com>
References: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
In-Reply-To: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67669-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,raspberrypi.com:from_mime,raspberrypi.com:mid,raspberrypi.com:email,raspberrypi.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 60E2275DC9A

The subdev state is now preferred rather than handling crop
and format within the driver state, so switch the driver to
using it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 183 ++++++++++++++-------------------------------
 1 file changed, 55 insertions(+), 128 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 0462e0feee36..97f4594f7ed9 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -179,13 +179,6 @@ struct imx355 {
 	struct imx355_hwcfg *hwcfg;
 	const struct imx355_clk_params *clk_params;
 
-	/*
-	 * Mutex for serialized access:
-	 * Protect sensor set pad format and start/stop streaming safely.
-	 * Protect access to sensor v4l2 controls.
-	 */
-	struct mutex mutex;
-
 	struct gpio_desc *reset_gpio;
 	struct regulator_bulk_data *supplies;
 };
@@ -593,46 +586,23 @@ static u32 imx355_get_format_code(struct imx355 *imx355)
 		{ MEDIA_BUS_FMT_SGBRG10_1X10, MEDIA_BUS_FMT_SBGGR10_1X10, },
 	};
 
-	lockdep_assert_held(&imx355->mutex);
 	code = codes[imx355->vflip->val][imx355->hflip->val];
 
 	return code;
 }
 
-/* Open sub-device */
-static int imx355_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
-{
-	struct imx355 *imx355 = to_imx355(sd);
-	struct v4l2_mbus_framefmt *try_fmt =
-		v4l2_subdev_state_get_format(fh->state, 0);
-	struct v4l2_rect *crop = v4l2_subdev_state_get_crop(fh->state, 0);
-
-	mutex_lock(&imx355->mutex);
-
-	/* Initialize try_fmt */
-	try_fmt->width = imx355->cur_mode->width;
-	try_fmt->height = imx355->cur_mode->height;
-	try_fmt->code = imx355_get_format_code(imx355);
-	try_fmt->field = V4L2_FIELD_NONE;
-	try_fmt->colorspace = V4L2_COLORSPACE_RAW;
-	try_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
-	try_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
-	try_fmt->xfer_func = V4L2_XFER_FUNC_NONE;
-
-	*crop = imx355->cur_mode->crop;
-
-	mutex_unlock(&imx355->mutex);
-
-	return 0;
-}
-
 static int imx355_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct imx355 *imx355 = container_of(ctrl->handler,
 					     struct imx355, ctrl_handler);
+	const struct v4l2_mbus_framefmt *format = NULL;
+	struct v4l2_subdev_state *state;
 	s64 max;
 	int ret;
 
+	state = v4l2_subdev_get_locked_active_state(&imx355->sd);
+	format = v4l2_subdev_state_get_format(state, 0);
+
 	/* Propagate change of current control to all related controls */
 	switch (ctrl->id) {
 	case V4L2_CID_VBLANK:
@@ -705,9 +675,7 @@ static int imx355_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->index > 0)
 		return -EINVAL;
 
-	mutex_lock(&imx355->mutex);
 	code->code = imx355_get_format_code(imx355);
-	mutex_unlock(&imx355->mutex);
 
 	return 0;
 }
@@ -721,12 +689,9 @@ static int imx355_enum_frame_size(struct v4l2_subdev *sd,
 	if (fse->index >= ARRAY_SIZE(supported_modes))
 		return -EINVAL;
 
-	mutex_lock(&imx355->mutex);
 	if (fse->code != imx355_get_format_code(imx355)) {
-		mutex_unlock(&imx355->mutex);
 		return -EINVAL;
 	}
-	mutex_unlock(&imx355->mutex);
 
 	fse->min_width = supported_modes[fse->index].width;
 	fse->max_width = fse->min_width;
@@ -750,36 +715,6 @@ static void imx355_update_pad_format(struct imx355 *imx355,
 	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
 }
 
-static int imx355_do_get_pad_format(struct imx355 *imx355,
-				    struct v4l2_subdev_state *sd_state,
-				    struct v4l2_subdev_format *fmt)
-{
-	struct v4l2_mbus_framefmt *framefmt;
-
-	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
-		fmt->format = *framefmt;
-	} else {
-		imx355_update_pad_format(imx355, imx355->cur_mode, fmt);
-	}
-
-	return 0;
-}
-
-static int imx355_get_pad_format(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_state *sd_state,
-				 struct v4l2_subdev_format *fmt)
-{
-	struct imx355 *imx355 = to_imx355(sd);
-	int ret;
-
-	mutex_lock(&imx355->mutex);
-	ret = imx355_do_get_pad_format(imx355, sd_state, fmt);
-	mutex_unlock(&imx355->mutex);
-
-	return ret;
-}
-
 static int
 imx355_set_pad_format(struct v4l2_subdev *sd,
 		      struct v4l2_subdev_state *sd_state,
@@ -793,8 +728,6 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 	s64 h_blank;
 	u32 height;
 
-	mutex_lock(&imx355->mutex);
-
 	/*
 	 * Only one bayer order is supported.
 	 * It depends on the flip settings.
@@ -806,16 +739,17 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 				      width, height,
 				      fmt->format.width, fmt->format.height);
 	imx355_update_pad_format(imx355, mode, fmt);
-	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
-		*framefmt = fmt->format;
-
-		crop = v4l2_subdev_state_get_crop(sd_state, 0);
-		crop->width = mode->crop.width;
-		crop->height = mode->crop.height;
-		crop->left = mode->crop.left;
-		crop->top = mode->crop.top;
-	} else {
+	framefmt = v4l2_subdev_state_get_format(sd_state, 0);
+
+	*framefmt = fmt->format;
+
+	crop = v4l2_subdev_state_get_crop(sd_state, 0);
+	crop->width = mode->crop.width;
+	crop->height = mode->crop.height;
+	crop->left = mode->crop.left;
+	crop->top = mode->crop.top;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		imx355->cur_mode = mode;
 		/* Update limits and set FPS to default */
 		height = imx355->cur_mode->height;
@@ -834,41 +768,17 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 					 h_blank, 1, h_blank);
 	}
 
-	mutex_unlock(&imx355->mutex);
-
 	return 0;
 }
 
-static void
-__imx355_get_pad_crop(struct imx355 *imx355,
-		      struct v4l2_subdev_state *sd_state, unsigned int pad,
-		      enum v4l2_subdev_format_whence which, struct v4l2_rect *r)
-{
-	switch (which) {
-	case V4L2_SUBDEV_FORMAT_TRY:
-		*r = *v4l2_subdev_state_get_crop(sd_state, pad);
-		break;
-	case V4L2_SUBDEV_FORMAT_ACTIVE:
-		*r = imx355->cur_mode->crop;
-		break;
-	}
-}
-
 static int imx355_get_selection(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
 	switch (sel->target) {
-	case V4L2_SEL_TGT_CROP: {
-		struct imx355 *imx355 = to_imx355(sd);
-
-		mutex_lock(&imx355->mutex);
-		__imx355_get_pad_crop(imx355, sd_state, sel->pad, sel->which,
-				      &sel->r);
-		mutex_unlock(&imx355->mutex);
-
+	case V4L2_SEL_TGT_CROP:
+		sel->r = *v4l2_subdev_state_get_crop(sd_state, 0);
 		return 0;
-	}
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 	case V4L2_SEL_TGT_CROP_BOUNDS:
 	case V4L2_SEL_TGT_NATIVE_SIZE:
@@ -883,6 +793,21 @@ static int imx355_get_selection(struct v4l2_subdev *sd,
 	return -EINVAL;
 }
 
+static int imx355_entity_init_state(struct v4l2_subdev *subdev,
+				    struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_subdev_format fmt = { };
+
+	fmt.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
+	fmt.format.code = MEDIA_BUS_FMT_SRGGB10_1X10;
+	fmt.format.width = supported_modes[0].width;
+	fmt.format.height = supported_modes[0].height;
+
+	imx355_set_pad_format(subdev, sd_state, &fmt);
+
+	return 0;
+}
+
 /* Start streaming */
 static int imx355_start_streaming(struct imx355 *imx355)
 {
@@ -968,9 +893,10 @@ static int imx355_stop_streaming(struct imx355 *imx355)
 static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct imx355 *imx355 = to_imx355(sd);
+	struct v4l2_subdev_state *state;
 	int ret = 0;
 
-	mutex_lock(&imx355->mutex);
+	state = v4l2_subdev_lock_and_get_active_state(sd);
 
 	if (enable) {
 		ret = pm_runtime_resume_and_get(imx355->dev);
@@ -993,14 +919,14 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 	__v4l2_ctrl_grab(imx355->vflip, enable);
 	__v4l2_ctrl_grab(imx355->hflip, enable);
 
-	mutex_unlock(&imx355->mutex);
+	v4l2_subdev_unlock_state(state);
 
 	return ret;
 
 err_rpm_put:
 	pm_runtime_put_autosuspend(imx355->dev);
 err_unlock:
-	mutex_unlock(&imx355->mutex);
+	v4l2_subdev_unlock_state(state);
 
 	return ret;
 }
@@ -1034,7 +960,7 @@ static const struct v4l2_subdev_video_ops imx355_video_ops = {
 
 static const struct v4l2_subdev_pad_ops imx355_pad_ops = {
 	.enum_mbus_code = imx355_enum_mbus_code,
-	.get_fmt = imx355_get_pad_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = imx355_set_pad_format,
 	.enum_frame_size = imx355_enum_frame_size,
 	.get_selection = imx355_get_selection,
@@ -1051,7 +977,7 @@ static const struct media_entity_operations imx355_subdev_entity_ops = {
 };
 
 static const struct v4l2_subdev_internal_ops imx355_internal_ops = {
-	.open = imx355_open,
+	.init_state = imx355_entity_init_state,
 };
 
 static int imx355_power_off(struct device *dev)
@@ -1117,7 +1043,6 @@ static int imx355_init_controls(struct imx355 *imx355)
 	if (ret)
 		return ret;
 
-	ctrl_hdlr->lock = &imx355->mutex;
 	imx355->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx355_ctrl_ops,
 						   V4L2_CID_LINK_FREQ, 0, 0,
 						   &imx355->hwcfg->link_freq_menu);
@@ -1266,8 +1191,6 @@ static int imx355_probe(struct i2c_client *client)
 
 	imx355->dev = &client->dev;
 
-	mutex_init(&imx355->mutex);
-
 	imx355->regmap = devm_cci_regmap_init_i2c(client, 16);
 	if (IS_ERR(imx355->regmap))
 		return dev_err_probe(imx355->dev, PTR_ERR(imx355->regmap),
@@ -1296,7 +1219,7 @@ static int imx355_probe(struct i2c_client *client)
 					    &imx355->supplies);
 	if (ret) {
 		dev_err_probe(imx355->dev, ret, "could not get regulators");
-		goto error_probe;
+		return ret;
 	}
 
 	imx355->reset_gpio = devm_gpiod_get_optional(imx355->dev, "reset",
@@ -1304,7 +1227,7 @@ static int imx355_probe(struct i2c_client *client)
 	if (IS_ERR(imx355->reset_gpio)) {
 		ret = dev_err_probe(imx355->dev, PTR_ERR(imx355->reset_gpio),
 				    "failed to get gpios");
-		goto error_probe;
+		return ret;
 	}
 
 	/* Initialize subdev */
@@ -1313,13 +1236,12 @@ static int imx355_probe(struct i2c_client *client)
 	imx355->hwcfg = imx355_get_hwcfg(imx355);
 	if (!imx355->hwcfg) {
 		dev_err(imx355->dev, "failed to get hwcfg");
-		ret = -ENODEV;
-		goto error_probe;
+		return -ENODEV;
 	}
 
 	ret = imx355_power_on(imx355->dev);
 	if (ret)
-		goto error_probe;
+		return ret;
 
 	/* Check module identity */
 	ret = imx355_identify_module(imx355);
@@ -1352,6 +1274,13 @@ static int imx355_probe(struct i2c_client *client)
 		goto error_handler_free;
 	}
 
+	imx355->sd.state_lock = imx355->ctrl_handler.lock;
+	ret = v4l2_subdev_init_finalize(&imx355->sd);
+	if (ret < 0) {
+		dev_err_probe(imx355->dev, ret, "subdev init error\n");
+		goto error_media_entity_free;
+	}
+
 	/*
 	 * Device is already turned on by i2c-core with ACPI domain PM.
 	 * Enable runtime PM and turn off the device.
@@ -1363,16 +1292,18 @@ static int imx355_probe(struct i2c_client *client)
 
 	ret = v4l2_async_register_subdev_sensor(&imx355->sd);
 	if (ret < 0)
-		goto error_media_entity_runtime_pm;
+		goto error_subdev_cleanup_runtime_pm;
 
 	pm_runtime_idle(imx355->dev);
 
 	return 0;
 
-error_media_entity_runtime_pm:
+error_subdev_cleanup_runtime_pm:
 	pm_runtime_disable(imx355->dev);
 	pm_runtime_set_suspended(imx355->dev);
 	pm_runtime_dont_use_autosuspend(imx355->dev);
+	v4l2_subdev_cleanup(&imx355->sd);
+error_media_entity_free:
 	media_entity_cleanup(&imx355->sd.entity);
 
 error_handler_free:
@@ -1381,9 +1312,6 @@ static int imx355_probe(struct i2c_client *client)
 error_power_off:
 	imx355_power_off(imx355->dev);
 
-error_probe:
-	mutex_destroy(&imx355->mutex);
-
 	return ret;
 }
 
@@ -1393,6 +1321,7 @@ static void imx355_remove(struct i2c_client *client)
 	struct imx355 *imx355 = to_imx355(sd);
 
 	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
@@ -1404,8 +1333,6 @@ static void imx355_remove(struct i2c_client *client)
 	}
 
 	pm_runtime_dont_use_autosuspend(imx355->dev);
-
-	mutex_destroy(&imx355->mutex);
 }
 
 static const struct acpi_device_id imx355_acpi_ids[] __maybe_unused = {

-- 
2.34.1


