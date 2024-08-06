Return-Path: <linux-media+bounces-15846-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 800DC949337
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 16:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D0C02811C7
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 14:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2D161BE23A;
	Tue,  6 Aug 2024 14:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UiDAv+7L"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051D818D656
	for <linux-media@vger.kernel.org>; Tue,  6 Aug 2024 14:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722955026; cv=none; b=CNnqCRp/xEZVrMYXsCMwfwWTu/rn5DJVDwpVN5bTSsZc6txqxRd4IVpAhOy9qM7KYj9geDb4moYfpZtbaznuRz+yjZcQgeaGrlRmATK4OkpLrrkJePI7YPX9C9nfbjcoTNnsW1STbLBXpFA2rX76WuB9tEdhIZlDH/e7YvOWgW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722955026; c=relaxed/simple;
	bh=ehw2lfMjZlTUF29tagFelW6+boGhmkXxC7WUMM/4e/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ua5wxWGZumqY2izgbzeCMAOjbDGTE4Qz8q0dQTAPiZsYeWVW5vyX1hwi6cJGrjgSJkrUxfyNrb0kiyme2No3Uhx1+XcuIek1gGn6R6M4738+mvGDgEDmtpBuF0T7djieN+dWAMrg+4YqCFQ2OS6LqydhIU8FP5Oj3B+rR8WqBJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UiDAv+7L; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-91-24-0.net.vodafone.it [5.91.24.0])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCB5C2C5;
	Tue,  6 Aug 2024 16:36:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722954970;
	bh=ehw2lfMjZlTUF29tagFelW6+boGhmkXxC7WUMM/4e/I=;
	h=From:To:Cc:Subject:Date:From;
	b=UiDAv+7Lb0mHHhweGLiY15qXTJ8woyKVsi/Q1GdiPxWdXTPcc+nN7FmeoZCejReTf
	 ycieNNyzAVvTV2yY+xZFYRalKfuG9+A0OKbajkH76ilGwTrS03utUE6TrsGX+P4SZh
	 m+pTfQjMXacey910av/VGuX5Tk1i1xiwV1DNZRzc=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: pisp-be: Split jobs creation and scheduling
Date: Tue,  6 Aug 2024 16:36:51 +0200
Message-ID: <20240806143652.917735-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
context, split the job creation and job scheduling in two distinct
operations. When a well-formed job is created, append it to the
newly introduced 'pispbe->job_queue' where it will be dequeued from
by the scheduling routine.

