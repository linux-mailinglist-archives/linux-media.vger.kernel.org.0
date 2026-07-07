Return-Path: <linux-media+bounces-66895-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Aeu3LeMzTWouwgEAu9opvQ
	(envelope-from <linux-media+bounces-66895-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:14:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A123071E2F7
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:14:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=po1aQAMN;
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66895-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66895-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 177F0303B09E
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 17:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A45EB47AF6D;
	Tue,  7 Jul 2026 17:06:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F0F47F2CB
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 17:06:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443996; cv=none; b=lDpp64ORLGQKTUPohzwpth8O7QoAzEplAILDFogDNSsOp6GfdLeL0pxGowP/y0yQtVEkBR9zYLugN5jsh588IUiWg0uDeoF2vXjrH2SB9zWgvFYoV8i+ioqYLVBxJTw0QrF5p5vctGZ8yHwxcYfzbhlHet8GCbkY5Edm2kIIvYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443996; c=relaxed/simple;
	bh=jFOEf19e06M0+Vzxyx5t50uWBqed5Yd4Wz4pvn2g1aM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M5zSQaskSYR9bR+/vqrxmnA87+tkOj7SKLWtr7H5k5HgCJ9mWJsyUp8oq6MApuwu7WrNbYywu0xxDQznGGda1YFlXLf0n543mkJFyklaT1ADRBfAyIWIk1vlaWjhuQUqqHcxyz0PehvJ6EvpYUc2zi+yUGNZYeA0EQIomoBU1o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=po1aQAMN; arc=none smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47362928f65so4202930f8f.2
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 10:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783443992; x=1784048792; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w81rZtSU92dE1ZJ6hHK0rUFmnz6gwlLUnyR4+bLsAV0=;
        b=po1aQAMND2uJesLvjOT1QncpPsW8NHSvJp7CNHlArGmMItb0sAPuz54KgT9QAG52bI
         NKXrS8nZAXrji2J88TX8jKFqqF8Jb3+SOm0zTZ6Q8/Iy0Qk+YJWu0litlJiWbrEikRIL
         F0DJyFcehJ+/PbYezZ3l8vl1szesd2dBAugaR5iIgR9u99cmLz8BAEikpNTpEJG8tjFm
         o2g6p1aMawr95BHRidfA81kUdHrxAjAlDQ5NxOalyHTSh4bIazdWrG65QKe8xIXJPEDw
         eCIaldROtDlHuJVAPAy4CULp51a9r4m0/mhuwhe5G2VfA1YEGxJPJNYMQmrZaL1qHlUL
         EPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443992; x=1784048792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w81rZtSU92dE1ZJ6hHK0rUFmnz6gwlLUnyR4+bLsAV0=;
        b=fJBGm96anMY8g+Ldnn6XxddC0HbFXJJiMhQkCiTZgMsSHHgJsVqub0voKLKsXBchYX
         dCT0FiwmbegKRC3DUjRxZ5i2l+PKobIqbYBfHGUG01l74RkQiy8in1cqjYwJIvM61PIC
         /08LpUG5PirxV1eLZm2CkZCFqrSM9TBNtY3MO2xiD5sfetNaypXW50DT1d+l78oDd4EO
         PHFixABqv76cVRE6OqVZvDmOwxTZeRZIRdEovD6RpvUwrAUiRgvX3Og8rW2H3PQsfGvs
         s70Vi7gpN2Zrx2kF4HK2LDaNIe61A/uyXVwMlFlmbM7LlO1BT/XkKSyr4i7rNtBKUfYw
         X2IQ==
X-Gm-Message-State: AOJu0YxhSvr9quYCemnDN6q4NOhyTXVurUmnMxHchlV0nuks5YOJH/Ti
	IoOBRHr5D5kh08RLB0G8+ryPSQH2Aw6MiVQGd1sKvwJjIl0X747WLFmWkCsu+hmlMnI=
X-Gm-Gg: AfdE7ckczOF9WpZxadOrLwgeCM/W/J5wWF531pLha4hg1ttK4uKkQflbaMxLJcwutkC
	2QeHNW0OiHsqlpKIJdv6zQ2Ix3Hpq7Y1txkx4vG9tVF66CKJaQHbViu7/PiNPKm8UqwMswbedr5
	+tUPE1+2nmoFAhtw2ieamLWfelx7W5KUUoXY9skTL8Xn9MUmL53kTJTxj0LMiFxL3nw7xbyymzh
	+jVPPL8BJB6Wdwfq0XuZHhhsDBfsyS0jS1LbuToBY19xadjXpLU7Cm/jqCOg4d595fg/OXVdros
	4KqpiUfjcnrAzYQCWTEALXG1xkGra7PDSmRvDn9Fvrt8Ca1+b8o3tmPtdVpunDOd2hV89cnzQei
	mbaraLt2GuCHqlBe4ZOYGO0fwgIWSnRph1KQgRe0vU9n8Pp6kN54eUzVgeKJ3HnGpe6ssXYKiEW
	CMsQPJzsbsRsYbyXBPAU0m59k/tZ+XZFB6iY3EDIhL5MkWRY01weiOa/67Z5iIfw5A
X-Received: by 2002:adf:e387:0:b0:475:c578:b619 with SMTP id ffacd0b85a97d-47de6644b64mr5482940f8f.30.1783443992350;
        Tue, 07 Jul 2026 10:06:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm33644487f8f.35.2026.07.07.10.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:06:31 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 07 Jul 2026 18:04:52 +0100
Subject: [PATCH v2 20/20] media: imx355: Remove storing cur_mode in the
 state
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-media-imx355-v2-20-1683ec07b897@raspberrypi.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66895-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:tian.shu.qiu@intel.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A123071E2F7

All the information for the mode is now stored within
the subdev state, so configure the sensor based on that.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 65 ++++++++++++++++++++++------------------------
 1 file changed, 31 insertions(+), 34 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index bb620ebb074f..f31833e5d1d1 100644
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
 
@@ -594,6 +591,8 @@ static int imx355_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct imx355 *imx355 = container_of(ctrl->handler,
 					     struct imx355, ctrl_handler);
+	const struct v4l2_mbus_framefmt *format = NULL;
+	struct v4l2_subdev_state *state;
 	s64 max;
 	int ret;
 
@@ -604,7 +603,7 @@ static int imx355_set_ctrl(struct v4l2_ctrl *ctrl)
 	switch (ctrl->id) {
 	case V4L2_CID_VBLANK:
 		/* Update max exposure while meeting expected vblanking */
-		max = imx355->cur_mode->height + ctrl->val - IMX355_EXPOSURE_OFFSET;
+		max = format->height + ctrl->val - IMX355_EXPOSURE_OFFSET;
 		__v4l2_ctrl_modify_range(imx355->exposure,
 					 imx355->exposure->minimum,
 					 max, imx355->exposure->step, max);
@@ -635,7 +634,7 @@ static int imx355_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_VBLANK:
 		/* Update FLL that meets expected vertical blanking */
 		ret = cci_write(imx355->regmap, IMX355_REG_FLL,
-				imx355->cur_mode->height + ctrl->val, NULL);
+				format->height + ctrl->val, NULL);
 		break;
 	case V4L2_CID_TEST_PATTERN:
 		ret = cci_write(imx355->regmap, IMX355_REG_TEST_PATTERN,
@@ -721,9 +720,7 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 	const struct imx355_mode *mode;
 	struct v4l2_mbus_framefmt *framefmt;
 	struct v4l2_rect *crop;
-	s32 vblank_def;
 	s64 h_blank;
-	u32 height;
 
 	/*
 	 * Only one bayer order is supported.
@@ -748,16 +745,14 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
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
@@ -809,9 +804,11 @@ static int imx355_entity_init_state(struct v4l2_subdev *subdev,
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
@@ -820,25 +817,29 @@ static int imx355_start_streaming(struct imx355 *imx355)
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
@@ -869,7 +870,7 @@ static int imx355_start_streaming(struct imx355 *imx355)
 
 	/* set line length */
 	cci_write(imx355->regmap, IMX355_REG_LLP,
-		  imx355->hblank->val + imx355->cur_mode->width, &ret);
+		  imx355->hblank->val + fmt->width, &ret);
 
 	/* Apply customized values from user */
 	if (!ret)
@@ -1022,11 +1023,11 @@ static int imx355_init_controls(struct imx355 *imx355)
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
@@ -1048,7 +1049,6 @@ static int imx355_init_controls(struct imx355 *imx355)
 			  pixel_rate, pixel_rate, 1, pixel_rate);
 
 	/* Initialize vblank/hblank/exposure parameters based on current mode */
-	mode = imx355->cur_mode;
 	vblank_def = mode->fll_def - mode->height;
 	imx355->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops,
 					   V4L2_CID_VBLANK, IMX355_VBLANK_MIN,
@@ -1242,9 +1242,6 @@ static int imx355_probe(struct i2c_client *client)
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


