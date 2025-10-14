Return-Path: <linux-media+bounces-44462-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D25BDAD09
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 19:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CF84188E3F4
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 17:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3B2307AEB;
	Tue, 14 Oct 2025 17:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ArpcSssR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADCF280025
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 17:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760463666; cv=none; b=e9aP2ZZ5KAoblmB5kJMD4qA13bFDiGEp6N15FVOTnm66E1OrcWqZL84CKIp3LjhmFKKf+dacMEqJNQzszKr1eTi71313DPCGOd0ROH6MWUzRnNa7Fm8+88k6LK8koRLb7BJaqD7iV44c3FkSHvgcIxd7OXwGQEBko9V41mzcUbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760463666; c=relaxed/simple;
	bh=31XdOwsCoa2UTeti4nkUX/yGuT0cWYFp9NFUcgSvHag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VTb0Y/EaTAGh3L9DvHdrJIklEFGB67Z8gPdM7MiMtNOXwZhlfl1lIs/1Clry3Fa2bu7MvVicCBVOh9baDR3Kj7RMChQJE9zMgDNsmnrQBwOnYEFtqKBojspzWbFCWDnUhFv2fD5p6mFRdU0Ht3Ib7GB6rEYTAdDwpCVZEZubEro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ArpcSssR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23760C4CEF9;
	Tue, 14 Oct 2025 17:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760463666;
	bh=31XdOwsCoa2UTeti4nkUX/yGuT0cWYFp9NFUcgSvHag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ArpcSssRJkbYCEMS/BGCjOq+0piXG1o+8rmd69x/hWq/u008c9biL8O8B0vpbCDOc
	 HhNXrg+HlwwV4fUVBjZ2DuyuKRVPyHaNBGxnobOG5evh1lWi5CTgnBq2DIor/aLGSC
	 l4z6U7vqizY53ke9AHCBDp8BShsAQIAoWQj7MfRCOJAi6Qbe8r0/4lkAwiCL77i4o8
	 6scPRqijcIBZnF30uyHH9WgPr1leK+Exu84UItNWLVPAMz+Y4vgqntYH0gh9fSrm/a
	 IXkVgMVuZJKgBJHLCH6UxDVSQ2+5tflWM5Dzw749g8SrlB1r3O0JQcUmc19WgW3hS6
	 0sRmMLw7LPmYQ==
