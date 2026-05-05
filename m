Return-Path: <linux-media+bounces-60431-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBbEL8D6+WmNFgMAu9opvQ
	(envelope-from <linux-media+bounces-60431-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:12:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D1F4CF251
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:12:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 989343054C30
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 14:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A006947F2F0;
	Tue,  5 May 2026 14:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PINFyNvo"
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5E631F999;
	Tue,  5 May 2026 14:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777989965; cv=none; b=tRkzIjXmIcqUlrxw0fvJ4jaA6eMA508hkArszJQZdcsd5Ye5SF6aJn9oOY/w+1NwDcyFLIseoFtjpTkiIPmuVr63s1IALPSfWasqYImRHCD+dTJ/jdM+DsAJoVzRwwcOOaNPcAUSEvF0SdffP+GIJRbpGJ+ZbBn/FgyiV1N2PFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777989965; c=relaxed/simple;
	bh=Zwi3WoIZECOgNRRwthXmM8rbKrBdCiBAc6flCCLl+ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GI14xTeVWWcNVHlkYCLXZL41s4nZgaCnnUd4i/pPb7sMnlM6M6BvKZ+aFEiAOsRcZoSJKSh76hRHorCeOd6t5AJirF/o1ccTk2p54EQLHgEvlmqzNKFZxnteflwBesc9WJnhvWvkoCr5od2kcZRTm9IhSO61xY80/dja4Nwnpvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=PINFyNvo; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD75C2681;
	Tue,  5 May 2026 07:05:56 -0700 (PDT)
Received: from e120398-lin.trondheim.arm.com (e120398-lin.trondheim.arm.com [10.42.46.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 392773F763;
	Tue,  5 May 2026 07:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777989962; bh=Zwi3WoIZECOgNRRwthXmM8rbKrBdCiBAc6flCCLl+ac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PINFyNvoT8+uh5kakncZS923wjjpuDPi8rzzahnzQE4FEKrBZcB1DxUJw067ICE4E
	 +KMihhgO3w7qbq3CPe4XBqLFq8Kj6oVrEKE+ALOZHWRb8xyMY6YWJ07bFjb+WLWoG8
	 p6TeRjMJz7rWUj2t+XRSQOPFyPYtk6PgKK9LBAQ8=
From: Ketil Johnsen <ketil.johnsen@arm.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Florent Tomasin <florent.tomasin@arm.com>,
	Paul Toadere <paul.toadere@arm.com>,
	Samuel Percival <samuel.percival@arm.com>,
	Ketil Johnsen <ketil.johnsen@arm.com>
Subject: [PATCH 7/8] drm/panthor: Add support for entering and exiting protected mode
Date: Tue,  5 May 2026 16:05:13 +0200
Message-ID: <20260505140516.1372388-8-ketil.johnsen@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505140516.1372388-1-ketil.johnsen@arm.com>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 15D1F4CF251
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lwn.net,linuxfoundation.org,linaro.org,collabora.com,arm.com,google.com,amd.com];
	RCPT_COUNT_TWELVE(0.00)[31];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60431-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ketil.johnsen@arm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email,arm.com:dkim,arm.com:mid]

From: Florent Tomasin <florent.tomasin@arm.com>

This patch modifies the Panthor driver code to allow handling
of the GPU HW protected mode enter and exit.

The logic added by this patch includes:
- the mechanisms needed for entering and exiting protected mode.
- the handling of protected mode IRQs and FW interactions.
- the scheduler changes needed to decide when to enter
  protected mode based on CSG scheduling.

Note that the submission of a protected mode jobs are done
from the user space.

The following is a summary of how protected mode is entered
and exited:
- When the GPU detects a protected mode job needs to be
  executed, an IRQ is sent to the CPU to notify the kernel
  driver that the job is blocked until the GPU has entered
  protected mode. The entering of protected mode is controlled
  by the kernel driver.
- The Mali Panthor CSF driver will schedule a tick and evaluate
  which CS in the CSG to schedule on slot needs protected mode.
  If the priority of the CSG is not sufficiently high, the
  protected mode job will not progress until the CSG is
  scheduled at top priority.
- The Panthor scheduler notifies the GPU that the blocked
  protected jobs will soon be able to progress.
- Once all CSG and CS slots are updated, the scheduler
  requests the GPU to enter protected mode and waits for
  it to be acknowledged.
- If successful, all protected mode jobs will resume execution
  while normal mode jobs block until the GPU exits
  protected mode, or the kernel driver rotates the CSGs
  and forces the GPU to exit protected mode.
- If unsuccessful, the scheduler will request a GPU reset.
- When a protected mode job is suspended as a result of
  the CSGs rotation, the GPU will send an IRQ to the CPU
  to notify that the protected mode job needs to resume.

This sequence will continue so long the user space is
submitting protected mode jobs.

Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>
Co-developed-by: Paul Toadere <paul.toadere@arm.com>
Signed-off-by: Paul Toadere <paul.toadere@arm.com>
Co-developed-by: Samuel Percival <samuel.percival@arm.com>
Signed-off-by: Samuel Percival <samuel.percival@arm.com>
Co-developed-by: Ketil Johnsen <ketil.johnsen@arm.com>
Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.c |   1 +
 drivers/gpu/drm/panthor/panthor_device.h |   9 +
 drivers/gpu/drm/panthor/panthor_fw.c     |  86 ++++++++-
 drivers/gpu/drm/panthor/panthor_fw.h     |   5 +
 drivers/gpu/drm/panthor/panthor_gpu.c    |  14 +-
 drivers/gpu/drm/panthor/panthor_gpu.h    |   6 +
 drivers/gpu/drm/panthor/panthor_mmu.c    |  10 +
 drivers/gpu/drm/panthor/panthor_sched.c  | 224 +++++++++++++++++++++--
 8 files changed, 339 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 3a5cdfa99e5fe..449f17b0f4c5c 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -207,6 +207,7 @@ int panthor_device_init(struct panthor_device *ptdev)
 
 	ptdev->soc_data = of_device_get_match_data(ptdev->base.dev);
 
+	init_rwsem(&ptdev->protm.lock);
 	init_completion(&ptdev->unplug.done);
 	ret = drmm_mutex_init(&ptdev->base, &ptdev->unplug.lock);
 	if (ret)
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index d51fec97fc5fa..ebeec45cf60a1 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -334,6 +334,15 @@ struct panthor_device {
 	struct {
 		/** @heap: Pointer to the protected heap */
 		struct dma_heap *heap;
+
+		/**
+		 * @lock: Lock to prevent VM operations during protected mode.
+		 *
+		 * The MMU will not execute commands when the GPU is in
+		 * protected mode, so we use this RW lock to sync access
+		 * between VM_BIND and GPU protected mode.
+		 */
+		struct rw_semaphore lock;
 	} protm;
 };
 
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 1aba29b9779b6..281556530ddab 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1057,7 +1057,9 @@ static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
 					 GLB_CFG_PROGRESS_TIMER |
 					 GLB_CFG_POWEROFF_TIMER |
 					 GLB_IDLE_EN |
-					 GLB_IDLE;
+					 GLB_IDLE |
+					 GLB_PROTM_ENTER |
+					 GLB_PROTM_EXIT;
 
 	if (panthor_fw_has_glb_state(ptdev))
 		glb_iface->input->ack_irq_mask |= GLB_STATE_MASK;
@@ -1456,6 +1458,88 @@ static void panthor_fw_ping_work(struct work_struct *work)
 	}
 }
 
