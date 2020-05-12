Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98B2D1CF3FE
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 14:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729595AbgELMGL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 08:06:11 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35096 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729207AbgELMGK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 08:06:10 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id C64F32A20C6
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com
Subject: [PATCH 4/5] media: staging: rkisp1: stats: replace locks wq_lock, irq_lock with one lock
Date:   Tue, 12 May 2020 14:05:21 +0200
Message-Id: <20200512120522.25960-5-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512120522.25960-1-dafna.hirschfeld@collabora.com>
References: <20200512120522.25960-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch removes two locks in the rkisp1_stats struct:
- The mutex 'wq_lock' that is used to protect the buffers list 'stat'
- The spin_lock 'irq_lock' that is used to protect the
variable 'is_streaming'

It replaces them with one spin_lock 'stats_lock' that protects
both the buffers list and the 'is_streaming' variable.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-common.h |  5 ++--
 drivers/staging/media/rkisp1/rkisp1-stats.c  | 27 ++++++++++----------
 2 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
index c0ab16c6b3db..c635bb0a7727 100644
--- a/drivers/staging/media/rkisp1/rkisp1-common.h
+++ b/drivers/staging/media/rkisp1/rkisp1-common.h
@@ -178,7 +178,7 @@ struct rkisp1_capture {
 /*
  * struct rkisp1_stats - ISP Statistics device
  *
- * @irq_lock: buffer queue lock
+ * @stats_lock: locks the buffer list 'stat' and 'is_streaming'
  * @stat: stats buffer list
  * @readout_wq: workqueue for statistics information read
  */
@@ -186,13 +186,12 @@ struct rkisp1_stats {
 	struct rkisp1_vdev_node vnode;
 	struct rkisp1_device *rkisp1;
 
-	spinlock_t irq_lock;
+	spinlock_t stats_lock; /* locks 'is_streaming', and 'stats' */
 	struct list_head stat;
 	struct v4l2_format vdev_fmt;
 	bool is_streaming;
 
 	struct workqueue_struct *readout_wq;
-	struct mutex wq_lock;
 };
 
 /*
diff --git a/drivers/staging/media/rkisp1/rkisp1-stats.c b/drivers/staging/media/rkisp1/rkisp1-stats.c
index 5578fdeb8a18..e6fb2c5f3b3e 100644
--- a/drivers/staging/media/rkisp1/rkisp1-stats.c
+++ b/drivers/staging/media/rkisp1/rkisp1-stats.c
@@ -130,12 +130,13 @@ static void rkisp1_stats_vb2_buf_queue(struct vb2_buffer *vb)
 		container_of(vbuf, struct rkisp1_buffer, vb);
 	struct vb2_queue *vq = vb->vb2_queue;
 	struct rkisp1_stats *stats_dev = vq->drv_priv;
+	unsigned long flags;
 
 	stats_buf->vaddr[0] = vb2_plane_vaddr(vb, 0);
 
-	mutex_lock(&stats_dev->wq_lock);
+	spin_lock_irqsave(&stats_dev->stats_lock, flags);
 	list_add_tail(&stats_buf->queue, &stats_dev->stat);
-	mutex_unlock(&stats_dev->wq_lock);
+	spin_unlock_irqrestore(&stats_dev->stats_lock, flags);
 }
 
 static int rkisp1_stats_vb2_buf_prepare(struct vb2_buffer *vb)
@@ -156,13 +157,13 @@ static void rkisp1_stats_vb2_stop_streaming(struct vb2_queue *vq)
 	unsigned int i;
 
 	/* Make sure no new work queued in isr before draining wq */
-	spin_lock_irqsave(&stats->irq_lock, flags);
+	spin_lock_irqsave(&stats->stats_lock, flags);
 	stats->is_streaming = false;
-	spin_unlock_irqrestore(&stats->irq_lock, flags);
+	spin_unlock_irqrestore(&stats->stats_lock, flags);
 
 	drain_workqueue(stats->readout_wq);
 
-	mutex_lock(&stats->wq_lock);
+	spin_lock_irqsave(&stats->stats_lock, flags);
 	for (i = 0; i < RKISP1_ISP_STATS_REQ_BUFS_MAX; i++) {
 		if (list_empty(&stats->stat))
 			break;
@@ -171,7 +172,7 @@ static void rkisp1_stats_vb2_stop_streaming(struct vb2_queue *vq)
 		list_del(&buf->queue);
 		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
 	}
-	mutex_unlock(&stats->wq_lock);
+	spin_unlock_irqrestore(&stats->stats_lock, flags);
 }
 
 static int
