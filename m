Return-Path: <linux-media+bounces-47761-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEC8C89FC3
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 14:22:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8C3B63565F8
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 13:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1CB632A3C0;
	Wed, 26 Nov 2025 13:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ixu2iZTZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B9E2FFDDC;
	Wed, 26 Nov 2025 13:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764163241; cv=none; b=uBluhHIgtrRNoUjoAFfBR1ZSHw+Ck7c8ZFrZGR0EF0qp3BsD4Z+q77vln15MrznQe0HwRbK6ibB1eO3l1kZu6KFf3hDYz7wwJFJJw4s4Lo/fpVNjm4VD4A1A9Ck56HHIisAqsGYk7LnMPMotv/fNH/A1FGg3FK77GlDIH6gMTqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764163241; c=relaxed/simple;
	bh=2pw/MJl6LY/oCnTL3+ZydHGGLHEVdvEQCODhNg8b1NQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D4mhyYrru2md7p8Xlmy3oR14trE6HDxKeKIH7FoJu7QCLvVEFVfwNor3OdPTEZDcbqI5uQyQ0NeFIq+0e0tALrsGeTCcsztWfgIj8IgxShz7JkEFlgG+OvjAeET21jGYhrykZtj3E5PUf/tmztnHqF4Y0Ed5/MuzoBxFJVZ+4tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ixu2iZTZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 732D8C116B1;
	Wed, 26 Nov 2025 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764163240;
	bh=2pw/MJl6LY/oCnTL3+ZydHGGLHEVdvEQCODhNg8b1NQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ixu2iZTZtYLH17YMkWe3wgu1khWIu1Btj2ZXZ0yppvuSfVrDVJwz4hvsSE5lbhvLv
	 v+ExMAHWV1q4rJG+OCiWwImm3OoF+GHOxZCug5HdXMdNdSxwXRx+cQJ3rHZMTZ/vLH
	 2nWKlIQOPYQfdFZ3Wu8eot2tUTBqKV7TKLo+zR2DwReVr051qui5adYQ12uI9mEjmM
	 8CcZyLymsWhgqA7HdvfILFC+ahuAbLzJLvxgL1mlD1MUhHZUMNCf/hHgiqmZEIe+Io
	 gEuLpALwLvhJStMxBEKR4CYPvoexnFADl4gwHHolqjWk7HyVtuXg3BuMihjZi8waxF
	 Ww+QKUEf7OKaw==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Huang Rui <ray.huang@amd.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 6/6] dma-buf/dma-fence: Remove return code of signaling-functions
Date: Wed, 26 Nov 2025 14:19:15 +0100
Message-ID: <20251126131914.149445-8-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251126131914.149445-2-phasta@kernel.org>
References: <20251126131914.149445-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All functions used for signaling a fence return an error code whose sole
purpose is to tell whether a fence was already signaled.

This is racy and has been used by almost no party in the kernel, and the
few users have been removed in preceding cleanup commits.

Turn all signaling-functions into void-functions.

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/dma-buf/dma-fence.c | 40 ++++++++++---------------------------
 include/linux/dma-fence.h   |  9 ++++-----
 2 files changed, 14 insertions(+), 35 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 25117a906846..bed8d0c27217 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -360,11 +360,8 @@ void __dma_fence_might_wait(void)
  *
  * Unlike dma_fence_signal_timestamp(), this function must be called with
  * &dma_fence.lock held.
- *
- * Returns 0 on success and a negative error value when @fence has been
- * signalled already.
  */
-int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
+void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 				      ktime_t timestamp)
 {
 	struct dma_fence_cb *cur, *tmp;
@@ -373,7 +370,7 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 	lockdep_assert_held(fence->lock);
 
 	if (unlikely(dma_fence_test_signaled_flag(fence)))
-		return -EINVAL;
+		return;
 
 	/* Stash the cb_list before replacing it with the timestamp */
 	list_replace(&fence->cb_list, &cb_list);
@@ -386,8 +383,6 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 		INIT_LIST_HEAD(&cur->node);
 		cur->func(fence, cur);
 	}
-
-	return 0;
 }
 EXPORT_SYMBOL(dma_fence_signal_timestamp_locked);
 
@@ -402,23 +397,17 @@ EXPORT_SYMBOL(dma_fence_signal_timestamp_locked);
  * can only go from the unsignaled to the signaled state and not back, it will
  * only be effective the first time. Set the timestamp provided as the fence
  * signal timestamp.
- *
- * Returns 0 on success and a negative error value when @fence has been
- * signalled already.
  */
-int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp)
+void dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp)
 {
 	unsigned long flags;
-	int ret;
 
 	if (WARN_ON(!fence))
-		return -EINVAL;
+		return;
 
 	spin_lock_irqsave(fence->lock, flags);
-	ret = dma_fence_signal_timestamp_locked(fence, timestamp);
+	dma_fence_signal_timestamp_locked(fence, timestamp);
 	spin_unlock_irqrestore(fence->lock, flags);
-
-	return ret;
 }
 EXPORT_SYMBOL(dma_fence_signal_timestamp);
 
@@ -434,13 +423,10 @@ EXPORT_SYMBOL(dma_fence_signal_timestamp);
  *
  * Unlike dma_fence_signal(), this function must be called with &dma_fence.lock
  * held.
- *
- * Returns 0 on success and a negative error value when @fence has been
- * signalled already.
  */
-int dma_fence_signal_locked(struct dma_fence *fence)
+void dma_fence_signal_locked(struct dma_fence *fence)
 {
-	return dma_fence_signal_timestamp_locked(fence, ktime_get());
+	dma_fence_signal_timestamp_locked(fence, ktime_get());
 }
 EXPORT_SYMBOL(dma_fence_signal_locked);
 
@@ -453,28 +439,22 @@ EXPORT_SYMBOL(dma_fence_signal_locked);
  * dma_fence_add_callback(). Can be called multiple times, but since a fence
  * can only go from the unsignaled to the signaled state and not back, it will
  * only be effective the first time.
- *
- * Returns 0 on success and a negative error value when @fence has been
- * signalled already.
  */
-int dma_fence_signal(struct dma_fence *fence)
+void dma_fence_signal(struct dma_fence *fence)
 {
 	unsigned long flags;
-	int ret;
 	bool tmp;
 
 	if (WARN_ON(!fence))
-		return -EINVAL;
+		return;
 
 	tmp = dma_fence_begin_signalling();
 
 	spin_lock_irqsave(fence->lock, flags);
-	ret = dma_fence_signal_timestamp_locked(fence, ktime_get());
+	dma_fence_signal_timestamp_locked(fence, ktime_get());
 	spin_unlock_irqrestore(fence->lock, flags);
 
 	dma_fence_end_signalling(tmp);
-
-	return ret;
 }
 EXPORT_SYMBOL(dma_fence_signal);
 
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 19972f5d176f..188f7641050f 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -364,11 +364,10 @@ static inline void dma_fence_end_signalling(bool cookie) {}
 static inline void __dma_fence_might_wait(void) {}
 #endif
 
-int dma_fence_signal(struct dma_fence *fence);
-int dma_fence_signal_locked(struct dma_fence *fence);
-int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
-int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
-				      ktime_t timestamp);
+void dma_fence_signal(struct dma_fence *fence);
+void dma_fence_signal_locked(struct dma_fence *fence);
+void dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
+void dma_fence_signal_timestamp_locked(struct dma_fence *fence, ktime_t timestamp);
 signed long dma_fence_default_wait(struct dma_fence *fence,
 				   bool intr, signed long timeout);
 int dma_fence_add_callback(struct dma_fence *fence,
-- 
2.49.0