+int panthor_fw_protm_enter(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface;
+	u32 acked;
+	u32 status;
+	int ret;
+
+	down_write(&ptdev->protm.lock);
+
+	glb_iface = panthor_fw_get_glb_iface(ptdev);
+
+	panthor_fw_toggle_reqs(glb_iface, req, ack, GLB_PROTM_ENTER);
+	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
+
+	ret = panthor_fw_glb_wait_acks(ptdev, GLB_PROTM_ENTER, &acked, 4000);
+	if (ret) {
+		drm_err(&ptdev->base, "Wait for FW protected mode acknowledge timed out");
+		up_write(&ptdev->protm.lock);
+		return ret;
+	}
+
+	/* Wait for the GPU to actually enter protected mode.
+	 * There would be some time gap between FW sending the
+	 * ACK for GLB_PROTM_ENTER and GPU entering protected mode.
+	 */
+	if (gpu_read_poll_timeout(ptdev, GPU_STATUS, status,
+				  (status & GPU_STATUS_PROTM_ACTIVE) ||
+					  ((glb_iface->input->req ^ glb_iface->output->ack) &
+					   GLB_PROTM_EXIT),
+				  10, 500000)) {
+		drm_err(&ptdev->base, "Wait for GPU protected mode enter timed out");
+		ret = -ETIMEDOUT;
+	}
+
+	up_write(&ptdev->protm.lock);
+
+	return ret;
+}
+
+void panthor_fw_protm_exit(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+
+	/* Acknowledge the protm exit. */
+	panthor_fw_update_reqs(glb_iface, req, glb_iface->output->ack, GLB_PROTM_EXIT);
+}
+
+int panthor_fw_protm_exit_wait_event_timeout(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+	int ret = 0;
+
+	/* Send PING request to force an exit */
+	panthor_fw_toggle_reqs(glb_iface, req, ack, GLB_PING);
+	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
+
+	ret = wait_event_timeout(ptdev->fw->req_waitqueue,
+				 !(gpu_read(ptdev, GPU_STATUS) & GPU_STATUS_PROTM_ACTIVE),
+				 msecs_to_jiffies(500));
+
+	if (!ret) {
+		drm_err(&ptdev->base, "Wait for forced protected mode exit timed out");
+		panthor_device_schedule_reset(ptdev);
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+void panthor_fw_protm_exit_sync(struct panthor_device *ptdev)
+{
+	u32 status;
+
+	/* Busy-wait (5ms) for FW to exit protected mode on its own */
+	if (!gpu_read_poll_timeout(ptdev, GPU_STATUS, status,
+				   !(status & GPU_STATUS_PROTM_ACTIVE), 10,
+				   5000))
+		return;
+
+	panthor_fw_protm_exit_wait_event_timeout(ptdev);
+}
+
 /**
  * panthor_fw_init() - Initialize FW related data.
  * @ptdev: Device.
diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
index 0cf3761abf789..cf6193eadea12 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.h
+++ b/drivers/gpu/drm/panthor/panthor_fw.h
@@ -502,6 +502,11 @@ int panthor_fw_glb_wait_acks(struct panthor_device *ptdev, u32 req_mask, u32 *ac
 
 void panthor_fw_ring_csg_doorbells(struct panthor_device *ptdev, u32 csg_slot);
 
+int panthor_fw_protm_enter(struct panthor_device *ptdev);
+void panthor_fw_protm_exit(struct panthor_device *ptdev);
+void panthor_fw_protm_exit_sync(struct panthor_device *ptdev);
+int panthor_fw_protm_exit_wait_event_timeout(struct panthor_device *ptdev);
+
 struct panthor_kernel_bo *
 panthor_fw_alloc_queue_iface_mem(struct panthor_device *ptdev,
 				 struct panthor_fw_ringbuf_input_iface **input,
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 2ab444ee8c710..e93042eaf3fc8 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -100,8 +100,11 @@ static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
 			 fault_status, panthor_exception_name(ptdev, fault_status & 0xFF),
 			 address);
 	}
-	if (status & GPU_IRQ_PROTM_FAULT)
+	if (status & GPU_IRQ_PROTM_FAULT) {
 		drm_warn(&ptdev->base, "GPU Fault in protected mode\n");
+		panthor_gpu_disable_protm_fault_interrupt(ptdev);
+		panthor_device_schedule_reset(ptdev);
+	}
 
 	spin_lock(&ptdev->gpu->reqs_lock);
 	if (status & ptdev->gpu->pending_reqs) {
@@ -367,6 +370,10 @@ int panthor_gpu_soft_reset(struct panthor_device *ptdev)
 	unsigned long flags;
 
 	spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
+
+	/** Re-enable the protm_irq_fault when reset is complete */
+	ptdev->gpu->irq.mask |= GPU_IRQ_PROTM_FAULT;
+
 	if (!drm_WARN_ON(&ptdev->base,
 			 ptdev->gpu->pending_reqs & GPU_IRQ_RESET_COMPLETED)) {
 		ptdev->gpu->pending_reqs |= GPU_IRQ_RESET_COMPLETED;
@@ -427,3 +434,8 @@ void panthor_gpu_resume(struct panthor_device *ptdev)
 	panthor_hw_l2_power_on(ptdev);
 }
 
+void panthor_gpu_disable_protm_fault_interrupt(struct panthor_device *ptdev)
+{
+	scoped_guard(spinlock_irqsave, &ptdev->gpu->reqs_lock)
+		ptdev->gpu->irq.mask &= ~GPU_IRQ_PROTM_FAULT;
+}
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.h b/drivers/gpu/drm/panthor/panthor_gpu.h
index 12c263a399281..ca66c73f543e6 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.h
+++ b/drivers/gpu/drm/panthor/panthor_gpu.h
@@ -54,4 +54,10 @@ int panthor_gpu_soft_reset(struct panthor_device *ptdev);
 void panthor_gpu_power_changed_off(struct panthor_device *ptdev);
 int panthor_gpu_power_changed_on(struct panthor_device *ptdev);
 
+/**
+ * panthor_gpu_disable_protm_fault_interrupt() - Disable GPU_PROTECTED_FAULT interrupt
+ * @ptdev: Device.
+ */
+void panthor_gpu_disable_protm_fault_interrupt(struct panthor_device *ptdev);
+
 #endif
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 07f54176ec1bf..702f537905b56 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -31,6 +31,7 @@
 #include <linux/sizes.h>
 
 #include "panthor_device.h"
+#include "panthor_fw.h"
 #include "panthor_gem.h"
 #include "panthor_gpu.h"
 #include "panthor_heap.h"
@@ -1704,8 +1705,12 @@ static int panthor_vm_lock_region(struct panthor_vm *vm, u64 start, u64 size)
 	if (drm_WARN_ON(&ptdev->base, vm->locked_region.size))
 		return -EINVAL;
 
+	down_read(&ptdev->protm.lock);
+
 	mutex_lock(&ptdev->mmu->as.slots_lock);
 	if (vm->as.id >= 0 && size) {
+		panthor_fw_protm_exit_sync(ptdev);
+
 		/* Lock the region that needs to be updated */
 		gpu_write64(ptdev, AS_LOCKADDR(vm->as.id),
 			    pack_region_range(ptdev, &start, &size));
@@ -1720,6 +1725,9 @@ static int panthor_vm_lock_region(struct panthor_vm *vm, u64 start, u64 size)
 	}
 	mutex_unlock(&ptdev->mmu->as.slots_lock);
 
+	if (ret)
+		up_read(&ptdev->protm.lock);
+
 	return ret;
 }
 
@@ -1805,6 +1813,8 @@ static void panthor_vm_unlock_region(struct panthor_vm *vm)
 	vm->locked_region.start = 0;
 	vm->locked_region.size = 0;
 	mutex_unlock(&ptdev->mmu->as.slots_lock);
+
+	up_read(&ptdev->protm.lock);
 }
 
 static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 987072bd867c4..acb04250c7def 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -308,6 +308,15 @@ struct panthor_scheduler {
 		 */
 		struct list_head stopped_groups;
 	} reset;
