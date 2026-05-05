Return-Path: <linux-media+bounces-60428-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MExRBTb6+WmNFgMAu9opvQ
	(envelope-from <linux-media+bounces-60428-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:09:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 866D54CF1BE
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76C8530C76F7
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 14:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FFA219A288;
	Tue,  5 May 2026 14:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="uoYnNmcO"
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D77547F2E5;
	Tue,  5 May 2026 14:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777989949; cv=none; b=C5XI20DCldEf7nciCZdsN3tnNzOH2Diwn7Zqvju+viD7WHvhukfUW24+5T/yAABF7NDE6Y1IshcXt7c9xLi9yXGR24fULMuu1jwvTGqD7MViPQmjFjaNPGrrDFFz7QEW1ko4bafujICtgn03e46Q+XeCYlaXVKUCXIX1QMf2RAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777989949; c=relaxed/simple;
	bh=f3sCyiG5jjvWfmG4nNgmq7j6ZJAIiUvXUkRWvrwEHbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Amnl1uxOHoUdzYT10wS0wS/pg8lUPF94oWq+WYV27WlhQp6Wz+5chzhJIZzjWhVbOE8LuX+13DOmg5IUHGAaEnwLEaqgf1ZgjXCbeePrlVrukE+mvwA+FGenUhf5Df1Fx0vSuu46hqawWio6yED5LTV/dvwwzPjDZE0VNbKQ8nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=uoYnNmcO; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F77424C0;
	Tue,  5 May 2026 07:05:41 -0700 (PDT)
Received: from e120398-lin.trondheim.arm.com (e120398-lin.trondheim.arm.com [10.42.46.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D78EC3F763;
	Tue,  5 May 2026 07:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777989946; bh=f3sCyiG5jjvWfmG4nNgmq7j6ZJAIiUvXUkRWvrwEHbQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uoYnNmcOadLNqi1gWhiREDV0/WVOVV6FSHTufOoQPH2kFyRpj5XtdZKPRScOi0B6c
	 UKdkyhQG1qof4b72B2F6vDf0IsMCMvbwN5i8ZW543P951NZPKiAcsjaTRd20f+0X4X
	 Kdpe7NJlhEf71MGDEFnCCK1ZcGAjkPdzmPPuJCRc=
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
	Ketil Johnsen <ketil.johnsen@arm.com>
Subject: [PATCH 4/8] drm/panthor: Add support for protected memory allocation in panthor
Date: Tue,  5 May 2026 16:05:10 +0200
Message-ID: <20260505140516.1372388-5-ketil.johnsen@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505140516.1372388-1-ketil.johnsen@arm.com>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 866D54CF1BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60428-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lwn.net,linuxfoundation.org,linaro.org,collabora.com,arm.com,google.com,amd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ketil.johnsen@arm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:dkim,arm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: Florent Tomasin <florent.tomasin@arm.com>

This patch allows Panthor to allocate buffer objects from a
protected heap. The Panthor driver should be seen as a consumer
of the heap and not an exporter.

Protected memory buffers needed by the Panthor driver:
- On CSF FW load, the Panthor driver must allocate a protected
  buffer object to hold data to use by the FW when in protected
  mode. This protected buffer object is owned by the device
  and does not belong to a process.
- On CSG creation, the Panthor driver must allocate a protected
  suspend buffer object for the FW to store data when suspending
  the CSG while in protected mode. The kernel owns this allocation
  and does not allow user space mapping. The format of the data
  in this buffer is only known by the FW and does not need to be
  shared with other entities.

The driver will retrieve the protected heap using the name of the
heap provided to the driver as module parameter.

If the heap is not yet available, the panthor driver will defer
the probe until created. It is an integration error to provide
a heap name that does not exist or is never created.

Panthor is calling the DMA heap allocation function
and obtains a DMA buffer from it. This buffer is then
registered to GEM and imported.

Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>
Co-developed-by: Ketil Johnsen <ketil.johnsen@arm.com>
Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
---
 Documentation/gpu/panthor.rst            | 47 +++++++++++++++
 drivers/gpu/drm/panthor/Kconfig          |  1 +
 drivers/gpu/drm/panthor/panthor_device.c | 28 ++++++++-
 drivers/gpu/drm/panthor/panthor_device.h |  6 ++
 drivers/gpu/drm/panthor/panthor_fw.c     | 29 ++++++++-
 drivers/gpu/drm/panthor/panthor_fw.h     |  2 +
 drivers/gpu/drm/panthor/panthor_gem.c    | 77 ++++++++++++++++++++++--
 drivers/gpu/drm/panthor/panthor_gem.h    | 16 ++++-
 drivers/gpu/drm/panthor/panthor_heap.c   |  2 +
 drivers/gpu/drm/panthor/panthor_sched.c  | 11 +++-
 10 files changed, 208 insertions(+), 11 deletions(-)

diff --git a/Documentation/gpu/panthor.rst b/Documentation/gpu/panthor.rst
index 7a841741278fb..be20eadea6dd5 100644
--- a/Documentation/gpu/panthor.rst
+++ b/Documentation/gpu/panthor.rst
@@ -54,3 +54,50 @@ sync object arrays and heap chunks. Because they are all allocated and pinned
 at creation time, only `panthor-resident-memory` is necessary to tell us their
 size. `panthor-active-memory` shows the size of kernel BO's associated with
 VM's and groups currently being scheduled for execution by the GPU.
+
+Panthor Protected Memory Integration
+=====================================
+
+Panthor requires the platform to provide a protected DMA HEAP.
+This DMA heap must be identifiable via a string name.
+The name is defined by the system integrator, it could be hard coded
+in the heap driver, defined by a module parameter of the heap driver
+or else.
+
+.. code-block:: none
+
+    User
+        ┌─────────────────────────────┐
+        |           Application       |
+        └─────────────▲───────────────┘
+            |         |          |
+            | DMA-BUF |          | Protected
+            |         |          | Job Submission
+    --------|---------|----------|---------
+    Kernel  |         |          |
+            |         |          |
+            |         |  DMA-BUF |
+    ┌───────▼─────────────┐    ┌─▼───────┐
+    | DMA PROTECTED HEAP  |◄───| Panthor |
+    | (Vendor specific)   |    |         |
+    └─────────────────────┘    └─────────┘
+            |                    |
+    --------|--------------------|---------
+    HW      |                    |
+            |                    |
+    ┌───────▼───────────────┐  ┌─▼───┐
+    | Trusted FW            |  |     |
+    | Protected Memory      ◄──► GPU |
+    └───────────────────────┘  └─────┘
+
+To configure Panthor to use the protected memory heap, pass the protected memory
+heap string name as module parameter of the Panthor module.
+
+Example:
+
+    .. code-block:: shell
+
+        insmod panthor.ko protected_heap_name=“vendor_protected_heap"
+
+If `protected_heap_name` module parameter is not provided, Panthor will not support
+protected job execution.
diff --git a/drivers/gpu/drm/panthor/Kconfig b/drivers/gpu/drm/panthor/Kconfig
index 911e7f4810c39..fb0bad9a0fd2b 100644
--- a/drivers/gpu/drm/panthor/Kconfig
+++ b/drivers/gpu/drm/panthor/Kconfig
@@ -7,6 +7,7 @@ config DRM_PANTHOR
 	depends on !GENERIC_ATOMIC64  # for IOMMU_IO_PGTABLE_LPAE
 	depends on MMU
 	select DEVFREQ_GOV_SIMPLE_ONDEMAND
+	select DMABUF_HEAPS
 	select DRM_EXEC
 	select DRM_GPUVM
 	select DRM_SCHED
diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index bc62a498a8a84..3a5cdfa99e5fe 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -5,7 +5,9 @@
 /* Copyright 2025 ARM Limited. All rights reserved. */
 
 #include <linux/clk.h>
+#include <linux/dma-heap.h>
 #include <linux/mm.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
@@ -27,6 +29,10 @@
 #include "panthor_regs.h"
 #include "panthor_sched.h"
 
+MODULE_PARM_DESC(protected_heap_name, "DMA heap name, from which to allocate protected buffers");
+static char *protected_heap_name;
+module_param(protected_heap_name, charp, 0444);
+
 static int panthor_gpu_coherency_init(struct panthor_device *ptdev)
 {
 	BUILD_BUG_ON(GPU_COHERENCY_NONE != DRM_PANTHOR_GPU_COHERENCY_NONE);
@@ -127,6 +133,9 @@ void panthor_device_unplug(struct panthor_device *ptdev)
 	panthor_gpu_unplug(ptdev);
 	panthor_pwr_unplug(ptdev);
 
+	if (ptdev->protm.heap)
+		dma_heap_put(ptdev->protm.heap);
+
 	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
 	pm_runtime_put_sync_suspend(ptdev->base.dev);
 
@@ -277,9 +286,21 @@ int panthor_device_init(struct panthor_device *ptdev)
 			return ret;
 	}
 
+	/* If a protected heap name is specified but not found, defer the probe until created */
+	if (protected_heap_name && strlen(protected_heap_name)) {
+		ptdev->protm.heap = dma_heap_find(protected_heap_name);
+		if (!ptdev->protm.heap) {
+			drm_warn(&ptdev->base,
+				 "Protected heap \'%s\' not (yet) available - deferring probe",
+				 protected_heap_name);
+			ret = -EPROBE_DEFER;
+			goto err_rpm_put;
+		}
+	}
+
 	ret = panthor_hw_init(ptdev);
 	if (ret)
-		goto err_rpm_put;
+		goto err_dma_heap_put;
 
 	ret = panthor_pwr_init(ptdev);
 	if (ret)
@@ -343,6 +364,11 @@ int panthor_device_init(struct panthor_device *ptdev)
 
 err_rpm_put:
 	pm_runtime_put_sync_suspend(ptdev->base.dev);
+
+err_dma_heap_put:
+	if (ptdev->protm.heap)
+		dma_heap_put(ptdev->protm.heap);
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 5cba272f9b4de..d51fec97fc5fa 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -7,6 +7,7 @@
 #define __PANTHOR_DEVICE_H__
 
 #include <linux/atomic.h>
+#include <linux/dma-heap.h>
 #include <linux/io-pgtable.h>
 #include <linux/regulator/consumer.h>
 #include <linux/pm_runtime.h>
@@ -329,6 +330,11 @@ struct panthor_device {
 		struct list_head node;
 	} gems;
 #endif
+	/** @protm: Protected mode related data. */
+	struct {
+		/** @heap: Pointer to the protected heap */
+		struct dma_heap *heap;
+	} protm;
 };
 
 struct panthor_gpu_usage {
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 0d07a133dc3af..1aba29b9779b6 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -500,6 +500,7 @@ panthor_fw_alloc_queue_iface_mem(struct panthor_device *ptdev,
 
 	mem = panthor_kernel_bo_create(ptdev, ptdev->fw->vm, SZ_8K,
 				       DRM_PANTHOR_BO_NO_MMAP,
+				       0,
 				       DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
 				       DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
 				       PANTHOR_VM_KERNEL_AUTO_VA,
@@ -534,6 +535,26 @@ panthor_fw_alloc_suspend_buf_mem(struct panthor_device *ptdev, size_t size)
 {
 	return panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev), size,
 					DRM_PANTHOR_BO_NO_MMAP,
+					0,
+					DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
+					PANTHOR_VM_KERNEL_AUTO_VA,
+					"suspend_buf");
+}
+
+/**
+ * panthor_fw_alloc_protm_suspend_buf_mem() - Allocate a protm suspend buffer
+ * for a command stream group.
+ * @ptdev: Device.
+ * @size: Size of the protm suspend buffer.
+ *
+ * Return: A valid pointer in case of success, an ERR_PTR() otherwise.
+ */
+struct panthor_kernel_bo *
+panthor_fw_alloc_protm_suspend_buf_mem(struct panthor_device *ptdev, size_t size)
+{
+	return panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev), size,
+					DRM_PANTHOR_BO_NO_MMAP,
+					DRM_PANTHOR_KBO_PROTECTED_HEAP,
 					DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
 					PANTHOR_VM_KERNEL_AUTO_VA,
 					"FW suspend buffer");
@@ -547,6 +568,7 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
 	ssize_t vm_pgsz = panthor_vm_page_size(ptdev->fw->vm);
 	struct panthor_fw_binary_section_entry_hdr hdr;
 	struct panthor_fw_section *section;
+	u32 kbo_flags = 0;
 	u32 section_size;
 	u32 name_len;
 	int ret;
@@ -585,10 +607,13 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
 		return -EINVAL;
 	}
 
-	if (hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_PROT) {
+	if ((hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_PROT) && !ptdev->protm.heap) {
 		drm_warn(&ptdev->base,
 			 "Firmware protected mode entry is not supported, ignoring");
 		return 0;
+	} else if ((hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_PROT) && ptdev->protm.heap) {
+		drm_info(&ptdev->base, "Firmware protected mode entry supported");
+		kbo_flags = DRM_PANTHOR_KBO_PROTECTED_HEAP;
 	}
 
 	if (hdr.va.start == CSF_MCU_SHARED_REGION_START &&
@@ -653,7 +678,7 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
 
 		section->mem = panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev),
 							section_size,
-							DRM_PANTHOR_BO_NO_MMAP,
+							DRM_PANTHOR_BO_NO_MMAP, kbo_flags,
 							vm_map_flags, va, "FW section");
 		if (IS_ERR(section->mem))
 			return PTR_ERR(section->mem);
diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
index fbdc21469ba32..0cf3761abf789 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.h
+++ b/drivers/gpu/drm/panthor/panthor_fw.h
@@ -509,6 +509,8 @@ panthor_fw_alloc_queue_iface_mem(struct panthor_device *ptdev,
 				 u32 *input_fw_va, u32 *output_fw_va);
 struct panthor_kernel_bo *
 panthor_fw_alloc_suspend_buf_mem(struct panthor_device *ptdev, size_t size);
+struct panthor_kernel_bo *
+panthor_fw_alloc_protm_suspend_buf_mem(struct panthor_device *ptdev, size_t size);
 
 struct panthor_vm *panthor_fw_vm(struct panthor_device *ptdev);
 
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 13295d7a593df..08fe4a5e43817 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -20,12 +20,17 @@
 #include <drm/drm_print.h>
 #include <drm/panthor_drm.h>
 
+#include <uapi/linux/dma-heap.h>
+
 #include "panthor_device.h"
 #include "panthor_drv.h"
 #include "panthor_fw.h"
 #include "panthor_gem.h"
 #include "panthor_mmu.h"
 
+MODULE_IMPORT_NS("DMA_BUF");
+MODULE_IMPORT_NS("DMA_BUF_HEAP");
+
 void panthor_gem_init(struct panthor_device *ptdev)
 {
 	int err;
@@ -466,7 +471,6 @@ static void panthor_gem_free_object(struct drm_gem_object *obj)
 	}
 
 	drm_gem_object_release(obj);
-
 	kfree(bo);
 	drm_gem_object_put(vm_root_gem);
 }
