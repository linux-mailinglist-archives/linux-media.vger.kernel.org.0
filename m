Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDA4735C49C
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 13:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239952AbhDLLDQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 07:03:16 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52058 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239755AbhDLLDL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 07:03:11 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45CD5E0A;
        Mon, 12 Apr 2021 13:02:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618225371;
        bh=1AIalJNffl02auVwSikpQsAQk0XZjwdEEeXWXeBSZ8A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=elfXkP2XDFJ2hWhLuQOz7FjVJnWFm310WHL7l/nU+fB/KnWN7ElYOxkVkFm7Yc1zX
         C1MVyQoKkzZxds4ABd05dHQWEQI85uQd/vVZQ5gPEEhOX4mrY8i7PyKUwekl6v+KBy
         Y5NoilpLhWX9f5jSJt7CBEefvh2bBX1w5Q/E+8R0=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 3/3] media: vivid: use vb2_queue_change_type
Date:   Mon, 12 Apr 2021 14:02:11 +0300
Message-Id: <20210412110211.275791-4-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412110211.275791-1-tomi.valkeinen@ideasonboard.com>
References: <20210412110211.275791-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the new vb2_queue_change_type() function in .vidioc_reqbufs and
.vidioc_create_bufs instead of changing the queue type manually in
vidioc_s_fmt_vbi_cap() and vidioc_s_fmt_sliced_vbi_cap().

This allows for a more consistent behavior, as .vidioc_reqbufs and
.vidioc_create_bufs are when the queue will become "busy".

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/test-drivers/vivid/vivid-core.c | 44 ++++++++++++++++++-
 .../media/test-drivers/vivid/vivid-vbi-cap.c  |  2 -
 2 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 0dc65ef3aa14..70676f1ac268 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -656,6 +656,46 @@ static const struct v4l2_file_operations vivid_radio_fops = {
 	.unlocked_ioctl = video_ioctl2,
 };
 
+static int vidioc_reqbufs(struct file *file, void *priv,
+				 struct v4l2_requestbuffers *p)
+{
+	struct video_device *vdev = video_devdata(file);
+	int r;
+
+	/*
+	 * Sliced and raw VBI capture share the same queue so we must
+	 * change the type.
+	 */
+	if (p->type == V4L2_BUF_TYPE_SLICED_VBI_CAPTURE ||
+	    p->type == V4L2_BUF_TYPE_VBI_CAPTURE) {
+		r = vb2_queue_change_type(vdev->queue, p->type);
+		if (r)
+			return r;
+	}
+
+	return vb2_ioctl_reqbufs(file, priv, p);
+}
+
+static int vidioc_create_bufs(struct file *file, void *priv,
+				     struct v4l2_create_buffers *p)
+{
+	struct video_device *vdev = video_devdata(file);
+	int r;
+
+	/*
+	 * Sliced and raw VBI capture share the same queue so we must
+	 * change the type.
+	 */
+	if (p->format.type == V4L2_BUF_TYPE_SLICED_VBI_CAPTURE ||
+	    p->format.type == V4L2_BUF_TYPE_VBI_CAPTURE) {
+		r = vb2_queue_change_type(vdev->queue, p->format.type);
+		if (r)
+			return r;
+	}
+
+	return vb2_ioctl_create_bufs(file, priv, p);
+}
+
 static const struct v4l2_ioctl_ops vivid_ioctl_ops = {
 	.vidioc_querycap		= vidioc_querycap,
 
@@ -717,8 +757,8 @@ static const struct v4l2_ioctl_ops vivid_ioctl_ops = {
 	.vidioc_g_fbuf			= vidioc_g_fbuf,
 	.vidioc_s_fbuf			= vidioc_s_fbuf,
 
-	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
-	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
+	.vidioc_reqbufs			= vidioc_reqbufs,
+	.vidioc_create_bufs		= vidioc_create_bufs,
 	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
 	.vidioc_querybuf		= vb2_ioctl_querybuf,
 	.vidioc_qbuf			= vb2_ioctl_qbuf,
diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-cap.c b/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
index 387df4ff01b0..b65b02eeeb97 100644
--- a/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
@@ -257,7 +257,6 @@ int vidioc_s_fmt_vbi_cap(struct file *file, void *priv,
 		return ret;
 	if (f->type != V4L2_BUF_TYPE_VBI_CAPTURE && vb2_is_busy(&dev->vb_vbi_cap_q))
 		return -EBUSY;
-	dev->vbi_cap_dev.queue->type = V4L2_BUF_TYPE_VBI_CAPTURE;
 	return 0;
 }
 
@@ -324,7 +323,6 @@ int vidioc_s_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_format
 	if (fmt->type != V4L2_BUF_TYPE_SLICED_VBI_CAPTURE && vb2_is_busy(&dev->vb_vbi_cap_q))
 		return -EBUSY;
 	dev->service_set_cap = vbi->service_set;
-	dev->vbi_cap_dev.queue->type = V4L2_BUF_TYPE_SLICED_VBI_CAPTURE;
 	return 0;
 }
 
-- 
2.25.1