+
+	/** @protm: Protected mode related fields. */
+	struct {
+		/** @protected_mode: True if GPU is in protected mode. */
+		bool protected_mode;
+
+		/** @active_group: The active protected group. */
+		struct panthor_group *active_group;
+	} protm;
 };
 
 /**
@@ -570,6 +579,16 @@ struct panthor_group {
 	/** @fatal_queues: Bitmask reflecting the queues that hit a fatal exception. */
 	u32 fatal_queues;
 
+	/**
+	 * @protm_pending_queues: Bitmask reflecting the queues that are waiting
+	 *                        on a CS_PROTM_PENDING.
+	 *
+	 * The GPU will set the bit associated to the queue pending protected mode
+	 * when a PROT_REGION command is executing or when trying to resume previously
+	 * suspended protected mode jobs.
+	 */
+	u32 protm_pending_queues;
+
 	/** @tiler_oom: Mask of queues that have a tiler OOM event to process. */
 	atomic_t tiler_oom;
 
@@ -1176,6 +1195,7 @@ queue_resume_timeout(struct panthor_queue *queue)
  * @ptdev: Device.
  * @csg_id: Group slot ID.
  * @cs_id: Queue slot ID.
+ * @protm_ack: Acknowledge pending protected mode queues
  *
  * Program a queue slot with the queue information so things can start being
  * executed on this queue.
