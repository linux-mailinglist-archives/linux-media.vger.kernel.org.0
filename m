Return-Path: <linux-media+bounces-30946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49256A9AE58
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 15:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9ADA4A30EA
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 13:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902E0284665;
	Thu, 24 Apr 2025 13:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D80R/pEx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F4B27D79C;
	Thu, 24 Apr 2025 13:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745499797; cv=none; b=rpMcOYZPg6hLLGrOJMxBEVn9pwK92bcQ+Sgu7scx/7YBVt40TvDVM6q9RY8dDmCH7Z0n9Q/audGmk04efbM0FzszsF/qa/Z1rxV65DJJ338jBvFzBtT5fD399jkpdyq0T/NU8gPZmKfGlWZYtXmIZD1/uR8HVwLbvU8jcy62QZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745499797; c=relaxed/simple;
	bh=USBXckrnH4EXDRA/UJxzzOnVtw+ramkDN3MksP0nTXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p4Ulqn6uSwaX/e7eCROkm+kP82HSk7zhPPqd3Qi5Z+54I8QNX7oha7tEVNyMgIdKixgIjI7BVQLRyOxcF2NcQ35G41MGGOqxI7S/fGox5rzH+zgXZVeyEfR/yBl88sbOMKWPli090OhdBHNLs/Ee+Yrawbs8qdlTbiL0xVsSqms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D80R/pEx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 860FEC4CEEB;
	Thu, 24 Apr 2025 13:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745499796;
	bh=USBXckrnH4EXDRA/UJxzzOnVtw+ramkDN3MksP0nTXQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D80R/pExgLSr8RGT1pxOAbZY1lIfYUMaR5c2H3A3/A3AXn3+K50MfkS4OtV/N3V6z
	 GOXn0ZIAVZ5N/DYBNY3FkUbsM6zO810QMgBXenSp3drHLhEnZdY/kg3ct+lfG6LbaX
	 MmZRQ8XlOrkXRMJgkQtQob3wlo1wRG1Nnf1q1ztBNCY3EIqs7WXZq3QcPgfAp7YJL7
	 5Wvy8mPE/hsMkQJxJNWKkKSa7fIhgp7L8FnQ9D+eifbeVvxWl1FJlc5PQjsFfuVxaA
	 K8tY5jhApZru9r/6JFU9ru3qUbSPw2JjHpwABtqdj7dt8EQtRypHdglTJFtwVVoq82
	 24i857xMrskmg==
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
Subject: [PATCH 4/4] drm/nouveau: Check dma_fence in canonical way
Date: Thu, 24 Apr 2025 15:02:54 +0200
Message-ID: <20250424130254.42046-6-phasta@kernel.org>
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

In nouveau_fence_done(), a fence is checked for being signaled by
manually evaluating the base fence's bits. This can be done in a
canonical manner through dma_fence_is_signaled().

Replace the bit-check with dma_fence_is_signaled().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index fb9811938c82..d5654e26d5bc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -253,7 +253,7 @@ nouveau_fence_done(struct nouveau_fence *fence)
 	struct nouveau_channel *chan;
 	unsigned long flags;
 
-	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->base.flags))
+	if (dma_fence_is_signaled(&fence->base))
 		return true;
 
 	spin_lock_irqsave(&fctx->lock, flags);
-- 
2.48.1


