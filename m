Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDA09175283
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 05:12:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbgCBEMv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Mar 2020 23:12:51 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35804 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbgCBEMv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 1 Mar 2020 23:12:51 -0500
Received: by mail-pf1-f196.google.com with SMTP id i19so4905024pfa.2
        for <linux-media@vger.kernel.org>; Sun, 01 Mar 2020 20:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KcBsmcqC9Zy3qd/UWgqdrnUuk/NhCvM/xrZuIvcDti8=;
        b=j4PQZrVlcD4GIoWCZnGkyRCynfgZmeRPchSumCRpuon/RnuCEeohc7LokPDbSULOxu
         72a31S9tWTvxleYFiXnDMvuEF0GcAiuo0m6Ks7qPK65Si9/Ajl9tOkgGpCJ5hFYHM7JK
         bcs4tyjSrkgHQWt2yaTeiC+rUS+G6Z36G2Yv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KcBsmcqC9Zy3qd/UWgqdrnUuk/NhCvM/xrZuIvcDti8=;
        b=YykFWK1U5gl0+ZCMnjTzMNqIeDBo9lO1cK/WCbZWReA/Aq37+kEsxf63R5044HHjoF
         pp6aThIGtsHsExw6CwEImz3WOyFap6x/kHW7SmEB6rwOk1UW+Kld9zPwEmIr//Qbx/9W
         HFJ7AMSf3a3Wvl+heiKyvM5GJon7jeUKmFhJLJGWE64TTNJhVFs7970zsgXVC5lv9D+Y
         K0mbI0fOJNUlOkrWI1mNxNC60AsgX0S+q3rcL/LtpeCYSvzGW+oDzoK3DlPnd7Lq7M+D
         udJVGH1foIOTspodoGX966Nr4awjm59UX3HOn53ZLGF/hWI0JRz075C5/+7Hhsnobt1l
         imdA==
X-Gm-Message-State: APjAAAX0DBhOmFe7LNA/ddM1FFhhl+Lt2y3jPnxCW6poCPT+6E7vs7+V
        5b2xwA8EBizOYFans2LAgtFebQ==
X-Google-Smtp-Source: APXvYqzWqYzaARJVSR+9sCYfnEzigtts3d3/gmrHrjKJhg8SRyJHiNsPGWNbQI8izO51VFAShoXAHQ==
X-Received: by 2002:aa7:9218:: with SMTP id 24mr15996303pfo.145.1583122370242;
        Sun, 01 Mar 2020 20:12:50 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id d82sm1698114pfd.187.2020.03.01.20.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2020 20:12:49 -0800 (PST)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv4 05/11] videobuf2: handle V4L2_FLAG_MEMORY_NON_CONSISTENT flag
Date:   Mon,  2 Mar 2020 13:12:07 +0900
Message-Id: <20200302041213.27662-6-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200302041213.27662-1-senozhatsky@chromium.org>
References: <20200302041213.27662-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch lets user-space to request a non-consistent memory
allocation during CREATE_BUFS and REQBUFS ioctl calls.

= CREATE_BUFS

  struct v4l2_create_buffers has seven 4-byte reserved areas,
  so reserved[0] is renamed to ->flags. The struct, thus, now
  has six reserved 4-byte regions.

= REQBUFS

 We use one bit of a ->reserved[1] member of struct v4l2_requestbuffers,
 which is now renamed to ->flags. Unlike v4l2_create_buffers, struct
 v4l2_requestbuffers does not have enough reserved room. Therefore for
 backward compatibility  ->reserved and ->flags were put into anonymous
 union.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../media/uapi/v4l/vidioc-create-bufs.rst     |  7 ++++-
 .../media/uapi/v4l/vidioc-reqbufs.rst         | 11 +++++--
 .../media/common/videobuf2/videobuf2-v4l2.c   | 31 +++++++++++++++++--
 drivers/media/v4l2-core/v4l2-ioctl.c          |  5 +--
 include/uapi/linux/videodev2.h                |  8 +++--
 5 files changed, 50 insertions(+), 12 deletions(-)

diff --git a/Documentation/media/uapi/v4l/vidioc-create-bufs.rst b/Documentation/media/uapi/v4l/vidioc-create-bufs.rst
index bd08e4f77ae4..a9c6c89f5098 100644
--- a/Documentation/media/uapi/v4l/vidioc-create-bufs.rst
+++ b/Documentation/media/uapi/v4l/vidioc-create-bufs.rst
@@ -121,7 +121,12 @@ than the number requested.
 	other changes, then set ``count`` to 0, ``memory`` to
 	``V4L2_MEMORY_MMAP`` and ``format.type`` to the buffer type.
     * - __u32
-      - ``reserved``\ [7]
+      - ``flags``
+      - Specifies additional buffer management attributes.
+	See :ref:`memory-flags`.
+
+    * - __u32
+      - ``reserved``\ [6]
       - A place holder for future extensions. Drivers and applications
 	must set the array to zero.
 
