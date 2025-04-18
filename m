Return-Path: <linux-media+bounces-30508-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C8DA92FF1
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 04:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EC6A19E7C08
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 02:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59EB826868F;
	Fri, 18 Apr 2025 02:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="FXigUR1i"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC03E770E2;
	Fri, 18 Apr 2025 02:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744943280; cv=pass; b=RwlgT8dH1IWVkPUWrV4JFwhXMrERr8dU2cNl9fL3sg9or7SPRL+aS5XMJc/+Vhl7IXonNkb92F5fW1m0SEa8yI3jNofYs7y9++j/2hTSkBKn4oEJs0N+rxd54r6vuDC+VzmzSfp7jC5HjEcDQ0XlNo+DTb5wMLLyL0sfxgOOaNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744943280; c=relaxed/simple;
	bh=NLnkEpjPn8hg6IiP/15AL7VL2yqcax/b7aGwauSczo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OAAPhINBlJ+Wh32oIL7gK0oEc7cjicrpV4BS//+ZaOMK0X2wyhOnTDTcuRwyUPGzHeIyDJuGj284+MzXnbqH6PMG6No/DQSQlQbmsuK3ApophhPsgc2n+iA9tzkOeof8seY2eQ4EcjbV7DdwYWloo7tlkzcUUyxjLbws+EYUklU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=FXigUR1i; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1744943258; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Iw37OAJmM7CcRxziOXPMsJg8ICiN6GQVItl+hXMZ8ak3BgJACJ+BZTUpQGi6LFRJYfYcb7mdKS+gOCCqUb/psbNvojAEWddS1Klt979z38NfwY11WnRwfj4yZFCPBg89a2yh8cAkGmJW2S1U0KtSx0AQ7YHZkUcKkRJGIy3JsI0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744943258; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wXFoqsQqUu4XaqDamc4tZ6808e6pqq1sgnvP0X69Mjk=; 
	b=QKIX/8McleExa/ZLEFyWns2Wgg+FUkEVFxDSPFejZ7m4exmqka1baqBA1AgynmaozBMHbvPUPLdyswWlJoDyen9E+lsjEdUuwJh9Jky3X6d8ByRn9xeVk/YA7toZ+1hK4QGshdl+ClLhS+xPjElHHUtETLIKJTLMR09mHm1J/+M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744943258;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=wXFoqsQqUu4XaqDamc4tZ6808e6pqq1sgnvP0X69Mjk=;
	b=FXigUR1itlHA1ATnDnudGwteAlVEmLz9Xxag9bYcsYKLqP9l4EFJM+16Kw0mMK4f
	rpfr1Axxq2od3m1dsw7CfPjaawHtDpldbzhZ9WJrAWIN/k9SMaSlXcqe9vY3x4QRKMU
	n0ZSGsGnVlhRrjfmomF3sehjmGQWJDtnYPJmtsSE=
Received: by mx.zohomail.com with SMTPS id 1744943257419147.65370701589654;
	Thu, 17 Apr 2025 19:27:37 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Boris Brezillon <boris.brezillon@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v9 4/4] drm/panthor: show device-wide list of DRM GEM objects over DebugFS
Date: Fri, 18 Apr 2025 03:27:07 +0100
Message-ID: <20250418022710.74749-5-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250418022710.74749-1-adrian.larumbe@collabora.com>
References: <20250418022710.74749-1-adrian.larumbe@collabora.com>
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
BO resize size, VM address in its DRM-managed range, BO label and a GEM
state flags.