@@ -1472,6 +1492,34 @@ csg_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 priority)
 	return 0;
 }
 
+static void
+cs_slot_process_protm_pending_event_locked(struct panthor_device *ptdev,
+					   u32 csg_id, u32 cs_id)
+{
+	struct panthor_scheduler *sched = ptdev->scheduler;
+	struct panthor_csg_slot *csg_slot = &sched->csg_slots[csg_id];
+	struct panthor_group *group = csg_slot->group;
+
+	lockdep_assert_held(&sched->lock);
+
+	if (!group)
+		return;
+
+	/* No protected memory heap, a user space program tried to
+	 * submit a protected mode jobs resulting in the GPU raising
+	 * a CS_PROTM_PENDING request.
+	 *
+	 * This scenario is invalid and the protected mode jobs must
+	 * not be allowed to progress.
+	 */
+	if (!ptdev->protm.heap)
+		return;
+
+	group->protm_pending_queues |= BIT(cs_id);
+
+	sched_queue_delayed_work(sched, tick, 0);
+}
+
 static void
 cs_slot_process_fatal_event_locked(struct panthor_device *ptdev,
 				   u32 csg_id, u32 cs_id)
@@ -1718,6 +1766,9 @@ static bool cs_slot_process_irq_locked(struct panthor_device *ptdev,
 	if (events & CS_TILER_OOM)
 		cs_slot_process_tiler_oom_event_locked(ptdev, csg_id, cs_id);
 
+	if (events & CS_PROTM_PENDING)
+		cs_slot_process_protm_pending_event_locked(ptdev, csg_id, cs_id);
+
 	/* We don't acknowledge the TILER_OOM event since its handling is
 	 * deferred to a separate work.
 	 */
@@ -1848,6 +1899,17 @@ static void sched_process_idle_event_locked(struct panthor_device *ptdev)
 	sched_queue_delayed_work(ptdev->scheduler, tick, 0);
 }
 
