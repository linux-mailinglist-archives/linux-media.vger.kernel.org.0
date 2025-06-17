Return-Path: <linux-media+bounces-35086-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 617F3ADCE64
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 15:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85E1118889B7
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 13:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 873892E7F26;
	Tue, 17 Jun 2025 13:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dvD8y1ng"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75092E266D;
	Tue, 17 Jun 2025 13:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750168462; cv=none; b=QtsSQbu/TQOfemWrZFc2AZ0kpTFq0wmvbFz7NRqHWiRyXLXw70MvN2dsa88XOEUCvcn3hqNkSt0Oig2hDVE7Y9poW082jDgWXBVwYmwBqrY5eeH/V8TyhPLxSig1DsZNCaa6Kh/i9K77UrSL7TLIKAZbUn690+Tf13MrrunH1xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750168462; c=relaxed/simple;
	bh=zLWUmTcdF9adcPs5sOucY95zm4UbUzb7NCAlC66nylg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WVQ0cfr44txtDO/OUesTKmnUX4d1v3WLlTrw98trQdOTFda8zyiMsGGNUCsiqOGQKyYbPKDwRTC0g2I1XAAxWlhQ6aN00+uaLxP0+dy6Si2fxEd5gJy6syrW18Y5PUOT5DLaJDoLpp7s0ToUSUo6tt/lRZPKddsJLbEd3d8XfBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dvD8y1ng; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C2944416A;
	Tue, 17 Jun 2025 15:54:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750168444;
	bh=zLWUmTcdF9adcPs5sOucY95zm4UbUzb7NCAlC66nylg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dvD8y1ngVsWGCCo34CnldmtYescnOeuQYyDnkSVsIpMdF6MQGq5sfCFgZkX3b0O9Q
	 bCTaDN1GVDbWPnlcM3jzWnH5NqWFC9pgFdV8mQ8ssPHM28Dx+9cCyDc0m9nYnJT9G+
	 mA/dzPbSMzlKCYojruy/xhZ0MvWyjPbLP+MK0iwA=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 17 Jun 2025 15:54:01 +0200
Subject: [PATCH v8 3/4] media: pisp_be: Split jobs creation and scheduling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-pispbe-mainline-split-jobs-handling-v6-v8-3-e58ae199c17d@ideasonboard.com>
References: <20250617-pispbe-mainline-split-jobs-handling-v6-v8-0-e58ae199c17d@ideasonboard.com>
In-Reply-To: <20250617-pispbe-mainline-split-jobs-handling-v6-v8-0-e58ae199c17d@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>, 
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13294;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=zLWUmTcdF9adcPs5sOucY95zm4UbUzb7NCAlC66nylg=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoUXOET8qwukmp2Xr6MaHpwF3jHH7/SeoNsYEaU
 SW/vnHaR72JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaFFzhAAKCRByNAaPFqFW
 PHwDD/9uo9s5b4CVlyjoBUwIQYK0FR4bnGigRubQRk1W79XQfYDot2z6yArmWRkrAy0l2CeuFMw
 eSHPYoYhjR3vGrS6XAKpkvFLNtk6rCVAa2HvHyudk0BvbX27pDqEVjsPQFwJMzS9e3j890MfdnZ
 RGad4WEMBsUVawc8+77FCptBZVtNVQSPFQxtC4dI4yihReuCkD8VNnO86vtEIlZSTghUFQAkIB5
 KerMlrVjptvdsShbNZwrBTX2HPcANeIyHWhcJpU1rDMtzIL5d3tf7Z0yYGmgKy6umpkleA4+Xjg
 5k5VcKF9xcINfNIgSjSzo8oSdmegoLLTyN3d1zCawLIXVnZVenrvtkGMw1wqSb1Pu8LdPCrPQNa
 zp8UbWcImVGJ2tKZVJTM5c3bg9Lt4MoBGrhH+tyzRzsCrYEMDZYszYHNnKIVA0PgKQfBbmOGXLB
 SQ0PyMX9Tqeimh5vq0oqDkPQwIlX6PInvQTEs/XhI+f/39ky3/xbwIcBLe7if1nxcHsf/zSug3B
 iTMsM5iZj6c5Jnsoevz80H5n9e5e0OVvhmFf2tSZXH4JeVBcoJGLuRDRWMnbDnteucIdFvPWG+H
 F8PPoqdpVbxPhAtbwP+7766na73JU/KyPeZfBxyEiTQBHrXnjXlJORLzlzeUFOBlpzommpFV4rk
 BFNz2IYdy33M8Tw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Currently the 'pispbe_schedule()' function does two things:

