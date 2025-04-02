Return-Path: <linux-media+bounces-29224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA7EA78D9A
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 13:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCBDA3B29C7
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 11:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7418423A989;
	Wed,  2 Apr 2025 11:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="ZvWZ78O3"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6519238155;
	Wed,  2 Apr 2025 11:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743594952; cv=pass; b=l9FXLCDN6crzwccRrDThdSLUqzkdaQvBF49k3nDMDPjBeuSeh8sGG88jaBQPrwNFc9lLahKhqScW/rBMghH5s0Pnr4syXLCjs3NV98CEOtQPwUXDoOK7wAEJvRJB8Mk8KbMB0kut+i9FSbBGNt3mB23oJSHSLDReMCoitg9LAww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743594952; c=relaxed/simple;
	bh=ZliQEQ5MDKE1UHvz+kS+sUp/Edmq+KHb3ITaqhQ12Mg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p25yJS/hZguH7OZMltrPgbqQsEsnFCok2PZxP5jy4QH0OVFYWphKlrCoCheh1QtvJsvMubjnvwLjhJ0a46navcPq1lobngLgsD2q7/ZXAAhEyzFPwPYYvm/G1szPWh1nhfcRe6CpFYTcbJ/i8cajXSlLkqMFPHvS3BKNoJ5dmjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=ZvWZ78O3; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1743594928; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gIdELIu2oH6rWtoD7RRhXDcZNqvqgBf/6A7zEwEEDRzjv55ok1485yYUk4oLQuuV3zzYt2aUhVWAD4PBacTfoO0Z2fWy55jkc0Vm2Mc8tA0Ot7IvxJTX02jjoAzqmufS/x/FERuZOaRIYwgjivHyIKtEHrpNl01pcURJYpOLi5g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743594928; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=28zoQNIUgCZu0LlUCPB+bP4VLF9hlNu1vegcPOiq66w=; 
	b=DCaa71ZV/s0qKoN/Bhq4xXjuqJx6LbtN51e1VUsQycddM7AeJkPhCOsZAL52H5WYLoVBFdiaITza4uQX2YQScYf7ILDlAEGQRSLE1w61uymznAT7d1VCSr0hJ8jzNJwqS3qeO5+0+ES7/6FJtJNkA7FuzCjfQhSMlJY9wTKhvD0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743594928;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=28zoQNIUgCZu0LlUCPB+bP4VLF9hlNu1vegcPOiq66w=;
	b=ZvWZ78O3e9/9++iRCytCp8n3jhjCWoWR4QYhT1K1EQurE0VA4N4gVcxqXjC5bJju
	WX0Uy+9G0ei/gry17gz+eBLCW32f2HPok4b793Ds88uqYXeBYT3M5rQ8hZRDgmaRwgh
	ZAVtkOYg2U8QnhFTLjI3ULvWJuewDctNcQAx70Uo=
Received: by mx.zohomail.com with SMTPS id 1743594927465770.172508827981;
	Wed, 2 Apr 2025 04:55:27 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: kernel@collabora.com,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v4 4/4] drm/panthor: show device-wide list of DRM GEM objects over DebugFS
Date: Wed,  2 Apr 2025 12:54:29 +0100
Message-ID: <20250402115432.1469703-5-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402115432.1469703-1-adrian.larumbe@collabora.com>
References: <20250402115432.1469703-1-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a device DebugFS file that displays a complete list of all the DRM
GEM objects that are exposed to UM through a DRM handle.

Since leaking object identifiers that might belong to a different NS is
inadmissible, this functionality is only made available in debug builds
with DEBUGFS support enabled.

File format is that of a table, with each entry displaying a variety of
fields with information about each GEM object.

Each GEM object entry in the file displays the following information
fields: Client PID, BO's global name, reference count, BO virtual size,
BO resize size, VM address in its DRM-managed range, BO label and a flag
bitmask.

