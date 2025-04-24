Return-Path: <linux-media+bounces-30945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DE4A9AE56
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 15:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CEAA1B80EE3
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 13:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7FB12820C8;
	Thu, 24 Apr 2025 13:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B2Lh/mpy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9F927CCCD;
	Thu, 24 Apr 2025 13:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745499793; cv=none; b=VPiutb4bhJo2ksUw0qhOEvX6r2uAgcn1vlfBU/Rtmhov6bz3zDjmd7sf3X/5YLo7GKR4fVekrKl0Inhc8Mrtx4T4tbIEICLrTtLbGABLSUTKpnqWH+KQw4AXtsQZf84NxgCChQZlFRivvkqy419BEq1nmrJ+STGt2UBYHuglvUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745499793; c=relaxed/simple;
	bh=aWijLvZAk3fD5Xw7QJX+kfKWe8iN4WqFGm8B7OBvTTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cyljh/COHKrgfZxHRwo65D8JemmE8f97FgvakehRqX1Q15+9XBbuH3QiRlhIPEg4cEsxf7kAXgd4/8ZT8kZu7PoCcubRh82OQVfhBH6FYHWT41VmswaPxzcuDZTaAA4vPxwHDdaI3vVOzzwWxEVOdbSnJ3cGUKkFJ9x3H8cL1Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B2Lh/mpy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28138C4CEE3;
	Thu, 24 Apr 2025 13:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745499793;
	bh=aWijLvZAk3fD5Xw7QJX+kfKWe8iN4WqFGm8B7OBvTTU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B2Lh/mpyg6zo+cLFVviRJDnFZi/nBDGg4DimbXpvlTQPFJiblEFLaBttf30J/tfsL
	 qAiIkN7UqUdvtJ3oviCRcQdw+aZPD74DZjw1mW7wMFZeu4cq332zYeolBw3Ni+Ts13
	 zYDMuWsBQ4oEKZ3+BCah67nZ1Pne1kWE5F9lFI0dMvRArtuDx/NHh0Eb80YYCRWoIy
	 9ntNY7IX/zvmeALASoFEz25PO3JJrgeIrAMiuNuGEIXNruZ/Mj4TiveYn5Dec5Mb7y
	 7+acEDob32ANTDERpLbBHcbgALkO2RVmCXYrih2oGEbtUOB+4SIEn4xNytpBX+rXBk
	 mEkgiMFZMc4Jg==
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
Subject: [PATCH 3/4] drm/nouveau: Simplify nouveau_fence_done()
Date: Thu, 24 Apr 2025 15:02:53 +0200
Message-ID: <20250424130254.42046-5-phasta@kernel.org>
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

nouveau_fence_done() contains an if branch that checks whether a
nouveau_fence has either of the two existing nouveau_fence backend ops,
which will always evaluate to true.

Remove the surplus check.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 2b79bcb7da16..fb9811938c82 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -249,21 +249,19 @@ nouveau_fence_emit(struct nouveau_fence *fence)
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
+	if (chan)
+		nouveau_fence_update(chan, fctx);
+	spin_unlock_irqrestore(&fctx->lock, flags);
 
-		spin_lock_irqsave(&fctx->lock, flags);
-		chan = rcu_dereference_protected(fence->channel, lockdep_is_held(&fctx->lock));
-		if (chan)
-			nouveau_fence_update(chan, fctx);
-		spin_unlock_irqrestore(&fctx->lock, flags);
-	}
 	return dma_fence_is_signaled(&fence->base);
 }
 
-- 
2.48.1