1) Tries to assemble a job by inspecting all the video node queues
   to make sure all the required buffers are available
2) Submit the job to the hardware

The pispbe_schedule() function is called at:

- video device start_streaming() time
- video device qbuf() time
- irq handler

As assembling a job requires inspecting all queues, it is a rather
time consuming operation which is better not run in IRQ context.

To avoid executing the time consuming job creation in interrupt
context split the job creation and job scheduling in two distinct
operations. When a well-formed job is created, append it to the
newly introduced 'pispbe->job_queue' where it will be dequeued from
by the scheduling routine.

As the per-node 'ready_queue' buffer list is only accessed in vb2 ops
callbacks, protected by the node->queue_lock mutex, it is not necessary
to guard it with a dedicated spinlock so drop it. Also use the
spin_lock_irq() variant in all functions not called from an IRQ context
where the spin_lock_irqsave() version was used.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 161 +++++++++++----------
 1 file changed, 87 insertions(+), 74 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 92c452891d6c2d68aff9aa269c06fa1af77e3885..ccc6cb99868b842ac0d295f9ec28470303e60788 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/slab.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-dma-contig.h>
@@ -161,8 +162,6 @@ struct pispbe_node {
 	struct mutex node_lock;
 	/* vb2_queue lock */
 	struct mutex queue_lock;
-	/* Protect pispbe_node->ready_queue and pispbe_buffer->ready_list */
-	spinlock_t ready_lock;
 	struct list_head ready_queue;
 	struct vb2_queue queue;
 	struct v4l2_format format;
@@ -190,6 +189,8 @@ struct pispbe_hw_enables {
 
 /* Records a job configuration and memory addresses. */
 struct pispbe_job_descriptor {
+	struct list_head queue;
+	struct pispbe_buffer *buffers[PISPBE_NUM_NODES];
 	dma_addr_t hw_dma_addrs[N_HW_ADDRESSES];
 	struct pisp_be_tiles_config *config;
 	struct pispbe_hw_enables hw_enables;
@@ -215,8 +216,10 @@ struct pispbe_dev {
 	unsigned int sequence;
 	u32 streaming_map;
 	struct pispbe_job queued_job, running_job;
-	spinlock_t hw_lock; /* protects "hw_busy" flag and streaming_map */
+	/* protects "hw_busy" flag, streaming_map and job_queue */
+	spinlock_t hw_lock;
 	bool hw_busy; /* non-zero if a job is queued or is being started */
+	struct list_head job_queue;
 	int irq;
 	u32 hw_version;
 	u8 done, started;
@@ -440,42 +443,48 @@ static void pispbe_xlate_addrs(struct pispbe_dev *pispbe,
  * For Output0, Output1, Tdn and Stitch, a buffer only needs to be
  * available if the blocks are enabled in the config.
  *
- * Needs to be called with hw_lock held.
+ * If all the buffers required to form a job are available, append the
+ * job descriptor to the job queue to be later queued to the HW.
  *
  * Returns 0 if a job has been successfully prepared, < 0 otherwise.
  */
-static int pispbe_prepare_job(struct pispbe_dev *pispbe,
-			      struct pispbe_job_descriptor *job)
+static int pispbe_prepare_job(struct pispbe_dev *pispbe)
 {
+	struct pispbe_job_descriptor __free(kfree) *job = NULL;
 	struct pispbe_buffer *buf[PISPBE_NUM_NODES] = {};
+	unsigned int streaming_map;
 	unsigned int config_index;
 	struct pispbe_node *node;
-	unsigned long flags;
 
-	lockdep_assert_held(&pispbe->hw_lock);
+	lockdep_assert_irqs_enabled();
 
-	memset(job, 0, sizeof(struct pispbe_job_descriptor));
+	scoped_guard(spinlock_irq, &pispbe->hw_lock) {
+		static const u32 mask = BIT(CONFIG_NODE) | BIT(MAIN_INPUT_NODE);
 
-	if (((BIT(CONFIG_NODE) | BIT(MAIN_INPUT_NODE)) &
-		pispbe->streaming_map) !=
-			(BIT(CONFIG_NODE) | BIT(MAIN_INPUT_NODE)))
-		return -ENODEV;
+		if ((pispbe->streaming_map & mask) != mask)
+			return -ENODEV;
+
+		/*
+		 * Take a copy of streaming_map: nodes activated after this
+		 * point are ignored when preparing this job.
+		 */
+		streaming_map = pispbe->streaming_map;
+	}
+
+	job = kzalloc(sizeof(*job), GFP_KERNEL);
+	if (!job)
+		return -ENOMEM;
 
 	node = &pispbe->node[CONFIG_NODE];
-	spin_lock_irqsave(&node->ready_lock, flags);
 	buf[CONFIG_NODE] = list_first_entry_or_null(&node->ready_queue,
 						    struct pispbe_buffer,
 						    ready_list);
-	if (buf[CONFIG_NODE]) {
-		list_del(&buf[CONFIG_NODE]->ready_list);
-		pispbe->queued_job.buf[CONFIG_NODE] = buf[CONFIG_NODE];
-	}
-	spin_unlock_irqrestore(&node->ready_lock, flags);
-
-	/* Exit early if no config buffer has been queued. */
 	if (!buf[CONFIG_NODE])
 		return -ENODEV;
 
+	list_del(&buf[CONFIG_NODE]->ready_list);
+	job->buffers[CONFIG_NODE] = buf[CONFIG_NODE];
+
 	config_index = buf[CONFIG_NODE]->vb.vb2_buf.index;
 	job->config = &pispbe->config[config_index];
 	job->tiles = pispbe->config_dma_addr +
@@ -495,7 +504,7 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe,
 			continue;
 
 		buf[i] = NULL;
-		if (!(pispbe->streaming_map & BIT(i)))
+		if (!(streaming_map & BIT(i)))
 			continue;
 
 		if ((!(rgb_en & PISP_BE_RGB_ENABLE_OUTPUT0) &&
@@ -522,25 +531,28 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe,
 		node = &pispbe->node[i];
 
 		/* Pull a buffer from each V4L2 queue to form the queued job */
-		spin_lock_irqsave(&node->ready_lock, flags);
 		buf[i] = list_first_entry_or_null(&node->ready_queue,
 						  struct pispbe_buffer,
 						  ready_list);
 		if (buf[i]) {
 			list_del(&buf[i]->ready_list);
-			pispbe->queued_job.buf[i] = buf[i];
+			job->buffers[i] = buf[i];
 		}
-		spin_unlock_irqrestore(&node->ready_lock, flags);
 
 		if (!buf[i] && !ignore_buffers)
 			goto err_return_buffers;
 	}
 
-	pispbe->queued_job.valid = true;
-
 	/* Convert buffers to DMA addresses for the hardware */
 	pispbe_xlate_addrs(pispbe, job, buf);
 
+	scoped_guard(spinlock_irq, &pispbe->hw_lock) {
+		list_add_tail(&job->queue, &pispbe->job_queue);
+	}
+
+	/* Set job to NULL to avoid automatic release due to __free(). */
+	job = NULL;
+
 	return 0;
 
 err_return_buffers:
@@ -551,33 +563,37 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe,
 			continue;
 
 		/* Return the buffer to the ready_list queue */
-		spin_lock_irqsave(&n->ready_lock, flags);
 		list_add(&buf[i]->ready_list, &n->ready_queue);
-		spin_unlock_irqrestore(&n->ready_lock, flags);
 	}
 
-	memset(&pispbe->queued_job, 0, sizeof(pispbe->queued_job));
-
 	return -ENODEV;
 }
 
 static void pispbe_schedule(struct pispbe_dev *pispbe, bool clear_hw_busy)
 {
-	struct pispbe_job_descriptor job;
-	unsigned long flags;
-	int ret;
+	struct pispbe_job_descriptor *job;
+
+	scoped_guard(spinlock_irqsave, &pispbe->hw_lock) {
+		if (clear_hw_busy)
+			pispbe->hw_busy = false;
 
-	spin_lock_irqsave(&pispbe->hw_lock, flags);
+		if (pispbe->hw_busy)
+			return;
 
-	if (clear_hw_busy)
-		pispbe->hw_busy = false;
+		job = list_first_entry_or_null(&pispbe->job_queue,
+					       struct pispbe_job_descriptor,
+					       queue);
+		if (!job)
+			return;
 
-	if (pispbe->hw_busy)
-		goto unlock_and_return;
+		list_del(&job->queue);
 
-	ret = pispbe_prepare_job(pispbe, &job);
-	if (ret)
-		goto unlock_and_return;
+		for (unsigned int i = 0; i < PISPBE_NUM_NODES; i++)
+			pispbe->queued_job.buf[i] = job->buffers[i];
+		pispbe->queued_job.valid = true;
+
+		pispbe->hw_busy = true;
+	}
 
 	/*
 	 * We can kick the job off without the hw_lock, as this can
@@ -585,16 +601,8 @@ static void pispbe_schedule(struct pispbe_dev *pispbe, bool clear_hw_busy)
 	 * only when the following job has been queued and an interrupt
 	 * is rised.
 	 */
-	pispbe->hw_busy = true;
-	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
-
-	pispbe_queue_job(pispbe, &job);
-
-	return;
-
-unlock_and_return:
-	/* No job has been queued, just release the lock and return. */
-	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
+	pispbe_queue_job(pispbe, job);
+	kfree(job);
 }
 
 static void pispbe_isr_jobdone(struct pispbe_dev *pispbe,
@@ -846,18 +854,16 @@ static void pispbe_node_buffer_queue(struct vb2_buffer *buf)
 		container_of(vbuf, struct pispbe_buffer, vb);
 	struct pispbe_node *node = vb2_get_drv_priv(buf->vb2_queue);
 	struct pispbe_dev *pispbe = node->pispbe;
-	unsigned long flags;
 
 	dev_dbg(pispbe->dev, "%s: for node %s\n", __func__, NODE_NAME(node));
-	spin_lock_irqsave(&node->ready_lock, flags);
 	list_add_tail(&buffer->ready_list, &node->ready_queue);
-	spin_unlock_irqrestore(&node->ready_lock, flags);
 
 	/*
 	 * Every time we add a buffer, check if there's now some work for the hw
 	 * to do.
 	 */
-	pispbe_schedule(pispbe, false);
+	if (!pispbe_prepare_job(pispbe))
+		pispbe_schedule(pispbe, false);
 }
 
 static int pispbe_node_start_streaming(struct vb2_queue *q, unsigned int count)
@@ -865,17 +871,16 @@ static int pispbe_node_start_streaming(struct vb2_queue *q, unsigned int count)
 	struct pispbe_node *node = vb2_get_drv_priv(q);
 	struct pispbe_dev *pispbe = node->pispbe;
 	struct pispbe_buffer *buf, *tmp;
-	unsigned long flags;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(pispbe->dev);
 	if (ret < 0)
 		goto err_return_buffers;
 
-	spin_lock_irqsave(&pispbe->hw_lock, flags);
-	node->pispbe->streaming_map |=  BIT(node->id);
-	node->pispbe->sequence = 0;
-	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
+	scoped_guard(spinlock_irq, &pispbe->hw_lock) {
+		node->pispbe->streaming_map |=  BIT(node->id);
+		node->pispbe->sequence = 0;
+	}
 
 	dev_dbg(pispbe->dev, "%s: for node %s (count %u)\n",
 		__func__, NODE_NAME(node), count);
@@ -883,17 +888,16 @@ static int pispbe_node_start_streaming(struct vb2_queue *q, unsigned int count)
 		node->pispbe->streaming_map);
 
 	/* Maybe we're ready to run. */
-	pispbe_schedule(pispbe, false);
+	if (!pispbe_prepare_job(pispbe))
+		pispbe_schedule(pispbe, false);
 
 	return 0;
 
 err_return_buffers:
-	spin_lock_irqsave(&pispbe->hw_lock, flags);
 	list_for_each_entry_safe(buf, tmp, &node->ready_queue, ready_list) {
 		list_del(&buf->ready_list);
 		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
 	}
-	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
 
 	return ret;
 }
@@ -902,8 +906,9 @@ static void pispbe_node_stop_streaming(struct vb2_queue *q)
 {
 	struct pispbe_node *node = vb2_get_drv_priv(q);
 	struct pispbe_dev *pispbe = node->pispbe;
+	struct pispbe_job_descriptor *job, *temp;
 	struct pispbe_buffer *buf;
-	unsigned long flags;
+	LIST_HEAD(tmp_list);
 
 	/*
 	 * Now this is a bit awkward. In a simple M2M device we could just wait
@@ -915,11 +920,7 @@ static void pispbe_node_stop_streaming(struct vb2_queue *q)
 	 * This may return buffers out of order.
 	 */
 	dev_dbg(pispbe->dev, "%s: for node %s\n", __func__, NODE_NAME(node));
-	spin_lock_irqsave(&pispbe->hw_lock, flags);
 	do {
-		unsigned long flags1;
-
-		spin_lock_irqsave(&node->ready_lock, flags1);
 		buf = list_first_entry_or_null(&node->ready_queue,
 					       struct pispbe_buffer,
 					       ready_list);
@@ -927,15 +928,26 @@ static void pispbe_node_stop_streaming(struct vb2_queue *q)
 			list_del(&buf->ready_list);
 			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
 		}
-		spin_unlock_irqrestore(&node->ready_lock, flags1);
 	} while (buf);
-	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
 
 	vb2_wait_for_all_buffers(&node->queue);
 
-	spin_lock_irqsave(&pispbe->hw_lock, flags);
+	spin_lock_irq(&pispbe->hw_lock);
 	pispbe->streaming_map &= ~BIT(node->id);
-	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
+
+	if (pispbe->streaming_map == 0) {
+		/*
+		 * If all nodes have stopped streaming release all jobs
+		 * without holding the lock.
+		 */
+		list_splice_init(&pispbe->job_queue, &tmp_list);
+	}
+	spin_unlock_irq(&pispbe->hw_lock);
+
+	list_for_each_entry_safe(job, temp, &tmp_list, queue) {
+		list_del(&job->queue);
+		kfree(job);
+	}
 
 	pm_runtime_mark_last_busy(pispbe->dev);
 	pm_runtime_put_autosuspend(pispbe->dev);
@@ -1393,7 +1405,6 @@ static int pispbe_init_node(struct pispbe_dev *pispbe, unsigned int id)
 	mutex_init(&node->node_lock);
 	mutex_init(&node->queue_lock);
 	INIT_LIST_HEAD(&node->ready_queue);
-	spin_lock_init(&node->ready_lock);
 
 	node->format.type = node->buf_type;
 	pispbe_node_def_fmt(node);
@@ -1677,6 +1688,8 @@ static int pispbe_probe(struct platform_device *pdev)
 	if (!pispbe)
 		return -ENOMEM;
 
+	INIT_LIST_HEAD(&pispbe->job_queue);
+
 	dev_set_drvdata(&pdev->dev, pispbe);
 	pispbe->dev = &pdev->dev;
 	platform_set_drvdata(pdev, pispbe);

-- 
2.49.0