There's also a kflags field for the type of BO. Bit 0 tells us whether
it's a kernel BO, and bit 1 means the BO is mapped onto the FW's address
space.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.c |   5 +
 drivers/gpu/drm/panthor/panthor_device.h |  11 ++
 drivers/gpu/drm/panthor/panthor_drv.c    |  26 ++++
 drivers/gpu/drm/panthor/panthor_gem.c    | 149 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_gem.h    |  35 ++++++
 5 files changed, 226 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index a9da1d1eeb70..b776e1a2e4f3 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -184,6 +184,11 @@ int panthor_device_init(struct panthor_device *ptdev)
 	if (ret)
 		return ret;
 
+#ifdef CONFIG_DEBUG_FS
+	drmm_mutex_init(&ptdev->base, &ptdev->gems.lock);
+	INIT_LIST_HEAD(&ptdev->gems.node);
+#endif
+
 	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_SUSPENDED);
 	p = alloc_page(GFP_KERNEL | __GFP_ZERO);
 	if (!p)
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index da6574021664..86206a961b38 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -205,6 +205,17 @@ struct panthor_device {
 
 	/** @fast_rate: Maximum device clock frequency. Set by DVFS */
 	unsigned long fast_rate;
+
+#ifdef CONFIG_DEBUG_FS
+	/** @gems: Device-wide list of GEM objects owned by at least one file. */
+	struct {
+		/** @gems.lock: Protects the device-wide list of GEM objects. */
+		struct mutex lock;
+
+		/** @node: Used to keep track of all the device's DRM objects */
+		struct list_head node;
+	} gems;
+#endif
 };
 
 struct panthor_gpu_usage {
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index d5277284fe27..3e870ed2ad90 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1534,9 +1534,35 @@ static const struct file_operations panthor_drm_driver_fops = {
 };
 
 #ifdef CONFIG_DEBUG_FS
+static int panthor_gems_show(struct seq_file *m, void *data)
+{
+	struct drm_info_node *node = m->private;
+	struct drm_device *dev = node->minor->dev;
+	struct panthor_device *ptdev = container_of(dev, struct panthor_device, base);
+
+	panthor_gem_debugfs_print_bos(ptdev, m);
+
+	return 0;
+}
+
+
+static struct drm_info_list panthor_debugfs_list[] = {
+	{"gems", panthor_gems_show, 0, NULL},
+};
+
+static int panthor_gems_debugfs_init(struct drm_minor *minor)
+{
+	drm_debugfs_create_files(panthor_debugfs_list,
+				 ARRAY_SIZE(panthor_debugfs_list),
+				 minor->debugfs_root, minor);
+
+	return 0;
+}
+
 static void panthor_debugfs_init(struct drm_minor *minor)
 {
 	panthor_mmu_debugfs_init(minor);
+	panthor_gems_debugfs_init(minor);
 }
 #endif
 
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 44d027e6d664..2fc87be9b700 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -2,6 +2,7 @@
 /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
 /* Copyright 2023 Collabora ltd. */
 
+#include <linux/cleanup.h>
 #include <linux/dma-buf.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
@@ -10,14 +11,65 @@
 #include <drm/panthor_drm.h>
 
 #include "panthor_device.h"
+#include "panthor_fw.h"
 #include "panthor_gem.h"
 #include "panthor_mmu.h"
 
+#ifdef CONFIG_DEBUG_FS
+static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo, u32 type_mask)
+{
+	INIT_LIST_HEAD(&bo->debugfs.node);
+
+	if (!(type_mask & PANTHOR_BO_FW_MAPPED)) {
+		bo->debugfs.creator.tgid = current->group_leader->pid;
+		get_task_comm(bo->debugfs.creator.process_name, current->group_leader);
+	} else {
+		bo->debugfs.creator.tgid = 0;
+		snprintf(bo->debugfs.creator.process_name,
+			 sizeof(bo->debugfs.creator.process_name),
+			 "kernel");
+	}
+
+	bo->debugfs.bo_mask = type_mask;
+}
+
+static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo, u32 type_mask)
+{
+	struct panthor_device *ptdev =  container_of(bo->base.base.dev,
+						     struct panthor_device, base);
+
+	panthor_gem_debugfs_bo_init(bo, type_mask);
+
+	mutex_lock(&ptdev->gems.lock);
+	list_add_tail(&bo->debugfs.node, &ptdev->gems.node);
+	mutex_unlock(&ptdev->gems.lock);
+}
+
+static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
+{
+	struct panthor_device *ptdev = container_of(bo->base.base.dev,
+						    struct panthor_device, base);
+
+	if (list_empty(&bo->debugfs.node))
+		return;
+
+	mutex_lock(&ptdev->gems.lock);
+	list_del_init(&bo->debugfs.node);
+	mutex_unlock(&ptdev->gems.lock);
+}
+
+#else
+static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo, u32 type_mask) {}
+static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo) {}
+#endif
+
 static void panthor_gem_free_object(struct drm_gem_object *obj)
 {
 	struct panthor_gem_object *bo = to_panthor_bo(obj);
 	struct drm_gem_object *vm_root_gem = bo->exclusive_vm_root_gem;
 
+	panthor_gem_debugfs_bo_rm(bo);
+
 	/*
 	 * Label might have been allocated with kstrdup_const(),
 	 * we need to take that into account when freeing the memory
@@ -86,6 +138,7 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 	struct drm_gem_shmem_object *obj;
 	struct panthor_kernel_bo *kbo;
 	struct panthor_gem_object *bo;
+	u32 type_mask = PANTHOR_BO_KERNEL;
 	int ret;
 
 	if (drm_WARN_ON(&ptdev->base, !vm))
@@ -105,7 +158,12 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 	kbo->obj = &obj->base;
 	bo->flags = bo_flags;
 
+	if (vm == panthor_fw_vm(ptdev))
+		type_mask |= PANTHOR_BO_FW_MAPPED;
+
 	panthor_gem_kernel_bo_set_label(kbo, name);
+	panthor_gem_debugfs_bo_add(to_panthor_bo(kbo->obj), type_mask);
+
 	/* The system and GPU MMU page size might differ, which becomes a
 	 * problem for FW sections that need to be mapped at explicit address
 	 * since our PAGE_SIZE alignment might cover a VA range that's
@@ -255,6 +313,8 @@ panthor_gem_create_with_handle(struct drm_file *file,
 	/* drop reference from allocate - handle holds it now. */
 	drm_gem_object_put(&shmem->base);
 
+	panthor_gem_debugfs_bo_add(bo, 0);
+
 	return ret;
 }
 
