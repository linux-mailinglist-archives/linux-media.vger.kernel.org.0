Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F301582CA
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 14:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726590AbfF0Mog (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 08:44:36 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:60847 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726472AbfF0Mog (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 08:44:36 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1hgTlS-0002h3-W6; Thu, 27 Jun 2019 14:44:34 +0200
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.89)
        (envelope-from <mtr@pengutronix.de>)
        id 1hgTlS-00086Q-FC; Thu, 27 Jun 2019 14:44:34 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de, pawel@osciak.com, hverkuil-cisco@xs4all.nl,
        mchehab@kernel.org, Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 2/2] media: v4l2-mem2mem: reorder checks in v4l2_m2m_poll()
Date:   Thu, 27 Jun 2019 14:44:33 +0200
Message-Id: <20190627124433.31051-3-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190627124433.31051-1-m.tretter@pengutronix.de>
References: <20190627124433.31051-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When reaching the end of stream, V4L2 m2m clients may expect the
V4L2_EOS_EVENT. Although the V4L2_EOS_EVENT is deprecated behavior,
drivers must signal that event before dequeuing the buffer that has the
V4L2_BUF_FLAG_LAST flag set.

If a driver queues the V4L2_EOS_EVENT event and returns the buffer after
the check for events but before the check for buffers, vb2_m2m_poll()
will signal that the buffer with V4L2_BUF_FLAG_LAST can be read but not
that the V4L2_EOS_EVENT is available.

Split the check for buffers into a separate function and check for
available buffers before checking for events. This ensures that if
vb2_m2m_poll() signals POLLIN | POLLRDNORM for the V4L2_BUF_FLAG_LAST
buffer, it signals POLLPRI for the V4L2_EOS_EVENT, too.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
v1 -> v2:
- rename __v4l2_m2m_poll() to v4l2_m2m_poll_for_data()
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 47 +++++++++++++++-----------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 4f5176702937..e21aa05245dc 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -603,11 +603,10 @@ int v4l2_m2m_streamoff(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_streamoff);
 
-__poll_t v4l2_m2m_poll(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
-			   struct poll_table_struct *wait)
+static __poll_t v4l2_m2m_poll_for_data(struct file *file,
+				       struct v4l2_m2m_ctx *m2m_ctx,
+				       struct poll_table_struct *wait)
 {
-	struct video_device *vfd = video_devdata(file);
-	__poll_t req_events = poll_requested_events(wait);
 	struct vb2_queue *src_q, *dst_q;
 	struct vb2_buffer *src_vb = NULL, *dst_vb = NULL;
 	__poll_t rc = 0;
@@ -619,16 +618,6 @@ __poll_t v4l2_m2m_poll(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 	poll_wait(file, &src_q->done_wq, wait);
 	poll_wait(file, &dst_q->done_wq, wait);
 
-	if (test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags)) {
-		struct v4l2_fh *fh = file->private_data;
-
-		poll_wait(file, &fh->wait, wait);
-		if (v4l2_event_pending(fh))
-			rc = EPOLLPRI;
-		if (!(req_events & (EPOLLOUT | EPOLLWRNORM | EPOLLIN | EPOLLRDNORM)))
-			return rc;
-	}
-
 	/*
 	 * There has to be at least one buffer queued on each queued_list, which
 	 * means either in driver already or waiting for driver to claim it
@@ -637,10 +626,8 @@ __poll_t v4l2_m2m_poll(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 	if ((!src_q->streaming || src_q->error ||
 	     list_empty(&src_q->queued_list)) &&
 	    (!dst_q->streaming || dst_q->error ||
-	     list_empty(&dst_q->queued_list))) {
-		rc |= EPOLLERR;
-		goto end;
-	}
+	     list_empty(&dst_q->queued_list)))
+		return EPOLLERR;
 
 	spin_lock_irqsave(&dst_q->done_lock, flags);
 	if (list_empty(&dst_q->done_list)) {
@@ -650,7 +637,7 @@ __poll_t v4l2_m2m_poll(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 		 */
 		if (dst_q->last_buffer_dequeued) {
 			spin_unlock_irqrestore(&dst_q->done_lock, flags);
-			return rc | EPOLLIN | EPOLLRDNORM;
+			return EPOLLIN | EPOLLRDNORM;
 		}
 	}
 	spin_unlock_irqrestore(&dst_q->done_lock, flags);
@@ -673,7 +660,27 @@ __poll_t v4l2_m2m_poll(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 		rc |= EPOLLIN | EPOLLRDNORM;
 	spin_unlock_irqrestore(&dst_q->done_lock, flags);
 
-end:
+	return rc;
+}
+
+__poll_t v4l2_m2m_poll(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
+			   struct poll_table_struct *wait)
+{
+	struct video_device *vfd = video_devdata(file);
+	__poll_t req_events = poll_requested_events(wait);
+	__poll_t rc = 0;
+
+	if (req_events & (EPOLLOUT | EPOLLWRNORM | EPOLLIN | EPOLLRDNORM))
+		rc = v4l2_m2m_poll_for_data(file, m2m_ctx, wait);
+
+	if (test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags)) {
+		struct v4l2_fh *fh = file->private_data;
+
+		poll_wait(file, &fh->wait, wait);
+		if (v4l2_event_pending(fh))
+			rc |= EPOLLPRI;
+	}
+
 	return rc;
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_poll);
-- 
2.20.1