There's also a usage flags field for the type of BO, which tells us
whether it's a kernel BO and/or mapped onto the FW's address space.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.c |   5 +
 drivers/gpu/drm/panthor/panthor_device.h |  11 ++
 drivers/gpu/drm/panthor/panthor_drv.c    |  26 ++++
 drivers/gpu/drm/panthor/panthor_gem.c    | 182 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_gem.h    |  59 ++++++++
 5 files changed, 283 insertions(+)

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
index 8a193886719e..c00f45576385 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1538,9 +1538,35 @@ static const struct file_operations panthor_drm_driver_fops = {
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
index 3f4ab5a2f2ae..1e3409c05891 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -11,14 +11,51 @@
 #include <drm/panthor_drm.h>
 
 #include "panthor_device.h"
+#include "panthor_fw.h"
 #include "panthor_gem.h"
 #include "panthor_mmu.h"
 
+#ifdef CONFIG_DEBUG_FS
+static void panthor_gem_debugfs_bo_add(struct panthor_device *ptdev,
+				       struct panthor_gem_object *bo)
+{
+	INIT_LIST_HEAD(&bo->debugfs.node);
+
+	bo->debugfs.creator.tgid = current->group_leader->pid;
+	get_task_comm(bo->debugfs.creator.process_name, current->group_leader);
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
+static void panthor_gem_debugfs_bo_add(struct panthor_device *ptdev,
+				       struct panthor_gem_object *bo)
+{}
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
@@ -88,6 +125,7 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 	struct drm_gem_shmem_object *obj;
 	struct panthor_kernel_bo *kbo;
 	struct panthor_gem_object *bo;
+	u32 debug_flags = PANTHOR_DEBUGFS_GEM_USAGE_FLAG_KERNEL;
 	int ret;
 
 	if (drm_WARN_ON(&ptdev->base, !vm))
@@ -107,7 +145,11 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 	kbo->obj = &obj->base;
 	bo->flags = bo_flags;
 
+	if (vm == panthor_fw_vm(ptdev))
+		debug_flags |= PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED;
+
 	panthor_gem_kernel_bo_set_label(kbo, name);
+	panthor_gem_debugfs_set_usage_flags(to_panthor_bo(kbo->obj), debug_flags);
 
 	/* The system and GPU MMU page size might differ, which becomes a
 	 * problem for FW sections that need to be mapped at explicit address
@@ -210,6 +252,8 @@ struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t
 	drm_gem_gpuva_set_lock(&obj->base.base, &obj->gpuva_list_lock);
 	mutex_init(&obj->label.lock);
 
+	panthor_gem_debugfs_bo_add(ptdev, obj);
+
 	return &obj->base.base;
 }
 
@@ -258,6 +302,12 @@ panthor_gem_create_with_handle(struct drm_file *file,
 	/* drop reference from allocate - handle holds it now. */
 	drm_gem_object_put(&shmem->base);
 
+	/*
+	 * No explicit flags are needed in the call below, since the
+	 * function internally sets the INITIALIZED bit for us.
+	 */
+	panthor_gem_debugfs_set_usage_flags(bo, 0);
+
 	return ret;
 }
 
@@ -296,3 +346,135 @@ panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label)
 
 	panthor_gem_bo_set_label(bo->obj, str);
 }
