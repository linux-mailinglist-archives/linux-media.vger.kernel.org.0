Return-Path: <linux-media+bounces-8429-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84996895A28
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 18:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A71391C2250C
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 16:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1605215E5A5;
	Tue,  2 Apr 2024 16:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYIuwfar"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A16415E1EE;
	Tue,  2 Apr 2024 16:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712076415; cv=none; b=YsAiygmqtRmQt6529MehA8x2fl0Bd+/lqn4k4qijK6nuGksxvIqzF00ECiqGnr/sXRWUQKjQLWE8Yk8+P1cZcEMzPBfx6V7bXybOi3+OtVIUERE5j/FFHnDp+tmmMreoS9m4eYQOQPDbvsDR1dy88ZkOKcKtf6lC1nbBY/OtDXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712076415; c=relaxed/simple;
	bh=YlPBAiolpMBCk/phP3YCBMYLa8+6A4wSIk5wRbGr4Kw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h3JI1lRY3DogAvfvGcnpjzhxMvSpLw4pNJi8HCEoCVQ4t/l62QZs1C2EKLD1K6cMHWGUdCwfvC3eyHE2jg5OUYt/3wQZYIXacTyrW2uAyPWANtDY4evAY6HAX1i2B6dhzkv6Mvypynp1cJuhwqjHV23ON484SqyxhlSvL6hvfcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DYIuwfar; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-515c198e835so6272396e87.3;
        Tue, 02 Apr 2024 09:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712076411; x=1712681211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNMb9LRZur2TtxQIwuV57MaLxR96qrgNMYsluidntg8=;
        b=DYIuwfarQ+eZO25Hs8p/nwK4GoObxUENhg7XcRzt+Gtxd1KJV+0uhrjEefBONgkFzo
         Z+EK4ytnI/+exsEPMxPv04BkQ5TDPSQ2txVGmhJDWtspyPhFlZWwgzoDmhl9iELsPcFU
         YKB6cpGMfTgLSuPKj13Uy/PujjfJHlrs920GHT0iVps7BWGR50Das+ZMTG9vXiqCPYzE
         RWvy6X+DPCns+BXwmiZUoh3avDbrQLOdvIOAsZqQUaGpNfyqUJ20xd4xYxcUD1E1bjBw
         EnmrWwHF33XaMkj8waN34XVIrTUGI3RHqcjlpx3DW0LVkBmMijAzCIYlGMZ7z0SvxBF0
         A3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712076411; x=1712681211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hNMb9LRZur2TtxQIwuV57MaLxR96qrgNMYsluidntg8=;
        b=oLKIo8Nw5Cp4B22k4FtPbmn/tJXsvwMvsXpdZ520Cr46Dt/q04KJqn8gAOwTMhD2Wg
         /U8Ru29kCD0WjKa96UBGdBonBAn3BZLR8qYkNwLXbV92oNNmCy5Zq+xOgr7tVHlGfucf
         eh5lPDevqgLa16B7DhGc+NdIO5Qcg7iTSyullUxbU49Tw/u6Nk3wEP1LPajsY0nTPTfp
         rWBZ2bNAyREGy5KsdCLas46IMu9DGeLq+KZi+qATGQfHffh50ZaXB4Rr7+M8hSd7cPiZ
         n1Ub1LP2xgJ1nqRQR58dvN1s+hiKGl6tnoZtOZZvA45LTN12JQDukCFqNf8eYDHkTh5j
         B/Xg==
X-Forwarded-Encrypted: i=1; AJvYcCWx2fG6JzSPqZDw9SMVRHs3VcfBJ00v/B1w42b64XpZebbmx1ERhdiuqbfMMfemonDCDIb8xaLXGFVoMJexvHFgSaxvzflJHui98rqQ
X-Gm-Message-State: AOJu0Yxg9uHBfk2kOS0W1IJDDg8Hv+mX4U12btctOkjD98NQosbcSJxs
	pvI6it1wt9F2fZ/XzB1aTpT2a6MaTMg06bsZN2mUCLgia6WpbLtjoazVm27iYE8wlA==
