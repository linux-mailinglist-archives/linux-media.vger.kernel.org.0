Return-Path: <linux-media+bounces-48051-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB54C9A909
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 08:53:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C4AA1346036
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 07:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9DB304BCD;
	Tue,  2 Dec 2025 07:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m/WKaIRK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A47D303A3D
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 07:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764661967; cv=none; b=GxYGLk32EXjZ8lrcgbzr2kHG3WZOjmh9Gs7W94Q93H4O3kVEHYqK5gCD4OtaCVbtWLbU+Bo1M1LxAXi3xBJcQ+IywUSqMvFU2mdGIYhQl35NJASch90ci9O7wbRhLyhWmRsrDvyNazULgCypyl/Zv1ZBfuEMOF3l3UNDOBmTjFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764661967; c=relaxed/simple;
	bh=LPamsriPbQJ/kuHnqjcytaJWV3GzeFw7EVueGbDKZxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hdRQE0XhsdjD1QTJrpGtXBwiYYJSg+PIVoxStqw/bT0N23VQthcazDmBw9ze9upfhYXHyi51xitvogHrzFkhBcwx48U1zwOEUoGDbvJYcPXnqo4HqmWevXeI+P4UJ66EUCbMayHetX/rsrOay/JH/Uw8W44XS3WjhiHyDBLksNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m/WKaIRK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF01DC116B1;
	Tue,  2 Dec 2025 07:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764661967;
	bh=LPamsriPbQJ/kuHnqjcytaJWV3GzeFw7EVueGbDKZxs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m/WKaIRKX88lvfzKs6yMltHtkt4/SoRO93M4+QtpLj/zGKbF8NYTPR9J5JuzRT1lU
	 ljvRoEEL3pi5UO9qKsF/DzE/Mzfidqea5KgfCI3ENl96u0He9hVhkpNTGFUrqhENsa
	 4hB3DD/DLPwakHRRAenN1kOzByviDLSU9/XAnud85zdKtk2LrZjArbzCGLowPZn/Te
	 dFh54UbnMadU2a3BlZnnOiAdRjuQz4cc3vENdJVG66+kCpziXdetAIPoy/L7CXwLFe
	 fS6FWW+zR8hOcABqZON6X3itmwD6Z3NU/QKhZ8DoeueVL4wtrbemC5/39Jcz85GH8e
	 MQlio+LkPxguA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv3 08/12] media: omap3isp: implement create/prepare_bufs
Date: Tue,  2 Dec 2025 08:51:16 +0100
Message-ID: <e13d3a46241e454f8c0ddd20c66c1506e08ec32d.1764661880.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1764661880.git.hverkuil+cisco@kernel.org>
References: <cover.1764661880.git.hverkuil+cisco@kernel.org>
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


