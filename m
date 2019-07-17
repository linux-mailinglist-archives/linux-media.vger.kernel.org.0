Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B52BD6BD02
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2019 15:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725936AbfGQN3P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jul 2019 09:29:15 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:58555 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725799AbfGQN3P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jul 2019 09:29:15 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id njzZhwPtB0SBqnjzchaLa9; Wed, 17 Jul 2019 15:29:12 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 5/6] omap_vout: use struct v4l2_fh
Message-ID: <26e4e34d-c148-271d-be13-77fc8d15a646@xs4all.nl>
Date:   Wed, 17 Jul 2019 15:29:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIN3K6PGmzjYte7ZFzb7/1e29qsyQinjjZn/QaEz3mjYhO95gBqWKL9OnWt79viCJXyBxFl8XM8iBEnceGsLdAaLarHwy0OVEgaYj9At52IUPnRjC9vM
 +xIB2+NQwwu9Al4Ix0oCNvrFBH5c1RbmyRWPMMsI8/TwHjbRpoGRt9X3zpjAMq+XyQGmmk1yzcewDyP+fvajnDfJhwpspbAOMndPKivTJMVTzQ/VEYJPWxnA
 5aX7Kb8/+k11O1LMwJOu8QCGmfzzaZgzplk8hiW8W+U=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This driver is one of the few that is still not using struct
v4l2_fh. Convert it.

Tested on a Pandaboard.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/omap/omap_vout.c | 53 +++++++++++++------------
 1 file changed, 27 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/omap/omap_vout.c b/drivers/media/platform/omap/omap_vout.c
