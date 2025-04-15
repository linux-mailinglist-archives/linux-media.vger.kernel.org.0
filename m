Return-Path: <linux-media+bounces-30239-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8A5A89DC6
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 14:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30F9B1900773
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 12:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42BDC2973DE;
	Tue, 15 Apr 2025 12:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JfH7XsGA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908A82973AF;
	Tue, 15 Apr 2025 12:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744719553; cv=none; b=uVD3OfqY8o3KGOwg21lHDnhDs27hQXTmOw7Xf5S8DGAu5eP2HiUva41kwcWdmRn3vyhInPOx4Jc2PFhdHXEN3MKJQ/4+ddrnJcVay0j2VjK5S/dTiiWYzXjX7bzBj2sX0N+T0jrBpWP3AvMNd8yxvmjYpuBY91CHrmjDd1EuvvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744719553; c=relaxed/simple;
	bh=COvRNNF786kYGi8CjZYmPlrfxrjGI6tMrD6MDqpsP14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TaxGRDy0z9dFZU/NHRuNzdOTlFVK1Pyovc/LgubX+h+tdA0uYd1y3FD9kK54qD36w3DKqXchVNqHoxYJrrHiSIGDC50UgEUlTVOIJyXtPalzn+NkP56SyhBCvdyXhdk7uXPsmbc5AuCpU+1gYgfb20EzsjhJXLwZJS5S8EyNfSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JfH7XsGA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85831C4CEE5;
	Tue, 15 Apr 2025 12:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744719553;
	bh=COvRNNF786kYGi8CjZYmPlrfxrjGI6tMrD6MDqpsP14=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JfH7XsGAmFx5ngYrAkEkA4JmaHVN3Q3GYrKKTkmVqE+yulpJOGRvsLOkobdtTwOVS
	 uvHIr9FJU29TknobKd5XqDD+pKl3CCQPzzKUUe9E0xsAId0XOFEIshjFAAqV+XKAsR
	 6EKtG+VarvyUJxfaVtifWWOeUScsthvHRxnzEfeEKesk3Oq+jPIPQOW6HRdjnZUgAz
	 /xaDvFrFPPr+40qGFcG+ZA64FKIuLuoSkNOkeTijdo/1og3emz7Yj9GSEklD0eynkh
	 EuQes8WKSAlKkDirHIta+vQrePOjKBHqKPVkrWXfVQbG9cLTyn9DjhogJ4K7+9KRbG
	 jaLBYOACSBWcA==
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
	Philipp Stanner <phasta@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] drm/nouveau: Fix WARN_ON in nouveau_fence_context_kill()
Date: Tue, 15 Apr 2025 14:19:00 +0200
Message-ID: <20250415121900.55719-3-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250415121900.55719-2-phasta@kernel.org>
References: <20250415121900.55719-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Nouveau is mostly designed in a way that it's expected that fences only
ever get signaled through nouveau_fence_signal(). However, in at least
one other place, nouveau_fence_done(), can signal fences, too. If that
happens (race) a signaled fence remains in the pending list for a while,
until it gets removed by nouveau_fence_update().

Should nouveau_fence_context_kill() run in the meantime, this would be
a bug because the function would attempt to set an error code on an
already signaled fence.

Have nouveau_fence_context_kill() check for a fence being signaled.

Cc: <stable@vger.kernel.org> # v5.10+
Fixes: ea13e5abf807 ("drm/nouveau: signal pending fences when channel has been killed")
Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 7622587f149e..6ded8c2b6d3b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -90,7 +90,7 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
 	while (!list_empty(&fctx->pending)) {
 		fence = list_entry(fctx->pending.next, typeof(*fence), head);
 
-		if (error)
+		if (error && !dma_fence_is_signaled_locked(&fence->base))
 			dma_fence_set_error(&fence->base, error);
 
 		if (nouveau_fence_signal(fence))
-- 
2.48.1