+static void sched_process_protm_exit_event_locked(struct panthor_device *ptdev)
+{
+	lockdep_assert_held(&ptdev->scheduler->lock);
+
+	/* Acknowledge the protm exit and schedule a tick. */
+	panthor_fw_protm_exit(ptdev);
+	sched_queue_delayed_work(ptdev->scheduler, tick, 0);
+	ptdev->scheduler->protm.protected_mode = false;
+	ptdev->scheduler->protm.active_group = NULL;
+}
+
 /**
  * sched_process_global_irq_locked() - Process the scheduling part of a global IRQ
  * @ptdev: Device.
@@ -1863,6 +1925,9 @@ static void sched_process_global_irq_locked(struct panthor_device *ptdev)
 	ack = READ_ONCE(glb_iface->output->ack);
 	evts = (req ^ ack) & GLB_EVT_MASK;
 
+	if (evts & GLB_PROTM_EXIT)
+		sched_process_protm_exit_event_locked(ptdev);
+
 	if (evts & GLB_IDLE)
 		sched_process_idle_event_locked(ptdev);
 }
@@ -1872,23 +1937,71 @@ static void process_fw_events_work(struct work_struct *work)
 	struct panthor_scheduler *sched = container_of(work, struct panthor_scheduler,
 						      fw_events_work);
 	u32 events = atomic_xchg(&sched->fw_events, 0);
+	u32 csg_events = events & ~JOB_INT_GLOBAL_IF;
 	struct panthor_device *ptdev = sched->ptdev;
 
 	mutex_lock(&sched->lock);
 
+	while (csg_events) {
+		u32 csg_id = ffs(csg_events) - 1;
+
+		sched_process_csg_irq_locked(ptdev, csg_id);
+		csg_events &= ~BIT(csg_id);
+	}
+
 	if (events & JOB_INT_GLOBAL_IF) {
 		sched_process_global_irq_locked(ptdev);
 		events &= ~JOB_INT_GLOBAL_IF;
 	}
 
-	while (events) {
-		u32 csg_id = ffs(events) - 1;
+	mutex_unlock(&sched->lock);
+}
 
-		sched_process_csg_irq_locked(ptdev, csg_id);
-		events &= ~BIT(csg_id);
+static void handle_protm_fault(struct panthor_device *ptdev)
+{
+	struct panthor_scheduler *sched = ptdev->scheduler;
+	u32 csg_id;
+	struct panthor_group *protm_group;
+
+	guard(mutex)(&sched->lock);
+
+	if (!sched->protm.protected_mode)
+		return;
+
+	protm_group = sched->protm.active_group;
+
+	if (drm_WARN_ON(&ptdev->base, !protm_group))
+		return;
+
+	/* Group will be terminated by the device reset */
+	protm_group->fatal_queues |= GENMASK(protm_group->queue_count - 1, 0);
+
+	if (!panthor_fw_protm_exit_wait_event_timeout(ptdev))
+		goto cleanup_protm;
+
+	/**
+	 * GPU failed to exit protected mode. Mark all non-protected mode CSGs
+	 * as suspended so that they are unaffected by the GPU reset.
+	 */
+
+	for (csg_id = 0; csg_id < sched->csg_slot_count; csg_id++) {
+		struct panthor_group *group = sched->csg_slots[csg_id].group;
+
+		if (!group || group == protm_group)
+			continue;
+
+		group->state = PANTHOR_CS_GROUP_SUSPENDED;
+
+		group_unbind_locked(group);
+
+		list_move(&group->run_node, group_is_idle(group) ?
+						&sched->groups.idle[group->priority] :
+						&sched->groups.runnable[group->priority]);
 	}
 
