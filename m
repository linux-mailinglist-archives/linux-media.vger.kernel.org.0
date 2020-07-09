Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DA5221A608
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2020 19:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbgGIRnx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jul 2020 13:43:53 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60892 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbgGIRnx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jul 2020 13:43:53 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 0522B2A65C0
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH] media: videobuf2: Print videobuf2 buffer state by name
Date:   Thu,  9 Jul 2020 14:43:36 -0300
Message-Id: <20200709174336.79112-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
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
 .../media/common/videobuf2/videobuf2-core.c   | 32 ++++++++++++++-----
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index abaf28e057eb..8480772d58c6 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -191,6 +191,20 @@ module_param(debug, int, 0644);
 static void __vb2_queue_cancel(struct vb2_queue *q);
 static void __enqueue_in_driver(struct vb2_buffer *vb);
 
+static const char * const vb2_state_names[] = {
+	[VB2_BUF_STATE_DEQUEUED] = "dequeued",
+	[VB2_BUF_STATE_IN_REQUEST] = "in request",
+	[VB2_BUF_STATE_PREPARING] = "preparing",
+	[VB2_BUF_STATE_QUEUED] = "queued",
+	[VB2_BUF_STATE_ACTIVE] = "active",
+	[VB2_BUF_STATE_DONE] = "done",
+	[VB2_BUF_STATE_ERROR] = "error",
+};
+
+#define vb2_state_name(s) \
+	(((unsigned int)(s)) < ARRAY_SIZE(vb2_state_names) ? \
+	 vb2_state_names[s] : "unknown")
+
 /*
  * __vb2_buf_mem_alloc() - allocate video memory for the given buffer
  */
@@ -1015,8 +1029,8 @@ void vb2_buffer_done(struct vb2_buffer *vb, enum vb2_buffer_state state)
 	 */
 	vb->cnt_buf_done++;
 #endif
-	dprintk(q, 4, "done processing on buffer %d, state: %d\n",
-			vb->index, state);
+	dprintk(q, 4, "done processing on buffer %d, state: %s\n",
+		vb->index, vb2_state_name(state));
 
 	if (state != VB2_BUF_STATE_QUEUED)
 		__vb2_buf_mem_finish(vb);
@@ -1490,8 +1504,8 @@ int vb2_core_prepare_buf(struct vb2_queue *q, unsigned int index, void *pb)
 
 	vb = q->bufs[index];
 	if (vb->state != VB2_BUF_STATE_DEQUEUED) {
-		dprintk(q, 1, "invalid buffer state %d\n",
-			vb->state);
+		dprintk(q, 1, "invalid buffer state %s\n",
+			vb2_state_name(vb->state));
 		return -EINVAL;
 	}
 	if (vb->prepared) {
@@ -1670,7 +1684,8 @@ int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
 		dprintk(q, 1, "buffer still being prepared\n");
 		return -EINVAL;
 	default:
-		dprintk(q, 1, "invalid buffer state %d\n", vb->state);
+		dprintk(q, 1, "invalid buffer state %s\n",
+			vb2_state_name(vb->state));
 		return -EINVAL;
 	}
 
@@ -1884,7 +1899,8 @@ int vb2_core_dqbuf(struct vb2_queue *q, unsigned int *pindex, void *pb,
 		dprintk(q, 3, "returning done buffer with errors\n");
 		break;
 	default:
-		dprintk(q, 1, "invalid buffer state\n");
+		dprintk(q, 1, "invalid buffer state %s\n",
+			vb2_state_name(vb->state));
 		return -EINVAL;
 	}
 
@@ -1915,8 +1931,8 @@ int vb2_core_dqbuf(struct vb2_queue *q, unsigned int *pindex, void *pb,
 		media_request_put(vb->request);
 	vb->request = NULL;
 
-	dprintk(q, 2, "dqbuf of buffer %d, with state %d\n",
-			vb->index, vb->state);
+	dprintk(q, 2, "dqbuf of buffer %d, state: %s\n",
+		vb->index, vb2_state_name(vb->state));
 
 	return 0;
 
-- 
2.27.0