@@ -1026,6 +1030,7 @@ panthor_gem_create(struct drm_device *dev, size_t size, uint32_t flags,
 	}
 
 	panthor_gem_debugfs_set_usage_flags(bo, usage_flags);
+
 	return bo;
 
 err_put:
@@ -1033,6 +1038,54 @@ panthor_gem_create(struct drm_device *dev, size_t size, uint32_t flags,
 	return ERR_PTR(ret);
 }
 
+static struct panthor_gem_object *
+panthor_gem_create_protected(struct panthor_device *ptdev, size_t size,
+			     uint32_t flags, struct panthor_vm *exclusive_vm,
+			     u32 usage_flags)
+{
+	struct dma_buf *dma_bo = NULL;
+	struct drm_gem_object *gem_obj;
+	struct panthor_gem_object *bo;
+	int ret;
+
+	if (!ptdev->protm.heap)
+		return ERR_PTR(-EINVAL);
+
+	if (flags != DRM_PANTHOR_BO_NO_MMAP)
+		return ERR_PTR(-EINVAL);
+
+	if (!exclusive_vm)
+		return ERR_PTR(-EINVAL);
+
+	dma_bo = dma_heap_buffer_alloc(ptdev->protm.heap, size, DMA_HEAP_VALID_FD_FLAGS,
+				       DMA_HEAP_VALID_HEAP_FLAGS);
+	if (IS_ERR(dma_bo))
+		return ERR_PTR(PTR_ERR(dma_bo));
+
+	gem_obj = drm_gem_prime_import(&ptdev->base, dma_bo);
+	if (IS_ERR(gem_obj)) {
+		ret = PTR_ERR(gem_obj);
+		goto err_free_dma_bo;
+	}
+
+	bo = to_panthor_bo(gem_obj);
+	bo->flags = flags;
+
+	panthor_gem_debugfs_set_usage_flags(bo, usage_flags);
+
+	bo->exclusive_vm_root_gem = panthor_vm_root_gem(exclusive_vm);
+	drm_gem_object_get(bo->exclusive_vm_root_gem);
+	bo->base.resv = bo->exclusive_vm_root_gem->resv;
+
+	return bo;
+
+err_free_dma_bo:
+	if (dma_bo)
+		dma_buf_put(dma_bo);
+
+	return ERR_PTR(ret);
+}
+
 struct drm_gem_object *
 panthor_gem_prime_import_sg_table(struct drm_device *dev,
 				  struct dma_buf_attachment *attach,
@@ -1242,12 +1295,17 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
 {
 	struct panthor_device *ptdev;
 	struct panthor_vm *vm;
+	struct dma_buf *dma_bo = NULL;
 
 	if (IS_ERR_OR_NULL(bo))
 		return;
 
 	ptdev = container_of(bo->obj->dev, struct panthor_device, base);
 	vm = bo->vm;
+
+	if (bo->flags & DRM_PANTHOR_KBO_PROTECTED_HEAP)
+		dma_bo = bo->obj->import_attach->dmabuf;
+
 	panthor_kernel_bo_vunmap(bo);
 
 	drm_WARN_ON(bo->obj->dev,
@@ -1257,6 +1315,10 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
 	if (vm == panthor_fw_vm(ptdev))
 		panthor_gem_unpin(to_panthor_bo(bo->obj));
 	drm_gem_object_put(bo->obj);
+
+	if (dma_bo)
+		dma_buf_put(dma_bo);
+
 	panthor_vm_put(vm);
 	kfree(bo);
 }
@@ -1267,6 +1329,7 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
  * @vm: VM to map the GEM to.
  * @size: Size of the buffer object.
  * @bo_flags: Combination of drm_panthor_bo_flags flags.
+ * @kbo_flags: Combination of drm_panthor_kbo_flags flags.
  * @vm_map_flags: Combination of drm_panthor_vm_bind_op_flags (only those
  * that are related to map operations).
  * @gpu_va: GPU address assigned when mapping to the VM.
@@ -1278,8 +1341,8 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
  */
 struct panthor_kernel_bo *
 panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
-			 size_t size, u32 bo_flags, u32 vm_map_flags,
-			 u64 gpu_va, const char *name)
+			 size_t size, u32 bo_flags, u32 kbo_flags,
+			 u32 vm_map_flags, u64 gpu_va, const char *name)
 {
 	struct panthor_kernel_bo *kbo;
 	struct panthor_gem_object *bo;
@@ -1296,13 +1359,19 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 	if (vm == panthor_fw_vm(ptdev))
 		debug_flags |= PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED;
 
-	bo = panthor_gem_create(&ptdev->base, size, bo_flags, vm, debug_flags);
+	if (kbo_flags & DRM_PANTHOR_KBO_PROTECTED_HEAP) {
+		bo = panthor_gem_create_protected(ptdev, size, bo_flags, vm, debug_flags);
+	} else {
+		bo = panthor_gem_create(&ptdev->base, size, bo_flags, vm, debug_flags);
+	}
+
 	if (IS_ERR(bo)) {
 		ret = PTR_ERR(bo);
 		goto err_free_kbo;
 	}
 
 	kbo->obj = &bo->base;
+	kbo->flags = kbo_flags;
 
 	if (vm == panthor_fw_vm(ptdev)) {
 		ret = panthor_gem_pin(bo);
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index ae0491d0b1216..b0eb5b465981a 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -153,6 +153,17 @@ enum panthor_gem_reclaim_state {
 	PANTHOR_GEM_UNRECLAIMABLE,
 };
 
+/**
+ * enum drm_panthor_kbo_flags -  Kernel buffer object flags, passed at creation time
+ */
+enum drm_panthor_kbo_flags {
+	/**
+	 * @DRM_PANTHOR_KBO_PROTECTED_HEAP: The buffer object will be allocated
+	 * from a DMA-Buf protected heap.
+	 */
+	DRM_PANTHOR_KBO_PROTECTED_HEAP = (1 << 0),
+};
+
 /**
  * struct panthor_gem_object - Driver specific GEM object.
  */
@@ -233,6 +244,9 @@ struct panthor_kernel_bo {
 	 * @kmap: Kernel CPU mapping of @gem.
 	 */
 	void *kmap;
+
+	/** @flags: Combination of drm_panthor_kbo_flags flags. */
+	u32 flags;
 };
 
 #define to_panthor_bo(obj) container_of_const(obj, struct panthor_gem_object, base)
@@ -310,7 +324,7 @@ panthor_kernel_bo_vunmap(struct panthor_kernel_bo *bo)
 
 struct panthor_kernel_bo *
 panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
-			 size_t size, u32 bo_flags, u32 vm_map_flags,
+			 size_t size, u32 bo_flags, u32 kbo_flags, u32 vm_map_flags,
 			 u64 gpu_va, const char *name);
 
 void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
index 1ee30dc7066f7..3183c74451fb0 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.c
+++ b/drivers/gpu/drm/panthor/panthor_heap.c
@@ -151,6 +151,7 @@ static int panthor_alloc_heap_chunk(struct panthor_heap_pool *pool,
 
 	chunk->bo = panthor_kernel_bo_create(pool->ptdev, pool->vm, heap->chunk_size,
 					     DRM_PANTHOR_BO_NO_MMAP,
+					     0,
 					     DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
 					     PANTHOR_VM_KERNEL_AUTO_VA,
 					     "Tiler heap chunk");
@@ -556,6 +557,7 @@ panthor_heap_pool_create(struct panthor_device *ptdev, struct panthor_vm *vm)
 
 	pool->gpu_contexts = panthor_kernel_bo_create(ptdev, vm, bosize,
 						      DRM_PANTHOR_BO_NO_MMAP,
+						      0,
 						      DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
 						      PANTHOR_VM_KERNEL_AUTO_VA,
 						      "Heap pool");
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 41d6369fa9c05..5ee386338005c 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3529,6 +3529,7 @@ group_create_queue(struct panthor_group *group,
 	queue->ringbuf = panthor_kernel_bo_create(group->ptdev, group->vm,
 						  args->ringbuf_size,
 						  DRM_PANTHOR_BO_NO_MMAP,
+						  0,
 						  DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
 						  DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
 						  PANTHOR_VM_KERNEL_AUTO_VA,
@@ -3560,6 +3561,7 @@ group_create_queue(struct panthor_group *group,
 					 queue->profiling.slot_count *
 					 sizeof(struct panthor_job_profiling_data),
 					 DRM_PANTHOR_BO_NO_MMAP,
+					 0,
 					 DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
 					 DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
 					 PANTHOR_VM_KERNEL_AUTO_VA,
@@ -3618,9 +3620,11 @@ static void add_group_kbo_sizes(struct panthor_device *ptdev,
 	if (drm_WARN_ON(&ptdev->base, ptdev != group->ptdev))
 		return;
 
-	group->fdinfo.kbo_sizes += group->suspend_buf->obj->size;
-	group->fdinfo.kbo_sizes += group->protm_suspend_buf->obj->size;
 	group->fdinfo.kbo_sizes += group->syncobjs->obj->size;
+	group->fdinfo.kbo_sizes += group->suspend_buf->obj->size;
+
+	if (group->protm_suspend_buf)
+		group->fdinfo.kbo_sizes += group->protm_suspend_buf->obj->size;
 
 	for (i = 0; i < group->queue_count; i++) {
 		queue =	group->queues[i];
@@ -3701,7 +3705,7 @@ int panthor_group_create(struct panthor_file *pfile,
 	}
 
 	suspend_size = csg_iface->control->protm_suspend_size;
-	group->protm_suspend_buf = panthor_fw_alloc_suspend_buf_mem(ptdev, suspend_size);
+	group->protm_suspend_buf = panthor_fw_alloc_protm_suspend_buf_mem(ptdev, suspend_size);
 	if (IS_ERR(group->protm_suspend_buf)) {
 		ret = PTR_ERR(group->protm_suspend_buf);
 		group->protm_suspend_buf = NULL;
@@ -3712,6 +3716,7 @@ int panthor_group_create(struct panthor_file *pfile,
 						   group_args->queues.count *
 						   sizeof(struct panthor_syncobj_64b),
 						   DRM_PANTHOR_BO_NO_MMAP,
+						   0,
 						   DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
 						   DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
 						   PANTHOR_VM_KERNEL_AUTO_VA,
-- 
2.43.0