X-Google-Smtp-Source: AGHT+IE4+QUL2xVG+lG8l1klam//wckPzs+Ff/U4qhMEoQle4J0Gloj1futOEZEiuTcVNDCew8o46A==
X-Received: by 2002:a05:6512:475:b0:515:cf44:904e with SMTP id x21-20020a056512047500b00515cf44904emr9220573lfd.46.1712076410925;
        Tue, 02 Apr 2024 09:46:50 -0700 (PDT)
Received: from localhost ([77.91.78.25])
        by smtp.gmail.com with ESMTPSA id b4-20020ac247e4000000b0051596653cb6sm1761140lfp.100.2024.04.02.09.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 09:46:50 -0700 (PDT)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mikhail Rudenko <mike.rudenko@gmail.com>
Subject: [PATCH v4 20/20] media: i2c: ov4689: Implement 2x2 binning
Date: Tue,  2 Apr 2024 19:45:51 +0300
Message-ID: <20240402164552.19171-21-mike.rudenko@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240402164552.19171-1-mike.rudenko@gmail.com>
References: <20240402164552.19171-1-mike.rudenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement 2x2 binning support. Compute best binning mode (none or 2x2)
from pad crop and pad format in ov4689_set_fmt. Use output frame size
instead of analogue crop to compute control ranges and BLC anchors.

Also move ov4689_hts_min and ov4689_update_ctrl_ranges, since they are
now also called from ov4689_set_fmt. Update frame timings to
accommodate the requirements of binning mode and avoid visual
artefacts. Additionally, report 2x2 binned mode in addition to
non-binned one in ov4689_enum_frame_sizes.

Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---
 drivers/media/i2c/ov4689.c | 192 +++++++++++++++++++++++++------------
 1 file changed, 130 insertions(+), 62 deletions(-)

diff --git a/drivers/media/i2c/ov4689.c b/drivers/media/i2c/ov4689.c
index e652d626f32f..83c7d0bae7d1 100644
--- a/drivers/media/i2c/ov4689.c
+++ b/drivers/media/i2c/ov4689.c
@@ -114,7 +114,7 @@
  * Minimum working vertical blanking value. Found experimentally at
  * minimum HTS values.
  */
