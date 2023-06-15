Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 095F1731B14
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 16:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345043AbjFOOPt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 10:15:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345023AbjFOOPn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 10:15:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E1C295C
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 07:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686838492;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0nC/s8J9ZuBviW11GeGAOygId4lZxL2xKtN/RIjlKx8=;
        b=IG7Ae055wFWVmYs57dbdqZt6pPkjzmo59Wvw8+LtHYbiSgIRHNhDqFWX97K8lC0LlE/g/z
        6IPxrzh1oPlvjQoVF9Y/c1SylwYg7rdiYbDt2/q8R3mSAQc6ZTBNzbnRJZdODAksN5hUVs
        iLjWKpMuF/cC7hPdx6DemZQ0BQ2tDKE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-7IChEnH5PE-dclH6L1tkHw-1; Thu, 15 Jun 2023 10:14:43 -0400
X-MC-Unique: 7IChEnH5PE-dclH6L1tkHw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7276C8008A4;
        Thu, 15 Jun 2023 14:14:21 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.154])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5D92448FB01;
        Thu, 15 Jun 2023 14:14:20 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 23/28] media: ov2680: Implement selection support
Date:   Thu, 15 Jun 2023 16:13:44 +0200
Message-Id: <20230615141349.172363-24-hdegoede@redhat.com>
In-Reply-To: <20230615141349.172363-1-hdegoede@redhat.com>
References: <20230615141349.172363-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLACK autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement selection support. Modelled after ov5693 selection support,
but allow setting sizes smaller than crop-size through set_fmt() since
that was already allowed.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Use clamp_val() instead of clamp() / clamp_t()
---
 drivers/media/i2c/ov2680.c | 144 ++++++++++++++++++++++++++++++++++---
 1 file changed, 134 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 94b768bea327..adffe3438660 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -65,6 +65,14 @@
 
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
 
 /* 66MHz pixel clock: 66MHz / 1704 * 1294 = 30fps */
 #define OV2680_PIXELS_PER_LINE			1704
