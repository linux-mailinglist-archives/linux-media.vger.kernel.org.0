Return-Path: <linux-media+bounces-5339-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A13858F0F
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 12:25:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F86BB20DD7
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 11:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E23065BD1;
	Sat, 17 Feb 2024 11:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MwJJa4ET"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7003657C1
	for <linux-media@vger.kernel.org>; Sat, 17 Feb 2024 11:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708169099; cv=none; b=aeaTkTWnwD85Bo6jMLu8OY7LE2AfOIUxPK7VDSf+EkoBZD8J8KOzmI8x2l78S3I1TuWciqcxYmti2f91cy4yc4Wk39b5amPWH/1A4QFMK7M+dHkwyLmvfxp+jEtUpnZXZ8ylWrLdMLpOzOk7WNhNLMXMXCaVDD5dVEuMuPKxt1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708169099; c=relaxed/simple;
	bh=a9d4fkcb0BFPn59gHtHVoJPwdj5lYLO/Rh+er5M4XKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qc1Iz8WYTrMo48EZly/KvD7ixJTrCtlPK0zZIpwsFe6wVbJKBY2ILOB7wVHn2EtfKjqf3MvzTUoRq3ixjoVdMxhvV7fkhq24m9mC3yX/VzTW9RXs5hXe0Vaf7DPnjOytlSrwy7H8hJEpKypWiWH65udMRq5DXchGdcmXLqb2HCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MwJJa4ET; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708169096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n+mKSxLdVQJzI6hiIn7VNxIYUjVbfdt4KZD8j3an3UM=;
	b=MwJJa4ET1/varzBdJYAeLAsNUDAw7T8KS7/HTF9+K9D/0BgK4C/FwCBZmOQxWWyorad/wS
	oN33ydVAorf2B/i+VGb29nASTQakrV6l5YGcM6CUGrMShuPMmYIHGChIBa5WuVs/XjEc+x
	THc/CzZMrv1TT+SYeZuJO18vr191+mM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-623-Y1nWyGWaPFG8EdqkijlXDw-1; Sat,
 17 Feb 2024 06:24:52 -0500
X-MC-Unique: Y1nWyGWaPFG8EdqkijlXDw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D8A5383D741;
	Sat, 17 Feb 2024 11:24:52 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C7E6E1C1C7E2;
	Sat, 17 Feb 2024 11:24:50 +0000 (UTC)
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
Subject: [PATCH 4/9] media: atomisp: Remove ISP controls which get passed through to the camera
Date: Sat, 17 Feb 2024 12:24:33 +0100
Message-ID: <20240217112438.15240-5-hdegoede@redhat.com>
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