+
+#ifdef CONFIG_DEBUG_FS
+static void
+panthor_gem_debugfs_format_flags(char flags_str[], int flags_len,
+				 const char * const names[], u32 name_count,
+				 u32 flags)
+{
+	bool first = true;
+	int offset = 0;
+
+#define ACC_FLAGS(...) \
+	({ \
+		offset += snprintf(flags_str + offset, flags_len - offset, ##__VA_ARGS__); \
+		if (offset == flags_len) \
+			return; \
+	})
+
+	ACC_FLAGS("%c", '(');
+
+	if (!flags)
+		ACC_FLAGS("%s", "none");
+
+	while (flags) {
+		u32 bit = fls(flags) - 1;
+		u32 idx = bit + 1;
+
+		if (!first)
+			ACC_FLAGS("%s", ",");
+
+		if (idx < name_count && names[idx])
+			ACC_FLAGS("%s", names[idx]);
+
+		first = false;
+		flags &= ~BIT(bit);
+	}
+
+	ACC_FLAGS("%c", ')');
+
+#undef ACC_FLAGS
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
+	size_t resident_size;
+	char gem_state_str[64] = {};
+	char gem_usage_str[64] = {};
+	u32 gem_usage_flags = bo->debugfs.flags & (u32)~PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED;
+	u32 gem_state_flags = 0;
+
+	static const char * const gem_state_flags_names[] = {
+		[PANTHOR_DEBUGFS_GEM_STATE_FLAG_IMPORTED] = "imported",
+		[PANTHOR_DEBUGFS_GEM_STATE_FLAG_EXPORTED] = "exported",
+	};
+
+	static const char * const gem_usage_flags_names[] = {
+		[PANTHOR_DEBUGFS_GEM_USAGE_FLAG_KERNEL] = "kernel",
+		[PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED] = "fw-mapped",
+	};
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
+	if (bo->base.base.import_attach != NULL)
+		gem_state_flags |= PANTHOR_DEBUGFS_GEM_STATE_FLAG_IMPORTED;
+	if (bo->base.base.dma_buf != NULL)
+		gem_state_flags |= PANTHOR_DEBUGFS_GEM_STATE_FLAG_EXPORTED;
+
+	panthor_gem_debugfs_format_flags(gem_state_str, sizeof(gem_state_str),
+					 gem_state_flags_names, ARRAY_SIZE(gem_state_flags_names),
+					 gem_state_flags);
+	panthor_gem_debugfs_format_flags(gem_usage_str, sizeof(gem_usage_str),
+					 gem_usage_flags_names, ARRAY_SIZE(gem_usage_flags_names),
+					 gem_usage_flags);
+
+	seq_printf(m, "%-64s%-64s", gem_state_str, gem_usage_str);
+
+	scoped_guard(mutex, &bo->label.lock) {
+		seq_printf(m, "%s", bo->label.str ? : "");
+	}
+
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
+	seq_puts(m, "created-by                      global-name     refcount        size            resident-size   file-offset     state                                                           usage                                                           label\n");
+	seq_puts(m, "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\n");
+
+	scoped_guard(mutex, &ptdev->gems.lock) {
+		list_for_each_entry(bo, &ptdev->gems.node, debugfs.node) {
+			if (bo->debugfs.flags & PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED)
+				panthor_gem_debugfs_bo_print(bo, m, &totals);
+		}
+	}
+
+	seq_puts(m, "=====================================================================================================================================================================================================================================================\n");
+	seq_printf(m, "Total size: %zd, Total resident: %zd, Total reclaimable: %zd\n",
+		   totals.size, totals.resident, totals.reclaimable);
+}
+#endif
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 3c09af568e47..94b244f0540e 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -15,6 +15,48 @@ struct panthor_vm;
 
 #define PANTHOR_BO_LABEL_MAXLEN	4096
 
+enum panthor_debugfs_gem_state_flags {
+	/** @PANTHOR_DEBUGFS_GEM_STATE_FLAG_IMPORTED: GEM BO is PRIME imported. */
+	PANTHOR_DEBUGFS_GEM_STATE_FLAG_IMPORTED = BIT(0),
+
+	/** @PANTHOR_DEBUGFS_GEM_STATE_FLAG_EXPORTED: GEM BO is PRIME exported. */
+	PANTHOR_DEBUGFS_GEM_STATE_FLAG_EXPORTED = BIT(1),
+};
+
+enum panthor_debugfs_gem_usage_flags {
+	/** @PANTHOR_DEBUGFS_GEM_USAGE_FLAG_KERNEL: BO is for kernel use only. */
+	PANTHOR_DEBUGFS_GEM_USAGE_FLAG_KERNEL = BIT(0),
+
+	/** @PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED: BO is mapped on the FW VM. */
+	PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED = BIT(1),
+
+	/** @PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED: BO is ready for DebugFS display. */
+	PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED = BIT(31),
+};
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
+	/** @flags: Combination of panthor_debugfs_gem_usage_flags flags */
+	u32 flags;
+};
+
 /**
  * struct panthor_gem_object - Driver specific GEM object.
  */
@@ -62,6 +104,10 @@ struct panthor_gem_object {
 		/** @lock.str: Protects access to the @label.str field. */
 		struct mutex lock;
 	} label;
+
+#ifdef CONFIG_DEBUG_FS
+	struct panthor_gem_debugfs debugfs;
+#endif
 };
 
 /**
@@ -157,4 +203,17 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 
 void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
 
+#ifdef CONFIG_DEBUG_FS
+void panthor_gem_debugfs_print_bos(struct panthor_device *pfdev,
+				   struct seq_file *m);
+static inline void
+panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags)
+{
+	bo->debugfs.flags = usage_flags | PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED;
+}
+
+#else
+void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags) {};
+#endif
+
 #endif /* __PANTHOR_GEM_H__ */
-- 
2.48.1


