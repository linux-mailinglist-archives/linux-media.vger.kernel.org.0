Return-Path: <linux-media+bounces-3114-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 553A3820AFE
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 11:31:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 488C31C20D6A
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 10:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0819A2CA7;
	Sun, 31 Dec 2023 10:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h3bz7j0F"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC58023D8
	for <linux-media@vger.kernel.org>; Sun, 31 Dec 2023 10:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704018673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IdC4EJWH5PwDik2zyDs/M/lID3r33UEzF20ELGcIu6U=;
	b=h3bz7j0F2U3l0ejCYYiL85r3YVL1rZWXMuGBx7TLhrtEL6symaeMNGHsse+z9frWK0c7r/
	Yesp7Mo3zlnu4f0pKTa1f9t/r4fyQtqHuntA3on1IT3jDEV8J5R+HexACoNaPEyLEEBXH0
	/FUc4anNzAL+RI533a2v2l9rbTAUdpo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-lIxUDw0bN3qwIdfpvvP0cg-1; Sun, 31 Dec 2023 05:31:10 -0500
X-MC-Unique: lIxUDw0bN3qwIdfpvvP0cg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47831831002;
	Sun, 31 Dec 2023 10:31:09 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C046E492BC6;
	Sun, 31 Dec 2023 10:31:07 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 01/15] media: atomisp: Adjust for v4l2_subdev_state handling changes in 6.8
Date: Sun, 31 Dec 2023 11:30:43 +0100
Message-ID: <20231231103057.35837-2-hdegoede@redhat.com>
In-Reply-To: <20231231103057.35837-1-hdegoede@redhat.com>
References: <20231231103057.35837-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

The atomisp driver emulates a standard v4l2 device, which also works
for non media-controller aware applications.

Part of this requires making try_fmt calls on the sensor when
a normal v4l2 app is making try_fmt calls on the /dev/video# mode.

With the recent v4l2_subdev_state handling changes in 6.8 this no longer
works, fixing this requires 2 changes:

1. The atomisp code was using its own internal v4l2_subdev_pad_config
   for this. Replace the internal v4l2_subdev_pad_config with allocating
   a full v4l2_subdev_state for storing the full try_fmt state.