From: Hans de Goede <hansg@kernel.org>
To: Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 16/25] media: i2c: ov01a10: Add cropping support / allow arbitrary sizes
Date: Tue, 14 Oct 2025 19:40:24 +0200
Message-ID: <20251014174033.20534-17-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014174033.20534-1-hansg@kernel.org>
References: <20251014174033.20534-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
---
 drivers/media/i2c/ov01a10.c | 344 ++++++++++++++++++++++--------------
 1 file changed, 210 insertions(+), 134 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index f3bcb61c88dd..e8ccb295fdc9 100644
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
@@ -261,7 +237,7 @@ static const s64 link_freq_menu_items[] = {
 };
 
 static const struct ov01a10_link_freq_config link_freq_configs[] = {
-	[OV01A10_LINK_FREQ_400MHZ_INDEX] = {
+	{
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mipi_data_rate_720mbps),
 			.regs = mipi_data_rate_720mbps,
@@ -269,19 +245,11 @@ static const struct ov01a10_link_freq_config link_freq_configs[] = {
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
@@ -304,7 +272,6 @@ struct ov01a10 {
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
 
-	const struct ov01a10_mode *cur_mode;
 	u32 link_freq_index;
 
 	struct clk *clk;
@@ -318,6 +285,22 @@ static inline struct ov01a10 *to_ov01a10(struct v4l2_subdev *subdev)
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
@@ -340,13 +323,16 @@ static int ov01a10_test_pattern(struct ov01a10 *ov01a10, u32 pattern)
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
@@ -358,10 +344,14 @@ static int ov01a10_set_hflip(struct ov01a10 *ov01a10, u32 hflip)
 
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
@@ -375,12 +365,13 @@ static int ov01a10_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -407,7 +398,7 @@ static int ov01a10_set_ctrl(struct v4l2_ctrl *ctrl)
 
 	case V4L2_CID_VBLANK:
 		ret = cci_write(ov01a10->regmap, OV01A10_REG_VTS,
-				ov01a10->cur_mode->height + ctrl->val, NULL);
+				fmt->height + ctrl->val, NULL);
 		break;
 
 	case V4L2_CID_TEST_PATTERN:
@@ -441,7 +432,6 @@ static int ov01a10_init_controls(struct ov01a10 *ov01a10)
 	struct v4l2_fwnode_device_properties props;
 	u32 vblank_min, vblank_max, vblank_default;
 	struct v4l2_ctrl_handler *ctrl_hdlr;
-	const struct ov01a10_mode *cur_mode;
 	s64 exposure_max, h_blank;
 	int ret = 0;
 
@@ -454,8 +444,6 @@ static int ov01a10_init_controls(struct ov01a10 *ov01a10)
 	if (ret)
 		return ret;
 
-	cur_mode = ov01a10->cur_mode;
-
 	ov01a10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr,
 						    &ov01a10_ctrl_ops,
 						    V4L2_CID_LINK_FREQ,
@@ -466,14 +454,14 @@ static int ov01a10_init_controls(struct ov01a10 *ov01a10)
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
@@ -485,7 +473,7 @@ static int ov01a10_init_controls(struct ov01a10 *ov01a10)
 			  OV01A10_DGTL_GAIN_MIN, OV01A10_DGTL_GAIN_MAX,
 			  OV01A10_DGTL_GAIN_STEP, OV01A10_DGTL_GAIN_DEFAULT);
 
-	exposure_max = cur_mode->vts_def - OV01A10_EXPOSURE_MAX_MARGIN;
+	exposure_max = OV01A10_VTS_DEF - OV01A10_EXPOSURE_MAX_MARGIN;
 	ov01a10->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov01a10_ctrl_ops,
 					      V4L2_CID_EXPOSURE,
 					      OV01A10_EXPOSURE_MIN,
@@ -525,24 +513,48 @@ static int ov01a10_init_controls(struct ov01a10 *ov01a10)
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
@@ -550,9 +562,14 @@ static int ov01a10_start_streaming(struct ov01a10 *ov01a10)
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
@@ -601,54 +618,64 @@ static int ov01a10_set_stream(struct v4l2_subdev *sd, int enable)
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
+	unsigned int width, height;
 
-	mode = v4l2_find_nearest_size(supported_modes,
-				      ARRAY_SIZE(supported_modes), width,
-				      height, fmt->format.width,
-				      fmt->format.height);
+	width = clamp_val(ALIGN(fmt->format.width, pattern_size),
+			  pattern_size,
+			  OV01A10_NATIVE_WIDTH - 2 * border_size);
+	height = clamp_val(ALIGN(fmt->format.height, pattern_size),
+			   pattern_size,
+			   OV01A10_NATIVE_HEIGHT - 2 * border_size);
 
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
@@ -669,14 +696,16 @@ static int ov01a10_enum_frame_size(struct v4l2_subdev *sd,
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
@@ -685,31 +714,79 @@ static int ov01a10_get_selection(struct v4l2_subdev *sd,
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
@@ -722,6 +799,7 @@ static const struct v4l2_subdev_pad_ops ov01a10_pad_ops = {
 	.set_fmt = ov01a10_set_format,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.get_selection = ov01a10_get_selection,
+	.set_selection = ov01a10_set_selection,
 	.enum_mbus_code = ov01a10_enum_mbus_code,
 	.enum_frame_size = ov01a10_enum_frame_size,
 };
@@ -941,8 +1019,6 @@ static int ov01a10_probe(struct i2c_client *client)
 	if (ret)
 		goto err_power_off;
 
-	ov01a10->cur_mode = &supported_modes[0];
-
 	ret = ov01a10_init_controls(ov01a10);
 	if (ret)
 		goto err_power_off;
-- 
2.51.0


