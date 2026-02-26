Return-Path: <linux-media+bounces-53502-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOnaHuZNoGnvhwQAu9opvQ
	(envelope-from <linux-media+bounces-53502-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 14:43:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F6B1A6D62
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 14:43:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C0D3030A5CFA
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 13:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D07364EB6;
	Thu, 26 Feb 2026 13:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="INDp/tMp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76D9362134
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 13:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772113074; cv=none; b=uCQ5lVUXwFeThUiHhfHDeOZohlCuvLESp/kYir6cuvIoS7SvKHGvV8CLFBwQRcaIP58ZSnE+/YBafFmolE+fvBs5Rv+vUT4sBgIXwsZkEcjRJYravkSkS9+LCF7/P1FSB0IJMeH7paOtcQ7IJc3mGTA1A0cs2uxsVry5WYbWMiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772113074; c=relaxed/simple;
	bh=8lvmyk5SJ3ITsfx5DuuH4GFi9C0p3NH5iQa0vqle2MY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i66Vmp3DXewYl1Vf2/hWu3m6Qbv2EMw1YC/ZZu6B71V0RYmjvs//X1lbL7Oiy/NVpMKOUgOuin6yMQ8N437tOx0ZgAqSEVgGto248Ylp2oiaNKNkhRYdB6hOa46tcQuQ21INzlwW9O+1zYTkRlh43XxUiBUdNHIOMQ6zTrP7HH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=INDp/tMp; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59e58404f28so117088e87.2
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 05:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772113071; x=1772717871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PP1eLMF3g+6gwB95yPi0VipRj9cXqeHr5aplCISf/c4=;
        b=INDp/tMpk05cbKsmaE0VpeAzesqYGqf6nYyP63xcP4AENQ+Vj/6Cs7JQJTjSOpMvdK
         NBsrpoFj0rJBM59TKShZ2gy7eXJmVC/I+Z003KoDsEQAWP9+bF0KAuAzUE3VQ2Z6VRgo
         YJ9U9bYMnp46dBH52wIaBOD85CvjbNLORFiGTWlRBKYXiev5lI/ebaG+Cjpt+bA7fPTw
         KYz7EALMRaVrQQeO2Zg3XCiuRBItXLHxRDQeC8SQ2NFYAeE2MyueZ2wqdtPtNt605bQB
         KooUj7xllVStsZmImotDVSUvHqjv8zBwouhlB2oaLTeiiP4yeUHJqyGMjbY2p+KiBLBu
         KzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772113071; x=1772717871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PP1eLMF3g+6gwB95yPi0VipRj9cXqeHr5aplCISf/c4=;
        b=xTjLOPRt7Z927JwkIOMoVq4X2ttc3jG/ghaCjGeo0y/Oj3oaNtQdvXfCNzuFuw3QZ2
         HkHyO4XMjnpzwSJMkaHMqLxrF+2HQob1rtJx0ZasYjw+O7UoGBUoej47Be1JA+5vhzan
         gxkZGBJImS0opZ8OC7yiWeAxDtFH0BcrtguNkAhk0SbN4v4ujzRDmvy08tTI+XdnBOUR
         5+oqvQfJalt3EhIPejdtnwOg1rqalVmjLqcG9J1vrAaaFuaHo2PmlKpWHKlVRdoJewGm
         uR6WrCSKDAIQ7QZ0+VcGP/IBwfxzxOPOdrG64J7pMQ8m8xd0HjrFjA9U1fAsU0s4gQ0d
         Fm/Q==
X-Forwarded-Encrypted: i=1; AJvYcCX/Y1DKBtFzZ9lH7kzOVZFSVsO+3EfQ9EQT8n9x7EmUoZuE8Ge3acMj8yW4slkYhtOnmfyrLGevk1Nyyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBZ+M/dfDcfskgeDBBf5NUNRYNKv6ABPHvDJkk7P0QbUQcifcJ
	qLY/cnQH6oAaxRqucShOaCJNR7FlOumcmJPC7aj1j9iKSj1bp0C3kq9yYI8gw5n98EE=
X-Gm-Gg: ATEYQzzCMwkA1Stxsb2/ZB4292TgeMnfzFjdfRt1n37J8nySi1n6PNz5jkC66NhooQE
	KJXbmQe9cD7k0SvxOUv+A4WTSYpEjzHlfGQvEkuVtwJuGg0NDluaicAt3urV7eHsmTgA7bm6KGe
	+ul96xmb7Rq4InVUC1jU76EerehClN6WE3aRnqxWOxuR1nwL9N/bm5p7bDRbjF8S9ltKYfy7H3F
	BpOUu38WmSDBMqukKFXVeKN5N0HqhJCkBNEZbIEORurSEgWEcdqXIZDYNpCZfb1Dht7rga3Y1w8
	d0BS9lRewvzFMYhHNYMgopsGEEVnrZ1sdVw110EWrYCiRdDs4rsDUgVmKqSvYAAMFQNbr+lbLK5
	DxqtVcxcBC66a63rhEbpCj8q+nzNbLgs8Ii9cIBPkKNxdeRT/3nurrfvK2XhqdOA8DxhLjCcfIU
	7VF5E9EdywPaMRuzKRw1PokZJyIpDxHArekQmg9uKzolg0s3xsmA1P7XPwMnBEbPcrRA==
X-Received: by 2002:a05:651c:211d:b0:387:170:73e9 with SMTP id 38308e7fff4ca-389a5ba5af5mr33986221fa.4.1772113070980;
        Thu, 26 Feb 2026 05:37:50 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f302292bsm6572041fa.45.2026.02.26.05.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 05:37:50 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Shawn Tu <shawnx.tu@intel.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 6/6] media: i2c: og01a1b: Add support of 8-bit media bus format
