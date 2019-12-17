Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D6C2122296
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2019 04:22:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbfLQDVC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 22:21:02 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35031 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727404AbfLQDVB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 22:21:01 -0500
Received: by mail-pl1-f195.google.com with SMTP id g6so2794423plt.2
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2019 19:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YT5zPdi996NXjchiwCDqVrjFoOKLt3bLnZH+tVb9/cU=;
        b=Ui0YYV/vw7P9G0lo0Y1sMgKALXnDBU/1UuD8ANc+wq1Yx7zco/LjVCgBzjejWw2DGQ
         0SNg0OnPnCC4ixuLPiBkPfPEOhibXdreAC4HTi+Mq4S6LJGSe7sMpAhKOak33ma2EWxy
         aias37z7+v1UA3EQLPmFro4zEdMJnB74zEHAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YT5zPdi996NXjchiwCDqVrjFoOKLt3bLnZH+tVb9/cU=;
        b=sfsyRsXKCRI4H8qewvXJCtS5nRHl8hYkjILcHTcxjivhJxUz4EaPqxWo4BGLfkwX6y
         MMsEsYzo/jjvgPifcdXt8HBKyGKxEujMOaLkoqJmNqvoUmi8aQJcYMHBkLc9rIz+JrM4
         hOZl1DS3jDOAB+NL2yLKOEHzkyzHr5/GjcJ53rqDQrPzvQ5lYxpsNhn8dDqufaK/+Mvj
         2UTMDtrDTd8b1g1f5ZhjpKoMcEjiyHjb6pyZHgp6SK0t7NAp9lnfhj4JL3J1ztAPhKsj
         3STuruql2EjmEU0t848WERzeYTSjVTfcd1tjcQbRhFl2hiIq2q6lAE5u/ZXaCsI6c9us
         H0UA==
X-Gm-Message-State: APjAAAUdMlIkY9GvnG5JQr2WFhFpqzIxzq+5Yckh4Udku6pkOJjCAK/0
        98H2VExiodUh8Lfc+cOqelMoUQ==
X-Google-Smtp-Source: APXvYqxzE0ZN2M7MmqYjMlHuc5TaV0+MgkaG2yIcNH/4jH6GMMY2mueWihj+lF2Qdzbxj3sAqtQ19g==
X-Received: by 2002:a17:90a:2201:: with SMTP id c1mr3355615pje.31.1576552861030;
        Mon, 16 Dec 2019 19:21:01 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
        by smtp.gmail.com with ESMTPSA id j3sm24387455pfi.8.2019.12.16.19.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 19:21:00 -0800 (PST)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [RFC][PATCH 05/15] videobuf2: handle V4L2_FLAG_MEMORY_NON_CONSISTENT in REQBUFS
Date:   Tue, 17 Dec 2019 12:20:24 +0900
Message-Id: <20191217032034.54897-6-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191217032034.54897-1-senozhatsky@chromium.org>
References: <20191217032034.54897-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch lets user-space to request a non-consistent memory
allocation during REQBUFS ioctl call. We use one bit of a
->reserved[1] member of struct v4l2_requestbuffers, which is
now renamed to ->flags.

There is just 1 four-byte reserved area in v4l2_requestbuffers
struct, therefore for backward compatibility ->reserved and
->flags were put into anonymous union.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 Documentation/media/uapi/v4l/vidioc-reqbufs.rst | 14 ++++++++++++--
 drivers/media/common/videobuf2/videobuf2-v4l2.c | 14 ++++++++++++--
 drivers/media/v4l2-core/v4l2-ioctl.c            |  3 ---
 include/uapi/linux/videodev2.h                  |  5 ++++-
 4 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
index d0c643db477a..9b69a61d9fd4 100644
--- a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
+++ b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
@@ -112,10 +112,20 @@ aborting or finishing any DMA in progress, an implicit
 	``V4L2_MEMORY_MMAP`` and ``type`` set to the buffer type. This will
 	free any previously allocated buffers, so this is typically something
 	that will be done at the start of the application.
-    * - __u32
+    * - union
+      - (anonymous)
+    * -
+      - __u32
+      - ``flags``\ [1]
+      - Specifies additional buffer management attributes. E.g. when
+        ``V4L2_FLAG_MEMORY_NON_CONSISTENT`` set vb2 backends may be allocated
+        in non-consistent memory.
+    * -
+      - __u32
       - ``reserved``\ [1]
       - A place holder for future extensions. Drivers and applications
-	must set the array to zero.
+	must set the array to zero, unless application wants to specify
+        buffer management ``flags``.
 
 .. tabularcolumns:: |p{6.1cm}|p{2.2cm}|p{8.7cm}|
 
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index f1e88c9398c7..0eabb589684f 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -693,9 +693,15 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
 int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
 {
 	int ret = vb2_verify_memory_type(q, req->memory, req->type);
+	bool consistent = true;
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
 
@@ -939,13 +945,17 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
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
+	if (p->flags & V4L2_FLAG_MEMORY_NON_CONSISTENT)
+		consistent = false;
+
+	res = vb2_core_reqbufs(vdev->queue, p->memory, consistent, &p->count);
 	/* If count == 0, then the owner has released all buffers and he
 	   is no longer owner of the queue. Otherwise we have a new owner. */
 	if (res == 0)
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 003b7422aeef..225d06819bce 100644
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
 
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index d352997f2b62..73a4854f71bd 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -919,7 +919,10 @@ struct v4l2_requestbuffers {
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
-- 
2.24.1.735.g03f4e72817-goog

