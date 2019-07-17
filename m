Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BED626B8CC
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2019 11:04:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbfGQJDx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jul 2019 05:03:53 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:49431 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726182AbfGQJDw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jul 2019 05:03:52 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id nfqjhuob40SBqnfqohZQVw; Wed, 17 Jul 2019 11:03:50 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 4/4] via-camera: fix v4l2-compliance fails
Date:   Wed, 17 Jul 2019 11:03:45 +0200
Message-Id: <20190717090345.26521-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190717090345.26521-1-hverkuil-cisco@xs4all.nl>
References: <20190717090345.26521-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfK4r2Y09IVqQUIu98/siE+sfNhBLRnTg9JWdEf/rzV/0IGuSyiGzdsOXtv0kojlf5QJu417UZIdNVrHBh0auOGJTpCI7EhpejY/vhHm86FekM6Q//xz4
 luPBedxA6GT+mqQD7O4BmE4NCIwlwG9MqCZNPBH5nLqFHkDyQFQ0q1y7ASiSC1TO2FMqBijdgPaTC92HaNtTXcBc1bgdAmXig+UCY9MsuFEczLJTKwD5j/MJ
 1czN6KF1KVI/qKO1BN5Ciw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The patch fixes various v4l2-compliance failures:

- missing support for control events
- support of s/g_std even though this doesn't apply to a webcam
- missing colorspace reporting
- bus_info wasn't filled in by VIDIOC_QUERYCAP
- parm.capture.readbuffers was overridden with wrong value
- viacam_enum_framesizes/intervals didn't check the arguments

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/via-camera.c | 44 +++++++++++++++++------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/via-camera.c b/drivers/media/platform/via-camera.c
index 49e51feebc7d..70da662b9241 100644
--- a/drivers/media/platform/via-camera.c
+++ b/drivers/media/platform/via-camera.c
@@ -18,6 +18,7 @@
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
 #include <media/v4l2-image-sizes.h>
 #include <media/i2c/ov7670.h>
 #include <media/videobuf-dma-sg.h>
@@ -780,7 +781,7 @@ static __poll_t viacam_poll(struct file *filp, struct poll_table_struct *pt)
 {
 	struct via_camera *cam = video_drvdata(filp);
 
-	return videobuf_poll_stream(filp, &cam->vb_queue, pt);
+	return v4l2_ctrl_poll(filp, pt) | videobuf_poll_stream(filp, &cam->vb_queue, pt);
 }
 
 
@@ -818,7 +819,6 @@ static int viacam_enum_input(struct file *filp, void *priv,
 		return -EINVAL;
 
 	input->type = V4L2_INPUT_TYPE_CAMERA;
-	input->std = V4L2_STD_ALL; /* Not sure what should go here */
 	strscpy(input->name, "Camera", sizeof(input->name));
 	return 0;
 }
@@ -836,17 +836,6 @@ static int viacam_s_input(struct file *filp, void *priv, unsigned int i)
 	return 0;
 }
 
