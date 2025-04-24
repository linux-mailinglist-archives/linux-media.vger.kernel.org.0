Return-Path: <linux-media+bounces-30944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B3BA9AE52
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 15:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C8BE1B80D78
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 13:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65CAD281531;
	Thu, 24 Apr 2025 13:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M8OaBxMw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E2328135F;
	Thu, 24 Apr 2025 13:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745499789; cv=none; b=OaLzRNea5z9oobWQAxZYrgsuxP1z2AuC9yQ7SlRwLuwDXZUOvbOqRwBtDpg0EHJOOAlO5PjNK7xmz3qQZDEnRHSYWISEzmIpoOFp5cWyUZuLrLi9eMfMpMFzlZ0GdfawCcBvTrtIdbNjBzG1VYW6DHG5RNjUIf97lvtT3LNu48o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745499789; c=relaxed/simple;
	bh=7HKtlHM65HuEx4XWBvP6kV1rjNjQ+ivJbYPYEkVX5fQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SrolIhka9SeRWVXT5DFJ/4S3EfUtMxPe7iHSdlE4bzQfHj6s1OTuon3RztarAVIDfS1oD2ykoJptrJDDz/ogUGfpKc34rK8Kz9PGzWHR/S9GscZmVVVIZKE9Iu5VxmJGpSs1LDy9ed3qpG2xcmGDJ2Kje8UPFfMm89NDGSr0P4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M8OaBxMw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1130C4CEE3;
	Thu, 24 Apr 2025 13:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745499789;
	bh=7HKtlHM65HuEx4XWBvP6kV1rjNjQ+ivJbYPYEkVX5fQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M8OaBxMwa5+pwS9Z9fqr7blGKVdU4MvbySsUzbZ3oIq/VUy6/gNEfW9mqIGPqcPpv
	 szTiQwGU4sNbanmGK4oVx9F71hyBgmy3VCX0gDfteossxz4wikzfyeXyofvuz8zI1Q
	 t4yJ0otnFaGQ3CY3mibzOvwABhU2P3jWvjbkLHnpIHhBEPujr5daB1tPwgVuzGDGY9
	 WUOIq+UPUkStsajJL2qrPONxq3E/UdkBflUy9OWGE1FUKI6aY4U9Y6gzSqeTVYvTOI
	 phFs8CiNMFxFrlVL2hSTTlbD5ag+ecB72/aC6Fw4a8Jcs0IxSrcwsVXHQK5ERIIxij
	 Lh98iaybaaHlQ==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 2/4] drm/nouveau: Simplify calls to nvif_event_block()
Date: Thu, 24 Apr 2025 15:02:52 +0200
Message-ID: <20250424130254.42046-4-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250424130254.42046-2-phasta@kernel.org>
References: <20250424130254.42046-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nouveau_fence_signal() returns a de-facto boolean to indicate when
nvif_event_block() shall be called.

The code can be made more compact and readable by calling
nvif_event_block() in nouveau_fence_update() directly.

Make those calls in nouveau_fence.c more canonical.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 31 +++++++++++--------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 761c174cb286..2b79bcb7da16 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -50,10 +50,10 @@ nouveau_fctx(struct nouveau_fence *fence)
 	return container_of(fence->base.lock, struct nouveau_fence_chan, lock);
 }
 
-static int
+static bool
 nouveau_fence_signal(struct nouveau_fence *fence)
 {
-	int drop = 0;
+	bool drop = false;
 
 	dma_fence_signal_locked(&fence->base);
 	list_del(&fence->head);
@@ -63,7 +63,7 @@ nouveau_fence_signal(struct nouveau_fence *fence)
 		struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
 
 		if (!--fctx->notify_ref)
-			drop = 1;
+			drop = true;
 	}
 
 	dma_fence_put(&fence->base);
@@ -125,21 +125,23 @@ nouveau_fence_context_free(struct nouveau_fence_chan *fctx)
 	kref_put(&fctx->fence_ref, nouveau_fence_context_put);
 }
 
-static int
+static void
 nouveau_fence_update(struct nouveau_channel *chan, struct nouveau_fence_chan *fctx)
 {
 	struct nouveau_fence *fence, *tmp;
-	int drop = 0;
+	bool drop = false;
 	u32 seq = fctx->read(chan);
 
 	list_for_each_entry_safe(fence, tmp, &fctx->pending, head) {
 		if ((int)(seq - fence->base.seqno) < 0)
 			break;
 
-		drop |= nouveau_fence_signal(fence);
+		if (nouveau_fence_signal(fence))
+			drop = true;
 	}
 
-	return drop;
+	if (drop)
+		nvif_event_block(&fctx->event);
 }
 
 static void
@@ -150,18 +152,13 @@ nouveau_fence_uevent_work(struct work_struct *work)
 	struct nouveau_channel *chan;
 	struct nouveau_fence *fence;
 	unsigned long flags;
-	int drop = 0;
 
 	spin_lock_irqsave(&fctx->lock, flags);
 	fence = list_first_entry_or_null(&fctx->pending, typeof(*fence), head);
 	if (fence) {
 		chan = rcu_dereference_protected(fence->channel, lockdep_is_held(&fctx->lock));
-		if (nouveau_fence_update(chan, fctx))
-			drop = 1;
+		nouveau_fence_update(chan, fctx);
 	}
-	if (drop)
-		nvif_event_block(&fctx->event);
-
 	spin_unlock_irqrestore(&fctx->lock, flags);
 }
 
@@ -241,9 +238,7 @@ nouveau_fence_emit(struct nouveau_fence *fence)
 			return -ENODEV;
 		}
 
-		if (nouveau_fence_update(chan, fctx))
-			nvif_event_block(&fctx->event);
-
+		nouveau_fence_update(chan, fctx);
 		list_add_tail(&fence->head, &fctx->pending);
 		spin_unlock_irq(&fctx->lock);
 	}
@@ -265,8 +260,8 @@ nouveau_fence_done(struct nouveau_fence *fence)
 
 		spin_lock_irqsave(&fctx->lock, flags);
 		chan = rcu_dereference_protected(fence->channel, lockdep_is_held(&fctx->lock));
-		if (chan && nouveau_fence_update(chan, fctx))
-			nvif_event_block(&fctx->event);
+		if (chan)
+			nouveau_fence_update(chan, fctx);
 		spin_unlock_irqrestore(&fctx->lock, flags);
 	}
 	return dma_fence_is_signaled(&fence->base);
-- 
2.48.1


