Return-Path: <linux-media+bounces-5338-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1B2858F0E
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 12:25:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5700283746
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 11:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F20365BBD;
	Sat, 17 Feb 2024 11:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VVPpKWfy"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E0F657AE
	for <linux-media@vger.kernel.org>; Sat, 17 Feb 2024 11:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708169097; cv=none; b=kGyLFdcWZ/T9CNSoSypGa6J33wDucXA/zaDc8jFThjxz1GBBQIzsLuPIe1KG6S8vjpmr7PAAys/je/IJMO3H7bDd3ma0+gbCJhWZUqY85cTbsXlV6SWDrxzzcrMtp9oLdEpjzj5vGxdiB5Q7+RlKJcfat3n/KeSosmGBmbjmQEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708169097; c=relaxed/simple;
	bh=wrY5hsk/7VGSEWxvstXo3h77Rosl0WWFusvFiGFVvTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J+mtiCil2aq1FCaFTaOjt6/iT/PafjTRVJ/ITX+z4bKZoiLuBTe8K8UtCGJqc/TFnUo4oNGE1kgWTGQOuQH1xemxmkt2yaQSq6IQaB3dkeUDR/oN/Wub8EXjqi5dnVwJ7qn+EoqO+AURNuUlFfPMp3kvQ/FR061Be8HEZsM3GLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VVPpKWfy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708169094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o5lg1lSxy7EYXyfmSlWrlwLP9RH/aRRWA+ZgpxSM3hU=;
	b=VVPpKWfyFAsa55Wl5V+UZcLdibZv8krxWH9dUfL/bwbxg6RhTtlYjMmtwLsUa44lArtRZy
	D/J8ftScvoAz2BbdtfTHvk2nv3De7n8etP/KJWV/Z8iNCmc80uM4teLiRaz/Rhu58lOZTc
	wAXWB33zvgqWGWvMxFazUecNTNwXWg4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-652-mHiUNi9QO_aLweMSRaDNSw-1; Sat,
 17 Feb 2024 06:24:51 -0500
X-MC-Unique: mHiUNi9QO_aLweMSRaDNSw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95A7429AC006;
	Sat, 17 Feb 2024 11:24:50 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B7421C1C7E3;
	Sat, 17 Feb 2024 11:24:49 +0000 (UTC)
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
Subject: [PATCH 3/9] media: atomisp: Remove custom VCM handling
Date: Sat, 17 Feb 2024 12:24:32 +0100
Message-ID: <20240217112438.15240-4-hdegoede@redhat.com>
In-Reply-To: <20240217112438.15240-1-hdegoede@redhat.com>
References: <20240217112438.15240-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

