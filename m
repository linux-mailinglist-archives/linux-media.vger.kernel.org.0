Return-Path: <linux-media+bounces-60576-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEHfH4Qc+2nSWgMAu9opvQ
	(envelope-from <linux-media+bounces-60576-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 12:48:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D86544D97B1
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 12:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99F2E304F218
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 10:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ABC84218BD;
	Wed,  6 May 2026 10:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="FpF3u8K2"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACEF7260D;
	Wed,  6 May 2026 10:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778064399; cv=pass; b=hRw4jP9ZULBA1pGbIkPSWuXJKKzWll4OkEsBOjxW0X3jUf0x9H6sdpeEeu6O/jiHj9wU5oqNeBytwrEBjwr3PLYKh6Igwdgk7hgdrkV+kAZDh923z+fIdEC76l++/Q5rlW4mBDV3a2oS+49OxW0IkVGVh513XsC4hDm70DJA+Jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778064399; c=relaxed/simple;
	bh=g03dKKT1ZjNdoyf6Q5IfLskA0CS5qfa4z+kHJb10XSI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lrqmv/qgG+vwoM7cWQYw0zR0qaxmYTPz+bKiPsmLQ1GMhTcMYuMwxgl8HyLLuAYqOu0Gy+utyF4xFgiorUjoKIc/K7jIlq02l8Ko3240YXfh/iAgyhMlut2e38AEkTlguXCq1Da9hJ31f6iaX1GJGK2+pE80DzAb6Ap1Lc8vD18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=FpF3u8K2; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1778064385; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ToBYWr2rfPrx8OdcrtbsFqU3uBI2K19G16251aaDLeh/esreR80A+kvs+s26mEtHsbuhttJLzJmIa3kHwYaw+nefLxA879hC9IkyCT2miZJqgCtnR1Zd+QEn3XzEFNg8EBdYz/9V9LP4cj5r0N4GyLbm+SlgUBOyc9BMJXe7Elg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778064385; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vC5Ti96d2pHAA98KqlsOt+8u7IhA9j3QH0f3efMfNJI=; 
	b=NR/ktKsP6BmE2Cm4WiCNBi1Axq2E8p33FNZKZwZhPxLF3S3r3hApKbWaJ4cf3x2TvQAyifr4auZzVcdNmo4IpXD5+xJBMuEOyxvjp32i9RJUixHG7RUVUrWU3ihwCewW+T3sqXRcP63nc9vXFL51v+otib/Qctq6EZtzIsRdtjE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778064385;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=vC5Ti96d2pHAA98KqlsOt+8u7IhA9j3QH0f3efMfNJI=;
	b=FpF3u8K2IeD13Tcp4UvT9hz46SpsmnD607gkQuDQTvsa0QCu7HpzP+oDBUyzqjjD
	K3NaLk2fJnDkmVRn8HEQmgRJ/s+5FU6eOYDVaOrwX4A00kHcTtCgZwA/yZWergrKdox
	/ut1z/b8w3TZvj+9Mxe9AVHJk0BdzcMppkKSogVY=
Received: by mx.zohomail.com with SMTPS id 1778064383726461.6157625485929;
	Wed, 6 May 2026 03:46:23 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 06 May 2026 12:45:58 +0200
Subject: [PATCH 3/4] drm/panthor: Add explicit memory reclaim sysfs knob
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-panthor-explicit-reclaim-v1-3-44f82ac147ce@collabora.com>
References: <20260506-panthor-explicit-reclaim-v1-0-44f82ac147ce@collabora.com>
In-Reply-To: <20260506-panthor-explicit-reclaim-v1-0-44f82ac147ce@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: D86544D97B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[collabora.com,arm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60576-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

For deployments of systems with very tight memory and a system resource
manager process that can make well-founded decisions on trade-offs, a
way to tell panthor's GEM shrinker to run a reclaim on a specific
process immediately is of interest.

Make it possible to do this by adding a new sysfs file, called
"mem_reclaim", which kicks off a reclaim for private BOs owned by the
process whose TGID is written to the file.

Processes may trigger an explicit reclaim on themselves, but triggering
it on other processes requires the CAP_SYS_RESOURCE capability.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 Documentation/ABI/testing/sysfs-driver-panthor-mem | 17 ++++++
 drivers/gpu/drm/panthor/panthor_drv.c              | 67 ++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_gem.c              |  4 +-
 drivers/gpu/drm/panthor/panthor_gem.h              |  1 +
 drivers/gpu/drm/panthor/panthor_mmu.c              | 33 +++++++++++
 drivers/gpu/drm/panthor/panthor_mmu.h              |  2 +
 6 files changed, 122 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-panthor-mem b/Documentation/ABI/testing/sysfs-driver-panthor-mem
new file mode 100644
index 000000000000..6639394abed2
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-panthor-mem
@@ -0,0 +1,17 @@
+What:		/sys/bus/platform/drivers/panthor/.../mem_reclaim
+Date:		May 2026
+Contact:	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
+Description:
+		(WO) Writing to this file will trigger a GPU memory reclaim run for all
+		panthor GPU contexts associated with the TGID written to it. The write
+		completes when the reclaim operation has finished.
+
+		To run a reclaim on a TGID other than its own, a process requires the
+		CAP_SYS_RESOURCE capability.
+
+		Possible error codes:
+		* -ERANGE: given TGID is too large/small for the TGID type.
+		* -EINVAL: given TGID could not be parsed.
+		* -EPERM: insufficient permissions to run a reclaim on given TGID
+		* -EINTR: interrupted by signal
+		* -ESRCH: given TGID is not using panthor, and might not exist at all
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 66996c9147c2..7d19b8785ea3 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1858,8 +1858,75 @@ static ssize_t profiling_store(struct device *dev,
 
 static DEVICE_ATTR_RW(profiling);
 
+/**
+ * panthor_run_on_pfiles_of_tgid - Run function on each panthor_file of process
+ * @ptdev: pointer to the &struct panthor_device
+ * @tgid: The TGID of the process to look for
+ * @func: function pointer to run on every &struct panthor_file opened by @tgid
+ *
+ * Searches through the list of all panthor DRM files for ones that are opened
+ * by a process with TGID @tgid. For every match found, runs @func with the
+ * associated &struct panthor_file.
+ *
+ * Returns: negative errno on error, number of files matching @tgid otherwise.
+ */
+static int panthor_run_on_pfiles_of_tgid(struct panthor_device *ptdev, pid_t tgid,
+					 void (*func)(struct panthor_file *pf))
+{
+	struct drm_file *file;
+	int found = 0;
+
+	scoped_cond_guard(mutex_intr, return -EINTR, &ptdev->base.filelist_mutex) {
+		list_for_each_entry(file, &ptdev->base.filelist, lhead) {
+			struct task_struct *task;
+			struct pid *file_pid;
+
+			rcu_read_lock();
+			file_pid = rcu_dereference(file->pid);
+			task = pid_task(file_pid, PIDTYPE_TGID);
+			if (!task || task->tgid != tgid) {
+				rcu_read_unlock();
+				continue;
+			}
+			rcu_read_unlock();
+			found++;
+			/* func needs to run outside RCU lock */
+			func(file->driver_priv);
+		}
+	}
+
+	return found;
+}
+
+static ssize_t mem_reclaim_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t len)
+{
+	struct panthor_device *ptdev = dev_get_drvdata(dev);
+	pid_t tgid;
+	int ret;
+
+	ret = kstrtoint(buf, 0, &tgid);
+	if (ret)
+		return ret;
+
+	if (tgid != current->tgid && !capable(CAP_SYS_RESOURCE))
+		return -EPERM;
+
+	ret = panthor_run_on_pfiles_of_tgid(ptdev, tgid, panthor_mmu_force_reclaim);
+	if (ret < 0)
+		return ret;
+	else if (!ret)
+		return -ESRCH;
+
+	return len;
+}
+
+static DEVICE_ATTR_WO(mem_reclaim);
+
 static struct attribute *panthor_attrs[] = {
 	&dev_attr_profiling.attr,
+	&dev_attr_mem_reclaim.attr,
 	NULL,
 };
 
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 80e82238f3c5..5780fd51170c 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -1473,8 +1473,8 @@ static bool panthor_gem_try_evict_no_resv_wait(struct drm_gem_object *obj,
 	return ret == 0;
 }
 
-static bool panthor_gem_try_evict(struct drm_gem_object *obj,
-				  struct ww_acquire_ctx *ticket)
+bool panthor_gem_try_evict(struct drm_gem_object *obj,
+			   struct ww_acquire_ctx *ticket)
 {
 	struct panthor_gem_object *bo = to_panthor_bo(obj);
 
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index ae0491d0b121..593d8e7b7aaf 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -254,6 +254,7 @@ panthor_gem_get_dev_sgt(struct panthor_gem_object *bo);
 int panthor_gem_pin(struct panthor_gem_object *bo);
 void panthor_gem_unpin(struct panthor_gem_object *bo);
 int panthor_gem_swapin_locked(struct panthor_gem_object *bo);
+bool panthor_gem_try_evict(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket);
 void panthor_gem_update_reclaim_state_locked(struct panthor_gem_object *bo,
 					     enum panthor_gem_reclaim_state *old_state);
 int panthor_gem_shrinker_init(struct panthor_device *ptdev);
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index b81388b35a58..e185787f5657 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -3199,6 +3199,39 @@ panthor_mmu_reclaim_priv_bos(struct panthor_device *ptdev,
 	return freed;
 }
 
+/**
+ * panthor_mmu_force_reclaim - Run a reclaim on all VMs associated with a file
+ * @pfile: pointer to the &struct panthor_file to reclaim memory on
+ *
+ * Attempt to evict all private BOs of VMs associated with @pfile. In other
+ * words, attempt to swap out as much GPU memory of the context associated with
+ * @pfile as possible.
+ */
+void panthor_mmu_force_reclaim(struct panthor_file *pfile)
+{
+	struct panthor_device *ptdev = pfile->ptdev;
+	unsigned long i, remaining, freed;
+	unsigned int nr_to_scan = 0;
+	struct panthor_vm *vm;
+	size_t freed_sz;
+
+	scoped_guard(mutex, &ptdev->reclaim.lock) {
+		xa_for_each(&pfile->vms->xa, i, vm) {
+			/* Skip VMs that already aren't backed by any pages */
+			if (!vm->reclaim.lru.count)
+				continue;
+
+			nr_to_scan += vm->reclaim.lru.count;
+			list_move(&vm->reclaim.lru_node, &ptdev->reclaim.vms);
+		}
+	}
+	freed = panthor_mmu_reclaim_priv_bos(ptdev, nr_to_scan, &remaining,
+					     &freed_sz, panthor_gem_try_evict);
+	drm_dbg(&ptdev->base,
+		"Reclaimed %lu pages (%zu bytes) out of %u scanned, with %lu remaining\n",
+		freed, freed_sz, nr_to_scan, remaining);
+}
+
 /**
  * panthor_mmu_unplug() - Unplug the MMU logic
  * @ptdev: Device.
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
index 12b18b5f90e1..34adca4b4e95 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.h
+++ b/drivers/gpu/drm/panthor/panthor_mmu.h
@@ -11,6 +11,7 @@
 struct drm_exec;
 struct drm_sched_job;
 struct drm_memory_stats;
+struct panthor_file;
 struct panthor_gem_object;
 struct panthor_heap_pool;
 struct panthor_vm;
@@ -23,6 +24,7 @@ void panthor_mmu_pre_reset(struct panthor_device *ptdev);
 void panthor_mmu_post_reset(struct panthor_device *ptdev);
 void panthor_mmu_suspend(struct panthor_device *ptdev);
 void panthor_mmu_resume(struct panthor_device *ptdev);
+void panthor_mmu_force_reclaim(struct panthor_file *pfile);
 
 int panthor_vm_map_bo_range(struct panthor_vm *vm, struct panthor_gem_object *bo,
 			    u64 offset, u64 size, u64 va, u32 flags);

-- 
2.54.0


