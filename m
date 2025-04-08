Return-Path: <linux-media+bounces-29697-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C60EFA8189C
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 00:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E75978A3A4D
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 22:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ECDD25B67F;
	Tue,  8 Apr 2025 22:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="JmFMSs2g"
X-Original-To: linux-media@vger.kernel.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4282E25A348;
	Tue,  8 Apr 2025 22:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151130; cv=pass; b=IclsSzXhrWlNC6T2o8p+gBuiC1pLkVkK0vHxzISWKGCg0BSok7XY1F5uxmWdcqNnA0oFqJV/5EQA4/aHBJawWXltIiewaTj79r3ejpeQkNfPJ33Z+hN8GPhHsr5NMQTsx7oeyRKEOdeB1ssevHoQtFKBKS7ub3t4aSNYhfovplg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151130; c=relaxed/simple;
	bh=GAWCRE//PcpksL+MMvVIknFuVT14WVh0IC4WomVhONQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P8FgARAkUXmcKatde9SIw0nZyQQyoO18r2acyE6o2pd6PPuX/EaIC4wiLTxEGsS5ANjY6LuMTY13HlS8vC0umNTA7IuK49GhfWw8+TosxmkuWVWQHVUawU+YC/OCL8R3UskIn8Nm+vvawNDetLtpaaKKrHheGzWyFOpFHQmzVzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=JmFMSs2g; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1744151095; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eU0K48qNuF0io5JdyOsxSbCLdqkmrdFw1s5WLe587xwhTAHMzhSFazp4Kg2Mcx9AGiugEGyEuo2UvCVqkT/zH8wbbYn9WFq1+5VWp91QCyYc+6PoKDuohgTxOKfH1ffCAZS9mwJ6I0fqcvlC52KMxgRmNur/g6hv8xrLXTnmCE4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744151095; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ULTK1FqB+UN5vCxtkwwHmILu4kdDSIXWgWFmlBu4W/0=; 
	b=YjoK4b9PpMIrmPY/cXCfpGs9PsUK/IKrMmTPrFG9hxv50PHbkNQB2kGR20jD78pcXWE8XjARWc2u/xUoLLUfErzcD5j+fcOnMofEhOFWOkPvnjaIVIG18wubIyQ63FXxWs1qD+3nsvQzuEh42Qs7Gf18L8FqjgIKa4ViSZfdE6E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744151095;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ULTK1FqB+UN5vCxtkwwHmILu4kdDSIXWgWFmlBu4W/0=;
	b=JmFMSs2gQ5fOwtUE64St6l3GJj3nrEHS+VIKmJhFVBGI6TIxKQxCwwNxM3BoHQkA
	56Msoy7sphBRSXnLIaNuihFKrbVeAfKzb2n731D2E5qVcoXbPnU6QxelO/F/VzZaMvZ
	AwrzPjL7csH8vG9YQWg6kKneKqzCZDD8quoMPlbY=
Received: by mx.zohomail.com with SMTPS id 1744151093280865.5330418374582;
	Tue, 8 Apr 2025 15:24:53 -0700 (PDT)
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
Subject: [PATCH v5 4/4] drm/panthor: show device-wide list of DRM GEM objects over DebugFS
Date: Tue,  8 Apr 2025 23:24:24 +0100
Message-ID: <20250408222427.1214330-5-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250408222427.1214330-1-adrian.larumbe@collabora.com>
References: <20250408222427.1214330-1-adrian.larumbe@collabora.com>
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

There's also a kflags field for the type of BO, which tells us whether
it's a kernel BO and/or mapped onto the FW's address space.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.c |   5 +
 drivers/gpu/drm/panthor/panthor_device.h |  11 ++
 drivers/gpu/drm/panthor/panthor_drv.c    |  26 ++++
 drivers/gpu/drm/panthor/panthor_gem.c    | 168 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_gem.h    |  65 +++++++++
 5 files changed, 275 insertions(+)

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
index 163c027562aa..935ca9e6138e 100644
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
index 742192c42f58..439f2ae4e6bb 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -2,6 +2,7 @@
 /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
 /* Copyright 2023 Collabora ltd. */
 