Remove the custom VCM handling, instead the VCM should be controlled
through its own v4l2-subdev and the new ipu-bridge.c code already
supports instantiating an i2c_client for this and setting up
the necessary endpoints in the fwnode graph.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/include/linux/atomisp.h     |  3 -
 .../atomisp/include/linux/atomisp_platform.h  |  5 +-
 .../media/atomisp/pci/atomisp_internal.h      |  4 -
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 86 +------------------
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 15 ----
 5 files changed, 3 insertions(+), 110 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index bbbd904b696a..d9a7a599038d 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -914,9 +914,6 @@ enum atomisp_burst_capture_options {
 /* VCM step time */
 #define V4L2_CID_VCM_TIMING                (V4L2_CID_CAMERA_LASTP1 + 12)
 
-/* Query Focus Status */
-#define V4L2_CID_FOCUS_STATUS              (V4L2_CID_CAMERA_LASTP1 + 14)
-
 /* number of frames to skip at stream start */
 #define V4L2_CID_G_SKIP_FRAMES		   (V4L2_CID_CAMERA_LASTP1 + 17)
 
diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
index 487ef5846c24..2535402afd73 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
@@ -111,9 +111,8 @@ enum atomisp_input_format {
 
 enum intel_v4l2_subdev_type {
 	RAW_CAMERA = 1,
-	CAMERA_MOTOR = 2,
-	LED_FLASH = 3,
-	TEST_PATTERN = 4,
+	LED_FLASH = 2,
+	TEST_PATTERN = 3,
 };
 
 struct intel_v4l2_subdev_id {
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index bba9bc64d447..ca8ed3a6b9b8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -134,9 +134,6 @@ struct atomisp_input_subdev {
 	struct v4l2_rect active_rect;
 	/* Sensor state for which == V4L2_SUBDEV_FORMAT_TRY calls */
 	struct v4l2_subdev_state *try_sd_state;
-
-	struct v4l2_subdev *motor;
-
 	/*
 	 * To show this resource is used by
 	 * which stream, in ISP multiple stream mode
@@ -210,7 +207,6 @@ struct atomisp_device {
 	unsigned int input_cnt;
 	struct atomisp_input_subdev inputs[ATOM_ISP_MAX_INPUTS];
 	struct v4l2_subdev *flash;
-	struct v4l2_subdev *motor;
 
 	struct atomisp_regs saved_regs;
 	struct atomisp_css_env css_env;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index bb8e5e883b50..ef555054fdbf 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -557,7 +557,6 @@ static int atomisp_enum_input(struct file *file, void *fh,
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	int index = input->index;
-	struct v4l2_subdev *motor;
 
 	if (index >= isp->input_cnt)
 		return -EINVAL;
@@ -569,28 +568,6 @@ static int atomisp_enum_input(struct file *file, void *fh,
 	strscpy(input->name, isp->inputs[index].camera->name,
 		sizeof(input->name));
 
-	/*
-	 * HACK: append actuator's name to sensor's
-	 * As currently userspace can't talk directly to subdev nodes, this
-	 * ioctl is the only way to enum inputs + possible external actuators
-	 * for 3A tuning purpose.
-	 */
-	if (!IS_ISP2401)
-		motor = isp->inputs[index].motor;
-	else
-		motor = isp->motor;
-
-	if (motor && strlen(motor->name) > 0) {
-		const int cur_len = strlen(input->name);
-		const int max_size = sizeof(input->name) - cur_len - 1;
-
-		if (max_size > 1) {
-			input->name[cur_len] = '+';
-			strscpy(&input->name[cur_len + 1],
-				motor->name, max_size);
-		}
-	}
-
 	input->type = V4L2_INPUT_TYPE_CAMERA;
 	input->index = index;
 	input->reserved[0] = isp->inputs[index].type;
@@ -629,7 +606,6 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
 	struct atomisp_sub_device *asd = pipe->asd;
 	struct v4l2_subdev *camera = NULL;
-	struct v4l2_subdev *motor;
 	int ret;
 
 	ret = atomisp_pipe_check(pipe, true);
@@ -666,17 +642,6 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 		return ret;
 	}
 
-	if (!IS_ISP2401) {
-		motor = isp->inputs[input].motor;
-	} else {
-		motor = isp->motor;
-		if (motor)
-			ret = v4l2_subdev_call(motor, core, s_power, 1);
-	}
-
-	if (motor)
-		ret = v4l2_subdev_call(motor, core, init, 1);
-
 	asd->input_curr = input;
 	/* mark this camera is used by the current stream */
 	isp->inputs[input].asd = asd;
@@ -1433,26 +1398,8 @@ static int atomisp_s_ctrl(struct file *file, void *fh,
 static int atomisp_queryctl(struct file *file, void *fh,
 			    struct v4l2_queryctrl *qc)
 {
-	int i, ret = -EINVAL;
 	struct video_device *vdev = video_devdata(file);
-	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
-	struct atomisp_device *isp = video_get_drvdata(vdev);
-
-	switch (qc->id) {
-	case V4L2_CID_FOCUS_ABSOLUTE:
-	case V4L2_CID_FOCUS_RELATIVE:
-	case V4L2_CID_FOCUS_STATUS:
-		if (!IS_ISP2401) {
-			return v4l2_queryctrl(isp->inputs[asd->input_curr].camera->
-					    ctrl_handler, qc);
-		}
-		/* ISP2401 */
-		if (isp->motor)
-			return v4l2_queryctrl(isp->motor->ctrl_handler, qc);
-		else
-			return v4l2_queryctrl(isp->inputs[asd->input_curr].
-					      camera->ctrl_handler, qc);
-	}
+	int i, ret = -EINVAL;
 
 	if (qc->id & V4L2_CTRL_FLAG_NEXT_CTRL)
 		return ret;
@@ -1478,16 +1425,10 @@ static int atomisp_camera_g_ext_ctrls(struct file *file, void *fh,
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
 	struct atomisp_device *isp = video_get_drvdata(vdev);
-	struct v4l2_subdev *motor;
 	struct v4l2_control ctrl;
 	int i;
 	int ret = 0;
 
-	if (!IS_ISP2401)
-		motor = isp->inputs[asd->input_curr].motor;
-	else
-		motor = isp->motor;
-
 	for (i = 0; i < c->count; i++) {
 		ctrl.id = c->controls[i].id;
 		ctrl.value = c->controls[i].value;
@@ -1509,13 +1450,6 @@ static int atomisp_camera_g_ext_ctrls(struct file *file, void *fh,
 			    v4l2_g_ctrl(isp->inputs[asd->input_curr].camera->
 					ctrl_handler, &ctrl);
 			break;
-		case V4L2_CID_FOCUS_ABSOLUTE:
-		case V4L2_CID_FOCUS_RELATIVE:
-		case V4L2_CID_FOCUS_STATUS:
-		case V4L2_CID_FOCUS_AUTO:
-			if (motor)
-				ret = v4l2_g_ctrl(motor->ctrl_handler, &ctrl);
-			break;
 		case V4L2_CID_FLASH_STATUS:
 		case V4L2_CID_FLASH_INTENSITY:
 		case V4L2_CID_FLASH_TORCH_INTENSITY:
@@ -1584,16 +1518,10 @@ static int atomisp_camera_s_ext_ctrls(struct file *file, void *fh,
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
 	struct atomisp_device *isp = video_get_drvdata(vdev);
-	struct v4l2_subdev *motor;
 	struct v4l2_control ctrl;
 	int i;
 	int ret = 0;
 
-	if (!IS_ISP2401)
-		motor = isp->inputs[asd->input_curr].motor;
-	else
-		motor = isp->motor;
-
 	for (i = 0; i < c->count; i++) {
 		struct v4l2_ctrl *ctr;
 
@@ -1616,18 +1544,6 @@ static int atomisp_camera_s_ext_ctrls(struct file *file, void *fh,
 					  isp->inputs[asd->input_curr].camera->
 					  ctrl_handler, &ctrl);
 			break;
-		case V4L2_CID_FOCUS_ABSOLUTE:
-		case V4L2_CID_FOCUS_RELATIVE:
-		case V4L2_CID_FOCUS_STATUS:
-		case V4L2_CID_FOCUS_AUTO:
-			if (motor)
-				ret = v4l2_s_ctrl(NULL, motor->ctrl_handler,
-						  &ctrl);
-			else
-				ret = v4l2_s_ctrl(NULL,
-						  isp->inputs[asd->input_curr].
-						  camera->ctrl_handler, &ctrl);
-			break;
 		case V4L2_CID_FLASH_STATUS:
 		case V4L2_CID_FLASH_INTENSITY:
 		case V4L2_CID_FLASH_TORCH_INTENSITY:
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index f736e54c7df3..1a936dbe8eb4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -823,13 +823,6 @@ static int atomisp_subdev_probe(struct atomisp_device *isp)
 			isp->sensor_lanes[mipi_port] = subdevs->lanes;
 			isp->sensor_subdevs[subdevs->port] = subdevs->subdev;
 			break;
-		case CAMERA_MOTOR:
-			if (isp->motor) {
-				dev_warn(isp->dev, "too many atomisp motors\n");
-				continue;
-			}
-			isp->motor = subdevs->subdev;
-			break;
 		case LED_FLASH:
 			if (isp->flash) {
 				dev_warn(isp->dev, "too many atomisp flash devices\n");
@@ -1066,14 +1059,6 @@ int atomisp_register_device_nodes(struct atomisp_device *isp)
 
 		atomisp_init_sensor(input);
 
-		/*
-		 * HACK: Currently VCM belongs to primary sensor only, but correct
-		 * approach must be to acquire from platform code which sensor
-		 * owns it.
-		 */
-		if (i == ATOMISP_CAMERA_PORT_PRIMARY)
-			input->motor = isp->motor;
-
 		err = media_create_pad_link(&input->camera->entity, 0,
 					    &isp->csi2_port[i].subdev.entity,
 					    CSI2_PAD_SINK,
-- 
2.43.0


