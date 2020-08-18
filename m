Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66BA52487C8
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 16:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727000AbgHROhb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 10:37:31 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:36829 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727890AbgHROhX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 10:37:23 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 82jnkV8V2uuXO82jpkcevX; Tue, 18 Aug 2020 16:37:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597761441; bh=VT1phX6EYaOI2Ic/hMC9iaTZUXrMxXUqdljNRuY8DPQ=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=cOI0XVAxun1cfCKmFu8QbBIVC/cizaPhjgoYszkQ9tqxrEo8lurXalff7hBpEFGvx
         OobylfdOeIbFzumxObLVZgaUmc1JKHHWSo6+HIps9vbYp/IKYYeE2qRQiBnLH2FDX1
         XrUrz3vHbSnJNARDNHd9BHsH03j7C5GTpGOJnPE3wQSV3S3Gmaplqbifb8E/uqgo5H
         /wEM7r28NWhI3aQTEmN9HC+MTvK67HCw2dAJBXjwMRZRD5QZd0J1yihBABqKNbKqqS
         nboFP9/8Ih83arCRK4NG98GfeqGEy+OTdqdmifxJbSO23m27SNwxh3GyXAZFauepmy
         t6VbD6re+w5qg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 04/12] videodev2.h: add V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS
Date:   Tue, 18 Aug 2020 16:37:11 +0200
Message-Id: <20200818143719.102128-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200818143719.102128-1-hverkuil-cisco@xs4all.nl>
References: <20200818143719.102128-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfCuwSrPvT4fumm6uq5Q5WMyOX6OnYFqvqUTKnnAc42oTX5UrWuzWMQXEHZ0Xwab3bjAqBvapkeMtcnah8py0+THUdibAVA3JlkwbJKBA3FfrJVRuZCf9
 MutHBxYoEallZtP/q0OB2XnCJYFdu6h4EqCQrwiCWra8okfqXdZAkac5bbCbmkYM4fe4xJG4EgawT0xEbOL5+hT3oI9SgWjgRVgJ29iPievIqXhZJd6d629a
 vLCVQBuRiPUnJBSOtzjJGfW8g2/2zvya2zTX+mLp3FNEr3SVaCewyR1Wov6ClyHz5BVDVJeeN6e+zXNlMbcW5xoP9uhUmaOfWpjS5OYLoWNoNuaLH/wbAw26
 Wji31XDc
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds support for the V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS
flag. This flag is used for Read-Only Requests.

Based on a patch from Yunfei Dong <yunfei.dong@mediatek.com>.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 3 +++
 drivers/media/common/videobuf2/videobuf2-v4l2.c | 4 +++-
 drivers/media/v4l2-core/v4l2-mem2mem.c          | 3 ++-
 include/media/videobuf2-core.h                  | 1 +
 include/uapi/linux/videodev2.h                  | 1 +
 5 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index f544d3393e9d..5194056129de 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -2354,6 +2354,9 @@ int vb2_core_queue_init(struct vb2_queue *q)
 	if (WARN_ON(q->requires_requests && !q->supports_requests))
 		return -EINVAL;
 
+	if (WARN_ON(q->supports_ro_requests && !q->supports_requests))
+		return -EINVAL;
+
 	INIT_LIST_HEAD(&q->queued_list);
 	INIT_LIST_HEAD(&q->done_list);
 	spin_lock_init(&q->done_lock);
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 30caad27281e..9471320caaa0 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -717,7 +717,9 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
 	if (q->allow_cache_hints && q->io_modes & VB2_MMAP)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS;
 #ifdef CONFIG_MEDIA_CONTROLLER_REQUEST_API
-	if (q->supports_requests)
+	if (q->supports_ro_requests)
+		*caps |= V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS;
+	else if (q->supports_requests)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_REQUESTS;
 #endif
 }
diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 95a8f2dc5341..48f87cfe2f63 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -713,7 +713,8 @@ int v4l2_m2m_qbuf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 
 	vq = v4l2_m2m_get_vq(m2m_ctx, buf->type);
 	if (V4L2_TYPE_IS_CAPTURE(vq->type) &&
-	    (buf->flags & V4L2_BUF_FLAG_REQUEST_FD)) {
+	    (buf->flags & V4L2_BUF_FLAG_REQUEST_FD) &&
+	    !vq->supports_ro_requests) {
 		dprintk("%s: requests cannot be used with capture buffers\n",
 			__func__);
 		return -EPERM;
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 52ef92049073..af7ecff725a5 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -575,6 +575,7 @@ struct vb2_queue {
 	unsigned int			allow_zero_bytesused:1;
 	unsigned int		   quirk_poll_must_check_waiting_for_buffers:1;
 	unsigned int			supports_requests:1;
+	unsigned int			supports_ro_requests:1;
 	unsigned int			requires_requests:1;
 	unsigned int			uses_qbuf:1;
 	unsigned int			uses_requests:1;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index c7b70ff53bc1..7226d6d3c1e4 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -963,6 +963,7 @@ struct v4l2_requestbuffers {
 #define V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS		(1 << 4)
 #define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF	(1 << 5)
 #define V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS		(1 << 6)
+#define V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS		(1 << 7)
 
 /**
  * struct v4l2_plane - plane info for multi-planar buffers
-- 
2.27.0

