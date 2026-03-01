Return-Path: <linux-media+bounces-53875-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNtMAFqVo2l7HQUAu9opvQ
	(envelope-from <linux-media+bounces-53875-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:24:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 827A91CA749
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:24:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8575530B19FB
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB8942620E5;
	Sun,  1 Mar 2026 01:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sQz2hNnV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9F02BD0B;
	Sun,  1 Mar 2026 01:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772327945; cv=none; b=JPdmQBF+9kh6eBqMSFOqQnkTRYk2sKUApYuMTJIAtUrT46TjI9N+cln2ZNmdqI9ONJdUH7+XKDzQf2BOUDQkpsO8NzWhbeyaSMC2KFnip1aajUJLivhBsTtG6mU3Ydi5btODupl4rP8DaG4fmL/sjFdbENJg9Ddi11h2QvDcwQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772327945; c=relaxed/simple;
	bh=ZCyWMa6AQIgi3uS/hVRyohpIwltDmPG4Kom8XbMW4l4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I2jxlrFHFteE/P1C0SNzLMYwKd59l8+YH53Yqn5XwRXYXvmNa5oO8LPFV5fa6Y0W+XInQcZmxbyn7/k5juK4uv0D/fFAW90i7oQA3QXWaTzjVlXzrXH0aSVTgwW4oTwjkZXwebjkx+nxVFtzMTpUbDqUGg22AuyKMK+jvuYektY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sQz2hNnV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD69C19421;
	Sun,  1 Mar 2026 01:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772327945;
	bh=ZCyWMa6AQIgi3uS/hVRyohpIwltDmPG4Kom8XbMW4l4=;
	h=From:To:Cc:Subject:Date:From;
	b=sQz2hNnV06vpCPgU6NMRKgP87UKQ/hxI3JKxyV1B6DFlkLgSdTf7l/Y+ateA31IsH
	 0lEWVpDiuUSp9UM+5TpZtikiKtaMfPMBLHlPVvQRsFsn+nQI8nwx8iJ81dqCH5XID2
	 VwGUs1eKiCOrEB45oj7JIoOGfio+zPqeHxKacqhJI+HHmMpJ2Sr+GkLhnEyoB4VF6W
	 oTN9n2q1jcUX6luAkdt2EawR+NVtBtGB8epuKxoDo8eGWwsPBQsDivPiOsy52DQDq/
	 ZnNjaKDSwaNhIawJPYazCGZl4J4nFjOfKTQ8Fju7VQyUUQ4Rat9WkjHR9632LJFVPp
	 bLxduo+9y2SSQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	jackson.lee@chipsnmedia.com
Cc: Nas Chung <nas.chung@chipsnmedia.com>,
	Brandon Brnich <b-brnich@ti.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: chips-media: wave5: Fix Null reference while testing fluster" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:19:02 -0500
Message-ID: <20260301011903.1673587-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53875-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,ti.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 827A91CA749
X-Rspamd-Action: no action

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From e66ff2b08e4ee1c4d3b84f24818e5bcc178cc3a4 Mon Sep 17 00:00:00 2001
From: Jackson Lee <jackson.lee@chipsnmedia.com>
Date: Wed, 19 Nov 2025 15:25:47 +0900
Subject: [PATCH] media: chips-media: wave5: Fix Null reference while testing
 fluster

When multi instances are created/destroyed, many interrupts happens
and structures for decoder are removed.
"struct vpu_instance" this structure is shared for all flow in the decoder,
so if the structure is not protected by lock, Null dereference
could happens sometimes.
IRQ Handler was spilt to two phases and Lock was added as well.

Fixes: 9707a6254a8a ("media: chips-media: wave5: Add the v4l2 layer")
Cc: stable@vger.kernel.org
Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Tested-by: Brandon Brnich <b-brnich@ti.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 .../platform/chips-media/wave5/wave5-helper.c | 28 +++++-
 .../platform/chips-media/wave5/wave5-helper.h |  1 +
 .../chips-media/wave5/wave5-vpu-dec.c         |  5 +
 .../chips-media/wave5/wave5-vpu-enc.c         |  5 +
 .../platform/chips-media/wave5/wave5-vpu.c    | 97 +++++++++++++++++--
 .../platform/chips-media/wave5/wave5-vpuapi.h |  6 ++
 6 files changed, 131 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/drivers/media/platform/chips-media/wave5/wave5-helper.c
index f03ad9c0de221..53a0ac068c2e2 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
@@ -27,6 +27,11 @@ const char *state_to_str(enum vpu_instance_state state)
 	}
 }
 
