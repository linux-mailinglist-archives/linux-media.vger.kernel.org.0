Return-Path: <linux-media+bounces-50428-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8C4D11AC9
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:00:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7B1C6302552C
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C2F285C84;
	Mon, 12 Jan 2026 10:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sd2djIW0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B942E28DEE9
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 10:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212019; cv=none; b=N20JCnuMMHaynFeNda9Bx2jQ+ZKRd39Fgp65Q7h0Reg1BNV5lqP8jkC7ySWFuicKbNvdDmo1KDq1IGiiD+fOtuOt2ecln8aGFh1siatdQ2p42OJ4Pb14rJDevTHPFOqCi1aL+w09iOIvtkZdyiYZIiioR5sW+FSKnWXqheDgit4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212019; c=relaxed/simple;
	bh=sLkdc17lshlwvO7eGkm1n7hlvnXvhHJ3W0Vi3sGU9zo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mncaDKG0sGGgkiCX4thskYfzVAXYHET4Ljoku0m5YM+srd+u6j6fms2T2BlMnYqRV3qVPcBMB6dLGSnN93wb4djn4dkOjpFIe0Z6M5juqq6BTMlwdqWg5f+wADUuEoMmHTrFZ/09VR8xB9uxFoZkMNWwnGOQSZdNc1O5jM21+bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sd2djIW0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768212018; x=1799748018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sLkdc17lshlwvO7eGkm1n7hlvnXvhHJ3W0Vi3sGU9zo=;
  b=Sd2djIW0dU11ylLQ8aCKkbRmzDl/YRwOEdgSvmiIY/7XGGb6AXurE47K
   8fxR06rA4VPL9IU6tUD8DgkhcqnZFTnxUhyS4oPAyjokOXLQUkOJkE4fx
   0HduAYDAazoEuiP4Rt7Sg5M3BjAhCZEVTJEd2CcOIVLQNF6DNxityyIBB
   Fy7fZZDtZKkEKE8BcC0BptOTB60qvLu0mw4xNMgHAZVUEwcFmUDC0Rjv1
   1fdggv2UHnUXLxtGLWuM6EaonKfvgxNLsOniojlPNFQIRzeyVCV8hPy+5
   rwcxqdO+9p6UnB5YNoImPps6J4hgY3z74eflhTCuf8PuIv9r4OIu0x2yE
   A==;
X-CSE-ConnectionGUID: Cs5PdAfcSumwqOFm5tRG9Q==
X-CSE-MsgGUID: bZzbCW7URTmB0pHtSUqnAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69218823"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69218823"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 02:00:01 -0800
X-CSE-ConnectionGUID: HEhGiFbJSSKIZcs0jAcAbQ==
X-CSE-MsgGUID: F1PieyyyTkSZE95WUCX92w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="234743180"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.52])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:59 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4D82B121FB6;
	Mon, 12 Jan 2026 11:59:50 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vfEiE-0000000012G-0jrX;
	Mon, 12 Jan 2026 11:59:50 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	mehdi.djait@intel.com
Subject: [PATCH v2 16/23] media: i2c: ov01a10: Add cropping support / allow arbitrary sizes
Date: Mon, 12 Jan 2026 11:59:42 +0200
Message-ID: <20260112095949.3851-17-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
References: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hansg@kernel.org>

Remove the fixed mode list and add cropping support. The main reason for
doing this is to allow libcamera to select 1292x812 instead of 1280x800
so that after the extra border which the CPU debayer code needs libcamera
can output 1280x720 instead of 1276x720.

This in turn allows google-meet to use 720p instead of it falling back
to a pretty bad 360p.

This has been tested on a Dell XPS 9320, with both libcamera as well as
with Intel's out-of-tree psys driver + proprietary userspace stack.

Libcamera asks for 1292x812 where as the Intel stack asks for 1280x800
and neither stack explicitly sets the crop-window. Hence the need for
ov01a10_set_format() to adjust the crop-window if necessary.

