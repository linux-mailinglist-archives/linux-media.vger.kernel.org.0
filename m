Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 551E66B8CB
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2019 11:04:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbfGQJDw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jul 2019 05:03:52 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:41639 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725907AbfGQJDw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jul 2019 05:03:52 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id nfqjhuob40SBqnfqnhZQVm; Wed, 17 Jul 2019 11:03:49 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/4] via-camera: use struct v4l2_fh
Date:   Wed, 17 Jul 2019 11:03:43 +0200
Message-Id: <20190717090345.26521-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190717090345.26521-1-hverkuil-cisco@xs4all.nl>
References: <20190717090345.26521-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfKYHYsr0K2oSeFvQJX37sysaUM/sAdPejtCXJIgQooqWWkvHcfaDowwz23KkX1mbF1eoj04dCgvOUsUEfhQ8yTYROPoZLpHbElzAyfagUA/HZUDxsGid
 8ucihqE/6eX+ImOLHq/5mAK1jSJxctCBYTDLbwSB3UC8szwpvLHGjk16KhID2XRyAVcd+0f/NDRJVKxjFqsgYDtSEXtwoZaG/YYMPqRiwhuiSPDd1M1o/Igx
 pAuD1G+W5lr5tMA04tJj0A==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Modern V4L2 drivers should use struct v4l2_fh to represent a filehandle.