Date: Thu, 26 Feb 2026 15:37:39 +0200
Message-ID: <20260226133739.4050870-7-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260226133739.4050870-1-vladimir.zapolskiy@linaro.org>
References: <20260226133739.4050870-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53502-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: 21F6B1A6D62
X-Rspamd-Action: no action

Omnivision OG01A1B monochrome image sensor supports 8-bit and 10-bit
output formats, add support of 8-bit Y8 format to the driver.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/og01a1b.c | 97 ++++++++++++++++++++++---------------
 1 file changed, 58 insertions(+), 39 deletions(-)

diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index 58531ab8f87d..0ccb03f05734 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -18,7 +18,6 @@
 #define OG01A1B_SCLK			120000000LL
 #define OG01A1B_MCLK			19200000
 #define OG01A1B_DATA_LANES		2
-#define OG01A1B_RGB_DEPTH		10
 
 #define OG01A1B_REG_CHIP_ID		CCI_REG24(0x300a)
 #define OG01A1B_CHIP_ID			0x470141
@@ -98,6 +97,11 @@ struct og01a1b_mode {
 	const struct og01a1b_reg_list reg_list;
 };
 
+static const u32 og01a1b_mbus_formats[] = {
+	MEDIA_BUS_FMT_Y10_1X10,
+	MEDIA_BUS_FMT_Y8_1X8,
+};
+
 static const struct cci_reg_sequence mipi_data_rate_1000mbps[] = {
 	{ CCI_REG8(0x0103), 0x01 },
 	{ CCI_REG8(0x0303), 0x02 },
@@ -173,7 +177,6 @@ static const struct cci_reg_sequence mode_1280x1024_regs[] = {
 	{ CCI_REG8(0x3639), 0x38 },
 	{ CCI_REG8(0x363f), 0x09 },
 	{ CCI_REG8(0x3640), 0x17 },
-	{ CCI_REG8(0x3662), 0x04 },
 	{ CCI_REG8(0x3665), 0x80 },
 	{ CCI_REG8(0x3670), 0x68 },
 	{ CCI_REG8(0x3674), 0x00 },
@@ -427,20 +430,23 @@ struct og01a1b {
 
 	/* Current mode */
 	const struct og01a1b_mode *cur_mode;
+
+	/* Selected media bus format output */
+	u32 code;
 };
 
-static u64 to_pixel_rate(u32 f_index)
+static u64 to_pixel_rate(u32 f_index, u32 bpp)
 {
 	u64 pixel_rate = link_freq_menu_items[f_index] * 2 * OG01A1B_DATA_LANES;
 
-	do_div(pixel_rate, OG01A1B_RGB_DEPTH);
+	do_div(pixel_rate, bpp);
 
 	return pixel_rate;
 }
 
-static u64 to_pixels_per_line(u32 hts, u32 f_index)
+static u64 to_pixels_per_line(u32 hts, u32 f_index, u32 bpp)
 {
-	u64 ppl = hts * to_pixel_rate(f_index);
+	u64 ppl = hts * to_pixel_rate(f_index, bpp);
 
 	do_div(ppl, OG01A1B_SCLK);
 
@@ -522,6 +528,7 @@ static int og01a1b_init_controls(struct og01a1b *og01a1b)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	s64 exposure_max, h_blank;
+	u32 bpp;
 	int ret;
 
 	ctrl_hdlr = &og01a1b->ctrl_handler;
@@ -538,13 +545,12 @@ static int og01a1b_init_controls(struct og01a1b *og01a1b)
 	if (og01a1b->link_freq)
 		og01a1b->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
+	bpp = (og01a1b->code == MEDIA_BUS_FMT_Y10_1X10 ? 10 : 8);
 	og01a1b->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &og01a1b_ctrl_ops,
-						V4L2_CID_PIXEL_RATE, 0,
-						to_pixel_rate
-						(OG01A1B_LINK_FREQ_1000MBPS),
-						1,
-						to_pixel_rate
-						(OG01A1B_LINK_FREQ_1000MBPS));
+				V4L2_CID_PIXEL_RATE, 0,
+				to_pixel_rate(OG01A1B_LINK_FREQ_1000MBPS, bpp),
+				1,
+				to_pixel_rate(OG01A1B_LINK_FREQ_1000MBPS, bpp));
 	og01a1b->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &og01a1b_ctrl_ops,
 					    V4L2_CID_VBLANK,
 					    og01a1b->cur_mode->vts_min -
@@ -554,7 +560,7 @@ static int og01a1b_init_controls(struct og01a1b *og01a1b)
 					    og01a1b->cur_mode->vts_def -
 					    og01a1b->cur_mode->height);
 	h_blank = to_pixels_per_line(og01a1b->cur_mode->hts,
-				     og01a1b->cur_mode->link_freq_index) -
+				     og01a1b->cur_mode->link_freq_index, bpp) -
 				     og01a1b->cur_mode->width;
 	og01a1b->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &og01a1b_ctrl_ops,
 					    V4L2_CID_HBLANK, h_blank, h_blank,
