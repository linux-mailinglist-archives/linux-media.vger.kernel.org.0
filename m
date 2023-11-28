Return-Path: <linux-media+bounces-1205-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D56487FB68C
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 11:01:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB1EFB21C04
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 10:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B411E487B9;
	Tue, 28 Nov 2023 10:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MJ28J3TE"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DBDFDD
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 02:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701165668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cOiSylgiRMzXXdx787hT2M622QhbKp6OOpvEZl7SAgY=;
	b=MJ28J3TEDkYmltBUzKOZOg5lX69iF0Pdp4zLSok5H1ZK+zeqf314L08p6o4hTG9tr6BWof
	pNrTdqRUQkmWimtm2sRNfYkW9fINP2N5Ku/4QshLCjbwXl3AeV0RTxzoJFQe1NrVolMu6b
	ESJOO/93ByDL8iN6pabjpWZHmuaXHek=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-utU_jHDkOmyXEebBPz_njA-1; Tue, 28 Nov 2023 05:01:04 -0500
X-MC-Unique: utU_jHDkOmyXEebBPz_njA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2AB1F852ACD;
	Tue, 28 Nov 2023 10:01:04 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.244])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C36A020268D7;
	Tue, 28 Nov 2023 10:01:02 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 7/9] media: ov2740: Add support for 180 MHz link frequency
Date: Tue, 28 Nov 2023 11:00:45 +0100
Message-ID: <20231128100047.17529-8-hdegoede@redhat.com>
In-Reply-To: <20231128100047.17529-1-hdegoede@redhat.com>
References: <20231128100047.17529-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

On various Lenovo Thinkpad models with an ov2740 sensor the 360 MHz
link frequency is not supported.

Add support for 180 MHz link frequency, even though this has half the
pixel clock, this supports the same framerate by using half the VTS value
(significantly reducing the amount of empty lines send during vblank).

Normally if there are multiple link-frequencies then the sensor driver
choses the lowest link-frequency still usable for the chosen resolution.

In this case the board supports only 1 link-frequency. Which frequency
is supported is checked in ov2740_check_hwcfg() and then a different
set of supported_modes (using only the supported link-freq) is selected.

The register settings for this were taken from the ov2740 sensor driver
in the out of tree IPU6 driver:

https://github.com/intel/ipu6-drivers/

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2740.c | 262 +++++++++++++++++++++++++++++++++----
 1 file changed, 239 insertions(+), 23 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 28f4659a6bfb..28230a73ff75 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -16,6 +16,7 @@
 #include <media/v4l2-fwnode.h>
 
 #define OV2740_LINK_FREQ_360MHZ		360000000ULL
+#define OV2740_LINK_FREQ_180MHZ		180000000ULL
 #define OV2740_SCLK			72000000LL
 #define OV2740_MCLK			19200000
 #define OV2740_DATA_LANES		2
@@ -30,9 +31,6 @@
 
 /* vertical-timings from sensor */
 #define OV2740_REG_VTS			0x380e
-#define OV2740_VTS_DEF			0x088a
-#define OV2740_VTS_MIN			0x0460
-#define OV2740_VTS_MAX			0x7fff
 
 /* horizontal-timings from sensor */
 #define OV2740_REG_HTS			0x380c