2. The paths actually setting the fmt or crop selection now need to be
   passed the v4l2_subdev's active state, so that sensor drivers which
   are using the v4l2_subdev's active state to store their state keep
   working.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 58 ++++++++++--------
 .../media/atomisp/pci/atomisp_internal.h      |  4 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 52 +++++++++-------
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 59 ++++++++++++++-----
 4 files changed, 111 insertions(+), 62 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 759233a7ba50..555814012fce 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3723,12 +3723,10 @@ void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
 
 static int atomisp_set_crop(struct atomisp_device *isp,
 			    const struct v4l2_mbus_framefmt *format,
+			    struct v4l2_subdev_state *sd_state,
 			    int which)
 {
 	struct atomisp_input_subdev *input = &isp->inputs[isp->asd.input_curr];
-	struct v4l2_subdev_state pad_state = {
-		.pads = &input->pad_cfg,
-	};
 	struct v4l2_subdev_selection sel = {
 		.which = which,
 		.target = V4L2_SEL_TGT_CROP,
@@ -3754,7 +3752,7 @@ static int atomisp_set_crop(struct atomisp_device *isp,
 	sel.r.left = ((input->native_rect.width - sel.r.width) / 2) & ~1;
 	sel.r.top = ((input->native_rect.height - sel.r.height) / 2) & ~1;
 
-	ret = v4l2_subdev_call(input->camera, pad, set_selection, &pad_state, &sel);
+	ret = v4l2_subdev_call(input->camera, pad, set_selection, sd_state, &sel);
 	if (ret)
 		dev_err(isp->dev, "Error setting crop to %ux%u @%ux%u: %d\n",
 			sel.r.width, sel.r.height, sel.r.left, sel.r.top, ret);
@@ -3770,9 +3768,6 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	const struct atomisp_format_bridge *fmt, *snr_fmt;
 	struct atomisp_sub_device *asd = &isp->asd;
 	struct atomisp_input_subdev *input = &isp->inputs[asd->input_curr];
-	struct v4l2_subdev_state pad_state = {
-		.pads = &input->pad_cfg,
-	};
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
@@ -3809,11 +3804,16 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	dev_dbg(isp->dev, "try_mbus_fmt: asking for %ux%u\n",
 		format.format.width, format.format.height);
 
-	ret = atomisp_set_crop(isp, &format.format, V4L2_SUBDEV_FORMAT_TRY);
-	if (ret)
-		return ret;
+	v4l2_subdev_lock_state(input->try_sd_state);
+
+	ret = atomisp_set_crop(isp, &format.format, input->try_sd_state,
+			       V4L2_SUBDEV_FORMAT_TRY);
+	if (ret == 0)
+		ret = v4l2_subdev_call(input->camera, pad, set_fmt,
+				       input->try_sd_state, &format);
+
+	v4l2_subdev_unlock_state(input->try_sd_state);
 
-	ret = v4l2_subdev_call(input->camera, pad, set_fmt, &pad_state, &format);
 	if (ret)
 		return ret;
 
@@ -4238,9 +4238,7 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
 	struct atomisp_device *isp = asd->isp;
 	struct atomisp_input_subdev *input = &isp->inputs[asd->input_curr];
 	const struct atomisp_format_bridge *format;
-	struct v4l2_subdev_state pad_state = {
-		.pads = &input->pad_cfg,
-	};
+	struct v4l2_subdev_state *act_sd_state;
 	struct v4l2_subdev_format vformat = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
@@ -4268,12 +4266,18 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
 
 	/* Disable dvs if resolution can't be supported by sensor */
 	if (asd->params.video_dis_en && asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO) {
-		ret = atomisp_set_crop(isp, &vformat.format, V4L2_SUBDEV_FORMAT_TRY);
-		if (ret)
-			return ret;
+		v4l2_subdev_lock_state(input->try_sd_state);
+
+		ret = atomisp_set_crop(isp, &vformat.format, input->try_sd_state,
+				       V4L2_SUBDEV_FORMAT_TRY);
+		if (ret == 0) {
+			vformat.which = V4L2_SUBDEV_FORMAT_TRY;
+			ret = v4l2_subdev_call(input->camera, pad, set_fmt,
+					       input->try_sd_state, &vformat);
+		}
+
+		v4l2_subdev_unlock_state(input->try_sd_state);
 
-		vformat.which = V4L2_SUBDEV_FORMAT_TRY;
-		ret = v4l2_subdev_call(input->camera, pad, set_fmt, &pad_state, &vformat);
 		if (ret)
 			return ret;
 
@@ -4291,12 +4295,18 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
 		}
 	}
 
-	ret = atomisp_set_crop(isp, &vformat.format, V4L2_SUBDEV_FORMAT_ACTIVE);
-	if (ret)
-		return ret;
+	act_sd_state = v4l2_subdev_lock_and_get_active_state(input->camera);
+
+	ret = atomisp_set_crop(isp, &vformat.format, act_sd_state,
+			       V4L2_SUBDEV_FORMAT_ACTIVE);
+	if (ret == 0) {
+		vformat.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+		ret = v4l2_subdev_call(input->camera, pad, set_fmt, act_sd_state, &vformat);
+	}
+
+	if (act_sd_state)
+		v4l2_subdev_unlock_state(act_sd_state);
 
-	vformat.which = V4L2_SUBDEV_FORMAT_ACTIVE;
-	ret = v4l2_subdev_call(input->camera, pad, set_fmt, NULL, &vformat);
 	if (ret)
 		return ret;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index f7b4bee9574b..d5b077e602ca 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -132,8 +132,8 @@ struct atomisp_input_subdev {
 	/* Sensor rects for sensors which support crop */
 	struct v4l2_rect native_rect;
 	struct v4l2_rect active_rect;
-	/* Sensor pad_cfg for which == V4L2_SUBDEV_FORMAT_TRY calls */
-	struct v4l2_subdev_pad_config pad_cfg;
+	/* Sensor state for which == V4L2_SUBDEV_FORMAT_TRY calls */
+	struct v4l2_subdev_state *try_sd_state;
 
 	struct v4l2_subdev *motor;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 09c0091b920f..404317f6c57b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -781,12 +781,20 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		.code = input->code,
 	};
+	struct v4l2_subdev_state *act_sd_state;
 	int ret;
 
+	if (!input->camera)
+		return -EINVAL;
+
 	if (input->crop_support)
 		return atomisp_enum_framesizes_crop(isp, fsize);
 
-	ret = v4l2_subdev_call(input->camera, pad, enum_frame_size, NULL, &fse);
+	act_sd_state = v4l2_subdev_lock_and_get_active_state(input->camera);
+	ret = v4l2_subdev_call(input->camera, pad, enum_frame_size,
+			       act_sd_state, &fse);
+	if (act_sd_state)
+		v4l2_subdev_unlock_state(act_sd_state);
 	if (ret)
 		return ret;
 
@@ -803,18 +811,25 @@ static int atomisp_enum_frameintervals(struct file *file, void *priv,
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
+	struct atomisp_input_subdev *input = &isp->inputs[asd->input_curr];
 	struct v4l2_subdev_frame_interval_enum fie = {
-		.code	= atomisp_in_fmt_conv[0].code,
+		.code = atomisp_in_fmt_conv[0].code,
 		.index = fival->index,
 		.width = fival->width,
 		.height = fival->height,
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
+	struct v4l2_subdev_state *act_sd_state;
 	int ret;
 
-	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
-			       pad, enum_frame_interval, NULL,
-			       &fie);
+	if (!input->camera)
+		return -EINVAL;
+
+	act_sd_state = v4l2_subdev_lock_and_get_active_state(input->camera);
+	ret = v4l2_subdev_call(input->camera, pad, enum_frame_interval,
+			       act_sd_state, &fie);
+	if (act_sd_state)
+		v4l2_subdev_unlock_state(act_sd_state);
 	if (ret)
 		return ret;
 
@@ -830,30 +845,25 @@ static int atomisp_enum_fmt_cap(struct file *file, void *fh,
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
+	struct atomisp_input_subdev *input = &isp->inputs[asd->input_curr];
 	struct v4l2_subdev_mbus_code_enum code = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
 	const struct atomisp_format_bridge *format;
-	struct v4l2_subdev *camera;
+	struct v4l2_subdev_state *act_sd_state;
 	unsigned int i, fi = 0;
-	int rval;
+	int ret;
 
-	camera = isp->inputs[asd->input_curr].camera;
-	if(!camera) {
-		dev_err(isp->dev, "%s(): camera is NULL, device is %s\n",
-			__func__, vdev->name);
+	if (!input->camera)
 		return -EINVAL;
-	}
 
-	rval = v4l2_subdev_call(camera, pad, enum_mbus_code, NULL, &code);
-	if (rval == -ENOIOCTLCMD) {
-		dev_warn(isp->dev,
-			 "enum_mbus_code pad op not supported by %s. Please fix your sensor driver!\n",
-			 camera->name);
-	}
-
-	if (rval)
-		return rval;
+	act_sd_state = v4l2_subdev_lock_and_get_active_state(input->camera);
+	ret = v4l2_subdev_call(input->camera, pad, enum_mbus_code,
+			       act_sd_state, &code);
+	if (act_sd_state)
+		v4l2_subdev_unlock_state(act_sd_state);
+	if (ret)
+		return ret;
 
 	for (i = 0; i < ARRAY_SIZE(atomisp_output_fmts); i++) {
 		format = &atomisp_output_fmts[i];
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index c1c8501ec61f..547e1444ad97 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -862,6 +862,9 @@ static void atomisp_unregister_entities(struct atomisp_device *isp)
 	v4l2_device_unregister(&isp->v4l2_dev);
 	media_device_unregister(&isp->media_dev);
 	media_device_cleanup(&isp->media_dev);
+
+	for (i = 0; i < isp->input_cnt; i++)
+		__v4l2_subdev_state_free(isp->inputs[i].try_sd_state);
 }
 
 static int atomisp_register_entities(struct atomisp_device *isp)
@@ -933,32 +936,49 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 
 static void atomisp_init_sensor(struct atomisp_input_subdev *input)
 {
+	static struct lock_class_key try_sd_state_key;
 	struct v4l2_subdev_mbus_code_enum mbus_code_enum = { };
 	struct v4l2_subdev_frame_size_enum fse = { };
-	struct v4l2_subdev_state sd_state = {
-		.pads = &input->pad_cfg,
-	};
 	struct v4l2_subdev_selection sel = { };
+	struct v4l2_subdev_state *try_sd_state, *act_sd_state;
 	int i, err;
 
+	/*
+	 * FIXME: Drivers are not supposed to use __v4l2_subdev_state_alloc()
+	 * but atomisp needs this for try_fmt on its /dev/video# node since
+	 * it emulates a normal v4l2 device there, passing through try_fmt /
+	 * set_fmt to the sensor.
+	 */
+	try_sd_state = __v4l2_subdev_state_alloc(input->camera,
+				"atomisp:try_sd_state->lock", &try_sd_state_key);
+	if (IS_ERR(try_sd_state))
+		return;
+
+	input->try_sd_state = try_sd_state;
+
+	act_sd_state = v4l2_subdev_lock_and_get_active_state(input->camera);
+
 	mbus_code_enum.which = V4L2_SUBDEV_FORMAT_ACTIVE;
-	err = v4l2_subdev_call(input->camera, pad, enum_mbus_code, NULL, &mbus_code_enum);
+	err = v4l2_subdev_call(input->camera, pad, enum_mbus_code,
+			       act_sd_state, &mbus_code_enum);
 	if (!err)
 		input->code = mbus_code_enum.code;
 
 	sel.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	sel.target = V4L2_SEL_TGT_NATIVE_SIZE;
-	err = v4l2_subdev_call(input->camera, pad, get_selection, NULL, &sel);
+	err = v4l2_subdev_call(input->camera, pad, get_selection,
+			       act_sd_state, &sel);
 	if (err)
-		return;
+		goto unlock_act_sd_state;
 
 	input->native_rect = sel.r;
 
 	sel.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	sel.target = V4L2_SEL_TGT_CROP_DEFAULT;
-	err = v4l2_subdev_call(input->camera, pad, get_selection, NULL, &sel);
+	err = v4l2_subdev_call(input->camera, pad, get_selection,
+			       act_sd_state, &sel);
 	if (err)
-		return;
+		goto unlock_act_sd_state;
 
 	input->active_rect = sel.r;
 
@@ -973,7 +993,8 @@ static void atomisp_init_sensor(struct atomisp_input_subdev *input)
 		fse.code = input->code;
 		fse.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 
-		err = v4l2_subdev_call(input->camera, pad, enum_frame_size, NULL, &fse);
+		err = v4l2_subdev_call(input->camera, pad, enum_frame_size,
+				       act_sd_state, &fse);
 		if (err)
 			break;
 
@@ -989,22 +1010,26 @@ static void atomisp_init_sensor(struct atomisp_input_subdev *input)
 	 * for padding, set the crop rect to cover the entire sensor instead
 	 * of only the default active area.
 	 *
-	 * Do this for both try and active formats since the try_crop rect in
-	 * pad_cfg may influence (clamp) future try_fmt calls with which == try.
+	 * Do this for both try and active formats since the crop rect in
+	 * try_sd_state may influence (clamp size) in calls with which == try.
 	 */
 	sel.which = V4L2_SUBDEV_FORMAT_TRY;
 	sel.target = V4L2_SEL_TGT_CROP;
 	sel.r = input->native_rect;
-	err = v4l2_subdev_call(input->camera, pad, set_selection, &sd_state, &sel);
+	v4l2_subdev_lock_state(input->try_sd_state);
+	err = v4l2_subdev_call(input->camera, pad, set_selection,
+			       input->try_sd_state, &sel);
+	v4l2_subdev_unlock_state(input->try_sd_state);
 	if (err)
-		return;
+		goto unlock_act_sd_state;
 
 	sel.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	sel.target = V4L2_SEL_TGT_CROP;
 	sel.r = input->native_rect;
-	err = v4l2_subdev_call(input->camera, pad, set_selection, NULL, &sel);
+	err = v4l2_subdev_call(input->camera, pad, set_selection,
+			       act_sd_state, &sel);
 	if (err)
-		return;
+		goto unlock_act_sd_state;
 
 	dev_info(input->camera->dev, "Supports crop native %dx%d active %dx%d binning %d\n",
 		 input->native_rect.width, input->native_rect.height,
@@ -1012,6 +1037,10 @@ static void atomisp_init_sensor(struct atomisp_input_subdev *input)
 		 input->binning_support);
 
 	input->crop_support = true;
+
+unlock_act_sd_state:
+	if (act_sd_state)
+		v4l2_subdev_unlock_state(act_sd_state);
 }
 
 int atomisp_register_device_nodes(struct atomisp_device *isp)
-- 
2.43.0


