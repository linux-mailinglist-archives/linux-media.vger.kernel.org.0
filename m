Return-Path: <linux-media+bounces-32361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C92AB4D39
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 09:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F22831B42A8A
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 07:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC341F1518;
	Tue, 13 May 2025 07:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="AK9lOfwW"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289B91BC4E
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 07:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747122343; cv=none; b=I05LBqGIHGbt7rI00IoYfW++vn0ubzJuY/fR1hTxAzZDnGq6dOUYaVHUL53GLY8/s2fc7wab1t/v1K8gmh5WaP4cj+3g/eMlw09bsBKZuBrLqchkFe5TbtVCkQi8pJ5tFWSeAtsKH8NlBzgKm6DY1S/PWpwq6PrN5Lwc9RgRU3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747122343; c=relaxed/simple;
	bh=7m6N1a+xL8AqvlUvV/08JrUtZJY7K/CiLKX/INsd1Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WyKvNLSLzvrPdjBRGNUBghImsYUCOqvk4MQ6YRweuL0hSgn6oKa8pXZ7xm2coSGx2MNbPRcBbKo9cDMeXTVWblIRq9oKPUle15SJp5wThh3kcQub315WwHcrIEvYUjyLATY65CfX66KBaAsI3GTgah4m5KBVMSzcNhOA5Wu9dA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=AK9lOfwW; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=qnPUTci+uql93eNGCGYNwn/huPGTw/HHDquLyMk0A3o=; b=AK9lOfwWeYL7FyX9csCoRvP3M/
	yyixMLYeO7xmD//Uy8eXhjXXoXGeYbfIObqkNiLxBh1kXeDRpBT0W0FhMrzCIcTiW7P24jtj9H54a
	+yJpCbhfK6Ag7qJo2EVsCJvRqpWzrQfJWziHIOH0CJ9gIzPImEsh6adYCEXg/QHVRY8j59IlmJkwu
	ZoW4LtpodOdFqprqi/lM5DhPk8B2XVt/N30mHZkqEVem4QFlpByf4NofDmHxaxkG8B8GkiAGMETmX
	WaAsURlHMQ1PNmP5P7Yw64eOQXnHwpV/g/TYeU/hv3U7wnhZGGl0Nkf1UXUypfl7cXRzswTuI3AIX
	CTa68E+w==;
Received: from [81.79.92.254] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uEkF4-007TvY-SV; Tue, 13 May 2025 09:45:29 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	amd-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [RFC v3 07/10] dma-fence: Add safe access helpers and document the rules
Date: Tue, 13 May 2025 08:45:10 +0100
Message-ID: <20250513074513.81727-8-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250513074513.81727-1-tvrtko.ursulin@igalia.com>
References: <20250513074513.81727-1-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dma-fence objects currently suffer from a potential use after free problem
where fences exported to userspace and other drivers can outlive the
exporting driver, or the associated data structures.

The discussion on how to address this concluded that adding reference
counting to all the involved objects is not desirable, since it would need
to be very wide reaching and could cause unloadable drivers if another
entity would be holding onto a signaled fence reference potentially
indefinitely.

This patch enables the safe access by introducing and documenting a
contract between fence exporters and users. It documents a set of
contraints and adds helpers which a) drivers with potential to suffer from
the use after free must use and b) users of the dma-fence API must use as
well.

Premise of the design has multiple sides:

1. Drivers (fence exporters) MUST ensure a RCU grace period between
signalling a fence and freeing the driver private data associated with it.

The grace period does not have to follow the signalling immediately but
HAS to happen before data is freed.

2. Users of the dma-fence API marked with such requirement MUST contain
the complete access to the data within a single code block guarded by the
new dma_fence_access_begin() and dma_fence_access_end() helpers.

The combination of the two ensures that whoever sees the
DMA_FENCE_FLAG_SIGNALED_BIT not set is guaranteed to have access to a
valid fence->lock and valid data potentially accessed by the fence->ops
virtual functions, until the call to dma_fence_access_end().

3. Module unload (fence->ops) disappearing is for now explicitly not
handled. That would required a more complex protection, possibly needing
SRCU instead of RCU to handle callers such as dma_fence_wait_timeout(),
where race between dma_fence_enable_sw_signaling, signalling, and
dereference of fence->ops->wait() would need a sleeping SRCU context.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/dma-buf/dma-fence.c | 69 +++++++++++++++++++++++++++++++++++++
 include/linux/dma-fence.h   | 32 ++++++++++++-----
 2 files changed, 93 insertions(+), 8 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index dc2456f68685..cfe1d7b79c22 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -533,6 +533,7 @@ void dma_fence_release(struct kref *kref)
 	struct dma_fence *fence =
 		container_of(kref, struct dma_fence, refcount);
 
