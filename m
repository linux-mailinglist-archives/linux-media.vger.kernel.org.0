Return-Path: <linux-media+bounces-62092-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sN1XGsMBDGp0TgUAu9opvQ
	(envelope-from <linux-media+bounces-62092-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 08:22:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E5F577FC2
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 08:22:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E120A30488FC
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 06:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F7B3A719B;
	Tue, 19 May 2026 06:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q5Z5NDja"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A7A39656C;
	Tue, 19 May 2026 06:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171356; cv=none; b=CLgpAtlOOY4YafK/xNnyj9ShmlyCJu/6jxBH2v4zydxxOdXOmCoRhDlRx0idbc9X6/WS2N+9JaR1dN/uXjED0WPXpq1SAMIZyLuLBbe/AvCQtdDFCQsDjPXsshJMYTqye5IjCf7AZmr1ME5BNMJR7RR0MqEfLl0VsC5iIzGwk7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171356; c=relaxed/simple;
	bh=+zwXvRnXnC4buC/MbFCxrCpPkMO9kMwMf6TaSJ73HBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bG6Dn9y2O9H/VzS1FxDvhPZHtugmxHpRCnOF7cIdoed9hLPjjjKewjU7Nwwr3icHJ+vaxJ2Gj4Kgt3jOc34znmiuqcIQHNBg6k9Gq+C5/auOC3wM0Ltx5Lr4k53E5Juya3EVwNm/XesRgJmdp+3YmJq0Z+mPqitDbtOrWHoG02s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q5Z5NDja; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1BA3DC2BCF7;
	Tue, 19 May 2026 06:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779171356;
	bh=+zwXvRnXnC4buC/MbFCxrCpPkMO9kMwMf6TaSJ73HBQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Q5Z5NDja78nlIDiuOLNi2aNga3kW5/vmJ0FjKY+sQnGYk1iaejNU/njGhhBQvlyYq
	 OdhT4I495R4Hn0O41LgS4nVEF58kZlJOLdOUZBlJy/l8e3CPRTp74+AXAgBPy+BnOC
	 Bby0+LvR2AiSBAKn7QacHLSZ+ITYWbNO4VO7LNMR+hZEJikuBgNZehB0a+2lYGCFc7
	 Q231bWPhSZKFzR0T9gFZ1VCCkjomu7PWZw3wHkSkX+pLZSxnoJBTphRyBO61yMstNT
	 zTO9mac28h4/GAfgflPlyUyHelzFpSJ8iro4qE6x97AkeN+EzPZEUFxgq46F79GdKA
	 hmi3hs0rjzoDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A8D1CD4F3C;
	Tue, 19 May 2026 06:15:56 +0000 (UTC)
From: Ekansh Gupta via B4 Relay <devnull+ekansh.gupta.oss.qualcomm.com@kernel.org>
Date: Tue, 19 May 2026 11:46:02 +0530
Subject: [PATCH 12/15] accel/qda: Add FastRPC invocation support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260519-qda-series-v1-12-b2d984c297f8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779171352; l=43560;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=grtYJYkSUVcBd0zVpCaeg+aFiyPm1YVcTgCFXfjye3s=;
 b=eLgKLREMUlJjxGig/x7FxGaB76h+f7DAqtek4Ym2ZtYgqiWULrv184kqBrkRfUMqbUA/DuoIT
 Qxd9ndLj8E1ARLFBM1x3b7+GwrS2UJk4owvDDCQAKqS12OGVns9Oynu
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62092-lists,linux-media=lfdr.de,ekansh.gupta.oss.qualcomm.com];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[ekansh.gupta@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:replyto,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 94E5F577FC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Implement the FastRPC remote procedure call path, allowing user-space
to invoke methods on the DSP via DRM_IOCTL_QDA_REMOTE_INVOKE.

qda_fastrpc.c / qda_fastrpc.h
  Implements the FastRPC protocol layer: argument marshalling
  (qda_fastrpc_invoke_pack), response unmarshalling
  (qda_fastrpc_invoke_unpack), and invocation context lifecycle
  management. Each invocation allocates a fastrpc_invoke_context
  which tracks buffer descriptors, GEM objects, and the completion
  used to synchronise with the DSP response.

  Buffer arguments are handled in three ways:
  - DMA-BUF fd: imported via PRIME, IOMMU-mapped dma_addr used
  - Direct (inline): copied into the GEM-backed message buffer
  - DMA handle: fd forwarded to DSP, physical page descriptor computed

qda_rpmsg.c
  Implements qda_rpmsg_send_msg() which sends the wire-format
  fastrpc_msg (embedded as the first member of qda_msg) directly
  via rpmsg_send(), and qda_rpmsg_wait_for_rsp() which blocks on
  the context completion. The RPMsg callback dispatches responses
  to waiting contexts via the ctx_xa XArray.

qda_ioctl.c
  qda_ioctl_invoke() drives the full invocation lifecycle:
  allocate context → assign XArray ID → prepare args → allocate
  GEM message buffer → pack → send → wait → unpack → free.

qda_drv.h / qda_drv.c
  qda_dev gains ctx_xa (XArray for in-flight context lookup) and
  remote_session_id_counter (atomic counter for session IDs).
  qda_file_priv gains remote_session_id for per-session tracking.

include/uapi/drm/qda_accel.h
  Adds DRM_IOCTL_QDA_REMOTE_INVOKE (command 0x07; command numbers
  0x03–0x06 are reserved) and the associated drm_qda_invoke_args
  and drm_qda_fastrpc_invoke_args structures.

Assisted-by: Claude:claude-4-6-sonnet
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/Makefile      |   1 +
 drivers/accel/qda/qda_drv.c     |  17 ++
 drivers/accel/qda/qda_drv.h     |   8 +
 drivers/accel/qda/qda_fastrpc.c | 597 ++++++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_fastrpc.h | 271 ++++++++++++++++++
 drivers/accel/qda/qda_ioctl.c   | 104 +++++++
 drivers/accel/qda/qda_ioctl.h   |   1 +
 drivers/accel/qda/qda_rpmsg.c   | 136 ++++++++-
 drivers/accel/qda/qda_rpmsg.h   |  17 ++
 include/uapi/drm/qda_accel.h    |  39 +++
 10 files changed, 1189 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
index fb092e56d7f3..2d10420cd1ec 100644
--- a/drivers/accel/qda/Makefile
+++ b/drivers/accel/qda/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
 qda-y := \
 	qda_cb.o \
 	qda_drv.o \
+	qda_fastrpc.o \
 	qda_gem.o \
 	qda_ioctl.o \
 	qda_memory_dma.o \
diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index ef8bd573b836..704c7d3127d2 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -26,6 +26,8 @@ static int qda_open(struct drm_device *dev, struct drm_file *file)
 
 	qda_file_priv->pid = current->pid;
 	qda_file_priv->qda_dev = qda_dev_from_drm(dev);
+	qda_file_priv->remote_session_id =
+		atomic_inc_return(&qda_file_priv->qda_dev->remote_session_id_counter);
 	file->driver_priv = qda_file_priv;
 
 	return 0;
@@ -57,6 +59,7 @@ static const struct drm_ioctl_desc qda_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(QDA_QUERY, qda_ioctl_query, 0),
 	DRM_IOCTL_DEF_DRV(QDA_GEM_CREATE, qda_ioctl_gem_create, 0),
 	DRM_IOCTL_DEF_DRV(QDA_GEM_MMAP_OFFSET, qda_ioctl_gem_mmap_offset, 0),
+	DRM_IOCTL_DEF_DRV(QDA_REMOTE_INVOKE, qda_ioctl_invoke, 0),
 };
 
 static const struct drm_driver qda_drm_driver = {
@@ -93,6 +96,17 @@ static void cleanup_memory_manager(struct qda_dev *qdev)
 	}
 }
 
