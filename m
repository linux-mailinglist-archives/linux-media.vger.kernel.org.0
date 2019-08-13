Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEBCD8B9CC
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 15:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728720AbfHMNP2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 09:15:28 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:56281 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727838AbfHMNP1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 09:15:27 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hxWe6-0005ns-Rd
        for linux-media@vger.kernel.org; Tue, 13 Aug 2019 15:15:26 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils] v4l-helpers.h: count mappings separately from buffers
Date:   Tue, 13 Aug 2019 15:14:53 +0200
Message-Id: <20190813131453.6321-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is required to avoid leaking mapped buffers when trying to unmap
after reqbufs(0), to test buffer orphaning.

Fixes: 6300b376cb3e ("v4l2-compliance: test orphaned buffer support");
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 utils/common/v4l-helpers.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
index d12f2745ef23..c37124e41efe 100644
--- a/utils/common/v4l-helpers.h
+++ b/utils/common/v4l-helpers.h
@@ -1406,6 +1406,7 @@ struct v4l_queue {
 	unsigned type;
 	unsigned memory;
 	unsigned buffers;
+	unsigned mappings;
 	unsigned num_planes;
 	unsigned capabilities;
 
@@ -1432,6 +1433,7 @@ static inline void v4l_queue_init(struct v4l_queue *q,
 static inline unsigned v4l_queue_g_type(const struct v4l_queue *q) { return q->type; }
 static inline unsigned v4l_queue_g_memory(const struct v4l_queue *q) { return q->memory; }
 static inline unsigned v4l_queue_g_buffers(const struct v4l_queue *q) { return q->buffers; }
+static inline unsigned v4l_queue_g_mappings(const struct v4l_queue *q) { return q->mappings; }
 static inline unsigned v4l_queue_g_num_planes(const struct v4l_queue *q) { return q->num_planes; }
 static inline unsigned v4l_queue_g_capabilities(const struct v4l_queue *q) { return q->capabilities; }
 
@@ -1452,7 +1454,7 @@ static inline void v4l_queue_s_mmapping(struct v4l_queue *q, unsigned index, uns
 
 static inline void *v4l_queue_g_mmapping(const struct v4l_queue *q, unsigned index, unsigned plane)
 {
-	if (index >= v4l_queue_g_buffers(q) || plane >= v4l_queue_g_num_planes(q))
+	if (index >= v4l_queue_g_mappings(q) || plane >= v4l_queue_g_num_planes(q))
 		return NULL;
 	return q->mmappings[index][plane];
 }
@@ -1591,6 +1593,7 @@ static inline int v4l_queue_mmap_bufs(struct v4l_fd *f,
 			v4l_queue_s_mmapping(q, b, p, m);
 		}
 	}
+	q->mappings = b;
 	return 0;
 }
 static inline int v4l_queue_munmap_bufs(struct v4l_fd *f, struct v4l_queue *q,
@@ -1602,7 +1605,7 @@ static inline int v4l_queue_munmap_bufs(struct v4l_fd *f, struct v4l_queue *q,
 	if (q->memory != V4L2_MEMORY_MMAP && q->memory != V4L2_MEMORY_DMABUF)
 		return 0;
 
-	for (b = from; b < v4l_queue_g_buffers(q); b++) {
+	for (b = from; b < v4l_queue_g_mappings(q); b++) {
 		for (p = 0; p < v4l_queue_g_num_planes(q); p++) {
 			void *m = v4l_queue_g_mmapping(q, b, p);
 
@@ -1618,6 +1621,7 @@ static inline int v4l_queue_munmap_bufs(struct v4l_fd *f, struct v4l_queue *q,
 			v4l_queue_s_mmapping(q, b, p, NULL);
 		}
 	}
+	q->mappings = from;
 	return 0;
 }
 
-- 
2.20.1

