Return-Path: <linux-media+bounces-62089-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMbyLMMADGoUTgUAu9opvQ
	(envelope-from <linux-media+bounces-62089-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 08:18:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3514577E59
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 08:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CA88A302EE23
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 06:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C913A6F10;
	Tue, 19 May 2026 06:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvL2nwsC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F09839099C;
	Tue, 19 May 2026 06:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171356; cv=none; b=LYSpcOg7C9u06Dfnq3RiwJc1i55b9rxg1wZQyHHnSSqbPH7eBvkbUUlxcIP1AffqyWLCPetqjawd14PB2PGvFR++iBOoAodaaUBv2Cs66jKUC9qPl67qu5AZALCzNu9pRFOjyZuJ0zA2wPmqiUBz2zHQYyt15Yd+q/6BpxpLV1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171356; c=relaxed/simple;
	bh=IoPb4PelOfj2dYDOPt7nuGzwMUbtBYQM597igk1ioFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WvcGhpqQaknnfv2J5GKGQlAyBMRK5DgTGu1U6Qd/8RqhObJ/erBal2Ov1kQfUxT7BJI2FOwN//Wn2ppawVEpfJZ1MClZK7YYXX/9vv6hGW0PslfzTM87cpL+q4nWYmt0/++bo9J5fpoWjyiIpg7jCC2V+bUbay9pmM/CZjNda7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvL2nwsC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE34EC2BCC9;
	Tue, 19 May 2026 06:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779171355;
	bh=IoPb4PelOfj2dYDOPt7nuGzwMUbtBYQM597igk1ioFQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JvL2nwsCegCOMdeFE4r0EebXnjT/eIN8NR+wNWpCeYouHHtvrx5MC2RUkqcUWWtoc
	 Z85KyzGEuucGLNz/9Flp6Zt134pheNT2fORen3ramYdLKspr4/RZh6d/miuP4quE4e
	 GD0osijZPrLWcSgYbYzOISnzG+1uAuvRUb92vYVOX14OsL/aCXzoqIsazNlfRIunkw
	 3R8bRaskSYd1DiYC2gak8dJUPJ+mjpDkC77qH4SfAf4i64afMyDuQQNjCIt5TFM22f
	 3+P1uCem43XxUU1XO290CQYc+VkES7iuWf2NOVXxr4k/YDYMwAv67IicfrYEZIK8TV
	 hDCSpToWwODrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C61ABCD4851;
	Tue, 19 May 2026 06:15:55 +0000 (UTC)
From: Ekansh Gupta via B4 Relay <devnull+ekansh.gupta.oss.qualcomm.com@kernel.org>
Date: Tue, 19 May 2026 11:45:59 +0530
Subject: [PATCH 09/15] accel/qda: Add DMA-backed GEM objects and memory
 manager integration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260519-qda-series-v1-9-b2d984c297f8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779171352; l=25749;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=LBE7eCULa6dTVwkwg/IKkml6yJ1kLUKoxNx2KK10cYo=;
 b=PB4kwzpsnNuchlvUQaV51ceB7u5X0tGHeWaRP3RUv+MLkFbszH/7ZUdwcEjAm5705n7dVVZgI
 OmiXoA84fmyAfmPxasTEz2gwRZmgmI6dVUs+t/fBBHfOOW93JKMoOzn
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62089-lists,linux-media=lfdr.de,ekansh.gupta.oss.qualcomm.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	HAS_REPLYTO(0.00)[ekansh.gupta@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:replyto,qualcomm.com:email]
X-Rspamd-Queue-Id: B3514577E59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Introduce DMA-coherent buffer management for the QDA driver, wiring
together the GEM subsystem, the IOMMU memory manager, and a DMA
allocation backend.

qda_gem.c / qda_gem.h
  Implements the GEM object lifecycle for QDA buffers. Each buffer is
  represented by a qda_gem_obj which embeds a drm_gem_object and
  carries the kernel virtual address, DMA address, and a pointer to
  the IOMMU device that performed the allocation. The .free callback
  delegates to the memory manager, and the .mmap callback uses
  dma_mmap_coherent() via the DMA backend.

qda_memory_dma.c / qda_memory_dma.h
  DMA coherent allocation backend. qda_dma_alloc() calls
  dma_alloc_coherent() on the CB device and encodes the stream ID
  (SID) in the upper 32 bits of the returned DMA address, following
  the Qualcomm FastRPC convention for IOMMU address space tagging.
  qda_dma_free() strips the SID prefix before calling
  dma_free_coherent().

qda_memory_manager.c
  Adds process-to-device assignment: each DRM file (process) is
  assigned one IOMMU context bank device for the lifetime of the
  session. qda_memory_manager_assign_device() first checks whether
  the process already has a device (reusing it with a refcount
  increment), then falls back to claiming an unassigned device.
  qda_memory_manager_alloc() and qda_memory_manager_free() delegate
  to the DMA backend after resolving the correct CB device for the
  calling process.

qda_drv.c / qda_drv.h
  qda_file_priv gains an assigned_iommu_dev pointer and a pid field.
  The .postclose callback decrements the IOMMU device refcount and
  clears the process assignment when the last reference is dropped.

Assisted-by: Claude:claude-4-6-sonnet
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/Makefile             |   2 +
 drivers/accel/qda/qda_drv.c            |  13 ++
 drivers/accel/qda/qda_drv.h            |   4 +
 drivers/accel/qda/qda_gem.c            | 156 +++++++++++++++++++++++
 drivers/accel/qda/qda_gem.h            |  54 ++++++++
 drivers/accel/qda/qda_memory_dma.c     | 110 ++++++++++++++++
 drivers/accel/qda/qda_memory_dma.h     |  17 +++
 drivers/accel/qda/qda_memory_manager.c | 224 +++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_memory_manager.h |  28 ++++-
 9 files changed, 607 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
index b658dad35fee..a46ddceecfc5 100644
--- a/drivers/accel/qda/Makefile
+++ b/drivers/accel/qda/Makefile
@@ -8,7 +8,9 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
 qda-y := \
 	qda_cb.o \
 	qda_drv.o \
+	qda_gem.o \
 	qda_ioctl.o \
+	qda_memory_dma.o \
 	qda_memory_manager.o \
 	qda_rpmsg.o
 
diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index becd831d10be..1b534fea50c8 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -22,6 +22,7 @@ static int qda_open(struct drm_device *dev, struct drm_file *file)
 	if (!qda_file_priv)
 		return -ENOMEM;
 
+	qda_file_priv->pid = current->pid;
 	qda_file_priv->qda_dev = qda_dev_from_drm(dev);
 	file->driver_priv = qda_file_priv;
 
@@ -32,6 +33,18 @@ static void qda_postclose(struct drm_device *dev, struct drm_file *file)
 {
 	struct qda_file_priv *qda_file_priv = file->driver_priv;
 
+	if (qda_file_priv->assigned_iommu_dev) {
+		struct qda_iommu_device *iommu_dev = qda_file_priv->assigned_iommu_dev;
+		unsigned long flags;
+
+		if (refcount_dec_and_test(&iommu_dev->refcount)) {
+			spin_lock_irqsave(&iommu_dev->lock, flags);
+			iommu_dev->assigned_pid = 0;
+			iommu_dev->assigned_file_priv = NULL;
+			spin_unlock_irqrestore(&iommu_dev->lock, flags);
+		}
+	}
+
 	kfree(qda_file_priv);
 	file->driver_priv = NULL;
 }
diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
index eb089e586b17..8a7d647ac8fc 100644
--- a/drivers/accel/qda/qda_drv.h
+++ b/drivers/accel/qda/qda_drv.h
@@ -24,6 +24,10 @@
 struct qda_file_priv {
 	/** @qda_dev: Back-pointer to device structure */
 	struct qda_dev *qda_dev;
+	/** @assigned_iommu_dev: IOMMU device assigned to this process */
+	struct qda_iommu_device *assigned_iommu_dev;
+	/** @pid: Process ID for tracking */
+	pid_t pid;
 };
 
 /**
diff --git a/drivers/accel/qda/qda_gem.c b/drivers/accel/qda/qda_gem.c
new file mode 100644
index 000000000000..568b3c2e64b7
--- /dev/null
+++ b/drivers/accel/qda/qda_gem.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <drm/drm_gem.h>
+#include <drm/drm_prime.h>
+#include <drm/drm_print.h>
+#include <linux/slab.h>
+#include <linux/dma-mapping.h>
+#include "qda_drv.h"
+#include "qda_gem.h"
+#include "qda_memory_manager.h"
+#include "qda_memory_dma.h"
+
+static void setup_vma_flags(struct vm_area_struct *vma)
+{
+	vm_flags_set(vma, VM_DONTEXPAND);
+	vm_flags_set(vma, VM_DONTDUMP);
+}
+
+/**
+ * qda_gem_free_object() - Free a GEM object and its associated resources
+ * @gem_obj: DRM GEM object to free
+ */
+void qda_gem_free_object(struct drm_gem_object *gem_obj)
+{
+	struct qda_gem_obj *qda_gem_obj = to_qda_gem_obj(gem_obj);
+	struct qda_dev *qdev = qda_dev_from_drm(gem_obj->dev);
+
+	if (qda_gem_obj->virt && qdev->iommu_mgr)
+		qda_memory_manager_free(qdev->iommu_mgr, qda_gem_obj);
+
+	drm_gem_object_release(gem_obj);
+	kfree(qda_gem_obj);
+}
+
+/**
+ * qda_gem_mmap_obj() - Map a GEM object into userspace
+ * @drm_obj: DRM GEM object to map
+ * @vma: Virtual memory area to map into
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_gem_mmap_obj(struct drm_gem_object *drm_obj, struct vm_area_struct *vma)
+{
+	struct qda_gem_obj *qda_gem_obj = to_qda_gem_obj(drm_obj);
+	int ret;
+
+	/* Reset vm_pgoff for DMA mmap */
+	vma->vm_pgoff = 0;
+
+	ret = qda_dma_mmap(qda_gem_obj, vma);
+	if (ret == 0)
+		setup_vma_flags(vma);
+
+	return ret;
+}
+
+static const struct drm_gem_object_funcs qda_gem_object_funcs = {
+	.free = qda_gem_free_object,
+	.mmap = qda_gem_mmap_obj,
+};
+
+/**
+ * qda_gem_alloc_object() - Allocate a new QDA GEM object
+ * @drm_dev: DRM device
+ * @aligned_size: Size of the object in bytes (must be page-aligned)
+ *
+ * Return: Pointer to the new GEM object, or ERR_PTR on failure
+ */
+struct qda_gem_obj *qda_gem_alloc_object(struct drm_device *drm_dev, size_t aligned_size)
+{
+	struct qda_gem_obj *qda_gem_obj;
+	int ret;
+
+	qda_gem_obj = kzalloc_obj(*qda_gem_obj);
+	if (!qda_gem_obj)
+		return ERR_PTR(-ENOMEM);
+
+	ret = drm_gem_object_init(drm_dev, &qda_gem_obj->base, aligned_size);
+	if (ret) {
+		drm_err(drm_dev, "Failed to initialize GEM object: %d\n", ret);
+		kfree(qda_gem_obj);
+		return ERR_PTR(ret);
+	}
+
+	qda_gem_obj->base.funcs = &qda_gem_object_funcs;
+	qda_gem_obj->size = aligned_size;
+
+	drm_dbg_driver(drm_dev, "Allocated GEM object size=%zu\n", aligned_size);
+	return qda_gem_obj;
+}
+
+void qda_gem_cleanup_object(struct qda_gem_obj *qda_gem_obj)
+{
+	drm_gem_object_release(&qda_gem_obj->base);
+	kfree(qda_gem_obj);
+}
+
+struct drm_gem_object *qda_gem_lookup_object(struct drm_file *file_priv, u32 handle)
+{
+	struct drm_gem_object *gem_obj;
+
+	gem_obj = drm_gem_object_lookup(file_priv, handle);
+	if (!gem_obj)
+		return ERR_PTR(-ENOENT);
+
+	return gem_obj;
+}
+
+int qda_gem_create_handle(struct drm_file *file_priv, struct drm_gem_object *gem_obj, u32 *handle)
+{
+	int ret;
+
+	ret = drm_gem_handle_create(file_priv, gem_obj, handle);
+	drm_gem_object_put(gem_obj);
+
+	return ret;
+}
+
+/**
+ * qda_gem_create_object() - Allocate and initialize a GEM object with DMA backing
+ * @drm_dev: DRM device
+ * @iommu_mgr: Memory manager to use for DMA allocation
+ * @size: Requested size in bytes
+ * @file_priv: DRM file private data for process association
+ *
+ * Return: Pointer to the base DRM GEM object on success, ERR_PTR on failure
+ */
+struct drm_gem_object *qda_gem_create_object(struct drm_device *drm_dev,
+					     struct qda_memory_manager *iommu_mgr, size_t size,
+					     struct drm_file *file_priv)
+{
+	struct qda_gem_obj *qda_gem_obj;
+	size_t aligned_size;
+	int ret;
+
+	if (size == 0) {
+		drm_err(drm_dev, "Invalid size for GEM object creation\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	aligned_size = PAGE_ALIGN(size);
+
+	qda_gem_obj = qda_gem_alloc_object(drm_dev, aligned_size);
+	if (IS_ERR(qda_gem_obj))
+		return ERR_CAST(qda_gem_obj);
+
+	ret = qda_memory_manager_alloc(iommu_mgr, qda_gem_obj, file_priv);
+	if (ret) {
+		drm_err(drm_dev, "Memory manager allocation failed: %d\n", ret);
+		qda_gem_cleanup_object(qda_gem_obj);
+		return ERR_PTR(ret);
+	}
+
+	drm_dbg_driver(drm_dev, "GEM object created successfully size=%zu\n", aligned_size);
+	return &qda_gem_obj->base;
+}
diff --git a/drivers/accel/qda/qda_gem.h b/drivers/accel/qda/qda_gem.h
new file mode 100644
index 000000000000..bb18f8155aa4
--- /dev/null
+++ b/drivers/accel/qda/qda_gem.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#ifndef __QDA_GEM_H__
+#define __QDA_GEM_H__
+
+#include <linux/dma-mapping.h>
+#include <linux/xarray.h>
+#include <drm/drm_device.h>
+#include <drm/drm_gem.h>
+#include "qda_memory_manager.h"
+
+/**
+ * struct qda_gem_obj - QDA GEM buffer object
+ *
+ * Represents a GEM buffer object that can be allocated by the driver
+ * or imported from another driver via DMA-BUF.
+ */
+struct qda_gem_obj {
+	/** @base: DRM GEM object base — must be first member */
+	struct drm_gem_object base;
+	/** @iommu_dev: IOMMU context bank device that performed the allocation */
+	struct qda_iommu_device *iommu_dev;
+	/** @virt: Kernel virtual address of the allocated DMA memory */
+	void *virt;
+	/** @dma_addr: DMA address (with SID encoded in upper 32 bits) */
+	dma_addr_t dma_addr;
+	/** @size: Size of the buffer in bytes */
+	size_t size;
+};
+
+/**
+ * to_qda_gem_obj - Cast a drm_gem_object pointer to qda_gem_obj
+ * @gem_obj: Pointer to the embedded drm_gem_object
+ */
+#define to_qda_gem_obj(gem_obj) container_of(gem_obj, struct qda_gem_obj, base)
+
+/* GEM object lifecycle */
+struct drm_gem_object *qda_gem_create_object(struct drm_device *drm_dev,
+					     struct qda_memory_manager *iommu_mgr,
+					     size_t size, struct drm_file *file_priv);
+void qda_gem_free_object(struct drm_gem_object *gem_obj);
+int qda_gem_mmap_obj(struct drm_gem_object *gem_obj, struct vm_area_struct *vma);
+
+/* Internal helpers (also used by PRIME import) */
+struct qda_gem_obj *qda_gem_alloc_object(struct drm_device *drm_dev, size_t aligned_size);
+void qda_gem_cleanup_object(struct qda_gem_obj *qda_gem_obj);
+
+/* Utility functions */
+struct drm_gem_object *qda_gem_lookup_object(struct drm_file *file_priv, u32 handle);
+int qda_gem_create_handle(struct drm_file *file_priv, struct drm_gem_object *gem_obj, u32 *handle);
+
+#endif /* __QDA_GEM_H__ */
diff --git a/drivers/accel/qda/qda_memory_dma.c b/drivers/accel/qda/qda_memory_dma.c
new file mode 100644
index 000000000000..97488c755d2d
--- /dev/null
+++ b/drivers/accel/qda/qda_memory_dma.c
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <linux/slab.h>
+#include <linux/dma-mapping.h>
+#include "qda_drv.h"
+#include "qda_gem.h"
+#include "qda_memory_dma.h"
+
+static dma_addr_t get_actual_dma_addr(struct qda_gem_obj *gem_obj)
+{
+	return gem_obj->dma_addr - ((u64)gem_obj->iommu_dev->sid << 32);
+}
+
+static void setup_gem_object(struct qda_gem_obj *gem_obj, void *virt,
+			     dma_addr_t dma_addr, struct qda_iommu_device *iommu_dev)
+{
+	gem_obj->virt = virt;
+	gem_obj->dma_addr = dma_addr;
+	gem_obj->iommu_dev = iommu_dev;
+}
+
+static void cleanup_gem_object_fields(struct qda_gem_obj *gem_obj)
+{
+	gem_obj->virt = NULL;
+	gem_obj->dma_addr = 0;
+	gem_obj->iommu_dev = NULL;
+}
+
+/**
+ * qda_dma_alloc() - Allocate DMA coherent memory for a GEM object
+ * @iommu_dev: Pointer to the QDA IOMMU device structure
+ * @gem_obj: Pointer to GEM object to allocate memory for
+ * @size: Size of memory to allocate in bytes
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_dma_alloc(struct qda_iommu_device *iommu_dev,
+		  struct qda_gem_obj *gem_obj, size_t size)
+{
+	void *virt;
+	dma_addr_t dma_addr;
+
+	if (!iommu_dev || !iommu_dev->dev) {
+		pr_err("qda: Invalid iommu_dev or device for DMA allocation\n");
+		return -EINVAL;
+	}
+
+	virt = dma_alloc_coherent(iommu_dev->dev, size, &dma_addr, GFP_KERNEL);
+	if (!virt)
+		return -ENOMEM;
+
+	dma_addr += ((u64)iommu_dev->sid << 32);
+
+	dev_dbg(iommu_dev->dev, "DMA address with SID prefix: 0x%llx (sid=%u)\n",
+		(u64)dma_addr, iommu_dev->sid);
+
+	setup_gem_object(gem_obj, virt, dma_addr, iommu_dev);
+
+	return 0;
+}
+
+/**
+ * qda_dma_free() - Free DMA coherent memory for a GEM object
+ * @gem_obj: Pointer to GEM object to free memory for
+ */
+void qda_dma_free(struct qda_gem_obj *gem_obj)
+{
+	if (!gem_obj || !gem_obj->iommu_dev) {
+		pr_debug("qda: Invalid gem_obj or iommu_dev for DMA free\n");
+		return;
+	}
+
+	dev_dbg(gem_obj->iommu_dev->dev, "DMA freeing: size=%zu, device_id=%u, dma_addr=0x%llx\n",
+		gem_obj->size, gem_obj->iommu_dev->id, gem_obj->dma_addr);
+
+	dma_free_coherent(gem_obj->iommu_dev->dev, gem_obj->size,
+			  gem_obj->virt, get_actual_dma_addr(gem_obj));
+
+	cleanup_gem_object_fields(gem_obj);
+}
+
+/**
+ * qda_dma_mmap() - Map DMA memory into userspace
+ * @gem_obj: Pointer to GEM object containing DMA memory
+ * @vma: Virtual memory area to map into
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_dma_mmap(struct qda_gem_obj *gem_obj, struct vm_area_struct *vma)
+{
+	struct qda_iommu_device *iommu_dev;
+	int ret;
+
+	if (!gem_obj || !gem_obj->virt || !gem_obj->iommu_dev || !gem_obj->iommu_dev->dev) {
+		pr_err("qda: Invalid parameters for DMA mmap\n");
+		return -EINVAL;
+	}
+
+	iommu_dev = gem_obj->iommu_dev;
+
+	ret = dma_mmap_coherent(iommu_dev->dev, vma, gem_obj->virt,
+				get_actual_dma_addr(gem_obj), gem_obj->size);
+	if (ret) {
+		dev_err(iommu_dev->dev, "DMA mmap failed: size=%zu, device_id=%u, ret=%d\n",
+			gem_obj->size, iommu_dev->id, ret);
+		return ret;
+	}
+
+	return 0;
+}
diff --git a/drivers/accel/qda/qda_memory_dma.h b/drivers/accel/qda/qda_memory_dma.h
new file mode 100644
index 000000000000..99352a99dc33
--- /dev/null
+++ b/drivers/accel/qda/qda_memory_dma.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_MEMORY_DMA_H__
+#define __QDA_MEMORY_DMA_H__
+
+#include <linux/dma-mapping.h>
+#include "qda_memory_manager.h"
+
+int qda_dma_alloc(struct qda_iommu_device *iommu_dev,
+		  struct qda_gem_obj *gem_obj, size_t size);
+void qda_dma_free(struct qda_gem_obj *gem_obj);
+int qda_dma_mmap(struct qda_gem_obj *gem_obj, struct vm_area_struct *vma);
+
+#endif /* __QDA_MEMORY_DMA_H__ */
diff --git a/drivers/accel/qda/qda_memory_manager.c b/drivers/accel/qda/qda_memory_manager.c
index 00a9c0ae4224..82111275f420 100644
--- a/drivers/accel/qda/qda_memory_manager.c
+++ b/drivers/accel/qda/qda_memory_manager.c
@@ -6,8 +6,11 @@
 #include <linux/spinlock.h>
 #include <linux/xarray.h>
 #include <drm/drm_file.h>
+#include <drm/drm_print.h>
 #include "qda_drv.h"
+#include "qda_gem.h"
 #include "qda_memory_manager.h"
+#include "qda_memory_dma.h"
 
 static void cleanup_all_memory_devices(struct qda_memory_manager *mem_mgr)
 {
@@ -28,6 +31,14 @@ static void cleanup_all_memory_devices(struct qda_memory_manager *mem_mgr)
 	pr_debug("qda: Completed cleanup of all memory devices\n");
 }
 
+static void init_iommu_device_fields(struct qda_iommu_device *iommu_dev)
+{
+	spin_lock_init(&iommu_dev->lock);
+	refcount_set(&iommu_dev->refcount, 0);
+	iommu_dev->assigned_pid = 0;
+	iommu_dev->assigned_file_priv = NULL;
+}
+
 static int allocate_device_id(struct qda_memory_manager *mem_mgr,
 			      struct qda_iommu_device *iommu_dev, u32 *id)
 {
@@ -44,6 +55,216 @@ static int allocate_device_id(struct qda_memory_manager *mem_mgr,
 	return 0;
 }
 
+static struct qda_iommu_device *find_device_for_pid(struct qda_memory_manager *mem_mgr,
+						    pid_t pid)
+{
+	unsigned long index;
+	void *entry;
+	struct qda_iommu_device *found_dev = NULL;
+	unsigned long flags;
+
+	xa_lock_irqsave(&mem_mgr->device_xa, flags);
+	xa_for_each(&mem_mgr->device_xa, index, entry) {
+		struct qda_iommu_device *iommu_dev = entry;
+
+		spin_lock(&iommu_dev->lock);
+		if (iommu_dev->assigned_pid == pid) {
+			found_dev = iommu_dev;
+			refcount_inc(&found_dev->refcount);
+			dev_dbg(found_dev->dev, "Reusing device id=%u for PID=%d (refcount=%u)\n",
+				found_dev->id, pid, refcount_read(&found_dev->refcount));
+			spin_unlock(&iommu_dev->lock);
+			break;
+		}
+		spin_unlock(&iommu_dev->lock);
+	}
+	xa_unlock_irqrestore(&mem_mgr->device_xa, flags);
+
+	return found_dev;
+}
+
+static struct qda_iommu_device *assign_available_device_to_pid(struct qda_memory_manager *mem_mgr,
+							       pid_t pid,
+							       struct drm_file *file_priv)
+{
+	unsigned long index;
+	void *entry;
+	struct qda_iommu_device *selected_dev = NULL;
+	unsigned long flags;
+
+	xa_lock_irqsave(&mem_mgr->device_xa, flags);
+	xa_for_each(&mem_mgr->device_xa, index, entry) {
+		struct qda_iommu_device *iommu_dev = entry;
+
+		spin_lock(&iommu_dev->lock);
+		if (iommu_dev->assigned_pid == 0) {
+			iommu_dev->assigned_pid = pid;
+			iommu_dev->assigned_file_priv = file_priv;
+			selected_dev = iommu_dev;
+			refcount_set(&selected_dev->refcount, 1);
+			dev_dbg(selected_dev->dev, "Assigned device id=%u to PID=%d\n",
+				selected_dev->id, pid);
+			spin_unlock(&iommu_dev->lock);
+			break;
+		}
+		spin_unlock(&iommu_dev->lock);
+	}
+	xa_unlock_irqrestore(&mem_mgr->device_xa, flags);
+
+	return selected_dev;
+}
+
+static struct qda_iommu_device *get_process_iommu_device(struct qda_memory_manager *mem_mgr,
+							 struct drm_file *file_priv)
+{
+	struct qda_file_priv *qda_priv;
+
+	if (!file_priv || !file_priv->driver_priv)
+		return NULL;
+
+	qda_priv = (struct qda_file_priv *)file_priv->driver_priv;
+	return qda_priv->assigned_iommu_dev;
+}
+
+/**
+ * qda_memory_manager_assign_device() - Assign an IOMMU device to a process
+ * @mem_mgr: Pointer to memory manager
+ * @file_priv: DRM file private data for process association
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_memory_manager_assign_device(struct qda_memory_manager *mem_mgr,
+				     struct drm_file *file_priv)
+{
+	struct qda_file_priv *qda_priv;
+	struct qda_iommu_device *selected_dev = NULL;
+	int ret = 0;
+	pid_t current_pid;
+
+	if (!file_priv || !file_priv->driver_priv) {
+		pr_err("qda: Invalid file_priv or driver_priv\n");
+		return -EINVAL;
+	}
+
+	qda_priv = (struct qda_file_priv *)file_priv->driver_priv;
+	current_pid = qda_priv->pid;
+
+	mutex_lock(&mem_mgr->process_assignment_lock);
+
+	if (qda_priv->assigned_iommu_dev) {
+		dev_dbg(qda_priv->assigned_iommu_dev->dev,
+			"PID=%d already has device id=%u assigned\n",
+			current_pid, qda_priv->assigned_iommu_dev->id);
+		ret = 0;
+		goto unlock_and_return;
+	}
+
+	selected_dev = find_device_for_pid(mem_mgr, current_pid);
+
+	if (selected_dev) {
+		qda_priv->assigned_iommu_dev = selected_dev;
+		goto unlock_and_return;
+	}
+
+	selected_dev = assign_available_device_to_pid(mem_mgr, current_pid, file_priv);
+
+	if (!selected_dev) {
+		pr_err("qda: No available device for PID=%d\n", current_pid);
+		ret = -ENOMEM;
+		goto unlock_and_return;
+	}
+
+	qda_priv->assigned_iommu_dev = selected_dev;
+
+unlock_and_return:
+	mutex_unlock(&mem_mgr->process_assignment_lock);
+	return ret;
+}
+
+static struct qda_iommu_device *get_or_assign_iommu_device(struct qda_memory_manager *mem_mgr,
+							   struct drm_file *file_priv)
+{
+	struct qda_iommu_device *iommu_dev;
+	int ret;
+
+	iommu_dev = get_process_iommu_device(mem_mgr, file_priv);
+	if (iommu_dev)
+		return iommu_dev;
+
+	ret = qda_memory_manager_assign_device(mem_mgr, file_priv);
+	if (ret)
+		return NULL;
+
+	iommu_dev = get_process_iommu_device(mem_mgr, file_priv);
+	if (iommu_dev)
+		return iommu_dev;
+
+	return NULL;
+}
+
+/**
+ * qda_memory_manager_alloc() - Allocate memory for a GEM object
+ * @mem_mgr: Pointer to memory manager
+ * @gem_obj: Pointer to GEM object to allocate memory for
+ * @file_priv: DRM file private data for process association
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_memory_manager_alloc(struct qda_memory_manager *mem_mgr, struct qda_gem_obj *gem_obj,
+			     struct drm_file *file_priv)
+{
+	struct qda_iommu_device *selected_dev;
+	size_t size;
+	int ret;
+
+	if (!mem_mgr || !gem_obj || !file_priv) {
+		pr_err("qda: Invalid parameters for memory allocation\n");
+		return -EINVAL;
+	}
+
+	size = gem_obj->size;
+	if (size == 0) {
+		drm_err(gem_obj->base.dev, "Invalid allocation size: 0\n");
+		return -EINVAL;
+	}
+
+	selected_dev = get_or_assign_iommu_device(mem_mgr, file_priv);
+
+	if (!selected_dev) {
+		drm_err(gem_obj->base.dev,
+			"Failed to get/assign device for allocation (size=%zu)\n",
+			size);
+		return -ENOMEM;
+	}
+
+	ret = qda_dma_alloc(selected_dev, gem_obj, size);
+	if (ret) {
+		drm_err(gem_obj->base.dev, "Allocation failed: size=%zu, device_id=%u, ret=%d\n",
+			size, selected_dev->id, ret);
+		return ret;
+	}
+
+	drm_dbg_driver(gem_obj->base.dev,
+		       "Successfully allocated: size=%zu, device_id=%u, dma_addr=0x%llx\n",
+		       size, selected_dev->id, gem_obj->dma_addr);
+	return 0;
+}
+
+/**
+ * qda_memory_manager_free() - Free memory for a GEM object
+ * @mem_mgr: Pointer to memory manager
+ * @gem_obj: Pointer to GEM object to free memory for
+ */
+void qda_memory_manager_free(struct qda_memory_manager *mem_mgr, struct qda_gem_obj *gem_obj)
+{
+	if (!gem_obj || !gem_obj->iommu_dev) {
+		pr_debug("qda: Invalid gem_obj or iommu_dev for free\n");
+		return;
+	}
+
+	qda_dma_free(gem_obj);
+}
+
 /**
  * qda_memory_manager_register_device() - Register an IOMMU device
  * @mem_mgr: Pointer to memory manager
@@ -57,6 +278,8 @@ int qda_memory_manager_register_device(struct qda_memory_manager *mem_mgr,
 	int ret;
 	u32 id;
 
+	init_iommu_device_fields(iommu_dev);
+
 	ret = allocate_device_id(mem_mgr, iommu_dev, &id);
 	if (ret) {
 		dev_err(iommu_dev->dev,
@@ -95,6 +318,7 @@ int qda_memory_manager_init(struct qda_memory_manager *mem_mgr)
 	pr_debug("qda: Initializing memory manager\n");
 
 	xa_init_flags(&mem_mgr->device_xa, XA_FLAGS_ALLOC);
+	mutex_init(&mem_mgr->process_assignment_lock);
 
 	pr_debug("qda: Memory manager initialized successfully\n");
 	return 0;
diff --git a/drivers/accel/qda/qda_memory_manager.h b/drivers/accel/qda/qda_memory_manager.h
index 0243f9c0c5aa..252459bc10d0 100644
--- a/drivers/accel/qda/qda_memory_manager.h
+++ b/drivers/accel/qda/qda_memory_manager.h
@@ -7,8 +7,15 @@
 #define __QDA_MEMORY_MANAGER_H__
 
 #include <linux/device.h>
+#include <linux/mutex.h>
+#include <linux/refcount.h>
+#include <linux/spinlock.h>
 #include <linux/xarray.h>
-#include "qda_drv.h"
+#include <drm/drm_file.h>
+
+/* Forward declarations */
+struct qda_dev;
+struct qda_gem_obj;
 
 /**
  * struct qda_iommu_device - IOMMU device instance for memory management
@@ -21,10 +28,18 @@ struct qda_iommu_device {
 	struct device *dev;
 	/** @qdev: Back-pointer to the parent QDA device */
 	struct qda_dev *qdev;
+	/** @assigned_file_priv: DRM file private data for the assigned process */
+	struct drm_file *assigned_file_priv;
 	/** @id: Unique identifier assigned by the memory manager XArray */
 	u32 id;
 	/** @sid: Stream ID for IOMMU transactions */
 	u32 sid;
+	/** @assigned_pid: Process ID of the process assigned to this device */
+	pid_t assigned_pid;
+	/** @refcount: Reference counter for device */
+	refcount_t refcount;
+	/** @lock: Spinlock protecting concurrent access to device */
+	spinlock_t lock;
 };
 
 /**
@@ -36,6 +51,8 @@ struct qda_iommu_device {
 struct qda_memory_manager {
 	/** @device_xa: XArray storing all registered IOMMU devices */
 	struct xarray device_xa;
+	/** @process_assignment_lock: Mutex protecting process-to-device assignments */
+	struct mutex process_assignment_lock;
 };
 
 int qda_memory_manager_init(struct qda_memory_manager *mem_mgr);
@@ -46,4 +63,13 @@ int qda_memory_manager_register_device(struct qda_memory_manager *mem_mgr,
 void qda_memory_manager_unregister_device(struct qda_memory_manager *mem_mgr,
 					  struct qda_iommu_device *iommu_dev);
 
+int qda_memory_manager_assign_device(struct qda_memory_manager *mem_mgr,
+				     struct drm_file *file_priv);
+
+int qda_memory_manager_alloc(struct qda_memory_manager *mem_mgr,
+			     struct qda_gem_obj *gem_obj,
+			     struct drm_file *file_priv);
+void qda_memory_manager_free(struct qda_memory_manager *mem_mgr,
+			     struct qda_gem_obj *gem_obj);
+
 #endif /* __QDA_MEMORY_MANAGER_H__ */

-- 
2.34.1



