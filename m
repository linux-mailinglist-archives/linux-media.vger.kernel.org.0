Return-Path: <linux-media+bounces-32356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A98EAB4D34
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 09:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E78461796E9
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 07:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C686D1F1306;
	Tue, 13 May 2025 07:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Lo6R4Z4a"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1257F1E5207
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 07:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747122340; cv=none; b=i8whwoHM6gU8614eSWY90914LPxCIn7R4Exyn2piaxaQFvPUzzfwSKVYe11UZxncDMfx/JMJKZCjxf8U+fvP93cP7i56soTNmNSH5O5fN1LMdiN8xMQ0xNtZhz6Taz293XO4oFZEwCHax0im2FF10U2Op+Vb+3eNayfldMACE+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747122340; c=relaxed/simple;
	bh=i7c13Gx7ImmVCJkOmWASB6MlRH5XUlUJFmNae3cYyt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P/cv69FMy6pjVC7Lr5zodI3v4AKCR+1LE/tkK4t0ZJmcOuWkk4xAqtWX633SA3aT+1ob/XiDYMVfsVIfiE0XcLfFvkppOk+lY6BP0dkdQElQZPNucy9meFrzJZrASueZiSqzLytiY29qDi8YkAeYWYV+63v8BY2I0hqQat2eLnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Lo6R4Z4a; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=8PBpHzT0posY/8hYMZRUjLsaZmxxP91alDxR/meOvvM=; b=Lo6R4Z4aCiuwbMnwqFZfhaZOkD
	ynFukQ9OZvMHuOHo2l7GnC01nZS13biJJiFdjvVRWq6rJWNrC4bn7DLAb2J9oVPSmXfShSVAXKn3M
	5yIcjkV3EMvSMhg6RltK8/ue6cO46rUO3e9sO0qYmkFtqAJ/l4Pfnrh1p95irSeJ1a7KYqZGfBdEF
	oQOT+d/DHBG+DHgsz+DPVmNg+dBsN9+SE4xrjtZvrzFkT0cKJE71fIdvzH+yqaC4hficWDn1SVLP6
	wJAyZhBhOI16Pm3chM9SrMoLwhDh8fPFyuVjJ3ufuzehsVKg8EthQPYmGtcwXOZjqo5G1nF3AHvBX
	RpCWrPog==;
Received: from [81.79.92.254] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uEkF0-007Tui-9E; Tue, 13 May 2025 09:45:24 +0200
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
Subject: [RFC v3 01/10] dma-fence: Change signature of __dma_fence_is_later
Date: Tue, 13 May 2025 08:45:04 +0100
Message-ID: <20250513074513.81727-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250513074513.81727-1-tvrtko.ursulin@igalia.com>
References: <20250513074513.81727-1-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the goal of reducing the need for drivers to touch (and dereference)
fence->ops, we change the prototype of __dma_fence_is_later() to take
fence instead of fence->ops.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-chain.c |  2 +-
 drivers/dma-buf/sw_sync.c         |  2 +-
 drivers/gpu/drm/xe/xe_hw_fence.c  |  2 +-
 drivers/gpu/drm/xe/xe_sched_job.c | 14 ++++++++------
 include/linux/dma-fence.h         |  9 ++++-----
 5 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index 9663ba1bb6ac..90424f23fd73 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -252,7 +252,7 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
 	chain->prev_seqno = 0;
 
 	/* Try to reuse the context of the previous chain node. */
