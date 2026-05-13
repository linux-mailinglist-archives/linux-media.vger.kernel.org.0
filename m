Return-Path: <linux-media+bounces-61482-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDdGMDy1BGplNQIAu9opvQ
	(envelope-from <linux-media+bounces-61482-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 19:30:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E620253810E
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 19:30:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A30F32CE61A
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 16:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676F24D9904;
	Wed, 13 May 2026 16:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ksxnEmGK"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E065A4DA534;
	Wed, 13 May 2026 16:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778691549; cv=none; b=Rx3uORZ1RmSrbP3+FPt4dZMf2fdc41SMPu7Yp9HIcZOwxVMIQ9466JzWxe+1jAiF+8rFMOMmzA4Hn+EDQz2oYUShYIpd2p/Hr0XnOm1cFcprzrU7nZv86DfHt0MtQTVzP7kI+CxE0hjdvQmSKA1OouI8/wvCOAKZUmFsbjoyKC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778691549; c=relaxed/simple;
	bh=mj6cGNEngX35OEMfxpLboiGY0oC4djWIef0TyNiINr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k+KYBwbbIxLBAt/uabbTvy+uaGxVEBSlXvFmW92HZaGzunEj/4lsLiBFXb7pbmICIXbxY8J7GoSrgpMOQ7htyhIaGYOVLWtITwivt0uT/rxWnQ85n2JsqT5aoxU2DLnagw+kZBzmAhp/YHtDq2sCVxWCOUWyeVMy0Cv26Zl54sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ksxnEmGK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778691540;
	bh=mj6cGNEngX35OEMfxpLboiGY0oC4djWIef0TyNiINr8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ksxnEmGKqX4NCHJF1voUybm0Vc14sNDqDPPhlSpVrQ3wxkBnLU27F2yO2GZzT5Cs1
	 q+N4pCl5E6PCyoaz5m8NG6nf0njInyTUZS9gIZI5BtJgi438JRFpcbURdhzV3v61Ly
	 JPVhikMQv50NRieuLk9vHrSRU4tXtGsvGw42b62eIoHsTYUvpLD4PcUfd8Nxt+SN1B
	 lIDPrvd4IHqVUbhJJ72N7kTlbTTuzYHzibLl0CFDxU2ohmjewYmV8dGnGOXM/T3q9y
	 mI9rv2lBlLhMtZ7G5HLO8Qb67YHOuvQvVbAojYcttJ4R7Uz2PtP9sYQYM+BmtjBCxf
	 QdgW9i11MpHUQ==
Received: from [192.168.1.38] (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 21BE317E1537;
	Wed, 13 May 2026 18:59:00 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Wed, 13 May 2026 18:58:49 +0200
Subject: [PATCH 1/6] drm/panthor: Driver-wide xxx_[un]lock ->
 [scoped_]guard replacement
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-panthor-guard-refactor-v1-1-f2d8c15a97ce@collabora.com>
References: <20260513-panthor-guard-refactor-v1-0-f2d8c15a97ce@collabora.com>
In-Reply-To: <20260513-panthor-guard-refactor-v1-0-f2d8c15a97ce@collabora.com>
To: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778691539; l=68146;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=mj6cGNEngX35OEMfxpLboiGY0oC4djWIef0TyNiINr8=;
 b=nyQ8LEsFprPcl+eX+49u9HLqvTk2tArpNxIE/R33wAJI2ruo967xpUQ5T8O12NZy4KC3QkkOO
 kbiDMo740LXC6wZj5D3rTPmgWJPSzeHwLmfXOIYDfbji0YqY21lbMf2
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=
X-Rspamd-Queue-Id: E620253810E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61482-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,amd.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,collabora.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tick_work.work:url,collabora.com:email,collabora.com:mid,collabora.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Right now panthor is mixed bag of manual locks and guards. Let's
make that more consitent and thus encourage new submissions to go
for guards.

Some places require a bit of code motion to avoid an excessive amount
of indentation levels, but no functional change is intended.
Some of this could also be simplified if we had guards for
drm_dev_{enter,exit}/dma_resv_lock(), and/or if we could use the
runtime pm guards (we need a custom guard to accommodate our
panthor_device_resume_and_get() wrapper).

This transition covers all spinlocks, mutexes and rwsemaphores declared
in panthor.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_devfreq.c |  29 +-
 drivers/gpu/drm/panthor/panthor_device.c  |  86 +++---
 drivers/gpu/drm/panthor/panthor_gem.c     |  27 +-
 drivers/gpu/drm/panthor/panthor_gpu.c     |  40 +--
 drivers/gpu/drm/panthor/panthor_heap.c    | 139 ++++-----
 drivers/gpu/drm/panthor/panthor_mmu.c     | 467 ++++++++++++++----------------
 drivers/gpu/drm/panthor/panthor_pwr.c     |   8 +-
 drivers/gpu/drm/panthor/panthor_sched.c   | 247 ++++++++--------
 8 files changed, 484 insertions(+), 559 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
index 2249b41ca4af..2322e35493bc 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.c
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -88,22 +88,19 @@ static int panthor_devfreq_get_dev_status(struct device *dev,
 {
 	struct panthor_device *ptdev = dev_get_drvdata(dev);
 	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
-	unsigned long irqflags;
 
 	status->current_frequency = clk_get_rate(ptdev->clks.core);
 
-	spin_lock_irqsave(&pdevfreq->lock, irqflags);
+	scoped_guard(spinlock_irqsave, &pdevfreq->lock) {
+		panthor_devfreq_update_utilization(pdevfreq);
 
-	panthor_devfreq_update_utilization(pdevfreq);
+		status->total_time = ktime_to_ns(ktime_add(pdevfreq->busy_time,
+							   pdevfreq->idle_time));
 
-	status->total_time = ktime_to_ns(ktime_add(pdevfreq->busy_time,
-						   pdevfreq->idle_time));
+		status->busy_time = ktime_to_ns(pdevfreq->busy_time);
 
-	status->busy_time = ktime_to_ns(pdevfreq->busy_time);
-
-	panthor_devfreq_reset(pdevfreq);
-
-	spin_unlock_irqrestore(&pdevfreq->lock, irqflags);
+		panthor_devfreq_reset(pdevfreq);
+	}
 
 	drm_dbg(&ptdev->base, "busy %lu total %lu %lu %% freq %lu MHz\n",
 		status->busy_time, status->total_time,
@@ -288,33 +285,25 @@ void panthor_devfreq_suspend(struct panthor_device *ptdev)
 void panthor_devfreq_record_busy(struct panthor_device *ptdev)
 {
 	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
-	unsigned long irqflags;
 
 	if (!pdevfreq->devfreq)
 		return;
 
-	spin_lock_irqsave(&pdevfreq->lock, irqflags);
-
+	guard(spinlock_irqsave)(&pdevfreq->lock);
 	panthor_devfreq_update_utilization(pdevfreq);
 	pdevfreq->last_busy_state = true;
-
-	spin_unlock_irqrestore(&pdevfreq->lock, irqflags);
 }
 
 void panthor_devfreq_record_idle(struct panthor_device *ptdev)
 {
 	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
-	unsigned long irqflags;
 
 	if (!pdevfreq->devfreq)
 		return;
 
-	spin_lock_irqsave(&pdevfreq->lock, irqflags);
-
+	guard(spinlock_irqsave)(&pdevfreq->lock);
 	panthor_devfreq_update_utilization(pdevfreq);
 	pdevfreq->last_busy_state = false;
-
-	spin_unlock_irqrestore(&pdevfreq->lock, irqflags);
 }
 
 unsigned long panthor_devfreq_get_freq(struct panthor_device *ptdev)
diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index bd417d6ae8c0..cb9cd8d0448b 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -63,34 +63,32 @@ static int panthor_init_power(struct device *dev)
 
 void panthor_device_unplug(struct panthor_device *ptdev)
 {
+	bool was_already_unplugged;
+
 	/* This function can be called from two different path: the reset work
 	 * and the platform device remove callback. drm_dev_unplug() doesn't
 	 * deal with concurrent callers, so we have to protect drm_dev_unplug()
 	 * calls with our own lock, and bail out if the device is already
 	 * unplugged.
 	 */
-	mutex_lock(&ptdev->unplug.lock);
-	if (drm_dev_is_unplugged(&ptdev->base)) {
-		/* Someone beat us, release the lock and wait for the unplug
-		 * operation to be reported as done.
-		 **/
-		mutex_unlock(&ptdev->unplug.lock);
+	scoped_guard(mutex, &ptdev->unplug.lock) {
+		was_already_unplugged = drm_dev_is_unplugged(&ptdev->base);
+		if (!was_already_unplugged) {
+			drm_WARN_ON(&ptdev->base, pm_runtime_get_sync(ptdev->base.dev) < 0);
+
+			/* Call drm_dev_unplug() so any access to HW blocks happening after
+			 * that point get rejected.
+			 */
+			drm_dev_unplug(&ptdev->base);
+		}
+	}
+
+	if (was_already_unplugged) {
+		/* Someone beat us, wait for the unplug operation to be reported as done. */
 		wait_for_completion(&ptdev->unplug.done);
 		return;
 	}
 
-	drm_WARN_ON(&ptdev->base, pm_runtime_get_sync(ptdev->base.dev) < 0);
-
-	/* Call drm_dev_unplug() so any access to HW blocks happening after
-	 * that point get rejected.
-	 */
-	drm_dev_unplug(&ptdev->base);
-
-	/* We do the rest of the unplug with the unplug lock released,
-	 * future callers will wait on ptdev->unplug.done anyway.
-	 */
-	mutex_unlock(&ptdev->unplug.lock);
-
 	/* Now, try to cleanly shutdown the GPU before the device resources
 	 * get reclaimed.
 	 */
@@ -403,30 +401,29 @@ static vm_fault_t panthor_mmio_vm_fault(struct vm_fault *vmf)
 	if (!drm_dev_enter(&ptdev->base, &cookie))
 		return VM_FAULT_SIGBUS;
 
-	mutex_lock(&ptdev->pm.mmio_lock);
-	active = atomic_read(&ptdev->pm.state) == PANTHOR_DEVICE_PM_STATE_ACTIVE;
+	scoped_guard(mutex, &ptdev->pm.mmio_lock) {
+		active = atomic_read(&ptdev->pm.state) == PANTHOR_DEVICE_PM_STATE_ACTIVE;
 
-	switch (offset) {
-	case DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET:
-		if (active)
-			pfn = __phys_to_pfn(ptdev->phys_addr + CSF_GPU_LATEST_FLUSH_ID);
-		else
-			pfn = page_to_pfn(ptdev->pm.dummy_latest_flush);
-		break;
+		switch (offset) {
+		case DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET:
+			if (active)
+				pfn = __phys_to_pfn(ptdev->phys_addr + CSF_GPU_LATEST_FLUSH_ID);
+			else
+				pfn = page_to_pfn(ptdev->pm.dummy_latest_flush);
 
-	default:
-		ret = VM_FAULT_SIGBUS;
-		goto out_unlock;
+			pgprot = vma->vm_page_prot;
+			if (active)
+				pgprot = pgprot_noncached(pgprot);
+
+			ret = vmf_insert_pfn_prot(vma, vmf->address, pfn, pgprot);
+			break;
+
+		default:
+			ret = VM_FAULT_SIGBUS;
+			break;
+		}
 	}
 
-	pgprot = vma->vm_page_prot;
-	if (active)
-		pgprot = pgprot_noncached(pgprot);
-
-	ret = vmf_insert_pfn_prot(vma, vmf->address, pfn, pgprot);
-
-out_unlock:
-	mutex_unlock(&ptdev->pm.mmio_lock);
 	drm_dev_exit(cookie);
 	return ret;
 }
@@ -537,11 +534,10 @@ int panthor_device_resume(struct device *dev)
 	 * are removed and the real iomem mapping will be restored on next
 	 * access.
 	 */
-	mutex_lock(&ptdev->pm.mmio_lock);
+	guard(mutex)(&ptdev->pm.mmio_lock);
 	unmap_mapping_range(ptdev->base.anon_inode->i_mapping,
 			    DRM_PANTHOR_USER_MMIO_OFFSET, 0, 1);
 	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_ACTIVE);
-	mutex_unlock(&ptdev->pm.mmio_lock);
 	return 0;
 
 err_suspend_devfreq:
@@ -575,11 +571,11 @@ int panthor_device_suspend(struct device *dev)
 	 * mmio_lock held to make sure the vm_fault handler won't set up
 	 * invalid mappings.
 	 */
-	mutex_lock(&ptdev->pm.mmio_lock);
-	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_SUSPENDING);
-	unmap_mapping_range(ptdev->base.anon_inode->i_mapping,
-			    DRM_PANTHOR_USER_MMIO_OFFSET, 0, 1);
-	mutex_unlock(&ptdev->pm.mmio_lock);
+	scoped_guard(mutex, &ptdev->pm.mmio_lock) {
+		atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_SUSPENDING);
+		unmap_mapping_range(ptdev->base.anon_inode->i_mapping,
+				    DRM_PANTHOR_USER_MMIO_OFFSET, 0, 1);
+	}
 
 	if (panthor_device_is_initialized(ptdev) &&
 	    drm_dev_enter(&ptdev->base, &cookie)) {
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 13295d7a593d..a6fddc380e7d 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -56,9 +56,8 @@ static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
 	bo->debugfs.creator.tgid = current->tgid;
 	get_task_comm(bo->debugfs.creator.process_name, current->group_leader);
 
-	mutex_lock(&ptdev->gems.lock);
+	guard(mutex)(&ptdev->gems.lock);
 	list_add_tail(&bo->debugfs.node, &ptdev->gems.node);
-	mutex_unlock(&ptdev->gems.lock);
 }
 
 static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
@@ -69,9 +68,8 @@ static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
 	if (list_empty(&bo->debugfs.node))
 		return;
 
-	mutex_lock(&ptdev->gems.lock);
+	guard(mutex)(&ptdev->gems.lock);
 	list_del_init(&bo->debugfs.node);
-	mutex_unlock(&ptdev->gems.lock);
 }
 
 static void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags)
@@ -269,9 +267,8 @@ static int panthor_gem_backing_pin_locked(struct panthor_gem_object *bo)
 	ret = panthor_gem_backing_get_pages_locked(bo);
 	if (!ret) {
 		refcount_set(&bo->backing.pin_count, 1);
-		mutex_lock(&bo->base.gpuva.lock);
+		guard(mutex)(&bo->base.gpuva.lock);
 		panthor_gem_update_reclaim_state_locked(bo, NULL);
-		mutex_unlock(&bo->base.gpuva.lock);
 	}
 
 	return ret;
@@ -286,9 +283,8 @@ static void panthor_gem_backing_unpin_locked(struct panthor_gem_object *bo)
 		/* We don't release anything when pin_count drops to zero.
 		 * Pages stay there until an explicit cleanup is requested.
 		 */
-		mutex_lock(&bo->base.gpuva.lock);
+		guard(mutex)(&bo->base.gpuva.lock);
 		panthor_gem_update_reclaim_state_locked(bo, NULL);
-		mutex_unlock(&bo->base.gpuva.lock);
 	}
 }
 
