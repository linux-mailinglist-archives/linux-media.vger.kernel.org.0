Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F50121B5B2
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 15:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726965AbgGJNAV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 09:00:21 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41780 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbgGJNAV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 09:00:21 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 18FB02A654C
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v3] media: videobuf2: Print videobuf2 buffer state by name
Date:   Fri, 10 Jul 2020 10:00:10 -0300
Message-Id: <20200710130010.160712-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200710125129.159710-1-ezequiel@collabora.com>
References: <20200710125129.159710-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For debugging purposes, seeing the state integer
representation is really inconvenient.

Improve this and be developer-friendly by printing
the state name instead.

Suggested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
v3:
* Drop static modifier from the now local name array.
v2:
* Use a proper function instead of a C macro.

 .../media/common/videobuf2/videobuf2-core.c   | 35 ++++++++++++++-----
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index abaf28e057eb..d5942cd455bf 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -191,6 +191,23 @@ module_param(debug, int, 0644);
 static void __vb2_queue_cancel(struct vb2_queue *q);
 static void __enqueue_in_driver(struct vb2_buffer *vb);
 
+static inline const char *vb2_state_name(enum vb2_buffer_state s)
+{
+	const char * const state_names[] = {
+		[VB2_BUF_STATE_DEQUEUED] = "dequeued",
+		[VB2_BUF_STATE_IN_REQUEST] = "in request",
+		[VB2_BUF_STATE_PREPARING] = "preparing",
+		[VB2_BUF_STATE_QUEUED] = "queued",
+		[VB2_BUF_STATE_ACTIVE] = "active",
+		[VB2_BUF_STATE_DONE] = "done",
+		[VB2_BUF_STATE_ERROR] = "error",
+	};
+
+	if ((unsigned int)(s) < ARRAY_SIZE(state_names))
+		return state_names[s];
+	return "unknown";
+}
+
 /*
  * __vb2_buf_mem_alloc() - allocate video memory for the given buffer
  */
@@ -1015,8 +1032,8 @@ void vb2_buffer_done(struct vb2_buffer *vb, enum vb2_buffer_state state)
 	 */
 	vb->cnt_buf_done++;
 #endif
-	dprintk(q, 4, "done processing on buffer %d, state: %d\n",
-			vb->index, state);
+	dprintk(q, 4, "done processing on buffer %d, state: %s\n",
+		vb->index, vb2_state_name(state));
 
 	if (state != VB2_BUF_STATE_QUEUED)
 		__vb2_buf_mem_finish(vb);
@@ -1490,8 +1507,8 @@ int vb2_core_prepare_buf(struct vb2_queue *q, unsigned int index, void *pb)
 
 	vb = q->bufs[index];
 	if (vb->state != VB2_BUF_STATE_DEQUEUED) {
-		dprintk(q, 1, "invalid buffer state %d\n",
-			vb->state);
+		dprintk(q, 1, "invalid buffer state %s\n",
+			vb2_state_name(vb->state));
 		return -EINVAL;
 	}
 	if (vb->prepared) {
@@ -1670,7 +1687,8 @@ int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
 		dprintk(q, 1, "buffer still being prepared\n");
 		return -EINVAL;
 	default:
-		dprintk(q, 1, "invalid buffer state %d\n", vb->state);
+		dprintk(q, 1, "invalid buffer state %s\n",
+			vb2_state_name(vb->state));
 		return -EINVAL;
 	}
 
@@ -1884,7 +1902,8 @@ int vb2_core_dqbuf(struct vb2_queue *q, unsigned int *pindex, void *pb,
 		dprintk(q, 3, "returning done buffer with errors\n");
 		break;
 	default:
-		dprintk(q, 1, "invalid buffer state\n");
+		dprintk(q, 1, "invalid buffer state %s\n",
+			vb2_state_name(vb->state));
 		return -EINVAL;
 	}
 
@@ -1915,8 +1934,8 @@ int vb2_core_dqbuf(struct vb2_queue *q, unsigned int *pindex, void *pb,
 		media_request_put(vb->request);
 	vb->request = NULL;
 
-	dprintk(q, 2, "dqbuf of buffer %d, with state %d\n",
-			vb->index, vb->state);
+	dprintk(q, 2, "dqbuf of buffer %d, state: %s\n",
+		vb->index, vb2_state_name(vb->state));
 
 	return 0;
 
-- 
2.27.0