-#define OV4689_VBLANK_MIN		31
+#define OV4689_VBLANK_MIN		35
 
 static const char *const ov4689_supply_names[] = {
 	"avdd", /* Analog power */
@@ -256,6 +256,18 @@ static const struct cci_reg_sequence ov4689_common_regs[] = {
 	{CCI_REG8(0x5503), 0x0f}, /* OTP_DPC_END_L otp_end_address[7:0] = 0x0f */
 };
 
+static const struct cci_reg_sequence ov4689_2x2_binning_regs[] = {
+	{CCI_REG8(0x3632), 0x05}, /* ADC */
+	{CCI_REG8(0x376b), 0x40}, /* Sensor control */
+	{CCI_REG8(0x3814), 0x03}, /* H_INC_ODD */
+	{CCI_REG8(0x3821), 0x07}, /* TIMING_FORMAT_2 hor_binning = 1*/
+	{CCI_REG8(0x382a), 0x03}, /* V_INC_ODD */
+	{CCI_REG8(0x3830), 0x08}, /* BLC_NUM_OPTION blc_use_num_2 = 1 */
+	{CCI_REG8(0x3836), 0x02}, /* TIMING_REG_36 r_zline_use_num_2 = 1 */
+	{CCI_REG8(0x4001), 0x50}, /* BLC DEBUG MODE */
+	{CCI_REG8(0x4502), 0x44}, /* ADC synch control*/
+};
+
 static const u64 link_freq_menu_items[] = { 504000000 };
 
 static const char *const ov4689_test_pattern_menu[] = {
@@ -305,18 +317,96 @@ static const struct ov4689_gain_range ov4689_gain_ranges[] = {
 	},
 };
 
+/*
+ * For now, only 2x2 binning implemented in this driver.
+ */
+static int ov4689_best_binning(struct ov4689 *ov4689,
+			       const struct v4l2_mbus_framefmt *format,
+			       const struct v4l2_rect *crop,
+			       unsigned int *binning)
+{
+	const struct v4l2_area candidates[] = {
+		{ crop->width, crop->height },
+		{ crop->width / 2, crop->height / 2 },
+	};
+
+	const struct v4l2_area *best;
+	int index;
+
+	best = v4l2_find_nearest_size(candidates, ARRAY_SIZE(candidates), width,
+				      height, format->width, format->height);
+	if (!best) {
+		dev_err(ov4689->dev,
+			"failed to find best binning for requested mode\n");
+		return -EINVAL;
+	}
+
+	index = best - candidates;
+	*binning = index + 1;
+
+	dev_dbg(ov4689->dev,
+		"best_binning: crop=%dx%d format=%dx%d binning=%d\n",
+		crop->width, crop->height, format->width, format->height,
+		*binning);
+
+	return 0;
+}
+
+/*
+ * Minimum working HTS value for given output width (found
+ * experimentally).
+ */
+static unsigned int ov4689_hts_min(unsigned int width)
+{
+	return max_t(unsigned int, 3156, 224 + width * 19 / 16);
+}
+
+static void ov4689_update_ctrl_ranges(struct ov4689 *ov4689, unsigned int width,
+				      unsigned int height)
+{
+	struct v4l2_ctrl *exposure = ov4689->exposure;
+	struct v4l2_ctrl *vblank = ov4689->vblank;
+	struct v4l2_ctrl *hblank = ov4689->hblank;
+	s64 def_val, min_val, max_val;
+
+	min_val = ov4689_hts_min(width) - width;
+	max_val = OV4689_HTS_MAX - width;
+	def_val = clamp_t(s64, hblank->default_value, min_val, max_val);
+	__v4l2_ctrl_modify_range(hblank, min_val, max_val, hblank->step,
+				 def_val);
+
+	min_val = OV4689_VBLANK_MIN;
+	max_val = OV4689_HTS_MAX - width;
+	def_val = clamp_t(s64, vblank->default_value, min_val, max_val);
+	__v4l2_ctrl_modify_range(vblank, min_val, max_val, vblank->step,
+				 def_val);
+
+	min_val = exposure->minimum;
+	max_val = height + vblank->val - 4;
+	def_val = clamp_t(s64, exposure->default_value, min_val, max_val);
+	__v4l2_ctrl_modify_range(exposure, min_val, max_val, exposure->step,
+				 def_val);
+}
+
 static int ov4689_set_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
 {
+	struct ov4689 *ov4689 = to_ov4689(sd);
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
+	unsigned int binning;
+	int ret;
 
 	crop = v4l2_subdev_state_get_crop(sd_state, fmt->pad);
 	format = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 
-	format->width = crop->width;
-	format->height = crop->height;
+	ret = ov4689_best_binning(ov4689, &fmt->format, crop, &binning);
+	if (ret)
+		return ret;
+
+	format->width = crop->width / binning;
+	format->height = crop->height / binning;
 
 	format->code = MEDIA_BUS_FMT_SBGGR10_1X10;
 	format->field = V4L2_FIELD_NONE;
@@ -327,6 +417,9 @@ static int ov4689_set_fmt(struct v4l2_subdev *sd,
 
 	fmt->format = *format;
 
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		ov4689_update_ctrl_ranges(ov4689, format->width, format->height);
+
 	return 0;
 }
 
@@ -346,8 +439,9 @@ static int ov4689_enum_frame_sizes(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
 	const struct v4l2_rect *crop;
+	int binning;
 
-	if (fse->index >= 1)
+	if (fse->index >= 2)
 		return -EINVAL;
 
 	if (fse->code != MEDIA_BUS_FMT_SBGGR10_1X10)
@@ -355,10 +449,11 @@ static int ov4689_enum_frame_sizes(struct v4l2_subdev *sd,
 
 	crop = v4l2_subdev_state_get_crop(sd_state, 0);
 
-	fse->min_width = crop->width;
-	fse->max_width = crop->width;
-	fse->max_height = crop->height;
-	fse->min_height = crop->height;
+	binning = fse->index + 1;
+	fse->min_width = crop->width / binning;
+	fse->max_width = crop->width / binning;
+	fse->max_height = crop->height / binning;
+	fse->min_height = crop->height / binning;
 
 	return 0;
 }
@@ -398,42 +493,6 @@ static int ov4689_get_selection(struct v4l2_subdev *sd,
 	return -EINVAL;
 }
 
-/*
- * Minimum working HTS value for given output width (found
- * experimentally).
- */
-static unsigned int ov4689_hts_min(unsigned int width)
-{
-	return max_t(unsigned int, 3156, 224 + width * 19 / 16);
-}
-
-static void ov4689_update_ctrl_ranges(struct ov4689 *ov4689,
-				      struct v4l2_rect *crop)
-{
-	struct v4l2_ctrl *exposure = ov4689->exposure;
-	struct v4l2_ctrl *vblank = ov4689->vblank;
-	struct v4l2_ctrl *hblank = ov4689->hblank;
-	s64 def_val, min_val, max_val;
-
-	min_val = ov4689_hts_min(crop->width) - crop->width;
-	max_val = OV4689_HTS_MAX - crop->width;
-	def_val = clamp_t(s64, hblank->default_value, min_val, max_val);
-	__v4l2_ctrl_modify_range(hblank, min_val, max_val, hblank->step,
-				 def_val);
-
-	min_val = OV4689_VBLANK_MIN;
-	max_val = OV4689_HTS_MAX - crop->width;
-	def_val = clamp_t(s64, vblank->default_value, min_val, max_val);
-	__v4l2_ctrl_modify_range(vblank, min_val, max_val, vblank->step,
-				 def_val);
-
-	min_val = exposure->minimum;
-	max_val = crop->height + vblank->val - 4;
-	def_val = clamp_t(s64, exposure->default_value, min_val, max_val);
-	__v4l2_ctrl_modify_range(exposure, min_val, max_val, exposure->step,
-				 def_val);
-}
-
 static int ov4689_set_selection(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_selection *sel)
@@ -470,7 +529,8 @@ static int ov4689_set_selection(struct v4l2_subdev *sd,
 		format->height = rect.height;
 
 		if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-			ov4689_update_ctrl_ranges(ov4689, &rect);
+			ov4689_update_ctrl_ranges(ov4689, rect.width,
+						  rect.height);
 	}
 
 	*crop = rect;
@@ -485,21 +545,27 @@ static int ov4689_setup_timings(struct ov4689 *ov4689,
 	const struct v4l2_mbus_framefmt *format;
 	struct regmap *rm = ov4689->regmap;
 	const struct v4l2_rect *crop;
+	const int v_offset = 2;
+	unsigned int binning;
 	int ret = 0;
 
 	format = v4l2_subdev_state_get_format(state, 0);
 	crop = v4l2_subdev_state_get_crop(state, 0);
 
+	ret = ov4689_best_binning(ov4689, format, crop, &binning);
+	if (ret)
+		return ret;
+
 	cci_write(rm, OV4689_REG_H_CROP_START, crop->left, &ret);
-	cci_write(rm, OV4689_REG_V_CROP_START, crop->top, &ret);
-	cci_write(rm, OV4689_REG_H_CROP_END, crop->left + crop->width + 1, &ret);
-	cci_write(rm, OV4689_REG_V_CROP_END, crop->top + crop->height + 1, &ret);
+	cci_write(rm, OV4689_REG_V_CROP_START, crop->top - v_offset, &ret);
+	cci_write(rm, OV4689_REG_H_CROP_END, crop->left + crop->width + 3, &ret);
+	cci_write(rm, OV4689_REG_V_CROP_END, crop->top + crop->height + 7, &ret);
 
 	cci_write(rm, OV4689_REG_H_OUTPUT_SIZE, format->width, &ret);
 	cci_write(rm, OV4689_REG_V_OUTPUT_SIZE, format->height, &ret);
 
 	cci_write(rm, OV4689_REG_H_WIN_OFF, 0, &ret);
-	cci_write(rm, OV4689_REG_V_WIN_OFF, 0, &ret);
+	cci_write(rm, OV4689_REG_V_WIN_OFF, v_offset, &ret);
 
 	/*
 	 * Maximum working value of vfifo_read_start for given output
@@ -507,6 +573,10 @@ static int ov4689_setup_timings(struct ov4689 *ov4689,
 	 */
 	cci_write(rm, OV4689_REG_VFIFO_CTRL_01, format->width / 16 - 1, &ret);
 
+	if (binning == 2)
+		cci_multi_reg_write(ov4689->regmap, ov4689_2x2_binning_regs,
+				    ARRAY_SIZE(ov4689_2x2_binning_regs),
+				    &ret);
 	return ret;
 }
 
@@ -519,20 +589,20 @@ static int ov4689_setup_blc_anchors(struct ov4689 *ov4689,
 				    struct v4l2_subdev_state *state)
 {
 	unsigned int width_def = OV4689_H_OUTPUT_SIZE_DEFAULT;
+	const struct v4l2_mbus_framefmt *format;
 	struct regmap *rm = ov4689->regmap;
-	const struct v4l2_rect *crop;
 	int ret = 0;
 
-	crop = v4l2_subdev_state_get_crop(state, 0);
+	format = v4l2_subdev_state_get_format(state, 0);
 
 	cci_write(rm, OV4689_REG_ANCHOR_LEFT_START,
-		  OV4689_ANCHOR_LEFT_START_DEF * crop->width / width_def, &ret);
+		  OV4689_ANCHOR_LEFT_START_DEF * format->width / width_def, &ret);
 	cci_write(rm, OV4689_REG_ANCHOR_LEFT_END,
-		  OV4689_ANCHOR_LEFT_END_DEF * crop->width / width_def, &ret);
+		  OV4689_ANCHOR_LEFT_END_DEF * format->width / width_def, &ret);
 	cci_write(rm, OV4689_REG_ANCHOR_RIGHT_START,
-		  OV4689_ANCHOR_RIGHT_START_DEF * crop->width / width_def, &ret);
+		  OV4689_ANCHOR_RIGHT_START_DEF * format->width / width_def, &ret);
 	cci_write(rm, OV4689_REG_ANCHOR_RIGHT_END,
-		  OV4689_ANCHOR_RIGHT_END_DEF * crop->width / width_def, &ret);
+		  OV4689_ANCHOR_RIGHT_END_DEF * format->width / width_def, &ret);
 
 	return ret;
 }