+	dma_fence_access_begin();
 	trace_dma_fence_destroy(fence);
 
 	if (WARN(!list_empty(&fence->cb_list) &&
@@ -560,6 +561,8 @@ void dma_fence_release(struct kref *kref)
 		fence->ops->release(fence);
 	else
 		dma_fence_free(fence);
+
+	dma_fence_access_end();
 }
 EXPORT_SYMBOL(dma_fence_release);
 
@@ -982,11 +985,13 @@ EXPORT_SYMBOL(dma_fence_set_deadline);
  */
 void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
 {
+	dma_fence_access_begin();
 	seq_printf(seq, "%s %s seq %llu %ssignalled\n",
 		   dma_fence_driver_name(fence),
 		   dma_fence_timeline_name(fence),
 		   fence->seqno,
 		   dma_fence_is_signaled(fence) ? "" : "un");
+	dma_fence_access_end();
 }
 EXPORT_SYMBOL(dma_fence_describe);
 
@@ -1033,3 +1038,67 @@ dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
 	__set_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags);
 }
 EXPORT_SYMBOL(dma_fence_init64);
+
+/**
+ * dma_fence_driver_name - Access the driver name
+ * @fence: the fence to query
+ *
+ * Returns a driver name backing the dma-fence implementation.
+ *
+ * IMPORTANT CONSIDERATION:
+ * Dma-fence contract stipulates that access to driver provided data (data not
+ * directly embedded into the object itself), such as the &dma_fence.lock and
+ * memory potentially accessed by the &dma_fence.ops functions, is forbidden
+ * after the fence has been signalled. Drivers are allowed to free that data,
+ * and some do.
+ *
+ * To allow safe access drivers are mandated to guarantee a RCU grace period
+ * between signalling the fence and freeing said data.
+ *
+ * As such access to the driver name is only valid inside a RCU locked section.
+ * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE block guarded
+ * by the &dma_fence_access_being and &dma_fence_access_end pair.
+ */
+const char *dma_fence_driver_name(struct dma_fence *fence)
+{
+	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
+			 "rcu_read_lock() required for safe access to returned string");
+
+	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
+		return fence->ops->get_driver_name(fence);
+	else
+		return "detached-driver";
+}
+EXPORT_SYMBOL(dma_fence_driver_name);
+
+/**
+ * dma_fence_timeline_name - Access the timeline name
+ * @fence: the fence to query
+ *
+ * Returns a timeline name provided by the dma-fence implementation.
+ *
+ * IMPORTANT CONSIDERATION:
+ * Dma-fence contract stipulates that access to driver provided data (data not
+ * directly embedded into the object itself), such as the &dma_fence.lock and
+ * memory potentially accessed by the &dma_fence.ops functions, is forbidden
+ * after the fence has been signalled. Drivers are allowed to free that data,
+ * and some do.
+ *
+ * To allow safe access drivers are mandated to guarantee a RCU grace period
+ * between signalling the fence and freeing said data.
+ *
+ * As such access to the driver name is only valid inside a RCU locked section.
+ * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE block guarded
+ * by the &dma_fence_access_being and &dma_fence_access_end pair.
+ */
+const char *dma_fence_timeline_name(struct dma_fence *fence)
+{
+	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
+			 "rcu_read_lock() required for safe access to returned string");
+
+	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
+		return fence->ops->get_driver_name(fence);
+	else
+		return "signaled-timeline";
+}
+EXPORT_SYMBOL(dma_fence_timeline_name);
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index c5ac37e10d85..b39e430142ea 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -377,15 +377,31 @@ bool dma_fence_remove_callback(struct dma_fence *fence,
 			       struct dma_fence_cb *cb);
 void dma_fence_enable_sw_signaling(struct dma_fence *fence);
 
-static inline const char *dma_fence_driver_name(struct dma_fence *fence)
-{
-	return fence->ops->get_driver_name(fence);
-}
+/**
+ * DOC: Safe external access to driver provided object members
+ *
+ * All data not stored directly in the dma-fence object, such as the
+ * &dma_fence.lock and memory potentially accessed by functions in the
+ * &dma_fence.ops table, MUST NOT be accessed after the fence has been signalled
+ * because after that point drivers are allowed to free it.
+ *
+ * All code accessing that data via the dma-fence API (or directly, which is
+ * discouraged), MUST make sure to contain the complete access within a
+ * &dma_fence_access_begin and &dma_fence_access_end pair.
+ *
+ * Some dma-fence API handles this automatically, while other, as for example
+ * &dma_fence_driver_name and &dma_fence_timeline_name, leave that
+ * responsibility to the caller.
+ *
+ * To enable this scheme to work drivers MUST ensure a RCU grace period elapses
+ * between signalling the fence and freeing the said data.
+ *
+ */
+#define dma_fence_access_begin	rcu_read_lock
+#define dma_fence_access_end	rcu_read_unlock
 
-static inline const char *dma_fence_timeline_name(struct dma_fence *fence)
-{
-	return fence->ops->get_timeline_name(fence);
-}
+const char *dma_fence_driver_name(struct dma_fence *fence);
+const char *dma_fence_timeline_name(struct dma_fence *fence);
 
 /**
  * dma_fence_is_signaled_locked - Return an indication if the fence
-- 
2.48.0


