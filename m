Return-Path: <linux-media+bounces-28079-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E97A5D447
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 03:08:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 549727A9B31
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 02:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A267114AD20;
	Wed, 12 Mar 2025 02:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ym8BXMaY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAB513AD38
	for <linux-media@vger.kernel.org>; Wed, 12 Mar 2025 02:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741745270; cv=none; b=LcbypypLwQcFVTMi/pKVAT0BTbs1TiyKbTnrl535TAV+vHkKrhE56EN/2NliO9rYXu5sQ/1Jf4X0wzBHjioJM7GYP6WgKSDKq58C4kLytaWXfbFPUDe1DPH8uf/YvaJYJqlRo/48gGw64UL6DJCXuhplKKxUwUHeWheajGfzSuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741745270; c=relaxed/simple;
	bh=c3XpEGLqZyGxJdeN/HY6VOTe2SBDpiUckABrLONPODI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iNadfhttjF1/s9FH2E5vjWhg+ndicS2S2RNvtd7CXznleFZpTeIrFcYH6/ieQplSAarY3E8KyevGonG6abUZXWFhmJK6gcYbn88RRXfNMc9LgxwaaeslribW7uyb2uMyjpGRDvCkY2R4f9eVPai9JpSmSV6MKo5ZrJZKVTJD0tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ym8BXMaY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741745269; x=1773281269;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c3XpEGLqZyGxJdeN/HY6VOTe2SBDpiUckABrLONPODI=;
  b=Ym8BXMaY0LiueqQGlRj1ua4Rdn4l4QJqP+nhFJE9x7QSkymNq3pDGxYE
   qtGNBizLoRYoHnBfIHxaz28hSu5fHlPKgw/etNIE16SITYrtUPd/N+aA8
   Lf25JWK2SH97CDMsqiklaETW8sfzSKOLmj+K6kui5XM51lBu6QPtOJMRu
   IeLaDrLeVgPBmo8gVvdCJhmWyX3Dwhk7OTWbhOP1ukhOsyQ7UJHzA0ea9
   6mg8IP3hc0W8LGj81u0O0PRe6FwFAjLnIFyy/H5JJFpMUNdL/hhlSobXA
   Di/ZFB1vA3QtPHxGaAMhggj2llgqfH4fNgw9zlGAtvhvhcb6Bxns0whfb
   A==;
X-CSE-ConnectionGUID: LwaicEVeRwisNsU8YIdxPQ==
X-CSE-MsgGUID: weZXnSPXQd23gw0oTXjqKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="46455414"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="46455414"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 19:07:49 -0700
X-CSE-ConnectionGUID: n2K2d5TBRZOnkFKKYDcScA==
X-CSE-MsgGUID: Rl4Pq7FwTtOMy2AU5HyoOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="125681027"
Received: from haoyao-desk.bj.intel.com ([10.238.232.12])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 19:07:46 -0700
From: Hao Yao <hao.yao@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Arec Kao <arec.kao@intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	Hao Yao <hao.yao@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v3 3/3] media: i2c: ov13b10: Support 2 lane mode
Date: Wed, 12 Mar 2025 10:06:28 +0800
Message-ID: <20250312020713.687778-3-hao.yao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250312020713.687778-1-hao.yao@intel.com>
References: <20250312020713.687778-1-hao.yao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1. Fix pixel rate calculation to consider different lane number
2. Add 2104x1560 60fps 2 data lanes register setting
3. Support 2 lane in check_hwcfg
4. Select correct mode considering lane number used

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Hao Yao <hao.yao@intel.com>
---
 drivers/media/i2c/ov13b10.c | 140 ++++++++++++++++++++++++++++++------
 1 file changed, 118 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index 2e83fc23f321..e85c7d33a670 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -514,6 +514,52 @@ static const struct ov13b10_reg mode_1364x768_120fps_regs[] = {
 	{0x5001, 0x0d},
 };
 