This driver was one of the few that didn't use it.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/via-camera.c | 47 +++++++++++++++++------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/via-camera.c b/drivers/media/platform/via-camera.c
index f9016c2ee70d..49e51feebc7d 100644
--- a/drivers/media/platform/via-camera.c
+++ b/drivers/media/platform/via-camera.c
@@ -660,19 +660,22 @@ static const struct videobuf_queue_ops viacam_vb_ops = {
 static int viacam_open(struct file *filp)
 {
 	struct via_camera *cam = video_drvdata(filp);
+	int ret;
 
-	filp->private_data = cam;
 	/*
 	 * Note the new user.  If this is the first one, we'll also
 	 * need to power up the sensor.
 	 */
 	mutex_lock(&cam->lock);
-	if (cam->users == 0) {
-		int ret = viafb_request_dma();
+	ret = v4l2_fh_open(filp);
+	if (ret)
+		goto out;
+	if (v4l2_fh_is_singular_file(filp)) {
+		ret = viafb_request_dma();
 
 		if (ret) {
-			mutex_unlock(&cam->lock);
-			return ret;
+			v4l2_fh_release(filp);
+			goto out;
 		}
 		via_sensor_power_up(cam);
 		set_bit(CF_CONFIG_NEEDED, &cam->flags);
@@ -685,16 +688,19 @@ static int viacam_open(struct file *filp)
 				sizeof(struct videobuf_buffer), cam, NULL);
 	}
 	(cam->users)++;
+out:
 	mutex_unlock(&cam->lock);
-	return 0;
+	return ret;
 }
 
 static int viacam_release(struct file *filp)
 {
 	struct via_camera *cam = video_drvdata(filp);
+	bool last_open;
 
 	mutex_lock(&cam->lock);
 	(cam->users)--;
+	last_open = v4l2_fh_is_singular_file(filp);
 	/*
 	 * If the "owner" is closing, shut down any ongoing
 	 * operations.
@@ -714,11 +720,12 @@ static int viacam_release(struct file *filp)
 	/*
 	 * Last one out needs to turn out the lights.
 	 */
-	if (cam->users == 0) {
+	if (last_open) {
 		videobuf_mmap_free(&cam->vb_queue);
 		via_sensor_power_down(cam);
 		viafb_release_dma();
 	}
+	v4l2_fh_release(filp);
 	mutex_unlock(&cam->lock);
 	return 0;
 }
@@ -927,7 +934,7 @@ static int viacam_do_try_fmt(struct via_camera *cam,
 static int viacam_try_fmt_vid_cap(struct file *filp, void *priv,
 		struct v4l2_format *fmt)
 {
-	struct via_camera *cam = priv;
+	struct via_camera *cam = video_drvdata(filp);
 	struct v4l2_format sfmt;
 	int ret;
 
@@ -941,7 +948,7 @@ static int viacam_try_fmt_vid_cap(struct file *filp, void *priv,
 static int viacam_g_fmt_vid_cap(struct file *filp, void *priv,
 		struct v4l2_format *fmt)
 {
-	struct via_camera *cam = priv;
+	struct via_camera *cam = video_drvdata(filp);
 
 	mutex_lock(&cam->lock);
 	fmt->fmt.pix = cam->user_format;
@@ -952,7 +959,7 @@ static int viacam_g_fmt_vid_cap(struct file *filp, void *priv,
 static int viacam_s_fmt_vid_cap(struct file *filp, void *priv,
 		struct v4l2_format *fmt)
 {
-	struct via_camera *cam = priv;
+	struct via_camera *cam = video_drvdata(filp);
 	int ret;
 	struct v4l2_format sfmt;
 	struct via_format *f = via_find_format(fmt->fmt.pix.pixelformat);
@@ -1004,7 +1011,7 @@ static int viacam_querycap(struct file *filp, void *priv,
 static int viacam_reqbufs(struct file *filp, void *priv,
 		struct v4l2_requestbuffers *rb)
 {
-	struct via_camera *cam = priv;
+	struct via_camera *cam = video_drvdata(filp);
 
 	return videobuf_reqbufs(&cam->vb_queue, rb);
 }
@@ -1012,28 +1019,28 @@ static int viacam_reqbufs(struct file *filp, void *priv,
 static int viacam_querybuf(struct file *filp, void *priv,
 		struct v4l2_buffer *buf)
 {
-	struct via_camera *cam = priv;
+	struct via_camera *cam = video_drvdata(filp);
 
 	return videobuf_querybuf(&cam->vb_queue, buf);
 }
 
 static int viacam_qbuf(struct file *filp, void *priv, struct v4l2_buffer *buf)
 {
-	struct via_camera *cam = priv;
+	struct via_camera *cam = video_drvdata(filp);
 
 	return videobuf_qbuf(&cam->vb_queue, buf);
 }
 
 static int viacam_dqbuf(struct file *filp, void *priv, struct v4l2_buffer *buf)
 {
-	struct via_camera *cam = priv;
+	struct via_camera *cam = video_drvdata(filp);
 
 	return videobuf_dqbuf(&cam->vb_queue, buf, filp->f_flags & O_NONBLOCK);
 }
 
 static int viacam_streamon(struct file *filp, void *priv, enum v4l2_buf_type t)
 {
-	struct via_camera *cam = priv;
+	struct via_camera *cam = video_drvdata(filp);
 	int ret = 0;
 
 	if (t != V4L2_BUF_TYPE_VIDEO_CAPTURE)
@@ -1084,7 +1091,7 @@ static int viacam_streamon(struct file *filp, void *priv, enum v4l2_buf_type t)
 
 static int viacam_streamoff(struct file *filp, void *priv, enum v4l2_buf_type t)
 {
-	struct via_camera *cam = priv;
+	struct via_camera *cam = video_drvdata(filp);
 	int ret;
 
 	if (t != V4L2_BUF_TYPE_VIDEO_CAPTURE)
@@ -1113,7 +1120,7 @@ static int viacam_streamoff(struct file *filp, void *priv, enum v4l2_buf_type t)
 static int viacam_g_parm(struct file *filp, void *priv,
 		struct v4l2_streamparm *parm)
 {
-	struct via_camera *cam = priv;
+	struct via_camera *cam = video_drvdata(filp);
 	int ret;
 
 	mutex_lock(&cam->lock);
@@ -1126,7 +1133,7 @@ static int viacam_g_parm(struct file *filp, void *priv,
 static int viacam_s_parm(struct file *filp, void *priv,
 		struct v4l2_streamparm *parm)
 {
-	struct via_camera *cam = priv;
+	struct via_camera *cam = video_drvdata(filp);
 	int ret;
 
 	mutex_lock(&cam->lock);
@@ -1153,7 +1160,7 @@ static int viacam_enum_framesizes(struct file *filp, void *priv,
 static int viacam_enum_frameintervals(struct file *filp, void *priv,
 		struct v4l2_frmivalenum *interval)
 {
-	struct via_camera *cam = priv;
+	struct via_camera *cam = video_drvdata(filp);
 	struct v4l2_subdev_frame_interval_enum fie = {
 		.index = interval->index,
 		.code = cam->mbus_code,
@@ -1427,10 +1434,10 @@ static int viacam_probe(struct platform_device *pdev)
 	 */
 	cam->vdev = viacam_v4l_template;
 	cam->vdev.v4l2_dev = &cam->v4l2_dev;
+	video_set_drvdata(&cam->vdev, cam);
 	ret = video_register_device(&cam->vdev, VFL_TYPE_GRABBER, -1);
 	if (ret)
 		goto out_irq;
-	video_set_drvdata(&cam->vdev, cam);
 
 #ifdef CONFIG_PM
 	/*
-- 
2.20.1