@@ -109,6 +117,7 @@ struct ov2680_ctrls {
 };
 
 struct ov2680_mode {
+	struct v4l2_rect		crop;
 	struct v4l2_mbus_framefmt	fmt;
 	struct v4l2_fract		frame_interval;
 	bool				binning;
@@ -143,6 +152,13 @@ struct ov2680_dev {
 	struct ov2680_mode		mode;
 };
 
+static const struct v4l2_rect ov2680_default_crop = {
+	.left = OV2680_ACTIVE_START_LEFT,
+	.top = OV2680_ACTIVE_START_TOP,
+	.width = OV2680_ACTIVE_WIDTH,
+	.height = OV2680_ACTIVE_HEIGHT,
+};
+
 static const char * const test_pattern_menu[] = {
 	"Disabled",
 	"Color Bars",
@@ -228,6 +244,18 @@ __ov2680_get_pad_format(struct ov2680_dev *sensor,
 	return &sensor->mode.fmt;
 }
 
+static struct v4l2_rect *
+__ov2680_get_pad_crop(struct ov2680_dev *sensor,
+		      struct v4l2_subdev_state *state,
+		      unsigned int pad,
+		      enum v4l2_subdev_format_whence which)
+{
+	if (which == V4L2_SUBDEV_FORMAT_TRY)
+		return v4l2_subdev_get_try_crop(&sensor->sd, state, pad);
+
+	return &sensor->mode.crop;
+}
+
 static void ov2680_fill_format(struct ov2680_dev *sensor,
 			       struct v4l2_mbus_framefmt *fmt,
 			       unsigned int width, unsigned int height)
@@ -247,8 +275,8 @@ static void ov2680_calc_mode(struct ov2680_dev *sensor)
 	int orig_width = width;
 	int orig_height = height;
 
-	if (width  <= (OV2680_NATIVE_WIDTH / 2) &&
-	    height <= (OV2680_NATIVE_HEIGHT / 2)) {
+	if (width  <= (sensor->mode.crop.width / 2) &&
+	    height <= (sensor->mode.crop.height / 2)) {
 		sensor->mode.binning = true;
 		width *= 2;
 		height *= 2;
@@ -256,8 +284,10 @@ static void ov2680_calc_mode(struct ov2680_dev *sensor)
 		sensor->mode.binning = false;
 	}
 
-	sensor->mode.h_start = ((OV2680_NATIVE_WIDTH - width) / 2) & ~1;
-	sensor->mode.v_start = ((OV2680_NATIVE_HEIGHT - height) / 2) & ~1;
+	sensor->mode.h_start = (sensor->mode.crop.left +
+				(sensor->mode.crop.width - width) / 2) & ~1;
+	sensor->mode.v_start = (sensor->mode.crop.top +
+				(sensor->mode.crop.height - height) / 2) & ~1;
 	sensor->mode.h_end =
 		min(sensor->mode.h_start + width + OV2680_END_MARGIN - 1,
 		    OV2680_NATIVE_WIDTH - 1);
@@ -537,16 +567,21 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 {
 	struct ov2680_dev *sensor = to_ov2680_dev(sd);
 	struct v4l2_mbus_framefmt *try_fmt;
+	const struct v4l2_rect *crop;
 	unsigned int width, height;
 	int ret = 0;
 
 	if (format->pad != 0)
 		return -EINVAL;
 
-	width = min_t(unsigned int, ALIGN(format->format.width, 2),
-		      OV2680_NATIVE_WIDTH);
-	height = min_t(unsigned int, ALIGN(format->format.height, 2),
-		       OV2680_NATIVE_HEIGHT);
+	crop = __ov2680_get_pad_crop(sensor, sd_state, format->pad,
+				     format->which);
+
+	/* Limit set_fmt max size to crop width / height */
+	width = clamp_val(ALIGN(format->format.width, 2),
+			  OV2680_MIN_CROP_WIDTH, crop->width);
+	height = clamp_val(ALIGN(format->format.height, 2),
+			   OV2680_MIN_CROP_HEIGHT, crop->height);
 
 	ov2680_fill_format(sensor, &format->format, width, height);
 
@@ -572,11 +607,97 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 	return ret;
 }
 
+static int ov2680_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_selection *sel)
+{
+	struct ov2680_dev *sensor = to_ov2680_dev(sd);
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		mutex_lock(&sensor->lock);
+		sel->r = *__ov2680_get_pad_crop(sensor, state, sel->pad,
+						sel->which);
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
+		sel->r = ov2680_default_crop;
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
+	struct ov2680_dev *sensor = to_ov2680_dev(sd);
+	struct v4l2_mbus_framefmt *format;
+	struct v4l2_rect *crop;
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
+	rect.left = clamp_val(ALIGN(sel->r.left, 2),
+			      OV2680_NATIVE_START_LEFT, OV2680_NATIVE_WIDTH);
+	rect.top = clamp_val(ALIGN(sel->r.top, 2),
+			     OV2680_NATIVE_START_TOP, OV2680_NATIVE_HEIGHT);
+	rect.width = clamp_val(ALIGN(sel->r.width, 2),
+			       OV2680_MIN_CROP_WIDTH, OV2680_NATIVE_WIDTH);
+	rect.height = clamp_val(ALIGN(sel->r.height, 2),
+				OV2680_MIN_CROP_HEIGHT, OV2680_NATIVE_HEIGHT);
+
+	/* Make sure the crop rectangle isn't outside the bounds of the array */
+	rect.width = min_t(unsigned int, rect.width,
+			   OV2680_NATIVE_WIDTH - rect.left);
+	rect.height = min_t(unsigned int, rect.height,
+			    OV2680_NATIVE_HEIGHT - rect.top);
+
+	crop = __ov2680_get_pad_crop(sensor, state, sel->pad, sel->which);
+
+	mutex_lock(&sensor->lock);
+	if (rect.width != crop->width || rect.height != crop->height) {
+		/*
+		 * Reset the output image size if the crop rectangle size has
+		 * been modified.
+		 */
+		format = __ov2680_get_pad_format(sensor, state, sel->pad,
+						 sel->which);
+		format->width = rect.width;
+		format->height = rect.height;
+	}
+
+	*crop = rect;
+	mutex_unlock(&sensor->lock);
+
+	sel->r = rect;
+
+	return 0;
+}
+
 static int ov2680_init_cfg(struct v4l2_subdev *sd,
 			   struct v4l2_subdev_state *sd_state)
 {
 	struct ov2680_dev *sensor = to_ov2680_dev(sd);
 
+	sd_state->pads[0].try_crop = ov2680_default_crop;
+
 	ov2680_fill_format(sensor, &sd_state->pads[0].try_fmt,
 			   OV2680_DEFAULT_WIDTH, OV2680_DEFAULT_HEIGHT);
 	return 0;
@@ -669,10 +790,12 @@ static const struct v4l2_subdev_video_ops ov2680_video_ops = {
 static const struct v4l2_subdev_pad_ops ov2680_pad_ops = {
 	.init_cfg		= ov2680_init_cfg,
 	.enum_mbus_code		= ov2680_enum_mbus_code,
-	.get_fmt		= ov2680_get_fmt,
-	.set_fmt		= ov2680_set_fmt,
 	.enum_frame_size	= ov2680_enum_frame_size,
 	.enum_frame_interval	= ov2680_enum_frame_interval,
+	.get_fmt		= ov2680_get_fmt,
+	.set_fmt		= ov2680_set_fmt,
+	.get_selection		= ov2680_get_selection,
+	.set_selection		= ov2680_set_selection,
 };
 
 static const struct v4l2_subdev_ops ov2680_subdev_ops = {
@@ -683,6 +806,7 @@ static const struct v4l2_subdev_ops ov2680_subdev_ops = {
 static int ov2680_mode_init(struct ov2680_dev *sensor)
 {
 	/* set initial mode */
+	sensor->mode.crop = ov2680_default_crop;
 	ov2680_fill_format(sensor, &sensor->mode.fmt,
 			   OV2680_DEFAULT_WIDTH, OV2680_DEFAULT_HEIGHT);
 	ov2680_calc_mode(sensor);
-- 
2.40.1

