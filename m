Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC74D6D31C3
	for <lists+linux-media@lfdr.de>; Sat,  1 Apr 2023 17:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbjDAPA5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Apr 2023 11:00:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbjDAPA4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Apr 2023 11:00:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEA751DFB6
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 08:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680361204;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7ReSuU32dFMkQH+TDGRhJotj/ixwxLO0kvOtAU6uj0o=;
        b=KE7WWfs0qx476ADlgzIFArwzOCSpUqgory02nih3jfaUXhqJ54smW4/6OtEY9HcdCg1xFY
        Rt2j6koGyQ1Z8luSM5lG8SnOJTr2Q8Si6GF7/YfhtANwzjArUlciysO9U50pdPMiZT0awO
        kjQuIJC4QDXoOAC2lYaGy1Umo01v//o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-CdYfV9J3MXCzLL-ezmaMiw-1; Sat, 01 Apr 2023 11:00:01 -0400
X-MC-Unique: CdYfV9J3MXCzLL-ezmaMiw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20A602A5955E;
        Sat,  1 Apr 2023 15:00:01 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8B23B400F59;
        Sat,  1 Apr 2023 14:59:59 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 14/28] media: atomisp: gc0310: Modernize and simply set_fmt(), get_fmt(), etc.
Date:   Sat,  1 Apr 2023 16:59:12 +0200
Message-Id: <20230401145926.596216-15-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-1-hdegoede@redhat.com>
References: <20230401145926.596216-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There only is 1 supported resolution allowing significant simplification
of the code; and also bring the code up2date with current subdev fmt
handling practices.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-gc0310.c        | 127 ++++++------------
 drivers/staging/media/atomisp/i2c/gc0310.h    |  72 ++--------
 2 files changed, 49 insertions(+), 150 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 239fc9012910..015795f32c3a 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -136,10 +136,6 @@ static int gc0310_init(struct v4l2_subdev *sd)
 	if (ret)
 		goto out_unlock;
 
-	/* restore settings */
-	gc0310_res = gc0310_res_preview;
-	N_RES = N_RES_PREVIEW;
-
 	/* restore value of all ctrls */
 	ret = __v4l2_ctrl_handler_setup(&dev->ctrls.handler);
 
@@ -300,76 +296,50 @@ static int gc0310_s_power(struct v4l2_subdev *sd, int on)
 	return gc0310_init(sd);
 }
 
-/* TODO: remove it. */
-static int startup(struct v4l2_subdev *sd)
+static struct v4l2_mbus_framefmt *
+gc0310_get_pad_format(struct gc0310_device *dev,
+		      struct v4l2_subdev_state *state,
+		      unsigned int pad, enum v4l2_subdev_format_whence which)
 {
-	struct gc0310_device *dev = to_gc0310_sensor(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret = 0;
+	if (which == V4L2_SUBDEV_FORMAT_TRY)
+		return v4l2_subdev_get_try_format(&dev->sd, state, pad);
 
-	ret = gc0310_write_reg_array(client, dev->res->regs, dev->res->reg_count);
-	if (ret) {
-		dev_err(&client->dev, "gc0310 write register err.\n");
-		return ret;
-	}
+	return &dev->mode.fmt;
+}
 
-	return ret;
+/* The GC0310 currently only supports 1 fixed fmt */
+static void gc0310_fill_format(struct v4l2_mbus_framefmt *fmt)
+{
+	memset(fmt, 0, sizeof(*fmt));
+	fmt->width = GC0310_NATIVE_WIDTH;
+	fmt->height = GC0310_NATIVE_HEIGHT;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->code = MEDIA_BUS_FMT_SGRBG8_1X8;
 }
 
 static int gc0310_set_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
-	struct v4l2_mbus_framefmt *fmt = &format->format;
-	struct gc0310_device *dev = to_gc0310_sensor(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	struct camera_mipi_info *gc0310_info = NULL;
-	struct gc0310_resolution *res;
-	int ret = 0;
-
-	if (format->pad)
-		return -EINVAL;
-
-	if (!fmt)
-		return -EINVAL;
-
-	gc0310_info = v4l2_get_subdev_hostdata(sd);
-	if (!gc0310_info)
-		return -EINVAL;
-
-	mutex_lock(&dev->input_lock);
+	struct gc0310_device *dev = to_gc0310_sensor(sd);
+	struct v4l2_mbus_framefmt *fmt;
+	int ret;
 
-	res = v4l2_find_nearest_size(gc0310_res_preview,
-				     ARRAY_SIZE(gc0310_res_preview), width,
-				     height, fmt->width, fmt->height);
-	if (!res)
-		res = &gc0310_res_preview[N_RES - 1];
+	fmt = gc0310_get_pad_format(dev, sd_state, format->pad, format->which);
+	gc0310_fill_format(fmt);
 
-	fmt->width = res->width;
-	fmt->height = res->height;
-	dev->res = res;
+	format->format = *fmt;
 
-	fmt->code = MEDIA_BUS_FMT_SGRBG8_1X8;
-
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		sd_state->pads->try_fmt = *fmt;
-		mutex_unlock(&dev->input_lock);
+	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
 		return 0;
-	}
 
+	mutex_lock(&dev->input_lock);
 	/* s_power has not been called yet for std v4l2 clients (camorama) */
 	power_up(sd);
-
-	dev_dbg(&client->dev, "%s: before gc0310_write_reg_array %s\n",
-		__func__, dev->res->desc);
-	ret = startup(sd);
-	if (ret) {
-		dev_err(&client->dev, "gc0310 startup err\n");
-		goto err;
-	}
-
-err:
+	ret = gc0310_write_reg_array(client, gc0310_VGA_30fps, ARRAY_SIZE(gc0310_VGA_30fps));
 	mutex_unlock(&dev->input_lock);
+
 	return ret;
 }
 
