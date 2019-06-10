Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF3543BDE1
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2019 22:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387489AbfFJUzm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jun 2019 16:55:42 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59306 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727588AbfFJUzm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jun 2019 16:55:42 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 52CE9281DA8
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Pawel Osciak <pawel@osciak.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 1/5] media: vb2: Introduce a vb2_get_buffer accessor
Date:   Mon, 10 Jun 2019 17:55:22 -0300
Message-Id: <20190610205526.2629-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190610205526.2629-1-ezequiel@collabora.com>
References: <20190610205526.2629-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some drivers need to access a vb2 buffer from its
queue index. Introduce an accessor to abstract this,
and avoid drivers from accessing private members.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
Changes from v1:
* Drop redundant num_buffers > 0 check.
---
 include/media/videobuf2-core.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index c03ef7cc5071..640aabe69450 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -1163,6 +1163,24 @@ static inline void vb2_clear_last_buffer_dequeued(struct vb2_queue *q)
 	q->last_buffer_dequeued = false;
 }
 
+/**
+ * vb2_get_buffer() - get a buffer from a queue
+ * @q:		pointer to &struct vb2_queue with videobuf2 queue.
+ * @index:	buffer index
+ *
+ * This function obtains a buffer from a queue, by its index.
+ * Keep in mind that there is no refcounting involved in this
+ * operation, so the buffer lifetime should be taken into
+ * consideration.
+ */
+static inline struct vb2_buffer *vb2_get_buffer(struct vb2_queue *q,
+						unsigned int index)
+{
+	if (index < q->num_buffers)
+		return q->bufs[index];
+	return NULL;
+}
+
 /*
  * The following functions are not part of the vb2 core API, but are useful
  * functions for videobuf2-*.
-- 
2.20.1

