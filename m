Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81CEE73FCB4
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 15:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbjF0NUb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 09:20:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230422AbjF0NUW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 09:20:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D588294A
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 06:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687871949;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FRN8jdmQbs0Ct7tdD5GwBPHpSCJbV3s0YLJlqSUFcjc=;
        b=i3EILKQmGu8TIaATkozIuiBJFiQN0vVI8HQrtAUIjd/GEz7ub1x8W2aRoDy4qJ8AqU8O89
        rkbv4KhV91QOBFswdwWLXdx10XxuDHx6qwTtMA2Q9J2JYJ+QWiAPdqJEBG1V0r0pMUhpWW
        Vi8rJ5EV0kN+m36IeCDKVaKzNnt8rFk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-D5mwqKrROzeEkftdPx7mvw-1; Tue, 27 Jun 2023 09:19:06 -0400
X-MC-Unique: D5mwqKrROzeEkftdPx7mvw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E7438C80FF;
        Tue, 27 Jun 2023 13:19:05 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.24])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1DB52401061;
        Tue, 27 Jun 2023 13:19:04 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v3 21/29] media: ov2680: Make setting the mode algorithm based
Date:   Tue, 27 Jun 2023 15:18:22 +0200
Message-ID: <20230627131830.54601-22-hdegoede@redhat.com>
In-Reply-To: <20230627131830.54601-1-hdegoede@redhat.com>
References: <20230627131830.54601-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of using a long fixed register settings list for each resolution,
calculate the register settings based on the requested width + height.