@@ -749,19 +819,19 @@ static int ov4689_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct regmap *regmap = ov4689->regmap;
 	struct v4l2_subdev_state *sd_state;
 	struct device *dev = ov4689->dev;
-	struct v4l2_rect *crop;
+	struct v4l2_mbus_framefmt *fmt;
 	s64 max_expo, def_expo;
 	int sensor_gain;
 	int ret = 0;
 
 	sd_state = v4l2_subdev_get_locked_active_state(&ov4689->subdev);
-	crop = v4l2_subdev_state_get_crop(sd_state, 0);
+	fmt = v4l2_subdev_state_get_format(sd_state, 0);
 
 	/* Propagate change of current control to all related controls */
 	switch (ctrl->id) {
 	case V4L2_CID_VBLANK:
 		/* Update max exposure while meeting expected vblanking */
-		max_expo = crop->height + ctrl->val - 4;
+		max_expo = fmt->height + ctrl->val - 4;
 		def_expo = clamp_t(s64, ov4689->exposure->default_value,
 				   ov4689->exposure->minimum, max_expo);
 
@@ -785,16 +855,14 @@ static int ov4689_set_ctrl(struct v4l2_ctrl *ctrl)
 		cci_write(regmap, OV4689_REG_GAIN, sensor_gain, &ret);
 		break;
 	case V4L2_CID_VBLANK:
-		cci_write(regmap, OV4689_REG_VTS,
-			  ctrl->val + crop->height, &ret);
+		cci_write(regmap, OV4689_REG_VTS, ctrl->val + fmt->height, &ret);
 		break;
 	case V4L2_CID_TEST_PATTERN:
 		ret = ov4689_enable_test_pattern(ov4689, ctrl->val);
 		break;
 	case V4L2_CID_HBLANK:
 		cci_write(regmap, OV4689_REG_HTS,
-			  (ctrl->val + crop->width) /
-			  OV4689_HTS_DIVIDER, &ret);
+			  (ctrl->val + fmt->width) / OV4689_HTS_DIVIDER, &ret);
 		break;
 	case V4L2_CID_VFLIP:
 		cci_update_bits(regmap, OV4689_REG_TIMING_FORMAT1,
-- 
2.44.0