+int wave5_kfifo_alloc(struct vpu_instance *inst)
+{
+	return kfifo_alloc(&inst->irq_status, 16 * sizeof(int), GFP_KERNEL);
+}
+
 void wave5_cleanup_instance(struct vpu_instance *inst, struct file *filp)
 {
 	int i;
@@ -49,7 +54,7 @@ void wave5_cleanup_instance(struct vpu_instance *inst, struct file *filp)
 		v4l2_fh_del(&inst->v4l2_fh, filp);
 		v4l2_fh_exit(&inst->v4l2_fh);
 	}
-	list_del_init(&inst->list);
+	kfifo_free(&inst->irq_status);
 	ida_free(&inst->dev->inst_ida, inst->id);
 	kfree(inst->codec_info);
 	kfree(inst);
@@ -61,8 +66,29 @@ int wave5_vpu_release_device(struct file *filp,
 {
 	struct vpu_instance *inst = file_to_vpu_inst(filp);
 	int ret = 0;
+	unsigned long flags;
 
 	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
+	/*
+	 * To prevent Null reference exception, the existing irq handler were
+	 * separated to two modules.
+	 * One is to queue interrupt reason into the irq handler,
+	 * the other is irq_thread to call the wave5_vpu_dec_finish_decode
+	 * to get decoded frame.
+	 * The list of instances should be protected between all flow of the
+	 * decoding process, but to protect the list in the irq_handler, spin lock
+	 * should be used, and mutex should be used in the irq_thread because spin lock
+	 * is not able to be used because mutex is already being used
+	 * in the wave5_vpu_dec_finish_decode.
+	 * So the spin lock and mutex were used to protect the list in the release function.
+	 */
+	ret = mutex_lock_interruptible(&inst->dev->irq_lock);
+	if (ret)
+		return ret;
+	spin_lock_irqsave(&inst->dev->irq_spinlock, flags);
+	list_del_init(&inst->list);
+	spin_unlock_irqrestore(&inst->dev->irq_spinlock, flags);
+	mutex_unlock(&inst->dev->irq_lock);
 	if (inst->state != VPU_INST_STATE_NONE) {
 		u32 fail_res;
 
diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.h b/drivers/media/platform/chips-media/wave5/wave5-helper.h
index 976a402e426ff..d61fdbda359d6 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.h
@@ -33,4 +33,5 @@ void wave5_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp,
 			  unsigned int width,
 			  unsigned int height,
 			  const struct v4l2_frmsize_stepwise *frmsize);
+int wave5_kfifo_alloc(struct vpu_instance *inst);
 #endif
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 528387c6ecf60..b10396fa23798 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1808,6 +1808,11 @@ static int wave5_vpu_open_dec(struct file *filp)
 	inst->xfer_func = V4L2_XFER_FUNC_DEFAULT;
 
 	init_completion(&inst->irq_done);
+	ret = wave5_kfifo_alloc(inst);
+	if (ret) {
+		dev_err(inst->dev->dev, "failed to allocate fifo\n");
+		goto cleanup_inst;
+	}
 
 	inst->id = ida_alloc(&inst->dev->inst_ida, GFP_KERNEL);
 	if (inst->id < 0) {
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 3be79dda3a2e5..e69bef5d1b520 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1757,6 +1757,11 @@ static int wave5_vpu_open_enc(struct file *filp)
 	inst->frame_rate = 30;
 
 	init_completion(&inst->irq_done);
+	ret = wave5_kfifo_alloc(inst);
+	if (ret) {
+		dev_err(inst->dev->dev, "failed to allocate fifo\n");
+		goto cleanup_inst;
+	}
 
 	inst->id = ida_alloc(&inst->dev->inst_ida, GFP_KERNEL);
 	if (inst->id < 0) {
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index 0026f58403620..3216b49976447 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -51,8 +51,11 @@ static void wave5_vpu_handle_irq(void *dev_id)
 	u32 seq_done;
 	u32 cmd_done;
 	u32 irq_reason;
-	struct vpu_instance *inst;
+	u32 irq_subreason;
+	struct vpu_instance *inst, *tmp;
 	struct vpu_device *dev = dev_id;
+	int val;
+	unsigned long flags;
 
 	irq_reason = wave5_vdi_read_register(dev, W5_VPU_VINT_REASON);
 	seq_done = wave5_vdi_read_register(dev, W5_RET_SEQ_DONE_INSTANCE_INFO);
@@ -60,7 +63,8 @@ static void wave5_vpu_handle_irq(void *dev_id)
 	wave5_vdi_write_register(dev, W5_VPU_VINT_REASON_CLR, irq_reason);
 	wave5_vdi_write_register(dev, W5_VPU_VINT_CLEAR, 0x1);
 
-	list_for_each_entry(inst, &dev->instances, list) {
+	spin_lock_irqsave(&dev->irq_spinlock, flags);
+	list_for_each_entry_safe(inst, tmp, &dev->instances, list) {
 
 		if (irq_reason & BIT(INT_WAVE5_INIT_SEQ) ||
 		    irq_reason & BIT(INT_WAVE5_ENC_SET_PARAM)) {
@@ -82,22 +86,54 @@ static void wave5_vpu_handle_irq(void *dev_id)
 		    irq_reason & BIT(INT_WAVE5_ENC_PIC)) {
 			if (cmd_done & BIT(inst->id)) {
 				cmd_done &= ~BIT(inst->id);
-				wave5_vdi_write_register(dev, W5_RET_QUEUE_CMD_DONE_INST,
-							 cmd_done);
-				inst->ops->finish_process(inst);
+				if (dev->irq >= 0) {
+					irq_subreason =
+						wave5_vdi_read_register(dev, W5_VPU_VINT_REASON);
+					if (!(irq_subreason & BIT(INT_WAVE5_DEC_PIC)))
+						wave5_vdi_write_register(dev,
+									 W5_RET_QUEUE_CMD_DONE_INST,
+									 cmd_done);
+				}
+				val = BIT(INT_WAVE5_DEC_PIC);
+				kfifo_in(&inst->irq_status, &val, sizeof(int));
 			}
 		}
+	}
+	spin_unlock_irqrestore(&dev->irq_spinlock, flags);
+
+	if (dev->irq < 0)
+		up(&dev->irq_sem);
+}
+
+static irqreturn_t wave5_vpu_irq(int irq, void *dev_id)
+{
+	struct vpu_device *dev = dev_id;
 
-		wave5_vpu_clear_interrupt(inst, irq_reason);
+	if (wave5_vdi_read_register(dev, W5_VPU_VPU_INT_STS)) {
+		wave5_vpu_handle_irq(dev);
+		return IRQ_WAKE_THREAD;
 	}
+
+	return IRQ_HANDLED;
 }
 
 static irqreturn_t wave5_vpu_irq_thread(int irq, void *dev_id)
 {
 	struct vpu_device *dev = dev_id;
+	struct vpu_instance *inst, *tmp;
+	int irq_status, ret;
 
-	if (wave5_vdi_read_register(dev, W5_VPU_VPU_INT_STS))
-		wave5_vpu_handle_irq(dev);
+	mutex_lock(&dev->irq_lock);
+	list_for_each_entry_safe(inst, tmp, &dev->instances, list) {
+		while (kfifo_len(&inst->irq_status)) {
+			ret = kfifo_out(&inst->irq_status, &irq_status, sizeof(int));
+			if (!ret)
+				break;
+
+			inst->ops->finish_process(inst);
+		}
+	}
+	mutex_unlock(&dev->irq_lock);
 
 	return IRQ_HANDLED;
 }
@@ -121,6 +157,35 @@ static enum hrtimer_restart wave5_vpu_timer_callback(struct hrtimer *timer)
 	return HRTIMER_RESTART;
 }
 
+static int irq_thread(void *data)
+{
+	struct vpu_device *dev = (struct vpu_device *)data;
+	struct vpu_instance *inst, *tmp;
+	int irq_status, ret;
+
+	while (!kthread_should_stop()) {
+		if (down_interruptible(&dev->irq_sem))
+			continue;
+
+		if (kthread_should_stop())
+			break;
+
+		mutex_lock(&dev->irq_lock);
+		list_for_each_entry_safe(inst, tmp, &dev->instances, list) {
+			while (kfifo_len(&inst->irq_status)) {
+				ret = kfifo_out(&inst->irq_status, &irq_status, sizeof(int));
+				if (!ret)
+					break;
+
+				inst->ops->finish_process(inst);
+			}
+		}
+		mutex_unlock(&dev->irq_lock);
+	}
+
+	return 0;
+}
+
 static int wave5_vpu_load_firmware(struct device *dev, const char *fw_name,
 				   u32 *revision)
 {
@@ -224,6 +289,8 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 
 	mutex_init(&dev->dev_lock);
 	mutex_init(&dev->hw_lock);
+	mutex_init(&dev->irq_lock);
+	spin_lock_init(&dev->irq_spinlock);
 	dev_set_drvdata(&pdev->dev, dev);
 	dev->dev = &pdev->dev;
 
@@ -266,9 +333,13 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 	}
 	dev->product = wave5_vpu_get_product_id(dev);
 
+	INIT_LIST_HEAD(&dev->instances);
+
 	dev->irq = platform_get_irq(pdev, 0);
 	if (dev->irq < 0) {
 		dev_err(&pdev->dev, "failed to get irq resource, falling back to polling\n");
+		sema_init(&dev->irq_sem, 1);
+		dev->irq_thread = kthread_run(irq_thread, dev, "irq thread");
 		hrtimer_setup(&dev->hrtimer, &wave5_vpu_timer_callback, CLOCK_MONOTONIC,
 			      HRTIMER_MODE_REL_PINNED);
 		dev->worker = kthread_run_worker(0, "vpu_irq_thread");
@@ -280,7 +351,7 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 		dev->vpu_poll_interval = vpu_poll_interval;
 		kthread_init_work(&dev->work, wave5_vpu_irq_work_fn);
 	} else {
-		ret = devm_request_threaded_irq(&pdev->dev, dev->irq, NULL,
+		ret = devm_request_threaded_irq(&pdev->dev, dev->irq, wave5_vpu_irq,
 						wave5_vpu_irq_thread, IRQF_ONESHOT, "vpu_irq", dev);
 		if (ret) {
 			dev_err(&pdev->dev, "Register interrupt handler, fail: %d\n", ret);
@@ -288,7 +359,6 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 		}
 	}
 
-	INIT_LIST_HEAD(&dev->instances);
 	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "v4l2_device_register, fail: %d\n", ret);
@@ -356,6 +426,12 @@ static void wave5_vpu_remove(struct platform_device *pdev)
 	v4l2_device_unregister(&dev->v4l2_dev);
 
 	if (dev->irq < 0) {
+		if (dev->irq_thread) {
+			kthread_stop(dev->irq_thread);
+			up(&dev->irq_sem);
+			dev->irq_thread = NULL;
+		}
+
 		hrtimer_cancel(&dev->hrtimer);
 		kthread_cancel_work_sync(&dev->work);
 		kthread_destroy_worker(dev->worker);
@@ -366,6 +442,7 @@ static void wave5_vpu_remove(struct platform_device *pdev)
 
 	mutex_destroy(&dev->dev_lock);
 	mutex_destroy(&dev->hw_lock);
+	mutex_destroy(&dev->irq_lock);
 	reset_control_assert(dev->resets);
 	clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
 	wave5_vdi_release(&pdev->dev);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
index 45615c15beca3..bc101397204da 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
@@ -8,6 +8,7 @@
 #ifndef VPUAPI_H_INCLUDED
 #define VPUAPI_H_INCLUDED
 
+#include <linux/kfifo.h>
 #include <linux/idr.h>
 #include <linux/genalloc.h>
 #include <media/v4l2-device.h>
@@ -747,6 +748,7 @@ struct vpu_device {
 	struct video_device *video_dev_enc;
 	struct mutex dev_lock; /* lock for the src, dst v4l2 queues */
 	struct mutex hw_lock; /* lock hw configurations */
+	struct mutex irq_lock;
 	int irq;
 	enum product_id product;
 	struct vpu_attr attr;
@@ -764,7 +766,10 @@ struct vpu_device {
 	struct kthread_worker *worker;
 	int vpu_poll_interval;
 	int num_clks;
+	struct task_struct *irq_thread;
+	struct semaphore irq_sem; /* signal to irq_thread when interrupt happens*/
 	struct reset_control *resets;
+	spinlock_t irq_spinlock; /* protect instances list */
 };
 
 struct vpu_instance;
@@ -788,6 +793,7 @@ struct vpu_instance {
 	enum v4l2_ycbcr_encoding ycbcr_enc;
 	enum v4l2_quantization quantization;
 
+	struct kfifo irq_status;
 	enum vpu_instance_state state;
 	enum vpu_instance_type type;
 	const struct vpu_instance_ops *ops;
-- 
2.51.0