-	mutex_unlock(&sched->lock);
+cleanup_protm:
+	sched->protm.protected_mode = false;
+	sched->protm.active_group = NULL;
 }
 
 /**
@@ -2029,6 +2142,7 @@ struct panthor_sched_tick_ctx {
 	bool immediate_tick;
 	bool stop_tick;
 	u32 csg_upd_failed_mask;
+	struct panthor_group *protm_group;
 };
 
 static bool
@@ -2299,6 +2413,7 @@ tick_ctx_evict_group(struct panthor_scheduler *sched,
 
 static void
 tick_ctx_reschedule_group(struct panthor_scheduler *sched,
+			  struct panthor_sched_tick_ctx *ctx,
 			  struct panthor_csg_slots_upd_ctx *upd_ctx,
 			  struct panthor_group *group,
 			  int new_csg_prio)
@@ -2321,6 +2436,30 @@ tick_ctx_reschedule_group(struct panthor_scheduler *sched,
 					csg_iface->output->ack ^ CSG_ENDPOINT_CONFIG,
 					CSG_ENDPOINT_CONFIG);
 	}
+
+	if (ctx->protm_group == group) {
+		for (u32 q = 0; q < group->queue_count; q++) {
+			struct panthor_fw_cs_iface *cs_iface;
+
+			if (!(group->protm_pending_queues & BIT(q)))
+				continue;
+
+			cs_iface = panthor_fw_get_cs_iface(ptdev, group->csg_id, q);
+			panthor_fw_update_reqs(cs_iface, req, cs_iface->output->ack,
+					       CS_PROTM_PENDING);
+		}
+
+		panthor_fw_toggle_reqs(csg_iface, doorbell_req, doorbell_ack,
+				       group->protm_pending_queues);
+		csgs_upd_ctx_ring_doorbell(upd_ctx, group->csg_id);
+		group->protm_pending_queues = 0;
+
+		/*
+		 * We only allow one protected group to run at same time,
+		 * as it makes it easier to handle faults in protected mode.
+		 */
+		sched->protm.active_group = group;
+	}
 }
 
 static void