@@ -594,7 +600,6 @@ static void og01a1b_update_pad_format(const struct og01a1b_mode *mode,
 {
 	fmt->width = mode->width;
 	fmt->height = mode->height;
-	fmt->code = MEDIA_BUS_FMT_Y10_1X10;
 	fmt->field = V4L2_FIELD_NONE;
 }
 
@@ -627,6 +632,14 @@ static int og01a1b_enable_streams(struct v4l2_subdev *sd,
 		return ret;
 	}
 
+	ret = cci_write(og01a1b->regmap, CCI_REG8(0x3662),
+			(og01a1b->code == MEDIA_BUS_FMT_Y10_1X10 ? 0x4 : 0x6),
+			NULL);
+	if (ret) {
+		dev_err(og01a1b->dev, "failed to set output format: %d\n", ret);
+		return ret;
+	}
+
 	ret = __v4l2_ctrl_handler_setup(og01a1b->sd.ctrl_handler);
 	if (ret)
 		goto error;
@@ -669,7 +682,7 @@ static int og01a1b_set_format(struct v4l2_subdev *sd,
 {
 	struct og01a1b *og01a1b = to_og01a1b(sd);
 	const struct og01a1b_mode *mode;
-	s32 vblank_def, h_blank;
+	s32 vblank_def, h_blank, bpp;
 
 	mode = v4l2_find_nearest_size(supported_modes,
 				      ARRAY_SIZE(supported_modes), width,
@@ -677,26 +690,30 @@ static int og01a1b_set_format(struct v4l2_subdev *sd,
 				      fmt->format.height);
 
 	og01a1b_update_pad_format(mode, &fmt->format);
-	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
-	} else {
-		og01a1b->cur_mode = mode;
-		__v4l2_ctrl_s_ctrl(og01a1b->link_freq, mode->link_freq_index);
-		__v4l2_ctrl_s_ctrl_int64(og01a1b->pixel_rate,
-					 to_pixel_rate(mode->link_freq_index));
-
-		/* Update limits and set FPS to default */
-		vblank_def = mode->vts_def - mode->height;
-		__v4l2_ctrl_modify_range(og01a1b->vblank,
-					 mode->vts_min - mode->height,
-					 OG01A1B_VTS_MAX - mode->height, 1,
-					 vblank_def);
-		__v4l2_ctrl_s_ctrl(og01a1b->vblank, vblank_def);
-		h_blank = to_pixels_per_line(mode->hts, mode->link_freq_index) -
-			  mode->width;
-		__v4l2_ctrl_modify_range(og01a1b->hblank, h_blank, h_blank, 1,
-					 h_blank);
-	}
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
+		goto set_format;
+
+	bpp = (fmt->format.code == MEDIA_BUS_FMT_Y10_1X10 ? 10 : 8);
+	__v4l2_ctrl_s_ctrl(og01a1b->link_freq, mode->link_freq_index);
+	__v4l2_ctrl_s_ctrl_int64(og01a1b->pixel_rate,
+				 to_pixel_rate(mode->link_freq_index, bpp));
+
+	/* Update limits and set FPS to default */
+	vblank_def = mode->vts_def - mode->height;
+	__v4l2_ctrl_modify_range(og01a1b->vblank,
+				 mode->vts_min - mode->height,
+				 OG01A1B_VTS_MAX - mode->height, 1, vblank_def);
+	__v4l2_ctrl_s_ctrl(og01a1b->vblank, vblank_def);
+	h_blank = to_pixels_per_line(mode->hts, mode->link_freq_index,
+				     bpp) - mode->width;
+	__v4l2_ctrl_modify_range(og01a1b->hblank, h_blank, h_blank, 1, h_blank);
+
+	og01a1b->cur_mode = mode;
+	og01a1b->code = fmt->format.code;
+
+set_format:
+	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
 
 	return 0;
 }
@@ -705,10 +722,10 @@ static int og01a1b_enum_mbus_code(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
-	if (code->index > 0)
+	if (code->index > ARRAY_SIZE(og01a1b_mbus_formats) - 1)
 		return -EINVAL;
 
-	code->code = MEDIA_BUS_FMT_Y10_1X10;
+	code->code = og01a1b_mbus_formats[code->index];
 
 	return 0;
 }
@@ -720,7 +737,8 @@ static int og01a1b_enum_frame_size(struct v4l2_subdev *sd,
 	if (fse->index >= ARRAY_SIZE(supported_modes))
 		return -EINVAL;
 
-	if (fse->code != MEDIA_BUS_FMT_Y10_1X10)
+	if (fse->code != MEDIA_BUS_FMT_Y10_1X10 &&
+	    fse->code != MEDIA_BUS_FMT_Y8_1X8)
 		return -EINVAL;
 
 	fse->min_width = supported_modes[fse->index].width;
@@ -741,7 +759,7 @@ static int og01a1b_init_state(struct v4l2_subdev *sd,
 		.format = {
 			.width = og01a1b->cur_mode->width,
 			.height = og01a1b->cur_mode->height,
-			.code = MEDIA_BUS_FMT_Y10_1X10,
+			.code = og01a1b->code,
 		},
 	};
 
@@ -1032,6 +1050,7 @@ static int og01a1b_probe(struct i2c_client *client)
 	}
 
 	og01a1b->cur_mode = &supported_modes[0];
+	og01a1b->code = og01a1b_mbus_formats[0];
 	ret = og01a1b_init_controls(og01a1b);
 	if (ret) {
 		dev_err(og01a1b->dev, "failed to init controls: %d", ret);
-- 
2.49.0