+static const struct ov13b10_reg mode_2lanes_2104x1560_60fps_regs[] = {
+	{0x3016, 0x32},
+	{0x3106, 0x29},
+	{0x0305, 0xaf},
+	{0x3501, 0x06},
+	{0x3662, 0x88},
+	{0x3714, 0x28},
+	{0x3739, 0x10},
+	{0x37c2, 0x14},
+	{0x37d9, 0x06},
+	{0x37e2, 0x0c},
+	{0x3800, 0x00},
+	{0x3801, 0x00},
+	{0x3802, 0x00},
+	{0x3803, 0x08},
+	{0x3804, 0x10},
+	{0x3805, 0x8f},
+	{0x3806, 0x0c},
+	{0x3807, 0x47},
+	{0x3808, 0x08},
+	{0x3809, 0x38},
+	{0x380a, 0x06},
+	{0x380b, 0x18},
+	{0x380c, 0x04},
+	{0x380d, 0x98},
+	{0x380e, 0x06},
+	{0x380f, 0x3e},
+	{0x3810, 0x00},
+	{0x3811, 0x07},
+	{0x3812, 0x00},
+	{0x3813, 0x05},
+	{0x3814, 0x03},
+	{0x3816, 0x03},
+	{0x3820, 0x8b},
+	{0x3c8c, 0x18},
+	{0x4008, 0x00},
+	{0x4009, 0x05},
+	{0x4050, 0x00},
+	{0x4051, 0x05},
+	{0x4501, 0x08},
+	{0x4505, 0x00},
+	{0x4837, 0x0e},
+	{0x5000, 0xfd},
+	{0x5001, 0x0d},
+};
+
 static const char * const ov13b10_test_pattern_menu[] = {
 	"Disabled",
 	"Vertical Color Bar Type 1",
@@ -527,15 +573,16 @@ static const char * const ov13b10_test_pattern_menu[] = {
 #define OV13B10_LINK_FREQ_INDEX_0	0
 
 #define OV13B10_EXT_CLK			19200000
-#define OV13B10_DATA_LANES		4
+#define OV13B10_4_DATA_LANES		4
+#define OV13B10_2_DATA_LANES		2
 
 /*
- * pixel_rate = link_freq * data-rate * nr_of_lanes / bits_per_sample
- * data rate => double data rate; number of lanes => 4; bits per pixel => 10
+ * pixel_rate = data_rate * nr_of_lanes / bits_per_pixel
+ * data_rate => link_freq * 2; number of lanes => 4 or 2; bits per pixel => 10
  */
-static u64 link_freq_to_pixel_rate(u64 f)
+static u64 link_freq_to_pixel_rate(u64 f, u8 lanes)
 {
-	f *= 2 * OV13B10_DATA_LANES;
+	f *= 2 * lanes;
 	do_div(f, 10);
 
 	return f;
@@ -559,7 +606,8 @@ static const struct ov13b10_link_freq_config
 };
 
 /* Mode configs */
-static const struct ov13b10_mode supported_modes[] = {
+static const struct ov13b10_mode supported_4_lanes_modes[] = {
+	/* 4 data lanes */
 	{
 		.width = 4208,
 		.height = 3120,
@@ -634,6 +682,23 @@ static const struct ov13b10_mode supported_modes[] = {
 	},
 };
 
+static const struct ov13b10_mode supported_2_lanes_modes[] = {
+	/* 2 data lanes */
+	{
+		.width = 2104,
+		.height = 1560,
+		.vts_def = OV13B10_VTS_60FPS,
+		.vts_min = OV13B10_VTS_60FPS,
+		.link_freq_index = OV13B10_LINK_FREQ_INDEX_0,
+		.ppl = 2352,
+		.reg_list = {
+			.num_of_regs =
+				ARRAY_SIZE(mode_2lanes_2104x1560_60fps_regs),
+			.regs = mode_2lanes_2104x1560_60fps_regs,
+		},
+	},
+};
+
 struct ov13b10 {
 	struct v4l2_subdev sd;
 	struct media_pad pad;
@@ -651,12 +716,20 @@ struct ov13b10 {
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
 
+	/* Supported modes */
+	const struct ov13b10_mode *supported_modes;
+
 	/* Current mode */
 	const struct ov13b10_mode *cur_mode;
 
 	/* Mutex for serialized access */
 	struct mutex mutex;
 
+	u8 supported_modes_num;
+
+	/* Data lanes used */
+	u8 data_lanes;
+
 	/* True if the device has been identified */
 	bool identified;
 };
@@ -760,8 +833,8 @@ static int ov13b10_write_reg_list(struct ov13b10 *ov13b,
 /* Open sub-device */
 static int ov13b10_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
-	const struct ov13b10_mode *default_mode = &supported_modes[0];
 	struct ov13b10 *ov13b = to_ov13b10(sd);
+	const struct ov13b10_mode *default_mode = ov13b->supported_modes;
 	struct v4l2_mbus_framefmt *try_fmt = v4l2_subdev_state_get_format(fh->state,
 									  0);
 
@@ -980,7 +1053,10 @@ static int ov13b10_enum_frame_size(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
-	if (fse->index >= ARRAY_SIZE(supported_modes))
+	struct ov13b10 *ov13b = to_ov13b10(sd);
+	const struct ov13b10_mode *supported_modes = ov13b->supported_modes;
+
+	if (fse->index >= ov13b->supported_modes_num)
 		return -EINVAL;
 
 	if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
@@ -1040,6 +1116,7 @@ ov13b10_set_pad_format(struct v4l2_subdev *sd,
 {
 	struct ov13b10 *ov13b = to_ov13b10(sd);
 	const struct ov13b10_mode *mode;
+	const struct ov13b10_mode *supported_modes = ov13b->supported_modes;
 	struct v4l2_mbus_framefmt *framefmt;
 	s32 vblank_def;
 	s32 vblank_min;
@@ -1054,7 +1131,7 @@ ov13b10_set_pad_format(struct v4l2_subdev *sd,
 		fmt->format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
 
 	mode = v4l2_find_nearest_size(supported_modes,
-				      ARRAY_SIZE(supported_modes),
+				      ov13b->supported_modes_num,
 				      width, height,
 				      fmt->format.width, fmt->format.height);
 	ov13b10_update_pad_format(mode, fmt);
@@ -1065,7 +1142,8 @@ ov13b10_set_pad_format(struct v4l2_subdev *sd,
 		ov13b->cur_mode = mode;
 		__v4l2_ctrl_s_ctrl(ov13b->link_freq, mode->link_freq_index);
 		link_freq = link_freq_menu_items[mode->link_freq_index];
-		pixel_rate = link_freq_to_pixel_rate(link_freq);
+		pixel_rate = link_freq_to_pixel_rate(link_freq,
+						     ov13b->data_lanes);
 		__v4l2_ctrl_s_ctrl_int64(ov13b->pixel_rate, pixel_rate);
 
 		/* Update limits and set FPS to default */
@@ -1312,7 +1390,8 @@ static int ov13b10_init_controls(struct ov13b10 *ov13b)
 	if (ov13b->link_freq)
 		ov13b->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	pixel_rate_max = link_freq_to_pixel_rate(link_freq_menu_items[0]);
+	pixel_rate_max = link_freq_to_pixel_rate(link_freq_menu_items[0],
+						 ov13b->data_lanes);
 	pixel_rate_min = 0;
 	/* By default, PIXEL_RATE is read only */
 	ov13b->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &ov13b10_ctrl_ops,
@@ -1423,7 +1502,7 @@ static int ov13b10_get_pm_resources(struct device *dev)
 	return 0;
 }
 
-static int ov13b10_check_hwcfg(struct device *dev)
+static int ov13b10_check_hwcfg(struct device *dev, struct ov13b10 *ov13b)
 {
 	struct v4l2_fwnode_endpoint bus_cfg = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY
@@ -1433,6 +1512,7 @@ static int ov13b10_check_hwcfg(struct device *dev)
 	unsigned int i, j;
 	int ret;
 	u32 ext_clk;
+	u8 dlane;
 
 	if (!fwnode)
 		return -ENXIO;
@@ -1459,13 +1539,32 @@ static int ov13b10_check_hwcfg(struct device *dev)
 	if (ret)
 		return ret;
 
-	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV13B10_DATA_LANES) {
+	dlane = bus_cfg.bus.mipi_csi2.num_data_lanes;
+	switch (dlane) {
+	case OV13B10_4_DATA_LANES:
+		ov13b->supported_modes = supported_4_lanes_modes;
+		ov13b->supported_modes_num =
+			ARRAY_SIZE(supported_4_lanes_modes);
+		break;
+
+	case OV13B10_2_DATA_LANES:
+		ov13b->supported_modes = supported_2_lanes_modes;
+		ov13b->supported_modes_num =
+			ARRAY_SIZE(supported_2_lanes_modes);
+		break;
+
+	default:
 		dev_err(dev, "number of CSI2 data lanes %d is not supported",
-			bus_cfg.bus.mipi_csi2.num_data_lanes);
+			dlane);
 		ret = -EINVAL;
 		goto out_err;
 	}
 
+	ov13b->data_lanes = dlane;
+	ov13b->cur_mode = ov13b->supported_modes;
+	dev_dbg(dev, "%u lanes with %u modes selected\n",
+		ov13b->data_lanes, ov13b->supported_modes_num);
+
 	if (!bus_cfg.nr_of_link_frequencies) {
 		dev_err(dev, "no link frequencies defined");
 		ret = -EINVAL;
@@ -1499,17 +1598,17 @@ static int ov13b10_probe(struct i2c_client *client)
 	bool full_power;
 	int ret;
 
+	ov13b = devm_kzalloc(&client->dev, sizeof(*ov13b), GFP_KERNEL);
+	if (!ov13b)
+		return -ENOMEM;
+
 	/* Check HW config */
-	ret = ov13b10_check_hwcfg(&client->dev);
+	ret = ov13b10_check_hwcfg(&client->dev, ov13b);
 	if (ret) {
 		dev_err(&client->dev, "failed to check hwcfg: %d", ret);
 		return ret;
 	}
 
-	ov13b = devm_kzalloc(&client->dev, sizeof(*ov13b), GFP_KERNEL);
-	if (!ov13b)
-		return -ENOMEM;
-
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&ov13b->sd, client, &ov13b10_subdev_ops);
 
@@ -1533,9 +1632,6 @@ static int ov13b10_probe(struct i2c_client *client)
 		}
 	}
 
-	/* Set default mode to max resolution */
-	ov13b->cur_mode = &supported_modes[0];
-
 	ret = ov13b10_init_controls(ov13b);
 	if (ret)
 		goto error_power_off;
-- 
2.43.0


