Return-Path: <linux-media+bounces-10099-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 130348B178C
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 01:58:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCFED286616
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 23:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80BD17279C;
	Wed, 24 Apr 2024 23:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Cijkpkii"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C091C16F27E
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 23:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714003084; cv=none; b=EFFLQ3JjbLoRVVh1XImdaGjaO2Bb2KPP464J+dLes0yQZTQdj4blmEVVzJSs7rUVHvqBpe5ahr67L4kIHInk2nWSaML/Xfq8OJFY/FL8vxnT3jKVs7AGAa9wvBNh/VK85Lh2KGwx9XIpCXOZOPrQ52h7+lBsZKIBzUaD7wofsSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714003084; c=relaxed/simple;
	bh=bw35Qc5GV1DC9j8izkghkuOC1ryF0hFdWrnzj/nGXSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LTnKqnUCifEC+K931LUI5Cror4GQHwQ2zZtmFjL9SgsL7xVDS8+NGHmgxJHs/Ov1TfAiIW2i76a15FlwRM6nqSliXndIQag1CJLaSigH0HNantCE8te6Q7R7GA9f0dbOTBI/WQjEVWpjXbVA6J5JPW1Lbh5j7T1Uy/V2oQpDUz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Cijkpkii; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 685BAC8A;
	Thu, 25 Apr 2024 01:57:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714003024;
	bh=bw35Qc5GV1DC9j8izkghkuOC1ryF0hFdWrnzj/nGXSE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cijkpkiizjyfj7WS79e7mP+TzGYpKAKepZGNRN0GRhOH28LwLWxKYjaZu2mbARUD2
	 GERP66LAQGk/2Ks+rRbYHwoic+n8iJjCJDsK0NoBSVFrGYj2HArjgf1nLo9fyA+drt
	 88NamgztTF9R74xc/T/24ElRifjJBWKa0kABIBsg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v1 7/9] media: vimc: sensor: Use subdev active state
Date: Thu, 25 Apr 2024 02:57:39 +0300
Message-ID: <20240424235741.17093-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240424235741.17093-1-laurent.pinchart@ideasonboard.com>
References: <20240424235741.17093-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Store the active formats and crop rectangle in the subdevice active
state. This simplifies implementation of the format and selection
accessors, and allows using the v4l2_subdev_get_fmt() helper to
implement the .get_fmt() operation.

The active configuration that is used in the .process_frame() handler is
still stored in the vimc_sensor_device structure. The driver could
instead access the active state in the .process_frame() handler, but the
required locking could interfere with the real time constraints of the
frame processing. This data would be stored in registers in the
.s_stream() handler for real hardware, storing it in dedicated storage
thus mimics a real driver. To differentiate them from the rest of the
device private data, move the corresponding fields to a sub-structure of
vimc_sensor_device named hw.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/test-drivers/vimc/vimc-sensor.c | 108 ++++++++----------
 1 file changed, 50 insertions(+), 58 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
