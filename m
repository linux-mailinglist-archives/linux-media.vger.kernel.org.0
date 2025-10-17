Return-Path: <linux-media+bounces-44899-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCE2BE8F61
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 15:40:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86FA31AA6179
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 13:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF27296BBA;
	Fri, 17 Oct 2025 13:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YQR9Uoa9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC682F693F
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 13:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760708324; cv=none; b=P/vgKrmkyCcVxQIAGIwC3S1KlDd1gCrdyGb268GiGYtsZ58xquiIYL+s4b1em/OQ9XrnHK5zBxeinHYOaBqgZvPJzU3xlTWRXMljcUimHd/KCD+y/BIu123krklWsKJ5Uj08l/LBEpqzXxgHatOTw9Vv2T9CXDFr0ljxMlnFN+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760708324; c=relaxed/simple;
	bh=jMojXtGM1PHJ9cgo2+nfvcskFs/WWOS3k2UHlSv3o28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r8H3w8PVKd3eM8XjXb2qp4A99sYD2vFi7lOI59fzDJEGu3VgYvOUE9hRN46DffSjMoWytIG7zwCNnVJS42ZuVn3N2i7cUZsWqO1b+KSM6JG7qs+NJlWxpypiTTtxKDK6Svd1ExF+cClGKJyWZDgKlRzpBmdpGuZYLg0t6K7h8Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YQR9Uoa9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B1C2C4CEF9;
	Fri, 17 Oct 2025 13:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760708324;
	bh=jMojXtGM1PHJ9cgo2+nfvcskFs/WWOS3k2UHlSv3o28=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YQR9Uoa9DCh34gp3XCtgqgiXgSf4HjbcXd2UHToRiXppdWtTJIYx8QVNaeT25LjwB
	 a38Ym+JhCBOU9krxpoU6itvR4fHak0fQf2rwyHwDjNrIjqs/k4hJWdeCjXNknplmwN
	 euyOP1w6YgDGjlrVAm7MtQELcakqQJu30HWFTvQbG36medox4rLdcDXvq/fB3nYX0m
	 BqtkH92Fv9Br2Yr0Tpbf4CkfxOqNu6KQaWXT2IxMBmxnXCXA+CDn11E/Oc7dFISs2T
	 ZBgmCy76uhBdtH+N2f8IjRD+G367O/8XIA8g+pWqFYhuSHcvv8LkSUTSIA58pVEsoN
	 3H+CfL0plVFzQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 08/14] media: omap3isp: implement create/prepare_bufs
Date: Fri, 17 Oct 2025 15:26:45 +0200
Message-ID: <cc4ae2ac6aae997ad63bc0e694b7ca53a0a6ad32.1760707611.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760707611.git.hverkuil+cisco@kernel.org>
References: <cover.1760707611.git.hverkuil+cisco@kernel.org>
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
index 69d17e4dcd36..471defa6e7fb 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.c
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
@@ -325,6 +325,13 @@ static int isp_video_queue_setup(struct vb2_queue *queue,
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
@@ -340,6 +347,7 @@ static int isp_video_buffer_prepare(struct vb2_buffer *buf)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(buf);
 	struct isp_video_fh *vfh = vb2_get_drv_priv(buf->vb2_queue);
+	unsigned int size = vfh->format.fmt.pix.sizeimage;
 	struct isp_buffer *buffer = to_isp_buffer(vbuf);
 	struct isp_video *video = vfh->video;
 	dma_addr_t addr;
@@ -360,8 +368,13 @@ static int isp_video_buffer_prepare(struct vb2_buffer *buf)
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