@@ -333,6 +334,7 @@ rkisp1_stats_send_measurement(struct rkisp1_stats *stats,
 	unsigned int frame_sequence =
 		atomic_read(&stats->rkisp1->isp.frame_sequence);
 	u64 timestamp = ktime_get_ns();
+	unsigned long flags;
 
 	if (frame_sequence != meas_work->frame_id) {
 		dev_warn(stats->rkisp1->dev,
@@ -341,14 +343,14 @@ rkisp1_stats_send_measurement(struct rkisp1_stats *stats,
 		frame_sequence = meas_work->frame_id;
 	}
 
-	mutex_lock(&stats->wq_lock);
+	spin_lock_irqsave(&stats->stats_lock, flags);
 	/* get one empty buffer */
 	if (!list_empty(&stats->stat)) {
 		cur_buf = list_first_entry(&stats->stat,
 					   struct rkisp1_buffer, queue);
 		list_del(&cur_buf->queue);
 	}
-	mutex_unlock(&stats->wq_lock);
+	spin_unlock_irqrestore(&stats->stats_lock, flags);
 
 	if (!cur_buf)
 		return;
@@ -406,7 +408,7 @@ void rkisp1_stats_isr(struct rkisp1_stats *stats, u32 isp_ris)
 	unsigned long flags;
 	u32 val;
 
-	spin_lock_irqsave(&stats->irq_lock, flags);
+	spin_lock_irqsave(&stats->stats_lock, flags);
 
 	val = RKISP1_STATS_MEAS_MASK;
 	rkisp1_write(rkisp1, val, RKISP1_CIF_ISP_ICR);
@@ -436,7 +438,7 @@ void rkisp1_stats_isr(struct rkisp1_stats *stats, u32 isp_ris)
 	}
 
 unlock:
-	spin_unlock_irqrestore(&stats->irq_lock, flags);
+	spin_unlock_irqrestore(&stats->stats_lock, flags);
 }
 
 static void rkisp1_init_stats(struct rkisp1_stats *stats)
@@ -456,10 +458,9 @@ int rkisp1_stats_register(struct rkisp1_stats *stats,
 	int ret;
 
 	stats->rkisp1 = rkisp1;
-	mutex_init(&stats->wq_lock);
 	mutex_init(&node->vlock);
 	INIT_LIST_HEAD(&stats->stat);
-	spin_lock_init(&stats->irq_lock);
+	spin_lock_init(&stats->stats_lock);
 
 	strscpy(vdev->name, RKISP1_STATS_DEV_NAME, sizeof(vdev->name));
 
@@ -506,7 +507,6 @@ int rkisp1_stats_register(struct rkisp1_stats *stats,
 err_release_queue:
 	vb2_queue_release(vdev->queue);
 	mutex_destroy(&node->vlock);
-	mutex_destroy(&stats->wq_lock);
 	return ret;
 }
 
@@ -520,5 +520,4 @@ void rkisp1_stats_unregister(struct rkisp1_stats *stats)
 	media_entity_cleanup(&vdev->entity);
 	vb2_queue_release(vdev->queue);
 	mutex_destroy(&node->vlock);
-	mutex_destroy(&stats->wq_lock);
 }
-- 
2.17.1