@@ -2336,6 +2475,17 @@ tick_ctx_schedule_group(struct panthor_scheduler *sched,
 	group_bind_locked(group, csg_id);
 	csg_slot_prog_locked(ptdev, csg_id, csg_prio);
 
+	/* If the group was waiting for protected mode before suspension,
+	 * and the tick context enters this mode, it should be serviced
+	 * immediately because the slot reset should have set the
+	 * CS_PROTM_PENDING bit to zero, and cs_prog_slot_locked() sets it to
+	 * zero too.
+	 * It's not clear if we will get a new CS_PROTM_PENDING event in that
+	 * case, but it should be safe either way.
+	 */
+	if (group->protm_pending_queues && ctx->protm_group)
+		group->protm_pending_queues = 0;
+
 	csgs_upd_ctx_queue_reqs(ptdev, upd_ctx, csg_id,
 				group->state == PANTHOR_CS_GROUP_SUSPENDED ?
 				CSG_STATE_RESUME : CSG_STATE_START,
@@ -2365,7 +2515,7 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
 
 		/* Update priorities on already running groups. */
 		list_for_each_entry(group, &ctx->groups[prio], run_node) {
-			tick_ctx_reschedule_group(sched, &upd_ctx, group, new_csg_prio--);
+			tick_ctx_reschedule_group(sched, ctx, &upd_ctx, group, new_csg_prio--);
 		}
 	}
 
@@ -2457,6 +2607,15 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
 
 	sched->used_csg_slot_count = ctx->group_count;
 	sched->might_have_idle_groups = ctx->idle_group_count > 0;
+
+	if (ctx->protm_group) {
+		ret = panthor_fw_protm_enter(ptdev);
+		if (ret) {
+			panthor_device_schedule_reset(ptdev);
+			ctx->csg_upd_failed_mask = U32_MAX;
+		}
+		sched->protm.protected_mode = true;
+	}
 }
 
 static u64
@@ -2490,7 +2649,7 @@ static void tick_work(struct work_struct *work)
 	u64 resched_target = sched->resched_target;
 	u64 remaining_jiffies = 0, resched_delay;
 	u64 now = get_jiffies_64();
-	int prio, ret, cookie;
+	int prio, protm_prio, ret, cookie;
 	bool full_tick;
 
 	if (!drm_dev_enter(&ptdev->base, &cookie))
@@ -2564,14 +2723,49 @@ static void tick_work(struct work_struct *work)
 		}
 	}
 
+	/* Check if the highest priority group want to switch to protected mode */
+	for (protm_prio = PANTHOR_CSG_PRIORITY_COUNT - 1; protm_prio >= 0; protm_prio--) {
+		struct panthor_group *group;
+
+		group = list_first_entry_or_null(&ctx.groups[protm_prio],
+						 struct panthor_group,
+						 run_node);
+		if (group) {
+			ctx.protm_group = group;
+			break;
+		}
+	}
+
 	/* If we have free CSG slots left, pick idle groups */
-	for (prio = PANTHOR_CSG_PRIORITY_COUNT - 1;
-	     prio >= 0 && !tick_ctx_is_full(sched, &ctx);
-	     prio--) {
-		/* Check the old_group queue first to avoid reprogramming the slots */
-		tick_ctx_pick_groups_from_list(sched, &ctx, &ctx.old_groups[prio], false, true);
-		tick_ctx_pick_groups_from_list(sched, &ctx, &sched->groups.idle[prio],
-					       false, false);
+	if (ctx.protm_group) {
+		/* Pick only idle groups with equal or lower priority than the
+		 * group triggering protected mode. Do not bother picking
+		 * unscheduled idle groups.
+		 */
+		for (prio = protm_prio;
+		     prio >= 0 && !tick_ctx_is_full(sched, &ctx);
+		     prio--)
+			tick_ctx_pick_groups_from_list(sched, &ctx,
+						       &ctx.old_groups[prio],
+						       false, true);
+	} else {
+		/* No switch to protected, just pick any idle group according
+		 * to priority
+		 */
+		for (prio = PANTHOR_CSG_PRIORITY_COUNT - 1;
+		     prio >= 0 && !tick_ctx_is_full(sched, &ctx);
+		     prio--) {
+			/* Check the old_group queue first to avoid
+			 * reprogramming the slots
+			 */
+			tick_ctx_pick_groups_from_list(sched, &ctx,
+						       &ctx.old_groups[prio],
+						       false, true);
+			tick_ctx_pick_groups_from_list(sched, &ctx,
+						       &sched->groups.idle[prio],
+						       false, false);
+		}
+
 	}
 
 	tick_ctx_apply(sched, &ctx);
@@ -2993,6 +3187,8 @@ void panthor_sched_pre_reset(struct panthor_device *ptdev)
 	cancel_work_sync(&sched->sync_upd_work);
 	cancel_delayed_work_sync(&sched->tick_work);
 
+	handle_protm_fault(ptdev);
+
 	panthor_sched_suspend(ptdev);
 
 	/* Stop all groups that might still accept jobs, so we don't get passed
-- 
2.43.0


