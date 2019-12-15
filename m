Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C305C11F75D
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2019 12:09:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbfLOLJg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Dec 2019 06:09:36 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:44927 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726094AbfLOLJg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Dec 2019 06:09:36 -0500
Received: from [IPv6:2001:983:e9a7:1:d442:af00:cde4:f6de]
 ([IPv6:2001:983:e9a7:1:d442:af00:cde4:f6de])
        by smtp-cloud7.xs4all.net with ESMTPA
        id gRmGiyO32apzpgRmHipnw2; Sun, 15 Dec 2019 12:09:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576408173; bh=lo5zf79F672Dn1oHjjOUwjwkw1xqSGy2Stj6oMvUUJ0=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=fO/FTLHW8adP3Aeb/G9MfXKO/IQ0aVdtB1HyoOrEDtQ+qPI+c9CowU8h7qP96SgCx
         AzUfqds4uxoq1uXizp17ROuWtB8ABN3rjPlUtV4Mc4O2NL4uHD7pJjEQJckyN+YUTQ
         1YQt/ArfssihE2vkg46agGvruo5XFhCURb342We1moxIIubhs3Wt45mFIwHjyErTz3
         PFDYlfCh5INiPg7ioPdXxkgDgLeEPB3a1+Vcwzh/mVc39QDDOm6524nYnGwwW3AFVG
         8H+qA+n4OT0ewHyrF712Ont1glCT9vOZeuMeL8YO73frzuL6JocWzsKWXAcHljDWHu
         IO4QoHnv3L4eA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Vandana BN <bnvandana@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] vivid: support multiplanar touch devices
Message-ID: <1e1eb99d-bfa6-e35f-4b19-d96604384a3e@xs4all.nl>
Date:   Sun, 15 Dec 2019 12:09:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDirXUhSgX7nFiRqvNtIiIU3QrIsKHKa87lwPRPZ5gKAuNYrD5EZSJd6Tbwv2YPX7CwncogEdb5wTkgYe1ExFHSCUb4G7ArhipW4RHlT4sWXBnac807a
 rd9/dOW90VRSES5FkHr6Hoc3IjA6hbMpYclJy3/aHondts2FQZVjuP5tWkF+c7xpCezslL9P3QCOSLnlriu3PDrS4eZbF4qhZRMaqiH0EHmeMiZlik5Lgr5e
 q6/Uav+CadRCLh7Hbu+baaK7tjmJpSSKNy0CEHzoeurl2+/Peg7zWYiFdeGzxEfRb9hEaXkPsNRNF39B7SjSqA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l2-compliance tests failed with the touch device when multiplanar was
enabled in vivid. Since it is perfectly fine to support the multiplanar API
for touch, add support for this in vivid.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/platform/vivid/vivid-core.c b/drivers/media/platform/vivid/vivid-core.c
index 9eef606541a2..15091cbf6de7 100644
--- a/drivers/media/platform/vivid/vivid-core.c
+++ b/drivers/media/platform/vivid/vivid-core.c
@@ -509,6 +509,36 @@ static int vivid_s_fmt_cap(struct file *file, void *priv,
 	return vidioc_s_fmt_vid_cap(file, priv, f);
 }