@@ -286,3 +346,92 @@ panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label)
 
 	panthor_gem_bo_set_label(bo->obj, kstrdup_const(str, GFP_KERNEL));
 }
+
+#ifdef CONFIG_DEBUG_FS
+static bool panfrost_gem_print_flag(const char *name,
+				    bool is_set,
+				    bool other_flags_printed,
+				    struct seq_file *m)
+{
+	if (is_set)
+		seq_printf(m, "%s%s", other_flags_printed ? "," : "", name);
+
+	return is_set | other_flags_printed;
+}
+
+struct gem_size_totals {
+	size_t size;
+	size_t resident;
+	size_t reclaimable;
+};
+
+static void panthor_gem_debugfs_bo_print(struct panthor_gem_object *bo,
+					 struct seq_file *m,
+					 struct gem_size_totals *totals)
+{
+	unsigned int refcount = kref_read(&bo->base.base.refcount);
+	char creator_info[32] = {};
+	bool has_flags = false;
+	size_t resident_size;
+
+	/* Skip BOs being destroyed. */
+	if (!refcount)
+		return;
+
+	resident_size = bo->base.pages != NULL ? bo->base.base.size : 0;
+
+	snprintf(creator_info, sizeof(creator_info),
+		 "%s/%d", bo->debugfs.creator.process_name, bo->debugfs.creator.tgid);
+	seq_printf(m, "%-32s%-16d%-16d%-16zd%-16zd%-16lx",
+		   creator_info,
+		   bo->base.base.name,
+		   refcount,
+		   bo->base.base.size,
+		   resident_size,
+		   drm_vma_node_start(&bo->base.base.vma_node));
+
+	seq_puts(m, "(");
+	has_flags = panfrost_gem_print_flag("imported", bo->base.base.import_attach != NULL,
+					    has_flags, m);
+	has_flags = panfrost_gem_print_flag("exported", bo->base.base.dma_buf != NULL,
+					    has_flags, m);
+	if (bo->base.madv < 0)
+		has_flags = panfrost_gem_print_flag("purged", true, has_flags, m);
+	else if (bo->base.madv > 0)
+		has_flags = panfrost_gem_print_flag("purgeable", true, has_flags, m);
+	if (!has_flags)
+		seq_puts(m, "none");
+	seq_puts(m, ")");
+
+	seq_printf(m, "%-6s0x%-2x", "", bo->debugfs.bo_mask);
+
+	mutex_lock(&bo->label.lock);
+	seq_printf(m, "%-6s%-60s", "", bo->label.str ? : NULL);
+	mutex_unlock(&bo->label.lock);
+	seq_puts(m, "\n");
+
+	totals->size += bo->base.base.size;
+	totals->resident += resident_size;
+	if (bo->base.madv > 0)
+		totals->reclaimable += resident_size;
+}
+
+void panthor_gem_debugfs_print_bos(struct panthor_device *ptdev,
+				   struct seq_file *m)
+{
+	struct gem_size_totals totals = {0};
+	struct panthor_gem_object *bo;
+
+	seq_puts(m, "created-by                      global-name     refcount        size            resident-size   file-offset     flags     kflags     label\n");
+	seq_puts(m, "------------------------------------------------------------------------------------------------------------------------------------------------\n");
+
+	scoped_guard(mutex, &ptdev->gems.lock) {
+		list_for_each_entry(bo, &ptdev->gems.node, debugfs.node)
+			panthor_gem_debugfs_bo_print(bo, m, &totals);
+	}
+
+	seq_puts(m, "==========================================================================================================================================================\n");
+	seq_printf(m, "Total size: %zd, Total resident: %zd, Total reclaimable: %zd\n",
+		   totals.size, totals.resident, totals.reclaimable);
+}
+#endif
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 49daa5088a0d..22ecc0d39d5e 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -15,6 +15,32 @@ struct panthor_vm;
 
 #define PANTHOR_BO_LABEL_MAXLEN	PAGE_SIZE
 
