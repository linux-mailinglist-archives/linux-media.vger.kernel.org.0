Return-Path: <linux-media+bounces-44468-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9120BBDAD1E
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 19:41:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 184C6355544
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 17:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1017930BBA1;
	Tue, 14 Oct 2025 17:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PBIMsrB3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9543043A5
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 17:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760463675; cv=none; b=FCRmN+opyDJmdbA+Sbg0BtILjYtJq+yXT4tuN2TNFY2WcLlmm936mc/LqxubgViVlM2z6/HUvAkbEsgj3in+6eVHmYIp9XKVb90i6Lp4thOsh0H82eguolMKkUy9xMm25WgUUTAkpw0RpwG/TerzoqiQ95rFt4vdV67RFHRqwrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760463675; c=relaxed/simple;
	bh=vCDepdssjHRuaxEUC2Ti8xmPtBBBUjw8KYgj/HPaRC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bMvwHYSfBjIbp1mxT2Rh1ytZgGBDd/ElP/uZHuAlMcexCF3ziBcf+XdHxQ82+5/v03ZkU4ItoFRKeKzwVI9JYqr7kfQK7dEbcjP0o5+dDPGSVcUwTSq/dRiHtif4Gv2YHrVdmSOOY34UWMiAmOiA9FLIIetbDEi3nRJYnv6hmf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PBIMsrB3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 253D1C113D0;
	Tue, 14 Oct 2025 17:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760463675;
	bh=vCDepdssjHRuaxEUC2Ti8xmPtBBBUjw8KYgj/HPaRC4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PBIMsrB3gSfxXW4rpW+G4upW/w18832n6Y1w6/1NE4Mmn2jE2qa35sLC1bJOQI7UQ
	 CPcFgMpLSupT6BPrNv+llM3zOy/L4hujpfIqfwdm3WjOuFpIF164OzqqSnNkkEOyfj
	 IehRfPyJybCErT0/RQNubdrEGBIY58AzNonNmioywc/+yXnQeWlONbcpTgO1aMsfvU
	 2gpg5oIefxuFbR8ykguhQVuVuBHYIijKs1KtHjWn+6uOCfXsOJp+hx+Y0urDtJbrHB
	 72HpuMQusT6Nv9H5PtllYHEm7If5r2ZzjwI9StOvc53zwJQ5Og+8WCJOSUaLh3D+L7
	 TFdPgnDXpYREA==
From: Hans de Goede <hansg@kernel.org>
To: Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 21/25] media: i2c: ov01a10: Add ov01a10_sensor_cfg struct
Date: Tue, 14 Oct 2025 19:40:29 +0200
Message-ID: <20251014174033.20534-22-hansg@kernel.org>
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

Add a struct with some sensor variant (ov01a10 / ov01a1b / ov01a1s)
specific settings.

This is a preparation patch for adding support for the ov01a1s sensor
which uses the same sensor with a different (RGBI) color-filter.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/i2c/ov01a10.c | 87 +++++++++++++++++++++++++------------
 1 file changed, 60 insertions(+), 27 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 17d8778561d4..51c9c015765f 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -88,16 +88,6 @@
 #define OV01A10_REG_TEST_PATTERN	CCI_REG8(0x4503)
 #define OV01A10_TEST_PATTERN_ENABLE	BIT(7)
 
-/*
- * The native ov01a10 bayer-pattern is GBRG, but there was a driver bug enabling
- * hflip/mirroring by default resulting in BGGR. Because of this bug Intel's
- * proprietary IPU6 userspace stack expects BGGR. So we report BGGR to not break
- * userspace and fix things up by shifting the crop window-x coordinate by 1
- * when hflip is *disabled*.
- */
-#define OV01A10_MEDIA_BUS_FMT		MEDIA_BUS_FMT_SBGGR10_1X10
-#define OV01A10_BAYER_PATTERN_SIZE	2 /* 2x2 */
-
 struct ov01a10_link_freq_config {
 	const struct reg_sequence *regs;
 	int regs_len;
@@ -246,9 +236,19 @@ static const char * const ov01a10_supply_names[] = {
 	"dvdd",		/* Digital core power */
 };
 
+struct ov01a10_sensor_cfg {
+	const char *model;
+	u32 bus_fmt;
+	int pattern_size;
+	int border_size;
+	bool invert_hflip_shift;
+	bool invert_vflip_shift;
+};
+
 struct ov01a10 {
 	struct device *dev;
 	struct regmap *regmap;
+	const struct ov01a10_sensor_cfg *cfg;
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct v4l2_ctrl_handler ctrl_handler;
@@ -311,14 +311,15 @@ static int ov01a10_test_pattern(struct ov01a10 *ov01a10, u32 pattern)
 			 NULL);
 }
 
