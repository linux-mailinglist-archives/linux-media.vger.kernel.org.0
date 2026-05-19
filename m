Return-Path: <linux-media+bounces-62091-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNOkCQEBDGpcTQUAu9opvQ
	(envelope-from <linux-media+bounces-62091-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 08:19:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D0E577EA6
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 08:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5E1A3004274
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 06:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BF4E3A7D73;
	Tue, 19 May 2026 06:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NByfPXYd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283AA39446D;
	Tue, 19 May 2026 06:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171356; cv=none; b=LXX/lY5xeRU/yXumym20R+tmmouLZEroShyGnuZRyWkpgchyAU/JQkn9IWodzIAC8N6JK8ndnr7YaNbcQy37WnnwaxPg2Dz8xPYSDCurM5DWMfZ2P4/WRknt9qixhcHnnIyY8c6DpU2WmeMit3ZIJYwkW2ZxpQV8e/iOvoijmkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171356; c=relaxed/simple;
	bh=+ogeYzT4GycqyufwWxDOEkVKWahvcJRqU2rYDiNrTwA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mNiL0bi9RUuq/4c8TRxNQqH8MT22c3vmbMh12ebSLmLYcpcxqsrWy5K5ONi8RxaxhsOmJts0uUdywMsK8UnpSYg8dusdpNx1ABV9wyaOJFhB0zg6LiLVbHOGftPoEgZi0tFdD0JRYKbMRj4qzFvjdIPiv04DztE6cYEVDf3bPZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NByfPXYd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00062C2BCFB;
	Tue, 19 May 2026 06:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779171356;
	bh=+ogeYzT4GycqyufwWxDOEkVKWahvcJRqU2rYDiNrTwA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NByfPXYdAug/Mtv2pQ1j7c8I0KYk09ue/aVNoy7peJNvprV5ac8hCldTJx0SrqReH
	 +B7mB/DKEe842BaFJPQUll9icvZZtjipq6TazHp976TXqkK42nO4XczX8q6tAIniyu
	 wrFFZXeM2eSIcGM2qbWmrvgIzbTnT5k786IFqzS0UktbZDLJsglZ/LKy+6DwPA5RjI
	 7qz6EAv6KRMet0rhD7Szk2P6e4W+fgFoTdpdcU5MZw/5OkuNrj1JkHpvICe8+hUNyI
	 GN+P18oq26WYAmQx9DwFMVY13KZyG2hvlHjqBiKxGEOFeXnGkIMJGoQHDHGAT6PS2i
	 u5FjMCfUIcQ4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94E8CD4F54;
	Tue, 19 May 2026 06:15:55 +0000 (UTC)
From: Ekansh Gupta via B4 Relay <devnull+ekansh.gupta.oss.qualcomm.com@kernel.org>
Date: Tue, 19 May 2026 11:46:01 +0530
Subject: [PATCH 11/15] accel/qda: Add PRIME DMA-BUF import support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qda-series-v1-11-b2d984c297f8@oss.qualcomm.com>
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
In-Reply-To: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>, 
 Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org, 
 dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org, 
 konradybcio@kernel.org, robin.clark@oss.qualcomm.com, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 iommu@lists.linux.dev, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, 
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779171352; l=16695;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=mu9PjNV0z7QAKMC/qEzN0L/zfmcB/ZH6GtgEUyJLIyo=;
 b=4DdUZx9jbG60Uzoeq6zS6DO5QoImGGQxnHDKiJKN5PB0OjsoufNqTvO+CHafEMmW/tW+rhIia
 hkwY/7q8ZKvBOmigeUdxHL5DUIzQ8nWorJbx3PddLlFMI0EA0Gv41s9
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Endpoint-Received: by B4 Relay for ekansh.gupta@oss.qualcomm.com/20260223
 with auth_id=647
X-Original-From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Reply-To: ekansh.gupta@oss.qualcomm.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62091-lists,linux-media=lfdr.de,ekansh.gupta.oss.qualcomm.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[ekansh.gupta@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:replyto,qualcomm.com:email]
X-Rspamd-Queue-Id: 98D0E577EA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Allow user-space to import DMA-BUF file descriptors from other
subsystems (GPU, camera, video) into the QDA driver via the standard
DRM PRIME interface.

qda_prime.c
  Implements qda_gem_prime_import(), which is set as the driver's
  .gem_prime_import callback. On import it:
  1. Short-circuits self-import: if the dma_buf was exported by this
     device and is not itself an import, the existing GEM object is
     returned with an incremented reference count.
  2. Attaches to the dma_buf and maps it with DMA_BIDIRECTIONAL via
     dma_buf_map_attachment_unlocked(), obtaining an sg_table whose
     DMA addresses are IOMMU virtual addresses in the CB device's
     address space.
  3. Calls qda_memory_manager_alloc() to record the IOMMU mapping and
     encode the SID in the upper 32 bits of the DMA address, matching
     the convention used for natively allocated buffers.

  qda_prime_fd_to_handle() wraps drm_gem_prime_fd_to_handle() under
  qdev->import_lock, storing the calling file_priv in
  qdev->current_import_file_priv so that qda_gem_prime_import() can
  retrieve it (the .gem_prime_import callback does not receive
  file_priv directly).

qda_gem.c
  qda_gem_free_object() is extended to handle the imported-buffer
  teardown path: unmap the sg_table, detach from the dma_buf, and
  release the dma_buf reference.
  qda_gem_mmap_obj() rejects mmap requests on imported objects.

qda_memory_manager.c
  qda_memory_manager_map_imported() records the IOMMU-mapped DMA
  address from the first sg entry (the IOMMU maps the buffer as a
  contiguous range) and encodes the SID prefix.
  qda_memory_manager_free() skips the DMA free path for imported
  buffers since the memory is owned by the exporter.

Assisted-by: Claude:claude-4-6-sonnet
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/Makefile             |   1 +
 drivers/accel/qda/qda_drv.c            |  12 ++-
 drivers/accel/qda/qda_drv.h            |   4 +
 drivers/accel/qda/qda_gem.c            |  25 ++++-
 drivers/accel/qda/qda_gem.h            |   8 ++
 drivers/accel/qda/qda_memory_manager.c |  47 ++++++++-
 drivers/accel/qda/qda_prime.c          | 184 +++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_prime.h          |  18 ++++
 8 files changed, 295 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
index a46ddceecfc5..fb092e56d7f3 100644
--- a/drivers/accel/qda/Makefile
+++ b/drivers/accel/qda/Makefile
@@ -12,6 +12,7 @@ qda-y := \
 	qda_ioctl.o \
 	qda_memory_dma.o \
 	qda_memory_manager.o \
+	qda_prime.o \
 	qda_rpmsg.o
 
 obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index c9b9e56dcb28..ef8bd573b836 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -7,10 +7,12 @@
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_ioctl.h>
+#include <drm/drm_prime.h>
 #include <drm/drm_print.h>
 #include <drm/qda_accel.h>
 
 #include "qda_drv.h"
+#include "qda_prime.h"
 #include "qda_ioctl.h"
 #include "qda_rpmsg.h"
 
@@ -64,6 +66,8 @@ static const struct drm_driver qda_drm_driver = {
 	.postclose = qda_postclose,
 	.ioctls = qda_ioctls,
 	.num_ioctls = ARRAY_SIZE(qda_ioctls),
+	.gem_prime_import = qda_gem_prime_import,
+	.prime_fd_to_handle = qda_prime_fd_to_handle,
 	.name = QDA_DRIVER_NAME,
 	.desc = "Qualcomm DSP Accelerator Driver",
 };
@@ -100,6 +104,7 @@ static int init_memory_manager(struct qda_dev *qdev)
 
 void qda_deinit_device(struct qda_dev *qdev)
 {
+	mutex_destroy(&qdev->import_lock);
 	cleanup_memory_manager(qdev);
 }
 
@@ -107,9 +112,14 @@ int qda_init_device(struct qda_dev *qdev)
 {
 	int ret;
 
+	mutex_init(&qdev->import_lock);
+	qdev->current_import_file_priv = NULL;
+
 	ret = init_memory_manager(qdev);
-	if (ret)
+	if (ret) {
 		drm_err(&qdev->drm_dev, "Failed to initialize memory manager: %d\n", ret);
+		mutex_destroy(&qdev->import_lock);
+	}
 
 	return ret;
 }
diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
index 8a7d647ac8fc..96ce4135e2d9 100644
--- a/drivers/accel/qda/qda_drv.h
+++ b/drivers/accel/qda/qda_drv.h
@@ -47,6 +47,10 @@ struct qda_dev {
 	struct list_head cb_devs;
 	/** @iommu_mgr: IOMMU/memory manager instance */
 	struct qda_memory_manager *iommu_mgr;
+	/** @import_lock: Lock protecting prime import context */
+	struct mutex import_lock;
+	/** @current_import_file_priv: Current file_priv during prime import */
+	struct drm_file *current_import_file_priv;
 	/** @dsp_name: Name of the DSP domain (e.g. "cdsp", "adsp") */
 	const char *dsp_name;
 };
diff --git a/drivers/accel/qda/qda_gem.c b/drivers/accel/qda/qda_gem.c
index 568b3c2e64b7..9e1ac7582d0c 100644
--- a/drivers/accel/qda/qda_gem.c
+++ b/drivers/accel/qda/qda_gem.c
@@ -9,6 +9,7 @@
 #include "qda_gem.h"
 #include "qda_memory_manager.h"
 #include "qda_memory_dma.h"
+#include "qda_prime.h"
 
 static void setup_vma_flags(struct vm_area_struct *vma)
 {
@@ -25,8 +26,20 @@ void qda_gem_free_object(struct drm_gem_object *gem_obj)
 	struct qda_gem_obj *qda_gem_obj = to_qda_gem_obj(gem_obj);
 	struct qda_dev *qdev = qda_dev_from_drm(gem_obj->dev);
 
-	if (qda_gem_obj->virt && qdev->iommu_mgr)
-		qda_memory_manager_free(qdev->iommu_mgr, qda_gem_obj);
+	if (qda_gem_obj->is_imported) {
+		if (qda_gem_obj->attachment && qda_gem_obj->sgt)
+			dma_buf_unmap_attachment_unlocked(qda_gem_obj->attachment,
+							  qda_gem_obj->sgt, DMA_BIDIRECTIONAL);
+		if (qda_gem_obj->attachment)
+			dma_buf_detach(qda_gem_obj->dma_buf, qda_gem_obj->attachment);
+		if (qda_gem_obj->dma_buf)
+			dma_buf_put(qda_gem_obj->dma_buf);
+		if (qda_gem_obj->iommu_dev && qdev->iommu_mgr)
+			qda_memory_manager_free(qdev->iommu_mgr, qda_gem_obj);
+	} else {
+		if (qda_gem_obj->virt && qdev->iommu_mgr)
+			qda_memory_manager_free(qdev->iommu_mgr, qda_gem_obj);
+	}
 
 	drm_gem_object_release(gem_obj);
 	kfree(qda_gem_obj);
@@ -44,6 +57,10 @@ int qda_gem_mmap_obj(struct drm_gem_object *drm_obj, struct vm_area_struct *vma)
 	struct qda_gem_obj *qda_gem_obj = to_qda_gem_obj(drm_obj);
 	int ret;
 
+	/* Imported dma-buf objects must be mmap'd through the exporter, not the importer */
+	if (qda_gem_obj->is_imported)
+		return -EINVAL;
+
 	/* Reset vm_pgoff for DMA mmap */
 	vma->vm_pgoff = 0;
 
@@ -143,6 +160,10 @@ struct drm_gem_object *qda_gem_create_object(struct drm_device *drm_dev,
 	qda_gem_obj = qda_gem_alloc_object(drm_dev, aligned_size);
 	if (IS_ERR(qda_gem_obj))
 		return ERR_CAST(qda_gem_obj);
+	qda_gem_obj->is_imported = false;
+	qda_gem_obj->dma_buf = NULL;
+	qda_gem_obj->attachment = NULL;
+	qda_gem_obj->sgt = NULL;
 
 	ret = qda_memory_manager_alloc(iommu_mgr, qda_gem_obj, file_priv);
 	if (ret) {
diff --git a/drivers/accel/qda/qda_gem.h b/drivers/accel/qda/qda_gem.h
index bb18f8155aa4..0878f57715f6 100644
--- a/drivers/accel/qda/qda_gem.h
+++ b/drivers/accel/qda/qda_gem.h
@@ -22,12 +22,20 @@ struct qda_gem_obj {
 	struct drm_gem_object base;
 	/** @iommu_dev: IOMMU context bank device that performed the allocation */
 	struct qda_iommu_device *iommu_dev;
+	/** @dma_buf: Reference to imported dma_buf */
+	struct dma_buf *dma_buf;
+	/** @attachment: DMA buf attachment */
+	struct dma_buf_attachment *attachment;
+	/** @sgt: Scatter-gather table */
+	struct sg_table *sgt;
 	/** @virt: Kernel virtual address of the allocated DMA memory */
 	void *virt;
 	/** @dma_addr: DMA address (with SID encoded in upper 32 bits) */
 	dma_addr_t dma_addr;
 	/** @size: Size of the buffer in bytes */
 	size_t size;
+	/** @is_imported: True if buffer is imported, false if allocated */
+	bool is_imported;
 };
 
 /**
diff --git a/drivers/accel/qda/qda_memory_manager.c b/drivers/accel/qda/qda_memory_manager.c
index 82111275f420..d2aa0e0e65f5 100644
--- a/drivers/accel/qda/qda_memory_manager.c
+++ b/drivers/accel/qda/qda_memory_manager.c
@@ -202,6 +202,41 @@ static struct qda_iommu_device *get_or_assign_iommu_device(struct qda_memory_man
 	return NULL;
 }
 
+static int qda_memory_manager_map_imported(struct qda_memory_manager *mem_mgr,
+					   struct qda_gem_obj *gem_obj,
+					   struct qda_iommu_device *iommu_dev)
+{
+	struct scatterlist *sg;
+	dma_addr_t dma_addr;
+
+	if (!gem_obj->is_imported || !gem_obj->sgt || !iommu_dev) {
+		drm_err(gem_obj->base.dev, "Invalid parameters for imported buffer mapping\n");
+		return -EINVAL;
+	}
+
+	sg = gem_obj->sgt->sgl;
+	if (!sg) {
+		drm_err(gem_obj->base.dev, "Invalid scatter-gather list for imported buffer\n");
+		return -EINVAL;
+	}
+
+	gem_obj->iommu_dev = iommu_dev;
+
+	/*
+	 * After dma_buf_map_attachment_unlocked(), sg_dma_address() returns the
+	 * IOMMU virtual address, not the physical address. The IOMMU maps the
+	 * entire buffer as a contiguous range in the IOMMU address space even if
+	 * the underlying physical memory is non-contiguous. Therefore the first
+	 * sg entry's DMA address is the start of the complete contiguous
+	 * IOMMU-mapped range and is sufficient to describe the buffer to the DSP.
+	 */
+	dma_addr = sg_dma_address(sg);
+	dma_addr += ((u64)iommu_dev->sid << 32);
+	gem_obj->dma_addr = dma_addr;
+
+	return 0;
+}
+
 /**
  * qda_memory_manager_alloc() - Allocate memory for a GEM object
  * @mem_mgr: Pointer to memory manager
@@ -237,7 +272,11 @@ int qda_memory_manager_alloc(struct qda_memory_manager *mem_mgr, struct qda_gem_
 		return -ENOMEM;
 	}
 
-	ret = qda_dma_alloc(selected_dev, gem_obj, size);
+	if (gem_obj->is_imported)
+		ret = qda_memory_manager_map_imported(mem_mgr, gem_obj, selected_dev);
+	else
+		ret = qda_dma_alloc(selected_dev, gem_obj, size);
+
 	if (ret) {
 		drm_err(gem_obj->base.dev, "Allocation failed: size=%zu, device_id=%u, ret=%d\n",
 			size, selected_dev->id, ret);
@@ -262,6 +301,12 @@ void qda_memory_manager_free(struct qda_memory_manager *mem_mgr, struct qda_gem_
 		return;
 	}
 
+	if (gem_obj->is_imported) {
+		drm_dbg_driver(gem_obj->base.dev,
+			       "Freed imported buffer tracking (no DMA free needed)\n");
+		return;
+	}
+
 	qda_dma_free(gem_obj);
 }
 
diff --git a/drivers/accel/qda/qda_prime.c b/drivers/accel/qda/qda_prime.c
new file mode 100644
index 000000000000..acb0ac8c40fd
--- /dev/null
+++ b/drivers/accel/qda/qda_prime.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <drm/drm_gem.h>
+#include <drm/drm_prime.h>
+#include <drm/drm_print.h>
+#include <linux/slab.h>
+#include <linux/dma-mapping.h>
+#include "qda_drv.h"
+#include "qda_gem.h"
+#include "qda_prime.h"
+#include "qda_memory_manager.h"
+
+static struct drm_gem_object *check_own_buffer(struct drm_device *dev, struct dma_buf *dma_buf)
+{
+	struct drm_gem_object *existing_gem;
+
+	/* Only safe to access priv if this dma-buf was exported by this device */
+	if (!drm_gem_is_prime_exported_dma_buf(dev, dma_buf))
+		return NULL;
+
+	existing_gem = dma_buf->priv;
+	if (existing_gem->dev != dev)
+		return NULL;
+
+	if (to_qda_gem_obj(existing_gem)->is_imported)
+		return NULL;
+
+	drm_gem_object_get(existing_gem);
+	return existing_gem;
+}
+
+static struct qda_iommu_device *get_iommu_device_for_import(struct qda_dev *qdev,
+							    struct drm_file **file_priv_out)
+{
+	struct drm_file *file_priv;
+	struct qda_file_priv *qda_file_priv;
+	struct qda_iommu_device *iommu_dev = NULL;
+	int ret;
+
+	file_priv = qdev->current_import_file_priv;
+	*file_priv_out = file_priv;
+
+	if (!file_priv || !file_priv->driver_priv)
+		return NULL;
+
+	qda_file_priv = (struct qda_file_priv *)file_priv->driver_priv;
+	iommu_dev = qda_file_priv->assigned_iommu_dev;
+
+	if (!iommu_dev) {
+		ret = qda_memory_manager_assign_device(qdev->iommu_mgr, file_priv);
+		if (ret) {
+			drm_err(&qdev->drm_dev, "Failed to assign IOMMU device: %d\n", ret);
+			return NULL;
+		}
+
+		iommu_dev = qda_file_priv->assigned_iommu_dev;
+	}
+
+	return iommu_dev;
+}
+
+static int setup_dma_buf_mapping(struct qda_gem_obj *qda_gem_obj, struct dma_buf *dma_buf,
+				 struct device *attach_dev, struct qda_dev *qdev)
+{
+	struct dma_buf_attachment *attachment;
+	struct sg_table *sgt;
+	int ret;
+
+	attachment = dma_buf_attach(dma_buf, attach_dev);
+	if (IS_ERR(attachment)) {
+		ret = PTR_ERR(attachment);
+		drm_err(&qdev->drm_dev, "Failed to attach dma_buf: %d\n", ret);
+		return ret;
+	}
+	qda_gem_obj->attachment = attachment;
+
+	sgt = dma_buf_map_attachment_unlocked(attachment, DMA_BIDIRECTIONAL);
+	if (IS_ERR(sgt)) {
+		ret = PTR_ERR(sgt);
+		drm_err(&qdev->drm_dev, "Failed to map dma_buf attachment: %d\n", ret);
+		dma_buf_detach(dma_buf, attachment);
+		return ret;
+	}
+	qda_gem_obj->sgt = sgt;
+
+	return 0;
+}
+
+/**
+ * qda_gem_prime_import() - Import a DMA-BUF as a GEM object
+ * @dev: DRM device structure
+ * @dma_buf: DMA-BUF to import
+ *
+ * Return: Pointer to the imported GEM object on success, ERR_PTR on failure
+ */
+struct drm_gem_object *qda_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf)
+{
+	struct qda_dev *qdev = qda_dev_from_drm(dev);
+	struct qda_gem_obj *qda_gem_obj;
+	struct drm_file *file_priv;
+	struct qda_iommu_device *iommu_dev;
+	struct drm_gem_object *existing_gem;
+	size_t aligned_size;
+	int ret;
+
+	if (!qdev->iommu_mgr) {
+		drm_err(dev, "Invalid iommu_mgr\n");
+		return ERR_PTR(-ENODEV);
+	}
+
+	existing_gem = check_own_buffer(dev, dma_buf);
+	if (existing_gem)
+		return existing_gem;
+
+	iommu_dev = get_iommu_device_for_import(qdev, &file_priv);
+	if (!iommu_dev || !iommu_dev->dev) {
+		drm_err(dev, "No IOMMU device assigned for prime import\n");
+		return ERR_PTR(-ENODEV);
+	}
+
+	drm_dbg_driver(dev, "Using IOMMU device %u for prime import\n", iommu_dev->id);
+
+	aligned_size = PAGE_ALIGN(dma_buf->size);
+	qda_gem_obj = qda_gem_alloc_object(dev, aligned_size);
+	if (IS_ERR(qda_gem_obj))
+		return ERR_CAST(qda_gem_obj);
+
+	qda_gem_obj->is_imported = true;
+	qda_gem_obj->dma_buf = dma_buf;
+	qda_gem_obj->virt = NULL;
+	qda_gem_obj->iommu_dev = iommu_dev;
+
+	get_dma_buf(dma_buf);
+
+	ret = setup_dma_buf_mapping(qda_gem_obj, dma_buf, iommu_dev->dev, qdev);
+	if (ret)
+		goto err_put_dma_buf;
+
+	ret = qda_memory_manager_alloc(qdev->iommu_mgr, qda_gem_obj, file_priv);
+	if (ret) {
+		drm_err(dev, "Failed to allocate IOMMU mapping: %d\n", ret);
+		goto err_unmap;
+	}
+
+	drm_dbg_driver(dev, "Prime import completed successfully size=%zu\n", aligned_size);
+	return &qda_gem_obj->base;
+
+err_unmap:
+	dma_buf_unmap_attachment_unlocked(qda_gem_obj->attachment,
+					  qda_gem_obj->sgt, DMA_BIDIRECTIONAL);
+	dma_buf_detach(dma_buf, qda_gem_obj->attachment);
+err_put_dma_buf:
+	dma_buf_put(dma_buf);
+	qda_gem_cleanup_object(qda_gem_obj);
+	return ERR_PTR(ret);
+}
+
+/**
+ * qda_prime_fd_to_handle() - Convert a PRIME fd to a GEM handle
+ * @dev: DRM device structure
+ * @file_priv: DRM file private data
+ * @prime_fd: File descriptor of the PRIME buffer
+ * @handle: Output GEM handle
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_prime_fd_to_handle(struct drm_device *dev, struct drm_file *file_priv,
+			   int prime_fd, u32 *handle)
+{
+	struct qda_dev *qdev = qda_dev_from_drm(dev);
+	int ret;
+
+	mutex_lock(&qdev->import_lock);
+	qdev->current_import_file_priv = file_priv;
+
+	ret = drm_gem_prime_fd_to_handle(dev, file_priv, prime_fd, handle);
+
+	qdev->current_import_file_priv = NULL;
+	mutex_unlock(&qdev->import_lock);
+
+	return ret;
+}
+
+MODULE_IMPORT_NS("DMA_BUF");
diff --git a/drivers/accel/qda/qda_prime.h b/drivers/accel/qda/qda_prime.h
new file mode 100644
index 000000000000..9b3850d54fa7
--- /dev/null
+++ b/drivers/accel/qda/qda_prime.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_PRIME_H__
+#define __QDA_PRIME_H__
+
+#include <drm/drm_device.h>
+#include <drm/drm_file.h>
+#include <drm/drm_gem.h>
+#include <linux/dma-buf.h>
+
+struct drm_gem_object *qda_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf);
+int qda_prime_fd_to_handle(struct drm_device *dev, struct drm_file *file_priv,
+			   int prime_fd, u32 *handle);
+
+#endif /* __QDA_PRIME_H__ */

-- 
2.34.1



