Return-Path: <linux-media+bounces-66894-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V2eUM+EyTWrlwQEAu9opvQ
	(envelope-from <linux-media+bounces-66894-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:09:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5DF71E224
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:09:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=q3fNVl7V;
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66894-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66894-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 598D63065D0D
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 17:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3076248BD5D;
	Tue,  7 Jul 2026 17:06:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFBD47AF6D
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 17:06:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443996; cv=none; b=FML/9oLOUYivKOPsQ1i5+vqYaTZLt63ofkRPk6C090bA5BbRurOHPH8JAsIRn6s0zxUPBU814EYJm0vRSZChbqKC6bcUxLDE1h0Gyfg8aVRGCmvGcU7e+teZEF35mS32deM+Di+PAprjPx/+y3PvntFAT0tne5yu37EJONf0t+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443996; c=relaxed/simple;
	bh=H+1zd/S6KU3FxonjGegQc9huOZQkI1YXzzFvdTSf87Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r+jRR/5dpjZI8+yxPOW4MHPaimdEerUglClLAuOmehTkrI4kmVsPxYloVnbvTxW57+4kIYT5knzfGm/woZqi0EQoSdfDpEjCOtrYFqpGsx2qGtX0n/YvOsNRdMmYeSie8mD30xpKK8jA1BEI88ARWZGb+VqnIfmNA7+uBMz8a9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=q3fNVl7V; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso43605905e9.3
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 10:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783443991; x=1784048791; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uRIESKAVbFxQF/LwbkJUhAlvRl7PTf92sUz6RcBpAQ0=;
        b=q3fNVl7V9aPNONS2i5GmhtgFPDiekJDdtMfr/7MyEtZhVwHyhYiG6xlAu+QVOk9RNv
         tLikrzkZnWSGXFpJUWCidPdB5MR4LtvlswXZ4ATetwqwi0b8RFtoSGtl1WWUpvMFXAlP
         yPD0o2GkYnjjs+OgqzLtYAmIbLVI6gcpgs1IujQGzpape70EagB+7FtBc3X0KKy/eosL
         6lNmdJGOuROof7cwyoGTyAU2PnGbveUiZ2lmEMXGMO0qCX24OLcyDSF8lvIcCM6+7WCG
         J/oGKbLcuOokzh8rEuaMqFGFkTKVbiC1FOjMoikxuRBjFXR6MS/1+aXOMpL9svLNxGoy
         FZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443991; x=1784048791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uRIESKAVbFxQF/LwbkJUhAlvRl7PTf92sUz6RcBpAQ0=;
        b=d1wPchvbtQT1GJUaFr75JTKoEyf6fvPNt5GPbqo766rk4NPIpai9QleR7frswW05Sp
         yLxN6FChhPpkTFjjvh3VoYXxE4Xr2CH4iruxSlf4uktzbqGLyovI8/n6Kr8b1GcacWXm
         zrgO4qVfgY0pv8ap+RUZinQ0EO5yPDHjt3jZ1KElYIpYYa7JZLtdEA6E9PaA5r1St3ot
         NgU+GILQL6AKyOm7lg8hTV7cJOBJiQUDwl/03Xf1/UyM+9izeUcYr0dN6mWWw5Ykhsru
         V0oVv3ZlvLyOKRO/A0KiNgMw8XNWyOe+qlDPR7kVJBJxYGC/qDWU6rdYLgUy3C7UTmP2
         XdmQ==
X-Gm-Message-State: AOJu0YwBWm0pbySHGwKJ4NnwIy+6G3d35hdH4ubUWSq9PHXXKPlpHYQg
	D8HIRrdwgVkuWAw8Q4DKqXdSDhWFsxOxDjJpcQT5LeKNk0qGUJDd3C/S1qMJfdHAHv0=
X-Gm-Gg: AfdE7ck02r0V6Uf9YW4lIO2zs1mmcOJoSpbOYajlFH31TPBc3Ghcn++dw9NNgibhzom
	N3X25D/dMmDiJcKqRJPWg7EK51wQnr0dEKbxBzNzkPido9qsEDybbHhmLFCpG8lYSQomilF14Hd
	tbA13WNA4/4DAsiSB5/iCb3jiz1Ul4dzNDx6O2oh/sahHlpnEilxkpDu/c06dNrbMTpFtXz+F9l
	nzmzFFWvDfvVyDcwKvgrcSJfuIFgIbWqCf4jofTowMwpuA5iql8Lysum5qL3Y25Mtqy9HbWcRWb
	T3v79oJYtj0J7ckYHaZQPC0A1dF0OPkuoTwtm1jQNs4yam/AWBxHnwp/8BN6y+Fdu3AUisC3BS6
	ybs8LJPjgYXz0LYrHnYKsmZYiXoBT60Z7EYeT4eSDDDNy/llmFG+prZvAD8O751AjLJ7aSuBQPD
	AwF4qQOwYKNq+MlhMejaJJtV8ircQ+hR2m/di8xMEEk6FwAirTKQaCxz70a1i76seF
X-Received: by 2002:a05:600c:154d:b0:493:b8d9:f28b with SMTP id 5b1f17b1804b1-493df09313bmr76527035e9.23.1783443991484;
        Tue, 07 Jul 2026 10:06:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm33644487f8f.35.2026.07.07.10.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:06:30 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 07 Jul 2026 18:04:51 +0100
Subject: [PATCH v2 19/20] media: imx355: Switch to using the subdev state
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-media-imx355-v2-19-1683ec07b897@raspberrypi.com>
References: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
In-Reply-To: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
To: Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66894-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:tian.shu.qiu@intel.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C5DF71E224

The subdev state is now preferred rather than handling crop
and format within the driver state, so switch the driver to
using it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 169 +++++++++++++--------------------------------
 1 file changed, 49 insertions(+), 120 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 10b9cf56e8c5..bb620ebb074f 100644
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
@@ -592,35 +585,11 @@ static u32 imx355_get_format_code(struct imx355 *imx355)
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
@@ -628,6 +597,9 @@ static int imx355_set_ctrl(struct v4l2_ctrl *ctrl)
 	s64 max;
 	int ret;
 
+	state = v4l2_subdev_get_locked_active_state(&imx355->sd);
+	format = v4l2_subdev_state_get_format(state, 0);
+
 	/* Propagate change of current control to all related controls */
 	switch (ctrl->id) {
 	case V4L2_CID_VBLANK:
@@ -700,9 +672,7 @@ static int imx355_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->index > 0)
 		return -EINVAL;
 
-	mutex_lock(&imx355->mutex);
 	code->code = imx355_get_format_code(imx355);
-	mutex_unlock(&imx355->mutex);
 
 	return 0;
 }