-static int ov01a10_set_hflip(struct ov01a10 *ov01a10, u32 hflip)
+static int ov01a10_set_hflip(struct ov01a10 *ov01a10, bool hflip)
 {
 	struct v4l2_rect *crop = ov01a10_get_active_crop(ov01a10);
+	const struct ov01a10_sensor_cfg *cfg = ov01a10->cfg;
 	u32 val, offset;
 	int ret = 0;
 
 	offset = crop->left;
-	if (!hflip)
+	if ((hflip ^ cfg->invert_hflip_shift) && cfg->border_size)
 		offset++;
 
 	val = hflip ? 0 : FIELD_PREP(OV01A10_HFLIP_MASK, 0x1);
@@ -330,14 +331,15 @@ static int ov01a10_set_hflip(struct ov01a10 *ov01a10, u32 hflip)
 	return ret;
 }
 
-static int ov01a10_set_vflip(struct ov01a10 *ov01a10, u32 vflip)
+static int ov01a10_set_vflip(struct ov01a10 *ov01a10, bool vflip)
 {
 	struct v4l2_rect *crop = ov01a10_get_active_crop(ov01a10);
+	const struct ov01a10_sensor_cfg *cfg = ov01a10->cfg;
 	u32 val, offset;
 	int ret = 0;
 
 	offset = crop->top;
-	if (vflip)
+	if ((vflip ^ cfg->invert_vflip_shift) && cfg->border_size)
 		offset++;
 
 	val = vflip ? FIELD_PREP(OV01A10_VFLIP_MASK, 0x1) : 0;
@@ -500,13 +502,14 @@ static int ov01a10_init_controls(struct ov01a10 *ov01a10)
 	return ret;
 }
 