-	if (prev_chain && __dma_fence_is_later(seqno, prev->seqno, prev->ops)) {
+	if (prev_chain && __dma_fence_is_later(prev, seqno, prev->seqno)) {
 		context = prev->context;
 		chain->prev_seqno = prev->seqno;
 	} else {
diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 4f27ee93a00c..3c20f1d31cf5 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -170,7 +170,7 @@ static bool timeline_fence_signaled(struct dma_fence *fence)
 {
 	struct sync_timeline *parent = dma_fence_parent(fence);
 
-	return !__dma_fence_is_later(fence->seqno, parent->value, fence->ops);
+	return !__dma_fence_is_later(fence, fence->seqno, parent->value);
 }
 
 static void timeline_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index 0b4f12be3692..03eb8c6d1616 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -165,7 +165,7 @@ static bool xe_hw_fence_signaled(struct dma_fence *dma_fence)
 	u32 seqno = xe_map_rd(xe, &fence->seqno_map, 0, u32);
 
 	return dma_fence->error ||
-		!__dma_fence_is_later(dma_fence->seqno, seqno, dma_fence->ops);
+		!__dma_fence_is_later(dma_fence, dma_fence->seqno, seqno);
 }
 
 static bool xe_hw_fence_enable_signaling(struct dma_fence *dma_fence)
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 1905ca590965..f0a6ce610948 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -216,15 +216,17 @@ void xe_sched_job_set_error(struct xe_sched_job *job, int error)
 
 bool xe_sched_job_started(struct xe_sched_job *job)
 {
+	struct dma_fence *fence = dma_fence_chain_contained(job->fence);
 	struct xe_lrc *lrc = job->q->lrc[0];
 
-	return !__dma_fence_is_later(xe_sched_job_lrc_seqno(job),
-				     xe_lrc_start_seqno(lrc),
-				     dma_fence_chain_contained(job->fence)->ops);
+	return !__dma_fence_is_later(fence,
+				     xe_sched_job_lrc_seqno(job),
+				     xe_lrc_start_seqno(lrc));
 }
 
 bool xe_sched_job_completed(struct xe_sched_job *job)
 {
+	struct dma_fence *fence = dma_fence_chain_contained(job->fence);
 	struct xe_lrc *lrc = job->q->lrc[0];
 
 	/*
@@ -232,9 +234,9 @@ bool xe_sched_job_completed(struct xe_sched_job *job)
 	 * parallel handshake is done.
 	 */
 
-	return !__dma_fence_is_later(xe_sched_job_lrc_seqno(job),
-				     xe_lrc_seqno(lrc),
-				     dma_fence_chain_contained(job->fence)->ops);
+	return !__dma_fence_is_later(fence,
+				     xe_sched_job_lrc_seqno(job),
+				     xe_lrc_seqno(lrc));
 }
 
 void xe_sched_job_arm(struct xe_sched_job *job)
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index b12776883d14..48b5202c531d 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -441,21 +441,20 @@ dma_fence_is_signaled(struct dma_fence *fence)
 
 /**
  * __dma_fence_is_later - return if f1 is chronologically later than f2
+ * @fence: fence in whose context to do the comparison
  * @f1: the first fence's seqno
  * @f2: the second fence's seqno from the same context
- * @ops: dma_fence_ops associated with the seqno
  *
  * Returns true if f1 is chronologically later than f2. Both fences must be
  * from the same context, since a seqno is not common across contexts.
  */
-static inline bool __dma_fence_is_later(u64 f1, u64 f2,
-					const struct dma_fence_ops *ops)
+static inline bool __dma_fence_is_later(struct dma_fence *fence, u64 f1, u64 f2)
 {
 	/* This is for backward compatibility with drivers which can only handle
 	 * 32bit sequence numbers. Use a 64bit compare when the driver says to
 	 * do so.
 	 */
-	if (ops->use_64bit_seqno)
+	if (fence->ops->use_64bit_seqno)
 		return f1 > f2;
 
 	return (int)(lower_32_bits(f1) - lower_32_bits(f2)) > 0;
@@ -475,7 +474,7 @@ static inline bool dma_fence_is_later(struct dma_fence *f1,
 	if (WARN_ON(f1->context != f2->context))
 		return false;
 
-	return __dma_fence_is_later(f1->seqno, f2->seqno, f1->ops);
+	return __dma_fence_is_later(f1, f1->seqno, f2->seqno);
 }
 
 /**
-- 
2.48.0