@@ -766,9 +762,8 @@ static int panthor_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *v
 		dma_resv_lock(obj->resv, NULL);
 		if (!refcount_inc_not_zero(&bo->cmap.mmap_count)) {
 			refcount_set(&bo->cmap.mmap_count, 1);
-			mutex_lock(&bo->base.gpuva.lock);
+			guard(mutex)(&bo->base.gpuva.lock);
 			panthor_gem_update_reclaim_state_locked(bo, NULL);
-			mutex_unlock(&bo->base.gpuva.lock);
 		}
 		dma_resv_unlock(obj->resv);
 	}
@@ -853,9 +848,8 @@ static vm_fault_t blocking_page_setup(struct vm_fault *vmf, unsigned int order,
 	} else {
 		struct page *page = bo->backing.pages[page_offset];
 
-		mutex_lock(&bo->base.gpuva.lock);
-		panthor_gem_update_reclaim_state_locked(bo, NULL);
-		mutex_unlock(&bo->base.gpuva.lock);
+		scoped_guard(mutex, &bo->base.gpuva.lock)
+			panthor_gem_update_reclaim_state_locked(bo, NULL);
 
 		if (mmap_lock_held)
 			ret = insert_page(vmf, order, page);
@@ -940,9 +934,8 @@ static void panthor_gem_vm_close(struct vm_area_struct *vma)
 
 	dma_resv_lock(bo->base.resv, NULL);
 	if (refcount_dec_and_test(&bo->cmap.mmap_count)) {
-		mutex_lock(&bo->base.gpuva.lock);
+		guard(mutex)(&bo->base.gpuva.lock);
 		panthor_gem_update_reclaim_state_locked(bo, NULL);
-		mutex_unlock(&bo->base.gpuva.lock);
 	}
 	dma_resv_unlock(bo->base.resv);
 
@@ -1419,7 +1412,8 @@ static bool panthor_gem_try_evict_no_resv_wait(struct drm_gem_object *obj,
 	 * If we fail to lock that's fine, we back off and will get
 	 * back to it later.
 	 */
-	if (!mutex_trylock(&bo->base.gpuva.lock))
+	ACQUIRE(mutex_try, gpuva_guard)(&bo->base.gpuva.lock);
+	if (ACQUIRE_ERR(mutex_try, &gpuva_guard))
 		return false;
 
 	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
@@ -1468,7 +1462,6 @@ static bool panthor_gem_try_evict_no_resv_wait(struct drm_gem_object *obj,
 				break;
 		}
 	}
-	mutex_unlock(&bo->base.gpuva.lock);
 
 	return ret == 0;
 }
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 04c8f23baf3f..3113024c6f48 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -130,17 +130,14 @@ static irqreturn_t panthor_gpu_irq_raw_handler(int irq, void *data)
  */
 void panthor_gpu_unplug(struct panthor_device *ptdev)
 {
-	unsigned long flags;
-
 	/* Make sure the IRQ handler is not running after that point. */
 	if (!IS_ENABLED(CONFIG_PM) || pm_runtime_active(ptdev->base.dev))
 		panthor_irq_suspend(&ptdev->gpu->irq);
 
 	/* Wake-up all waiters. */
-	spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
+	guard(spinlock_irqsave)(&ptdev->gpu->reqs_lock);
 	ptdev->gpu->pending_reqs = 0;
 	wake_up_all(&ptdev->gpu->reqs_acked);
-	spin_unlock_irqrestore(&ptdev->gpu->reqs_lock, flags);
 }
 
 /**
@@ -336,34 +333,29 @@ int panthor_gpu_flush_caches(struct panthor_device *ptdev,
 			     u32 l2, u32 lsc, u32 other)
 {
 	struct panthor_gpu *gpu = ptdev->gpu;
-	unsigned long flags;
 	int ret = 0;
 
 	/* Serialize cache flush operations. */
 	guard(mutex)(&ptdev->gpu->cache_flush_lock);
 
