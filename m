Return-Path: <linux-media+bounces-67025-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1tPaHUxnTmo1MAIAu9opvQ
	(envelope-from <linux-media+bounces-67025-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:05:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B85727BE1
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:05:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=gDL1S+W+;
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67025-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67025-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08E033072AE9
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 14:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 720F44CA297;
	Wed,  8 Jul 2026 14:49:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740C64963D5
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 14:49:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522176; cv=none; b=Kcf8F4WN3G5TXpmTnF6CYe1aIYbJm11cVi92a3RwTeEUsRb2iMXCvfBm59lG2TcjC1gAkEDnqlqOPNESbKS2KcwOgPV1QlDFSLycbC76zRDEUkAQZ8CVcuqLV2Aid1R5TpggaY4yX0okhGeKkDJ5sgPVNx0fy71GaOTJHiWJl8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522176; c=relaxed/simple;
	bh=V7cfXfus1wMTH8uUlTulTCFw9RvrshHM+7AA6flR5yk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gPYaLo1WVnXQh1PMV9bAihV/1ibLxNfSW9RIdhQkYFIy9HWS+Lp2bvRXPeYwvS5XQYgPu+4AETDWlzYZJyGCnkdXhR9PtwuawTIjguW6j9xIauVeqF+QXx2UsMdzHsZgwv2pQjRDhXymdT/hVeYNb1LxPcjZDegwm8OfqA7dXwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=gDL1S+W+; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so6090395e9.3
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 07:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522165; x=1784126965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zYXkUhjNUNGBxpm6qSdNLGjTwbO67Pooqx5qDG7FHec=;
        b=gDL1S+W+kVZMt3oTlU+dVDmIvstHM4u+kj3XUL9GiMAqnNuSfHGNeOUsowcuH4nUvB
         3Qb2vo9O/tLB9WtI2wSPqZSNJofa5SAQYUyENOTtyAx/3H9KJbZv2s3ejkFyAtfQ94Jb
         h54JjGNeJ+ZBSkLT69OBnWp/rJ7v3zm+UBFLkmwpcg1M5PrLQ0/VGxL7TwZZ/HeAe8l4
         wycXegyet3wbNh116hnEJyWtXV7eYeeMObNMUaHWtuRtWWurgj/ZWwaZVwJ1wxaPu6c6
         q6KzFQf29p5SfDWiWYMrBso6qx1gX76aVujBCR+q4LkTqtyq868sb/jw9xUI8ag48wrj
         aJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522165; x=1784126965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zYXkUhjNUNGBxpm6qSdNLGjTwbO67Pooqx5qDG7FHec=;
        b=ZZkvcTZQSNMzuuiovGAs/2lnjyGt2wN93PQXgWxaj1DcOzJcxwAO+GHfpFQfBiV+ny
         Cq8d6As+YPMiPcgUTwqrqJ6oiX07ercBtnBZy3MbQLmznUnl+riicfrbpsq4WTwPD0hy
         I/ihVpTCWbc3zn8EE+QIaON5bxDKXWbYVMvittd6ewviKMGjtwSl1nttKrucf52jv1Nq
         t0Jg8uumFE7on11Mplim/FFqIT/IA2rj2N+a/J/3QK1tj7PEZLvun7fzqjWicst4MC7b
         bNuEoBj6olNO6CYPdYqD36iTK5b4CDVSdGvBUteEu9C7loHNIuaA8h0jtJ1yD8/AYimX
         gf7Q==
X-Gm-Message-State: AOJu0Yxt0Fs+ImvGRRb57mxey9sR5ULlaT8FwfwumW02lP01NGHqfcbT
	LG/V5Ndu6kw9KcDoWRno7kGk7p/scnLAcGqmESO2DD747weT/N3BmmasmkdnPrioPLI=
X-Gm-Gg: AfdE7clT82GeW9o6cFNuFxD0ya+2RdXYpdLQ4AEXdv1Pfeki9zf11SHCyIDhe0P8rQR
	UI2jHBTKFDamLx0JofJ/kboIUv52lwz5F7GSlI1b6bKaun5LhrL5JH2apdNwG8zIEVFiDbLBRf0
	m6K6tinntGtMc+lU/O+p5NOpeXxL43ZlmSI6EH+9TUKITieu3vjBRZMYwu2vpi18HCDuTLT6mj+
	z0EkOBVMCwmNaNV+zJfe49XKRKwr8urljo8h9778C4rxOs1S6ROBEMSW58BgGpFZa3DnVupEFff
	4jbOF6+PYTUi42ZiOzirKMxJWCIio9j1Rdaek5lDgITYUrpy2rSCjKLDAXs/9cMqU8428gBpYRI
	4XX8hyFKP0AfuN+tdFhr6pk4Aq6S5ro9wOH4i5/xqkz7LMLOJqiW35KGZwp5hY9xXmNijl7Etsp
	pD3cmlA9K0VhIYevTEebdn0bAdVbo1y4SI5oVr5hWG0DynhfFQZYMISm2JHzQMCtZQ
X-Received: by 2002:a05:600c:528c:b0:493:d21f:8f98 with SMTP id 5b1f17b1804b1-493e68de964mr30032775e9.36.1783522165093;
        Wed, 08 Jul 2026 07:49:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:24 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 08 Jul 2026 15:48:56 +0100
Subject: [PATCH v3 20/20] media: imx355: Remove storing cur_mode in the
 state
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-media-imx355-v3-20-9df386a623d7@raspberrypi.com>
References: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
In-Reply-To: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67025-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D2B85727BE1

All the information for the mode is now stored within
the subdev state, so configure the sensor based on that.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 66 ++++++++++++++++++++++------------------------
 1 file changed, 32 insertions(+), 34 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index ee012efe25bf..8e5eb5998591 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -173,9 +173,6 @@ struct imx355 {
 	struct v4l2_ctrl *vflip;
 	struct v4l2_ctrl *hflip;
 
-	/* Current mode */
-	const struct imx355_mode *cur_mode;
-
 	struct imx355_hwcfg *hwcfg;
 	const struct imx355_clk_params *clk_params;
 
@@ -607,7 +604,7 @@ static int imx355_set_ctrl(struct v4l2_ctrl *ctrl)
 	switch (ctrl->id) {
 	case V4L2_CID_VBLANK:
 		/* Update max exposure while meeting expected vblanking */
-		max = imx355->cur_mode->height + ctrl->val - IMX355_EXPOSURE_OFFSET;
+		max = format->height + ctrl->val - IMX355_EXPOSURE_OFFSET;
 		__v4l2_ctrl_modify_range(imx355->exposure,
 					 imx355->exposure->minimum,
 					 max, imx355->exposure->step, max);
@@ -638,7 +635,7 @@ static int imx355_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_VBLANK:
 		/* Update FLL that meets expected vertical blanking */
 		ret = cci_write(imx355->regmap, IMX355_REG_FLL,
-				imx355->cur_mode->height + ctrl->val, NULL);
+				format->height + ctrl->val, NULL);
 		break;
 	case V4L2_CID_TEST_PATTERN:
 		ret = cci_write(imx355->regmap, IMX355_REG_TEST_PATTERN,
@@ -724,9 +721,7 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 	const struct imx355_mode *mode;
 	struct v4l2_mbus_framefmt *framefmt;
 	struct v4l2_rect *crop;
-	s32 vblank_def;
 	s64 h_blank;
-	u32 height;
 
 	/*
 	 * Only one bayer order is supported.
@@ -750,16 +745,14 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 	crop->top = mode->crop.top;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		imx355->cur_mode = mode;
 		/* Update limits and set FPS to default */
-		height = imx355->cur_mode->height;
-		vblank_def = imx355->cur_mode->fll_def - height;
-		height = IMX355_FLL_MAX - height;
 		__v4l2_ctrl_modify_range(imx355->vblank, IMX355_VBLANK_MIN,
-					 height, 1, vblank_def);
-		__v4l2_ctrl_s_ctrl(imx355->vblank, vblank_def);
+					 IMX355_FLL_MAX - mode->height, 1,
+					 mode->fll_def - mode->height);
+		__v4l2_ctrl_s_ctrl(imx355->vblank, mode->fll_def - mode->height);
+
+		h_blank = mode->llp - mode->width;
 
-		h_blank = mode->llp - imx355->cur_mode->width;
 		/*
 		 * Currently hblank is not changeable.
 		 * So FPS control is done only by vblank.
@@ -811,9 +804,11 @@ static int imx355_entity_init_state(struct v4l2_subdev *subdev,
 /* Start streaming */
 static int imx355_start_streaming(struct imx355 *imx355)
 {
-	const struct imx355_reg_list *reg_list;
+	const struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_subdev_state *state;
 	const struct imx355_mode *mode;
 	int lane_idx = imx355->hwcfg->num_lanes == 4 ? 0 : 1;
+	struct v4l2_rect *crop;
 	u64 link_bitrate;
 	u8 binning_mode;
 	int ret = 0;
@@ -822,25 +817,29 @@ static int imx355_start_streaming(struct imx355 *imx355)
 	cci_multi_reg_write(imx355->regmap, imx355_global_regs,
 			    ARRAY_SIZE(imx355_global_regs), &ret);
 
-	/* Apply default values of current mode */
-	mode = imx355->cur_mode;
-	reg_list = &mode->reg_list;
-	cci_multi_reg_write(imx355->regmap, reg_list->regs,
-			    reg_list->num_of_regs, &ret);
+	/* Apply values of current mode */
+	state = v4l2_subdev_get_locked_active_state(&imx355->sd);
+	fmt = v4l2_subdev_state_get_format(state, 0);
+	crop = v4l2_subdev_state_get_crop(state, 0);
+	mode = v4l2_find_nearest_size(supported_modes,
+				      ARRAY_SIZE(supported_modes),
+				      width, height, fmt->width, fmt->height);
+	cci_multi_reg_write(imx355->regmap, mode->reg_list.regs,
+			    mode->reg_list.num_of_regs, &ret);
 
 	/* Set readout crop and size registers  */
-	cci_write(imx355->regmap, IMX355_REG_X_ADD_START, mode->crop.left,
+	cci_write(imx355->regmap, IMX355_REG_X_ADD_START, crop->left,
 		  &ret);
-	cci_write(imx355->regmap, IMX355_REG_Y_ADD_START, mode->crop.top, &ret);
+	cci_write(imx355->regmap, IMX355_REG_Y_ADD_START, crop->top, &ret);
 	cci_write(imx355->regmap, IMX355_REG_X_ADD_END,
-		  mode->crop.width + mode->crop.left - 1, &ret);
+		  crop->width + crop->left - 1, &ret);
 	cci_write(imx355->regmap, IMX355_REG_Y_ADD_END,
-		  mode->crop.height + mode->crop.top - 1, &ret);
-	cci_write(imx355->regmap, IMX355_REG_X_OUT_SIZE, mode->width, &ret);
-	cci_write(imx355->regmap, IMX355_REG_Y_OUT_SIZE, mode->height, &ret);
+		  crop->height + crop->top - 1, &ret);
+	cci_write(imx355->regmap, IMX355_REG_X_OUT_SIZE, fmt->width, &ret);
+	cci_write(imx355->regmap, IMX355_REG_Y_OUT_SIZE, fmt->height, &ret);
 
-	binning_mode = ((mode->crop.width / mode->width) << 4) |
-			(mode->crop.height / mode->height);
+	binning_mode = ((crop->width / fmt->width) << 4) |
+			(crop->height / fmt->height);
 	cci_write(imx355->regmap, IMX355_REG_BINNING_MODE,
 		  binning_mode == 0x11 ? 0x00 : 0x01, &ret);
 	cci_write(imx355->regmap, IMX355_REG_BINNING_TYPE, binning_mode, &ret);
@@ -871,7 +870,7 @@ static int imx355_start_streaming(struct imx355 *imx355)
 
 	/* set line length */
 	cci_write(imx355->regmap, IMX355_REG_LLP,
-		  imx355->hblank->val + imx355->cur_mode->width, &ret);
+		  imx355->hblank->val + fmt->width, &ret);
 
 	/* Apply customized values from user */
 	if (!ret)
@@ -893,6 +892,7 @@ static int imx355_stop_streaming(struct imx355 *imx355)
 static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct imx355 *imx355 = to_imx355(sd);
+	struct v4l2_subdev_state *state;
 	int ret = 0;
 
 	if (enable) {
@@ -904,7 +904,9 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 		 * Apply default & customized values
 		 * and then start streaming.
 		 */
+		state = v4l2_subdev_lock_and_get_active_state(sd);
 		ret = imx355_start_streaming(imx355);
+		v4l2_subdev_unlock_state(state);
 		if (ret)
 			goto err_rpm_put;
 	} else {
@@ -1024,11 +1026,11 @@ static int imx355_init_controls(struct imx355 *imx355)
 {
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl_handler *ctrl_hdlr;
+	const struct imx355_mode *mode = &supported_modes[0];
 	s64 exposure_max;
 	s64 vblank_def;
 	s64 hblank;
 	u64 pixel_rate;
-	const struct imx355_mode *mode;
 	int ret;
 
 	ctrl_hdlr = &imx355->ctrl_handler;
@@ -1050,7 +1052,6 @@ static int imx355_init_controls(struct imx355 *imx355)
 			  pixel_rate, pixel_rate, 1, pixel_rate);
 
 	/* Initialize vblank/hblank/exposure parameters based on current mode */
-	mode = imx355->cur_mode;
 	vblank_def = mode->fll_def - mode->height;
 	imx355->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops,
 					   V4L2_CID_VBLANK, IMX355_VBLANK_MIN,
@@ -1243,9 +1244,6 @@ static int imx355_probe(struct i2c_client *client)
 		goto error_power_off;
 	}
 
-	/* Set default mode to max resolution */
-	imx355->cur_mode = &supported_modes[0];
-
 	ret = imx355_init_controls(imx355);
 	if (ret) {
 		dev_err(imx355->dev, "failed to init controls: %d", ret);

-- 
2.34.1


