Return-Path: <linux-media+bounces-30943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C126A9AE51
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 15:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AB794A289B
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 13:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D8EC27CB12;
	Thu, 24 Apr 2025 13:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OuIAF3o8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D890F1E505;
	Thu, 24 Apr 2025 13:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745499786; cv=none; b=sVQ377itSXFxGg+0voldfpLaxKbGXBKjIH4GEUl5YUHBiUkRcmuz+YsjIZw6D67TmyyxNauHmrmHb/JxuLb8uhru+/i3eNG6LM68LmjBhAYANcWwLHvB1vhvp7DvXB/a0+GKE+d1GoqUGvwJ64NLkbHmd7ZUxsaClvxXT0qdwb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745499786; c=relaxed/simple;
	bh=gPWCxoadIqVtSMMGHWG/UCPRWgUQVOp3Fj5VLuUySs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gcKcK5q394OtGcvIGdLqd3qJNfvJkamEgb9dp2MUmroBFBh0sA/YUcQZq2p793zVg0aU5nfARHTdowvrbkPa7g+MXRvmFVhryKrE6aE5Qm3ubnz+mF13x6D0SzO4l0e1EQvB2ZUPEOruE9hws/+57fkiaXLwclmOvtIBNxVB1KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OuIAF3o8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8AEC4CEE8;
	Thu, 24 Apr 2025 13:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745499786;
	bh=gPWCxoadIqVtSMMGHWG/UCPRWgUQVOp3Fj5VLuUySs4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OuIAF3o8gBJCPobsasDKKhnTUEZfbjrmskGmB99m8DrSD3D3mDxOO133zbPYAujnv
	 7lDiC+PmVM6stYqKnxsL8B2Z8CzsLaHd5inZ9D104dNrvETcyq9vITA1iYTckqDgfJ
	 2ehreIVEznOqxcGGvGkmmJO0CVPtTQ4kfV6mJdo+LA39qk0a6tyPVO/+GYX9jro44i
	 v+Z1chUrxKuroO7aPafFB1nlbNR/2khHG+Lt4KJdmlOafwlw53mgwqkhekQw/sn8Ec
	 gPJ9/fMSuQvLMF9Om0QSTusCXUku+RGU1fHSGazJMEaLmKbsRYX3RQ6V1gB6GfRAKE
	 ZYnuI+zVNC5Ow==
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
Subject: [PATCH 1/4] drm/nouveau: nouveau_fence: Standardize list iterations
Date: Thu, 24 Apr 2025 15:02:51 +0200
Message-ID: <20250424130254.42046-3-phasta@kernel.org>
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

nouveau_fence.c iterates over lists in a non-canonical way. Since the
operations done are just basic for-each-loops and list-empty checks,
they should be written in the standard form.

Use standard list operations.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 6ded8c2b6d3b..761c174cb286 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -83,13 +83,11 @@ nouveau_local_fence(struct dma_fence *fence, struct nouveau_drm *drm)
 void
 nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
 {
-	struct nouveau_fence *fence;
+	struct nouveau_fence *fence, *tmp;
 	unsigned long flags;
 
 	spin_lock_irqsave(&fctx->lock, flags);
-	while (!list_empty(&fctx->pending)) {
-		fence = list_entry(fctx->pending.next, typeof(*fence), head);
-
+	list_for_each_entry_safe(fence, tmp, &fctx->pending, head) {
 		if (error && !dma_fence_is_signaled_locked(&fence->base))
 			dma_fence_set_error(&fence->base, error);
 
@@ -130,13 +128,11 @@ nouveau_fence_context_free(struct nouveau_fence_chan *fctx)
 static int
 nouveau_fence_update(struct nouveau_channel *chan, struct nouveau_fence_chan *fctx)
 {
-	struct nouveau_fence *fence;
+	struct nouveau_fence *fence, *tmp;
 	int drop = 0;
 	u32 seq = fctx->read(chan);
 
-	while (!list_empty(&fctx->pending)) {
-		fence = list_entry(fctx->pending.next, typeof(*fence), head);
-
+	list_for_each_entry_safe(fence, tmp, &fctx->pending, head) {
 		if ((int)(seq - fence->base.seqno) < 0)
 			break;
 
@@ -151,15 +147,14 @@ nouveau_fence_uevent_work(struct work_struct *work)
 {
 	struct nouveau_fence_chan *fctx = container_of(work, struct nouveau_fence_chan,
 						       uevent_work);
+	struct nouveau_channel *chan;
+	struct nouveau_fence *fence;
 	unsigned long flags;
 	int drop = 0;
 
 	spin_lock_irqsave(&fctx->lock, flags);
-	if (!list_empty(&fctx->pending)) {
-		struct nouveau_fence *fence;
-		struct nouveau_channel *chan;
-
-		fence = list_entry(fctx->pending.next, typeof(*fence), head);
+	fence = list_first_entry_or_null(&fctx->pending, typeof(*fence), head);
+	if (fence) {
 		chan = rcu_dereference_protected(fence->channel, lockdep_is_held(&fctx->lock));
 		if (nouveau_fence_update(chan, fctx))
 			drop = 1;
-- 
2.48.1