@@ -716,12 +686,9 @@ static int imx355_enum_frame_size(struct v4l2_subdev *sd,
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
@@ -745,36 +712,6 @@ static void imx355_update_pad_format(struct imx355 *imx355,
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
@@ -783,12 +720,11 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 	struct imx355 *imx355 = to_imx355(sd);
 	const struct imx355_mode *mode;
 	struct v4l2_mbus_framefmt *framefmt;
+	struct v4l2_rect *crop;
 	s32 vblank_def;
 	s64 h_blank;
 	u32 height;
 
-	mutex_lock(&imx355->mutex);
-
 	/*
 	 * Only one bayer order is supported.
 	 * It depends on the flip settings.
@@ -800,10 +736,18 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 				      width, height,
 				      fmt->format.width, fmt->format.height);
 	imx355_update_pad_format(imx355, mode, fmt);
-	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
-		*framefmt = fmt->format;
-	} else {
+
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
@@ -822,41 +766,17 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
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
@@ -871,6 +791,21 @@ static int imx355_get_selection(struct v4l2_subdev *sd,
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
@@ -958,12 +893,10 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 	struct imx355 *imx355 = to_imx355(sd);
 	int ret = 0;
 
-	mutex_lock(&imx355->mutex);
-
 	if (enable) {
 		ret = pm_runtime_resume_and_get(imx355->dev);
 		if (ret < 0)
-			goto err_unlock;
+			return ret;
 
 		/*
 		 * Apply default & customized values
@@ -981,14 +914,10 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 	__v4l2_ctrl_grab(imx355->vflip, enable);
 	__v4l2_ctrl_grab(imx355->hflip, enable);
 
-	mutex_unlock(&imx355->mutex);
-
 	return ret;
 
 err_rpm_put:
 	pm_runtime_put_autosuspend(imx355->dev);
-err_unlock:
-	mutex_unlock(&imx355->mutex);
 
 	return ret;
 }
@@ -1022,7 +951,7 @@ static const struct v4l2_subdev_video_ops imx355_video_ops = {
 
 static const struct v4l2_subdev_pad_ops imx355_pad_ops = {
 	.enum_mbus_code = imx355_enum_mbus_code,
-	.get_fmt = imx355_get_pad_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = imx355_set_pad_format,
 	.enum_frame_size = imx355_enum_frame_size,
 	.get_selection = imx355_get_selection,
@@ -1039,7 +968,7 @@ static const struct media_entity_operations imx355_subdev_entity_ops = {
 };
 
 static const struct v4l2_subdev_internal_ops imx355_internal_ops = {
-	.open = imx355_open,
+	.init_state = imx355_entity_init_state,
 };
 
 static int imx355_power_off(struct device *dev)
@@ -1105,7 +1034,6 @@ static int imx355_init_controls(struct imx355 *imx355)
 	if (ret)
 		return ret;
 
-	ctrl_hdlr->lock = &imx355->mutex;
 	imx355->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx355_ctrl_ops,
 						   V4L2_CID_LINK_FREQ, 0, 0,
 						   &imx355->hwcfg->link_freq_menu);
@@ -1254,8 +1182,6 @@ static int imx355_probe(struct i2c_client *client)
 
 	imx355->dev = &client->dev;
 
-	mutex_init(&imx355->mutex);
-
 	imx355->regmap = devm_cci_regmap_init_i2c(client, 16);
 	if (IS_ERR(imx355->regmap)) {
 		dev_err(imx355->dev, "Unable to initialize I2C\n");
@@ -1285,7 +1211,7 @@ static int imx355_probe(struct i2c_client *client)
 					    &imx355->supplies);
 	if (ret) {
 		dev_err_probe(imx355->dev, ret, "could not get regulators");
-		goto error_probe;
+		return ret;
 	}
 
 	imx355->reset_gpio = devm_gpiod_get_optional(imx355->dev, "reset",
@@ -1293,7 +1219,7 @@ static int imx355_probe(struct i2c_client *client)
 	if (IS_ERR(imx355->reset_gpio)) {
 		ret = dev_err_probe(imx355->dev, PTR_ERR(imx355->reset_gpio),
 				    "failed to get gpios");
-		goto error_probe;
+		return ret;
 	}
 
 	/* Initialize subdev */
@@ -1302,13 +1228,12 @@ static int imx355_probe(struct i2c_client *client)
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
@@ -1341,6 +1266,13 @@ static int imx355_probe(struct i2c_client *client)
 		goto error_handler_free;
 	}
 
+	imx355->sd.state_lock = imx355->ctrl_handler.lock;
+	ret = v4l2_subdev_init_finalize(&imx355->sd);
+	if (ret < 0) {
+		dev_err_probe(imx355->dev, ret, "subdev init error\n");
+		goto error_handler_free;
+	}
+
 	/*
 	 * Device is already turned on by i2c-core with ACPI domain PM.
 	 * Enable runtime PM and turn off the device.
@@ -1360,6 +1292,7 @@ static int imx355_probe(struct i2c_client *client)
 error_media_entity_runtime_pm:
 	pm_runtime_disable(imx355->dev);
 	pm_runtime_set_suspended(imx355->dev);
+	v4l2_subdev_cleanup(&imx355->sd);
 	media_entity_cleanup(&imx355->sd.entity);
 
 error_handler_free:
@@ -1368,9 +1301,6 @@ static int imx355_probe(struct i2c_client *client)
 error_power_off:
 	imx355_power_off(imx355->dev);
 
-error_probe:
-	mutex_destroy(&imx355->mutex);
-
 	return ret;
 }
 
@@ -1380,6 +1310,7 @@ static void imx355_remove(struct i2c_client *client)
 	struct imx355 *imx355 = to_imx355(sd);
 
 	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
@@ -1389,8 +1320,6 @@ static void imx355_remove(struct i2c_client *client)
 		imx355_power_off(imx355->dev);
 		pm_runtime_set_suspended(imx355->dev);
 	}
-
-	mutex_destroy(&imx355->mutex);
 }
 
 static const struct acpi_device_id imx355_acpi_ids[] __maybe_unused = {

-- 
2.34.1