Note the differentiating between pattern_size and border_size is done in
preparation for adding support for the monochrome OV01A1B model where
coordinates still need to be aligned to a multiple of 2, but there will
be no need for a border (border_size=0).

Link: https://bugzilla.redhat.com/show_bug.cgi?id=2337593
Signed-off-by: Hans de Goede <hansg@kernel.org>
Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov01a10.c | 348 ++++++++++++++++++++++--------------
 1 file changed, 212 insertions(+), 136 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 3eb6445b8f00..349fd3d06df5 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -40,7 +40,6 @@
 #define OV01A10_DEFAULT_HEIGHT		800
 
 /* vertical and horizontal timings */
-#define OV01A10_REG_VTS			CCI_REG16(0x380e)
 #define OV01A10_VTS_DEF			0x0700
 #define OV01A10_VTS_MIN			0x0380
 #define OV01A10_VTS_MAX			0xffff
@@ -68,19 +67,26 @@
 #define OV01A10_DGTL_GAIN_STEP		1
 #define OV01A10_DGTL_GAIN_DEFAULT	1024
 
-/* test pattern control */
-#define OV01A10_REG_TEST_PATTERN	CCI_REG8(0x4503)
-#define OV01A10_TEST_PATTERN_ENABLE	BIT(7)
-#define OV01A10_LINK_FREQ_400MHZ_INDEX	0
+/* timing control */
+#define OV01A10_REG_X_ADDR_START	CCI_REG16(0x3800)
+#define OV01A10_REG_Y_ADDR_START	CCI_REG16(0x3802)
+#define OV01A10_REG_X_ADDR_END		CCI_REG16(0x3804)
+#define OV01A10_REG_Y_ADDR_END		CCI_REG16(0x3806)
+#define OV01A10_REG_X_OUTPUT_SIZE	CCI_REG16(0x3808)
+#define OV01A10_REG_Y_OUTPUT_SIZE	CCI_REG16(0x380a)
+#define OV01A10_REG_HTS			CCI_REG16(0x380c) /* in units of 2 pixels */
+#define OV01A10_REG_VTS			CCI_REG16(0x380e)
+#define OV01A10_REG_X_WIN		CCI_REG16(0x3810)
+#define OV01A10_REG_Y_WIN		CCI_REG16(0x3812)
 
 /* flip and mirror control */
 #define OV01A10_REG_FORMAT1		CCI_REG8(0x3820)
 #define OV01A10_VFLIP_MASK		BIT(4)
 #define OV01A10_HFLIP_MASK		BIT(3)
 
-/* window offset */
-#define OV01A10_REG_X_WIN		CCI_REG16(0x3810)
-#define OV01A10_REG_Y_WIN		CCI_REG16(0x3812)
+/* test pattern control */
+#define OV01A10_REG_TEST_PATTERN	CCI_REG8(0x4503)
+#define OV01A10_TEST_PATTERN_ENABLE	BIT(7)
 
 /*
  * The native ov01a10 bayer-pattern is GBRG, but there was a driver bug enabling
@@ -90,6 +96,7 @@
  * when hflip is *disabled*.
  */
 #define OV01A10_MEDIA_BUS_FMT		MEDIA_BUS_FMT_SBGGR10_1X10
