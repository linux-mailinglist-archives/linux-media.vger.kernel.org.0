Return-Path: <linux-media+bounces-50429-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 88256D11ACC
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ADF033025D50
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559C3264609;
	Mon, 12 Jan 2026 10:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DVrlz8mK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F3B28FA9A
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 10:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212022; cv=none; b=dyzXuT2oLiNaxuZjwI+dcIjSRssDxm1ZI9DVLnY9glhctVxFFtAql9VD/JiwG8A1Yo0qYVojmQrA9yJQAiqf+jgFv7bTLDBUTq3MSQYS2H7Yc6v0SfK2PoL/Hhb5fhE20e2KrFX9BPK34rYtDI1bPc+rP84M4g771/9YTiO55MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212022; c=relaxed/simple;
	bh=SCMfN+iVdD7hGjfeEtDenjZlftq8/1qmL2O5A4PdsVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p91nrA1YLofpqZcGOhajhHchCRmPQJzNtmsYM5Q2fvxDpBP3L4ascbQ5YzOZo5ItSFDt95+bZnBcT7dOhyqwMve3+OGyqbzaFpL2gXD7jIihn6xg2bWYO+gbLN5MF1z1GcAMQGaCTkz8Ocap5CQ6h2UEnST81ksVYD8CKJ2bXuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DVrlz8mK; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768212018; x=1799748018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SCMfN+iVdD7hGjfeEtDenjZlftq8/1qmL2O5A4PdsVk=;
  b=DVrlz8mKze4JeZlLlfUQpDnk0xPieQ3VD0nzKrWS6E5SUPN8y06y2Nmi
   tu/446GIcj2/1jtML9sES87Xo/U1sZZ65BsC+MsMBueEPI6gJbUPs7uI5
   2WbecF8L8TcFMTKQpreyOt8eVzcvGd2NDzC2Q+Nz7vbUd87K/UFeUBQWf
   dE7GBeX1d43YKYNmZabCMu/zcfGZyxn8UkT43XS9V9/WOvXrTt8KyC9XO
   L+HxBifdDQ8FFECBYSmfG7YJBaxPnnDCvPFdG4XH7FqK5EfZDdNEIjX9m
   kCGEksTviQ7mdQmi2bovbeTZGkdHAxtXCzWMxQQDRHNdeDpnJHEMbl6G6
   Q==;
X-CSE-ConnectionGUID: JSp9hvN6Q+Wgp2OhpQtvPg==
X-CSE-MsgGUID: gcFhMPurRPako+iea/ifow==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69218825"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69218825"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 02:00:01 -0800
X-CSE-ConnectionGUID: trxb+Y3YTtOoSBAlvnZuKw==
X-CSE-MsgGUID: tLV+gOpvQe+YDRCsPTTd5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="234743182"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.52])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:59 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5C05B122016;
	Mon, 12 Jan 2026 11:59:50 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vfEiE-0000000012g-10aW;
	Mon, 12 Jan 2026 11:59:50 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	mehdi.djait@intel.com
Subject: [PATCH v2 21/23] media: i2c: ov01a10: Add ov01a10_sensor_cfg struct
Date: Mon, 12 Jan 2026 11:59:47 +0200
Message-ID: <20260112095949.3851-22-sakari.ailus@linux.intel.com>
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

Add a struct with some sensor variant (ov01a10 / ov01a1b / ov01a1s)
specific settings.

This is a preparation patch for adding support for the ov01a1s sensor
which uses the same sensor with a different (RGBI) color-filter.

Signed-off-by: Hans de Goede <hansg@kernel.org>
Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov01a10.c | 87 +++++++++++++++++++++++++------------
 1 file changed, 60 insertions(+), 27 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 1a02772bdf1c..a909f1ff8a76 100644
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
@@ -245,9 +235,19 @@ static const char * const ov01a10_supply_names[] = {
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
@@ -310,14 +310,15 @@ static int ov01a10_test_pattern(struct ov01a10 *ov01a10, u32 pattern)
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
@@ -329,14 +330,15 @@ static int ov01a10_set_hflip(struct ov01a10 *ov01a10, u32 hflip)
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
@@ -499,13 +501,14 @@ static int ov01a10_init_controls(struct ov01a10 *ov01a10)
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
@@ -625,9 +628,9 @@ static int ov01a10_set_format(struct v4l2_subdev *sd,
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
@@ -647,7 +650,7 @@ static int ov01a10_set_format(struct v4l2_subdev *sd,
 		crop->height = height;
 	}
 
-	ov01a10_fill_format(&fmt->format, width, height);
+	ov01a10_fill_format(ov01a10, &fmt->format, width, height);
 	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE)
@@ -659,8 +662,10 @@ static int ov01a10_set_format(struct v4l2_subdev *sd,
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
@@ -670,10 +675,12 @@ static int ov01a10_enum_mbus_code(struct v4l2_subdev *sd,
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
@@ -682,8 +689,9 @@ static int ov01a10_enum_frame_size(struct v4l2_subdev *sd,
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
@@ -700,7 +708,8 @@ static int ov01a10_get_selection(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *state,
 				 struct v4l2_subdev_selection *sel)
 {
-	const int border_size = OV01A10_BAYER_PATTERN_SIZE;
+	struct ov01a10 *ov01a10 = to_ov01a10(sd);
+	const int border_size = ov01a10->cfg->border_size;
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
@@ -731,9 +740,9 @@ static int ov01a10_set_selection(struct v4l2_subdev *sd,
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
@@ -973,20 +982,28 @@ static void ov01a10_remove(struct i2c_client *client)
 
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
@@ -1058,8 +1075,24 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov01a10_pm_ops, ov01a10_power_off,
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
2.47.3