At start_streaming() and qbuf() time immediately try to schedule a job
if one has been created as the irq handler routine is only called when
a job has completed, and we can't solely rely on it for scheduling new
jobs.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../platform/raspberrypi/pisp_be/pisp_be.c    | 98 +++++++++++++------
 1 file changed, 69 insertions(+), 29 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 65ff2382cffe..ae8b79530e72 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -190,9 +190,11 @@ struct pispbe_hw_enables {

 /* Records a job configuration and memory addresses. */
 struct pispbe_job_descriptor {
+	struct pispbe_buffer *buf[PISPBE_NUM_NODES];
 	dma_addr_t hw_dma_addrs[N_HW_ADDRESSES];
 	struct pisp_be_tiles_config *config;
 	struct pispbe_hw_enables hw_enables;
+	struct list_head queue;
 	dma_addr_t tiles;
 };

@@ -215,8 +217,10 @@ struct pispbe_dev {
 	unsigned int sequence;
 	u32 streaming_map;
 	struct pispbe_job queued_job, running_job;
-	spinlock_t hw_lock; /* protects "hw_busy" flag and streaming_map */
+	/* protects "hw_busy" flag, streaming_map and job queue*/
+	spinlock_t hw_lock;
 	bool hw_busy; /* non-zero if a job is queued or is being started */
+	struct list_head job_queue;
 	int irq;
 	u32 hw_version;
 	u8 done, started;
@@ -443,27 +447,32 @@ static void pispbe_xlate_addrs(struct pispbe_dev *pispbe,
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
 	struct pispbe_buffer *buf[PISPBE_NUM_NODES] = {};
+	struct pispbe_job_descriptor *job;
+	unsigned int streaming_map;
 	unsigned int config_index;
 	struct pispbe_node *node;
 	unsigned long flags;

-	lockdep_assert_held(&pispbe->hw_lock);
-
-	memset(job, 0, sizeof(struct pispbe_job_descriptor));
+	spin_lock_irqsave(&pispbe->hw_lock, flags);
+	streaming_map = pispbe->streaming_map;
+	spin_unlock_irqrestore(&pispbe->hw_lock, flags);

-	if (((BIT(CONFIG_NODE) | BIT(MAIN_INPUT_NODE)) &
-		pispbe->streaming_map) !=
-			(BIT(CONFIG_NODE) | BIT(MAIN_INPUT_NODE)))
+	if (((BIT(CONFIG_NODE) | BIT(MAIN_INPUT_NODE)) & streaming_map) !=
+	    (BIT(CONFIG_NODE) | BIT(MAIN_INPUT_NODE)))
 		return -ENODEV;

+	job = kzalloc(sizeof(*job), GFP_KERNEL);
+	if (!job)
+		return -ENOMEM;
+
 	node = &pispbe->node[CONFIG_NODE];
 	spin_lock_irqsave(&node->ready_lock, flags);
 	buf[CONFIG_NODE] = list_first_entry_or_null(&node->ready_queue,
@@ -471,13 +480,15 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe,
 						    ready_list);
 	if (buf[CONFIG_NODE]) {
 		list_del(&buf[CONFIG_NODE]->ready_list);
-		pispbe->queued_job.buf[CONFIG_NODE] = buf[CONFIG_NODE];
+		job->buf[CONFIG_NODE] = buf[CONFIG_NODE];
 	}
 	spin_unlock_irqrestore(&node->ready_lock, flags);

 	/* Exit early if no config buffer has been queued. */
-	if (!buf[CONFIG_NODE])
+	if (!buf[CONFIG_NODE]) {
+		kfree(job);
 		return -ENODEV;
+	}

 	config_index = buf[CONFIG_NODE]->vb.vb2_buf.index;
 	job->config = &pispbe->config[config_index];
@@ -498,7 +509,7 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe,
 			continue;

 		buf[i] = NULL;
-		if (!(pispbe->streaming_map & BIT(i)))
+		if (!(streaming_map & BIT(i)))
 			continue;

 		if ((!(rgb_en & PISP_BE_RGB_ENABLE_OUTPUT0) &&
@@ -531,7 +542,7 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe,
 						  ready_list);
 		if (buf[i]) {
 			list_del(&buf[i]->ready_list);
-			pispbe->queued_job.buf[i] = buf[i];
+			job->buf[i] = buf[i];
 		}
 		spin_unlock_irqrestore(&node->ready_lock, flags);

@@ -539,11 +550,13 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe,
 			goto err_return_buffers;
 	}

-	pispbe->queued_job.valid = true;
-
 	/* Convert buffers to DMA addresses for the hardware */
 	pispbe_xlate_addrs(pispbe, job, buf);

+	spin_lock_irqsave(&pispbe->hw_lock, flags);
+	list_add_tail(&job->queue, &pispbe->job_queue);
+	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
+
 	return 0;

 err_return_buffers:
@@ -559,16 +572,15 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe,
 		spin_unlock_irqrestore(&n->ready_lock, flags);
 	}

-	memset(&pispbe->queued_job, 0, sizeof(pispbe->queued_job));
+	kfree(job);

 	return -ENODEV;
 }

 static void pispbe_schedule(struct pispbe_dev *pispbe, bool clear_hw_busy)
 {
-	struct pispbe_job_descriptor job;
+	struct pispbe_job_descriptor *job;
 	unsigned long flags;
-	int ret;

 	spin_lock_irqsave(&pispbe->hw_lock, flags);

@@ -578,10 +590,18 @@ static void pispbe_schedule(struct pispbe_dev *pispbe, bool clear_hw_busy)
 	if (pispbe->hw_busy)
 		goto unlock_and_return;

-	ret = pispbe_prepare_job(pispbe, &job);
-	if (ret)
+	job = list_first_entry_or_null(&pispbe->job_queue,
+				       struct pispbe_job_descriptor,
+				       queue);
+	if (!job)
 		goto unlock_and_return;

+	list_del(&job->queue);
+
+	for (unsigned int i = 0; i < PISPBE_NUM_NODES; i++)
+		pispbe->queued_job.buf[i] = job->buf[i];
+	pispbe->queued_job.valid = true;
+
 	/*
 	 * We can kick the job off without the hw_lock, as this can
 	 * never run again until hw_busy is cleared, which will happen
@@ -591,9 +611,9 @@ static void pispbe_schedule(struct pispbe_dev *pispbe, bool clear_hw_busy)
 	pispbe->hw_busy = true;
 	spin_unlock_irqrestore(&pispbe->hw_lock, flags);

-	if (job.config->num_tiles <= 0 ||
-	    job.config->num_tiles > PISP_BACK_END_NUM_TILES ||
-	    !((job.hw_enables.bayer_enables | job.hw_enables.rgb_enables) &
+	if (job->config->num_tiles <= 0 ||
+	    job->config->num_tiles > PISP_BACK_END_NUM_TILES ||
+	    !((job->hw_enables.bayer_enables | job->hw_enables.rgb_enables) &
 	      PISP_BE_BAYER_ENABLE_INPUT)) {
 		/*
 		 * Bad job. We can't let it proceed as it could lock up
@@ -605,11 +625,12 @@ static void pispbe_schedule(struct pispbe_dev *pispbe, bool clear_hw_busy)
 		 * but we seem to survive...
 		 */
 		dev_dbg(pispbe->dev, "Bad job: invalid number of tiles: %u\n",
-			job.config->num_tiles);
-		job.config->num_tiles = 0;
+			job->config->num_tiles);
+		job->config->num_tiles = 0;
 	}