+#define OV01A10_BAYER_PATTERN_SIZE	2 /* 2x2 */
 
 struct ov01a10_reg_list {
 	u32 num_of_regs;
@@ -100,17 +107,6 @@ struct ov01a10_link_freq_config {
 	const struct ov01a10_reg_list reg_list;
 };
 
-struct ov01a10_mode {
-	u32 width;
-	u32 height;
-	u32 hts;
-	u32 vts_def;
-	u32 vts_min;
-	u32 link_freq_index;
-
-	const struct ov01a10_reg_list reg_list;
-};
-
 static const struct reg_sequence mipi_data_rate_720mbps[] = {
 	{0x0103, 0x01},
 	{0x0302, 0x00},
@@ -127,7 +123,7 @@ static const struct reg_sequence mipi_data_rate_720mbps[] = {
 	{0x0325, 0x68},
 };
 
-static const struct reg_sequence sensor_1280x800_setting[] = {
+static const struct reg_sequence ov01a10_global_setting[] = {
 	{0x3002, 0xa1},
 	{0x301e, 0xf0},
 	{0x3022, 0x01},
@@ -179,26 +175,6 @@ static const struct reg_sequence sensor_1280x800_setting[] = {
 	{0x37e4, 0x04},
 	{0x37e5, 0x03},
 	{0x37e6, 0x04},
-	{0x3800, 0x00},
-	{0x3801, 0x00},
-	{0x3802, 0x00},
-	{0x3803, 0x00},
-	{0x3804, 0x05},
-	{0x3805, 0x0f},
-	{0x3806, 0x03},
-	{0x3807, 0x2f},
-	{0x3808, 0x05},
-	{0x3809, 0x00},
-	{0x380a, 0x03},
-	{0x380b, 0x20},
-	{0x380c, 0x02},
-	{0x380d, 0xe8},
-	{0x380e, 0x07},
-	{0x380f, 0x00},
-	{0x3810, 0x00},
-	{0x3811, 0x09},
-	{0x3812, 0x00},
-	{0x3813, 0x08},
 	{0x3814, 0x01},
 	{0x3815, 0x01},
 	{0x3816, 0x01},
@@ -260,7 +236,7 @@ static const s64 link_freq_menu_items[] = {
 };
 
 static const struct ov01a10_link_freq_config link_freq_configs[] = {
-	[OV01A10_LINK_FREQ_400MHZ_INDEX] = {
+	{
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mipi_data_rate_720mbps),
 			.regs = mipi_data_rate_720mbps,
@@ -268,19 +244,11 @@ static const struct ov01a10_link_freq_config link_freq_configs[] = {
 	},
 };
 
-static const struct ov01a10_mode supported_modes[] = {
-	{
-		.width = OV01A10_DEFAULT_WIDTH,
-		.height = OV01A10_DEFAULT_HEIGHT,
-		.hts = OV01A10_HTS_DEF,
-		.vts_def = OV01A10_VTS_DEF,
-		.vts_min = OV01A10_VTS_MIN,
-		.reg_list = {
-			.num_of_regs = ARRAY_SIZE(sensor_1280x800_setting),
-			.regs = sensor_1280x800_setting,
-		},
-		.link_freq_index = OV01A10_LINK_FREQ_400MHZ_INDEX,
-	},
+static const struct v4l2_rect ov01a10_default_crop = {
+	.left = (OV01A10_NATIVE_WIDTH - OV01A10_DEFAULT_WIDTH) / 2,
+	.top = (OV01A10_NATIVE_HEIGHT - OV01A10_DEFAULT_HEIGHT) / 2,
+	.width = OV01A10_DEFAULT_WIDTH,
+	.height = OV01A10_DEFAULT_HEIGHT,
 };
 
 static const char * const ov01a10_supply_names[] = {
@@ -303,7 +271,6 @@ struct ov01a10 {
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
 
-	const struct ov01a10_mode *cur_mode;
 	u32 link_freq_index;
 
 	struct clk *clk;
@@ -317,6 +284,22 @@ static inline struct ov01a10 *to_ov01a10(struct v4l2_subdev *subdev)
 	return container_of(subdev, struct ov01a10, sd);
 }
 
+static struct v4l2_mbus_framefmt *ov01a10_get_active_format(struct ov01a10 *ov01a10)
+{
+	struct v4l2_subdev_state *active_state =
+		v4l2_subdev_get_locked_active_state(&ov01a10->sd);
+
+	return v4l2_subdev_state_get_format(active_state, 0);
+}
+
+static struct v4l2_rect *ov01a10_get_active_crop(struct ov01a10 *ov01a10)
+{
+	struct v4l2_subdev_state *active_state =
+		v4l2_subdev_get_locked_active_state(&ov01a10->sd);
+
+	return v4l2_subdev_state_get_crop(active_state, 0);
+}
+
 static int ov01a10_update_digital_gain(struct ov01a10 *ov01a10, u32 d_gain)
 {
 	u32 real = d_gain << 6;
@@ -339,13 +322,16 @@ static int ov01a10_test_pattern(struct ov01a10 *ov01a10, u32 pattern)
 			 NULL);
 }
 
-/* for vflip and hflip, use 0x9 as window offset to keep the bayer */
 static int ov01a10_set_hflip(struct ov01a10 *ov01a10, u32 hflip)
 {
+	struct v4l2_rect *crop = ov01a10_get_active_crop(ov01a10);
 	u32 val, offset;
 	int ret = 0;
 
-	offset = hflip ? 0x8 : 0x9;
+	offset = crop->left;
+	if (!hflip)
+		offset++;
+
 	val = hflip ? 0 : FIELD_PREP(OV01A10_HFLIP_MASK, 0x1);
 
 	cci_write(ov01a10->regmap, OV01A10_REG_X_WIN, offset, &ret);
@@ -357,10 +343,14 @@ static int ov01a10_set_hflip(struct ov01a10 *ov01a10, u32 hflip)
 
 static int ov01a10_set_vflip(struct ov01a10 *ov01a10, u32 vflip)
 {
+	struct v4l2_rect *crop = ov01a10_get_active_crop(ov01a10);
 	u32 val, offset;
 	int ret = 0;
 
-	offset = vflip ? 0x9 : 0x8;
+	offset = crop->top;
+	if (vflip)
+		offset++;
+
 	val = vflip ? FIELD_PREP(OV01A10_VFLIP_MASK, 0x1) : 0;
 
 	cci_write(ov01a10->regmap, OV01A10_REG_Y_WIN, offset, &ret);
@@ -374,12 +364,13 @@ static int ov01a10_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov01a10 *ov01a10 = container_of(ctrl->handler,
 					       struct ov01a10, ctrl_handler);
+	struct v4l2_mbus_framefmt *fmt = ov01a10_get_active_format(ov01a10);
 	s64 exposure_max;
 	int ret = 0;
 
 	if (ctrl->id == V4L2_CID_VBLANK) {
-		exposure_max = ov01a10->cur_mode->height + ctrl->val -
-			OV01A10_EXPOSURE_MAX_MARGIN;
+		exposure_max = fmt->height + ctrl->val -
+			       OV01A10_EXPOSURE_MAX_MARGIN;
 		__v4l2_ctrl_modify_range(ov01a10->exposure,
 					 ov01a10->exposure->minimum,
 					 exposure_max, ov01a10->exposure->step,
@@ -406,7 +397,7 @@ static int ov01a10_set_ctrl(struct v4l2_ctrl *ctrl)
 
 	case V4L2_CID_VBLANK:
 		ret = cci_write(ov01a10->regmap, OV01A10_REG_VTS,
-				ov01a10->cur_mode->height + ctrl->val, NULL);
+				fmt->height + ctrl->val, NULL);
 		break;
 
 	case V4L2_CID_TEST_PATTERN:
@@ -440,7 +431,6 @@ static int ov01a10_init_controls(struct ov01a10 *ov01a10)
 	struct v4l2_fwnode_device_properties props;
 	u32 vblank_min, vblank_max, vblank_default;
 	struct v4l2_ctrl_handler *ctrl_hdlr;
-	const struct ov01a10_mode *cur_mode;
 	s64 exposure_max, h_blank;
 	int ret = 0;
 
@@ -453,8 +443,6 @@ static int ov01a10_init_controls(struct ov01a10 *ov01a10)
 	if (ret)
 		return ret;
 
-	cur_mode = ov01a10->cur_mode;
-
 	ov01a10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr,
 						    &ov01a10_ctrl_ops,
 						    V4L2_CID_LINK_FREQ,
@@ -465,14 +453,14 @@ static int ov01a10_init_controls(struct ov01a10 *ov01a10)
 						V4L2_CID_PIXEL_RATE, 0,
 						OV01A10_SCLK, 1, OV01A10_SCLK);
 
-	vblank_min = cur_mode->vts_min - cur_mode->height;
-	vblank_max = OV01A10_VTS_MAX - cur_mode->height;
-	vblank_default = cur_mode->vts_def - cur_mode->height;
+	vblank_min = OV01A10_VTS_MIN - OV01A10_DEFAULT_HEIGHT;
+	vblank_max = OV01A10_VTS_MAX - OV01A10_DEFAULT_HEIGHT;
+	vblank_default = OV01A10_VTS_DEF - OV01A10_DEFAULT_HEIGHT;
 	ov01a10->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov01a10_ctrl_ops,
 					    V4L2_CID_VBLANK, vblank_min,
 					    vblank_max, 1, vblank_default);
 
-	h_blank = cur_mode->hts - cur_mode->width;
+	h_blank = OV01A10_HTS_DEF - OV01A10_DEFAULT_WIDTH;
 	ov01a10->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov01a10_ctrl_ops,
 					    V4L2_CID_HBLANK, h_blank, h_blank,
 					    1, h_blank);
@@ -484,7 +472,7 @@ static int ov01a10_init_controls(struct ov01a10 *ov01a10)
 			  OV01A10_DGTL_GAIN_MIN, OV01A10_DGTL_GAIN_MAX,
 			  OV01A10_DGTL_GAIN_STEP, OV01A10_DGTL_GAIN_DEFAULT);
 
-	exposure_max = cur_mode->vts_def - OV01A10_EXPOSURE_MAX_MARGIN;
+	exposure_max = OV01A10_VTS_DEF - OV01A10_EXPOSURE_MAX_MARGIN;
 	ov01a10->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov01a10_ctrl_ops,
 					      V4L2_CID_EXPOSURE,
 					      OV01A10_EXPOSURE_MIN,
@@ -524,24 +512,48 @@ static int ov01a10_init_controls(struct ov01a10 *ov01a10)
 	return ret;
 }
 
-static void ov01a10_update_pad_format(const struct ov01a10_mode *mode,
-				      struct v4l2_mbus_framefmt *fmt)
+static void ov01a10_fill_format(struct v4l2_mbus_framefmt *fmt,
+				unsigned int width, unsigned int height)
 {
-	fmt->width = mode->width;
-	fmt->height = mode->height;
+	memset(fmt, 0, sizeof(*fmt));
+	fmt->width = width;
+	fmt->height = height;
 	fmt->code = OV01A10_MEDIA_BUS_FMT;
 	fmt->field = V4L2_FIELD_NONE;
 	fmt->colorspace = V4L2_COLORSPACE_RAW;
 }
 
+static int ov01a10_set_mode(struct ov01a10 *ov01a10)
+{
+	struct v4l2_mbus_framefmt *fmt = ov01a10_get_active_format(ov01a10);
+	int ret = 0;
+
+	cci_write(ov01a10->regmap, OV01A10_REG_X_ADDR_START, 0, &ret);
+	cci_write(ov01a10->regmap, OV01A10_REG_Y_ADDR_START, 0, &ret);
+	cci_write(ov01a10->regmap, OV01A10_REG_X_ADDR_END,
+		  OV01A10_NATIVE_WIDTH - 1, &ret);
+	cci_write(ov01a10->regmap, OV01A10_REG_Y_ADDR_END,
+		  OV01A10_NATIVE_HEIGHT - 1, &ret);
+	cci_write(ov01a10->regmap, OV01A10_REG_X_OUTPUT_SIZE,
+		  fmt->width, &ret);
+	cci_write(ov01a10->regmap, OV01A10_REG_Y_OUTPUT_SIZE,
+		  fmt->height, &ret);
+	/* HTS register is in units of 2 pixels */
+	cci_write(ov01a10->regmap, OV01A10_REG_HTS,
+		  OV01A10_HTS_DEF / 2, &ret);
+	/* OV01A10_REG_VTS is set by vblank control */
+	/* OV01A10_REG_X_WIN is set by hlip control */
+	/* OV01A10_REG_Y_WIN is set by vflip control */
+
+	return ret;
+}
+
 static int ov01a10_start_streaming(struct ov01a10 *ov01a10)
 {
 	const struct ov01a10_reg_list *reg_list;
-	int link_freq_index;
-	int ret = 0;
+	int ret;
 
-	link_freq_index = ov01a10->cur_mode->link_freq_index;
-	reg_list = &link_freq_configs[link_freq_index].reg_list;
+	reg_list = &link_freq_configs[ov01a10->link_freq_index].reg_list;
 	ret = regmap_multi_reg_write(ov01a10->regmap, reg_list->regs,
 				     reg_list->num_of_regs);
 	if (ret) {
@@ -549,9 +561,14 @@ static int ov01a10_start_streaming(struct ov01a10 *ov01a10)
 		return ret;
 	}
 
-	reg_list = &ov01a10->cur_mode->reg_list;
-	ret = regmap_multi_reg_write(ov01a10->regmap, reg_list->regs,
-				     reg_list->num_of_regs);
+	ret = regmap_multi_reg_write(ov01a10->regmap, ov01a10_global_setting,
+				     ARRAY_SIZE(ov01a10_global_setting));
+	if (ret) {
+		dev_err(ov01a10->dev, "failed to initialize sensor\n");
+		return ret;
+	}
+
+	ret = ov01a10_set_mode(ov01a10);
 	if (ret) {
 		dev_err(ov01a10->dev, "failed to set mode\n");
 		return ret;
@@ -600,54 +617,64 @@ static int ov01a10_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
+static void ov01a10_update_blank_ctrls(struct ov01a10 *ov01a10,
+				       unsigned int width, unsigned int height)
+{
+	s32 hblank, vblank_def;
+
+	vblank_def = OV01A10_VTS_DEF - height;
+	__v4l2_ctrl_modify_range(ov01a10->vblank,
+				 OV01A10_VTS_MIN - height,
+				 OV01A10_VTS_MAX - height, 1,
+				 vblank_def);
+	__v4l2_ctrl_s_ctrl(ov01a10->vblank, vblank_def);
+
+	hblank = OV01A10_HTS_DEF - width;
+	__v4l2_ctrl_modify_range(ov01a10->hblank, hblank, hblank, 1, hblank);
+}
+
 static int ov01a10_set_format(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
 {
+	struct v4l2_rect *crop = v4l2_subdev_state_get_crop(sd_state, fmt->pad);
+	const int pattern_size = OV01A10_BAYER_PATTERN_SIZE;
+	const int border_size = OV01A10_BAYER_PATTERN_SIZE;
 	struct ov01a10 *ov01a10 = to_ov01a10(sd);
-	const struct ov01a10_mode *mode;
-	struct v4l2_mbus_framefmt *format;
-	s32 vblank_def, h_blank;
-
-	mode = v4l2_find_nearest_size(supported_modes,
-				      ARRAY_SIZE(supported_modes), width,
-				      height, fmt->format.width,
-				      fmt->format.height);
-
-	ov01a10_update_pad_format(mode, &fmt->format);
-
-	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		ov01a10->cur_mode = mode;
-
-		vblank_def = mode->vts_def - mode->height;
-		__v4l2_ctrl_modify_range(ov01a10->vblank,
-					 mode->vts_min - mode->height,
-					 OV01A10_VTS_MAX - mode->height, 1,
-					 vblank_def);
-		__v4l2_ctrl_s_ctrl(ov01a10->vblank, vblank_def);
-		h_blank = mode->hts - mode->width;
-		__v4l2_ctrl_modify_range(ov01a10->hblank, h_blank, h_blank, 1,
-					 h_blank);
+	unsigned int width, height;
+
+	width = clamp_val(ALIGN(fmt->format.width, pattern_size),
+			  pattern_size,
+			  OV01A10_NATIVE_WIDTH - 2 * border_size);
+	height = clamp_val(ALIGN(fmt->format.height, pattern_size),
+			   pattern_size,
+			   OV01A10_NATIVE_HEIGHT - 2 * border_size);
+
+	/* Center image for userspace which does not set the crop first */
+	if (width != crop->width || height != crop->height) {
+		crop->left = ALIGN((OV01A10_NATIVE_WIDTH - width) / 2,
+				   pattern_size);
+		crop->top = ALIGN((OV01A10_NATIVE_HEIGHT - height) / 2,
+				  pattern_size);
+		crop->width = width;
+		crop->height = height;
 	}
 
-	format = v4l2_subdev_state_get_format(sd_state, fmt->pad);
-	*format = fmt->format;
+	ov01a10_fill_format(&fmt->format, width, height);
+	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		ov01a10_update_blank_ctrls(ov01a10, width, height);
 
 	return 0;
 }
 
 static int ov01a10_init_state(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_state *state)
+			      struct v4l2_subdev_state *sd_state)
 {
-	struct v4l2_subdev_format fmt = {
-		.which = V4L2_SUBDEV_FORMAT_TRY,
-		.format = {
-			.width = OV01A10_DEFAULT_WIDTH,
-			.height = OV01A10_DEFAULT_HEIGHT,
-		},
-	};
-
-	ov01a10_set_format(sd, state, &fmt);
+	*v4l2_subdev_state_get_crop(sd_state, 0) = ov01a10_default_crop;
+	ov01a10_fill_format(v4l2_subdev_state_get_format(sd_state, 0),
+			    OV01A10_DEFAULT_WIDTH, OV01A10_DEFAULT_HEIGHT);
 
 	return 0;
 }
@@ -668,14 +695,16 @@ static int ov01a10_enum_frame_size(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
-	if (fse->index >= ARRAY_SIZE(supported_modes) ||
-	    fse->code != OV01A10_MEDIA_BUS_FMT)
+	const int pattern_size = OV01A10_BAYER_PATTERN_SIZE;
+	const int border_size = OV01A10_BAYER_PATTERN_SIZE;
+
+	if (fse->index)
 		return -EINVAL;
 
-	fse->min_width = supported_modes[fse->index].width;
-	fse->max_width = fse->min_width;
-	fse->min_height = supported_modes[fse->index].height;
-	fse->max_height = fse->min_height;
+	fse->min_width = pattern_size;
+	fse->max_width = OV01A10_NATIVE_WIDTH - 2 * border_size;
+	fse->min_height = pattern_size;
+	fse->max_height = OV01A10_NATIVE_HEIGHT - 2 * border_size;
 
 	return 0;
 }
@@ -684,31 +713,79 @@ static int ov01a10_get_selection(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *state,
 				 struct v4l2_subdev_selection *sel)
 {
-	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE)
-		return -EINVAL;
+	const int border_size = OV01A10_BAYER_PATTERN_SIZE;
 
 	switch (sel->target) {
-	case V4L2_SEL_TGT_NATIVE_SIZE:
+	case V4L2_SEL_TGT_CROP:
+		sel->r = *v4l2_subdev_state_get_crop(state, sel->pad);
+		return 0;
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sel->r = ov01a10_default_crop;
+		return 0;
 	case V4L2_SEL_TGT_CROP_BOUNDS:
-		sel->r.top = 0;
+		/* Keep a border for hvflip shift to preserve bayer-pattern */
+		sel->r.left = border_size;
+		sel->r.top = border_size;
+		sel->r.width = OV01A10_NATIVE_WIDTH - 2 * border_size;
+		sel->r.height = OV01A10_NATIVE_HEIGHT - 2 * border_size;
+		return 0;
+	case V4L2_SEL_TGT_NATIVE_SIZE:
 		sel->r.left = 0;
+		sel->r.top = 0;
 		sel->r.width = OV01A10_NATIVE_WIDTH;
 		sel->r.height = OV01A10_NATIVE_HEIGHT;
 		return 0;
-	case V4L2_SEL_TGT_CROP:
-	case V4L2_SEL_TGT_CROP_DEFAULT:
-		sel->r.top = (OV01A10_NATIVE_HEIGHT -
-			      OV01A10_DEFAULT_HEIGHT) / 2;
-		sel->r.left = (OV01A10_NATIVE_WIDTH -
-			       OV01A10_DEFAULT_WIDTH) / 2;
-		sel->r.width = OV01A10_DEFAULT_WIDTH;
-		sel->r.height = OV01A10_DEFAULT_HEIGHT;
-		return 0;
 	}
 
 	return -EINVAL;
 }
 
+static int ov01a10_set_selection(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_selection *sel)
+{
+	const int pattern_size = OV01A10_BAYER_PATTERN_SIZE;
+	const int border_size = OV01A10_BAYER_PATTERN_SIZE;
+	struct ov01a10 *ov01a10 = to_ov01a10(sd);
+	struct v4l2_mbus_framefmt *format;
+	struct v4l2_rect *crop;
+	struct v4l2_rect rect;
+
+	if (sel->target != V4L2_SEL_TGT_CROP)
+		return -EINVAL;
+
+	/*
+	 * Clamp the boundaries of the crop rectangle to the size of the sensor
+	 * pixel array. Align to pattern-size to ensure pattern isn't disrupted.
+	 */
+	rect.left = clamp_val(ALIGN(sel->r.left, pattern_size), border_size,
+			      OV01A10_NATIVE_WIDTH - 2 * border_size);
+	rect.top = clamp_val(ALIGN(sel->r.top, pattern_size), border_size,
+			     OV01A10_NATIVE_HEIGHT - 2 * border_size);
+	rect.width = clamp_val(ALIGN(sel->r.width, pattern_size), pattern_size,
+			       OV01A10_NATIVE_WIDTH - rect.left - border_size);
+	rect.height = clamp_val(ALIGN(sel->r.height, pattern_size), pattern_size,
+				OV01A10_NATIVE_HEIGHT - rect.top - border_size);
+
+	crop = v4l2_subdev_state_get_crop(sd_state, sel->pad);
+
+	/* Reset the output size if the crop rectangle size has changed */
+	if (rect.width != crop->width || rect.height != crop->height) {
+		format = v4l2_subdev_state_get_format(sd_state, sel->pad);
+		format->width = rect.width;
+		format->height = rect.height;
+
+		if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+			ov01a10_update_blank_ctrls(ov01a10, rect.width,
+						   rect.height);
+	}
+
+	*crop = rect;
+	sel->r = rect;
+
+	return 0;
+}
+
 static const struct v4l2_subdev_core_ops ov01a10_core_ops = {
 	.log_status = v4l2_ctrl_subdev_log_status,
 };
@@ -721,6 +798,7 @@ static const struct v4l2_subdev_pad_ops ov01a10_pad_ops = {
 	.set_fmt = ov01a10_set_format,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.get_selection = ov01a10_get_selection,
+	.set_selection = ov01a10_set_selection,
 	.enum_mbus_code = ov01a10_enum_mbus_code,
 	.enum_frame_size = ov01a10_enum_frame_size,
 };
@@ -940,8 +1018,6 @@ static int ov01a10_probe(struct i2c_client *client)
 	if (ret)
 		goto err_power_off;
 
-	ov01a10->cur_mode = &supported_modes[0];
-
 	ret = ov01a10_init_controls(ov01a10);
 	if (ret)
 		goto err_power_off;
-- 
2.47.3