This is based on atomisp-ov2680 commit 0611888592df ("media: atomisp:
ov2680: Make setting the modes algorithm based").

This will allow future enhancements like adding hblank and vblank controls
and adding selection support.

This also adds properly prgramming the ISP window and setting
the manual ISP window control bit in register 0x5708, this is
necessary for the hflip and vflip conrols to work properly.

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 315 +++++++++++++++++--------------------
 1 file changed, 143 insertions(+), 172 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 79789b9efadf..15e0b0ef5e8f 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -38,28 +38,44 @@
 #define OV2680_REG_EXPOSURE_PK			CCI_REG24(0x3500)
 #define OV2680_REG_R_MANUAL			CCI_REG8(0x3503)
 #define OV2680_REG_GAIN_PK			CCI_REG16(0x350a)
+
+#define OV2680_REG_SENSOR_CTRL_0A		CCI_REG8(0x370a)
+
+#define OV2680_REG_HORIZONTAL_START		CCI_REG16(0x3800)
+#define OV2680_REG_VERTICAL_START		CCI_REG16(0x3802)
+#define OV2680_REG_HORIZONTAL_END		CCI_REG16(0x3804)
+#define OV2680_REG_VERTICAL_END			CCI_REG16(0x3806)
+#define OV2680_REG_HORIZONTAL_OUTPUT_SIZE	CCI_REG16(0x3808)
+#define OV2680_REG_VERTICAL_OUTPUT_SIZE		CCI_REG16(0x380a)
 #define OV2680_REG_TIMING_HTS			CCI_REG16(0x380c)
 #define OV2680_REG_TIMING_VTS			CCI_REG16(0x380e)
+#define OV2680_REG_ISP_X_WIN			CCI_REG16(0x3810)
+#define OV2680_REG_ISP_Y_WIN			CCI_REG16(0x3812)
+#define OV2680_REG_X_INC			CCI_REG8(0x3814)
+#define OV2680_REG_Y_INC			CCI_REG8(0x3815)
 #define OV2680_REG_FORMAT1			CCI_REG8(0x3820)
 #define OV2680_REG_FORMAT2			CCI_REG8(0x3821)
 
 #define OV2680_REG_ISP_CTRL00			CCI_REG8(0x5080)
 
+#define OV2680_REG_X_WIN			CCI_REG16(0x5704)
+#define OV2680_REG_Y_WIN			CCI_REG16(0x5706)
+
 #define OV2680_FRAME_RATE			30
 
-#define OV2680_WIDTH_MAX			1600
-#define OV2680_HEIGHT_MAX			1200
+#define OV2680_NATIVE_WIDTH			1616
+#define OV2680_NATIVE_HEIGHT			1216
+
+/* 66MHz pixel clock: 66MHz / 1704 * 1294 = 30fps */
+#define OV2680_PIXELS_PER_LINE			1704
+#define OV2680_LINES_PER_FRAME			1294
+
+/* If possible send 16 extra rows / lines to the ISP as padding */
+#define OV2680_END_MARGIN			16
 
 #define OV2680_DEFAULT_WIDTH			800
 #define OV2680_DEFAULT_HEIGHT			600
 
-enum ov2680_mode_id {
-	OV2680_MODE_QUXGA_800_600,
-	OV2680_MODE_720P_1280_720,
-	OV2680_MODE_UXGA_1600_1200,
-	OV2680_MODE_MAX,
-};
-
 static const char * const ov2680_supply_name[] = {
 	"DOVDD",
 	"DVDD",
@@ -83,15 +99,6 @@ static const u8 ov2680_pll_multipliers[] = {
 	[OV2680_24_MHZ] = 55,
 };
 
-struct ov2680_mode_info {
-	const char *name;
-	enum ov2680_mode_id id;
-	u32 width;
-	u32 height;
-	const struct reg_sequence *reg_data;
-	u32 reg_data_size;
-};
-
 struct ov2680_ctrls {
 	struct v4l2_ctrl_handler handler;
 	struct v4l2_ctrl *exposure;
@@ -104,6 +111,15 @@ struct ov2680_ctrls {
 struct ov2680_mode {
 	struct v4l2_mbus_framefmt	fmt;
 	struct v4l2_fract		frame_interval;
+	bool				binning;
+	u16				h_start;
+	u16				v_start;
+	u16				h_end;
+	u16				v_end;
+	u16				h_output_size;
+	u16				v_output_size;
+	u16				hts;
+	u16				vts;
 };
 
 struct ov2680_dev {
@@ -125,8 +141,6 @@ struct ov2680_dev {
 
 	struct ov2680_ctrls		ctrls;
 	struct ov2680_mode		mode;
-
-	const struct ov2680_mode_info	*current_mode;
 };
 
 static const char * const test_pattern_menu[] = {
@@ -144,136 +158,19 @@ static const int ov2680_hv_flip_bayer_order[] = {
 	MEDIA_BUS_FMT_SRGGB10_1X10,
 };
 
-static const struct reg_sequence ov2680_setting_30fps_QUXGA_800_600[] = {
-	/* Set PLL SP DIV to 1 for binning mode */
-	{0x3086, 0x01},
-
-	/* Sensor control register 0x0a to 0x23 for binning mode */
-	{0x370a, 0x23},
-
-	/* Set X and Y output size to 800x600 */
-	{0x3808, 0x03},
-	{0x3809, 0x20},
-	{0x380a, 0x02},
-	{0x380b, 0x58},
-
-	/* Set HTS + VTS to 1708x644 */
-	{0x380c, 0x06},
-	{0x380d, 0xac},
-	{0x380e, 0x02},
-	{0x380f, 0x84},
-
-	/* Set ISP WIN X and Y start to 4x4 */
-	{0x3811, 0x04},
-	{0x3813, 0x04},
-
-	/* Set X INC and Y INC for binning */
-	{0x3814, 0x31},
-	{0x3815, 0x31},
-
-	/* Initialize FORMAT1 to default/reset value (vflip disabled) */
-	{0x3820, 0xc0},
+static const struct reg_sequence ov2680_global_setting[] = {
+	/* R MANUAL set exposure and gain to manual (hw does not do auto) */
+	{0x3503, 0x03},
 
 	/* Set black level compensation range to 0 - 3 (default 0 - 11) */
 	{0x4008, 0x00},
 	{0x4009, 0x03},
 
-	/* Set MIPI pclk period to 0x1e (default/reset is 0x18) */
-	{0x4837, 0x1e},
-
-	/* Initialize exposure to 0x4ee (overridden by the ctrl, drop this */
-	{0x3501, 0x4e},
-	{0x3502, 0xe0},
-
-	/* R MANUAL set exposure and gain to manual (hw does not do auto) */
-	{0x3503, 0x03},
-};
-
-static const struct reg_sequence ov2680_setting_30fps_720P_1280_720[] = {
-	/* Set PLL SP DIV to 0 for not binning mode */
-	{0x3086, 0x00},
-
-	/* Set X and Y output size to 1280x720 */
-	{0x3808, 0x05},
-	{0x3809, 0x00},
-	{0x380a, 0x02},
-	{0x380b, 0xd0},
-
-	/* Set HTS + VTS to 1704x1294 */
-	{0x380c, 0x06},
-	{0x380d, 0xa8},
-	{0x380e, 0x05},
-	{0x380f, 0x0e},
-
-	/* Set ISP WIN X and Y start to 8x6 */
-	{0x3811, 0x08},
-	{0x3813, 0x06},
-
-	/* Set X INC and Y INC for non binning */
-	{0x3814, 0x11},
-	{0x3815, 0x11},
-
-	/* Initialize FORMAT1 to default/reset value (vflip disabled) */
-	{0x3820, 0xc0},
-
-	/* Set backlight compensation range start to 0 */
-	{0x4008, 0x00},
-};
-
-static const struct reg_sequence ov2680_setting_30fps_UXGA_1600_1200[] = {
-	/* Set PLL SP DIV to 0 for not binning mode */
-	{0x3086, 0x00},
-
-	/* Initialize exposure to 0x4ee (overridden by the ctrl, drop this */
-	{0x3501, 0x4e},
-	{0x3502, 0xe0},
-
-	/* Set X and Y output size to 1600x1200 */
-	{0x3808, 0x06},
-	{0x3809, 0x40},
-	{0x380a, 0x04},
-	{0x380b, 0xb0},
-
-	/* Set HTS + VTS to 1704x1294 */
-	{0x380c, 0x06},
-	{0x380d, 0xa8},
-	{0x380e, 0x05},
-	{0x380f, 0x0e},
-
-	/* Set ISP WIN X and Y start to 0x0 */
-	{0x3811, 0x00},
-	{0x3813, 0x00},
-
-	/* Set X INC and Y INC for non binning */
-	{0x3814, 0x11},
-	{0x3815, 0x11},
-
-	/* Initialize FORMAT1 to default/reset value (vflip disabled) */
-	{0x3820, 0xc0},
-
-	/* Set backlight compensation range start to 0 */
-	{0x4008, 0x00},
-
-	/* Set MIPI pclk period to default/reset value of 0x18 */
-	{0x4837, 0x18}
-};
-
-static const struct ov2680_mode_info ov2680_mode_init_data = {
-	"mode_quxga_800_600", OV2680_MODE_QUXGA_800_600, 800, 600,
-	ov2680_setting_30fps_QUXGA_800_600,
-	ARRAY_SIZE(ov2680_setting_30fps_QUXGA_800_600),
-};
-
-static const struct ov2680_mode_info ov2680_mode_data[OV2680_MODE_MAX] = {
-	{"mode_quxga_800_600", OV2680_MODE_QUXGA_800_600,
-	 800, 600, ov2680_setting_30fps_QUXGA_800_600,
-	 ARRAY_SIZE(ov2680_setting_30fps_QUXGA_800_600)},
-	{"mode_720p_1280_720", OV2680_MODE_720P_1280_720,
-	 1280, 720, ov2680_setting_30fps_720P_1280_720,
-	 ARRAY_SIZE(ov2680_setting_30fps_720P_1280_720)},
-	{"mode_uxga_1600_1200", OV2680_MODE_UXGA_1600_1200,
-	 1600, 1200, ov2680_setting_30fps_UXGA_1600_1200,
-	 ARRAY_SIZE(ov2680_setting_30fps_UXGA_1600_1200)},
+	/*
+	 * Window CONTROL 0x00 -> 0x01, enable manual window control,
+	 * this is necessary for full size flip and mirror support.
+	 */
+	{0x5708, 0x01},
 };
 
 static struct ov2680_dev *to_ov2680_dev(struct v4l2_subdev *sd)
@@ -331,6 +228,85 @@ static void ov2680_fill_format(struct ov2680_dev *sensor,
 	ov2680_set_bayer_order(sensor, fmt);
 }
 
+static void ov2680_calc_mode(struct ov2680_dev *sensor)
+{
+	int width = sensor->mode.fmt.width;
+	int height = sensor->mode.fmt.height;
+	int orig_width = width;
+	int orig_height = height;
+
+	if (width  <= (OV2680_NATIVE_WIDTH / 2) &&
+	    height <= (OV2680_NATIVE_HEIGHT / 2)) {
+		sensor->mode.binning = true;
+		width *= 2;
+		height *= 2;
+	} else {
+		sensor->mode.binning = false;
+	}
+
+	sensor->mode.h_start = ((OV2680_NATIVE_WIDTH - width) / 2) & ~1;
+	sensor->mode.v_start = ((OV2680_NATIVE_HEIGHT - height) / 2) & ~1;
+	sensor->mode.h_end =
+		min(sensor->mode.h_start + width + OV2680_END_MARGIN - 1,
+		    OV2680_NATIVE_WIDTH - 1);
+	sensor->mode.v_end =
+		min(sensor->mode.v_start + height + OV2680_END_MARGIN - 1,
+		    OV2680_NATIVE_HEIGHT - 1);
+	sensor->mode.h_output_size = orig_width;
+	sensor->mode.v_output_size = orig_height;
+	sensor->mode.hts = OV2680_PIXELS_PER_LINE;
+	sensor->mode.vts = OV2680_LINES_PER_FRAME;
+}
+
+static int ov2680_set_mode(struct ov2680_dev *sensor)
+{
+	u8 sensor_ctrl_0a, inc, fmt1, fmt2;
+	int ret = 0;
+
+	if (sensor->mode.binning) {
+		sensor_ctrl_0a = 0x23;
+		inc = 0x31;
+		fmt1 = 0xc2;
+		fmt2 = 0x01;
+	} else {
+		sensor_ctrl_0a = 0x21;
+		inc = 0x11;
+		fmt1 = 0xc0;
+		fmt2 = 0x00;
+	}
+
+	cci_write(sensor->regmap, OV2680_REG_SENSOR_CTRL_0A,
+		  sensor_ctrl_0a, &ret);
+	cci_write(sensor->regmap, OV2680_REG_HORIZONTAL_START,
+		  sensor->mode.h_start, &ret);
+	cci_write(sensor->regmap, OV2680_REG_VERTICAL_START,
+		  sensor->mode.v_start, &ret);
+	cci_write(sensor->regmap, OV2680_REG_HORIZONTAL_END,
+		  sensor->mode.h_end, &ret);
+	cci_write(sensor->regmap, OV2680_REG_VERTICAL_END,
+		  sensor->mode.v_end, &ret);
+	cci_write(sensor->regmap, OV2680_REG_HORIZONTAL_OUTPUT_SIZE,
+		  sensor->mode.h_output_size, &ret);
+	cci_write(sensor->regmap, OV2680_REG_VERTICAL_OUTPUT_SIZE,
+		  sensor->mode.v_output_size, &ret);
+	cci_write(sensor->regmap, OV2680_REG_TIMING_HTS,
+		  sensor->mode.hts, &ret);
+	cci_write(sensor->regmap, OV2680_REG_TIMING_VTS,
+		  sensor->mode.vts, &ret);
+	cci_write(sensor->regmap, OV2680_REG_ISP_X_WIN, 0, &ret);
+	cci_write(sensor->regmap, OV2680_REG_ISP_Y_WIN, 0, &ret);
+	cci_write(sensor->regmap, OV2680_REG_X_INC, inc, &ret);
+	cci_write(sensor->regmap, OV2680_REG_Y_INC, inc, &ret);
+	cci_write(sensor->regmap, OV2680_REG_X_WIN,
+		  sensor->mode.h_output_size, &ret);
+	cci_write(sensor->regmap, OV2680_REG_Y_WIN,
+		  sensor->mode.v_output_size, &ret);
+	cci_write(sensor->regmap, OV2680_REG_FORMAT1, fmt1, &ret);
+	cci_write(sensor->regmap, OV2680_REG_FORMAT2, fmt2, &ret);
+
+	return ret;
+}
+
 static int ov2680_set_vflip(struct ov2680_dev *sensor, s32 val)
 {
 	int ret;
@@ -400,14 +376,12 @@ static int ov2680_stream_enable(struct ov2680_dev *sensor)
 		return ret;
 
 	ret = regmap_multi_reg_write(sensor->regmap,
-				     ov2680_mode_init_data.reg_data,
-				     ov2680_mode_init_data.reg_data_size);
+				     ov2680_global_setting,
+				     ARRAY_SIZE(ov2680_global_setting));
 	if (ret < 0)
 		return ret;
 
-	ret = regmap_multi_reg_write(sensor->regmap,
-				     sensor->current_mode->reg_data,
-				     sensor->current_mode->reg_data_size);
+	ret = ov2680_set_mode(sensor);
 	if (ret < 0)
 		return ret;
 
@@ -557,21 +531,18 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 {
 	struct ov2680_dev *sensor = to_ov2680_dev(sd);
 	struct v4l2_mbus_framefmt *try_fmt;
-	const struct ov2680_mode_info *mode;
+	unsigned int width, height;
 	int ret = 0;
 
 	if (format->pad != 0)
 		return -EINVAL;
 
-	mode = v4l2_find_nearest_size(ov2680_mode_data,
-				      ARRAY_SIZE(ov2680_mode_data),
-				      width, height,
-				      format->format.width,
-				      format->format.height);
-	if (!mode)
-		return -EINVAL;
+	width = min_t(unsigned int, ALIGN(format->format.width, 2),
+		      OV2680_NATIVE_WIDTH);
+	height = min_t(unsigned int, ALIGN(format->format.height, 2),
+		       OV2680_NATIVE_HEIGHT);
 
-	ov2680_fill_format(sensor, &format->format, mode->width, mode->height);
+	ov2680_fill_format(sensor, &format->format, width, height);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		try_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
@@ -586,8 +557,8 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 		goto unlock;
 	}
 
-	sensor->current_mode = mode;
 	sensor->mode.fmt = format->format;
+	ov2680_calc_mode(sensor);
 
 unlock:
 	mutex_unlock(&sensor->lock);
@@ -609,15 +580,20 @@ static int ov2680_enum_frame_size(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
-	int index = fse->index;
+	static const struct v4l2_frmsize_discrete ov2680_frame_sizes[] = {
+		{ 1600, 1200 },
+		{ 1280,  720 },
+		{  800,  600 },
+	};
+	u32 index = fse->index;
 
-	if (index >= OV2680_MODE_MAX || index < 0)
+	if (index >= ARRAY_SIZE(ov2680_frame_sizes))
 		return -EINVAL;
 
-	fse->min_width = ov2680_mode_data[index].width;
-	fse->min_height = ov2680_mode_data[index].height;
-	fse->max_width = ov2680_mode_data[index].width;
-	fse->max_height = ov2680_mode_data[index].height;
+	fse->min_width = ov2680_frame_sizes[index].width;
+	fse->min_height = ov2680_frame_sizes[index].height;
+	fse->max_width = ov2680_frame_sizes[index].width;
+	fse->max_height = ov2680_frame_sizes[index].height;
 
 	return 0;
 }
@@ -700,19 +676,14 @@ static const struct v4l2_subdev_ops ov2680_subdev_ops = {
 
 static int ov2680_mode_init(struct ov2680_dev *sensor)
 {
-	const struct ov2680_mode_info *init_mode;
-
 	/* set initial mode */
 	ov2680_fill_format(sensor, &sensor->mode.fmt,
 			   OV2680_DEFAULT_WIDTH, OV2680_DEFAULT_HEIGHT);
+	ov2680_calc_mode(sensor);
 
 	sensor->mode.frame_interval.denominator = OV2680_FRAME_RATE;
 	sensor->mode.frame_interval.numerator = 1;
 
-	init_mode = &ov2680_mode_init_data;
-
-	sensor->current_mode = init_mode;
-
 	return 0;
 }
 
-- 
2.41.0