index 9eb24c4791bf..027767777763 100644
--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
@@ -24,13 +24,20 @@ struct vimc_sensor_device {
 	struct vimc_ent_device ved;
 	struct v4l2_subdev sd;
 	struct tpg_data tpg;
-	u8 *frame;
-	enum vimc_sensor_osd_mode osd_value;
-	u64 start_stream_ts;
-	/* The active format */
-	struct v4l2_mbus_framefmt mbus_format;
 	struct v4l2_ctrl_handler hdl;
 	struct media_pad pad;
+
+	u8 *frame;
+
+	/*
+	 * Virtual "hardware" configuration, filled when the stream starts or
+	 * when controls are set.
+	 */
+	struct {
+		struct v4l2_area size;
+		enum vimc_sensor_osd_mode osd_value;
+		u64 start_stream_ts;
+	} hw;
 };
 
 static const struct v4l2_mbus_framefmt fmt_default = {
@@ -88,36 +95,22 @@ static int vimc_sensor_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int vimc_sensor_get_fmt(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_state *sd_state,
-			       struct v4l2_subdev_format *fmt)
+static void vimc_sensor_tpg_s_format(struct vimc_sensor_device *vsensor,
+				     const struct v4l2_mbus_framefmt *format)
 {
-	struct vimc_sensor_device *vsensor =
-				container_of(sd, struct vimc_sensor_device, sd);
+	const struct vimc_pix_map *vpix = vimc_pix_map_by_code(format->code);
 
-	fmt->format = fmt->which == V4L2_SUBDEV_FORMAT_TRY ?
-		      *v4l2_subdev_state_get_format(sd_state, fmt->pad) :
-		      vsensor->mbus_format;
-
-	return 0;
-}
-
-static void vimc_sensor_tpg_s_format(struct vimc_sensor_device *vsensor)
-{
-	const struct vimc_pix_map *vpix =
-				vimc_pix_map_by_code(vsensor->mbus_format.code);
-
-	tpg_reset_source(&vsensor->tpg, vsensor->mbus_format.width,
-			 vsensor->mbus_format.height, vsensor->mbus_format.field);
-	tpg_s_bytesperline(&vsensor->tpg, 0, vsensor->mbus_format.width * vpix->bpp);
-	tpg_s_buf_height(&vsensor->tpg, vsensor->mbus_format.height);
+	tpg_reset_source(&vsensor->tpg, format->width, format->height,
+			 format->field);
+	tpg_s_bytesperline(&vsensor->tpg, 0, format->width * vpix->bpp);
+	tpg_s_buf_height(&vsensor->tpg, format->height);
 	tpg_s_fourcc(&vsensor->tpg, vpix->pixelformat);
 	/* TODO: add support for V4L2_FIELD_ALTERNATE */
-	tpg_s_field(&vsensor->tpg, vsensor->mbus_format.field, false);
-	tpg_s_colorspace(&vsensor->tpg, vsensor->mbus_format.colorspace);
-	tpg_s_ycbcr_enc(&vsensor->tpg, vsensor->mbus_format.ycbcr_enc);
-	tpg_s_quantization(&vsensor->tpg, vsensor->mbus_format.quantization);
-	tpg_s_xfer_func(&vsensor->tpg, vsensor->mbus_format.xfer_func);
+	tpg_s_field(&vsensor->tpg, format->field, false);
+	tpg_s_colorspace(&vsensor->tpg, format->colorspace);
+	tpg_s_ycbcr_enc(&vsensor->tpg, format->ycbcr_enc);
+	tpg_s_quantization(&vsensor->tpg, format->quantization);
+	tpg_s_xfer_func(&vsensor->tpg, format->xfer_func);
 }
 
 static void vimc_sensor_adjust_fmt(struct v4l2_mbus_framefmt *fmt)
@@ -148,15 +141,11 @@ static int vimc_sensor_set_fmt(struct v4l2_subdev *sd,
 	struct vimc_sensor_device *vsensor = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *mf;
 
-	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		/* Do not change the format while stream is on */
-		if (vsensor->frame)
-			return -EBUSY;
+	/* Do not change the format while stream is on */
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE && vsensor->frame)
+		return -EBUSY;
 
-		mf = &vsensor->mbus_format;
-	} else {
-		mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
-	}
+	mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 
 	/* Set the new format */
 	vimc_sensor_adjust_fmt(&fmt->format);