+#include <linux/cleanup.h>
 #include <linux/dma-buf.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
@@ -10,14 +11,51 @@
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
@@ -86,6 +124,7 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 	struct drm_gem_shmem_object *obj;
 	struct panthor_kernel_bo *kbo;
 	struct panthor_gem_object *bo;
+	u32 debug_flags = PANTHOR_DEBUGFS_BO_FLAGS_KERNEL;
 	int ret;
 
 	if (drm_WARN_ON(&ptdev->base, !vm))
@@ -105,7 +144,11 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 	kbo->obj = &obj->base;
 	bo->flags = bo_flags;
 
+	if (vm == panthor_fw_vm(ptdev))
+		debug_flags |= PANTHOR_DEBUGFS_BO_FW_FLAG_MAPPED;
+
 	panthor_gem_kernel_bo_set_label(kbo, name);
+	panthor_gem_debugfs_bo_set_mask(to_panthor_bo(kbo->obj), debug_flags);
 
 	/* The system and GPU MMU page size might differ, which becomes a
 	 * problem for FW sections that need to be mapped at explicit address
@@ -208,6 +251,8 @@ struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t
 	drm_gem_gpuva_set_lock(&obj->base.base, &obj->gpuva_list_lock);
 	mutex_init(&obj->label.lock);
 
+	panthor_gem_debugfs_bo_add(ptdev, obj);
+
 	return &obj->base.base;
 }
 
@@ -256,6 +301,8 @@ panthor_gem_create_with_handle(struct drm_file *file,
 	/* drop reference from allocate - handle holds it now. */
 	drm_gem_object_put(&shmem->base);
 
+	panthor_gem_debugfs_bo_set_mask(bo, 0);
+
 	return ret;
 }
 
@@ -287,3 +334,124 @@ panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label)
 
 	panthor_gem_bo_set_label(bo->obj, kstrdup_const(str, GFP_KERNEL));
 }