Drop all ISP controls and ioctls which just get passed through
to the camera subdev. Instead these calls should be done directly
at the sensor subdev.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/include/linux/atomisp.h     |  21 --
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 248 ------------------
 2 files changed, 269 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index d9a7a599038d..b2735a008052 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -837,9 +837,6 @@ enum atomisp_burst_capture_options {
 #define ATOMISP_IOC_S_PARAMETERS \
 	_IOW('v', BASE_VIDIOC_PRIVATE + 32, struct atomisp_parameters)
 
-#define ATOMISP_IOC_EXT_ISP_CTRL \
-	_IOWR('v', BASE_VIDIOC_PRIVATE + 35, struct atomisp_ext_isp_ctrl)
-
 #define ATOMISP_IOC_EXP_ID_UNLOCK \
 	_IOW('v', BASE_VIDIOC_PRIVATE + 36, int)
 
@@ -909,19 +906,6 @@ enum atomisp_burst_capture_options {
 /* Set the flash mode (see enum atomisp_flash_mode) */
 #define V4L2_CID_FLASH_MODE                (V4L2_CID_CAMERA_LASTP1 + 10)
 
-/* VCM slew control */
-#define V4L2_CID_VCM_SLEW                  (V4L2_CID_CAMERA_LASTP1 + 11)
-/* VCM step time */
-#define V4L2_CID_VCM_TIMING                (V4L2_CID_CAMERA_LASTP1 + 12)
-
-/* number of frames to skip at stream start */
-#define V4L2_CID_G_SKIP_FRAMES		   (V4L2_CID_CAMERA_LASTP1 + 17)
-
-/* Query sensor's 2A status */
-#define V4L2_CID_2A_STATUS                 (V4L2_CID_CAMERA_LASTP1 + 18)
-#define V4L2_2A_STATUS_AE_READY            BIT(0)
-#define V4L2_2A_STATUS_AWB_READY           BIT(1)
-
 #define V4L2_CID_RUN_MODE			(V4L2_CID_CAMERA_LASTP1 + 20)
 #define ATOMISP_RUN_MODE_VIDEO			1
 #define ATOMISP_RUN_MODE_STILL_CAPTURE		2
@@ -952,11 +936,6 @@ enum atomisp_burst_capture_options {
 /* Disable digital zoom */
 #define V4L2_CID_DISABLE_DZ		(V4L2_CID_CAMERA_LASTP1 + 32)
 
-#define V4L2_CID_TEST_PATTERN_COLOR_R	(V4L2_CID_CAMERA_LASTP1 + 33)
-#define V4L2_CID_TEST_PATTERN_COLOR_GR	(V4L2_CID_CAMERA_LASTP1 + 34)
-#define V4L2_CID_TEST_PATTERN_COLOR_GB	(V4L2_CID_CAMERA_LASTP1 + 35)
-#define V4L2_CID_TEST_PATTERN_COLOR_B	(V4L2_CID_CAMERA_LASTP1 + 36)
-
 #define V4L2_CID_ATOMISP_SELECT_ISP_VERSION	(V4L2_CID_CAMERA_LASTP1 + 38)
 
 #define V4L2_BUF_FLAG_BUFFER_INVALID       0x0400
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index ef555054fdbf..74cf055cb09b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -82,15 +82,6 @@ static struct v4l2_queryctrl ci_v4l2_controls[] = {
 		.step = 1,
 		.default_value = 0x00,
 	},
-	{
-		.id = V4L2_CID_POWER_LINE_FREQUENCY,
-		.type = V4L2_CTRL_TYPE_MENU,
-		.name = "Light frequency filter",
-		.minimum = 1,
-		.maximum = 2,
-		.step = 1,
-		.default_value = 1,
-	},
 	{
 		.id = V4L2_CID_COLORFX,
 		.type = V4L2_CTRL_TYPE_INTEGER,
@@ -100,15 +91,6 @@ static struct v4l2_queryctrl ci_v4l2_controls[] = {
 		.step = 1,
 		.default_value = 0,
 	},
-	{
-		.id = V4L2_CID_COLORFX_CBCR,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "Image Color Effect CbCr",
-		.minimum = 0,
-		.maximum = 0xffff,
-		.step = 1,
-		.default_value = 0,
-	},
 	{
 		.id = V4L2_CID_ATOMISP_BAD_PIXEL_DETECTION,
 		.type = V4L2_CTRL_TYPE_INTEGER,
@@ -172,142 +154,6 @@ static struct v4l2_queryctrl ci_v4l2_controls[] = {
 		.step = 1,
 		.default_value = 1,
 	},
-	{
-		.id = V4L2_CID_2A_STATUS,
-		.type = V4L2_CTRL_TYPE_BITMASK,
-		.name = "AE and AWB status",
-		.minimum = 0,
-		.maximum = V4L2_2A_STATUS_AE_READY | V4L2_2A_STATUS_AWB_READY,
-		.step = 1,
-		.default_value = 0,
-	},
-	{
-		.id = V4L2_CID_EXPOSURE,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "exposure",
-		.minimum = -4,
-		.maximum = 4,
-		.step = 1,
-		.default_value = 0,
-	},
-	{
-		.id = V4L2_CID_EXPOSURE_ZONE_NUM,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "one-time exposure zone number",
-		.minimum = 0x0,
-		.maximum = 0xffff,
-		.step = 1,
-		.default_value = 0,
-	},
-	{
-		.id = V4L2_CID_EXPOSURE_AUTO_PRIORITY,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "Exposure auto priority",
-		.minimum = V4L2_EXPOSURE_AUTO,
-		.maximum = V4L2_EXPOSURE_APERTURE_PRIORITY,
-		.step = 1,
-		.default_value = V4L2_EXPOSURE_AUTO,
-	},
-	{
-		.id = V4L2_CID_SCENE_MODE,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "scene mode",
-		.minimum = 0,
-		.maximum = 13,
-		.step = 1,
-		.default_value = 0,
-	},
-	{
-		.id = V4L2_CID_ISO_SENSITIVITY,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "iso",
-		.minimum = -4,
-		.maximum = 4,
-		.step = 1,
-		.default_value = 0,
-	},
-	{
-		.id = V4L2_CID_ISO_SENSITIVITY_AUTO,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "iso mode",
-		.minimum = V4L2_ISO_SENSITIVITY_MANUAL,
-		.maximum = V4L2_ISO_SENSITIVITY_AUTO,
-		.step = 1,
-		.default_value = V4L2_ISO_SENSITIVITY_AUTO,
-	},
-	{
-		.id = V4L2_CID_AUTO_N_PRESET_WHITE_BALANCE,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "white balance",
-		.minimum = 0,
-		.maximum = 9,
-		.step = 1,
-		.default_value = 0,
-	},
-	{
-		.id = V4L2_CID_EXPOSURE_METERING,
-		.type = V4L2_CTRL_TYPE_MENU,
-		.name = "metering",
-		.minimum = 0,
-		.maximum = 3,
-		.step = 1,
-		.default_value = 1,
-	},
-	{
-		.id = V4L2_CID_3A_LOCK,
-		.type = V4L2_CTRL_TYPE_BITMASK,
-		.name = "3a lock",
-		.minimum = 0,
-		.maximum = V4L2_LOCK_EXPOSURE | V4L2_LOCK_WHITE_BALANCE
-		| V4L2_LOCK_FOCUS,
-		.step = 1,
-		.default_value = 0,
-	},
-	{
-		.id = V4L2_CID_TEST_PATTERN,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "Test Pattern",
-		.minimum = 0,
-		.maximum = 0xffff,
-		.step = 1,
-		.default_value = 0,
-	},
-	{
-		.id = V4L2_CID_TEST_PATTERN_COLOR_R,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "Test Pattern Solid Color R",
-		.minimum = INT_MIN,
-		.maximum = INT_MAX,
-		.step = 1,
-		.default_value = 0,
-	},
-	{
-		.id = V4L2_CID_TEST_PATTERN_COLOR_GR,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "Test Pattern Solid Color GR",
-		.minimum = INT_MIN,
-		.maximum = INT_MAX,
-		.step = 1,
-		.default_value = 0,
-	},
-	{
-		.id = V4L2_CID_TEST_PATTERN_COLOR_GB,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "Test Pattern Solid Color GB",
-		.minimum = INT_MIN,
-		.maximum = INT_MAX,
-		.step = 1,
-		.default_value = 0,
-	},
-	{
-		.id = V4L2_CID_TEST_PATTERN_COLOR_B,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "Test Pattern Solid Color B",
-		.minimum = INT_MIN,
-		.maximum = INT_MAX,
-		.step = 1,
-		.default_value = 0,
-	},
 };
 
 static const u32 ctrls_num = ARRAY_SIZE(ci_v4l2_controls);
@@ -1248,7 +1094,6 @@ static int atomisp_g_ctrl(struct file *file, void *fh,
 {
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
-	struct atomisp_device *isp = video_get_drvdata(vdev);
 	int i, ret = -EINVAL;
 
 	for (i = 0; i < ctrls_num; i++) {
@@ -1262,27 +1107,6 @@ static int atomisp_g_ctrl(struct file *file, void *fh,
 		return ret;
 
 	switch (control->id) {
-	case V4L2_CID_IRIS_ABSOLUTE:
-	case V4L2_CID_EXPOSURE_ABSOLUTE:
-	case V4L2_CID_2A_STATUS:
-	case V4L2_CID_AUTO_N_PRESET_WHITE_BALANCE:
-	case V4L2_CID_EXPOSURE:
-	case V4L2_CID_EXPOSURE_AUTO:
-	case V4L2_CID_SCENE_MODE:
-	case V4L2_CID_ISO_SENSITIVITY:
-	case V4L2_CID_ISO_SENSITIVITY_AUTO:
-	case V4L2_CID_CONTRAST:
-	case V4L2_CID_SATURATION:
-	case V4L2_CID_SHARPNESS:
-	case V4L2_CID_3A_LOCK:
-	case V4L2_CID_EXPOSURE_ZONE_NUM:
-	case V4L2_CID_TEST_PATTERN:
-	case V4L2_CID_TEST_PATTERN_COLOR_R:
-	case V4L2_CID_TEST_PATTERN_COLOR_GR:
-	case V4L2_CID_TEST_PATTERN_COLOR_GB:
-	case V4L2_CID_TEST_PATTERN_COLOR_B:
-		return v4l2_g_ctrl(isp->inputs[asd->input_curr].camera->
-				   ctrl_handler, control);
 	case V4L2_CID_COLORFX:
 		ret = atomisp_color_effect(asd, 0, &control->value);
 		break;
@@ -1322,7 +1146,6 @@ static int atomisp_s_ctrl(struct file *file, void *fh,
 {
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
-	struct atomisp_device *isp = video_get_drvdata(vdev);
 	int i, ret = -EINVAL;
 
 	for (i = 0; i < ctrls_num; i++) {
@@ -1336,28 +1159,6 @@ static int atomisp_s_ctrl(struct file *file, void *fh,
 		return ret;
 
 	switch (control->id) {
-	case V4L2_CID_AUTO_N_PRESET_WHITE_BALANCE:
-	case V4L2_CID_EXPOSURE:
-	case V4L2_CID_EXPOSURE_AUTO:
-	case V4L2_CID_EXPOSURE_AUTO_PRIORITY:
-	case V4L2_CID_SCENE_MODE:
-	case V4L2_CID_ISO_SENSITIVITY:
-	case V4L2_CID_ISO_SENSITIVITY_AUTO:
-	case V4L2_CID_POWER_LINE_FREQUENCY:
-	case V4L2_CID_EXPOSURE_METERING:
-	case V4L2_CID_CONTRAST:
-	case V4L2_CID_SATURATION:
-	case V4L2_CID_SHARPNESS:
-	case V4L2_CID_3A_LOCK:
-	case V4L2_CID_COLORFX_CBCR:
-	case V4L2_CID_TEST_PATTERN:
-	case V4L2_CID_TEST_PATTERN_COLOR_R:
-	case V4L2_CID_TEST_PATTERN_COLOR_GR:
-	case V4L2_CID_TEST_PATTERN_COLOR_GB:
-	case V4L2_CID_TEST_PATTERN_COLOR_B:
-		return v4l2_s_ctrl(NULL,
-				   isp->inputs[asd->input_curr].camera->
-				   ctrl_handler, control);
 	case V4L2_CID_COLORFX:
 		ret = atomisp_color_effect(asd, 1, &control->value);
 		break;
@@ -1398,7 +1199,6 @@ static int atomisp_s_ctrl(struct file *file, void *fh,
 static int atomisp_queryctl(struct file *file, void *fh,
 			    struct v4l2_queryctrl *qc)
 {
-	struct video_device *vdev = video_devdata(file);
 	int i, ret = -EINVAL;
 
 	if (qc->id & V4L2_CTRL_FLAG_NEXT_CTRL)
@@ -1433,23 +1233,6 @@ static int atomisp_camera_g_ext_ctrls(struct file *file, void *fh,
 		ctrl.id = c->controls[i].id;
 		ctrl.value = c->controls[i].value;
 		switch (ctrl.id) {
-		case V4L2_CID_EXPOSURE_ABSOLUTE:
-		case V4L2_CID_EXPOSURE_AUTO:
-		case V4L2_CID_IRIS_ABSOLUTE:
-		case V4L2_CID_3A_LOCK:
-		case V4L2_CID_TEST_PATTERN:
-		case V4L2_CID_TEST_PATTERN_COLOR_R:
-		case V4L2_CID_TEST_PATTERN_COLOR_GR:
-		case V4L2_CID_TEST_PATTERN_COLOR_GB:
-		case V4L2_CID_TEST_PATTERN_COLOR_B:
-			/*
-			 * Exposure related control will be handled by sensor
-			 * driver
-			 */
-			ret =
-			    v4l2_g_ctrl(isp->inputs[asd->input_curr].camera->
-					ctrl_handler, &ctrl);
-			break;
 		case V4L2_CID_FLASH_STATUS:
 		case V4L2_CID_FLASH_INTENSITY:
 		case V4L2_CID_FLASH_TORCH_INTENSITY:
@@ -1466,11 +1249,6 @@ static int atomisp_camera_g_ext_ctrls(struct file *file, void *fh,
 		case V4L2_CID_ZOOM_ABSOLUTE:
 			ret = atomisp_digital_zoom(asd, 0, &ctrl.value);
 			break;
-		case V4L2_CID_G_SKIP_FRAMES:
-			ret = v4l2_subdev_call(
-				  isp->inputs[asd->input_curr].camera,
-				  sensor, g_skip_frames, (u32 *)&ctrl.value);
-			break;
 		default:
 			ret = -EINVAL;
 		}
@@ -1528,22 +1306,6 @@ static int atomisp_camera_s_ext_ctrls(struct file *file, void *fh,
 		ctrl.id = c->controls[i].id;
 		ctrl.value = c->controls[i].value;
 		switch (ctrl.id) {
-		case V4L2_CID_EXPOSURE_ABSOLUTE:
-		case V4L2_CID_EXPOSURE_AUTO:
-		case V4L2_CID_EXPOSURE_METERING:
-		case V4L2_CID_IRIS_ABSOLUTE:
-		case V4L2_CID_VCM_TIMING:
-		case V4L2_CID_VCM_SLEW:
-		case V4L2_CID_3A_LOCK:
-		case V4L2_CID_TEST_PATTERN:
-		case V4L2_CID_TEST_PATTERN_COLOR_R:
-		case V4L2_CID_TEST_PATTERN_COLOR_GR:
-		case V4L2_CID_TEST_PATTERN_COLOR_GB:
-		case V4L2_CID_TEST_PATTERN_COLOR_B:
-			ret = v4l2_s_ctrl(NULL,
-					  isp->inputs[asd->input_curr].camera->
-					  ctrl_handler, &ctrl);
-			break;
 		case V4L2_CID_FLASH_STATUS:
 		case V4L2_CID_FLASH_INTENSITY:
 		case V4L2_CID_FLASH_TORCH_INTENSITY:
@@ -1692,7 +1454,6 @@ static long atomisp_vidioc_default(struct file *file, void *fh,
 				   bool valid_prio, unsigned int cmd, void *arg)
 {
 	struct video_device *vdev = video_devdata(file);
-	struct atomisp_device *isp = video_get_drvdata(vdev);
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
 	int err;
 
@@ -1839,11 +1600,6 @@ static long atomisp_vidioc_default(struct file *file, void *fh,
 		err = atomisp_fixed_pattern_table(asd, arg);
 		break;
 
-	case ATOMISP_IOC_S_EXPOSURE:
-		err = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
-				       core, ioctl, cmd, arg);
-		break;
-
 	case ATOMISP_IOC_S_ISP_SHD_TAB:
 		err = atomisp_set_shading_table(asd, arg);
 		break;
@@ -1860,10 +1616,6 @@ static long atomisp_vidioc_default(struct file *file, void *fh,
 		err = atomisp_set_parameters(vdev, arg);
 		break;
 
-	case ATOMISP_IOC_EXT_ISP_CTRL:
-		err = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
-				       core, ioctl, cmd, arg);
-		break;
 	case ATOMISP_IOC_EXP_ID_UNLOCK:
 		err = atomisp_exp_id_unlock(asd, arg);
 		break;
-- 
2.43.0


