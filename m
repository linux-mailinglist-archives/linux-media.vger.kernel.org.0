Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C2AE7147FA
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 12:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbjE2KjZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 06:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231559AbjE2KjX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 06:39:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98D4ED9
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 03:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685356697;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZcD8fLyE712VOkia3ryPDYIuAR+q7WQfw7kQt3kwBEg=;
        b=A1RMN2u0j3LyyLmQfk2g47IykVEstTFul6QQJbbvK9Jzi4EmQiEGGBe4MWR73mEd6xbf2d
        GUDezNdyPiIGDH6kCxWmKfheKM9cOej4rQtY68sulwRTmv8XiMBYypwD1AwAGF7zY30Qpm
        CZ2fZFSn52OYfV3YikaM2XEG3xCp/4k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-CuChdyQdOI28qKySGlsZsw-1; Mon, 29 May 2023 06:38:14 -0400
X-MC-Unique: CuChdyQdOI28qKySGlsZsw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B38980027F;
        Mon, 29 May 2023 10:38:14 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.96])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0B1512166B2B;
        Mon, 29 May 2023 10:38:00 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 06/21] media: atomisp: ov2680: Implement selection support
Date:   Mon, 29 May 2023 12:37:26 +0200
Message-Id: <20230529103741.11904-7-hdegoede@redhat.com>
In-Reply-To: <20230529103741.11904-1-hdegoede@redhat.com>
References: <20230529103741.11904-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_PDS_OTHER_BAD_TLD,T_SCC_BODY_TEXT_LINE,
        URIBL_BLACK autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement selection support. Modelled after ov5693 selection support,
but allow setting sizes smaller then crop-size through set_fmt since
that was already allowed.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-ov2680.c        | 131 ++++++++++++++++--
 drivers/staging/media/atomisp/i2c/ov2680.h    |   9 ++
 2 files changed, 132 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 17fb773540e5..7fc0ccc66ab9 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -30,6 +30,13 @@
 
 #include "ov2680.h"
 
+static const struct v4l2_rect ov2680_default_crop = {
+	.left = OV2680_ACTIVE_START_LEFT,
+	.top = OV2680_ACTIVE_START_TOP,
+	.width = OV2680_ACTIVE_WIDTH,
+	.height = OV2680_ACTIVE_HEIGHT,
+};
+
 static int ov2680_write_reg_array(struct i2c_client *client,
 				  const struct ov2680_reg *reglist)
 {
@@ -174,8 +181,7 @@ static int ov2680_init_registers(struct v4l2_subdev *sd)
 }
 
 static struct v4l2_mbus_framefmt *
