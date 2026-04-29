Return-Path: <linux-media+bounces-60022-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEiHM7Bj8mmBqgEAu9opvQ
	(envelope-from <linux-media+bounces-60022-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 22:01:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59492499F30
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 22:01:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F376D303F455
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 20:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E0B394463;
	Wed, 29 Apr 2026 20:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web04.chillydomains.com header.i=@web04.chillydomains.com header.b="hExBLkeS"
X-Original-To: linux-media@vger.kernel.org
Received: from web04.chillydomains.com (web04.chillydomains.com [193.19.92.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914EA38423A
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 20:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.19.92.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777492812; cv=none; b=NbRQtuFlDIe8ac9fJ+ohDloYhCl67aVmkCHS7btD4JSfqmXen1d3j4xDXNMlf/qrIdbhtPtKrOU2zCfxf2sF8ef3xAkr8DC6AXGPEXvGoPdNx0Dwuk9RgrV96nqHKWF1yv3Og5ker/SweCVgTMYOQUwROjfVa0wWn2h3+yAz9tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777492812; c=relaxed/simple;
	bh=pzvYNG7O3NjY4rozX4YN5+/6UT2OM6XcPT3k0XWZK4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MJ7wwVkVpYBaFOzJJJm2azhOXi28rKDIOPS3v1n0pX8wyhpLMESKYsVFLjAKkoqYuygHDykLG3PZwwPYPnKaPlqBoxnJ4OhIgKxrSUFi/HIBUiFZ4Ir1fkvbh0aNNWRO1mUq4u26SQ3kZkJssg82ek6f3251Rrg4yI+H4cUwo+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reauktion.de; spf=none smtp.mailfrom=reauktion.de; dkim=pass (2048-bit key) header.d=web04.chillydomains.com header.i=@web04.chillydomains.com header.b=hExBLkeS; arc=none smtp.client-ip=193.19.92.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reauktion.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=reauktion.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=web04.chillydomains.com; s=dkim; h=From:To:Cc:Subject:Date:
	Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	Content-Type:Content-Transfer-Encoding; bh=1+9FwjtYEgcl+wQVdNXHv
	Cf5gn4Vs+2VsZJMRjOVxUg=; b=hExBLkeSN6Zv0RVgFL6xHch4tFBK2nfbDNdtN
	Tm4qYd9t0tDhlDWHhvm5WO28LqQseJttQHu3OZoodc5mG7Jdfyn9rXndtbmFwiIj
	BMtPkiOJe4CQJCGSZW4v7SOCiggD92vHQjp8DG5lhTt/dZ3aTASjXSJ8KD7ekYcB
	V33fuzjZ4/qRdw9s0RHawC/DxEVGFbUwjS5a21mE1TEwZnG9uy5tfqj3oK71lJ9Q
	FOGJI7W1KpGQOH6txgu+4LKMLKq/LpKcRejCDf9/NI0J5j+pzWTku79TgeuB2Ktn
	1w8YLvd01M6tXlti/ljnko0/IBudX17HCj7arCKXF5wt9WYyg==
Received: (qmail 2739233 invoked by uid 7799); 29 Apr 2026 21:53:26 +0200
Received: by simscan 1.4.0 ppid: 2739204, pid: 2739218, t: 0.6330s
         scanners: clamav: 0.103.9/m:62/d:27778
Received: from 31.29.52.71.dynamic-pppoe.dt.ipv4.wtnet.de (HELO localhost) (automation@reauktion.de@31.29.52.71) by web04.chillydomains.com with SMTP [62865]; 29 Apr 2026 21:53:25 +0200
From: Markus Fritsche <mfritsche@reauktion.de>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH RFC 1/3] media: videobuf2: add dma_resv release-fence helper
Date: Wed, 29 Apr 2026 19:53:04 +0000
Message-ID: <20260429195306.239666-2-mfritsche@reauktion.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260429195306.239666-1-mfritsche@reauktion.de>
References: <20260429195306.239666-1-mfritsche@reauktion.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 59492499F30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[web04.chillydomains.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mfritsche@reauktion.de,linux-media@vger.kernel.org];
	DMARC_NA(0.00)[reauktion.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60022-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[web04.chillydomains.com:+]

Add an opt-in API that lets vb2 producers populate a dma_resv
exclusive write fence on the dmabufs they export to userspace,
signalled when the buffer transitions to VB2_BUF_STATE_DONE.

V4L2 producers historically don't propagate buffer-state-done into
the dmabuf's dma_resv exclusive fence. Userspace consumers that
import V4L2-produced dmabufs and wait on the dmabuf's implicit-sync
fence (poll(POLLIN), DMA_BUF_IOCTL_EXPORT_SYNC_FILE) currently see
either zero fences or a stub fence from dma_fence_get_stub(). This
is correct by accident for the common case (clients call DQBUF
before importing) but represents a contract gap.

Drivers opt in by calling vb2_buffer_attach_release_fence(vb) from
their buf_queue callback. The helper allocates a dma_fence on the
queue's fence context (set up at vb2_core_queue_init), attaches it
as DMA_RESV_USAGE_WRITE on each plane's dmabuf->resv, and stashes
it in vb->release_fence. vb2_buffer_done signals + puts the fence
as part of its state transition.

For drivers that don't opt in, vb->release_fence stays NULL and
the signal path is a no-op.

Skips planes whose vb2_plane.dbuf is NULL — buffers never exported
via VIDIOC_EXPBUF (or imported via V4L2_MEMORY_DMABUF) have no
dmabuf for userspace to wait on.

Signed-off-by: Markus Fritsche <mfritsche@reauktion.de>
---
 .../media/common/videobuf2/videobuf2-core.c   | 95 +++++++++++++++++++
 include/media/videobuf2-core.h                | 29 ++++++
 2 files changed, 124 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index b0523fc23..ee766aae0 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -26,6 +26,9 @@
 #include <linux/freezer.h>
 #include <linux/kthread.h>
 
+#include <linux/dma-fence.h>
+#include <linux/dma-resv.h>
+#include <linux/dma-buf.h>
 #include <media/videobuf2-core.h>
 #include <media/v4l2-mc.h>
 
@@ -1179,6 +1182,86 @@ void *vb2_plane_cookie(struct vb2_buffer *vb, unsigned int plane_no)
 }
 EXPORT_SYMBOL_GPL(vb2_plane_cookie);
 
+/*
+ * dma_resv release-fence integration.
+ *
+ * V4L2 producers historically don't propagate buffer-state-done into
+ * the dmabuf's dma_resv exclusive fence. Userspace consumers that
+ * wait on that fence (e.g. wayland compositors via poll(POLLIN) or
+ * DMA_BUF_IOCTL_EXPORT_SYNC_FILE) currently see either no fences or
+ * a stub fence from dma_fence_get_stub(). The opt-in API below lets
+ * a driver attach a real producer fence at QBUF time and have it
+ * signalled by vb2_buffer_done().
+ */
+
+static const char *vb2_dma_resv_get_driver_name(struct dma_fence *fence)
+{
+	return "videobuf2";
+}
+
+static const char *vb2_dma_resv_get_timeline_name(struct dma_fence *fence)
+{
+	return "vb2-release-fence";
+}
+
+static const struct dma_fence_ops vb2_dma_resv_fence_ops = {
+	.get_driver_name = vb2_dma_resv_get_driver_name,
+	.get_timeline_name = vb2_dma_resv_get_timeline_name,
+};
+
+int vb2_buffer_attach_release_fence(struct vb2_buffer *vb)
+{
+	struct vb2_queue *q = vb->vb2_queue;
+	struct dma_fence *fence;
+	unsigned int plane;
+
+	if (WARN_ON(vb->release_fence))
+		return -EINVAL;
+
+	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
+	if (!fence)
+		return -ENOMEM;
+
+	dma_fence_init(fence, &vb2_dma_resv_fence_ops, &q->dma_resv_fence_lock,
+		       q->dma_resv_fence_context,
+		       atomic64_inc_return(&q->dma_resv_fence_seqno));
+
+	for (plane = 0; plane < vb->num_planes; plane++) {
+		struct dma_buf *dbuf = vb->planes[plane].dbuf;
+
+		if (!dbuf)
+			continue;
+
+		dma_resv_lock(dbuf->resv, NULL);
+		dma_resv_add_fence(dbuf->resv, fence, DMA_RESV_USAGE_WRITE);
+		dma_resv_unlock(dbuf->resv);
+	}
+
+	/* One reference for the eventual signal in vb2_buffer_done. */
+	vb->release_fence = dma_fence_get(fence);
+
+	/* The dma_resv held its own reference per plane. Drop ours. */
+	dma_fence_put(fence);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(vb2_buffer_attach_release_fence);
+
+static void vb2_buffer_signal_release_fence(struct vb2_buffer *vb,
+					    enum vb2_buffer_state state)
+{
+	struct dma_fence *fence = vb->release_fence;
+
+	if (!fence)
+		return;
+
+	if (state == VB2_BUF_STATE_ERROR)
+		dma_fence_set_error(fence, -EIO);
+	dma_fence_signal(fence);
+	dma_fence_put(fence);
+	vb->release_fence = NULL;
+}
+
 void vb2_buffer_done(struct vb2_buffer *vb, enum vb2_buffer_state state)
 {
 	struct vb2_queue *q = vb->vb2_queue;
@@ -1205,6 +1288,9 @@ void vb2_buffer_done(struct vb2_buffer *vb, enum vb2_buffer_state state)
 	if (state != VB2_BUF_STATE_QUEUED)
 		__vb2_buf_mem_finish(vb);
 
+	if (state != VB2_BUF_STATE_QUEUED)
+		vb2_buffer_signal_release_fence(vb, state);
+
 	spin_lock_irqsave(&q->done_lock, flags);
 	if (state == VB2_BUF_STATE_QUEUED) {
 		vb->state = VB2_BUF_STATE_QUEUED;
@@ -2652,6 +2738,15 @@ int vb2_core_queue_init(struct vb2_queue *q)
 	mutex_init(&q->mmap_lock);
 	init_waitqueue_head(&q->done_wq);
 
+	/*
+	 * Per-queue dma_resv release-fence context. Drivers opt-in via
+	 * vb2_buffer_attach_release_fence(); other drivers pay only the
+	 * cost of the unused fields.
+	 */
+	q->dma_resv_fence_context = dma_fence_context_alloc(1);
+	atomic64_set(&q->dma_resv_fence_seqno, 0);
+	spin_lock_init(&q->dma_resv_fence_lock);
+
 	q->memory = VB2_MEMORY_UNKNOWN;
 
 	if (q->buf_struct_size == 0)
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 9b02aeba4..2bf3272d4 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -288,6 +288,12 @@ struct vb2_buffer {
 	unsigned int		skip_cache_sync_on_finish:1;
 
 	struct vb2_plane	planes[VB2_MAX_PLANES];
+	/*
+	 * dma_resv release fence — set by vb2_buffer_attach_release_fence()
+	 * (driver opt-in from buf_queue), signalled and put by
+	 * vb2_buffer_done(). NULL for drivers that don't opt in.
+	 */
+	struct dma_fence	*release_fence;
 	struct list_head	queued_entry;
 	struct list_head	done_entry;
 #ifdef CONFIG_VIDEO_ADV_DEBUG
@@ -658,6 +664,15 @@ struct vb2_queue {
 	spinlock_t			done_lock;
 	wait_queue_head_t		done_wq;
 
+	/*
+	 * Per-queue dma_resv release-fence context. Drivers that opt
+	 * into vb2_buffer_attach_release_fence() use these to allocate
+	 * fences on a single per-queue timeline.
+	 */
+	u64				dma_resv_fence_context;
+	atomic64_t			dma_resv_fence_seqno;
+	spinlock_t			dma_resv_fence_lock;
+
 	unsigned int			streaming:1;
 	unsigned int			start_streaming_called:1;
 	unsigned int			error:1;
@@ -747,6 +762,20 @@ void *vb2_plane_cookie(struct vb2_buffer *vb, unsigned int plane_no);
  */
 void vb2_buffer_done(struct vb2_buffer *vb, enum vb2_buffer_state state);
 
+/**
+ * vb2_buffer_attach_release_fence() - opt-in dma_resv release fence.
+ * @vb: the buffer being queued to the producer.
+ *
+ * Drivers call this from their buf_queue callback to attach an
+ * exclusive write fence to each plane's dmabuf->resv. The fence
+ * is signalled and put by vb2_buffer_done() when the buffer
+ * transitions to VB2_BUF_STATE_DONE / _ERROR. Skips planes whose
+ * dbuf is NULL.
+ *
+ * Returns 0 on success, negative errno on allocation failure.
+ */
+int vb2_buffer_attach_release_fence(struct vb2_buffer *vb);
+
 /**
  * vb2_discard_done() - discard all buffers marked as DONE.
  * @q:		pointer to &struct vb2_queue with videobuf2 queue.
-- 
2.47.3