-	pispbe_queue_job(pispbe, &job);
+	pispbe_queue_job(pispbe, job);
+	kfree(job);

 	return;

@@ -871,7 +892,8 @@ static void pispbe_node_buffer_queue(struct vb2_buffer *buf)
 	 * Every time we add a buffer, check if there's now some work for the hw
 	 * to do.
 	 */
-	pispbe_schedule(pispbe, false);
+	if (!pispbe_prepare_job(pispbe))
+		pispbe_schedule(pispbe, false);
 }

 static int pispbe_node_start_streaming(struct vb2_queue *q, unsigned int count)
@@ -897,7 +919,8 @@ static int pispbe_node_start_streaming(struct vb2_queue *q, unsigned int count)
 		node->pispbe->streaming_map);

 	/* Maybe we're ready to run. */
-	pispbe_schedule(pispbe, false);
+	if (!pispbe_prepare_job(pispbe))
+		pispbe_schedule(pispbe, false);

 	return 0;

@@ -949,6 +972,21 @@ static void pispbe_node_stop_streaming(struct vb2_queue *q)

 	spin_lock_irqsave(&pispbe->hw_lock, flags);
 	pispbe->streaming_map &= ~BIT(node->id);
+
+	/* Release all jobs once all nodes have stopped streaming. */
+	if (pispbe->streaming_map == 0) {
+		struct pispbe_job_descriptor *job;
+
+		do {
+			job = list_first_entry_or_null(&pispbe->job_queue,
+						struct pispbe_job_descriptor,
+						queue);
+			if (job) {
+				list_del(&job->queue);
+				kfree(job);
+			}
+		} while (!list_empty(&pispbe->job_queue));
+	}
 	spin_unlock_irqrestore(&pispbe->hw_lock, flags);

 	pm_runtime_mark_last_busy(pispbe->dev);
@@ -1691,6 +1729,8 @@ static int pispbe_probe(struct platform_device *pdev)
 	if (!pispbe)
 		return -ENOMEM;

+	INIT_LIST_HEAD(&pispbe->job_queue);
+
 	dev_set_drvdata(&pdev->dev, pispbe);
 	pispbe->dev = &pdev->dev;
 	platform_set_drvdata(pdev, pispbe);
--
2.45.2


