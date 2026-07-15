Return-Path: <linux-media+bounces-67668-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ixlNIph0V2rVOQEAu9opvQ
	(envelope-from <linux-media+bounces-67668-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:52:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED45675DCC4
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:52:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=ACitcf9Y;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67668-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67668-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 730A830B2844
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 11:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6C444C66E;
	Wed, 15 Jul 2026 11:44:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1C947D936
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 11:44:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115871; cv=none; b=PdjYk5g7PsWpPYxamcrns6rZbsiqeILTTcoPyfAs32M62EihczfmMcMVJ708kZvaXSW8sF9zEh9QMJ+7FKdL9BOeMkUzYxHrFPvZzxvPtz4IWWwXSYWTMetQV1IBFVbL5rkMsEJCu4A4fLJ6IydYV9LpZDtC9FCkHOpl/Mj8PCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115871; c=relaxed/simple;
	bh=8PbXzZ6aRznYpPgcJJoO2WQ6LIaGIXP91hD7KkDmk6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U1TkVHzUEQakbE9VUMPNveMQFglPqLTNNJXde1/xT62MSZ7LaJsnGxnSED+bVltBn9MHw+/mTwPomubHNUqqUrSO7N3yvJiU47dbhY4MeFYyPLHi2JZPexOuifZoO1Nr/B8cvEkzSOg1BNUIRBMNcfkZRJMs03wvs+iXxOUcsWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=ACitcf9Y; arc=none smtp.client-ip=209.85.221.53
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47122683cf3so3032811f8f.0
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 04:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115867; x=1784720667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7WYV69Q5Wdb4HS39stRpOxjww5BiVa7E3BV42f2cvng=;
        b=ACitcf9Y1PUKpftJDb16UEWLOzN5uAF5m2xm+y2+xLT3WBsq0a9POQEe3W0P6sh1Qv
         UZ9F4p4tKlnixdujFnKp09WdiRj8udvMWNwStoUz0JbkIhM/qkSdsRPiGUW7IzIXhmJ+
         sHWdunFjw1gcbMK28awACQ6qzVDj9/Nk2ZDjFsfCH/RsQLw86U4+dhtSIVLF+cfAbpYn
         S+sBlLrpx0Sd72TIO4Uo6IUk/g0YGwpLmGftau0kWW9lwIR+o8D1gtIDLUKVcPC74QTW
         0ik8XK8qH6Q+MLQc3HGH4yF1iaMe/0o8lA1SOaiNR8Um2PLs2erf4TK28xzBHgCjLAjm
         38oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115867; x=1784720667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7WYV69Q5Wdb4HS39stRpOxjww5BiVa7E3BV42f2cvng=;
        b=BNMuStsJs+1WtZ5qNwW0onASfXjHLHFYcxmZhQ5u36TzPtEQ61mjgAGcZQnLApJgoH
         ohjdGWFVDDSCXIcojB5U1FnBTbtCEvGeipJU8ZG1x83V3PcYPlDEtLk/gAqVGVz8DODB
         PTxBnOSaWlJog1rWEii7q4AzlnwnMTy1Rq5n1dwxTUf0u4WY99UuKmIg6mtiblpzXkaV
         NsdLrWGS7TB477yXLwmPbj+Lm40cWz/PhHFG6vtQCCISwbsnx00K0wjnDCsiWQd+/Oh6
         o0yDvpBp/7nOi5gF9dxz1qp8ZxerYUwqhJ3tjLdo8OmVARXXfW0q8QA5UpSUdVavyZH3
         AxMw==
X-Gm-Message-State: AOJu0YzNk+8gMBQs0ye/6vNYbaMVGbi4fHnazAlLriN5LFpbUYNZ2jlD
	q6k72kdtzPexIXIFzzkvFr+xh391LR5fvt6XNGzZAGrGiMwBEhEXWNt4L4HQeAwiiYE=
X-Gm-Gg: AfdE7clbsPdGdO/eEbFUDG+yuF2IqXbEELpTynmrJE0ozzRD9WD19n+GjtMgdy1SXUU
	Qaez/iKJ2DCTwqYiM68zuCrcFuC+HKNeV35EQMdcM2cMxGCOKVZ5JEHghRKzebe9uUjuhMwBUS0
	ZYaUrRAGxCvdzCgbw7fAMZYcHuIvFj2DPpDH2ySB0pVCR0YhmwWGoNC7Tin+H3PJsdwzLeAArnV
	HFTnmbvYDdK/UtoEM7cOgzVilRvgG30T6CFMFXNPweO9Vyq37TVFQJzawKzDpVta2u/pv0lAH46
	05ZyXUNgOP8kCBNiY1eOlCqpih03J+E4qLWLRbhVN8B8opUUoygWNzDMqHyXA8Y3KXPls8ngH1/
	3akNrJ4t4t+DR9C7Z7H+IRfH4DePezv9PVPqTH6yGZTPrXZRKGn7YLNpiAv7rg/EiAyFELMEScK
	Ahjq8UjpTA8R4AtIf8a8oxQ2NJIVtETJkFk9uxVnums32RXCsskcIKj4WCI7nwU8h1
X-Received: by 2002:a05:6000:120c:b0:478:2698:72f4 with SMTP id ffacd0b85a97d-47f46391de5mr7027400f8f.45.1784115867088;
        Wed, 15 Jul 2026 04:44:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:26 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 12:43:32 +0100
Subject: [PATCH v4 19/21] media: imx355: Support 2 lane readout
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-media-imx355-v4-19-f7f966fb9ffd@raspberrypi.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67668-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[raspberrypi.com:from_mime,raspberrypi.com:mid,raspberrypi.com:email,raspberrypi.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED45675DCC4

The sensor supports 2 or 4 lane readout, but the driver only allowed
for 4 lanes. Add 2 lane support.

The clock tree only supports single PLL mode to feed both IOP (MIPI)
and IVT (Pixel array).
2 lane mode supports a MIPI link frequency of up to 445MHz (890Mbit/s)
cf 360MHz (720Mbit/s) for 4lane. Update clock setup and pixel rates to
match.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 67 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 48 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index d8f8efc0c927..0462e0feee36 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -27,11 +27,14 @@
 #define IMX355_REG_CHIP_ID		CCI_REG16(0x0016)
 #define IMX355_CHIP_ID			0x0355
 
+#define IMX355_REG_LANE_SEL		CCI_REG8(0x0114)
+
 /* PLL registers that depend on the external clock frequency */
 #define IMX355_REG_EXTCLK_FREQ		CCI_REG16(0x0136)
 #define IMX355_REG_PLL_OP_PREDIV	CCI_REG8(0x030d)
 #define IMX355_REG_PLL_OP_MUL		CCI_REG16(0x030e)
 #define IMX355_REG_PLL_IVT_PCK_DIV	CCI_REG8(0x0301)
+#define IMX355_REG_PLL_IVT_SYSCK_DIV	CCI_REG8(0x0303)
 #define IMX355_PLL_OP_PREDIV		2
 #define IMX355_PLL_IVT_PCK_DIV		5
 
@@ -80,6 +83,8 @@
 #define IMX355_TEST_PATTERN_GRAY_COLOR_BARS	3
 #define IMX355_TEST_PATTERN_PN9			4
 
+#define IMX355_REG_REQ_LINK_BIT_RATE	CCI_REG16(0x0820)
+
 #define IMX355_REG_BINNING_MODE		CCI_REG8(0x0900)
 #define IMX355_REG_BINNING_TYPE		CCI_REG8(0x0901)
 #define IMX355_REG_BINNING_WEIGHTING	CCI_REG8(0x0902)
@@ -87,9 +92,6 @@
 /* Flip Control */
 #define IMX355_REG_ORIENTATION		CCI_REG8(0x0101)
 
-/* number of data lanes */
-#define IMX355_DATA_LANES		4
-
 #define IMX355_PIXEL_ARRAY_TOP		0
 #define IMX355_PIXEL_ARRAY_LEFT		0
 #define IMX355_PIXEL_ARRAY_WIDTH	3280
@@ -120,30 +122,38 @@ struct imx355_mode {
 
 struct imx355_clk_params {
 	u32 ext_clk;
-	u16 extclk_freq; /* External clock (MHz) in 8.8 fixed point) */
-	u16 pll_op_mpy;	/* OP system PLL multiplier */
+	u16 extclk_freq;	/* External clock (MHz) in 8.8 fixed point) */
+	u16 pll_op_mpy[2];	/* OP system PLL multiplier */
+	u8 pll_op_prediv[2];	/* OP system pre PLL d */
 };
 
 /*
  * The clock tree is in single PLL mode, so PREDIV_VT and MPY_IVT do nothing.
- * All modes use the same PLL setup for OP, with IOPCK being 720MHz.
+ * In 4 lane mode the MIPI rate is 360Mhz (720Mbit/s) and pixel rate is
+ * 288MPix/s.
+ * In 2 lane mode the MIPI rate is 444MHz (888Mbit/s) and pixel rate
+ * 177.6MPix/s with a 24MHz clock, and 441.6MHz (883.2Mbit/s) and 176.6MPix/s
+ * with a 19.2MHz clock.
  */
 static const struct imx355_clk_params imx355_clk_params[] = {
 	{
 		.ext_clk = 19200000,
-		.extclk_freq = 0x1333,	/* 19.2 MHz */
-		.pll_op_mpy = 75,	/* 19.2 / 2 * 75  = 720 MHz */
+		.extclk_freq = 0x1333,
+		.pll_op_mpy = { 75, 92 },
+		.pll_op_prediv = { 2, 2 }
 	},
 	{
 		.ext_clk = 24000000,
-		.extclk_freq = 0x1800,	/* 24.0 MHz */
-		.pll_op_mpy = 60,	/* 24.0 / 2 * 60  = 720 MHz */
+		.extclk_freq = 0x1800,
+		.pll_op_mpy = { 60, 111 },
+		.pll_op_prediv = { 2, 3 }
 	},
 };
 
 struct imx355_hwcfg {
 	s64 link_freq_menu;
 	unsigned long link_freq_bitmap;
+	unsigned int num_lanes;
 };
 
 struct imx355 {
@@ -239,7 +249,6 @@ static const struct cci_reg_sequence imx355_global_regs[] = {
 	{ CCI_REG8(0x305a), 0x00 },
 	{ CCI_REG8(0x0112), 0x0a },
 	{ CCI_REG8(0x0113), 0x0a },
-	{ CCI_REG8(0x0114), 0x03 },
 	{ IMX355_REG_PLL_IVT_PCK_DIV, IMX355_PLL_IVT_PCK_DIV },
 	{ CCI_REG8(0x0303), 0x01 },
 	{ CCI_REG8(0x0305), 0x02 },
@@ -250,8 +259,6 @@ static const struct cci_reg_sequence imx355_global_regs[] = {
 	{ CCI_REG8(0x0310), 0x00 },
 	{ CCI_REG8(0x0220), 0x00 },
 	{ CCI_REG8(0x0222), 0x01 },
-	{ CCI_REG8(0x0820), 0x0b },
-	{ CCI_REG8(0x0821), 0x40 },
 	{ CCI_REG8(0x3088), 0x04 },
 	{ CCI_REG8(0x6813), 0x02 },
 	{ CCI_REG8(0x6835), 0x07 },
@@ -817,6 +824,7 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 		__v4l2_ctrl_modify_range(imx355->vblank, IMX355_VBLANK_MIN,
 					 height, 1, vblank_def);
 		__v4l2_ctrl_s_ctrl(imx355->vblank, vblank_def);
+
 		h_blank = mode->llp - imx355->cur_mode->width;
 		/*
 		 * Currently hblank is not changeable.
@@ -880,6 +888,8 @@ static int imx355_start_streaming(struct imx355 *imx355)
 {
 	const struct imx355_reg_list *reg_list;
 	const struct imx355_mode *mode;
+	int lane_idx = imx355->hwcfg->num_lanes == 4 ? 0 : 1;
+	u64 link_bitrate;
 	u8 binning_mode;
 	int ret = 0;
 
@@ -915,7 +925,21 @@ static int imx355_start_streaming(struct imx355 *imx355)
 	cci_write(imx355->regmap, IMX355_REG_EXTCLK_FREQ,
 		  imx355->clk_params->extclk_freq, &ret);
 	cci_write(imx355->regmap, IMX355_REG_PLL_OP_MUL,
-		  imx355->clk_params->pll_op_mpy, &ret);
+		  imx355->clk_params->pll_op_mpy[lane_idx], &ret);
+	cci_write(imx355->regmap, IMX355_REG_PLL_OP_PREDIV,
+		  imx355->clk_params->pll_op_prediv[lane_idx], &ret);
+	cci_write(imx355->regmap, IMX355_REG_PLL_IVT_SYSCK_DIV,
+		  lane_idx ? 2 : 1, &ret);
+
+	/* Set MIPI configuration */
+	cci_write(imx355->regmap, IMX355_REG_LANE_SEL,
+		  imx355->hwcfg->num_lanes - 1, &ret);
+
+	link_bitrate = imx355->link_freq->qmenu_int[imx355->link_freq->val] *
+		       imx355->hwcfg->num_lanes * 2;
+	do_div(link_bitrate, 1000000);
+	cci_write(imx355->regmap, IMX355_REG_REQ_LINK_BIT_RATE, link_bitrate,
+		  &ret);
 
 	/* set digital gain control to all color mode */
 	cci_write(imx355->regmap, IMX355_REG_DPGA_USE_GLOBAL_GAIN, 1, &ret);
@@ -1101,9 +1125,9 @@ static int imx355_init_controls(struct imx355 *imx355)
 		imx355->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	/* pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
-	pixel_rate = imx355->hwcfg->link_freq_menu * 2 * 4;
+	pixel_rate = imx355->hwcfg->link_freq_menu * 2 * imx355->hwcfg->num_lanes;
 	do_div(pixel_rate, 10);
-	/* By default, PIXEL_RATE is read only */
+
 	v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops, V4L2_CID_PIXEL_RATE,
 			  pixel_rate, pixel_rate, 1, pixel_rate);
 
@@ -1186,6 +1210,7 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct imx355 *imx355)
 	const struct imx355_clk_params *clk = imx355->clk_params;
 	struct fwnode_handle *ep;
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
+	int lane_idx;
 	int ret;
 
 	if (!fwnode)
@@ -1203,11 +1228,15 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct imx355 *imx355)
 	if (!cfg)
 		goto out_err;
 
-	if (bus_cfg.bus.mipi_csi2.num_data_lanes != IMX355_DATA_LANES)
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 2 &&
+	    bus_cfg.bus.mipi_csi2.num_data_lanes != 4)
 		goto out_err;
 
-	cfg->link_freq_menu = (clk->ext_clk * clk->pll_op_mpy) /
-			      (IMX355_PLL_OP_PREDIV * 2);
+	cfg->num_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
+
+	lane_idx = cfg->num_lanes == 4 ? 0 : 1;
+	cfg->link_freq_menu = (clk->ext_clk * clk->pll_op_mpy[lane_idx]) /
+			      (clk->pll_op_prediv[lane_idx] * 2);
 	ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
 				       bus_cfg.nr_of_link_frequencies,
 				       &cfg->link_freq_menu, 1,

-- 
2.34.1


