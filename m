Return-Path: <linux-media+bounces-31497-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6398AA5F65
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 15:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36FC17A396F
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 13:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 121041C861F;
	Thu,  1 May 2025 13:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VVeCyYp5"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A45126BFF
	for <linux-media@vger.kernel.org>; Thu,  1 May 2025 13:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746107017; cv=none; b=GsEapOtwQ68Wsr8Bvc0d2OLsxkMuCVKP40DYz07LcmqbNUu+7KWwGcUGygjp6zAjc9Qh4MitN2ofcNsk/7yAovPV5aMpBQ3+5jlVsA3KzbIQ9Q/B7sOUfsAcWQ3ul8oFfBOV896EplZ1ht8Yc1EOmVJJP+6vq4iiZhJStp3f7CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746107017; c=relaxed/simple;
	bh=TTVH1fA6JsRUnnfpTO+90FFpSkykvVeiy2NXu1GfiLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kHQSqdNINietM7E8fiDers4Aca57MJE2Uy2nz4BWG01b6zDQasJzCgkfXeFikqovTgRGDXXqCidXxbDnYsGZSIA72JmkEawDSzunjcN1HEqCwFAAkPBRD5Ln0X6+oDBdtm3wPadGBkIGBb05Az5oWiZXEXucBxiTwNu0hUGjEAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VVeCyYp5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746107014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JN46mcuDS4RxlvTmODGwLd/QE0qLloRVUpbnXszASfk=;
	b=VVeCyYp5xXAxd+x9wGLnBHZSLwaDy8V/qE/ekoS6s9Zno1PzrLZH+BBLfKe2be58XHl9OX
	ieIOSdeolohbAdKhsqnqpmvqnfrVAlU12OL6WLaU2ptq+KwcsSaPV2kOlljujeDFG1qbe2
	NokbbwBg7K09oZ8V3fcg9m8h6XaWiS0=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-206-u-yCzHJaP7C9-RBNQZA0Ug-1; Thu,
 01 May 2025 09:43:30 -0400
X-MC-Unique: u-yCzHJaP7C9-RBNQZA0Ug-1
X-Mimecast-MFC-AGG-ID: u-yCzHJaP7C9-RBNQZA0Ug_1746107009
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6C58B1955DE7;
	Thu,  1 May 2025 13:43:27 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.32.142])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 246FC1956094;
	Thu,  1 May 2025 13:43:24 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 1/4] media: atomisp: Rename camera to sensor
Date: Thu,  1 May 2025 15:43:09 +0200
Message-ID: <20250501134312.104711-2-hdegoede@redhat.com>
In-Reply-To: <20250501134312.104711-1-hdegoede@redhat.com>
References: <20250501134312.104711-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

The camera v4l2_subdev pointer in struct atomisp_input_subdev points to
an image sensor, rename camera to sensor to make this more clear.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 28 ++++++++---------
 .../media/atomisp/pci/atomisp_compat_css20.c  |  2 +-
 .../staging/media/atomisp/pci/atomisp_csi2.c  |  2 +-
 .../media/atomisp/pci/atomisp_internal.h      |  4 +--
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 30 +++++++++----------
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 25 ++++++++--------
 6 files changed, 46 insertions(+), 45 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 8feb627ddcca..f8ecd07ee9d9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -87,7 +87,7 @@ static unsigned short atomisp_get_sensor_fps(struct atomisp_sub_device *asd)
 	unsigned short fps = 0;
 	int ret;
 