-static int viacam_s_std(struct file *filp, void *priv, v4l2_std_id std)
-{
-	return 0;
-}
-
-static int viacam_g_std(struct file *filp, void *priv, v4l2_std_id *std)
-{
-	*std = V4L2_STD_NTSC_M;
-	return 0;
-}
-
 /*
  * Video format stuff.	Here is our default format until
  * user space messes with things.
@@ -858,6 +847,7 @@ static const struct v4l2_pix_format viacam_def_pix_format = {
 	.field		= V4L2_FIELD_NONE,
 	.bytesperline	= VGA_WIDTH * 2,
 	.sizeimage	= VGA_WIDTH * VGA_HEIGHT * 2,
+	.colorspace	= V4L2_COLORSPACE_SRGB,
 };
 
 static const u32 via_def_mbus_code = MEDIA_BUS_FMT_YUYV8_2X8;
@@ -904,6 +894,10 @@ static void viacam_fmt_post(struct v4l2_pix_format *userfmt,
 	userfmt->field = sensorfmt->field;
 	userfmt->bytesperline = 2 * userfmt->width;
 	userfmt->sizeimage = userfmt->bytesperline * userfmt->height;
+	userfmt->colorspace = sensorfmt->colorspace;
+	userfmt->ycbcr_enc = sensorfmt->ycbcr_enc;
+	userfmt->quantization = sensorfmt->quantization;
+	userfmt->xfer_func = sensorfmt->xfer_func;
 }
 
 
@@ -999,6 +993,7 @@ static int viacam_querycap(struct file *filp, void *priv,
 {
 	strscpy(cap->driver, "via-camera", sizeof(cap->driver));
 	strscpy(cap->card, "via-camera", sizeof(cap->card));
+	strscpy(cap->bus_info, "platform:via-camera", sizeof(cap->bus_info));
 	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE |
 		V4L2_CAP_READWRITE | V4L2_CAP_STREAMING;
 	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
@@ -1126,7 +1121,6 @@ static int viacam_g_parm(struct file *filp, void *priv,
 	mutex_lock(&cam->lock);
 	ret = v4l2_g_parm_cap(video_devdata(filp), cam->sensor, parm);
 	mutex_unlock(&cam->lock);
-	parm->parm.capture.readbuffers = cam->n_cap_bufs;
 	return ret;
 }
 
@@ -1139,15 +1133,21 @@ static int viacam_s_parm(struct file *filp, void *priv,
 	mutex_lock(&cam->lock);
 	ret = v4l2_s_parm_cap(video_devdata(filp), cam->sensor, parm);
 	mutex_unlock(&cam->lock);
-	parm->parm.capture.readbuffers = cam->n_cap_bufs;
 	return ret;
 }
 
 static int viacam_enum_framesizes(struct file *filp, void *priv,
 		struct v4l2_frmsizeenum *sizes)
 {
+	unsigned int i;
+
 	if (sizes->index != 0)
 		return -EINVAL;
+	for (i = 0; i < N_VIA_FMTS; i++)
+		if (sizes->pixel_format == via_formats[i].pixelformat)
+			break;
+	if (i >= N_VIA_FMTS)
+		return -EINVAL;
 	sizes->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
 	sizes->stepwise.min_width = QCIF_WIDTH;
 	sizes->stepwise.min_height = QCIF_HEIGHT;
@@ -1168,8 +1168,17 @@ static int viacam_enum_frameintervals(struct file *filp, void *priv,
 		.height = cam->sensor_format.height,
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
+	unsigned int i;
 	int ret;
 
+	for (i = 0; i < N_VIA_FMTS; i++)
+		if (interval->pixel_format == via_formats[i].pixelformat)
+			break;
+	if (i >= N_VIA_FMTS)
+		return -EINVAL;
+	if (interval->width < QCIF_WIDTH || interval->width > VGA_WIDTH ||
+	    interval->height < QCIF_HEIGHT || interval->height > VGA_HEIGHT)
+		return -EINVAL;
 	mutex_lock(&cam->lock);
 	ret = sensor_call(cam, pad, enum_frame_interval, NULL, &fie);
 	mutex_unlock(&cam->lock);
@@ -1186,8 +1195,6 @@ static const struct v4l2_ioctl_ops viacam_ioctl_ops = {
 	.vidioc_enum_input	= viacam_enum_input,
 	.vidioc_g_input		= viacam_g_input,
 	.vidioc_s_input		= viacam_s_input,
-	.vidioc_s_std		= viacam_s_std,
-	.vidioc_g_std		= viacam_g_std,
 	.vidioc_enum_fmt_vid_cap = viacam_enum_fmt_vid_cap,
 	.vidioc_try_fmt_vid_cap = viacam_try_fmt_vid_cap,
 	.vidioc_g_fmt_vid_cap	= viacam_g_fmt_vid_cap,
@@ -1203,6 +1210,8 @@ static const struct v4l2_ioctl_ops viacam_ioctl_ops = {
 	.vidioc_s_parm		= viacam_s_parm,
 	.vidioc_enum_framesizes = viacam_enum_framesizes,
 	.vidioc_enum_frameintervals = viacam_enum_frameintervals,
+	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
 };
 
 /*----------------------------------------------------------------------------*/
@@ -1274,7 +1283,6 @@ static struct viafb_pm_hooks viacam_pm_hooks = {
 static const struct video_device viacam_v4l_template = {
 	.name		= "via-camera",
 	.minor		= -1,
-	.tvnorms	= V4L2_STD_NTSC_M,
 	.fops		= &viacam_fops,
 	.ioctl_ops	= &viacam_ioctl_ops,
 	.release	= video_device_release_empty, /* Check this */
-- 
2.20.1