diff --git a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
index 21ecacc72487..faf0df4f9bb6 100644
--- a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
+++ b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
@@ -112,10 +112,17 @@ aborting or finishing any DMA in progress, an implicit
 	``V4L2_MEMORY_MMAP`` and ``type`` set to the buffer type. This will
 	free any previously allocated buffers, so this is typically something
 	that will be done at the start of the application.
+    * - union {
+      - (anonymous)
+    * - __u32
+      - ``flags``
+      - Specifies additional buffer management attributes.
+	See :ref:`memory-flags`.
     * - __u32
       - ``reserved``\ [1]
-      - A place holder for future extensions. Drivers and applications
-	must set the array to zero.
+      - Kept for backwards compatibility. Use ``flags`` instead.
+    * - }
+      -
 
 .. tabularcolumns:: |p{6.1cm}|p{2.2cm}|p{8.7cm}|
 
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 6111d74f68c9..b4b379f3bf98 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -722,9 +722,18 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
 int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
 {
 	int ret = vb2_verify_memory_type(q, req->memory, req->type);
+	bool consistent = true;
+
+	if (!vb2_queue_allows_cache_hints(q))
+		req->flags &= ~V4L2_FLAG_MEMORY_NON_CONSISTENT;
+
+	if (req->flags & V4L2_FLAG_MEMORY_NON_CONSISTENT)
+		consistent = false;
 
 	fill_buf_caps(q, &req->capabilities);
-	return ret ? ret : vb2_core_reqbufs(q, req->memory, true, &req->count);
+	if (ret)
+		return ret;
+	return vb2_core_reqbufs(q, req->memory, consistent, &req->count);
 }
 EXPORT_SYMBOL_GPL(vb2_reqbufs);
 
@@ -753,6 +762,7 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
 	unsigned requested_sizes[VIDEO_MAX_PLANES];
 	struct v4l2_format *f = &create->format;
 	int ret = vb2_verify_memory_type(q, create->memory, f->type);
+	bool consistent = true;
 	unsigned i;
 
 	fill_buf_caps(q, &create->capabilities);
@@ -798,7 +808,14 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
 	for (i = 0; i < requested_planes; i++)
 		if (requested_sizes[i] == 0)
 			return -EINVAL;
-	return ret ? ret : vb2_core_create_bufs(q, create->memory, true,
+
+	if (!vb2_queue_allows_cache_hints(q))
+		create->flags &= ~V4L2_FLAG_MEMORY_NON_CONSISTENT;
+
+	if (create->flags & V4L2_FLAG_MEMORY_NON_CONSISTENT)
+		consistent = false;
+
+	return ret ? ret : vb2_core_create_bufs(q, create->memory, consistent,
 		&create->count, requested_planes, requested_sizes);
 }
 EXPORT_SYMBOL_GPL(vb2_create_bufs);
@@ -968,13 +985,21 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
 {
 	struct video_device *vdev = video_devdata(file);
 	int res = vb2_verify_memory_type(vdev->queue, p->memory, p->type);
+	bool consistent = true;
 
 	fill_buf_caps(vdev->queue, &p->capabilities);
 	if (res)
 		return res;
 	if (vb2_queue_is_busy(vdev, file))
 		return -EBUSY;
-	res = vb2_core_reqbufs(vdev->queue, p->memory, true, &p->count);
+
+	if (!vb2_queue_allows_cache_hints(vdev->queue))
+		p->flags &= ~V4L2_FLAG_MEMORY_NON_CONSISTENT;
+
+	if (p->flags & V4L2_FLAG_MEMORY_NON_CONSISTENT)
+		consistent = false;
+
+	res = vb2_core_reqbufs(vdev->queue, p->memory, consistent, &p->count);
 	/* If count == 0, then the owner has released all buffers and he
 	   is no longer owner of the queue. Otherwise we have a new owner. */
 	if (res == 0)
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index fbcc7a20eedf..53b87bfd50d7 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1973,9 +1973,6 @@ static int v4l_reqbufs(const struct v4l2_ioctl_ops *ops,
 
 	if (ret)
 		return ret;
-
-	CLEAR_AFTER_FIELD(p, capabilities);
-
 	return ops->vidioc_reqbufs(file, fh, p);
 }
 
@@ -2015,7 +2012,7 @@ static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
 	if (ret)
 		return ret;
 
-	CLEAR_AFTER_FIELD(create, capabilities);
+	CLEAR_AFTER_FIELD(create, flags);
 
 	v4l_sanitize_format(&create->format);
 
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index e92c29864730..12b1bd220347 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -938,7 +938,10 @@ struct v4l2_requestbuffers {
 	__u32			type;		/* enum v4l2_buf_type */
 	__u32			memory;		/* enum v4l2_memory */
 	__u32			capabilities;
-	__u32			reserved[1];
+	union {
+		__u32		flags;
+		__u32		reserved[1];
+	};
 };
 
 /* capabilities for struct v4l2_requestbuffers and v4l2_create_buffers */
@@ -2446,7 +2449,8 @@ struct v4l2_create_buffers {
 	__u32			memory;
 	struct v4l2_format	format;
 	__u32			capabilities;
-	__u32			reserved[7];
+	__u32			flags;
+	__u32			reserved[6];
 };
 
 /*
-- 
2.25.0.265.gbab2e86ba0-goog