+#define PANTHOR_BO_KERNEL	BIT(0)
+#define PANTHOR_BO_FW_MAPPED	BIT(1)
+
+/**
+ * struct panthor_gem_debugfs - GEM object's DebugFS list information
+ */
+struct panthor_gem_debugfs {
+	/**
+	 * @node: Node used to insert the object in the device-wide list of
+	 * GEM objects, to display information about it through a DebugFS file.
+	 */
+	struct list_head node;
+
+	/** @creator: Information about the UM process which created the GEM. */
+	struct {
+		/** @creator.process_name: Group leader name in owning thread's process */
+		char process_name[TASK_COMM_LEN];
+
+		/** @creator.tgid: PID of the thread's group leader within its process */
+		pid_t tgid;
+	} creator;
+
+	/** @bo_mask: Bitmask encoding BO type as {USER, KERNEL} x {GPU, FW} */
+	u32 bo_mask;
+};
+
 /**
  * struct panthor_gem_object - Driver specific GEM object.
  */
@@ -62,6 +88,10 @@ struct panthor_gem_object {
 		/** @lock.str: Protects access to the @label.str field. */
 		struct mutex lock;
 	} label;
+
+#ifdef CONFIG_DEBUG_FS
+	struct panthor_gem_debugfs debugfs;
+#endif
 };
 
 /**
@@ -157,4 +187,9 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 
 void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
 
+#ifdef CONFIG_DEBUG_FS
+void panthor_gem_debugfs_print_bos(struct panthor_device *pfdev,
+				   struct seq_file *m);
+#endif
+
 #endif /* __PANTHOR_GEM_H__ */
-- 
2.48.1


