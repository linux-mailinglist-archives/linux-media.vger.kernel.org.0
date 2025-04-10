Return-Path: <linux-media+bounces-29904-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE16FA83EA3
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 11:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71D98443B6A
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 09:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDCE2571B9;
	Thu, 10 Apr 2025 09:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GmhViSG+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A122571B1;
	Thu, 10 Apr 2025 09:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277097; cv=none; b=F9aO9LSvEY9epQkvH2yRDe5ywAJjSs1uRhT8bS+cCXs6nXEWKlXMIxQ6ChpYe2YOsfn/kgaFagh/4iBbs+PRUTOWTodbBeyjoSAtZY/ZTHx0qgq1Y8ZKc1atQBqDuLHnFGsUb46zfnAUgGjEtLfmNhRXQQ29pVTNEBhGfE+dT88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277097; c=relaxed/simple;
	bh=fFdMV2U0ELCA71kU/Js1/s2xdWAGWoCmvbLagHCp6Ps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E3bJfY+iMYpHDWV++nsJcuAtpJosf61fvYLJVWZavPRnVuDliIg7YdB9tcO/5SJsw9XwHBn2DM/bxvkgAWuinMljGW4wmUsTyOs3uruGbw1C7qdHH07QM8jd6d6PlzhGGLGBNwxVztjPYqm6/7Lf7NotCoROSf8rDWGuZlbBQgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GmhViSG+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C6D3C4CEEA;
	Thu, 10 Apr 2025 09:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744277097;
	bh=fFdMV2U0ELCA71kU/Js1/s2xdWAGWoCmvbLagHCp6Ps=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GmhViSG+psu5bFsa1vh+rEKrjVmrud1pcWUvaM07hvbfUEK0ZH+1pQOCYEYvRbjqR
	 XrOd70Kq5VGsayWgaSW+t4nP3sUK7A9PXrMUGluOvRM1beWmjJKmj6Xf4QRubGG5Os
	 jqWNJPMMqg1LYn/ftvxwTajdA+WZQ2J8l9UPPnuSl3uYqrmWVJXbJMaWKDljrLw5fL
	 nHG6o9VREB7b96AZRbMSZNfuG+zf1zE9PtumlnXx42OVDrdRJtjgqK78VLmzXC8hk1
	 KCN6HRmJyTWdrepHbUG0zAqxKq5sTBrPAD51dD2rJyaAS3wwe0BL1tANs6UQu5AqCJ
	 X3gVlSCd9cG3Q==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 2/3] drm/nouveau: Remove surplus if-branch
Date: Thu, 10 Apr 2025 11:24:18 +0200
Message-ID: <20250410092418.135258-4-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250410092418.135258-2-phasta@kernel.org>
References: <20250410092418.135258-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nouveau_fence_done() contains an if-branch which checks for the
existence of either of two fence backend ops. Those two are the only
backend ops existing in Nouveau, however; and at least one backend ops
must be in use for the entire driver to be able to work. The if branch
is, therefore, surplus.

Remove the if-branch.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 33535987d8ed..db6f4494405c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -259,21 +259,19 @@ nouveau_fence_emit(struct nouveau_fence *fence)
 bool
 nouveau_fence_done(struct nouveau_fence *fence)
 {
-	if (fence->base.ops == &nouveau_fence_ops_legacy ||
-	    fence->base.ops == &nouveau_fence_ops_uevent) {
-		struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
-		struct nouveau_channel *chan;
-		unsigned long flags;
+	struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
+	struct nouveau_channel *chan;
+	unsigned long flags;
 
-		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->base.flags))
-			return true;
+	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->base.flags))
+		return true;
+
+	spin_lock_irqsave(&fctx->lock, flags);
+	chan = rcu_dereference_protected(fence->channel, lockdep_is_held(&fctx->lock));
+	if (chan && nouveau_fence_update(chan, fctx))
+		nvif_event_block(&fctx->event);
+	spin_unlock_irqrestore(&fctx->lock, flags);
 
-		spin_lock_irqsave(&fctx->lock, flags);
-		chan = rcu_dereference_protected(fence->channel, lockdep_is_held(&fctx->lock));
-		if (chan && nouveau_fence_update(chan, fctx))
-			nvif_event_block(&fctx->event);
-		spin_unlock_irqrestore(&fctx->lock, flags);
-	}
 	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->base.flags);
 }
 
-- 
2.48.1


