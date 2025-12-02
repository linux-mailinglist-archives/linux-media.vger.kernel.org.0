Return-Path: <linux-media+bounces-48038-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 256DEC9A8CF
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 08:49:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F41AA3A6212
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 07:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36FDE303A12;
	Tue,  2 Dec 2025 07:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PUa6ah63"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8AA1D514E
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 07:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764661752; cv=none; b=o0HmtkY2D+/WH5bwF3f+G+6iW5XJ/oe7RIDmyp0wC0F2KY8DanIit/rBxsYVbvZNDupu3On7FERNAhNaCVqC3HyugwzdlyfFB52K+CimiGwP5suR4b+0DTvjuS+/dE+RB23fWJ6WVrkxp4IdEBEqeYzyk6kFuSqiS3pBCrA2bEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764661752; c=relaxed/simple;
	bh=LPamsriPbQJ/kuHnqjcytaJWV3GzeFw7EVueGbDKZxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qz5HWIKWicbyJgd1M4NEJ7SbxTwM/QOhTnSkYIxSJcjmg+6shoCKl48yair/plaCrVxbi5/0wgJCv9luqgYmxFD0+LYZpVdZegJEFogQLIn4qdF/f5E+1UwxuAqpceTkyib99ie5cixu/ZwWzHkflqMezLrhESITFA92zN6HvYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PUa6ah63; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6D99C4CEF1;
	Tue,  2 Dec 2025 07:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764661752;
	bh=LPamsriPbQJ/kuHnqjcytaJWV3GzeFw7EVueGbDKZxs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PUa6ah63HilM8HHQNfdYIBBci2CoDY+03Rx7OjzbaFcwKwNZoZMhGDbJ5lfZ6lend
	 ozbFAcHh65gEOKq8tVByCaOXoSwc4OCj58FosoiQP/DmqKtU6yZr05xgZHAZr/3/xq
	 aE4b3/cH8g/SEmymRSSDmHY6VNdjvzwnBAunEBg+vwQjmv1LKcidGX1VnAMY7AqBWl
	 VgBkYsv/tsg+1VtTfz6lIj8geBFEayAbMaJ527/6j6XZDQKDzSzNKl39GEJKqPbHmA
	 GHeBCbQdEyGlbHEuYX/bAnZeje0cYo9UaDlch1q2EnpevDOMsD9i3ZSm7qiY0YC7/D
	 SEFEnpq4dY2ww==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv2 07/11] media: omap3isp: implement create/prepare_bufs
Date: Tue,  2 Dec 2025 08:48:08 +0100
Message-ID: <38fa26046c5516ea616ac4337f72f0e9b7e82035.1764661692.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1764661692.git.hverkuil+cisco@kernel.org>
References: <cover.1764661692.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing ioctls. This makes v4l2-compliance happier:

	warn: v4l2-test-buffers.cpp(813): VIDIOC_CREATE_BUFS not supported
test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/ti/omap3isp/ispvideo.c | 47 ++++++++++++++++++-
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
index adea39b6d930..ac170ef4fa01 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.c
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
@@ -329,6 +329,13 @@ static int isp_video_queue_setup(struct vb2_queue *queue,
 	struct isp_video_fh *vfh = vb2_get_drv_priv(queue);
 	struct isp_video *video = vfh->video;
 
+	if (*num_planes) {
+		if (*num_planes != 1)
+			return -EINVAL;
+		if (sizes[0] < vfh->format.fmt.pix.sizeimage)
+			return -EINVAL;
+		return 0;
+	}
 	*num_planes = 1;
 
 	sizes[0] = vfh->format.fmt.pix.sizeimage;
@@ -344,6 +351,7 @@ static int isp_video_buffer_prepare(struct vb2_buffer *buf)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(buf);
 	struct isp_video_fh *vfh = vb2_get_drv_priv(buf->vb2_queue);
+	unsigned int size = vfh->format.fmt.pix.sizeimage;
 	struct isp_buffer *buffer = to_isp_buffer(vbuf);
 	struct isp_video *video = vfh->video;
 	dma_addr_t addr;
@@ -364,8 +372,13 @@ static int isp_video_buffer_prepare(struct vb2_buffer *buf)
 		return -EINVAL;
 	}
 
-	vb2_set_plane_payload(&buffer->vb.vb2_buf, 0,
-			      vfh->format.fmt.pix.sizeimage);
+	if (vb2_plane_size(&buffer->vb.vb2_buf, 0) < size) {
+		dev_dbg(video->isp->dev,
+			"data will not fit into plane (%lu < %u)\n",
+			vb2_plane_size(&buffer->vb.vb2_buf, 0), size);
+		return -EINVAL;
+	}
+	vb2_set_plane_payload(&buffer->vb.vb2_buf, 0, size);
 	buffer->dma = addr;
 
 	return 0;
@@ -935,6 +948,20 @@ isp_video_reqbufs(struct file *file, void *fh, struct v4l2_requestbuffers *rb)
 	return ret;
 }
 
+static int
+isp_video_create_bufs(struct file *file, void *fh, struct v4l2_create_buffers *p)
+{
+	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
+	struct isp_video *video = video_drvdata(file);
+	int ret;
+
+	mutex_lock(&video->queue_lock);
+	ret = vb2_create_bufs(&vfh->queue, p);
+	mutex_unlock(&video->queue_lock);
+
+	return ret;
+}
+
 static int
 isp_video_querybuf(struct file *file, void *fh, struct v4l2_buffer *b)
 {
@@ -949,6 +976,20 @@ isp_video_querybuf(struct file *file, void *fh, struct v4l2_buffer *b)
 	return ret;
 }
 
+static int
+isp_video_prepare_buf(struct file *file, void *fh, struct v4l2_buffer *b)
+{
+	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
+	struct isp_video *video = video_drvdata(file);
+	int ret;
+
+	mutex_lock(&video->queue_lock);
+	ret = vb2_prepare_buf(&vfh->queue, video->video.v4l2_dev->mdev, b);
+	mutex_unlock(&video->queue_lock);
+
+	return ret;
+}
+
 static int
 isp_video_qbuf(struct file *file, void *fh, struct v4l2_buffer *b)
 {
@@ -1303,7 +1344,9 @@ static const struct v4l2_ioctl_ops isp_video_ioctl_ops = {
 	.vidioc_g_parm			= isp_video_get_param,
 	.vidioc_s_parm			= isp_video_set_param,
 	.vidioc_reqbufs			= isp_video_reqbufs,
+	.vidioc_create_bufs		= isp_video_create_bufs,
 	.vidioc_querybuf		= isp_video_querybuf,
+	.vidioc_prepare_buf		= isp_video_prepare_buf,
 	.vidioc_qbuf			= isp_video_qbuf,
 	.vidioc_dqbuf			= isp_video_dqbuf,
 	.vidioc_streamon		= isp_video_streamon,
-- 
2.51.0