+static void cleanup_device_resources(struct qda_dev *qdev)
+{
+	xa_destroy(&qdev->ctx_xa);
+}
+
+static void init_device_resources(struct qda_dev *qdev)
+{
+	atomic_set(&qdev->remote_session_id_counter, 0);
+	xa_init_flags(&qdev->ctx_xa, XA_FLAGS_ALLOC1);
+}
+
 static int init_memory_manager(struct qda_dev *qdev)
 {
 	qdev->iommu_mgr = kzalloc_obj(*qdev->iommu_mgr);
@@ -106,6 +120,7 @@ void qda_deinit_device(struct qda_dev *qdev)
 {
 	mutex_destroy(&qdev->import_lock);
 	cleanup_memory_manager(qdev);
+	cleanup_device_resources(qdev);
 }
 
 int qda_init_device(struct qda_dev *qdev)
@@ -114,10 +129,12 @@ int qda_init_device(struct qda_dev *qdev)
 
 	mutex_init(&qdev->import_lock);
 	qdev->current_import_file_priv = NULL;
+	init_device_resources(qdev);
 
 	ret = init_memory_manager(qdev);
 	if (ret) {
 		drm_err(&qdev->drm_dev, "Failed to initialize memory manager: %d\n", ret);
+		cleanup_device_resources(qdev);
 		mutex_destroy(&qdev->import_lock);
 	}
 
diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
index 96ce4135e2d9..420cccff42bf 100644
--- a/drivers/accel/qda/qda_drv.h
+++ b/drivers/accel/qda/qda_drv.h
@@ -6,10 +6,12 @@
 #ifndef __QDA_DRV_H__
 #define __QDA_DRV_H__
 
+#include <linux/atomic.h>
 #include <linux/device.h>
 #include <linux/list.h>
 #include <linux/rpmsg.h>
 #include <linux/types.h>
+#include <linux/xarray.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
@@ -28,6 +30,8 @@ struct qda_file_priv {
 	struct qda_iommu_device *assigned_iommu_dev;
 	/** @pid: Process ID for tracking */
 	pid_t pid;
+	/** @remote_session_id: Unique session identifier */
+	u32 remote_session_id;
 };
 
 /**
@@ -51,8 +55,12 @@ struct qda_dev {
 	struct mutex import_lock;
 	/** @current_import_file_priv: Current file_priv during prime import */
 	struct drm_file *current_import_file_priv;
+	/** @ctx_xa: XArray for FastRPC context management */
+	struct xarray ctx_xa;
 	/** @dsp_name: Name of the DSP domain (e.g. "cdsp", "adsp") */
 	const char *dsp_name;
+	/** @remote_session_id_counter: Atomic counter for unique session IDs */
+	atomic_t remote_session_id_counter;
 };
 
 /**
diff --git a/drivers/accel/qda/qda_fastrpc.c b/drivers/accel/qda/qda_fastrpc.c
new file mode 100644
index 000000000000..0ec37175a098
--- /dev/null
+++ b/drivers/accel/qda/qda_fastrpc.c
@@ -0,0 +1,597 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+#include <linux/sort.h>
+#include <linux/completion.h>
+#include <linux/dma-buf.h>
+#include <drm/drm_gem.h>
+#include "qda_fastrpc.h"
+#include "qda_drv.h"
+#include "qda_gem.h"
+#include "qda_memory_manager.h"
+#include "qda_prime.h"
+
+/**
+ * get_gem_obj_from_dmabuf_fd() - Import a DMA-BUF fd and return the GEM object
+ * @ctx:       FastRPC invocation context
+ * @dmabuf_fd: DMA-BUF file descriptor supplied by user space
+ * @gem_obj:   Output GEM object (caller must call drm_gem_object_put() when done)
+ *
+ * Imports the DMA-BUF fd into the QDA device via qda_prime_fd_to_handle()
+ * (which performs IOMMU device assignment for newly imported buffers) and
+ * then looks up the resulting GEM object.  The caller is responsible for
+ * calling drm_gem_object_put() on the returned object.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int get_gem_obj_from_dmabuf_fd(struct fastrpc_invoke_context *ctx,
+				      int dmabuf_fd,
+				      struct drm_gem_object **gem_obj)
+{
+	struct drm_device *dev = ctx->file_priv->minor->dev;
+	u32 handle;
+	int ret;
+
+	ret = qda_prime_fd_to_handle(dev, ctx->file_priv, dmabuf_fd, &handle);
+	if (ret)
+		return ret;
+
+	*gem_obj = drm_gem_object_lookup(ctx->file_priv, handle);
+	if (!*gem_obj)
+		return -ENOENT;
+
+	return 0;
+}
+
+static void setup_pages_from_gem_obj(struct qda_gem_obj *qda_gem_obj,
+				     struct fastrpc_phy_page *pages)
+{
+	pages->addr = qda_gem_obj->dma_addr;
+	pages->size = qda_gem_obj->size;
+}
+
+static u64 calculate_vma_offset(u64 user_ptr)
+{
+	struct vm_area_struct *vma;
+	u64 user_ptr_page_mask = user_ptr & PAGE_MASK;
+	u64 vma_offset = 0;
+
+	mmap_read_lock(current->mm);
+	vma = find_vma(current->mm, user_ptr);
+	if (vma)
+		vma_offset = user_ptr_page_mask - vma->vm_start;
+	mmap_read_unlock(current->mm);
+
+	return vma_offset;
+}
+
+static u64 calculate_page_aligned_size(u64 ptr, u64 len)
+{
+	u64 pg_start = (ptr & PAGE_MASK) >> PAGE_SHIFT;
+	u64 pg_end = ((ptr + len - 1) & PAGE_MASK) >> PAGE_SHIFT;
+	u64 aligned_size = (pg_end - pg_start + 1) * PAGE_SIZE;
+
+	return aligned_size;
+}
+
+static struct fastrpc_invoke_buf *fastrpc_invoke_buf_start(union fastrpc_remote_arg *pra, int len)
+{
+	return (struct fastrpc_invoke_buf *)(&pra[len]);
+}
+
+static struct fastrpc_phy_page *fastrpc_phy_page_start(struct fastrpc_invoke_buf *buf, int len)
+{
+	return (struct fastrpc_phy_page *)(&buf[len]);
+}
+
+static int fastrpc_get_meta_size(struct fastrpc_invoke_context *ctx)
+{
+	int size = 0;
+
+	size = (sizeof(struct fastrpc_remote_buf) +
+		sizeof(struct fastrpc_invoke_buf) +
+		sizeof(struct fastrpc_phy_page)) * ctx->nscalars +
+		sizeof(u64) * FASTRPC_MAX_FDLIST +
+		sizeof(u32) * FASTRPC_MAX_CRCLIST;
+
+	return size;
+}
+
+static u64 fastrpc_get_payload_size(struct fastrpc_invoke_context *ctx, int metalen)
+{
+	u64 size = 0;
+	int oix;
+
+	size = ALIGN(metalen, FASTRPC_ALIGN);
+
+	for (oix = 0; oix < ctx->nbufs; oix++) {
+		int i = ctx->olaps[oix].raix;
+
+		if (ctx->args[i].fd == 0 || ctx->args[i].fd == -1) {
+			if (ctx->olaps[oix].offset == 0)
+				size = ALIGN(size, FASTRPC_ALIGN);
+
+			size += (ctx->olaps[oix].mend - ctx->olaps[oix].mstart);
+		}
+	}
+
+	return size;
+}
+
+/**
+ * qda_fastrpc_context_free() - Free an invocation context
+ * @ref: Reference counter embedded in the context
+ *
+ * Called when the reference count reaches zero; releases all resources
+ * associated with the invocation context.
+ */
+void qda_fastrpc_context_free(struct kref *ref)
+{
+	struct fastrpc_invoke_context *ctx;
+	int i;
+
+	ctx = container_of(ref, struct fastrpc_invoke_context, refcount);
+	if (ctx->gem_objs) {
+		for (i = 0; i < ctx->nscalars; ++i) {
+			if (ctx->gem_objs[i])
+				drm_gem_object_put(ctx->gem_objs[i]);
+		}
+		kfree(ctx->gem_objs);
+	}
+
+	if (ctx->msg_gem_obj)
+		drm_gem_object_put(&ctx->msg_gem_obj->base);
+
+	kfree(ctx->olaps);
+
+	kfree(ctx->args);
+	kfree(ctx->req);
+	kfree(ctx->rsp);
+	kfree(ctx->input_pages);
+	kfree(ctx->inbuf);
+
+	kfree(ctx);
+}
+
+#define CMP(aa, bb) ((aa) == (bb) ? 0 : (aa) < (bb) ? -1 : 1)
+
+static int olaps_cmp(const void *a, const void *b)
+{
+	struct fastrpc_buf_overlap *pa = (struct fastrpc_buf_overlap *)a;
+	struct fastrpc_buf_overlap *pb = (struct fastrpc_buf_overlap *)b;
+	/* sort with lowest starting buffer first */
+	int st = CMP(pa->start, pb->start);
+	/* sort with highest ending buffer first */
+	int ed = CMP(pb->end, pa->end);
+
+	return st == 0 ? ed : st;
+}
+
+static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_context *ctx)
+{
+	u64 max_end = 0;
+	int i;
+
+	for (i = 0; i < ctx->nbufs; ++i) {
+		ctx->olaps[i].start = ctx->args[i].ptr;
+		ctx->olaps[i].end = ctx->olaps[i].start + ctx->args[i].length;
+		ctx->olaps[i].raix = i;
+	}
+
+	sort(ctx->olaps, ctx->nbufs, sizeof(*ctx->olaps), olaps_cmp, NULL);
+
+	for (i = 0; i < ctx->nbufs; ++i) {
+		if (ctx->olaps[i].start < max_end) {
+			ctx->olaps[i].mstart = max_end;
+			ctx->olaps[i].mend = ctx->olaps[i].end;
+			ctx->olaps[i].offset = max_end - ctx->olaps[i].start;
+
+			if (ctx->olaps[i].end > max_end) {
+				max_end = ctx->olaps[i].end;
+			} else {
+				ctx->olaps[i].mend = 0;
+				ctx->olaps[i].mstart = 0;
+			}
+		} else {
+			ctx->olaps[i].mend = ctx->olaps[i].end;
+			ctx->olaps[i].mstart = ctx->olaps[i].start;
+			ctx->olaps[i].offset = 0;
+			max_end = ctx->olaps[i].end;
+		}
+	}
+}
+
+/**
+ * qda_fastrpc_context_alloc() - Allocate a new FastRPC invocation context
+ *
+ * Return: Pointer to allocated context, or ERR_PTR on failure
+ */
+struct fastrpc_invoke_context *qda_fastrpc_context_alloc(void)
+{
+	struct fastrpc_invoke_context *ctx = NULL;
+
+	ctx = kzalloc_obj(*ctx);
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&ctx->node);
+
+	ctx->retval = -1;
+	ctx->pid = current->pid;
+	init_completion(&ctx->work);
+	ctx->msg_gem_obj = NULL;
+	kref_init(&ctx->refcount);
+
+	return ctx;
+}
+
+/*
+ * process_fd_buffer() - Handle an in/out buffer argument backed by a DMA-BUF fd
+ *
+ * args[i].fd is a DMA-BUF fd.  We import it to obtain the GEM object and its
+ * IOMMU-mapped dma_addr for the physical page descriptor.  The DSP uses the
+ * physical address directly for this buffer type; the fd is not forwarded.
+ */
+static int process_fd_buffer(struct fastrpc_invoke_context *ctx, int i,
+			     union fastrpc_remote_arg *rpra, struct fastrpc_phy_page *pages)
+{
+	struct drm_gem_object *gem_obj;
+	struct qda_gem_obj *qda_gem_obj;
+	int err;
+	u64 len = ctx->args[i].length;
+	u64 vma_offset;
+
+	err = get_gem_obj_from_dmabuf_fd(ctx, ctx->args[i].fd, &gem_obj);
+	if (err)
+		return err;
+
+	ctx->gem_objs[i] = gem_obj;
+	qda_gem_obj = to_qda_gem_obj(gem_obj);
+
+	rpra[i].buf.pv = (u64)ctx->args[i].ptr;
+
+	pages[i].addr = qda_gem_obj->dma_addr;
+
+	vma_offset = calculate_vma_offset(ctx->args[i].ptr);
+	pages[i].addr += vma_offset;
+	pages[i].size = calculate_page_aligned_size(ctx->args[i].ptr, len);
+
+	return 0;
+}
+
+static int process_direct_buffer(struct fastrpc_invoke_context *ctx, int i, int oix,
+				 union fastrpc_remote_arg *rpra, struct fastrpc_phy_page *pages,
+				 uintptr_t *args, u64 *rlen, u64 pkt_size)
+{
+	int mlen;
+	u64 len = ctx->args[i].length;
+	int inbufs = ctx->inbufs;
+
+	if (ctx->olaps[oix].offset == 0) {
+		*rlen -= ALIGN(*args, FASTRPC_ALIGN) - *args;
+		*args = ALIGN(*args, FASTRPC_ALIGN);
+	}
+
+	mlen = ctx->olaps[oix].mend - ctx->olaps[oix].mstart;
+
+	if (*rlen < mlen)
+		return -ENOSPC;
+
+	rpra[i].buf.pv = *args - ctx->olaps[oix].offset;
+
+	pages[i].addr = ctx->msg->phys - ctx->olaps[oix].offset + (pkt_size - *rlen);
+	pages[i].addr = pages[i].addr & PAGE_MASK;
+	pages[i].size = calculate_page_aligned_size(rpra[i].buf.pv, len);
+
+	*args = *args + mlen;
+	*rlen -= mlen;
+
+	if (i < inbufs) {
+		void *dst = (void *)(uintptr_t)rpra[i].buf.pv;
+		void *src = (void *)(uintptr_t)ctx->args[i].ptr;
+
+		/*
+		 * For user-space invocations (INVOKE_DYNAMIC), ptr is a user
+		 * virtual address and must be copied safely. For all other
+		 * (kernel-internal) invocations, ptr is a kernel address set
+		 * by the driver itself and can be copied directly.
+		 */
+		if (ctx->type == FASTRPC_RMID_INVOKE_DYNAMIC) {
+			if (copy_from_user(dst, (void __user *)src, len))
+				return -EFAULT;
+		} else {
+			memcpy(dst, src, len);
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * process_dma_handle() - Handle a DMA-handle scalar argument
+ *
+ * args[i].fd is a DMA-BUF fd.  We import it to get the physical page
+ * descriptor for the kernel, but forward the original DMA-BUF fd to the
+ * DSP in rpra[i].dma.fd so the DSP can identify the buffer by its fd.
+ */
+static int process_dma_handle(struct fastrpc_invoke_context *ctx, int i,
+			      union fastrpc_remote_arg *rpra, struct fastrpc_phy_page *pages)
+{
+	if (ctx->args[i].fd > 0) {
+		struct drm_gem_object *gem_obj;
+		struct qda_gem_obj *qda_gem_obj;
+		int err;
+
+		err = get_gem_obj_from_dmabuf_fd(ctx, ctx->args[i].fd, &gem_obj);
+		if (err)
+			return err;
+
+		ctx->gem_objs[i] = gem_obj;
+		qda_gem_obj = to_qda_gem_obj(gem_obj);
+
+		setup_pages_from_gem_obj(qda_gem_obj, &pages[i]);
+
+		/* Forward the original DMA-BUF fd to the DSP */
+		rpra[i].dma.fd     = ctx->args[i].fd;
+		rpra[i].dma.len    = ctx->args[i].length;
+		rpra[i].dma.offset = (u64)ctx->args[i].ptr;
+	} else {
+		rpra[i].buf.pv  = ctx->args[i].ptr;
+		rpra[i].buf.len = ctx->args[i].length;
+	}
+
+	return 0;
+}
+
+/**
+ * qda_fastrpc_get_header_size() - Compute the FastRPC message header size
+ * @ctx: FastRPC invocation context
+ * @out_size: Pointer to store the aligned packet size in bytes
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_fastrpc_get_header_size(struct fastrpc_invoke_context *ctx, size_t *out_size)
+{
+	ctx->inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
+	ctx->metalen = fastrpc_get_meta_size(ctx);
+	ctx->pkt_size = fastrpc_get_payload_size(ctx, ctx->metalen);
+
+	ctx->aligned_pkt_size = PAGE_ALIGN(ctx->pkt_size);
+	if (ctx->aligned_pkt_size == 0)
+		return -EINVAL;
+
+	*out_size = ctx->aligned_pkt_size;
+	return 0;
+}
+
+static int fastrpc_get_args(struct fastrpc_invoke_context *ctx)
+{
+	union fastrpc_remote_arg *rpra;
+	struct fastrpc_invoke_buf *list;
+	struct fastrpc_phy_page *pages;
+	int i, oix, err = 0;
+	u64 rlen;
+	uintptr_t args;
+	size_t hdr_size;
+
+	ctx->inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
+	err = qda_fastrpc_get_header_size(ctx, &hdr_size);
+	if (err)
+		return err;
+
+	ctx->msg->buf = ctx->msg_gem_obj->virt;
+	ctx->msg->phys = ctx->msg_gem_obj->dma_addr;
+
+	memset(ctx->msg->buf, 0, ctx->aligned_pkt_size);
+
+	rpra = (union fastrpc_remote_arg *)ctx->msg->buf;
+	ctx->list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
+	ctx->pages = fastrpc_phy_page_start(ctx->list, ctx->nscalars);
+	list = ctx->list;
+	pages = ctx->pages;
+	args = (uintptr_t)ctx->msg->buf + ctx->metalen;
+	rlen = ctx->pkt_size - ctx->metalen;
+	ctx->rpra = rpra;
+
+	for (oix = 0; oix < ctx->nbufs; ++oix) {
+		i = ctx->olaps[oix].raix;
+
+		rpra[i].buf.pv = 0;
+		rpra[i].buf.len = ctx->args[i].length;
+		list[i].num = ctx->args[i].length ? 1 : 0;
+		list[i].pgidx = i;
+
+		if (!ctx->args[i].length)
+			continue;
+
+		if (ctx->args[i].fd > 0)
+			err = process_fd_buffer(ctx, i, rpra, pages);
+		else
+			err = process_direct_buffer(ctx, i, oix, rpra, pages, &args, &rlen,
+						    ctx->pkt_size);
+
+		if (err)
+			goto bail_gem;
+	}
+
+	for (i = ctx->nbufs; i < ctx->nscalars; ++i) {
+		list[i].num = ctx->args[i].length ? 1 : 0;
+		list[i].pgidx = i;
+
+		err = process_dma_handle(ctx, i, rpra, pages);
+		if (err)
+			goto bail_gem;
+	}
+
+	return 0;
+
+bail_gem:
+	if (ctx->msg_gem_obj) {
+		drm_gem_object_put(&ctx->msg_gem_obj->base);
+		ctx->msg_gem_obj = NULL;
+	}
+
+	return err;
+}
+
+static int fastrpc_put_args(struct fastrpc_invoke_context *ctx, struct qda_msg *msg)
+{
+	union fastrpc_remote_arg *rpra;
+	int i, err = 0;
+
+	if (!ctx)
+		return -EINVAL;
+
+	rpra = ctx->rpra;
+	if (!rpra)
+		return -EINVAL;
+
+	for (i = ctx->inbufs; i < ctx->nbufs; ++i) {
+		if (ctx->args[i].fd <= 0) {
+			void *src = (void *)(uintptr_t)rpra[i].buf.pv;
+			void *dst = (void *)(uintptr_t)ctx->args[i].ptr;
+			u64 len = rpra[i].buf.len;
+
+			if (ctx->type == FASTRPC_RMID_INVOKE_DYNAMIC)
+				err = copy_to_user((void __user *)dst, src, len) ? -EFAULT : 0;
+			else
+				memcpy(dst, src, len);
+			if (err)
+				break;
+		}
+	}
+
+	return err;
+}
+
+/**
+ * qda_fastrpc_invoke_pack() - Pack an invocation context into a QDA message
+ * @ctx: FastRPC invocation context
+ * @msg: QDA message structure to pack into
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_fastrpc_invoke_pack(struct fastrpc_invoke_context *ctx,
+			    struct qda_msg *msg)
+{
+	int err = 0;
+
+	if (ctx->handle == FASTRPC_INIT_HANDLE)
+		msg->fastrpc.remote_session_id = 0;
+	else
+		msg->fastrpc.remote_session_id = ctx->remote_session_id;
+
+	ctx->msg = msg;
+
+	err = fastrpc_get_args(ctx);
+	if (err)
+		return err;
+
+	dma_wmb();
+
+	msg->fastrpc.tid    = ctx->pid;
+	msg->fastrpc.ctx    = ctx->ctxid | ctx->pd;
+	msg->fastrpc.handle = ctx->handle;
+	msg->fastrpc.sc     = ctx->sc;
+	msg->fastrpc.addr   = ctx->msg->phys;
+	msg->fastrpc.size   = roundup(ctx->pkt_size, PAGE_SIZE);
+	msg->fastrpc_ctx    = ctx;
+	msg->file_priv      = ctx->file_priv;
+
+	return 0;
+}
+
+/**
+ * qda_fastrpc_invoke_unpack() - Unpack a response message into an invocation context
+ * @ctx: FastRPC invocation context
+ * @msg: QDA message structure to unpack from
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_fastrpc_invoke_unpack(struct fastrpc_invoke_context *ctx,
+			      struct qda_msg *msg)
+{
+	int err;
+
+	dma_rmb();
+
+	err = fastrpc_put_args(ctx, msg);
+	if (err)
+		return err;
+
+	err = ctx->retval;
+	return err;
+}
+
+static int fastrpc_prepare_args_invoke(struct fastrpc_invoke_context *ctx, char __user *argp)
+{
+	struct drm_qda_invoke_args invoke_args;
+	struct drm_qda_fastrpc_invoke_args *args = NULL;
+	u32 nscalars;
+
+	/* argp is DRM ioctl data (kernel pointer); args pointer within it is user-space */
+	memcpy(&invoke_args, argp, sizeof(invoke_args));
+
+	ctx->handle = invoke_args.handle;
+	ctx->sc = invoke_args.sc;
+
+	nscalars = REMOTE_SCALARS_LENGTH(ctx->sc);
+	if (!nscalars) {
+		ctx->args = NULL;
+		return 0;
+	}
+
+	args = kcalloc(nscalars, sizeof(*args), GFP_KERNEL);
+	if (!args)
+		return -ENOMEM;
+
+	if (copy_from_user(args, u64_to_user_ptr(invoke_args.args),
+			   nscalars * sizeof(*args))) {
+		kfree(args);
+		return -EFAULT;
+	}
+
+	ctx->args = args;
+	return 0;
+}
+
+/**
+ * qda_fastrpc_prepare_args() - Prepare arguments for a FastRPC invocation
+ * @ctx: FastRPC invocation context
+ * @argp: User-space pointer to invocation arguments
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_fastrpc_prepare_args(struct fastrpc_invoke_context *ctx, char __user *argp)
+{
+	int err;
+
+	switch (ctx->type) {
+	case FASTRPC_RMID_INVOKE_DYNAMIC:
+		err = fastrpc_prepare_args_invoke(ctx, argp);
+		break;
+	default:
+		return -EINVAL;
+	}
+	if (err)
+		return err;
+
+	ctx->nscalars = REMOTE_SCALARS_LENGTH(ctx->sc);
+	ctx->nbufs = REMOTE_SCALARS_INBUFS(ctx->sc) + REMOTE_SCALARS_OUTBUFS(ctx->sc);
+
+	if (ctx->nscalars) {
+		ctx->gem_objs = kcalloc(ctx->nscalars, sizeof(*ctx->gem_objs), GFP_KERNEL);
+		if (!ctx->gem_objs)
+			return -ENOMEM;
+		ctx->olaps = kcalloc(ctx->nscalars, sizeof(*ctx->olaps), GFP_KERNEL);
+		if (!ctx->olaps) {
+			kfree(ctx->gem_objs);
+			ctx->gem_objs = NULL;
+			return -ENOMEM;
+		}
+		fastrpc_get_buff_overlaps(ctx);
+	}
+
+	return err;
+}
diff --git a/drivers/accel/qda/qda_fastrpc.h b/drivers/accel/qda/qda_fastrpc.h
new file mode 100644
index 000000000000..ce77baeccfba
--- /dev/null
+++ b/drivers/accel/qda/qda_fastrpc.h
@@ -0,0 +1,271 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_FASTRPC_H__
+#define __QDA_FASTRPC_H__
+
+#include <linux/completion.h>
+#include <linux/kref.h>
+#include <linux/list.h>
+#include <linux/types.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_file.h>
+#include <drm/qda_accel.h>
+
+/* Forward declarations */
+struct qda_gem_obj;
+
+/*
+ * FastRPC scalar extraction macros
+ *
+ * These macros extract different fields from the scalar value that describes
+ * the arguments passed in a FastRPC invocation.
+ */
+#define REMOTE_SCALARS_INBUFS(sc)	(((sc) >> 16) & 0x0ff)
+#define REMOTE_SCALARS_OUTBUFS(sc)	(((sc) >> 8) & 0x0ff)
+#define REMOTE_SCALARS_INHANDLES(sc)	(((sc) >> 4) & 0x0f)
+#define REMOTE_SCALARS_OUTHANDLES(sc)	((sc) & 0x0f)
+#define REMOTE_SCALARS_LENGTH(sc)	(REMOTE_SCALARS_INBUFS(sc) +   \
+					 REMOTE_SCALARS_OUTBUFS(sc) +  \
+					 REMOTE_SCALARS_INHANDLES(sc) + \
+					 REMOTE_SCALARS_OUTHANDLES(sc))
+
+/* FastRPC configuration constants */
+#define FASTRPC_ALIGN		128		/* Alignment requirement */
+#define FASTRPC_MAX_FDLIST	16		/* Maximum file descriptors */
+#define FASTRPC_MAX_CRCLIST	64		/* Maximum CRC list entries */
+
+/*
+ * FastRPC scalar construction macros
+ *
+ * These macros build the scalar value that describes the arguments
+ * for a FastRPC invocation.
+ */
+#define FASTRPC_BUILD_SCALARS(attr, method, in, out, oin, oout)		\
+				(((attr & 0x07) << 29) |		\
+				((method & 0x1f) << 24) |		\
+				((in & 0xff) << 16) |			\
+				((out & 0xff) <<  8) |			\
+				((oin & 0x0f) <<  4) |			\
+				(oout & 0x0f))
+
+#define FASTRPC_SCALARS(method, in, out) \
+		FASTRPC_BUILD_SCALARS(0, method, in, out, 0, 0)
+
+/**
+ * struct fastrpc_buf_overlap - Buffer overlap tracking structure
+ *
+ * Tracks overlapping buffer regions to optimise memory mapping and avoid
+ * redundant mappings of the same physical memory.
+ */
+struct fastrpc_buf_overlap {
+	/** @start: Start address of the buffer in user virtual address space */
+	u64 start;
+	/** @end: End address of the buffer in user virtual address space */
+	u64 end;
+	/** @raix: Remote argument index associated with this overlap */
+	int raix;
+	/** @mstart: Start address of the mapped region */
+	u64 mstart;
+	/** @mend: End address of the mapped region */
+	u64 mend;
+	/** @offset: Offset within the mapped region */
+	u64 offset;
+};
+
+/**
+ * struct fastrpc_remote_dmahandle - Remote DMA handle descriptor
+ */
+struct fastrpc_remote_dmahandle {
+	/** @fd: DMA-BUF file descriptor */
+	s32 fd;
+	/** @offset: Byte offset within the DMA-BUF */
+	u32 offset;
+	/** @len: Length of the region in bytes */
+	u32 len;
+};
+
+/**
+ * struct fastrpc_remote_buf - Remote buffer descriptor
+ */
+struct fastrpc_remote_buf {
+	/** @pv: Buffer pointer (user virtual address) */
+	u64 pv;
+	/** @len: Length of the buffer in bytes */
+	u64 len;
+};
+
+/**
+ * union fastrpc_remote_arg - Remote argument (buffer or DMA handle)
+ */
+union fastrpc_remote_arg {
+	/** @buf: Inline buffer descriptor */
+	struct fastrpc_remote_buf buf;
+	/** @dma: DMA-BUF handle descriptor */
+	struct fastrpc_remote_dmahandle dma;
+};
+
+/**
+ * struct fastrpc_phy_page - Physical page descriptor
+ */
+struct fastrpc_phy_page {
+	/** @addr: Physical (IOMMU) address of the page */
+	u64 addr;
+	/** @size: Size of the contiguous region in bytes */
+	u64 size;
+};
+
+/**
+ * struct fastrpc_invoke_buf - Invoke buffer descriptor
+ */
+struct fastrpc_invoke_buf {
+	/** @num: Number of contiguous physical regions */
+	u32 num;
+	/** @pgidx: Index into the physical page array */
+	u32 pgidx;
+};
+
+/**
+ * struct fastrpc_msg - FastRPC wire message for remote invocations
+ *
+ * Sent to the remote processor via RPMsg. This is the exact layout
+ * the DSP expects; do not reorder or add fields without DSP firmware
+ * coordination.
+ */
+struct fastrpc_msg {
+	/** @remote_session_id: Session identifier on the remote processor */
+	int remote_session_id;
+	/** @tid: Thread ID of the invoking thread */
+	int tid;
+	/** @ctx: Context identifier for matching request/response */
+	u64 ctx;
+	/** @handle: Handle of the remote method to invoke */
+	u32 handle;
+	/** @sc: Scalars value encoding in/out buffer counts */
+	u32 sc;
+	/** @addr: Physical address of the message payload buffer */
+	u64 addr;
+	/** @size: Size of the message payload in bytes */
+	u64 size;
+};
+
+/**
+ * struct qda_msg - FastRPC message with kernel-internal bookkeeping
+ *
+ * The wire-format portion is kept in the embedded @fastrpc member (must
+ * be first) so that &qda_msg->fastrpc can be passed directly to
+ * rpmsg_send() without a copy.
+ */
+struct qda_msg {
+	/**
+	 * @fastrpc: Wire-format message sent to the DSP via RPMsg.
+	 * Must be the first member.
+	 */
+	struct fastrpc_msg fastrpc;
+	/** @buf: Kernel virtual address of the payload buffer */
+	void *buf;
+	/** @phys: Physical/DMA address of the payload buffer */
+	u64 phys;
+	/** @ret: Return value from the remote processor */
+	int ret;
+	/** @fastrpc_ctx: Back-pointer to the owning invocation context */
+	struct fastrpc_invoke_context *fastrpc_ctx;
+	/** @file_priv: DRM file private data for GEM object lookup */
+	struct drm_file *file_priv;
+};
+
+/**
+ * struct fastrpc_invoke_context - Remote procedure call invocation context
+ *
+ * Maintains all state for a single remote procedure call, including buffer
+ * management, synchronisation, and result handling.
+ */
+struct fastrpc_invoke_context {
+	/** @node: List node for linking contexts in a queue */
+	struct list_head node;
+	/** @ctxid: Unique context identifier (XArray key shifted left by 4) */
+	u64 ctxid;
+	/** @inbufs: Number of input buffers */
+	int inbufs;
+	/** @outbufs: Number of output buffers */
+	int outbufs;
+	/** @handles: Number of DMA-BUF handle arguments */
+	int handles;
+	/** @nscalars: Total number of scalar arguments */
+	int nscalars;
+	/** @nbufs: Total number of buffer arguments (inbufs + outbufs) */
+	int nbufs;
+	/** @pid: Process ID of the calling process */
+	int pid;
+	/** @retval: Return value from the remote invocation */
+	int retval;
+	/** @metalen: Length of the FastRPC metadata header in bytes */
+	int metalen;
+	/** @remote_session_id: Session identifier on the remote processor */
+	int remote_session_id;
+	/** @pd: Protection domain identifier encoded into the context ID */
+	int pd;
+	/** @type: Invocation type (e.g. FASTRPC_RMID_INVOKE_DYNAMIC) */
+	int type;
+	/** @sc: Scalars value encoding in/out buffer counts */
+	u32 sc;
+	/** @handle: Handle of the remote method being invoked */
+	u32 handle;
+	/** @crc: Pointer to CRC values for data integrity checking */
+	u32 *crc;
+	/** @fdlist: Pointer to array of DMA-BUF file descriptors */
+	u64 *fdlist;
+	/** @pkt_size: Total payload size in bytes */
+	u64 pkt_size;
+	/** @aligned_pkt_size: Page-aligned payload size for GEM allocation */
+	u64 aligned_pkt_size;
+	/** @list: Array of invoke buffer descriptors */
+	struct fastrpc_invoke_buf *list;
+	/** @pages: Array of physical page descriptors for all arguments */
+	struct fastrpc_phy_page *pages;
+	/** @input_pages: Array of physical page descriptors for input buffers */
+	struct fastrpc_phy_page *input_pages;
+	/** @work: Completion used to synchronise with the DSP response */
+	struct completion work;
+	/** @msg: Pointer to the QDA message structure for this invocation */
+	struct qda_msg *msg;
+	/** @rpra: Array of remote procedure arguments */
+	union fastrpc_remote_arg *rpra;
+	/** @gem_objs: Array of GEM objects imported for argument buffers */
+	struct drm_gem_object **gem_objs;
+	/** @args: User-space invoke argument descriptors */
+	struct drm_qda_fastrpc_invoke_args *args;
+	/** @olaps: Array of buffer overlap descriptors for deduplication */
+	struct fastrpc_buf_overlap *olaps;
+	/** @refcount: Reference counter for context lifetime management */
+	struct kref refcount;
+	/** @msg_gem_obj: GEM object backing the message payload buffer */
+	struct qda_gem_obj *msg_gem_obj;
+	/** @file_priv: DRM file private data */
+	struct drm_file *file_priv;
+	/** @init_mem_gem_obj: GEM object for protection domain init memory */
+	struct qda_gem_obj *init_mem_gem_obj;
+	/** @req: Pointer to kernel-internal request buffer */
+	void *req;
+	/** @rsp: Pointer to kernel-internal response buffer */
+	void *rsp;
+	/** @inbuf: Pointer to kernel-internal input buffer */
+	void *inbuf;
+};
+
+/* Remote Method ID table - identifies initialization and control operations */
+#define FASTRPC_RMID_INVOKE_DYNAMIC	0xFFFFFFFF	/* Dynamic method invocation */
+
+/* Common handle for initialization operations */
+#define FASTRPC_INIT_HANDLE		0x1
+
+void qda_fastrpc_context_free(struct kref *ref);
+struct fastrpc_invoke_context *qda_fastrpc_context_alloc(void);
+int qda_fastrpc_prepare_args(struct fastrpc_invoke_context *ctx, char __user *argp);
+int qda_fastrpc_get_header_size(struct fastrpc_invoke_context *ctx, size_t *out_size);
+int qda_fastrpc_invoke_pack(struct fastrpc_invoke_context *ctx, struct qda_msg *msg);
+int qda_fastrpc_invoke_unpack(struct fastrpc_invoke_context *ctx, struct qda_msg *msg);
+
+#endif /* __QDA_FASTRPC_H__ */
diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
index 1769c85a3e98..c81268c20b04 100644
--- a/drivers/accel/qda/qda_ioctl.c
+++ b/drivers/accel/qda/qda_ioctl.c
@@ -3,8 +3,10 @@
 #include <drm/drm_ioctl.h>
 #include <drm/qda_accel.h>
 #include "qda_drv.h"
+#include "qda_fastrpc.h"
 #include "qda_gem.h"
 #include "qda_ioctl.h"
+#include "qda_rpmsg.h"
 
 /**
  * qda_ioctl_query() - Query DSP device information
@@ -74,3 +76,105 @@ int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_fil
 
 	return drm_gem_dumb_map_offset(file_priv, dev, args->handle, &args->offset);
 }
+
+static int fastrpc_context_get_id(struct fastrpc_invoke_context *ctx, struct qda_dev *qdev)
+{
+	int ret;
+	u32 id;
+
+	if (!qdev)
+		return -EINVAL;
+
+	ret = xa_alloc(&qdev->ctx_xa, &id, ctx, xa_limit_32b, GFP_KERNEL);
+	if (ret)
+		return ret;
+
+	ctx->ctxid = id << 4;
+	return 0;
+}
+
+static void fastrpc_context_put_id(struct fastrpc_invoke_context *ctx, struct qda_dev *qdev)
+{
+	if (qdev)
+		xa_erase(&qdev->ctx_xa, ctx->ctxid >> 4);
+}
+
+static int fastrpc_invoke(int type, struct drm_device *dev, void *data,
+			  struct drm_file *file_priv)
+{
+	struct qda_file_priv *qda_file_priv = file_priv->driver_priv;
+	struct qda_dev *qdev = qda_file_priv->qda_dev;
+	struct qda_msg msg;
+	struct fastrpc_invoke_context *ctx;
+	struct drm_gem_object *gem_obj;
+	int err;
+	size_t hdr_size;
+
+	ctx = qda_fastrpc_context_alloc();
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	err = fastrpc_context_get_id(ctx, qdev);
+	if (err) {
+		kref_put(&ctx->refcount, qda_fastrpc_context_free);
+		return err;
+	}
+
+	ctx->type = type;
+	ctx->file_priv = file_priv;
+	ctx->remote_session_id = qda_file_priv->remote_session_id;
+
+	err = qda_fastrpc_prepare_args(ctx, (char __user *)data);
+	if (err)
+		goto err_context_free;
+
+	err = qda_fastrpc_get_header_size(ctx, &hdr_size);
+	if (err)
+		goto err_context_free;
+
+	gem_obj = qda_gem_create_object(dev, qdev->iommu_mgr, hdr_size, file_priv);
+	if (IS_ERR(gem_obj)) {
+		err = PTR_ERR(gem_obj);
+		goto err_context_free;
+	}
+
+	ctx->msg_gem_obj = to_qda_gem_obj(gem_obj);
+
+	err = qda_fastrpc_invoke_pack(ctx, &msg);
+	if (err)
+		goto err_context_free;
+
+	err = qda_rpmsg_send_msg(qdev, &msg);
+	if (err)
+		goto err_context_free;
+
+	err = qda_rpmsg_wait_for_rsp(ctx);
+	if (err)
+		goto err_context_free;
+
+	err = qda_fastrpc_invoke_unpack(ctx, &msg);
+	if (err)
+		goto err_context_free;
+
+	fastrpc_context_put_id(ctx, qdev);
+	kref_put(&ctx->refcount, qda_fastrpc_context_free);
+	return 0;
+
+err_context_free:
+	fastrpc_context_put_id(ctx, qdev);
+	kref_put(&ctx->refcount, qda_fastrpc_context_free);
+	return err;
+}
+
+/**
+ * qda_ioctl_invoke() - Perform a dynamic FastRPC method invocation
+ * @dev: DRM device structure
+ * @data: User-space data (struct qda_invoke_args)
+ * @file_priv: DRM file private data
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_ioctl_invoke(struct drm_device *dev, void *data, struct drm_file *file_priv)
+{
+	return fastrpc_invoke(FASTRPC_RMID_INVOKE_DYNAMIC, dev, data, file_priv);
+}
diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
index d1cbbfb6d965..3bb9cfd98370 100644
--- a/drivers/accel/qda/qda_ioctl.h
+++ b/drivers/accel/qda/qda_ioctl.h
@@ -11,5 +11,6 @@
 int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_ioctl_gem_create(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_file *file_priv);
+int qda_ioctl_invoke(struct drm_device *dev, void *data, struct drm_file *file_priv);
 
 #endif /* __QDA_IOCTL_H__ */
diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
index 719dabb028c5..44b12a9f2808 100644
--- a/drivers/accel/qda/qda_rpmsg.c
+++ b/drivers/accel/qda/qda_rpmsg.c
@@ -1,14 +1,81 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <linux/completion.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/rpmsg.h>
+#include <linux/sched.h>
+#include <linux/wait.h>
 #include <drm/drm_print.h>
 
 #include "qda_cb.h"
 #include "qda_drv.h"
+#include "qda_fastrpc.h"
 #include "qda_rpmsg.h"
 
+static int validate_device_availability(struct qda_dev *qdev)
+{
+	if (!qdev)
+		return -ENODEV;
+
+	if (!qdev->rpdev) {
+		drm_dbg_driver(&qdev->drm_dev, "RPMsg device unavailable: rpdev is NULL\n");
+		return -ENODEV;
+	}
+	return 0;
+}
+
+static struct fastrpc_invoke_context *get_and_validate_context(struct qda_msg *msg,
+							       struct qda_dev *qdev)
+{
+	struct fastrpc_invoke_context *ctx = msg->fastrpc_ctx;
+
+	if (!ctx) {
+		drm_dbg_driver(&qdev->drm_dev, "FastRPC context not found in message\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	kref_get(&ctx->refcount);
+	return ctx;
+}
+
+static int validate_callback_params(struct qda_dev *qdev, void *data, int len)
+{
+	if (!qdev)
+		return -ENODEV;
+
+	if (len < sizeof(struct qda_invoke_rsp)) {
+		drm_dbg_driver(&qdev->drm_dev, "Invalid message size from remote: %d\n", len);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static unsigned long extract_context_id(struct qda_invoke_rsp *resp_msg)
+{
+	return resp_msg->ctx >> 4;
+}
+
+static struct fastrpc_invoke_context *find_context_by_id(struct qda_dev *qdev,
+							 unsigned long ctxid)
+{
+	struct fastrpc_invoke_context *ctx;
+
+	ctx = xa_load(&qdev->ctx_xa, ctxid);
+	if (!ctx) {
+		drm_dbg_driver(&qdev->drm_dev, "FastRPC context not found for ctxid: %lu\n", ctxid);
+		return ERR_PTR(-ENOENT);
+	}
+	return ctx;
+}
+
+static void complete_context_processing(struct fastrpc_invoke_context *ctx, int retval)
+{
+	ctx->retval = retval;
+	complete(&ctx->work);
+	kref_put(&ctx->refcount, qda_fastrpc_context_free);
+}
+
 static struct qda_dev *alloc_and_init_qdev(struct rpmsg_device *rpdev)
 {
 	struct qda_dev *qdev;
@@ -24,11 +91,76 @@ static struct qda_dev *alloc_and_init_qdev(struct rpmsg_device *rpdev)
 	return qdev;
 }
 
+int qda_rpmsg_send_msg(struct qda_dev *qdev, struct qda_msg *msg)
+{
+	int ret, idx;
+	struct fastrpc_invoke_context *ctx;
+
+	if (!qdev)
+		return -ENODEV;
+
+	if (!drm_dev_enter(&qdev->drm_dev, &idx))
+		return -ENODEV;
+
+	ret = validate_device_availability(qdev);
+	if (ret)
+		goto out_exit;
+
+	ctx = get_and_validate_context(msg, qdev);
+	if (IS_ERR(ctx)) {
+		ret = PTR_ERR(ctx);
+		goto out_exit;
+	}
+
+	ret = rpmsg_send(qdev->rpdev->ept, &msg->fastrpc, sizeof(msg->fastrpc));
+	if (ret) {
+		drm_err(&qdev->drm_dev, "rpmsg_send failed: %d\n", ret);
+		kref_put(&ctx->refcount, qda_fastrpc_context_free);
+	}
+
+out_exit:
+	drm_dev_exit(idx);
+	return ret;
+}
+
+int qda_rpmsg_wait_for_rsp(struct fastrpc_invoke_context *ctx)
+{
+	return wait_for_completion_interruptible(&ctx->work);
+}
+
 static int qda_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len,
 			void *priv, u32 src)
 {
-	/* Placeholder: responses will be dispatched here */
-	return 0;
+	struct qda_dev *qdev = dev_get_drvdata(&rpdev->dev);
+	struct qda_invoke_rsp *resp_msg = (struct qda_invoke_rsp *)data;
+	struct fastrpc_invoke_context *ctx;
+	unsigned long ctxid;
+	int ret, idx;
+
+	if (!qdev)
+		return -ENODEV;
+
+	if (!drm_dev_enter(&qdev->drm_dev, &idx))
+		return -ENODEV;
+
+	ret = validate_callback_params(qdev, data, len);
+	if (ret)
+		goto out_exit;
+
+	ctxid = extract_context_id(resp_msg);
+
+	ctx = find_context_by_id(qdev, ctxid);
+	if (IS_ERR(ctx)) {
+		ret = PTR_ERR(ctx);
+		goto out_exit;
+	}
+
+	complete_context_processing(ctx, resp_msg->retval);
+	ret = 0;
+
+out_exit:
+	drm_dev_exit(idx);
+	return ret;
 }
 
 static void qda_rpmsg_remove(struct rpmsg_device *rpdev)
diff --git a/drivers/accel/qda/qda_rpmsg.h b/drivers/accel/qda/qda_rpmsg.h
index 5229d834b34b..bf601e915017 100644
--- a/drivers/accel/qda/qda_rpmsg.h
+++ b/drivers/accel/qda/qda_rpmsg.h
@@ -6,6 +6,23 @@
 #ifndef __QDA_RPMSG_H__
 #define __QDA_RPMSG_H__
 
+#include "qda_drv.h"
+#include "qda_fastrpc.h"
+
+/**
+ * struct qda_invoke_rsp - Response structure for FastRPC invocations
+ */
+struct qda_invoke_rsp {
+	/** @ctx: Invoke caller context for matching request/response */
+	u64 ctx;
+	/** @retval: Return value from the remote invocation */
+	int retval;
+};
+
+/* RPMsg transport layer functions */
+int qda_rpmsg_send_msg(struct qda_dev *qdev, struct qda_msg *msg);
+int qda_rpmsg_wait_for_rsp(struct fastrpc_invoke_context *ctx);
+
 /* RPMsg transport layer registration */
 int qda_rpmsg_register(void);
 void qda_rpmsg_unregister(void);
diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
index 319e21aae0d6..72512213741f 100644
--- a/include/uapi/drm/qda_accel.h
+++ b/include/uapi/drm/qda_accel.h
@@ -21,6 +21,8 @@ extern "C" {
 #define DRM_QDA_QUERY		0x00
 #define DRM_QDA_GEM_CREATE		0x01
 #define DRM_QDA_GEM_MMAP_OFFSET	0x02
+/* Command numbers 0x03-0x06 reserved for INIT_ATTACH, INIT_CREATE, MAP, MUNMAP */
+#define DRM_QDA_REMOTE_INVOKE		0x07
 
 /*
  * QDA IOCTL definitions
@@ -35,6 +37,8 @@ extern "C" {
 					  struct drm_qda_gem_create)
 #define DRM_IOCTL_QDA_GEM_MMAP_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_GEM_MMAP_OFFSET, \
 					  struct drm_qda_gem_mmap_offset)
+#define DRM_IOCTL_QDA_REMOTE_INVOKE	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_REMOTE_INVOKE, \
+					  struct drm_qda_invoke_args)
 
 /**
  * struct drm_qda_query - Device information query structure
@@ -78,6 +82,41 @@ struct drm_qda_gem_mmap_offset {
 	__u32 pad;
 };
 
+/**
+ * struct drm_qda_fastrpc_invoke_args - FastRPC invocation argument descriptor
+ * @ptr: Pointer to argument data (user virtual address)
+ * @length: Length of the argument data in bytes
+ * @fd: DMA-BUF file descriptor for buffer arguments, -1/0 for scalar arguments
+ * @attr: Argument attributes and flags
+ *
+ * This structure describes a single argument passed to a FastRPC invocation.
+ * Arguments can be either scalar values or buffer references (via DMA-BUF fd).
+ */
+struct drm_qda_fastrpc_invoke_args {
+	__u64 ptr;
+	__u64 length;
+	__s32 fd;
+	__u32 attr;
+};
+
+/**
+ * struct drm_qda_invoke_args - Dynamic FastRPC invocation parameters
+ * @handle: Remote handle to invoke on the DSP
+ * @sc: FastRPC scalars value encoding the number of in/out buffers
+ * @args: User-space pointer to array of drm_qda_fastrpc_invoke_args descriptors;
+ *        the fd field in each entry must be a DMA-BUF fd (or -1/0 for
+ *        inline scalar buffers)
+ *
+ * This structure is used with DRM_IOCTL_QDA_REMOTE_INVOKE to perform a
+ * dynamic remote procedure call on the DSP. The args pointer must reference
+ * an array of REMOTE_SCALARS_LENGTH(sc) drm_qda_fastrpc_invoke_args entries.
+ */
+struct drm_qda_invoke_args {
+	__u32 handle;
+	__u32 sc;
+	__u64 args;
+};
+
 #if defined(__cplusplus)
 }
 #endif

-- 
2.34.1



