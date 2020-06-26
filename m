Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7FA20AE8B
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 10:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725915AbgFZIvy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 04:51:54 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46752 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725850AbgFZIvx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 04:51:53 -0400
Received: from localhost.localdomain (p200300cb8737cf00e1b48557745ca459.dip0.t-ipconnect.de [IPv6:2003:cb:8737:cf00:e1b4:8557:745c:a459])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9C5882A59BF;
        Fri, 26 Jun 2020 09:51:50 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH v2 3/4] media: staging: rkisp1: stats: replace locks wq_lock, irq_lock with one lock
Date:   Fri, 26 Jun 2020 10:51:40 +0200
Message-Id: <20200626085141.7646-4-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200626085141.7646-1-dafna.hirschfeld@collabora.com>
References: <20200626085141.7646-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch removes two locks in the rkisp1_stats struct:
- The mutex 'wq_lock' that is used to protect the buffers list 'stat'
- The spin_lock 'irq_lock' that is used to protect the
variable 'is_streaming'

It replaces them with one spin_lock 'lock' that protects
both the buffers list and the 'is_streaming' variable.
In later patch the reading of the statistics will move to
the isr so there will be no need for the mutex 'wq_lock'

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-common.h |  5 ++--
 drivers/staging/media/rkisp1/rkisp1-stats.c  | 25 +++++++++-----------
 2 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
index d2c669091fae..c92ae1b7093f 100644
--- a/drivers/staging/media/rkisp1/rkisp1-common.h
+++ b/drivers/staging/media/rkisp1/rkisp1-common.h
@@ -178,7 +178,7 @@ struct rkisp1_capture {
 /*
  * struct rkisp1_stats - ISP Statistics device
  *
- * @irq_lock: buffer queue lock
+ * @lock: locks the buffer list 'stat' and 'is_streaming'
  * @stat: stats buffer list
  * @readout_wq: workqueue for statistics information read
  */
@@ -186,13 +186,12 @@ struct rkisp1_stats {
 	struct rkisp1_vdev_node vnode;
 	struct rkisp1_device *rkisp1;
 
-	spinlock_t irq_lock;
+	spinlock_t lock; /* locks 'is_streaming', and 'stats' */
 	struct list_head stat;
 	struct v4l2_format vdev_fmt;
 	bool is_streaming;
 
 	struct workqueue_struct *readout_wq;
-	struct mutex wq_lock;
 };
 
 /*
diff --git a/drivers/staging/media/rkisp1/rkisp1-stats.c b/drivers/staging/media/rkisp1/rkisp1-stats.c
index d4f0df4342e0..58329e6b0598 100644
--- a/drivers/staging/media/rkisp1/rkisp1-stats.c
+++ b/drivers/staging/media/rkisp1/rkisp1-stats.c
@@ -133,9 +133,9 @@ static void rkisp1_stats_vb2_buf_queue(struct vb2_buffer *vb)
 
 	stats_buf->vaddr[0] = vb2_plane_vaddr(vb, 0);
 
-	mutex_lock(&stats_dev->wq_lock);
+	spin_lock_irq(&stats_dev->lock);
 	list_add_tail(&stats_buf->queue, &stats_dev->stat);
-	mutex_unlock(&stats_dev->wq_lock);
+	spin_unlock_irq(&stats_dev->lock);
 }
 
 static int rkisp1_stats_vb2_buf_prepare(struct vb2_buffer *vb)
@@ -155,13 +155,13 @@ static void rkisp1_stats_vb2_stop_streaming(struct vb2_queue *vq)
 	unsigned int i;
 
 	/* Make sure no new work queued in isr before draining wq */
-	spin_lock_irq(&stats->irq_lock);
+	spin_lock_irq(&stats->lock);
 	stats->is_streaming = false;
-	spin_unlock_irq(&stats->irq_lock);
+	spin_unlock_irq(&stats->lock);
 
 	drain_workqueue(stats->readout_wq);
 
-	mutex_lock(&stats->wq_lock);
+	spin_lock_irq(&stats->lock);
 	for (i = 0; i < RKISP1_ISP_STATS_REQ_BUFS_MAX; i++) {
 		if (list_empty(&stats->stat))
 			break;
@@ -170,7 +170,7 @@ static void rkisp1_stats_vb2_stop_streaming(struct vb2_queue *vq)
 		list_del(&buf->queue);
 		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
 	}
-	mutex_unlock(&stats->wq_lock);
+	spin_unlock_irq(&stats->lock);
 }
 
 static int
@@ -340,14 +340,14 @@ rkisp1_stats_send_measurement(struct rkisp1_stats *stats,
 		frame_sequence = meas_work->frame_id;
 	}
 
-	mutex_lock(&stats->wq_lock);
+	spin_lock_irq(&stats->lock);
 	/* get one empty buffer */
 	if (!list_empty(&stats->stat)) {
 		cur_buf = list_first_entry(&stats->stat,
 					   struct rkisp1_buffer, queue);
 		list_del(&cur_buf->queue);
 	}
-	mutex_unlock(&stats->wq_lock);
+	spin_unlock_irq(&stats->lock);
 
 	if (!cur_buf)
 		return;
@@ -396,7 +396,7 @@ void rkisp1_stats_isr(struct rkisp1_stats *stats, u32 isp_ris)
 	struct rkisp1_isp_readout_work *work;
 	unsigned int isp_mis_tmp = 0;
 
-	spin_lock(&stats->irq_lock);
+	spin_lock(&stats->lock);
 
 	rkisp1_write(rkisp1, RKISP1_STATS_MEAS_MASK, RKISP1_CIF_ISP_ICR);
 
@@ -425,7 +425,7 @@ void rkisp1_stats_isr(struct rkisp1_stats *stats, u32 isp_ris)
 	}
 
 unlock:
-	spin_unlock(&stats->irq_lock);
+	spin_unlock(&stats->lock);
 }
 
 static void rkisp1_init_stats(struct rkisp1_stats *stats)
@@ -445,10 +445,9 @@ int rkisp1_stats_register(struct rkisp1_stats *stats,
 	int ret;
 
 	stats->rkisp1 = rkisp1;
-	mutex_init(&stats->wq_lock);
 	mutex_init(&node->vlock);
 	INIT_LIST_HEAD(&stats->stat);
-	spin_lock_init(&stats->irq_lock);
+	spin_lock_init(&stats->lock);
 
 	strscpy(vdev->name, RKISP1_STATS_DEV_NAME, sizeof(vdev->name));
 
@@ -495,7 +494,6 @@ int rkisp1_stats_register(struct rkisp1_stats *stats,
 err_release_queue:
 	vb2_queue_release(vdev->queue);
 	mutex_destroy(&node->vlock);
-	mutex_destroy(&stats->wq_lock);
 	return ret;
 }
 
@@ -509,5 +507,4 @@ void rkisp1_stats_unregister(struct rkisp1_stats *stats)
 	media_entity_cleanup(&vdev->entity);
 	vb2_queue_release(vdev->queue);
 	mutex_destroy(&node->vlock);
-	mutex_destroy(&stats->wq_lock);
 }
-- 
2.17.1

