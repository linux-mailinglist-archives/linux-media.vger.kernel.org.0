Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 188E83A2A66
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 13:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230468AbhFJLiZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 07:38:25 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:41895 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230452AbhFJLiV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 07:38:21 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id rIytl7kZmhqltrIz1lXjT4; Thu, 10 Jun 2021 13:36:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623324983; bh=tfZjIy0DAqTPo6JYTWeiz3De0hajqoq8scpK97TGa8Q=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=ldjKiqMSEjH0LAWR2RdbTV0kbhLhejMm4MHRFW0OF/ErgzyQ2XjfmNdPaXdh9AXHa
         8O1k5veWVz9AyzxctIBuLUPrkFOGyb+6ViZl2QNimhG+/T11TjvUf37yOEkP8B8yUB
         Et6Ol0ZaE21bhd9ZpizAoaiRx6xXaAzPnZP8JSK+zCKy0gpdVZf9bhTCMDY2SjepLY
         68l+lGdHoHBKobYXTqGY1/E+U/TACzALPR+N7JCmZV2v2m5BPCybsHLWWFNyaScSRt
         Zeo5wmmfLpOyzlczbxB2eI2vtZKh4Q22gW1vVztBxYGs91i/sL0ofKWBPMr2RHacoC
         Nozd7Q4vrwkKQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        John Cox <jc@kynesim.co.uk>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCHv2 05/11] videodev2.h: add V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS
Date:   Thu, 10 Jun 2021 13:36:09 +0200
Message-Id: <20210610113615.785359-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210610113615.785359-1-hverkuil-cisco@xs4all.nl>
References: <20210610113615.785359-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfOQXvprzNOxv3dllV8tYfCqFEZTxHVPvxwWq5j8/dztnYXnbIicoUV+916/WWo0LY09C7617zTll/A7TMa6JUFvfEI1cabtbfthGymVXA0bj0OTVGvmw
 32gLTaZy4XaVSdDIhHJ6fkbG0mBttYK1ToKmZsQiTpwbb1XalHZWI/3X9wdNyTVrYY0q1yIwAI7Rb4+ieozrulYufEwfhUnekUPcIgNxExwxp4q3Nf2X5c42
 Leobpu8kZOX3ZFgSPlwyQnR4MT9ODGPWxWTbdyBSUfGs8zs2LXF/FtbQ+IUiyMjxY9WV/zcClPUmxYcBDI+z34stHLy+n15SyLqaZLNMQGCn+veDXqRp+Ut/
 2b7QvzCsLz/EIQObz+K1JoGhVoC7JwavZrfwg1CpwTsujvZCyWFfDfllN8TalhXPKy6EvvvF
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
index 02281d13505f..10c552638878 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -2331,6 +2331,9 @@ int vb2_core_queue_init(struct vb2_queue *q)
 	if (WARN_ON(q->requires_requests && !q->supports_requests))
 		return -EINVAL;
 
+	if (WARN_ON(q->supports_ro_requests && !q->supports_requests))
+		return -EINVAL;
+
 	INIT_LIST_HEAD(&q->queued_list);
 	INIT_LIST_HEAD(&q->done_list);
 	spin_lock_init(&q->done_lock);
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 7e96f67c60ba..c63ee7bc3331 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -712,7 +712,9 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
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
index e7f4bf5bc8dd..0d7c27a07224 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -753,7 +753,8 @@ int v4l2_m2m_qbuf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 
 	vq = v4l2_m2m_get_vq(m2m_ctx, buf->type);
 	if (V4L2_TYPE_IS_CAPTURE(vq->type) &&
-	    (buf->flags & V4L2_BUF_FLAG_REQUEST_FD)) {
+	    (buf->flags & V4L2_BUF_FLAG_REQUEST_FD) &&
+	    !vq->supports_ro_requests) {
 		dprintk("%s: requests cannot be used with capture buffers\n",
 			__func__);
 		return -EPERM;
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 12955cb460d2..0760f967365a 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -578,6 +578,7 @@ struct vb2_queue {
 	unsigned int			allow_zero_bytesused:1;
 	unsigned int		   quirk_poll_must_check_waiting_for_buffers:1;
 	unsigned int			supports_requests:1;
+	unsigned int			supports_ro_requests:1;
 	unsigned int			requires_requests:1;
 	unsigned int			uses_qbuf:1;
 	unsigned int			uses_requests:1;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 7222fc855d6b..a70126ad0899 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -964,6 +964,7 @@ struct v4l2_requestbuffers {
 #define V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS		(1 << 4)
 #define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF	(1 << 5)
 #define V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS		(1 << 6)
+#define V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS		(1 << 7)
 
 /**
  * struct v4l2_plane - plane info for multi-planar buffers
-- 
2.30.2