@@ -377,19 +347,11 @@ static int gc0310_get_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
 {
-	struct v4l2_mbus_framefmt *fmt = &format->format;
 	struct gc0310_device *dev = to_gc0310_sensor(sd);
+	struct v4l2_mbus_framefmt *fmt;
 
-	if (format->pad)
-		return -EINVAL;
-
-	if (!fmt)
-		return -EINVAL;
-
-	fmt->width = dev->res->width;
-	fmt->height = dev->res->height;
-	fmt->code = MEDIA_BUS_FMT_SGRBG8_1X8;
-
+	fmt = gc0310_get_pad_format(dev, sd_state, format->pad, format->which);
+	format->format = *fmt;
 	return 0;
 }
 
@@ -522,10 +484,8 @@ static int gc0310_s_config(struct v4l2_subdev *sd,
 static int gc0310_g_frame_interval(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_frame_interval *interval)
 {
-	struct gc0310_device *dev = to_gc0310_sensor(sd);
-
 	interval->interval.numerator = 1;
-	interval->interval.denominator = dev->res->fps;
+	interval->interval.denominator = GC0310_FPS;
 
 	return 0;
 }
@@ -534,7 +494,8 @@ static int gc0310_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
-	if (code->index >= MAX_FMTS)
+	/* We support only a single format */
+	if (code->index)
 		return -EINVAL;
 
 	code->code = MEDIA_BUS_FMT_SGRBG8_1X8;
@@ -545,27 +506,21 @@ static int gc0310_enum_frame_size(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
-	int index = fse->index;
-
-	if (index >= N_RES)
+	/* We support only a single resolution */
+	if (fse->index)
 		return -EINVAL;
 
-	fse->min_width = gc0310_res[index].width;
-	fse->min_height = gc0310_res[index].height;
-	fse->max_width = gc0310_res[index].width;
-	fse->max_height = gc0310_res[index].height;
+	fse->min_width = GC0310_NATIVE_WIDTH;
+	fse->max_width = GC0310_NATIVE_WIDTH;
+	fse->min_height = GC0310_NATIVE_HEIGHT;
+	fse->max_height = GC0310_NATIVE_HEIGHT;
 
 	return 0;
 }
 
 static int gc0310_g_skip_frames(struct v4l2_subdev *sd, u32 *frames)
 {
-	struct gc0310_device *dev = to_gc0310_sensor(sd);
-
-	mutex_lock(&dev->input_lock);
-	*frames = dev->res->skip_frames;
-	mutex_unlock(&dev->input_lock);
-
+	*frames = GC0310_SKIP_FRAMES;
 	return 0;
 }
 
@@ -642,9 +597,8 @@ static int gc0310_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	mutex_init(&dev->input_lock);
-
-	dev->res = &gc0310_res_preview[0];
 	v4l2_i2c_subdev_init(&dev->sd, client, &gc0310_ops);
+	gc0310_fill_format(&dev->mode.fmt);
 
 	pdata = gmin_camera_platform_data(&dev->sd,
 					  ATOMISP_INPUT_FORMAT_RAW_8,
@@ -664,7 +618,6 @@ static int gc0310_probe(struct i2c_client *client)
 
 	dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	dev->pad.flags = MEDIA_PAD_FL_SOURCE;
-	dev->format.code = MEDIA_BUS_FMT_SGRBG8_1X8;
 	dev->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
 	ret = gc0310_init_controls(dev);
diff --git a/drivers/staging/media/atomisp/i2c/gc0310.h b/drivers/staging/media/atomisp/i2c/gc0310.h
index c15ca2b807f9..1d22fd25e165 100644
--- a/drivers/staging/media/atomisp/i2c/gc0310.h
+++ b/drivers/staging/media/atomisp/i2c/gc0310.h
@@ -33,30 +33,14 @@
 
 #include "../include/linux/atomisp_platform.h"
 
-#define GC0310_FOCAL_LENGTH_NUM	278	/*2.78mm*/
+#define GC0310_NATIVE_WIDTH			656
+#define GC0310_NATIVE_HEIGHT			496
 
-#define MAX_FMTS		1
+#define GC0310_FPS				30
+#define GC0310_SKIP_FRAMES			3
 
-/*
- * focal length bits definition:
- * bits 31-16: numerator, bits 15-0: denominator
- */
-#define GC0310_FOCAL_LENGTH_DEFAULT 0x1160064
-
-/*
- * current f-number bits definition:
- * bits 31-16: numerator, bits 15-0: denominator
- */
-#define GC0310_F_NUMBER_DEFAULT 0x1a000a
+#define GC0310_FOCAL_LENGTH_NUM			278 /* 2.78mm */
 
-/*
- * f-number range bits definition:
- * bits 31-24: max f-number numerator
- * bits 23-16: max f-number denominator
- * bits 15-8: min f-number numerator
- * bits 7-0: min f-number denominator
- */
-#define GC0310_F_NUMBER_RANGE 0x1a0a1a0a
 #define GC0310_ID	0xa310
 
 #define GC0310_RESET_RELATED		0xFE
@@ -101,37 +85,21 @@
 #define GC0310_START_STREAMING			0x94 /* 8-bit enable */
 #define GC0310_STOP_STREAMING			0x0 /* 8-bit disable */
 
-#define GC0310_BIN_FACTOR_MAX			3
-
-struct gc0310_resolution {
-	u8 *desc;
-	const struct gc0310_reg *regs;
-	int reg_count;
-	int res;
-	int width;
-	int height;
-	int fps;
-	int pix_clk_freq;
-	u32 skip_frames;
-	u16 pixels_per_line;
-	u16 lines_per_frame;
-	bool used;
-};
-
 /*
  * gc0310 device structure.
  */
 struct gc0310_device {
 	struct v4l2_subdev sd;
 	struct media_pad pad;
-	struct v4l2_mbus_framefmt format;
 	struct mutex input_lock;
 
 	struct camera_sensor_platform_data *platform_data;
-	struct gc0310_resolution *res;
-	u8 type;
 	bool power_on;
 
+	struct gc0310_mode {
+		struct v4l2_mbus_framefmt fmt;
+	} mode;
+
 	struct gc0310_ctrls {
 		struct v4l2_ctrl_handler handler;
 		struct v4l2_ctrl *exposure;
@@ -337,26 +305,4 @@ static struct gc0310_reg const gc0310_VGA_30fps[] = {
 	{ 0xfe, 0x00 },
 };
 
-static struct gc0310_resolution gc0310_res_preview[] = {
-	{
-		.desc = "gc0310_VGA_30fps",
-		.width = 656, // 648,
-		.height = 496, // 488,
-		.fps = 30,
-		//.pix_clk_freq = 73,
-		.used = 0,
-#if 0
-		.pixels_per_line = 0x0314,
-		.lines_per_frame = 0x0213,
-#endif
-		.skip_frames = 2,
-		.regs = gc0310_VGA_30fps,
-		.reg_count = ARRAY_SIZE(gc0310_VGA_30fps),
-	},
-};
-
-#define N_RES_PREVIEW (ARRAY_SIZE(gc0310_res_preview))
-
-static struct gc0310_resolution *gc0310_res = gc0310_res_preview;
-static unsigned long N_RES = N_RES_PREVIEW;
 #endif
-- 
2.39.1