+
+#ifdef CONFIG_DEBUG_FS
+static void
+panthor_gem_debugfs_print_flags(struct seq_file *m,
+				const char *names[],
+				u32 name_count,
+				u32 flags)
+{
+	bool first = true;
+
+	seq_puts(m, "(");
+
+	if (!flags)
+		seq_puts(m, "none");
+
+	while (flags) {
+		u32 bit = fls(flags) - 1;
+
+		if (!first)
+			seq_puts(m, ",");
+
+		if (bit >= name_count || !names[bit])
+			seq_printf(m, "unknown-bit%d", bit);
+		else
+			seq_printf(m, "%s", names[bit]);
+
+		first = false;
+		flags &= ~BIT(bit);
+	}
+
+	seq_puts(m, ")");
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
+	u32 gem_state_flags = 0;
+	size_t resident_size;
+
+	static const char *gem_status_flags[] = {
+		"imported", "exported", "purged", "purgeable"
+	};
+
+	static const char *panthor_bo_flags[] = {
+		"kernel", "fw"
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
+
+	if (bo->base.base.import_attach != NULL)
+		gem_state_flags |= PANTHOR_DEBUGFS_GEM_IMPORTED;
+	if (bo->base.base.dma_buf != NULL)
+		gem_state_flags |= PANTHOR_DEBUGFS_GEM_EXPORTED;
+	if (bo->base.madv < 0)
+		gem_state_flags |= PANTHOR_DEBUGFS_GEM_PURGED;
+	if (bo->base.madv)
+		gem_state_flags |= PANTHOR_DEBUGFS_GEM_PURGEABLE;
+
+	panthor_gem_debugfs_print_flags(m, gem_status_flags,
+					sizeof(gem_status_flags), gem_state_flags);
+	seq_printf(m, "%-4s", "");
+	panthor_gem_debugfs_print_flags(m, panthor_bo_flags, sizeof(panthor_bo_flags),
+					bo->debugfs.flags & (u32)~PANTHOR_DEBUGFS_BO_FLAG_INITIALISED);
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
+	seq_puts(m, "created-by                      global-name     refcount        size            resident-size   file-offset     state     kflags     label\n");
+	seq_puts(m, "------------------------------------------------------------------------------------------------------------------------------------------------\n");
+
+	scoped_guard(mutex, &ptdev->gems.lock) {
+		list_for_each_entry(bo, &ptdev->gems.node, debugfs.node) {
+			if (bo->debugfs.flags & PANTHOR_DEBUGFS_BO_FLAG_INITIALISED)
+				panthor_gem_debugfs_bo_print(bo, m, &totals);
+		}
+
+	}
+
+	seq_puts(m, "==========================================================================================================================================================\n");
+	seq_printf(m, "Total size: %zd, Total resident: %zd, Total reclaimable: %zd\n",
+		   totals.size, totals.resident, totals.reclaimable);
+}
+#endif
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 49daa5088a0d..58575f38ee26 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -15,6 +15,54 @@ struct panthor_vm;
 
 #define PANTHOR_BO_LABEL_MAXLEN	PAGE_SIZE
 
+enum panthor_debugfs_gem_state_flags {
+	/** @PANTHOR_DEBUGFS_GEM_IMPORTED: GEM BO is PRIME imported. */
+	PANTHOR_DEBUGFS_GEM_IMPORTED = BIT(0),
+
+	/** @PANTHOR_DEBUGFS_GEM_EXPORTED: GEM BO is PRIME exported. */
+	PANTHOR_DEBUGFS_GEM_EXPORTED = BIT(1),
+
+	/** @PANTHOR_DEBUGFS_GEM_PURGED: GEM BO was reclaimed by the shrinker. */
+	PANTHOR_DEBUGFS_GEM_PURGED = BIT(2),
+
+	/** @PANTHOR_DEBUGFS_GEM_PURGEABLE: GEM BO can be reclaimed by the shrinker. */
+	PANTHOR_DEBUGFS_GEM_PURGEABLE = BIT(3),
+};
+
+enum panthor_debugfs_bo_flags {
+	/** @PANTHOR_DEBUGFS_BO_KERNEL: BO is for kernel use only. */
+	PANTHOR_DEBUGFS_BO_FLAGS_KERNEL = BIT(0),
+
+	/** @PANTHOR_DEBUGFS_BO_FW_MAPPED: BO is mapped on the FW VM. */
+	PANTHOR_DEBUGFS_BO_FW_FLAG_MAPPED = BIT(1),
+
+	/** @PANTHOR_DEBUGFS_BO_INITIALISED: BO is ready for DebugFS display. */
+	PANTHOR_DEBUGFS_BO_FLAG_INITIALISED = BIT(31),
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
+	/** @bo_mask: Combination of panthor_debugfs_bo_flags flags */
+	u32 flags;
+};
+
 /**
  * struct panthor_gem_object - Driver specific GEM object.
  */
@@ -62,6 +110,10 @@ struct panthor_gem_object {
 		/** @lock.str: Protects access to the @label.str field. */
 		struct mutex lock;
 	} label;
+
+#ifdef CONFIG_DEBUG_FS
+	struct panthor_gem_debugfs debugfs;
+#endif
 };
 
 /**
@@ -157,4 +209,17 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 
 void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
 
+#ifdef CONFIG_DEBUG_FS
+void panthor_gem_debugfs_print_bos(struct panthor_device *pfdev,
+				   struct seq_file *m);
+static inline void
+panthor_gem_debugfs_bo_set_mask(struct panthor_gem_object *bo, u32 type_mask)
+{
+	bo->debugfs.flags = type_mask | PANTHOR_DEBUGFS_BO_FLAG_INITIALISED;
+}
+
+#else
+void panthor_gem_debugfs_bo_set_mask(struct panthor_gem_object *bo, u32 type_mask) {};
+#endif
+
 #endif /* __PANTHOR_GEM_H__ */
-- 
2.48.1


