Return-Path: <linux-media+bounces-33104-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83010AC0A99
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 13:26:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D27A4A2C2F
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 11:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D632728A3EA;
	Thu, 22 May 2025 11:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mDIbxyiZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3C72B9A9;
	Thu, 22 May 2025 11:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747913177; cv=none; b=PNi7XuyDmLrMElDZAWJyVntY7iZbiH8LHNizi7Svyu2P3hoA65USIdqTn/i9iU9AcjEHlO3kDaeLc7xMmKR9e+Y50AveYCxg/F2KgRkARbVBGHH5mswX9iPHqa/Y7H2ysFoEykRznuHioVi8ROxySkqiVxYnZnVu5uR9VX0IrdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747913177; c=relaxed/simple;
	bh=CnZnWn6ntljL6kA9ykEa/hUWKpXAg+RdkVBAJ2M5hTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GdxSHru4vbyhipC+jP9Kd/ZJigW18u6sNbltvjLNv5pCu8tuBXFsS3i0nOZhbMwed0L9EL0OMnNlXK+qx4ayzUbLp9BuzECbqKOScB2TwEmnLJvoRgRPxwvneRPjwMR5Ly4q18RRyDh3Hhh1lC9SvoDaxkRDWfKN8voUulLR1Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mDIbxyiZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E439BC4CEEF;
	Thu, 22 May 2025 11:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747913175;
	bh=CnZnWn6ntljL6kA9ykEa/hUWKpXAg+RdkVBAJ2M5hTI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mDIbxyiZ1DuwuWTn5m+GtIuBKKrDSncUcCv5+/5YJsLQx6jJi6AebZYQ3PDWRSUZd
	 MaRkFdQ+/ycZU7T5S8DFx3riDaPvyn+ed+htnbjzinpdEOxb6wueOZWCD394VTz48U
	 9xXNfpaBOhAudPsQUakdYu92cJzrM/yNjsNIQks80x1zRhVockqrg5jaXeWt/MPZpV
	 DygL45FsPInJWapUWh1lx2nIkgutOF3afqgbJQU0LH45pegjY4vXFXThU7OK2s2Sy/
	 XApLrPEBbBKZNwhIBKviGzcoZhMtISGQZQawXVlI1p9gJ0xYdsLaMbqbdMe8hi1U1c
	 qoO6p8J7O1FbA==
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
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 2/2] drm/nouveau: Don't signal when killing the fence context
Date: Thu, 22 May 2025 13:25:41 +0200
Message-ID: <20250522112540.161411-3-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522112540.161411-2-phasta@kernel.org>
References: <20250522112540.161411-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dma_fence_is_signaled_locked(), which is used in
nouveau_fence_context_kill(), can signal fences below the surface
through a callback.

There is neither need for nor use in doing that when killing a fence
context.

Replace dma_fence_is_signaled_locked() with __dma_fence_is_signaled(), a
function which only checks, never signals.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index d5654e26d5bc..993b3dcb5db0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -88,7 +88,7 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
 
 	spin_lock_irqsave(&fctx->lock, flags);
 	list_for_each_entry_safe(fence, tmp, &fctx->pending, head) {
-		if (error && !dma_fence_is_signaled_locked(&fence->base))
+		if (error && !__dma_fence_is_signaled(&fence->base))
 			dma_fence_set_error(&fence->base, error);
 
 		if (nouveau_fence_signal(fence))
-- 
2.49.0