-__ov2680_get_pad_format(struct ov2680_dev *sensor,
-			struct v4l2_subdev_state *state,
+__ov2680_get_pad_format(struct ov2680_dev *sensor, struct v4l2_subdev_state *state,
 			unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
@@ -184,6 +190,20 @@ __ov2680_get_pad_format(struct ov2680_dev *sensor,
 	return &sensor->mode.fmt;
 }
 
+static struct v4l2_rect *
+__ov2680_get_pad_crop(struct ov2680_dev *sensor, struct v4l2_subdev_state *state,
+		      unsigned int pad, enum v4l2_subdev_format_whence which)
+{
+	switch (which) {
+	case V4L2_SUBDEV_FORMAT_TRY:
+		return v4l2_subdev_get_try_crop(&sensor->sd, state, pad);
+	case V4L2_SUBDEV_FORMAT_ACTIVE:
+		return &sensor->mode.crop;
+	}
+
+	return NULL;
+}
+
 static void ov2680_fill_format(struct ov2680_dev *sensor,
 			       struct v4l2_mbus_framefmt *fmt,
 			       unsigned int width, unsigned int height)
@@ -202,8 +222,8 @@ static void ov2680_calc_mode(struct ov2680_dev *sensor)
 	int orig_width = width;
 	int orig_height = height;
 
-	if (width  <= (OV2680_NATIVE_WIDTH / 2) &&
-	    height <= (OV2680_NATIVE_HEIGHT / 2)) {
+	if (width  <= (sensor->mode.crop.width / 2) &&
+	    height <= (sensor->mode.crop.height / 2)) {
 		sensor->mode.binning = true;
 		width *= 2;
 		height *= 2;
@@ -211,8 +231,10 @@ static void ov2680_calc_mode(struct ov2680_dev *sensor)
 		sensor->mode.binning = false;
 	}
 
-	sensor->mode.h_start = ((OV2680_NATIVE_WIDTH - width) / 2) & ~1;
-	sensor->mode.v_start = ((OV2680_NATIVE_HEIGHT - height) / 2) & ~1;
+	sensor->mode.h_start =
+		(sensor->mode.crop.left + (sensor->mode.crop.width - width) / 2) & ~1;
+	sensor->mode.v_start =
+		(sensor->mode.crop.top + (sensor->mode.crop.height - height) / 2) & ~1;
 	sensor->mode.h_end = min(sensor->mode.h_start + width + OV2680_END_MARGIN - 1,
 				 OV2680_NATIVE_WIDTH - 1);
 	sensor->mode.v_end = min(sensor->mode.v_start + height + OV2680_END_MARGIN - 1,
@@ -326,10 +348,16 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 {
 	struct ov2680_dev *sensor = to_ov2680_sensor(sd);
 	struct v4l2_mbus_framefmt *fmt;
+	const struct v4l2_rect *crop;
 	unsigned int width, height;
 
-	width = min_t(unsigned int, ALIGN(format->format.width, 2), OV2680_NATIVE_WIDTH);
-	height = min_t(unsigned int, ALIGN(format->format.height, 2), OV2680_NATIVE_HEIGHT);
+	crop = __ov2680_get_pad_crop(sensor, sd_state, format->pad, format->which);
+
+	/* Limit set_fmt max size to crop width / height */
+	width = clamp_t(unsigned int, ALIGN(format->format.width, 2),
+			OV2680_MIN_CROP_WIDTH, crop->width);
+	height = clamp_t(unsigned int, ALIGN(format->format.height, 2),
+			 OV2680_MIN_CROP_HEIGHT, crop->height);
 
 	fmt = __ov2680_get_pad_format(sensor, sd_state, format->pad, format->which);
 	ov2680_fill_format(sensor, fmt, width, height);
@@ -357,6 +385,88 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int ov2680_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_selection *sel)
+{
+	struct ov2680_dev *sensor = to_ov2680_sensor(sd);
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		mutex_lock(&sensor->lock);
+		sel->r = *__ov2680_get_pad_crop(sensor, state, sel->pad, sel->which);
+		mutex_unlock(&sensor->lock);
+		break;
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = OV2680_NATIVE_WIDTH;
+		sel->r.height = OV2680_NATIVE_HEIGHT;
+		break;
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sel->r.top = OV2680_ACTIVE_START_TOP;
+		sel->r.left = OV2680_ACTIVE_START_LEFT;
+		sel->r.width = OV2680_ACTIVE_WIDTH;
+		sel->r.height = OV2680_ACTIVE_HEIGHT;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int ov2680_set_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_selection *sel)
+{
+	struct ov2680_dev *sensor = to_ov2680_sensor(sd);
+	struct v4l2_mbus_framefmt *format;
+	struct v4l2_rect *__crop;
+	struct v4l2_rect rect;
+
+	if (sel->target != V4L2_SEL_TGT_CROP)
+		return -EINVAL;
+
+	/*
+	 * Clamp the boundaries of the crop rectangle to the size of the sensor
+	 * pixel array. Align to multiples of 2 to ensure Bayer pattern isn't
+	 * disrupted.
+	 */
+	rect.left = clamp(ALIGN(sel->r.left, 2), OV2680_NATIVE_START_LEFT,
+			  OV2680_NATIVE_WIDTH);
+	rect.top = clamp(ALIGN(sel->r.top, 2), OV2680_NATIVE_START_TOP,
+			 OV2680_NATIVE_HEIGHT);
+	rect.width = clamp_t(unsigned int, ALIGN(sel->r.width, 2),
+			     OV2680_MIN_CROP_WIDTH, OV2680_NATIVE_WIDTH);
+	rect.height = clamp_t(unsigned int, ALIGN(sel->r.height, 2),
+			      OV2680_MIN_CROP_HEIGHT, OV2680_NATIVE_HEIGHT);
+
+	/* Make sure the crop rectangle isn't outside the bounds of the array */
+	rect.width = min_t(unsigned int, rect.width,
+			   OV2680_NATIVE_WIDTH - rect.left);
+	rect.height = min_t(unsigned int, rect.height,
+			    OV2680_NATIVE_HEIGHT - rect.top);
+
+	__crop = __ov2680_get_pad_crop(sensor, state, sel->pad, sel->which);
+
+	if (rect.width != __crop->width || rect.height != __crop->height) {
+		/*
+		 * Reset the output image size if the crop rectangle size has
+		 * been modified.
+		 */
+		format = __ov2680_get_pad_format(sensor, state, sel->pad, sel->which);
+		format->width = rect.width;
+		format->height = rect.height;
+	}
+
+	*__crop = rect;
+	sel->r = rect;
+
+	return 0;
+}
+
 static int ov2680_init_cfg(struct v4l2_subdev *sd,
 			   struct v4l2_subdev_state *sd_state)
 {
@@ -369,6 +479,8 @@ static int ov2680_init_cfg(struct v4l2_subdev *sd,
 		}
 	};
 
+	sd_state->pads[0].try_crop = ov2680_default_crop;
+
 	return ov2680_set_fmt(sd, sd_state, &fmt);
 }
 
@@ -558,6 +670,8 @@ static const struct v4l2_subdev_pad_ops ov2680_pad_ops = {
 	.enum_frame_interval = ov2680_enum_frame_interval,
 	.get_fmt = ov2680_get_fmt,
 	.set_fmt = ov2680_set_fmt,
+	.get_selection = ov2680_get_selection,
+	.set_selection = ov2680_set_selection,
 };
 
 static const struct v4l2_subdev_ops ov2680_ops = {
@@ -677,6 +791,7 @@ static int ov2680_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	sensor->mode.crop = ov2680_default_crop;
 	ov2680_fill_format(sensor, &sensor->mode.fmt, OV2680_NATIVE_WIDTH, OV2680_NATIVE_HEIGHT);
 	ov2680_calc_mode(sensor);
 
diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index 4bcdd9fd0ce7..fd9c7485f8c1 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -32,6 +32,14 @@
 
 #define OV2680_NATIVE_WIDTH			1616
 #define OV2680_NATIVE_HEIGHT			1216
+#define OV2680_NATIVE_START_LEFT		0
+#define OV2680_NATIVE_START_TOP			0
+#define OV2680_ACTIVE_WIDTH			1600
+#define OV2680_ACTIVE_HEIGHT			1200
+#define OV2680_ACTIVE_START_LEFT		8
+#define OV2680_ACTIVE_START_TOP			8
+#define OV2680_MIN_CROP_WIDTH			2
+#define OV2680_MIN_CROP_HEIGHT			2
 
 /* 1704 * 1294 * 30fps = 66MHz pixel clock */
 #define OV2680_PIXELS_PER_LINE			1704
@@ -117,6 +125,7 @@ struct ov2680_dev {
 	bool is_streaming;
 
 	struct ov2680_mode {
+		struct v4l2_rect crop;
 		struct v4l2_mbus_framefmt fmt;
 		bool binning;
 		u16 h_start;
-- 
2.40.1

