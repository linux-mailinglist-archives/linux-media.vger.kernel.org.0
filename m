Return-Path: <linux-media+bounces-29905-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E41DCA83EAA
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 11:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DD711B63F64
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 09:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A338259CB5;
	Thu, 10 Apr 2025 09:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C5snF0yF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E3E258CE5;
	Thu, 10 Apr 2025 09:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277101; cv=none; b=BY2eN0vBRmvGi7l3wPBR0FHcNW7fRY94Ne29f2vTtZc+dOacWkM3mfTJuQVzq30aAWVLSHTbYTMgAeSlAXSQ0Dzj5OY4iqgg713fwojM1paVuktv8fQtzTHte6cnQqLU9eIT/TIVsXa9svLn7wlbq0w0eBdbZkD6/Jnb1ScRlqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277101; c=relaxed/simple;
	bh=wrafJtqld39LFoxCo2SLkSTX/FGJSOSUY67ueylsNZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SPzZKb+PIopqI5/Z17+VqR+yn5XavSO2y5/d/KpyFOAR8Dz4oE5rJTNOo/fJKScfBC9fWMJx2vwJWphxbrS28mm67AMK9mxKmv8lhca06NpUHzHUCRi+3ed7/1JApwaWA1SH1XVVu6gPDnzr5919Jr7YMtKI5JrHJHAxuBIrIS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C5snF0yF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 101E6C4CEEE;
	Thu, 10 Apr 2025 09:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744277101;
	bh=wrafJtqld39LFoxCo2SLkSTX/FGJSOSUY67ueylsNZ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C5snF0yFfuHVhKnz4fzbkr7N2cym2tQmHOziG7+aRCRCWasD+/UnDEi925ipTORDP
	 Wllj9EDzOrQkfEb3kkIdAgm760RdsWjtxZuezrG57jUYgIie2Z4zE6LovCxgPMKgjD
	 mGRrykuwDjycfvx0rte/JH1LoiVw+WlhSdK7dcs19SCy9UohKXvfDGRgXwoNQTOsWe
	 gq2klvgoxFUBcS6EWbcNLxeYTv2J5wGCScq0/4HHaPDDPuaj8DHcnaVqeAInHaBcQh
	 oR+qu6Dl0/n8tt3KC/PX+a0yyjM7pt2grisyXo05OvExoyMrD/ZIZ43z/8Z/TojS1W
	 dVQqt4Guny3Bg==
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
Subject: [PATCH 3/3] drm/nouveau: Add helper to check base fence
Date: Thu, 10 Apr 2025 11:24:19 +0200
Message-ID: <20250410092418.135258-5-phasta@kernel.org>
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

Nouveau, unfortunately, checks whether a dma_fence is already siganled
at various different places with, at times, different methods. In
nouveau_fence_update() it generally signals all fences the hardware is
done with by evaluating the sequence number. That mechanism then has no
way to tell the caller nouveau_fence_done() whether a particular fence
is actually signaled, which is why the internal bits of the dma_fence
get checked.

This can be made more readable by providing a new wrapper, which can
then later be helpful to solve an unrelated bug.

Add nouveau_fence_base_is_signaled().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index db6f4494405c..0d58a81b3402 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -256,6 +256,12 @@ nouveau_fence_emit(struct nouveau_fence *fence)
 	return ret;
 }
 
+static inline bool
+nouveau_fence_base_is_signaled(struct nouveau_fence *fence)
+{
+	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->base.flags);
+}
+
 bool
 nouveau_fence_done(struct nouveau_fence *fence)
 {
@@ -263,7 +269,7 @@ nouveau_fence_done(struct nouveau_fence *fence)
 	struct nouveau_channel *chan;
 	unsigned long flags;
 
-	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->base.flags))
+	if (nouveau_fence_base_is_signaled(fence))
 		return true;
 
 	spin_lock_irqsave(&fctx->lock, flags);
@@ -272,7 +278,7 @@ nouveau_fence_done(struct nouveau_fence *fence)
 		nvif_event_block(&fctx->event);
 	spin_unlock_irqrestore(&fctx->lock, flags);
 
-	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->base.flags);
+	return nouveau_fence_base_is_signaled(fence);
 }
 
 static long
-- 
2.48.1


