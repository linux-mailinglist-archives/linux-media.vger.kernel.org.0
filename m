Return-Path: <linux-media+bounces-9322-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6168A4BB2
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 11:38:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E52F285F79
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 09:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5492256B80;
	Mon, 15 Apr 2024 09:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WeY1gMUM"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D32755761
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 09:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713173844; cv=none; b=rEzMEcgYFavDXH5LtR5D930Tx3+lp377xPGw2bkStX/EF/gF0wbbNSlmBdAGbh76fTW4OHRT+tyvNoH7U4o8niBXOp+zjxDrjJw4T3fhI3sbfeoA8fMDV6brZwM48re9fXIbYFtpzrCmj4IAGdV4dG2Y7LSVO597dWRf5KqobfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713173844; c=relaxed/simple;
	bh=6gTrxjC8Wwd+fN0R66FkYdn+4kp47f8o0z0Y59qRVJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z3XR4i+rBdwkJPfoLbZRaY5PKf3XzZ2Gz06vvT3vcLPHuj/NaBxnPIDQEHTot07Y7V1ErMzIh+A9opz6oDqhuoZkyt+p2QYk1AnihwFkdAr0OBSKDysrq21qlh/eceW54JDnhGpnj3N9xALM6+KzYI7vrnq1E4CQqPEqNlCq/9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WeY1gMUM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713173842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LgLF2QhEI6c14wV3YolrAV724TMk1fGU67PJXYJ6qDk=;
	b=WeY1gMUMKSP+9aalmg1iXQe80Pr9NBgY4/JvFaOw+9fMFNKFLSTdmte+kXw0mxxYuRJ9xC
	KPjBbLZ/4PYjHMOZigZEf4vrB+/9E1zdz5OseeclM6NYfv2dw2iltt7bQbIeydF9XmDiDh
	78c66PhpUXTgIwVCBnpYKmWV3FqUgHQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-037euIhtO8OElmZ8sMVeNA-1; Mon, 15 Apr 2024 05:37:19 -0400
X-MC-Unique: 037euIhtO8OElmZ8sMVeNA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53BC1104D50C;
	Mon, 15 Apr 2024 09:37:19 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 56496C13FA3;
	Mon, 15 Apr 2024 09:37:18 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH resend 3/5] media: ov2680: Add vblank control
Date: Mon, 15 Apr 2024 11:37:02 +0200
Message-ID: <20240415093704.208175-4-hdegoede@redhat.com>
In-Reply-To: <20240415093704.208175-1-hdegoede@redhat.com>
References: <20240415093704.208175-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

Add vblank control to allow changing the framerate /
higher exposure values.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 47 ++++++++++++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 6c3d7862b2aa..d44e1934b25a 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -75,6 +75,8 @@
 #define OV2680_ACTIVE_START_TOP			8
 #define OV2680_MIN_CROP_WIDTH			2
 #define OV2680_MIN_CROP_HEIGHT			2
+#define OV2680_MIN_VBLANK			4
+#define OV2680_MAX_VBLANK			0xffff
 
 /* Fixed pre-div of 1/2 */
 #define OV2680_PLL_PREDIV0			2
@@ -84,7 +86,7 @@
 
 /* 66MHz pixel clock: 66MHz / 1704 * 1294 = 30fps */
 #define OV2680_PIXELS_PER_LINE			1704
-#define OV2680_LINES_PER_FRAME			1294
+#define OV2680_LINES_PER_FRAME_30FPS		1294
 
 /* Max exposure time is VTS - 8 */
 #define OV2680_INTEGRATION_TIME_MARGIN		8
@@ -127,6 +129,7 @@ struct ov2680_ctrls {
 	struct v4l2_ctrl *test_pattern;
 	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *vblank;
 };
 
 struct ov2680_mode {
@@ -394,8 +397,7 @@ static int ov2680_set_mode(struct ov2680_dev *sensor)
 		  sensor->mode.v_output_size, &ret);
 	cci_write(sensor->regmap, OV2680_REG_TIMING_HTS,
 		  OV2680_PIXELS_PER_LINE, &ret);