index cb6a9e3946b6..94d0e04fa69b 100644
--- a/drivers/media/platform/omap/omap_vout.c
+++ b/drivers/media/platform/omap/omap_vout.c
@@ -841,7 +841,7 @@ static void omap_vout_buffer_release(struct videobuf_queue *q,
 static __poll_t omap_vout_poll(struct file *file,
 				   struct poll_table_struct *wait)
 {
-	struct omap_vout_device *vout = file->private_data;
+	struct omap_vout_device *vout = video_drvdata(file);
 	struct videobuf_queue *q = &vout->vbq;

 	return videobuf_poll_stream(file, q, wait);
@@ -876,7 +876,7 @@ static int omap_vout_mmap(struct file *file, struct vm_area_struct *vma)
 	void *pos;
 	unsigned long start = vma->vm_start;
 	unsigned long size = (vma->vm_end - vma->vm_start);
-	struct omap_vout_device *vout = file->private_data;
+	struct omap_vout_device *vout = video_drvdata(file);
 	struct videobuf_queue *q = &vout->vbq;

 	v4l2_dbg(1, debug, &vout->vid_dev->v4l2_dev,
@@ -935,7 +935,7 @@ static int omap_vout_release(struct file *file)
 	unsigned int ret, i;
 	struct videobuf_queue *q;
 	struct omapvideo_info *ovid;
-	struct omap_vout_device *vout = file->private_data;
+	struct omap_vout_device *vout = video_drvdata(file);

 	v4l2_dbg(1, debug, &vout->vid_dev->v4l2_dev, "Entering %s\n", __func__);
 	ovid = &vout->vid_info;
@@ -988,7 +988,7 @@ static int omap_vout_release(struct file *file)
 		vout->mmap_count = 0;

 	vout->opened -= 1;
-	file->private_data = NULL;
+	v4l2_fh_release(file);

 	if (vout->buffer_allocated)
 		videobuf_mmap_free(q);
@@ -1000,9 +1000,8 @@ static int omap_vout_release(struct file *file)
 static int omap_vout_open(struct file *file)
 {
 	struct videobuf_queue *q;
-	struct omap_vout_device *vout = NULL;
-
-	vout = video_drvdata(file);
+	struct omap_vout_device *vout = video_drvdata(file);
+	int ret;

 	if (vout == NULL)
 		return -ENODEV;
@@ -1013,9 +1012,11 @@ static int omap_vout_open(struct file *file)
 	if (vout->opened)
 		return -EBUSY;

-	vout->opened += 1;
+	ret = v4l2_fh_open(file);
+	if (ret)
+		return ret;

-	file->private_data = vout;
+	vout->opened += 1;
 	vout->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;

 	q = &vout->vbq;
@@ -1039,7 +1040,7 @@ static int omap_vout_open(struct file *file)
 static int vidioc_querycap(struct file *file, void *fh,
 		struct v4l2_capability *cap)
 {
-	struct omap_vout_device *vout = fh;
+	struct omap_vout_device *vout = video_drvdata(file);

 	strscpy(cap->driver, VOUT_NAME, sizeof(cap->driver));
 	strscpy(cap->card, vout->vfd->name, sizeof(cap->card));
@@ -1070,7 +1071,7 @@ static int vidioc_enum_fmt_vid_out(struct file *file, void *fh,
 static int vidioc_g_fmt_vid_out(struct file *file, void *fh,
 			struct v4l2_format *f)
 {
-	struct omap_vout_device *vout = fh;
+	struct omap_vout_device *vout = video_drvdata(file);

 	f->fmt.pix = vout->pix;
 	return 0;
@@ -1083,7 +1084,7 @@ static int vidioc_try_fmt_vid_out(struct file *file, void *fh,
 	struct omap_overlay *ovl;
 	struct omapvideo_info *ovid;
 	struct omap_video_timings *timing;
-	struct omap_vout_device *vout = fh;
+	struct omap_vout_device *vout = video_drvdata(file);
 	struct omap_dss_device *dssdev;

 	ovid = &vout->vid_info;
@@ -1110,7 +1111,7 @@ static int vidioc_s_fmt_vid_out(struct file *file, void *fh,
 	struct omap_overlay *ovl;
 	struct omapvideo_info *ovid;
 	struct omap_video_timings *timing;
-	struct omap_vout_device *vout = fh;
+	struct omap_vout_device *vout = video_drvdata(file);
 	struct omap_dss_device *dssdev;

 	if (vout->streaming)
@@ -1176,7 +1177,7 @@ static int vidioc_try_fmt_vid_overlay(struct file *file, void *fh,
 			struct v4l2_format *f)
 {
 	int ret = 0;
-	struct omap_vout_device *vout = fh;
+	struct omap_vout_device *vout = video_drvdata(file);
 	struct omap_overlay *ovl;
 	struct omapvideo_info *ovid;
 	struct v4l2_window *win = &f->fmt.win;
@@ -1202,7 +1203,7 @@ static int vidioc_s_fmt_vid_overlay(struct file *file, void *fh,
 	int ret = 0;
 	struct omap_overlay *ovl;
 	struct omapvideo_info *ovid;
-	struct omap_vout_device *vout = fh;
+	struct omap_vout_device *vout = video_drvdata(file);
 	struct v4l2_window *win = &f->fmt.win;

 	mutex_lock(&vout->lock);
@@ -1229,7 +1230,7 @@ static int vidioc_g_fmt_vid_overlay(struct file *file, void *fh,
 	u32 key_value =  0;
 	struct omap_overlay *ovl;
 	struct omapvideo_info *ovid;
-	struct omap_vout_device *vout = fh;
+	struct omap_vout_device *vout = video_drvdata(file);
 	struct omap_overlay_manager_info info;
 	struct v4l2_window *win = &f->fmt.win;

@@ -1250,7 +1251,7 @@ static int vidioc_g_fmt_vid_overlay(struct file *file, void *fh,

 static int vidioc_g_selection(struct file *file, void *fh, struct v4l2_selection *sel)
 {
-	struct omap_vout_device *vout = fh;
+	struct omap_vout_device *vout = video_drvdata(file);
 	struct v4l2_pix_format *pix = &vout->pix;

 	if (sel->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
@@ -1277,7 +1278,7 @@ static int vidioc_g_selection(struct file *file, void *fh, struct v4l2_selection
 static int vidioc_s_selection(struct file *file, void *fh, struct v4l2_selection *sel)
 {
 	int ret = -EINVAL;
-	struct omap_vout_device *vout = fh;
+	struct omap_vout_device *vout = video_drvdata(file);
 	struct omapvideo_info *ovid;
 	struct omap_overlay *ovl;
 	struct omap_video_timings *timing;
@@ -1419,7 +1420,7 @@ static int vidioc_reqbufs(struct file *file, void *fh,
 {
 	int ret = 0;
 	unsigned int i, num_buffers = 0;
-	struct omap_vout_device *vout = fh;
+	struct omap_vout_device *vout = video_drvdata(file);
 	struct videobuf_queue *q = &vout->vbq;

 	if (req->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
@@ -1484,7 +1485,7 @@ static int vidioc_reqbufs(struct file *file, void *fh,
 static int vidioc_querybuf(struct file *file, void *fh,
 			struct v4l2_buffer *b)
 {
-	struct omap_vout_device *vout = fh;
+	struct omap_vout_device *vout = video_drvdata(file);

 	return videobuf_querybuf(&vout->vbq, b);
 }
@@ -1492,7 +1493,7 @@ static int vidioc_querybuf(struct file *file, void *fh,
 static int vidioc_qbuf(struct file *file, void *fh,
 			struct v4l2_buffer *buffer)
 {
-	struct omap_vout_device *vout = fh;
+	struct omap_vout_device *vout = video_drvdata(file);
 	struct videobuf_queue *q = &vout->vbq;

 	if ((V4L2_BUF_TYPE_VIDEO_OUTPUT != buffer->type) ||
@@ -1519,7 +1520,7 @@ static int vidioc_qbuf(struct file *file, void *fh,

 static int vidioc_dqbuf(struct file *file, void *fh, struct v4l2_buffer *b)
 {
-	struct omap_vout_device *vout = fh;
+	struct omap_vout_device *vout = video_drvdata(file);
 	struct videobuf_queue *q = &vout->vbq;

 	int ret;
@@ -1547,7 +1548,7 @@ static int vidioc_streamon(struct file *file, void *fh, enum v4l2_buf_type i)
 {
 	int ret = 0, j;
 	u32 addr = 0, mask = 0;
-	struct omap_vout_device *vout = fh;
+	struct omap_vout_device *vout = video_drvdata(file);
 	struct videobuf_queue *q = &vout->vbq;
 	struct omapvideo_info *ovid = &vout->vid_info;

@@ -1632,7 +1633,7 @@ static int vidioc_streamoff(struct file *file, void *fh, enum v4l2_buf_type i)
 {
 	u32 mask = 0;
 	int ret = 0, j;
-	struct omap_vout_device *vout = fh;
+	struct omap_vout_device *vout = video_drvdata(file);
 	struct omapvideo_info *ovid = &vout->vid_info;

 	if (!vout->streaming)
@@ -1670,7 +1671,7 @@ static int vidioc_s_fbuf(struct file *file, void *fh,
 	int enable = 0;
 	struct omap_overlay *ovl;
 	struct omapvideo_info *ovid;
-	struct omap_vout_device *vout = fh;
+	struct omap_vout_device *vout = video_drvdata(file);
 	struct omap_overlay_manager_info info;
 	enum omap_dss_trans_key_type key_type = OMAP_DSS_COLOR_KEY_GFX_DST;

@@ -1741,7 +1742,7 @@ static int vidioc_g_fbuf(struct file *file, void *fh,
 {
 	struct omap_overlay *ovl;
 	struct omapvideo_info *ovid;
-	struct omap_vout_device *vout = fh;
+	struct omap_vout_device *vout = video_drvdata(file);
 	struct omap_overlay_manager_info info;

 	ovid = &vout->vid_info;
-- 
2.20.1