-static void ov01a10_fill_format(struct v4l2_mbus_framefmt *fmt,
+static void ov01a10_fill_format(struct ov01a10 *ov01a10,
+				struct v4l2_mbus_framefmt *fmt,
 				unsigned int width, unsigned int height)
 {
 	memset(fmt, 0, sizeof(*fmt));
 	fmt->width = width;
 	fmt->height = height;
-	fmt->code = OV01A10_MEDIA_BUS_FMT;
+	fmt->code = ov01a10->cfg->bus_fmt;
 	fmt->field = V4L2_FIELD_NONE;
 	fmt->colorspace = V4L2_COLORSPACE_RAW;
 }
@@ -626,9 +629,9 @@ static int ov01a10_set_format(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_format *fmt)
 {
 	struct v4l2_rect *crop = v4l2_subdev_state_get_crop(sd_state, fmt->pad);
-	const int pattern_size = OV01A10_BAYER_PATTERN_SIZE;
-	const int border_size = OV01A10_BAYER_PATTERN_SIZE;
 	struct ov01a10 *ov01a10 = to_ov01a10(sd);
+	const int pattern_size = ov01a10->cfg->pattern_size;
+	const int border_size = ov01a10->cfg->border_size;
 	unsigned int width, height;
 
 	width = clamp_val(ALIGN(fmt->format.width, pattern_size),
@@ -648,7 +651,7 @@ static int ov01a10_set_format(struct v4l2_subdev *sd,
 		crop->height = height;
 	}
 
-	ov01a10_fill_format(&fmt->format, width, height);
+	ov01a10_fill_format(ov01a10, &fmt->format, width, height);
 	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE)
@@ -660,8 +663,10 @@ static int ov01a10_set_format(struct v4l2_subdev *sd,
 static int ov01a10_init_state(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *sd_state)
 {
+	struct ov01a10 *ov01a10 = to_ov01a10(sd);
+
 	*v4l2_subdev_state_get_crop(sd_state, 0) = ov01a10_default_crop;
-	ov01a10_fill_format(v4l2_subdev_state_get_format(sd_state, 0),
+	ov01a10_fill_format(ov01a10, v4l2_subdev_state_get_format(sd_state, 0),
 			    OV01A10_DEFAULT_WIDTH, OV01A10_DEFAULT_HEIGHT);
 
 	return 0;
@@ -671,10 +676,12 @@ static int ov01a10_enum_mbus_code(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
+	struct ov01a10 *ov01a10 = to_ov01a10(sd);
+
 	if (code->index > 0)
 		return -EINVAL;
 
-	code->code = OV01A10_MEDIA_BUS_FMT;
+	code->code = ov01a10->cfg->bus_fmt;
 
 	return 0;
 }
@@ -683,8 +690,9 @@ static int ov01a10_enum_frame_size(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
-	const int pattern_size = OV01A10_BAYER_PATTERN_SIZE;
-	const int border_size = OV01A10_BAYER_PATTERN_SIZE;
+	struct ov01a10 *ov01a10 = to_ov01a10(sd);
+	const int pattern_size = ov01a10->cfg->pattern_size;
+	const int border_size = ov01a10->cfg->border_size;
 
 	if (fse->index)
 		return -EINVAL;
@@ -701,7 +709,8 @@ static int ov01a10_get_selection(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *state,
 				 struct v4l2_subdev_selection *sel)
 {
-	const int border_size = OV01A10_BAYER_PATTERN_SIZE;
+	struct ov01a10 *ov01a10 = to_ov01a10(sd);
+	const int border_size = ov01a10->cfg->border_size;
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
@@ -732,9 +741,9 @@ static int ov01a10_set_selection(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_selection *sel)
 {
-	const int pattern_size = OV01A10_BAYER_PATTERN_SIZE;
-	const int border_size = OV01A10_BAYER_PATTERN_SIZE;
 	struct ov01a10 *ov01a10 = to_ov01a10(sd);
+	const int pattern_size = ov01a10->cfg->pattern_size;
+	const int border_size = ov01a10->cfg->border_size;
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
 	struct v4l2_rect rect;
@@ -974,20 +983,28 @@ static void ov01a10_remove(struct i2c_client *client)
 
 static int ov01a10_probe(struct i2c_client *client)
 {
+	const struct ov01a10_sensor_cfg *cfg;
 	struct ov01a10 *ov01a10;
 	int ret;
 
+	cfg = device_get_match_data(&client->dev);
+	if (!cfg)
+		return -EINVAL;
+
 	ov01a10 = devm_kzalloc(&client->dev, sizeof(*ov01a10), GFP_KERNEL);
 	if (!ov01a10)
 		return -ENOMEM;
 
 	ov01a10->dev = &client->dev;
+	ov01a10->cfg = cfg;
 
 	ov01a10->regmap = devm_cci_regmap_init_i2c(client, 16);
 	if (IS_ERR(ov01a10->regmap))
 		return PTR_ERR(ov01a10->regmap);
 
 	v4l2_i2c_subdev_init(&ov01a10->sd, client, &ov01a10_subdev_ops);
+	/* Override driver->name with actual sensor model */
+	v4l2_i2c_subdev_set_name(&ov01a10->sd, client, cfg->model, NULL);
 	ov01a10->sd.internal_ops = &ov01a10_internal_ops;
 
 	ret = ov01a10_check_hwcfg(ov01a10);
@@ -1059,8 +1076,24 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov01a10_pm_ops, ov01a10_power_off,
 				 ov01a10_power_on, NULL);
 
 #ifdef CONFIG_ACPI
+/*
+ * The native ov01a10 bayer-pattern is GBRG, but there was a driver bug enabling
+ * hflip/mirroring by default resulting in BGGR. Because of this bug Intel's
+ * proprietary IPU6 userspace stack expects BGGR. So we report BGGR to not break
+ * userspace and fix things up by shifting the crop window-x coordinate by 1
+ * when hflip is *disabled*.
+ */
+static const struct ov01a10_sensor_cfg ov01a10_cfg = {
+	.model = "ov01a10",
+	.bus_fmt = MEDIA_BUS_FMT_SBGGR10_1X10,
+	.pattern_size = 2, /* 2x2 */
+	.border_size = 2,
+	.invert_hflip_shift = true,
+	.invert_vflip_shift = false,
+};
+
 static const struct acpi_device_id ov01a10_acpi_ids[] = {
-	{ "OVTI01A0" },
+	{ "OVTI01A0", (uintptr_t)&ov01a10_cfg },
 	{ }
 };
 
-- 
2.51.0