-	cci_write(sensor->regmap, OV2680_REG_TIMING_VTS,
-		  OV2680_LINES_PER_FRAME, &ret);
+	/* VTS gets set by the vblank ctrl */
 	cci_write(sensor->regmap, OV2680_REG_ISP_X_WIN, 0, &ret);
 	cci_write(sensor->regmap, OV2680_REG_ISP_Y_WIN, 0, &ret);
 	cci_write(sensor->regmap, OV2680_REG_X_INC, inc, &ret);
@@ -469,6 +471,15 @@ static int ov2680_exposure_set(struct ov2680_dev *sensor, u32 exp)
 			 NULL);
 }
 
+static void ov2680_exposure_update_range(struct ov2680_dev *sensor)
+{
+	int exp_max = sensor->mode.fmt.height + sensor->ctrls.vblank->val -
+		      OV2680_INTEGRATION_TIME_MARGIN;
+
+	__v4l2_ctrl_modify_range(sensor->ctrls.exposure, 0, exp_max,
+				 1, exp_max);
+}
+
 static int ov2680_stream_enable(struct ov2680_dev *sensor)
 {
 	int ret;
@@ -635,7 +646,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *try_fmt;
 	const struct v4l2_rect *crop;
 	unsigned int width, height;
-	int ret = 0;
+	int def, max, ret = 0;
 
 	crop = __ov2680_get_pad_crop(sensor, sd_state, format->pad,
 				     format->which);
@@ -664,6 +675,15 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 	sensor->mode.fmt = format->format;
 	ov2680_calc_mode(sensor);
 
+	/* vblank range is height dependent adjust and reset to default */
+	max = OV2680_MAX_VBLANK - height;
+	def = OV2680_LINES_PER_FRAME_30FPS - height;
+	__v4l2_ctrl_modify_range(sensor->ctrls.vblank, OV2680_MIN_VBLANK, max,
+				 1, def);
+	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, def);
+	/* exposure range depends on vts which may have changed */
+	ov2680_exposure_update_range(sensor);
+
 unlock:
 	mutex_unlock(&sensor->lock);
 
@@ -833,6 +853,10 @@ static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct ov2680_dev *sensor = to_ov2680_dev(sd);
 	int ret;
 
+	/* Update exposure range on vblank changes */
+	if (ctrl->id == V4L2_CID_VBLANK)
+		ov2680_exposure_update_range(sensor);
+
 	/* Only apply changes to the controls if the device is powered up */
 	if (!pm_runtime_get_if_in_use(sensor->sd.dev)) {
 		ov2680_set_bayer_order(sensor, &sensor->mode.fmt);
@@ -855,6 +879,10 @@ static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_TEST_PATTERN:
 		ret = ov2680_test_pattern_set(sensor, ctrl->val);
 		break;
+	case V4L2_CID_VBLANK:
+		ret = cci_write(sensor->regmap, OV2680_REG_TIMING_VTS,
+				sensor->mode.fmt.height + ctrl->val, NULL);
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -913,8 +941,7 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
 	const struct v4l2_ctrl_ops *ops = &ov2680_ctrl_ops;
 	struct ov2680_ctrls *ctrls = &sensor->ctrls;
 	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
-	int exp_max = OV2680_LINES_PER_FRAME - OV2680_INTEGRATION_TIME_MARGIN;
-	int ret = 0;
+	int def, max, ret = 0;
 
 	v4l2_i2c_subdev_init(&sensor->sd, client, &ov2680_subdev_ops);
 	sensor->sd.internal_ops = &ov2680_internal_ops;
@@ -939,8 +966,9 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
 					ARRAY_SIZE(test_pattern_menu) - 1,
 					0, 0, test_pattern_menu);
 
+	max = OV2680_LINES_PER_FRAME_30FPS - OV2680_INTEGRATION_TIME_MARGIN;
 	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE,
-					    0, exp_max, 1, exp_max);
+					    0, max, 1, max);
 
 	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN,
 					0, 1023, 1, 250);
@@ -951,6 +979,11 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
 					      0, sensor->pixel_rate,
 					      1, sensor->pixel_rate);
 
+	max = OV2680_MAX_VBLANK - OV2680_DEFAULT_HEIGHT;
+	def = OV2680_LINES_PER_FRAME_30FPS - OV2680_DEFAULT_HEIGHT;
+	ctrls->vblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK,
+					  OV2680_MIN_VBLANK, max, 1, def);
+
 	if (hdl->error) {
 		ret = hdl->error;
 		goto cleanup_entity;
-- 
2.44.0