@@ -181,7 +170,7 @@ static int vimc_sensor_set_fmt(struct v4l2_subdev *sd,
 static const struct v4l2_subdev_pad_ops vimc_sensor_pad_ops = {
 	.enum_mbus_code		= vimc_sensor_enum_mbus_code,
 	.enum_frame_size	= vimc_sensor_enum_frame_size,
-	.get_fmt		= vimc_sensor_get_fmt,
+	.get_fmt		= v4l2_subdev_get_fmt,
 	.set_fmt		= vimc_sensor_set_fmt,
 };
 
@@ -198,7 +187,7 @@ static void *vimc_sensor_process_frame(struct vimc_ent_device *ved,
 
 	tpg_fill_plane_buffer(&vsensor->tpg, 0, 0, vsensor->frame);
 	tpg_calc_text_basep(&vsensor->tpg, basep, 0, vsensor->frame);
-	switch (vsensor->osd_value) {
+	switch (vsensor->hw.osd_value) {
 	case VIMC_SENSOR_OSD_SHOW_ALL: {
 		const char *order = tpg_g_color_order(&vsensor->tpg);
 
@@ -212,15 +201,14 @@ static void *vimc_sensor_process_frame(struct vimc_ent_device *ved,
 			 vsensor->tpg.hue);
 		tpg_gen_text(&vsensor->tpg, basep, line++ * line_height, 16, str);
 		snprintf(str, sizeof(str), "sensor size: %dx%d",
-			 vsensor->mbus_format.width,
-			 vsensor->mbus_format.height);
+			 vsensor->hw.size.width, vsensor->hw.size.height);
 		tpg_gen_text(&vsensor->tpg, basep, line++ * line_height, 16, str);
 		fallthrough;
 	}
 	case VIMC_SENSOR_OSD_SHOW_COUNTERS: {
 		unsigned int ms;
 
-		ms = div_u64(ktime_get_ns() - vsensor->start_stream_ts, 1000000);
+		ms = div_u64(ktime_get_ns() - vsensor->hw.start_stream_ts, 1000000);
 		snprintf(str, sizeof(str), "%02d:%02d:%02d:%03d",
 			 (ms / (60 * 60 * 1000)) % 24,
 			 (ms / (60 * 1000)) % 60,
@@ -243,15 +231,25 @@ static int vimc_sensor_s_stream(struct v4l2_subdev *sd, int enable)
 				container_of(sd, struct vimc_sensor_device, sd);
 
 	if (enable) {
+		const struct v4l2_mbus_framefmt *format;
+		struct v4l2_subdev_state *state;
 		const struct vimc_pix_map *vpix;
 		unsigned int frame_size;
 
-		vsensor->start_stream_ts = ktime_get_ns();
+		state = v4l2_subdev_lock_and_get_active_state(sd);
+		format = v4l2_subdev_state_get_format(state, 0);
 
-		/* Calculate the frame size */
-		vpix = vimc_pix_map_by_code(vsensor->mbus_format.code);
-		frame_size = vsensor->mbus_format.width * vpix->bpp *
-			     vsensor->mbus_format.height;
+		/* Configure the test pattern generator. */
+		vimc_sensor_tpg_s_format(vsensor, format);
+
+		/* Calculate the frame size. */
+		vpix = vimc_pix_map_by_code(format->code);
+		frame_size = format->width * vpix->bpp * format->height;
+
+		vsensor->hw.size.width = format->width;
+		vsensor->hw.size.height = format->height;
+
+		v4l2_subdev_unlock_state(state);
 
 		/*
 		 * Allocate the frame buffer. Use vmalloc to be able to
@@ -261,9 +259,7 @@ static int vimc_sensor_s_stream(struct v4l2_subdev *sd, int enable)
 		if (!vsensor->frame)
 			return -ENOMEM;
 
-		/* configure the test pattern generator */
-		vimc_sensor_tpg_s_format(vsensor);
-
+		vsensor->hw.start_stream_ts = ktime_get_ns();
 	} else {
 
 		vfree(vsensor->frame);
@@ -321,7 +317,7 @@ static int vimc_sensor_s_ctrl(struct v4l2_ctrl *ctrl)
 		tpg_s_saturation(&vsensor->tpg, ctrl->val);
 		break;
 	case VIMC_CID_OSD_TEXT_MODE:
-		vsensor->osd_value = ctrl->val;
+		vsensor->hw.osd_value = ctrl->val;
 		break;
 	default:
 		return -EINVAL;
@@ -414,8 +410,7 @@ static struct vimc_ent_device *vimc_sensor_add(struct vimc_device *vimc,
 	}
 
 	/* Initialize the test pattern generator */
-	tpg_init(&vsensor->tpg, vsensor->mbus_format.width,
-		 vsensor->mbus_format.height);
+	tpg_init(&vsensor->tpg, fmt_default.width, fmt_default.height);
 	ret = tpg_alloc(&vsensor->tpg, VIMC_FRAME_MAX_WIDTH);
 	if (ret)
 		goto err_free_hdl;
@@ -432,9 +427,6 @@ static struct vimc_ent_device *vimc_sensor_add(struct vimc_device *vimc,
 	vsensor->ved.process_frame = vimc_sensor_process_frame;
 	vsensor->ved.dev = vimc->mdev.dev;
 
-	/* Initialize the frame format */
-	vsensor->mbus_format = fmt_default;
-
 	return &vsensor->ved;
 
 err_free_tpg:
-- 
Regards,

Laurent Pinchart