-	spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
-	if (!(ptdev->gpu->pending_reqs & GPU_IRQ_CLEAN_CACHES_COMPLETED)) {
+	scoped_guard(spinlock_irqsave, &ptdev->gpu->reqs_lock) {
+		/* Fail if a cache maintenance operation is already in progress. */
+		if (ptdev->gpu->pending_reqs & GPU_IRQ_CLEAN_CACHES_COMPLETED)
+			return -EIO;
+
 		ptdev->gpu->pending_reqs |= GPU_IRQ_CLEAN_CACHES_COMPLETED;
 		gpu_write(gpu->iomem, GPU_CMD, GPU_FLUSH_CACHES(l2, lsc, other));
-	} else {
-		ret = -EIO;
 	}
-	spin_unlock_irqrestore(&ptdev->gpu->reqs_lock, flags);
-
-	if (ret)
-		return ret;
 
 	if (!wait_event_timeout(ptdev->gpu->reqs_acked,
 				!(ptdev->gpu->pending_reqs & GPU_IRQ_CLEAN_CACHES_COMPLETED),
 				msecs_to_jiffies(100))) {
-		spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
+		guard(spinlock_irqsave)(&ptdev->gpu->reqs_lock);
 		if ((ptdev->gpu->pending_reqs & GPU_IRQ_CLEAN_CACHES_COMPLETED) != 0 &&
 		    !(gpu_read(gpu->irq.iomem, INT_RAWSTAT) & GPU_IRQ_CLEAN_CACHES_COMPLETED))
 			ret = -ETIMEDOUT;
 		else
 			ptdev->gpu->pending_reqs &= ~GPU_IRQ_CLEAN_CACHES_COMPLETED;
-		spin_unlock_irqrestore(&ptdev->gpu->reqs_lock, flags);
 	}
 
 	if (ret) {
@@ -384,27 +376,25 @@ int panthor_gpu_soft_reset(struct panthor_device *ptdev)
 {
 	struct panthor_gpu *gpu = ptdev->gpu;
 	bool timedout = false;
-	unsigned long flags;
 
-	spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
-	if (!drm_WARN_ON(&ptdev->base,
-			 ptdev->gpu->pending_reqs & GPU_IRQ_RESET_COMPLETED)) {
-		ptdev->gpu->pending_reqs |= GPU_IRQ_RESET_COMPLETED;
-		gpu_write(gpu->irq.iomem, INT_CLEAR, GPU_IRQ_RESET_COMPLETED);
-		gpu_write(gpu->iomem, GPU_CMD, GPU_SOFT_RESET);
+	scoped_guard(spinlock_irqsave, &ptdev->gpu->reqs_lock) {
+		if (!drm_WARN_ON(&ptdev->base,
+				 ptdev->gpu->pending_reqs & GPU_IRQ_RESET_COMPLETED)) {
+			ptdev->gpu->pending_reqs |= GPU_IRQ_RESET_COMPLETED;
+			gpu_write(gpu->irq.iomem, INT_CLEAR, GPU_IRQ_RESET_COMPLETED);
+			gpu_write(gpu->iomem, GPU_CMD, GPU_SOFT_RESET);
+		}
 	}
-	spin_unlock_irqrestore(&ptdev->gpu->reqs_lock, flags);
 
 	if (!wait_event_timeout(ptdev->gpu->reqs_acked,
 				!(ptdev->gpu->pending_reqs & GPU_IRQ_RESET_COMPLETED),
 				msecs_to_jiffies(100))) {
-		spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
+		guard(spinlock_irqsave)(&ptdev->gpu->reqs_lock);
 		if ((ptdev->gpu->pending_reqs & GPU_IRQ_RESET_COMPLETED) != 0 &&
 		    !(gpu_read(gpu->irq.iomem, INT_RAWSTAT) & GPU_IRQ_RESET_COMPLETED))
 			timedout = true;
 		else
 			ptdev->gpu->pending_reqs &= ~GPU_IRQ_RESET_COMPLETED;
-		spin_unlock_irqrestore(&ptdev->gpu->reqs_lock, flags);
 	}
 
 	if (timedout) {
diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
index 99311abdf1e9..13c6433e75aa 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.c
+++ b/drivers/gpu/drm/panthor/panthor_heap.c
@@ -126,10 +126,10 @@ static void panthor_free_heap_chunk(struct panthor_heap_pool *pool,
 				    struct panthor_heap *heap,
 				    struct panthor_heap_chunk *chunk)
 {
-	mutex_lock(&heap->lock);
-	list_del(&chunk->node);
-	heap->chunk_count--;
-	mutex_unlock(&heap->lock);
+	scoped_guard(mutex, &heap->lock) {
+		list_del(&chunk->node);
+		heap->chunk_count--;
+	}
 
 	atomic_sub(heap->chunk_size, &pool->size);
 
@@ -181,10 +181,10 @@ static int panthor_alloc_heap_chunk(struct panthor_heap_pool *pool,
 
 	panthor_kernel_bo_vunmap(chunk->bo);
 
-	mutex_lock(&heap->lock);
-	list_add(&chunk->node, &heap->chunks);
-	heap->chunk_count++;
-	mutex_unlock(&heap->lock);
+	scoped_guard(mutex, &heap->lock) {
+		list_add(&chunk->node, &heap->chunks);
+		heap->chunk_count++;
+	}
 
 	atomic_add(heap->chunk_size, &pool->size);
 
@@ -246,13 +246,9 @@ panthor_heap_destroy_locked(struct panthor_heap_pool *pool, u32 handle)
  */
 int panthor_heap_destroy(struct panthor_heap_pool *pool, u32 handle)
 {
-	int ret;
+	guard(rwsem_write)(&pool->lock);
 
-	down_write(&pool->lock);
-	ret = panthor_heap_destroy_locked(pool, handle);
-	up_write(&pool->lock);
-
-	return ret;
+	return panthor_heap_destroy_locked(pool, handle);
 }
 
 /**
@@ -295,9 +291,8 @@ int panthor_heap_create(struct panthor_heap_pool *pool,
 	    chunk_size < SZ_128K || chunk_size > SZ_8M)
 		return -EINVAL;
 
-	down_read(&pool->lock);
-	vm = panthor_vm_get(pool->vm);
-	up_read(&pool->lock);
+	scoped_guard(rwsem_read, &pool->lock)
+		vm = panthor_vm_get(pool->vm);
 
 	/* The pool has been destroyed, we can't create a new heap. */
 	if (!vm)
@@ -324,22 +319,22 @@ int panthor_heap_create(struct panthor_heap_pool *pool,
 				       node);
 	*first_chunk_gpu_va = panthor_kernel_bo_gpuva(first_chunk->bo);
 
-	down_write(&pool->lock);
-	/* The pool has been destroyed, we can't create a new heap. */
-	if (!pool->vm) {
-		ret = -EINVAL;
-	} else {
-		ret = xa_alloc(&pool->xa, &id, heap,
-			       XA_LIMIT(0, MAX_HEAPS_PER_POOL - 1), GFP_KERNEL);
-		if (!ret) {
-			void *gpu_ctx = panthor_get_heap_ctx(pool, id);
+	scoped_guard(rwsem_write, &pool->lock) {
+		/* The pool has been destroyed, we can't create a new heap. */
+		if (!pool->vm) {
+			ret = -EINVAL;
+		} else {
+			ret = xa_alloc(&pool->xa, &id, heap,
+				       XA_LIMIT(0, MAX_HEAPS_PER_POOL - 1), GFP_KERNEL);
+			if (!ret) {
+				void *gpu_ctx = panthor_get_heap_ctx(pool, id);
 
-			memset(gpu_ctx, 0, panthor_heap_ctx_stride(pool->ptdev));
-			*heap_ctx_gpu_va = panthor_kernel_bo_gpuva(pool->gpu_contexts) +
-					   panthor_get_heap_ctx_offset(pool, id);
+				memset(gpu_ctx, 0, panthor_heap_ctx_stride(pool->ptdev));
+				*heap_ctx_gpu_va = panthor_kernel_bo_gpuva(pool->gpu_contexts) +
+						   panthor_get_heap_ctx_offset(pool, id);
+			}
 		}
 	}
-	up_write(&pool->lock);
 
 	if (ret)
 		goto err_free_heap;
@@ -375,43 +370,35 @@ int panthor_heap_return_chunk(struct panthor_heap_pool *pool,
 	u32 heap_id = (u32)offset / panthor_heap_ctx_stride(pool->ptdev);
 	struct panthor_heap_chunk *chunk, *tmp, *removed = NULL;
 	struct panthor_heap *heap;
-	int ret;
 
 	if (offset > U32_MAX || heap_id >= MAX_HEAPS_PER_POOL)
 		return -EINVAL;
 
-	down_read(&pool->lock);
+	guard(rwsem_read)(&pool->lock);
 	heap = xa_load(&pool->xa, heap_id);
-	if (!heap) {
-		ret = -EINVAL;
-		goto out_unlock;
-	}
+	if (!heap)
+		return -EINVAL;
 
 	chunk_gpu_va &= GENMASK_ULL(63, 12);
 
-	mutex_lock(&heap->lock);
-	list_for_each_entry_safe(chunk, tmp, &heap->chunks, node) {
-		if (panthor_kernel_bo_gpuva(chunk->bo) == chunk_gpu_va) {
-			removed = chunk;
-			list_del(&chunk->node);
-			heap->chunk_count--;
-			atomic_sub(heap->chunk_size, &pool->size);
-			break;
+	scoped_guard(mutex, &heap->lock) {
+		list_for_each_entry_safe(chunk, tmp, &heap->chunks, node) {
+			if (panthor_kernel_bo_gpuva(chunk->bo) == chunk_gpu_va) {
+				removed = chunk;
+				list_del(&chunk->node);
+				heap->chunk_count--;
+				atomic_sub(heap->chunk_size, &pool->size);
+				break;
+			}
 		}
 	}
-	mutex_unlock(&heap->lock);
 
-	if (removed) {
-		panthor_kernel_bo_destroy(chunk->bo);
-		kfree(chunk);
-		ret = 0;
-	} else {
-		ret = -EINVAL;
-	}
+	if (!removed)
+		return -EINVAL;
 
-out_unlock:
-	up_read(&pool->lock);
-	return ret;
+	panthor_kernel_bo_destroy(chunk->bo);
+	kfree(chunk);
+	return 0;
 }
 
 /**
@@ -444,12 +431,10 @@ int panthor_heap_grow(struct panthor_heap_pool *pool,
 	if (offset > U32_MAX || heap_id >= MAX_HEAPS_PER_POOL)
 		return -EINVAL;
 
-	down_read(&pool->lock);
+	guard(rwsem_read)(&pool->lock);
 	heap = xa_load(&pool->xa, heap_id);
-	if (!heap) {
-		ret = -EINVAL;
-		goto out_unlock;
-	}
+	if (!heap)
+		return -EINVAL;
 
 	/* If we reached the target in-flight render passes, or if we
 	 * reached the maximum number of chunks, let the FW figure another way to
@@ -457,10 +442,8 @@ int panthor_heap_grow(struct panthor_heap_pool *pool,
 	 * handler provided by the userspace driver, if any).
 	 */
 	if (renderpasses_in_flight > heap->target_in_flight ||
-	    heap->chunk_count >= heap->max_chunks) {
-		ret = -ENOMEM;
-		goto out_unlock;
-	}
+	    heap->chunk_count >= heap->max_chunks)
+		return -ENOMEM;
 
 	/* FIXME: panthor_alloc_heap_chunk() triggers a kernel BO creation,
 	 * which goes through the blocking allocation path. Ultimately, we
@@ -475,18 +458,14 @@ int panthor_heap_grow(struct panthor_heap_pool *pool,
 	 */
 	ret = panthor_alloc_heap_chunk(pool, heap, false);
 	if (ret)
-		goto out_unlock;
+		return ret;
 
 	chunk = list_first_entry(&heap->chunks,
 				 struct panthor_heap_chunk,
 				 node);
 	*new_chunk_gpu_va = (panthor_kernel_bo_gpuva(chunk->bo) & GENMASK_ULL(63, 12)) |
 			    (heap->chunk_size >> 12);
-	ret = 0;
-
-out_unlock:
-	up_read(&pool->lock);
-	return ret;
+	return 0;
 }
 
 static void panthor_heap_pool_release(struct kref *refcount)
@@ -600,19 +579,19 @@ void panthor_heap_pool_destroy(struct panthor_heap_pool *pool)
 	if (!pool)
 		return;
 
-	down_write(&pool->lock);
-	xa_for_each(&pool->xa, i, heap)
-		drm_WARN_ON(&pool->ptdev->base, panthor_heap_destroy_locked(pool, i));
+	scoped_guard(rwsem_write, &pool->lock) {
+		xa_for_each(&pool->xa, i, heap)
+			drm_WARN_ON(&pool->ptdev->base, panthor_heap_destroy_locked(pool, i));
 
-	if (!IS_ERR_OR_NULL(pool->gpu_contexts)) {
-		atomic_sub(pool->gpu_contexts->obj->size, &pool->size);
-		panthor_kernel_bo_destroy(pool->gpu_contexts);
+		if (!IS_ERR_OR_NULL(pool->gpu_contexts)) {
+			atomic_sub(pool->gpu_contexts->obj->size, &pool->size);
+			panthor_kernel_bo_destroy(pool->gpu_contexts);
+		}
+
+		/* Reflects the fact the pool has been destroyed. */
+		pool->vm = NULL;
 	}
 
-	/* Reflects the fact the pool has been destroyed. */
-	pool->vm = NULL;
-	up_write(&pool->lock);
-
 	panthor_heap_pool_put(pool);
 }
 
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 2955b8baa2e2..157eef286cb9 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -683,47 +683,20 @@ static void panthor_vm_release_as_locked(struct panthor_vm *vm)
 	vm->as.id = -1;
 }
 
-/**
- * panthor_vm_active() - Flag a VM as active
- * @vm: VM to flag as active.
- *
- * Assigns an address space to a VM so it can be used by the GPU/MCU.
- *
- * Return: 0 on success, a negative error code otherwise.
- */
-int panthor_vm_active(struct panthor_vm *vm)
+static int panthor_vm_active_locked(struct panthor_vm *vm)
 {
 	struct panthor_device *ptdev = vm->ptdev;
 	u32 va_bits = GPU_MMU_FEATURES_VA_BITS(ptdev->gpu_info.mmu_features);
 	struct io_pgtable_cfg *cfg = &io_pgtable_ops_to_pgtable(vm->pgtbl_ops)->cfg;
-	int ret = 0, as, cookie;
 	u64 transtab, transcfg;
 	u32 fault_mask;
+	int ret, as;
 
-	if (!drm_dev_enter(&ptdev->base, &cookie))
-		return -ENODEV;
+	lockdep_assert_held(&vm->op_lock);
+	lockdep_assert_held(&ptdev->mmu->as.slots_lock);
 
 	if (refcount_inc_not_zero(&vm->as.active_cnt))
-		goto out_dev_exit;
-
-	/* As soon as active is called, we place the VM at the end of the VM LRU.
-	 * If something fails after that, the only downside is that this VM that
-	 * never became active in the first place will be reclaimed last, but
-	 * that's an acceptable trade-off.
-	 */
-	mutex_lock(&ptdev->reclaim.lock);
-	if (vm->reclaim.lru.count)
-		list_move_tail(&vm->reclaim.lru_node, &ptdev->reclaim.vms);
-	mutex_unlock(&ptdev->reclaim.lock);
-
-	/* Make sure we don't race with lock/unlock_region() calls
-	 * happening around VM bind operations.
-	 */
-	mutex_lock(&vm->op_lock);
-	mutex_lock(&ptdev->mmu->as.slots_lock);
-
-	if (refcount_inc_not_zero(&vm->as.active_cnt))
-		goto out_unlock;
+		return 0;
 
 	as = vm->as.id;
 	if (as >= 0) {
@@ -750,17 +723,15 @@ int panthor_vm_active(struct panthor_vm *vm)
 		lru_vm = list_first_entry_or_null(&ptdev->mmu->as.lru_list,
 						  struct panthor_vm,
 						  as.lru_node);
-		if (drm_WARN_ON(&ptdev->base, !lru_vm)) {
-			ret = -EBUSY;
-			goto out_unlock;
-		}
+		if (drm_WARN_ON(&ptdev->base, !lru_vm))
+			return -EBUSY;
 
 		drm_WARN_ON(&ptdev->base, refcount_read(&lru_vm->as.active_cnt));
 		as = lru_vm->as.id;
 
 		ret = panthor_mmu_as_disable(ptdev, as, true);
 		if (ret)
-			goto out_unlock;
+			return ret;
 
 		panthor_vm_release_as_locked(lru_vm);
 	}
@@ -796,16 +767,52 @@ int panthor_vm_active(struct panthor_vm *vm)
 	 */
 	drm_WARN_ON(&vm->ptdev->base, vm->locked_region.size > 0);
 	ret = panthor_mmu_as_enable(vm->ptdev, vm->as.id, transtab, transcfg, vm->memattr);
+	if (ret)
+		return ret;
 
 out_make_active:
-	if (!ret) {
-		refcount_set(&vm->as.active_cnt, 1);
-		list_del_init(&vm->as.lru_node);
+	refcount_set(&vm->as.active_cnt, 1);
+	list_del_init(&vm->as.lru_node);
+
+	return 0;
+}
+
+/**
+ * panthor_vm_active() - Flag a VM as active
+ * @vm: VM to flag as active.
+ *
+ * Assigns an address space to a VM so it can be used by the GPU/MCU.
+ *
+ * Return: 0 on success, a negative error code otherwise.
+ */
+int panthor_vm_active(struct panthor_vm *vm)
+{
+	struct panthor_device *ptdev = vm->ptdev;
+	int ret = 0, cookie;
+
+	if (!drm_dev_enter(&ptdev->base, &cookie))
+		return -ENODEV;
+
+	if (refcount_inc_not_zero(&vm->as.active_cnt))
+		goto out_dev_exit;
+
+	/* As soon as active is called, we place the VM at the end of the VM LRU.
+	 * If something fails after that, the only downside is that this VM that
+	 * never became active in the first place will be reclaimed last, but
+	 * that's an acceptable trade-off.
+	 */
+	scoped_guard(mutex, &ptdev->reclaim.lock) {
+		if (vm->reclaim.lru.count)
+			list_move_tail(&vm->reclaim.lru_node, &ptdev->reclaim.vms);
 	}
 
-out_unlock:
-	mutex_unlock(&ptdev->mmu->as.slots_lock);
-	mutex_unlock(&vm->op_lock);
+	/* Make sure we don't race with lock/unlock_region() calls
+	 * happening around VM bind operations.
+	 */
+	scoped_guard(mutex, &vm->op_lock) {
+		guard(mutex)(&ptdev->mmu->as.slots_lock);
+		ret = panthor_vm_active_locked(vm);
+	}
 
 out_dev_exit:
 	drm_dev_exit(cookie);
@@ -829,14 +836,17 @@ void panthor_vm_idle(struct panthor_vm *vm)
 {
 	struct panthor_device *ptdev = vm->ptdev;
 
-	if (!refcount_dec_and_mutex_lock(&vm->as.active_cnt, &ptdev->mmu->as.slots_lock))
+	if (refcount_dec_not_one(&vm->as.active_cnt))
+		return;
+
+	guard(mutex)(&ptdev->mmu->as.slots_lock);
+	if (!refcount_dec_and_test(&vm->as.active_cnt))
 		return;
 
 	if (!drm_WARN_ON(&ptdev->base, vm->as.id == -1 || !list_empty(&vm->as.lru_node)))
 		list_add_tail(&vm->as.lru_node, &ptdev->mmu->as.lru_list);
 
 	refcount_set(&vm->as.active_cnt, 0);
-	mutex_unlock(&ptdev->mmu->as.slots_lock);
 }
 
 u32 panthor_vm_page_size(struct panthor_vm *vm)
@@ -898,12 +908,11 @@ static void panthor_vm_declare_unusable(struct panthor_vm *vm)
 		return;
 
 	vm->unusable = true;
-	mutex_lock(&ptdev->mmu->as.slots_lock);
+	guard(mutex)(&ptdev->mmu->as.slots_lock);
 	if (vm->as.id >= 0 && drm_dev_enter(&ptdev->base, &cookie)) {
 		panthor_mmu_as_disable(ptdev, vm->as.id, false);
 		drm_dev_exit(cookie);
 	}
-	mutex_unlock(&ptdev->mmu->as.slots_lock);
 }
 
 static void panthor_vm_unmap_pages(struct panthor_vm *vm, u64 iova, u64 size)
@@ -1070,7 +1079,6 @@ panthor_vm_alloc_va(struct panthor_vm *vm, u64 va, u64 size,
 		    struct drm_mm_node *va_node)
 {
 	ssize_t vm_pgsz = panthor_vm_page_size(vm);
-	int ret;
 
 	if (!size || !IS_ALIGNED(size, vm_pgsz))
 		return -EINVAL;
@@ -1078,21 +1086,18 @@ panthor_vm_alloc_va(struct panthor_vm *vm, u64 va, u64 size,
 	if (va != PANTHOR_VM_KERNEL_AUTO_VA && !IS_ALIGNED(va, vm_pgsz))
 		return -EINVAL;
 
-	mutex_lock(&vm->mm_lock);
+	guard(mutex)(&vm->mm_lock);
 	if (va != PANTHOR_VM_KERNEL_AUTO_VA) {
 		va_node->start = va;
 		va_node->size = size;
-		ret = drm_mm_reserve_node(&vm->mm, va_node);
-	} else {
-		ret = drm_mm_insert_node_in_range(&vm->mm, va_node, size,
-						  size >= SZ_2M ? SZ_2M : SZ_4K,
-						  0, vm->kernel_auto_va.start,
-						  vm->kernel_auto_va.end,
-						  DRM_MM_INSERT_BEST);
+		return drm_mm_reserve_node(&vm->mm, va_node);
 	}
-	mutex_unlock(&vm->mm_lock);
 
-	return ret;
+	return drm_mm_insert_node_in_range(&vm->mm, va_node, size,
+					   size >= SZ_2M ? SZ_2M : SZ_4K,
+					   0, vm->kernel_auto_va.start,
+					   vm->kernel_auto_va.end,
+					   DRM_MM_INSERT_BEST);
 }
 
 /**
@@ -1102,9 +1107,8 @@ panthor_vm_alloc_va(struct panthor_vm *vm, u64 va, u64 size,
  */
 void panthor_vm_free_va(struct panthor_vm *vm, struct drm_mm_node *va_node)
 {
-	mutex_lock(&vm->mm_lock);
+	guard(mutex)(&vm->mm_lock);
 	drm_mm_remove_node(va_node);
-	mutex_unlock(&vm->mm_lock);
 }
 
 static void panthor_vm_bo_free(struct drm_gpuvm_bo *vm_bo)
@@ -1115,9 +1119,8 @@ static void panthor_vm_bo_free(struct drm_gpuvm_bo *vm_bo)
 	 * be taken in the dma signalling path, so call it now.
 	 */
 	dma_resv_lock(bo->base.resv, NULL);
-	mutex_lock(&bo->base.gpuva.lock);
-	panthor_gem_update_reclaim_state_locked(bo, NULL);
-	mutex_unlock(&bo->base.gpuva.lock);
+	scoped_guard(mutex, &bo->base.gpuva.lock)
+		panthor_gem_update_reclaim_state_locked(bo, NULL);
 	dma_resv_unlock(bo->base.resv);
 
 	kfree(vm_bo);
@@ -1346,9 +1349,8 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 
 	/* And finally update the BO state. */
 	dma_resv_lock(bo->base.resv, NULL);
-	mutex_lock(&bo->base.gpuva.lock);
-	panthor_gem_update_reclaim_state_locked(bo, NULL);
-	mutex_unlock(&bo->base.gpuva.lock);
+	scoped_guard(mutex, &bo->base.gpuva.lock)
+		panthor_gem_update_reclaim_state_locked(bo, NULL);
 	dma_resv_unlock(bo->base.resv);
 
 	return 0;
@@ -1437,7 +1439,7 @@ panthor_vm_get_bo_for_va(struct panthor_vm *vm, u64 va, u64 *bo_offset)
 	struct panthor_vma *vma;
 
 	/* Take the VM lock to prevent concurrent map/unmap operations. */
-	mutex_lock(&vm->op_lock);
+	guard(mutex)(&vm->op_lock);
 	gpuva = drm_gpuva_find_first(&vm->base, va, 1);
 	vma = gpuva ? container_of(gpuva, struct panthor_vma, base) : NULL;
 	if (vma && vma->base.gem.obj) {
@@ -1445,7 +1447,6 @@ panthor_vm_get_bo_for_va(struct panthor_vm *vm, u64 va, u64 *bo_offset)
 		bo = to_panthor_bo(vma->base.gem.obj);
 		*bo_offset = vma->base.gem.offset + (va - vma->base.va.addr);
 	}
-	mutex_unlock(&vm->op_lock);
 
 	return bo;
 }
@@ -1571,10 +1572,10 @@ static void panthor_vm_destroy(struct panthor_vm *vm)
 	if (refcount_read(&vm->as.active_cnt) > 0)
 		panthor_sched_prepare_for_vm_destruction(vm->ptdev);
 
-	mutex_lock(&vm->heaps.lock);
-	panthor_heap_pool_destroy(vm->heaps.pool);
-	vm->heaps.pool = NULL;
-	mutex_unlock(&vm->heaps.lock);
+	scoped_guard(mutex, &vm->heaps.lock) {
+		panthor_heap_pool_destroy(vm->heaps.pool);
+		vm->heaps.pool = NULL;
+	}
 
 	drm_WARN_ON(&vm->ptdev->base,
 		    panthor_vm_unmap_range(vm, vm->base.mm_start, vm->base.mm_range));
@@ -1702,7 +1703,6 @@ static const char *access_type_name(struct panthor_device *ptdev,
 static int panthor_vm_lock_region(struct panthor_vm *vm, u64 start, u64 size)
 {
 	struct panthor_device *ptdev = vm->ptdev;
-	int ret = 0;
 
 	/* sm_step_remap() can call panthor_vm_lock_region() to account for
 	 * the wider unmap needed when doing a partial huge page unamp. We
@@ -1731,30 +1731,30 @@ static int panthor_vm_lock_region(struct panthor_vm *vm, u64 start, u64 size)
 		size = end - start;
 	}
 
-	mutex_lock(&ptdev->mmu->as.slots_lock);
+	guard(mutex)(&ptdev->mmu->as.slots_lock);
 	if (vm->as.id >= 0 && size) {
+		int ret;
+
 		/* Lock the region that needs to be updated */
 		gpu_write64(ptdev->mmu->iomem, AS_LOCKADDR(vm->as.id),
 			    pack_region_range(ptdev, &start, &size));
 
 		/* If the lock succeeded, update the locked_region info. */
 		ret = as_send_cmd_and_wait(ptdev, vm->as.id, AS_COMMAND_LOCK);
+		if (ret)
+			return ret;
 	}
 
-	if (!ret) {
-		vm->locked_region.start = start;
-		vm->locked_region.size = size;
-	}
-	mutex_unlock(&ptdev->mmu->as.slots_lock);
-
-	return ret;
+	vm->locked_region.start = start;
+	vm->locked_region.size = size;
+	return 0;
 }
 
 static void panthor_vm_unlock_region(struct panthor_vm *vm)
 {
 	struct panthor_device *ptdev = vm->ptdev;
 
-	mutex_lock(&ptdev->mmu->as.slots_lock);
+	guard(mutex)(&ptdev->mmu->as.slots_lock);
 	if (vm->as.id >= 0) {
 		int ret;
 
@@ -1778,7 +1778,6 @@ static void panthor_vm_unlock_region(struct panthor_vm *vm)
 	}
 	vm->locked_region.start = 0;
 	vm->locked_region.size = 0;
-	mutex_unlock(&ptdev->mmu->as.slots_lock);
 }
 
 static void panthor_mmu_irq_handler(struct panthor_irq *pirq, u32 status)
@@ -1805,7 +1804,7 @@ static void panthor_mmu_irq_handler(struct panthor_irq *pirq, u32 status)
 		access_type = (fault_status >> 8) & 0x3;
 		source_id = (fault_status >> 16);
 
-		mutex_lock(&ptdev->mmu->as.slots_lock);
+		guard(mutex)(&ptdev->mmu->as.slots_lock);
 
 		ptdev->mmu->as.faulty_mask |= mask;
 
@@ -1836,8 +1835,6 @@ static void panthor_mmu_irq_handler(struct panthor_irq *pirq, u32 status)
 
 		/* Disable the MMU to kill jobs on this AS. */
 		panthor_mmu_as_disable(ptdev, as, false);
-		mutex_unlock(&ptdev->mmu->as.slots_lock);
-
 		status &= ~mask;
 		has_unhandled_faults = true;
 	}
@@ -1863,17 +1860,17 @@ static irqreturn_t panthor_mmu_irq_threaded_handler(int irq, void *data)
  */
 void panthor_mmu_suspend(struct panthor_device *ptdev)
 {
-	mutex_lock(&ptdev->mmu->as.slots_lock);
-	for (u32 i = 0; i < ARRAY_SIZE(ptdev->mmu->as.slots); i++) {
-		struct panthor_vm *vm = ptdev->mmu->as.slots[i].vm;
+	scoped_guard(mutex, &ptdev->mmu->as.slots_lock) {
+		for (u32 i = 0; i < ARRAY_SIZE(ptdev->mmu->as.slots); i++) {
+			struct panthor_vm *vm = ptdev->mmu->as.slots[i].vm;
 
-		if (vm) {
-			drm_WARN_ON(&ptdev->base,
-				    panthor_mmu_as_disable(ptdev, i, false));
-			panthor_vm_release_as_locked(vm);
+			if (vm) {
+				drm_WARN_ON(&ptdev->base,
+					    panthor_mmu_as_disable(ptdev, i, false));
+				panthor_vm_release_as_locked(vm);
+			}
 		}
 	}
-	mutex_unlock(&ptdev->mmu->as.slots_lock);
 
 	panthor_irq_suspend(&ptdev->mmu->irq);
 }
@@ -1889,10 +1886,10 @@ void panthor_mmu_suspend(struct panthor_device *ptdev)
  */
 void panthor_mmu_resume(struct panthor_device *ptdev)
 {
-	mutex_lock(&ptdev->mmu->as.slots_lock);
-	ptdev->mmu->as.alloc_mask = 0;
-	ptdev->mmu->as.faulty_mask = 0;
-	mutex_unlock(&ptdev->mmu->as.slots_lock);
+	scoped_guard(mutex, &ptdev->mmu->as.slots_lock) {
+		ptdev->mmu->as.alloc_mask = 0;
+		ptdev->mmu->as.faulty_mask = 0;
+	}
 
 	panthor_irq_resume(&ptdev->mmu->irq);
 }
@@ -1913,11 +1910,11 @@ void panthor_mmu_pre_reset(struct panthor_device *ptdev)
 
 	panthor_irq_suspend(&ptdev->mmu->irq);
 
-	mutex_lock(&ptdev->mmu->vm.lock);
-	ptdev->mmu->vm.reset_in_progress = true;
-	list_for_each_entry(vm, &ptdev->mmu->vm.list, node)
-		panthor_vm_stop(vm);
-	mutex_unlock(&ptdev->mmu->vm.lock);
+	scoped_guard(mutex, &ptdev->mmu->vm.lock) {
+		ptdev->mmu->vm.reset_in_progress = true;
+		list_for_each_entry(vm, &ptdev->mmu->vm.list, node)
+			panthor_vm_stop(vm);
+	}
 }
 
 /**
@@ -1931,32 +1928,29 @@ void panthor_mmu_post_reset(struct panthor_device *ptdev)
 {
 	struct panthor_vm *vm;
 
-	mutex_lock(&ptdev->mmu->as.slots_lock);
+	scoped_guard(mutex, &ptdev->mmu->as.slots_lock) {
+		/* Now that the reset is effective, we can assume that none of the
+		 * AS slots are setup, and clear the faulty flags too.
+		 */
+		ptdev->mmu->as.alloc_mask = 0;
+		ptdev->mmu->as.faulty_mask = 0;
 
-	/* Now that the reset is effective, we can assume that none of the
-	 * AS slots are setup, and clear the faulty flags too.
-	 */
-	ptdev->mmu->as.alloc_mask = 0;
-	ptdev->mmu->as.faulty_mask = 0;
+		for (u32 i = 0; i < ARRAY_SIZE(ptdev->mmu->as.slots); i++) {
+			struct panthor_vm *vm = ptdev->mmu->as.slots[i].vm;
 
-	for (u32 i = 0; i < ARRAY_SIZE(ptdev->mmu->as.slots); i++) {
-		struct panthor_vm *vm = ptdev->mmu->as.slots[i].vm;
-
-		if (vm)
-			panthor_vm_release_as_locked(vm);
+			if (vm)
+				panthor_vm_release_as_locked(vm);
+		}
 	}
 
-	mutex_unlock(&ptdev->mmu->as.slots_lock);
-
 	panthor_irq_resume(&ptdev->mmu->irq);
 
 	/* Restart the VM_BIND queues. */
-	mutex_lock(&ptdev->mmu->vm.lock);
+	guard(mutex)(&ptdev->mmu->vm.lock);
 	list_for_each_entry(vm, &ptdev->mmu->vm.list, node) {
 		panthor_vm_start(vm);
 	}
 	ptdev->mmu->vm.reset_in_progress = false;
-	mutex_unlock(&ptdev->mmu->vm.lock);
 }
 
 static void panthor_vm_free(struct drm_gpuvm *gpuvm)
@@ -1964,46 +1958,45 @@ static void panthor_vm_free(struct drm_gpuvm *gpuvm)
 	struct panthor_vm *vm = container_of(gpuvm, struct panthor_vm, base);
 	struct panthor_device *ptdev = vm->ptdev;
 
-	mutex_lock(&ptdev->reclaim.lock);
-	list_del_init(&vm->reclaim.lru_node);
-	mutex_unlock(&ptdev->reclaim.lock);
+	scoped_guard(mutex, &ptdev->reclaim.lock)
+		list_del_init(&vm->reclaim.lru_node);
 
-	mutex_lock(&vm->heaps.lock);
-	if (drm_WARN_ON(&ptdev->base, vm->heaps.pool))
-		panthor_heap_pool_destroy(vm->heaps.pool);
-	mutex_unlock(&vm->heaps.lock);
+	scoped_guard(mutex, &vm->heaps.lock) {
+		if (drm_WARN_ON(&ptdev->base, vm->heaps.pool))
+			panthor_heap_pool_destroy(vm->heaps.pool);
+	}
 	mutex_destroy(&vm->heaps.lock);
 
-	mutex_lock(&ptdev->mmu->vm.lock);
-	list_del(&vm->node);
-	/* Restore the scheduler state so we can call drm_sched_entity_destroy()
-	 * and drm_sched_fini(). If get there, that means we have no job left
-	 * and no new jobs can be queued, so we can start the scheduler without
-	 * risking interfering with the reset.
-	 */
-	if (ptdev->mmu->vm.reset_in_progress)
-		panthor_vm_start(vm);
-	mutex_unlock(&ptdev->mmu->vm.lock);
+	scoped_guard(mutex, &ptdev->mmu->vm.lock) {
+		list_del(&vm->node);
+
+		/* Restore the scheduler state so we can call drm_sched_entity_destroy()
+		 * and drm_sched_fini(). If get there, that means we have no job left
+		 * and no new jobs can be queued, so we can start the scheduler without
+		 * risking interfering with the reset.
+		 */
+		if (ptdev->mmu->vm.reset_in_progress)
+			panthor_vm_start(vm);
+	}
 
 	drm_sched_entity_destroy(&vm->entity);
 	drm_sched_fini(&vm->sched);
 
-	mutex_lock(&vm->op_lock);
-	mutex_lock(&ptdev->mmu->as.slots_lock);
-	if (vm->as.id >= 0) {
-		int cookie;
+	scoped_guard(mutex, &vm->op_lock) {
+		guard(mutex)(&ptdev->mmu->as.slots_lock);
+		if (vm->as.id >= 0) {
+			int cookie;
 
-		if (drm_dev_enter(&ptdev->base, &cookie)) {
-			panthor_mmu_as_disable(ptdev, vm->as.id, false);
-			drm_dev_exit(cookie);
+			if (drm_dev_enter(&ptdev->base, &cookie)) {
+				panthor_mmu_as_disable(ptdev, vm->as.id, false);
+				drm_dev_exit(cookie);
+			}
+
+			ptdev->mmu->as.slots[vm->as.id].vm = NULL;
+			clear_bit(vm->as.id, &ptdev->mmu->as.alloc_mask);
+			list_del(&vm->as.lru_node);
 		}
-
-		ptdev->mmu->as.slots[vm->as.id].vm = NULL;
-		clear_bit(vm->as.id, &ptdev->mmu->as.alloc_mask);
-		list_del(&vm->as.lru_node);
 	}
-	mutex_unlock(&ptdev->mmu->as.slots_lock);
-	mutex_unlock(&vm->op_lock);
 
 	free_io_pgtable_ops(vm->pgtbl_ops);
 
@@ -2052,7 +2045,7 @@ struct panthor_heap_pool *panthor_vm_get_heap_pool(struct panthor_vm *vm, bool c
 {
 	struct panthor_heap_pool *pool;
 
-	mutex_lock(&vm->heaps.lock);
+	guard(mutex)(&vm->heaps.lock);
 	if (!vm->heaps.pool && create) {
 		if (vm->destroyed)
 			pool = ERR_PTR(-EINVAL);
@@ -2066,7 +2059,6 @@ struct panthor_heap_pool *panthor_vm_get_heap_pool(struct panthor_vm *vm, bool c
 		if (!pool)
 			pool = ERR_PTR(-ENOENT);
 	}
-	mutex_unlock(&vm->heaps.lock);
 
 	return pool;
 }
@@ -2146,9 +2138,8 @@ static void panthor_vma_link(struct panthor_vm *vm,
 {
 	struct panthor_gem_object *bo = to_panthor_bo(vma->base.gem.obj);
 
-	mutex_lock(&bo->base.gpuva.lock);
+	guard(mutex)(&bo->base.gpuva.lock);
 	drm_gpuva_link(&vma->base, vm_bo);
-	mutex_unlock(&bo->base.gpuva.lock);
 }
 
 static void panthor_vma_unlink(struct panthor_vma *vma)
@@ -2362,11 +2353,10 @@ void panthor_vm_update_bo_reclaim_lru_locked(struct panthor_gem_object *bo)
 		drm_WARN_ON(&ptdev->base, vm);
 		vm = container_of(vm_bo->vm, struct panthor_vm, base);
 
-		mutex_lock(&ptdev->reclaim.lock);
+		guard(mutex)(&ptdev->reclaim.lock);
 		drm_gem_lru_move_tail_locked(&vm->reclaim.lru, &bo->base);
 		if (list_empty(&vm->reclaim.lru_node))
 			list_move(&vm->reclaim.lru_node, &ptdev->reclaim.vms);
-		mutex_unlock(&ptdev->reclaim.lock);
 	}
 }
 
@@ -2379,7 +2369,8 @@ int panthor_vm_evict_bo_mappings_locked(struct panthor_gem_object *bo)
 		struct panthor_vm *vm = container_of(vm_bo->vm, struct panthor_vm, base);
 		struct drm_gpuva *va;
 
-		if (!mutex_trylock(&vm->op_lock))
+		ACQUIRE(mutex_try, op_guard)(&vm->op_lock);
+		if (ACQUIRE_ERR(mutex_try, &op_guard))
 			return -EDEADLK;
 
 		/* It can be that the vm_bo was already evicted but a new
@@ -2417,8 +2408,6 @@ int panthor_vm_evict_bo_mappings_locked(struct panthor_gem_object *bo)
 			vma->evicted = true;
 		}
 
-		mutex_unlock(&vm->op_lock);
-
 		if (ret)
 			break;
 	}
@@ -2434,7 +2423,7 @@ static struct panthor_vma *select_evicted_vma(struct drm_gpuvm_bo *vm_bo,
 	struct drm_gpuva *va;
 
 	/* Take op_lock to protect against va insertion/removal. */
-	mutex_lock(&vm->op_lock);
+	guard(mutex)(&vm->op_lock);
 	drm_gpuvm_bo_for_each_va(va, vm_bo) {
 		struct panthor_vma *vma = container_of(va, struct panthor_vma, base);
 
@@ -2445,7 +2434,6 @@ static struct panthor_vma *select_evicted_vma(struct drm_gpuvm_bo *vm_bo,
 			break;
 		}
 	}
-	mutex_unlock(&vm->op_lock);
 
 	return first_evicted_vma;
 }
@@ -2469,45 +2457,44 @@ static int remap_evicted_vma(struct drm_gpuvm_bo *vm_bo,
 	 * to release it so we can allocate PTs, because this very same lock
 	 * is taken in a DMA-signalling path.
 	 */
-	mutex_lock(&vm->op_lock);
-	drm_gpuvm_bo_for_each_va(va, vm_bo) {
-		struct panthor_vma *vma = container_of(va, struct panthor_vma, base);
+	scoped_guard(mutex, &vm->op_lock) {
+		drm_gpuvm_bo_for_each_va(va, vm_bo) {
+			struct panthor_vma *vma = container_of(va, struct panthor_vma, base);
 
-		if (vma != evicted_vma)
-			continue;
+			if (vma != evicted_vma)
+				continue;
 
-		/* Because we had to release the lock between the evicted_vma selection
-		 * and its repopulation, we can't rely solely on pointer equality (the
-		 * VMA might have been freed and a new one allocated at the same address).
-		 * If the evicted bit is still set, we're sure it's our VMA, because
-		 * population/eviction is serialized with the BO resv lock.
-		 */
-		if (vma->evicted)
-			found = true;
+			/* Because we had to release the lock between the evicted_vma selection
+			 * and its repopulation, we can't rely solely on pointer equality (the
+			 * VMA might have been freed and a new one allocated at the same address).
+			 * If the evicted bit is still set, we're sure it's our VMA, because
+			 * population/eviction is serialized with the BO resv lock.
+			 */
+			if (vma->evicted)
+				found = true;
 
-		break;
-	}
-
-	if (found) {
-		vm->op_ctx = op_ctx;
-		ret = panthor_vm_lock_region(vm, evicted_vma->base.va.addr,
-					     evicted_vma->base.va.range);
-		if (!ret) {
-			ret = panthor_vm_map_pages(vm, evicted_vma->base.va.addr,
-						   flags_to_prot(evicted_vma->flags),
-						   bo->dmap.sgt,
-						   evicted_vma->base.gem.offset,
-						   evicted_vma->base.va.range);
-			if (!ret)
-				evicted_vma->evicted = false;
-
-			panthor_vm_unlock_region(vm);
+			break;
 		}
 
-		vm->op_ctx = NULL;
-	}
+		if (found) {
+			vm->op_ctx = op_ctx;
+			ret = panthor_vm_lock_region(vm, evicted_vma->base.va.addr,
+						     evicted_vma->base.va.range);
+			if (!ret) {
+				ret = panthor_vm_map_pages(vm, evicted_vma->base.va.addr,
+							   flags_to_prot(evicted_vma->flags),
+							   bo->dmap.sgt,
+							   evicted_vma->base.gem.offset,
+							   evicted_vma->base.va.range);
+				if (!ret)
+					evicted_vma->evicted = false;
 
-	mutex_unlock(&vm->op_lock);
+				panthor_vm_unlock_region(vm);
+			}
+
+			vm->op_ctx = NULL;
+		}
+	}
 
 out_cleanup:
 	panthor_vm_cleanup_op_ctx(op_ctx, vm);
@@ -2550,9 +2537,8 @@ static int panthor_vm_bo_validate(struct drm_gpuvm_bo *vm_bo,
 		return ret;
 
 	drm_gpuvm_bo_evict(vm_bo, false);
-	mutex_lock(&bo->base.gpuva.lock);
+	guard(mutex)(&bo->base.gpuva.lock);
 	panthor_gem_update_reclaim_state_locked(bo, NULL);
-	mutex_unlock(&bo->base.gpuva.lock);
 	return 0;
 }
 
@@ -2594,7 +2580,7 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct panthor_vm_op_ctx *op,
 	if (op_type == DRM_PANTHOR_VM_BIND_OP_TYPE_SYNC_ONLY)
 		return 0;
 
-	mutex_lock(&vm->op_lock);
+	guard(mutex)(&vm->op_lock);
 	vm->op_ctx = op;
 
 	ret = panthor_vm_lock_region(vm, op->va.addr, op->va.range);
@@ -2635,8 +2621,6 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct panthor_vm_op_ctx *op,
 		panthor_vm_declare_unusable(vm);
 
 	vm->op_ctx = NULL;
-	mutex_unlock(&vm->op_lock);
-
 	return ret;
 }
 
@@ -2812,13 +2796,13 @@ panthor_vm_create(struct panthor_device *ptdev, bool for_mcu,
 	mair = io_pgtable_ops_to_pgtable(vm->pgtbl_ops)->cfg.arm_lpae_s1_cfg.mair;
 	vm->memattr = mair_to_memattr(mair, ptdev->coherent);
 
-	mutex_lock(&ptdev->mmu->vm.lock);
-	list_add_tail(&vm->node, &ptdev->mmu->vm.list);
+	scoped_guard(mutex, &ptdev->mmu->vm.lock) {
+		list_add_tail(&vm->node, &ptdev->mmu->vm.list);
 
-	/* If a reset is in progress, stop the scheduler. */
-	if (ptdev->mmu->vm.reset_in_progress)
-		panthor_vm_stop(vm);
-	mutex_unlock(&ptdev->mmu->vm.lock);
+		/* If a reset is in progress, stop the scheduler. */
+		if (ptdev->mmu->vm.reset_in_progress)
+			panthor_vm_stop(vm);
+	}
 
 	/* We intentionally leave the reserved range to zero, because we want kernel VMAs
 	 * to be handled the same way user VMAs are.
@@ -3142,48 +3126,44 @@ panthor_mmu_reclaim_priv_bos(struct panthor_device *ptdev,
 	LIST_HEAD(remaining_vms);
 	LIST_HEAD(vms);
 
-	mutex_lock(&ptdev->reclaim.lock);
-	list_splice_init(&ptdev->reclaim.vms, &vms);
+	scoped_guard(mutex, &ptdev->reclaim.lock)
+		list_splice_init(&ptdev->reclaim.vms, &vms);
 
 	while (freed < nr_to_scan) {
 		struct panthor_vm *vm;
 
-		vm = list_first_entry_or_null(&vms, typeof(*vm),
-					      reclaim.lru_node);
-		if (!vm)
-			break;
-
-		if (!kref_get_unless_zero(&vm->base.kref)) {
-			list_del_init(&vm->reclaim.lru_node);
-			continue;
+		scoped_guard(mutex, &ptdev->reclaim.lock) {
+			vm = list_first_entry_or_null(&vms, typeof(*vm),
+						      reclaim.lru_node);
+			if (vm && !kref_get_unless_zero(&vm->base.kref)) {
+				list_del_init(&vm->reclaim.lru_node);
+				vm = NULL;
+			}
 		}
 
-		mutex_unlock(&ptdev->reclaim.lock);
+		if (!vm)
+			break;
 
 		freed += drm_gem_lru_scan(&vm->reclaim.lru, nr_to_scan - freed,
 					  remaining, shrink, NULL);
 
-		mutex_lock(&ptdev->reclaim.lock);
-
-		/* If the VM is still in the temporary list, remove it so we
-		 * can proceed with the next VM.
-		 */
-		if (vm == list_first_entry_or_null(&vms, typeof(*vm), reclaim.lru_node)) {
-			list_del_init(&vm->reclaim.lru_node);
-
-			/* Keep the VM around if there are still things to
-			 * reclaim, so we can preserve the LRU order when
-			 * re-inserting in ptdev->reclaim.vms at the end.
+		scoped_guard(mutex, &ptdev->reclaim.lock) {
+			/* If the VM is still in the temporary list, remove it so we
+			 * can proceed with the next VM.
 			 */
-			if (vm->reclaim.lru.count > 0)
-				list_add_tail(&vm->reclaim.lru_node, &remaining_vms);
+			if (vm == list_first_entry_or_null(&vms, typeof(*vm), reclaim.lru_node)) {
+				list_del_init(&vm->reclaim.lru_node);
+
+				/* Keep the VM around if there are still things to
+				 * reclaim, so we can preserve the LRU order when
+				 * re-inserting in ptdev->reclaim.vms at the end.
+				 */
+				if (vm->reclaim.lru.count > 0)
+					list_add_tail(&vm->reclaim.lru_node, &remaining_vms);
+			}
 		}
 
-		mutex_unlock(&ptdev->reclaim.lock);
-
 		panthor_vm_put(vm);
-
-		mutex_lock(&ptdev->reclaim.lock);
 	}
 
 	/* Re-insert VMs with remaining data to reclaim at the beginning of
@@ -3192,9 +3172,10 @@ panthor_mmu_reclaim_priv_bos(struct panthor_device *ptdev,
 	 * temporary [remaining_]vms list, meaning anything we re-insert here
 	 * preserves the LRU order.
 	 */
-	list_splice_tail(&vms, &remaining_vms);
-	list_splice(&remaining_vms, &ptdev->reclaim.vms);
-	mutex_unlock(&ptdev->reclaim.lock);
+	scoped_guard(mutex, &ptdev->reclaim.lock) {
+		list_splice_tail(&vms, &remaining_vms);
+		list_splice(&remaining_vms, &ptdev->reclaim.vms);
+	}
 
 	return freed;
 }
@@ -3211,7 +3192,7 @@ void panthor_mmu_unplug(struct panthor_device *ptdev)
 	if (!IS_ENABLED(CONFIG_PM) || pm_runtime_active(ptdev->base.dev))
 		panthor_irq_suspend(&ptdev->mmu->irq);
 
-	mutex_lock(&ptdev->mmu->as.slots_lock);
+	guard(mutex)(&ptdev->mmu->as.slots_lock);
 	for (u32 i = 0; i < ARRAY_SIZE(ptdev->mmu->as.slots); i++) {
 		struct panthor_vm *vm = ptdev->mmu->as.slots[i].vm;
 
@@ -3221,7 +3202,6 @@ void panthor_mmu_unplug(struct panthor_device *ptdev)
 			panthor_vm_release_as_locked(vm);
 		}
 	}
-	mutex_unlock(&ptdev->mmu->as.slots_lock);
 }
 
 static void panthor_mmu_release_wq(struct drm_device *ddev, void *res)
@@ -3290,13 +3270,9 @@ int panthor_mmu_init(struct panthor_device *ptdev)
 #ifdef CONFIG_DEBUG_FS
 static int show_vm_gpuvas(struct panthor_vm *vm, struct seq_file *m)
 {
-	int ret;
+	guard(mutex)(&vm->op_lock);
 
-	mutex_lock(&vm->op_lock);
-	ret = drm_debugfs_gpuva_info(m, &vm->base);
-	mutex_unlock(&vm->op_lock);
-
-	return ret;
+	return drm_debugfs_gpuva_info(m, &vm->base);
 }
 
 static int show_each_vm(struct seq_file *m, void *arg)
@@ -3308,17 +3284,16 @@ static int show_each_vm(struct seq_file *m, void *arg)
 	struct panthor_vm *vm;
 	int ret = 0;
 
-	mutex_lock(&ptdev->mmu->vm.lock);
+	guard(mutex)(&ptdev->mmu->vm.lock);
 	list_for_each_entry(vm, &ptdev->mmu->vm.list, node) {
 		ret = show(vm, m);
 		if (ret < 0)
-			break;
+			return ret;
 
 		seq_puts(m, "\n");
 	}
-	mutex_unlock(&ptdev->mmu->vm.lock);
 
-	return ret;
+	return 0;
 }
 
 static struct drm_info_list panthor_mmu_debugfs_list[] = {
diff --git a/drivers/gpu/drm/panthor/panthor_pwr.c b/drivers/gpu/drm/panthor/panthor_pwr.c
index 1efb7f3482ba..340d3260bd55 100644
--- a/drivers/gpu/drm/panthor/panthor_pwr.c
+++ b/drivers/gpu/drm/panthor/panthor_pwr.c
@@ -61,7 +61,7 @@ static void panthor_pwr_irq_handler(struct panthor_irq *pirq, u32 status)
 	struct panthor_device *ptdev = pirq->ptdev;
 	struct panthor_pwr *pwr = ptdev->pwr;
 
-	spin_lock(&ptdev->pwr->reqs_lock);
+	guard(spinlock_irqsave)(&ptdev->pwr->reqs_lock);
 	gpu_write(pwr->irq.iomem, INT_CLEAR, status);
 
 	if (unlikely(status & PWR_IRQ_COMMAND_NOT_ALLOWED))
@@ -74,7 +74,6 @@ static void panthor_pwr_irq_handler(struct panthor_irq *pirq, u32 status)
 		ptdev->pwr->pending_reqs &= ~status;
 		wake_up_all(&ptdev->pwr->reqs_acked);
 	}
-	spin_unlock(&ptdev->pwr->reqs_lock);
 }
 
 static irqreturn_t panthor_pwr_irq_threaded_handler(int irq, void *data)
@@ -452,8 +451,6 @@ static int panthor_pwr_domain_force_off(struct panthor_device *ptdev, u32 domain
 
 void panthor_pwr_unplug(struct panthor_device *ptdev)
 {
-	unsigned long flags;
-
 	if (!ptdev->pwr)
 		return;
 
@@ -461,10 +458,9 @@ void panthor_pwr_unplug(struct panthor_device *ptdev)
 	panthor_irq_suspend(&ptdev->pwr->irq);
 
 	/* Wake-up all waiters. */
-	spin_lock_irqsave(&ptdev->pwr->reqs_lock, flags);
+	guard(spinlock_irqsave)(&ptdev->pwr->reqs_lock);
 	ptdev->pwr->pending_reqs = 0;
 	wake_up_all(&ptdev->pwr->reqs_acked);
-	spin_unlock_irqrestore(&ptdev->pwr->reqs_lock, flags);
 }
 
 int panthor_pwr_init(struct panthor_device *ptdev)
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index a9124bcc7de6..d8cadd393fbe 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -1492,21 +1492,21 @@ static int group_process_tiler_oom(struct panthor_group *group, u32 cs_id)
 	u32 vt_start, vt_end, frag_end;
 	int ret, csg_id;
 
-	mutex_lock(&sched->lock);
-	csg_id = group->csg_id;
-	if (csg_id >= 0) {
-		struct panthor_fw_cs_iface *cs_iface;
+	scoped_guard(mutex, &sched->lock) {
+		csg_id = group->csg_id;
+		if (csg_id >= 0) {
+			struct panthor_fw_cs_iface *cs_iface;
 
-		cs_iface = panthor_fw_get_cs_iface(ptdev, csg_id, cs_id);
-		heaps = panthor_vm_get_heap_pool(group->vm, false);
-		heap_address = cs_iface->output->heap_address;
-		vt_start = cs_iface->output->heap_vt_start;
-		vt_end = cs_iface->output->heap_vt_end;
-		frag_end = cs_iface->output->heap_frag_end;
-		renderpasses_in_flight = vt_start - frag_end;
-		pending_frag_count = vt_end - frag_end;
+			cs_iface = panthor_fw_get_cs_iface(ptdev, csg_id, cs_id);
+			heaps = panthor_vm_get_heap_pool(group->vm, false);
+			heap_address = cs_iface->output->heap_address;
+			vt_start = cs_iface->output->heap_vt_start;
+			vt_end = cs_iface->output->heap_vt_end;
+			frag_end = cs_iface->output->heap_frag_end;
+			renderpasses_in_flight = vt_start - frag_end;
+			pending_frag_count = vt_end - frag_end;
+		}
 	}
-	mutex_unlock(&sched->lock);
 
 	/* The group got scheduled out, we stop here. We will get a new tiler OOM event
 	 * when it's scheduled again.
@@ -1537,22 +1537,22 @@ static int group_process_tiler_oom(struct panthor_group *group, u32 cs_id)
 		goto out_put_heap_pool;
 	}
 
-	mutex_lock(&sched->lock);
-	csg_id = group->csg_id;
-	if (csg_id >= 0) {
-		struct panthor_fw_csg_iface *csg_iface;
-		struct panthor_fw_cs_iface *cs_iface;
+	scoped_guard(mutex, &sched->lock) {
+		csg_id = group->csg_id;
+		if (csg_id >= 0) {
+			struct panthor_fw_csg_iface *csg_iface;
+			struct panthor_fw_cs_iface *cs_iface;
 
-		csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
-		cs_iface = panthor_fw_get_cs_iface(ptdev, csg_id, cs_id);
+			csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
+			cs_iface = panthor_fw_get_cs_iface(ptdev, csg_id, cs_id);
 
-		cs_iface->input->heap_start = new_chunk_va;
-		cs_iface->input->heap_end = new_chunk_va;
-		panthor_fw_update_reqs(cs_iface, req, cs_iface->output->ack, CS_TILER_OOM);
-		panthor_fw_toggle_reqs(csg_iface, doorbell_req, doorbell_ack, BIT(cs_id));
-		panthor_fw_ring_csg_doorbells(ptdev, BIT(csg_id));
+			cs_iface->input->heap_start = new_chunk_va;
+			cs_iface->input->heap_end = new_chunk_va;
+			panthor_fw_update_reqs(cs_iface, req, cs_iface->output->ack, CS_TILER_OOM);
+			panthor_fw_toggle_reqs(csg_iface, doorbell_req, doorbell_ack, BIT(cs_id));
+			panthor_fw_ring_csg_doorbells(ptdev, BIT(csg_id));
+		}
 	}
-	mutex_unlock(&sched->lock);
 
 	/* We allocated a chunck, but couldn't link it to the heap
 	 * context because the group was scheduled out while we were
@@ -2505,24 +2505,15 @@ tick_ctx_update_resched_target(struct panthor_scheduler *sched,
 	return U64_MAX;
 }
 
-static void tick_work(struct work_struct *work)
+static void tick(struct panthor_scheduler *sched)
 {
-	struct panthor_scheduler *sched = container_of(work, struct panthor_scheduler,
-						      tick_work.work);
 	struct panthor_device *ptdev = sched->ptdev;
 	struct panthor_sched_tick_ctx ctx;
 	u64 resched_target = sched->resched_target;
 	u64 remaining_jiffies = 0, resched_delay;
 	u64 now = get_jiffies_64();
-	int prio, ret, cookie;
 	bool full_tick;
-
-	if (!drm_dev_enter(&ptdev->base, &cookie))
-		return;
-
-	ret = panthor_device_resume_and_get(ptdev);
-	if (drm_WARN_ON(&ptdev->base, ret))
-		goto out_dev_exit;
+	int prio;
 
 	/* If the tick is stopped, calculate when the next tick would be */
 	if (resched_target == U64_MAX)
@@ -2533,9 +2524,9 @@ static void tick_work(struct work_struct *work)
 
 	full_tick = remaining_jiffies == 0;
 
-	mutex_lock(&sched->lock);
+	guard(mutex)(&sched->lock);
 	if (panthor_device_reset_is_pending(sched->ptdev))
-		goto out_unlock;
+		return;
 
 	tick_ctx_init(sched, &ctx);
 	if (ctx.csg_upd_failed_mask)
@@ -2626,9 +2617,23 @@ static void tick_work(struct work_struct *work)
 
 out_cleanup_ctx:
 	tick_ctx_cleanup(sched, &ctx);
+}
 
-out_unlock:
-	mutex_unlock(&sched->lock);
+static void tick_work(struct work_struct *work)
+{
+	struct panthor_scheduler *sched = container_of(work, struct panthor_scheduler,
+						      tick_work.work);
+	struct panthor_device *ptdev = sched->ptdev;
+	int ret, cookie;
+
+	if (!drm_dev_enter(&ptdev->base, &cookie))
+		return;
+
+	ret = panthor_device_resume_and_get(ptdev);
+	if (drm_WARN_ON(&ptdev->base, ret))
+		goto out_dev_exit;
+
+	tick(sched);
 	pm_runtime_mark_last_busy(ptdev->base.dev);
 	pm_runtime_put_autosuspend(ptdev->base.dev);
 
@@ -2673,7 +2678,7 @@ static void sync_upd_work(struct work_struct *work)
 	struct panthor_group *group, *tmp;
 	bool immediate_tick = false;
 
-	mutex_lock(&sched->lock);
+	guard(mutex)(&sched->lock);
 	list_for_each_entry_safe(group, tmp, &sched->groups.waiting, wait_node) {
 		u32 tested_queues = group->blocked_queues;
 		u32 unblocked_queues = 0;
@@ -2704,7 +2709,6 @@ static void sync_upd_work(struct work_struct *work)
 		if (!group->blocked_queues)
 			list_del_init(&group->wait_node);
 	}
-	mutex_unlock(&sched->lock);
 
 	if (immediate_tick)
 		sched_queue_delayed_work(sched, tick, 0);
@@ -2877,7 +2881,7 @@ void panthor_sched_suspend(struct panthor_device *ptdev)
 	u32 suspended_slots;
 	u32 i;
 
-	mutex_lock(&sched->lock);
+	guard(mutex)(&sched->lock);
 	csgs_upd_ctx_init(&upd_ctx);
 	for (i = 0; i < sched->csg_slot_count; i++) {
 		struct panthor_csg_slot *csg_slot = &sched->csg_slots[i];
@@ -2998,7 +3002,6 @@ void panthor_sched_suspend(struct panthor_device *ptdev)
 		}
 		group_put(group);
 	}
-	mutex_unlock(&sched->lock);
 }
 
 void panthor_sched_pre_reset(struct panthor_device *ptdev)
@@ -3007,7 +3010,7 @@ void panthor_sched_pre_reset(struct panthor_device *ptdev)
 	struct panthor_group *group, *group_tmp;
 	u32 i;
 
-	mutex_lock(&sched->reset.lock);
+	guard(mutex)(&sched->reset.lock);
 	atomic_set(&sched->reset.in_progress, true);
 
 	/* Cancel all scheduler works. Once this is done, these works can't be
@@ -3030,8 +3033,6 @@ void panthor_sched_pre_reset(struct panthor_device *ptdev)
 		list_for_each_entry_safe(group, group_tmp, &sched->groups.idle[i], run_node)
 			panthor_group_stop(group);
 	}
-
-	mutex_unlock(&sched->reset.lock);
 }
 
 void panthor_sched_post_reset(struct panthor_device *ptdev, bool reset_failed)
@@ -3039,7 +3040,7 @@ void panthor_sched_post_reset(struct panthor_device *ptdev, bool reset_failed)
 	struct panthor_scheduler *sched = ptdev->scheduler;
 	struct panthor_group *group, *group_tmp;
 
-	mutex_lock(&sched->reset.lock);
+	guard(mutex)(&sched->reset.lock);
 
 	list_for_each_entry_safe(group, group_tmp, &sched->reset.stopped_groups, run_node) {
 		/* Consider all previously running group as terminated if the
@@ -3055,7 +3056,6 @@ void panthor_sched_post_reset(struct panthor_device *ptdev, bool reset_failed)
 	 * kick the scheduler.
 	 */
 	atomic_set(&sched->reset.in_progress, false);
-	mutex_unlock(&sched->reset.lock);
 
 	/* No need to queue a tick and update syncs if the reset failed. */
 	if (!reset_failed) {
@@ -3265,36 +3265,19 @@ static u32 calc_job_credits(u32 profile_mask)
 }
 
 static struct dma_fence *
-queue_run_job(struct drm_sched_job *sched_job)
+queue_run_job_locked(struct panthor_job *job)
 {
-	struct panthor_job *job = container_of(sched_job, struct panthor_job, base);
 	struct panthor_group *group = job->group;
 	struct panthor_queue *queue = group->queues[job->queue_idx];
 	struct panthor_device *ptdev = group->ptdev;
 	struct panthor_scheduler *sched = ptdev->scheduler;
 	struct panthor_job_ringbuf_instrs instrs;
 	struct panthor_job_cs_params cs_params;
-	struct dma_fence *done_fence;
-	int ret;
 
-	/* Stream size is zero, nothing to do except making sure all previously
-	 * submitted jobs are done before we signal the
-	 * drm_sched_job::s_fence::finished fence.
-	 */
-	if (!job->call_info.size) {
-		job->done_fence = dma_fence_get(queue->fence_ctx.last_fence);
-		return dma_fence_get(job->done_fence);
-	}
+	lockdep_assert_held(&sched->lock);
 
-	ret = panthor_device_resume_and_get(ptdev);
-	if (drm_WARN_ON(&ptdev->base, ret))
-		return ERR_PTR(ret);
-
-	mutex_lock(&sched->lock);
-	if (!group_can_run(group)) {
-		done_fence = ERR_PTR(-ECANCELED);
-		goto out_unlock;
-	}
+	if (!group_can_run(group))
+		return ERR_PTR(-ECANCELED);
 
 	dma_fence_init(job->done_fence,
 		       &panthor_queue_fence_ops,
@@ -3355,10 +3338,37 @@ queue_run_job(struct drm_sched_job *sched_job)
 	dma_fence_put(queue->fence_ctx.last_fence);
 	queue->fence_ctx.last_fence = dma_fence_get(job->done_fence);
 
-	done_fence = dma_fence_get(job->done_fence);
+	return dma_fence_get(job->done_fence);
+}
+
+static struct dma_fence *
+queue_run_job(struct drm_sched_job *sched_job)
+{
+	struct panthor_job *job = container_of(sched_job, struct panthor_job, base);
+	struct panthor_group *group = job->group;
+	struct panthor_queue *queue = group->queues[job->queue_idx];
+	struct panthor_device *ptdev = group->ptdev;
+	struct panthor_scheduler *sched = ptdev->scheduler;
+	struct dma_fence *done_fence;
+	int ret;
+
+	/* Stream size is zero, nothing to do except making sure all previously
+	 * submitted jobs are done before we signal the
+	 * drm_sched_job::s_fence::finished fence.
+	 */
+	if (!job->call_info.size) {
+		job->done_fence = dma_fence_get(queue->fence_ctx.last_fence);
+		return dma_fence_get(job->done_fence);
+	}
+
+	ret = panthor_device_resume_and_get(ptdev);
+	if (drm_WARN_ON(&ptdev->base, ret))
+		return ERR_PTR(ret);
+
+	scoped_guard(mutex, &sched->lock) {
+		done_fence = queue_run_job_locked(job);
+	}
 
-out_unlock:
-	mutex_unlock(&sched->lock);
 	pm_runtime_mark_last_busy(ptdev->base.dev);
 	pm_runtime_put_autosuspend(ptdev->base.dev);
 
@@ -3381,20 +3391,20 @@ queue_timedout_job(struct drm_sched_job *sched_job)
 
 	queue_stop(queue, job);
 
-	mutex_lock(&sched->lock);
-	group->timedout = true;
-	if (group->csg_id >= 0) {
-		sched_queue_delayed_work(ptdev->scheduler, tick, 0);
-	} else {
-		/* Remove from the run queues, so the scheduler can't
-		 * pick the group on the next tick.
-		 */
-		list_del_init(&group->run_node);
-		list_del_init(&group->wait_node);
+	scoped_guard(mutex, &sched->lock) {
+		group->timedout = true;
+		if (group->csg_id >= 0) {
+			sched_queue_delayed_work(ptdev->scheduler, tick, 0);
+		} else {
+			/* Remove from the run queues, so the scheduler can't
+			 * pick the group on the next tick.
+			 */
+			list_del_init(&group->run_node);
+			list_del_init(&group->wait_node);
 
-		group_queue_work(group, term);
+			group_queue_work(group, term);
+		}
 	}
-	mutex_unlock(&sched->lock);
 
 	queue_start(queue);
 	return DRM_GPU_SCHED_STAT_RESET;
@@ -3713,16 +3723,15 @@ int panthor_group_create(struct panthor_file *pfile,
 
 	group->idle_queues = GENMASK(group->queue_count - 1, 0);
 
-	mutex_lock(&sched->reset.lock);
-	if (atomic_read(&sched->reset.in_progress)) {
-		panthor_group_stop(group);
-	} else {
-		mutex_lock(&sched->lock);
-		list_add_tail(&group->run_node,
-			      &sched->groups.idle[group->priority]);
-		mutex_unlock(&sched->lock);
+	scoped_guard(mutex, &sched->reset.lock) {
+		if (atomic_read(&sched->reset.in_progress)) {
+			panthor_group_stop(group);
+		} else {
+			guard(mutex)(&sched->lock);
+			list_add_tail(&group->run_node,
+				      &sched->groups.idle[group->priority]);
+		}
 	}
-	mutex_unlock(&sched->reset.lock);
 
 	add_group_kbo_sizes(group->ptdev, group);
 	spin_lock_init(&group->fdinfo.lock);
@@ -3755,21 +3764,20 @@ int panthor_group_destroy(struct panthor_file *pfile, u32 group_handle)
 	if (!group)
 		return -EINVAL;
 
-	mutex_lock(&sched->reset.lock);
-	mutex_lock(&sched->lock);
-	group->destroyed = true;
-	if (group->csg_id >= 0) {
-		sched_queue_delayed_work(sched, tick, 0);
-	} else if (!atomic_read(&sched->reset.in_progress)) {
-		/* Remove from the run queues, so the scheduler can't
-		 * pick the group on the next tick.
-		 */
-		list_del_init(&group->run_node);
-		list_del_init(&group->wait_node);
-		group_queue_work(group, term);
+	scoped_guard(mutex, &sched->reset.lock) {
+		guard(mutex)(&sched->lock);
+		group->destroyed = true;
+		if (group->csg_id >= 0) {
+			sched_queue_delayed_work(sched, tick, 0);
+		} else if (!atomic_read(&sched->reset.in_progress)) {
+			/* Remove from the run queues, so the scheduler can't
+			 * pick the group on the next tick.
+			 */
+			list_del_init(&group->run_node);
+			list_del_init(&group->wait_node);
+			group_queue_work(group, term);
+		}
 	}
-	mutex_unlock(&sched->lock);
-	mutex_unlock(&sched->reset.lock);
 
 	group_put(group);
 	return 0;
@@ -3804,16 +3812,16 @@ int panthor_group_get_state(struct panthor_file *pfile,
 
 	memset(get_state, 0, sizeof(*get_state));
 
-	mutex_lock(&sched->lock);
-	if (group->timedout)
-		get_state->state |= DRM_PANTHOR_GROUP_STATE_TIMEDOUT;
-	if (group->fatal_queues) {
-		get_state->state |= DRM_PANTHOR_GROUP_STATE_FATAL_FAULT;
-		get_state->fatal_queues = group->fatal_queues;
+	scoped_guard(mutex, &sched->lock) {
+		if (group->timedout)
+			get_state->state |= DRM_PANTHOR_GROUP_STATE_TIMEDOUT;
+		if (group->fatal_queues) {
+			get_state->state |= DRM_PANTHOR_GROUP_STATE_FATAL_FAULT;
+			get_state->fatal_queues = group->fatal_queues;
+		}
+		if (group->innocent)
+			get_state->state |= DRM_PANTHOR_GROUP_STATE_INNOCENT;
 	}
-	if (group->innocent)
-		get_state->state |= DRM_PANTHOR_GROUP_STATE_INNOCENT;
-	mutex_unlock(&sched->lock);
 
 	group_put(group);
 	return 0;
@@ -4023,12 +4031,11 @@ void panthor_sched_unplug(struct panthor_device *ptdev)
 	disable_delayed_work_sync(&sched->tick_work);
 	disable_work_sync(&sched->sync_upd_work);
 
-	mutex_lock(&sched->lock);
+	guard(mutex)(&sched->lock);
 	if (sched->pm.has_ref) {
 		pm_runtime_put(ptdev->base.dev);
 		sched->pm.has_ref = false;
 	}
-	mutex_unlock(&sched->lock);
 }
 
 static void panthor_sched_fini(struct drm_device *ddev, void *res)

-- 
2.54.0