+static int vivid_g_fmt_cap_mplane(struct file *file, void *priv,
+				  struct v4l2_format *f)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	if (vdev->vfl_type == VFL_TYPE_TOUCH)
+		return vivid_g_fmt_tch_mplane(file, priv, f);
+	return vidioc_g_fmt_vid_cap_mplane(file, priv, f);
+}
+
+static int vivid_try_fmt_cap_mplane(struct file *file, void *priv,
+				    struct v4l2_format *f)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	if (vdev->vfl_type == VFL_TYPE_TOUCH)
+		return vivid_g_fmt_tch_mplane(file, priv, f);
+	return vidioc_try_fmt_vid_cap_mplane(file, priv, f);
+}
+
+static int vivid_s_fmt_cap_mplane(struct file *file, void *priv,
+				  struct v4l2_format *f)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	if (vdev->vfl_type == VFL_TYPE_TOUCH)
+		return vivid_g_fmt_tch_mplane(file, priv, f);
+	return vidioc_s_fmt_vid_cap_mplane(file, priv, f);
+}
+
 static bool vivid_is_in_use(struct video_device *vdev)
 {
 	unsigned long flags;
@@ -605,9 +635,9 @@ static const struct v4l2_ioctl_ops vivid_ioctl_ops = {
 	.vidioc_g_fmt_vid_cap		= vivid_g_fmt_cap,
 	.vidioc_try_fmt_vid_cap		= vivid_try_fmt_cap,
 	.vidioc_s_fmt_vid_cap		= vivid_s_fmt_cap,
-	.vidioc_g_fmt_vid_cap_mplane	= vidioc_g_fmt_vid_cap_mplane,
-	.vidioc_try_fmt_vid_cap_mplane	= vidioc_try_fmt_vid_cap_mplane,
-	.vidioc_s_fmt_vid_cap_mplane	= vidioc_s_fmt_vid_cap_mplane,
+	.vidioc_g_fmt_vid_cap_mplane	= vivid_g_fmt_cap_mplane,
+	.vidioc_try_fmt_vid_cap_mplane	= vivid_try_fmt_cap_mplane,
+	.vidioc_s_fmt_vid_cap_mplane	= vivid_s_fmt_cap_mplane,

 	.vidioc_enum_fmt_vid_out	= vivid_enum_fmt_vid,
 	.vidioc_g_fmt_vid_out		= vidioc_g_fmt_vid_out,
@@ -1077,9 +1107,12 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 			dev->meta_out_caps |= V4L2_CAP_AUDIO;
 	}
 	/* set up the capabilities of the touch capture device */
-	if (dev->has_touch_cap)
-		dev->touch_cap_caps = V4L2_CAP_TOUCH | V4L2_CAP_VIDEO_CAPTURE |
-				      V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
+	if (dev->has_touch_cap) {
+		dev->touch_cap_caps = V4L2_CAP_TOUCH | V4L2_CAP_STREAMING |
+				      V4L2_CAP_READWRITE;
+		dev->touch_cap_caps |= dev->multiplanar ?
+			V4L2_CAP_VIDEO_CAPTURE_MPLANE : V4L2_CAP_VIDEO_CAPTURE;
+	}

 	ret = -ENOMEM;
 	/* initialize the test pattern generator */
diff --git a/drivers/media/platform/vivid/vivid-touch-cap.c b/drivers/media/platform/vivid/vivid-touch-cap.c
index fbd7bc2bde07..790a7c84f24d 100644
--- a/drivers/media/platform/vivid/vivid-touch-cap.c
+++ b/drivers/media/platform/vivid/vivid-touch-cap.c
@@ -5,6 +5,7 @@

 #include "vivid-core.h"
 #include "vivid-kthread-touch.h"
+#include "vivid-vid-common.h"
 #include "vivid-touch-cap.h"

 static int touch_cap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
@@ -128,16 +129,33 @@ int vivid_g_fmt_tch(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);

+	if (dev->multiplanar)
+		return -ENOTTY;
 	f->fmt.pix = dev->tch_format;
 	return 0;
 }

+int vivid_g_fmt_tch_mplane(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct vivid_dev *dev = video_drvdata(file);
+	struct v4l2_format sp_fmt;
+
+	if (!dev->multiplanar)
+		return -ENOTTY;
+	sp_fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	sp_fmt.fmt.pix = dev->tch_format;
+	fmt_sp2mp(&sp_fmt, f);
+	return 0;
+}
+
 int vivid_g_parm_tch(struct file *file, void *priv,
 		     struct v4l2_streamparm *parm)
 {
 	struct vivid_dev *dev = video_drvdata(file);

-	if (parm->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+	if (parm->type != (dev->multiplanar ?
+			   V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE :
+			   V4L2_BUF_TYPE_VIDEO_CAPTURE))
 		return -EINVAL;

 	parm->parm.capture.capability   = V4L2_CAP_TIMEPERFRAME;
diff --git a/drivers/media/platform/vivid/vivid-touch-cap.h b/drivers/media/platform/vivid/vivid-touch-cap.h
index 761050b652eb..07e514046ae8 100644
--- a/drivers/media/platform/vivid/vivid-touch-cap.h
+++ b/drivers/media/platform/vivid/vivid-touch-cap.h
@@ -28,6 +28,7 @@ extern const struct vb2_ops vivid_touch_cap_qops;

 int vivid_enum_fmt_tch(struct file *file, void  *priv, struct v4l2_fmtdesc *f);
 int vivid_g_fmt_tch(struct file *file, void *priv, struct v4l2_format *f);
+int vivid_g_fmt_tch_mplane(struct file *file, void *priv, struct v4l2_format *f);
 int vivid_enum_input_tch(struct file *file, void *priv, struct v4l2_input *inp);
 int vivid_g_input_tch(struct file *file, void *priv, unsigned int *i);
 int vivid_s_input_tch(struct file *file, void *priv, unsigned int i);
diff --git a/drivers/media/platform/vivid/vivid-vid-common.c b/drivers/media/platform/vivid/vivid-vid-common.c
index 8665dfd25eb4..76b0be670ebb 100644
--- a/drivers/media/platform/vivid/vivid-vid-common.c
+++ b/drivers/media/platform/vivid/vivid-vid-common.c
@@ -813,7 +813,7 @@ void fmt_sp2mp(const struct v4l2_format *sp_fmt, struct v4l2_format *mp_fmt)

 	memset(mp->reserved, 0, sizeof(mp->reserved));
 	mp_fmt->type = is_out ? V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE :
-			   V4L2_CAP_VIDEO_CAPTURE_MPLANE;
+			   V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	mp->width = pix->width;
 	mp->height = pix->height;
 	mp->pixelformat = pix->pixelformat;