@@ -86,6 +84,7 @@ struct nvm_data {
 
 enum {
 	OV2740_LINK_FREQ_360MHZ_INDEX,
+	OV2740_LINK_FREQ_180MHZ_INDEX,
 };
 
 struct ov2740_reg {
@@ -118,6 +117,9 @@ struct ov2740_mode {
 	/* Min vertical timining size */
 	u32 vts_min;
 
+	/* Max vertical timining size */
+	u32 vts_max;
+
 	/* Link frequency needed for this resolution */
 	u32 link_freq_index;
 
@@ -134,7 +136,18 @@ static const struct ov2740_reg mipi_data_rate_720mbps[] = {
 	{0x0312, 0x11},
 };
 
-static const struct ov2740_reg mode_1932x1092_regs[] = {
+static const struct ov2740_reg mipi_data_rate_360mbps[] = {
+	{0x0103, 0x01},
+	{0x0302, 0x4b},
+	{0x0303, 0x01},
+	{0x030d, 0x4b},
+	{0x030e, 0x02},
+	{0x030a, 0x01},
+	{0x0312, 0x11},
+	{0x4837, 0x2c},
+};
+
+static const struct ov2740_reg mode_1932x1092_regs_360mhz[] = {
 	{0x3000, 0x00},
 	{0x3018, 0x32},
 	{0x3031, 0x0a},
@@ -287,6 +300,159 @@ static const struct ov2740_reg mode_1932x1092_regs[] = {
 	{0x3813, 0x01},
 };
 
+static const struct ov2740_reg mode_1932x1092_regs_180mhz[] = {
+	{0x3000, 0x00},
+	{0x3018, 0x32},	/* 0x32 for 2 lanes, 0x12 for 1 lane */
+	{0x3031, 0x0a},
+	{0x3080, 0x08},
+	{0x3083, 0xB4},
+	{0x3103, 0x00},
+	{0x3104, 0x01},
+	{0x3106, 0x01},
+	{0x3500, 0x00},
+	{0x3501, 0x44},
+	{0x3502, 0x40},
+	{0x3503, 0x88},
+	{0x3507, 0x00},
+	{0x3508, 0x00},
+	{0x3509, 0x80},
+	{0x350c, 0x00},
+	{0x350d, 0x80},
+	{0x3510, 0x00},
+	{0x3511, 0x00},
+	{0x3512, 0x20},
+	{0x3632, 0x00},
+	{0x3633, 0x10},
+	{0x3634, 0x10},
+	{0x3635, 0x10},
+	{0x3645, 0x13},
+	{0x3646, 0x81},
+	{0x3636, 0x10},
+	{0x3651, 0x0a},
+	{0x3656, 0x02},
+	{0x3659, 0x04},
+	{0x365a, 0xda},
+	{0x365b, 0xa2},
+	{0x365c, 0x04},
+	{0x365d, 0x1d},
+	{0x365e, 0x1a},
+	{0x3662, 0xd7},
+	{0x3667, 0x78},
+	{0x3669, 0x0a},
+	{0x366a, 0x92},
+	{0x3700, 0x54},
+	{0x3702, 0x10},
+	{0x3706, 0x42},
+	{0x3709, 0x30},
+	{0x370b, 0xc2},
+	{0x3714, 0x63},
+	{0x3715, 0x01},
+	{0x3716, 0x00},
+	{0x371a, 0x3e},
+	{0x3732, 0x0e},
+	{0x3733, 0x10},
+	{0x375f, 0x0e},
+	{0x3768, 0x30},
+	{0x3769, 0x44},
+	{0x376a, 0x22},
+	{0x377b, 0x20},
+	{0x377c, 0x00},
+	{0x377d, 0x0c},
+	{0x3798, 0x00},
+	{0x37a1, 0x55},
+	{0x37a8, 0x6d},
+	{0x37c2, 0x04},
+	{0x37c5, 0x00},
+	{0x37c8, 0x00},
+	{0x3800, 0x00},
+	{0x3801, 0x00},
+	{0x3802, 0x00},
+	{0x3803, 0x00},
+	{0x3804, 0x07},
+	{0x3805, 0x8f},
+	{0x3806, 0x04},
+	{0x3807, 0x47},
+	{0x3808, 0x07},
+	{0x3809, 0x88},
+	{0x380a, 0x04},
+	{0x380b, 0x40},
+	{0x380c, 0x08},
+	{0x380d, 0x70},
+	{0x380e, 0x04},
+	{0x380f, 0x56},
+	{0x3810, 0x00},
+	{0x3811, 0x04},
+	{0x3812, 0x00},
+	{0x3813, 0x04},
+	{0x3814, 0x01},
+	{0x3815, 0x01},
+	{0x3820, 0x80},
+	{0x3821, 0x46},
+	{0x3822, 0x84},
+	{0x3829, 0x00},
+	{0x382a, 0x01},
+	{0x382b, 0x01},
+	{0x3830, 0x04},
+	{0x3836, 0x01},
+	{0x3837, 0x08},
+	{0x3839, 0x01},
+	{0x383a, 0x00},
+	{0x383b, 0x08},
+	{0x383c, 0x00},
+	{0x3f0b, 0x00},
+	{0x4001, 0x20},
+	{0x4009, 0x07},
+	{0x4003, 0x10},
+	{0x4010, 0xe0},
+	{0x4016, 0x00},
+	{0x4017, 0x10},
+	{0x4044, 0x02},
+	{0x4304, 0x08},
+	{0x4307, 0x30},
+	{0x4320, 0x80},
+	{0x4322, 0x00},
+	{0x4323, 0x00},
+	{0x4324, 0x00},
+	{0x4325, 0x00},
+	{0x4326, 0x00},
+	{0x4327, 0x00},
+	{0x4328, 0x00},
+	{0x4329, 0x00},
+	{0x432c, 0x03},
+	{0x432d, 0x81},
+	{0x4501, 0x84},
+	{0x4502, 0x40},
+	{0x4503, 0x18},
+	{0x4504, 0x04},
+	{0x4508, 0x02},
+	{0x4601, 0x10},
+	{0x4800, 0x00},
+	{0x4816, 0x52},
+	{0x5000, 0x73},	/* 0x7f enable DPC */
+	{0x5001, 0x00},
+	{0x5005, 0x38},
+	{0x501e, 0x0d},
+	{0x5040, 0x00},
+	{0x5901, 0x00},
+	{0x3800, 0x00},
+	{0x3801, 0x00},
+	{0x3802, 0x00},
+	{0x3803, 0x00},
+	{0x3804, 0x07},
+	{0x3805, 0x8f},
+	{0x3806, 0x04},
+	{0x3807, 0x47},
+	{0x3808, 0x07},
+	{0x3809, 0x8c},
+	{0x380a, 0x04},
+	{0x380b, 0x44},
+	{0x3810, 0x00},
+	{0x3811, 0x00},
+	{0x3812, 0x00},
+	{0x3813, 0x01},
+	{0x4003, 0x40},	/* set Black level to 0x40 */
+};
+
 static const char * const ov2740_test_pattern_menu[] = {
 	"Disabled",
 	"Color Bar",
@@ -297,6 +463,7 @@ static const char * const ov2740_test_pattern_menu[] = {
 
 static const s64 link_freq_menu_items[] = {
 	OV2740_LINK_FREQ_360MHZ,
+	OV2740_LINK_FREQ_180MHZ,
 };
 
 static const struct ov2740_link_freq_config link_freq_configs[] = {
@@ -306,23 +473,46 @@ static const struct ov2740_link_freq_config link_freq_configs[] = {
 			.regs = mipi_data_rate_720mbps,
 		}
 	},
+	[OV2740_LINK_FREQ_180MHZ_INDEX] = {
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mipi_data_rate_360mbps),
+			.regs = mipi_data_rate_360mbps,
+		}
+	},
 };
 
-static const struct ov2740_mode supported_modes[] = {
+static const struct ov2740_mode supported_modes_360mhz[] = {
 	{
 		.width = 1932,
 		.height = 1092,
 		.hts = 2160,
-		.vts_def = OV2740_VTS_DEF,
-		.vts_min = OV2740_VTS_MIN,
+		.vts_min = 1120,
+		.vts_def = 2186,
+		.vts_max = 32767,
 		.reg_list = {
-			.num_of_regs = ARRAY_SIZE(mode_1932x1092_regs),
-			.regs = mode_1932x1092_regs,
+			.num_of_regs = ARRAY_SIZE(mode_1932x1092_regs_360mhz),
+			.regs = mode_1932x1092_regs_360mhz,
 		},
 		.link_freq_index = OV2740_LINK_FREQ_360MHZ_INDEX,
 	},
 };
 
+static const struct ov2740_mode supported_modes_180mhz[] = {
+	{
+		.width = 1932,
+		.height = 1092,
+		.hts = 2160,
+		.vts_min = 1110,
+		.vts_def = 1110,
+		.vts_max = 2047,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1932x1092_regs_180mhz),
+			.regs = mode_1932x1092_regs_180mhz,
+		},
+		.link_freq_index = OV2740_LINK_FREQ_180MHZ_INDEX,
+	},
+};
+
 struct ov2740 {
 	struct v4l2_subdev sd;
 	struct media_pad pad;
@@ -345,6 +535,10 @@ struct ov2740 {
 	/* NVM data inforamtion */
 	struct nvm_data *nvm;
 
+	/* Supported modes */
+	const struct ov2740_mode *supported_modes;
+	int supported_modes_count;
+
 	/* True if the device has been identified */
 	bool identified;
 };
@@ -589,7 +783,7 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 					       pixel_rate, 1, pixel_rate);
 
 	vblank_min = cur_mode->vts_min - cur_mode->height;
-	vblank_max = OV2740_VTS_MAX - cur_mode->height;
+	vblank_max = cur_mode->vts_max - cur_mode->height;
 	vblank_default = cur_mode->vts_def - cur_mode->height;
 	ov2740->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
 					   V4L2_CID_VBLANK, vblank_min,
@@ -816,10 +1010,10 @@ static int ov2740_set_format(struct v4l2_subdev *sd,
 	const struct ov2740_mode *mode;
 	s32 vblank_def, h_blank;
 
-	mode = v4l2_find_nearest_size(supported_modes,
-				      ARRAY_SIZE(supported_modes), width,
-				      height, fmt->format.width,
-				      fmt->format.height);
+	mode = v4l2_find_nearest_size(ov2740->supported_modes,
+				      ov2740->supported_modes_count,
+				      width, height,
+				      fmt->format.width, fmt->format.height);
 
 	ov2740_update_pad_format(mode, &fmt->format);
 	*v4l2_subdev_get_pad_format(sd, sd_state, fmt->pad) = fmt->format;
@@ -836,7 +1030,7 @@ static int ov2740_set_format(struct v4l2_subdev *sd,
 	vblank_def = mode->vts_def - mode->height;
 	__v4l2_ctrl_modify_range(ov2740->vblank,
 				 mode->vts_min - mode->height,
-				 OV2740_VTS_MAX - mode->height, 1, vblank_def);
+				 mode->vts_max - mode->height, 1, vblank_def);
 	__v4l2_ctrl_s_ctrl(ov2740->vblank, vblank_def);
 	h_blank = mode->hts - mode->width;
 	__v4l2_ctrl_modify_range(ov2740->hblank, h_blank, h_blank, 1, h_blank);
@@ -860,7 +1054,10 @@ static int ov2740_enum_frame_size(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
-	if (fse->index >= ARRAY_SIZE(supported_modes))
+	struct ov2740 *ov2740 = to_ov2740(sd);
+	const struct ov2740_mode *supported_modes = ov2740->supported_modes;
+
+	if (fse->index >= ov2740->supported_modes_count)
 		return -EINVAL;
 
 	if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
@@ -877,7 +1074,9 @@ static int ov2740_enum_frame_size(struct v4l2_subdev *sd,
 static int ov2740_init_cfg(struct v4l2_subdev *sd,
 			   struct v4l2_subdev_state *sd_state)
 {
-	ov2740_update_pad_format(&supported_modes[0],
+	struct ov2740 *ov2740 = to_ov2740(sd);
+
+	ov2740_update_pad_format(&ov2740->supported_modes[0],
 				 v4l2_subdev_get_pad_format(sd, sd_state, 0));
 
 	return 0;
@@ -906,6 +1105,8 @@ static const struct media_entity_operations ov2740_subdev_entity_ops = {
 
 static int ov2740_check_hwcfg(struct device *dev)
 {
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov2740 *ov2740 = to_ov2740(sd);
 	struct fwnode_handle *ep;
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	struct v4l2_fwnode_endpoint bus_cfg = {
@@ -961,14 +1162,29 @@ static int ov2740_check_hwcfg(struct device *dev)
 				break;
 		}
 
-		if (j == bus_cfg.nr_of_link_frequencies) {
-			ret = dev_err_probe(dev, -EINVAL,
-					    "no link frequency %lld supported\n",
-					    link_freq_menu_items[i]);
-			goto check_hwcfg_error;
+		if (j == bus_cfg.nr_of_link_frequencies)
+			continue;
+
+		switch (i) {
+		case OV2740_LINK_FREQ_360MHZ_INDEX:
+			ov2740->supported_modes = supported_modes_360mhz;
+			ov2740->supported_modes_count =
+				ARRAY_SIZE(supported_modes_360mhz);
+			break;
+		case OV2740_LINK_FREQ_180MHZ_INDEX:
+			ov2740->supported_modes = supported_modes_180mhz;
+			ov2740->supported_modes_count =
+				ARRAY_SIZE(supported_modes_180mhz);
+			break;
 		}
+
+		break; /* Prefer modes from first available link-freq */
 	}
 
+	if (!ov2740->supported_modes)
+		ret = dev_err_probe(dev, -EINVAL,
+				    "no supported link frequencies\n");
+
 check_hwcfg_error:
 	v4l2_fwnode_endpoint_free(&bus_cfg);
 
@@ -1129,7 +1345,7 @@ static int ov2740_probe(struct i2c_client *client)
 		}
 	}
 
-	ov2740->cur_mode = &supported_modes[0];
+	ov2740->cur_mode = &ov2740->supported_modes[0];
 	ret = ov2740_init_controls(ov2740);
 	if (ret) {
 		dev_err_probe(dev, ret, "failed to init controls\n");
-- 
2.41.0