-	ret = v4l2_subdev_call_state_active(isp->inputs[asd->input_curr].camera,
+	ret = v4l2_subdev_call_state_active(isp->inputs[asd->input_curr].sensor,
 					    pad, get_frame_interval, &fi);
 
 	if (!ret && fi.interval.numerator)
@@ -881,7 +881,7 @@ void atomisp_assert_recovery_work(struct work_struct *work)
 	spin_unlock_irqrestore(&isp->lock, flags);
 
 	/* stream off sensor */
-	ret = v4l2_subdev_call(isp->inputs[isp->asd.input_curr].camera, video, s_stream, 0);
+	ret = v4l2_subdev_call(isp->inputs[isp->asd.input_curr].sensor, video, s_stream, 0);
 	if (ret)
 		dev_warn(isp->dev, "Stopping sensor stream failed: %d\n", ret);
 
@@ -936,7 +936,7 @@ void atomisp_assert_recovery_work(struct work_struct *work)
 	/* Requeue unprocessed per-frame parameters. */
 	atomisp_recover_params_queue(&isp->asd.video_out);
 
-	ret = v4l2_subdev_call(isp->inputs[isp->asd.input_curr].camera, video, s_stream, 1);
+	ret = v4l2_subdev_call(isp->inputs[isp->asd.input_curr].sensor, video, s_stream, 1);
 	if (ret)
 		dev_err(isp->dev, "Starting sensor stream failed: %d\n", ret);
 
@@ -3124,7 +3124,7 @@ int atomisp_color_effect(struct atomisp_sub_device *asd, int flag,
 	control.id = V4L2_CID_COLORFX;
 	control.value = *effect;
 	ret =
-	    v4l2_s_ctrl(NULL, isp->inputs[asd->input_curr].camera->ctrl_handler,
+	    v4l2_s_ctrl(NULL, isp->inputs[asd->input_curr].sensor->ctrl_handler,
 			&control);
 	/*
 	 * if set color effect to sensor successfully, return
@@ -3620,16 +3620,16 @@ int atomisp_s_sensor_power(struct atomisp_device *isp, unsigned int input, bool
 {
 	int ret;
 
-	if (isp->inputs[input].camera_on == on)
+	if (isp->inputs[input].sensor_on == on)
 		return 0;
 
-	ret = v4l2_subdev_call(isp->inputs[input].camera, core, s_power, on);
+	ret = v4l2_subdev_call(isp->inputs[input].sensor, core, s_power, on);
 	if (ret && ret != -ENOIOCTLCMD) {
 		dev_err(isp->dev, "Error setting sensor power %d: %d\n", on, ret);
 		return ret;
 	}
 
-	isp->inputs[input].camera_on = on;
+	isp->inputs[input].sensor_on = on;
 	return 0;
 }
 
@@ -3677,7 +3677,7 @@ void atomisp_setup_input_links(struct atomisp_device *isp)
 		 * will end up calling atomisp_link_setup() which calls this
 		 * function again leading to endless recursion.
 		 */
-		if (isp->sensor_subdevs[i] == isp->inputs[isp->asd.input_curr].camera)
+		if (isp->sensor_subdevs[i] == isp->inputs[isp->asd.input_curr].sensor)
 			link->flags |= MEDIA_LNK_FL_ENABLED;
 		else
 			link->flags &= ~MEDIA_LNK_FL_ENABLED;
@@ -3704,7 +3704,7 @@ static int atomisp_set_sensor_crop_and_fmt(struct atomisp_device *isp,
 	struct v4l2_subdev_state *sd_state;
 	int ret = 0;
 
-	if (!input->camera)
+	if (!input->sensor)
 		return -EINVAL;
 
 	/*
@@ -3719,7 +3719,7 @@ static int atomisp_set_sensor_crop_and_fmt(struct atomisp_device *isp,
 	}
 
 	sd_state = (which == V4L2_SUBDEV_FORMAT_TRY) ? input->try_sd_state :
-						       input->camera->active_state;
+						       input->sensor->active_state;
 	if (sd_state)
 		v4l2_subdev_lock_state(sd_state);
 
@@ -3740,14 +3740,14 @@ static int atomisp_set_sensor_crop_and_fmt(struct atomisp_device *isp,
 	sel.r.left = ((input->native_rect.width - sel.r.width) / 2) & ~1;
 	sel.r.top = ((input->native_rect.height - sel.r.height) / 2) & ~1;
 
-	ret = v4l2_subdev_call(input->camera, pad, set_selection, sd_state, &sel);
+	ret = v4l2_subdev_call(input->sensor, pad, set_selection, sd_state, &sel);
 	if (ret)
 		dev_err(isp->dev, "Error setting crop to (%d,%d)/%ux%u: %d\n",
 			sel.r.left, sel.r.top, sel.r.width, sel.r.height, ret);
 
 set_fmt:
 	if (ret == 0)
-		ret = v4l2_subdev_call(input->camera, pad, set_fmt, sd_state, &format);
+		ret = v4l2_subdev_call(input->sensor, pad, set_fmt, sd_state, &format);
 
 	if (sd_state)
 		v4l2_subdev_unlock_state(sd_state);
@@ -3875,7 +3875,7 @@ static inline int atomisp_set_sensor_mipi_to_isp(
 	u32 mipi_port, metadata_width = 0, metadata_height = 0;
 
 	ctrl.id = V4L2_CID_LINK_FREQ;
-	if (v4l2_g_ctrl(input->camera->ctrl_handler, &ctrl) == 0)
+	if (v4l2_g_ctrl(input->sensor->ctrl_handler, &ctrl) == 0)
 		mipi_freq = ctrl.value;
 
 	if (asd->stream_env[stream_id].isys_configs == 1) {
@@ -4038,7 +4038,7 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 	if (!format)
 		return -EINVAL;
 
-	mipi_info = atomisp_to_sensor_mipi_info(input->camera);
+	mipi_info = atomisp_to_sensor_mipi_info(input->sensor);
 
 	if (atomisp_set_sensor_mipi_to_isp(asd, ATOMISP_INPUT_STREAM_GENERAL,
 					   mipi_info))
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 2eb44bccff0e..bc97fa2c374c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1845,7 +1845,7 @@ static enum ia_css_pipe_mode __pipe_id_to_pipe_mode(
 {
 	struct atomisp_device *isp = asd->isp;
 	struct camera_mipi_info *mipi_info = atomisp_to_sensor_mipi_info(
-		isp->inputs[asd->input_curr].camera);
+		isp->inputs[asd->input_curr].sensor);
 
 	switch (pipe_id) {
 	case IA_CSS_PIPE_ID_COPY:
diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index 28afc0bfc43b..95b9113d75e9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -298,7 +298,7 @@ static void atomisp_csi2_configure_isp2401(struct atomisp_sub_device *asd)
 
 	ctrl.id = V4L2_CID_LINK_FREQ;
 	if (v4l2_g_ctrl
-	    (isp->inputs[asd->input_curr].camera->ctrl_handler, &ctrl) == 0)
+	    (isp->inputs[asd->input_curr].sensor->ctrl_handler, &ctrl) == 0)
 		mipi_freq = ctrl.value;
 
 	clk_termen = atomisp_csi2_configure_calc(coeff_clk_termen, mipi_freq,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index 775506757471..268cfafbfe48 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -114,8 +114,8 @@ struct atomisp_input_subdev {
 	u32 code; /* MEDIA_BUS_FMT_* */
 	bool binning_support;
 	bool crop_support;
-	bool camera_on;
-	struct v4l2_subdev *camera;
+	bool sensor_on;
+	struct v4l2_subdev *sensor;
 	struct v4l2_subdev *csi_port;
 	/* Sensor rects for sensors which support crop */
 	struct v4l2_rect native_rect;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 1fb2ba819de3..269c2d5efa8c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -386,11 +386,11 @@ static int atomisp_enum_input(struct file *file, void *fh,
 	if (index >= isp->input_cnt)
 		return -EINVAL;
 
-	if (!isp->inputs[index].camera)
+	if (!isp->inputs[index].sensor)
 		return -EINVAL;
 
 	memset(input, 0, sizeof(struct v4l2_input));
-	strscpy(input->name, isp->inputs[index].camera->name,
+	strscpy(input->name, isp->inputs[index].sensor->name,
 		sizeof(input->name));
 
 	input->type = V4L2_INPUT_TYPE_CAMERA;
@@ -433,7 +433,7 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 	if (input >= isp->input_cnt)
 		return -EINVAL;
 
-	if (!isp->inputs[input].camera)
+	if (!isp->inputs[input].sensor)
 		return -EINVAL;
 
 	ret = atomisp_pipe_check(pipe, true);
@@ -539,14 +539,14 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 	struct v4l2_subdev_state *act_sd_state;
 	int ret;
 
-	if (!input->camera)
+	if (!input->sensor)
 		return -EINVAL;
 
 	if (input->crop_support)
 		return atomisp_enum_framesizes_crop(isp, fsize);
 
-	act_sd_state = v4l2_subdev_lock_and_get_active_state(input->camera);
-	ret = v4l2_subdev_call(input->camera, pad, enum_frame_size,
+	act_sd_state = v4l2_subdev_lock_and_get_active_state(input->sensor);
+	ret = v4l2_subdev_call(input->sensor, pad, enum_frame_size,
 			       act_sd_state, &fse);
 	if (act_sd_state)
 		v4l2_subdev_unlock_state(act_sd_state);
@@ -577,11 +577,11 @@ static int atomisp_enum_frameintervals(struct file *file, void *priv,
 	struct v4l2_subdev_state *act_sd_state;
 	int ret;
 
-	if (!input->camera)
+	if (!input->sensor)
 		return -EINVAL;
 
-	act_sd_state = v4l2_subdev_lock_and_get_active_state(input->camera);
-	ret = v4l2_subdev_call(input->camera, pad, enum_frame_interval,
+	act_sd_state = v4l2_subdev_lock_and_get_active_state(input->sensor);
+	ret = v4l2_subdev_call(input->sensor, pad, enum_frame_interval,
 			       act_sd_state, &fie);
 	if (act_sd_state)
 		v4l2_subdev_unlock_state(act_sd_state);
@@ -609,11 +609,11 @@ static int atomisp_enum_fmt_cap(struct file *file, void *fh,
 	unsigned int i, fi = 0;
 	int ret;
 
-	if (!input->camera)
+	if (!input->sensor)
 		return -EINVAL;
 
-	act_sd_state = v4l2_subdev_lock_and_get_active_state(input->camera);
-	ret = v4l2_subdev_call(input->camera, pad, enum_mbus_code,
+	act_sd_state = v4l2_subdev_lock_and_get_active_state(input->sensor);
+	ret = v4l2_subdev_call(input->sensor, pad, enum_mbus_code,
 			       act_sd_state, &code);
 	if (act_sd_state)
 		v4l2_subdev_unlock_state(act_sd_state);
@@ -945,7 +945,7 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 	}
 
 	/* stream on the sensor */
-	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
+	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].sensor,
 			       video, s_stream, 1);
 	if (ret) {
 		dev_err(isp->dev, "Starting sensor stream failed: %d\n", ret);
@@ -1002,7 +1002,7 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
 
 	atomisp_subdev_cleanup_pending_events(asd);
 
-	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
+	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].sensor,
 			       video, s_stream, 0);
 	if (ret)
 		dev_warn(isp->dev, "Stopping sensor stream failed: %d\n", ret);
@@ -1332,7 +1332,7 @@ static int atomisp_s_parm(struct file *file, void *fh,
 
 		fi.interval = parm->parm.capture.timeperframe;
 
-		rval = v4l2_subdev_call_state_active(isp->inputs[asd->input_curr].camera,
+		rval = v4l2_subdev_call_state_active(isp->inputs[asd->input_curr].sensor,
 						     pad, set_frame_interval, &fi);
 		if (!rval)
 			parm->parm.capture.timeperframe = fi.interval;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 2841824cd0ca..03c535bcb229 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -895,24 +895,25 @@ static void atomisp_init_sensor(struct atomisp_input_subdev *input)
 	 * it emulates a normal v4l2 device there, passing through try_fmt /
 	 * set_fmt to the sensor.
 	 */
-	try_sd_state = __v4l2_subdev_state_alloc(input->camera,
-				"atomisp:try_sd_state->lock", &try_sd_state_key);
+	try_sd_state = __v4l2_subdev_state_alloc(input->sensor,
+						 "atomisp:try_sd_state->lock",
+						 &try_sd_state_key);
 	if (IS_ERR(try_sd_state))
 		return;
 
 	input->try_sd_state = try_sd_state;
 
-	act_sd_state = v4l2_subdev_lock_and_get_active_state(input->camera);
+	act_sd_state = v4l2_subdev_lock_and_get_active_state(input->sensor);
 
 	mbus_code_enum.which = V4L2_SUBDEV_FORMAT_ACTIVE;
-	err = v4l2_subdev_call(input->camera, pad, enum_mbus_code,
+	err = v4l2_subdev_call(input->sensor, pad, enum_mbus_code,
 			       act_sd_state, &mbus_code_enum);
 	if (!err)
 		input->code = mbus_code_enum.code;
 
 	sel.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	sel.target = V4L2_SEL_TGT_NATIVE_SIZE;
-	err = v4l2_subdev_call(input->camera, pad, get_selection,
+	err = v4l2_subdev_call(input->sensor, pad, get_selection,
 			       act_sd_state, &sel);
 	if (err)
 		goto unlock_act_sd_state;
@@ -921,7 +922,7 @@ static void atomisp_init_sensor(struct atomisp_input_subdev *input)
 
 	sel.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	sel.target = V4L2_SEL_TGT_CROP_DEFAULT;
-	err = v4l2_subdev_call(input->camera, pad, get_selection,
+	err = v4l2_subdev_call(input->sensor, pad, get_selection,
 			       act_sd_state, &sel);
 	if (err)
 		goto unlock_act_sd_state;
@@ -939,7 +940,7 @@ static void atomisp_init_sensor(struct atomisp_input_subdev *input)
 		fse.code = input->code;
 		fse.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 
-		err = v4l2_subdev_call(input->camera, pad, enum_frame_size,
+		err = v4l2_subdev_call(input->sensor, pad, enum_frame_size,
 				       act_sd_state, &fse);
 		if (err)
 			break;
@@ -963,7 +964,7 @@ static void atomisp_init_sensor(struct atomisp_input_subdev *input)
 	sel.target = V4L2_SEL_TGT_CROP;
 	sel.r = input->native_rect;
 	v4l2_subdev_lock_state(input->try_sd_state);
-	err = v4l2_subdev_call(input->camera, pad, set_selection,
+	err = v4l2_subdev_call(input->sensor, pad, set_selection,
 			       input->try_sd_state, &sel);
 	v4l2_subdev_unlock_state(input->try_sd_state);
 	if (err)
@@ -972,12 +973,12 @@ static void atomisp_init_sensor(struct atomisp_input_subdev *input)
 	sel.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	sel.target = V4L2_SEL_TGT_CROP;
 	sel.r = input->native_rect;
-	err = v4l2_subdev_call(input->camera, pad, set_selection,
+	err = v4l2_subdev_call(input->sensor, pad, set_selection,
 			       act_sd_state, &sel);
 	if (err)
 		goto unlock_act_sd_state;
 
-	dev_info(input->camera->dev, "Supports crop native %dx%d active %dx%d binning %d\n",
+	dev_info(input->sensor->dev, "Supports crop native %dx%d active %dx%d binning %d\n",
 		 input->native_rect.width, input->native_rect.height,
 		 input->active_rect.width, input->active_rect.height,
 		 input->binning_support);
@@ -1007,12 +1008,12 @@ int atomisp_register_device_nodes(struct atomisp_device *isp)
 		input = &isp->inputs[isp->input_cnt];
 
 		input->port = i;
-		input->camera = isp->sensor_subdevs[i];
+		input->sensor = isp->sensor_subdevs[i];
 		input->csi_port = &isp->csi2_port[i].subdev;
 
 		atomisp_init_sensor(input);
 
-		err = media_create_pad_link(&input->camera->entity, 0,
+		err = media_create_pad_link(&input->sensor->entity, 0,
 					    &isp->csi2_port[i].subdev.entity,
 					    CSI2_PAD_SINK,
 					    MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE);
-- 
2.49.0


