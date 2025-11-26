Return-Path: <linux-media+bounces-47758-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80609C89FB1
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 14:21:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DA793B2E90
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 13:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313C5328B77;
	Wed, 26 Nov 2025 13:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KLN6C2Wx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843CE26D4F9;
	Wed, 26 Nov 2025 13:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764163221; cv=none; b=MElx0zux+IcdOvQaIDxIfL+GwfesWTqczbwSvdRY2Us3gLEGgWEUR6IfuRqkXUPYUMNdw4NxJQVrhqMZwiHIKmdRkIagAc2iDFWt1naMNs98IZ1SB+6bLCK78ndh+8yD4hKHVjUWQK0v1fyCJt5RBwelhrKugdeEQR5BMRXABfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764163221; c=relaxed/simple;
	bh=MN344wm2Ixu5X6Egt125oaRBPXXL6wOJJ8cpucZ04iA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hh2UnZX7KDTBPDKUmdXnLWsWbPokKm33jtmtfowR81zUvBI0n08L0GBQMvNfL65AmZbgkGExD6fd93zhj8iwe8eGGNUEoD7y1nB+MC4zaFm+VPF6kedJemu7K+C/lxPPz2S3hoRlXfVUGiy32j6HLNzO2XSXMQOwtN/hnJyZ25s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KLN6C2Wx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D077C113D0;
	Wed, 26 Nov 2025 13:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764163221;
	bh=MN344wm2Ixu5X6Egt125oaRBPXXL6wOJJ8cpucZ04iA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KLN6C2WxyaGLUphoRIvUajESUcR/xNOR+7fMO/ABWSP+mXxmpoAAqQVtXfRLExvTc
	 SHrYcieFx+oJIAIIpPsikBV7AlKohQDi3P3L9XlfRc/R0rQyx3hXhfkOxgi1TVkpGR
	 vu3+lvtFLZrjiqNSZ3DSkk7SvXT2C7IGLmlY7IAE/e2YBZHik2G2uG86XzNj3goi7q
	 oFQqGbp0EeUdB7hxktU5GTHGrf4Ugn2d6Z/GlxFvP8yVotOajkcvYV+PercoshxZqo
	 QMnkU/DrukJ2Zqfh5CB4FFW5NbPNqCHSZez5AxeD+gRPeP6pPbCCSHSjlPCt/IGkrw
	 38tlRKl6OYtRA==
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
Subject: [PATCH 3/6] drm/gpu/xe: Ignore dma_fenc_signal() return code
Date: Wed, 26 Nov 2025 14:19:12 +0100
Message-ID: <20251126131914.149445-5-phasta@kernel.org>
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

The return code of dma_fence_signal() is not really useful as there is
nothing reasonable to do if a fence was already signaled. That return
code shall be removed from the kernel.

Ignore dma_fence_signal()'s return code.

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/xe/xe_hw_fence.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index b2a0c46dfcd4..959b30dde724 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -85,7 +85,6 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
 {
 	struct xe_hw_fence *fence, *next;
 	unsigned long flags;
-	int err;
 	bool tmp;
 
 	if (XE_WARN_ON(!list_empty(&irq->pending))) {
@@ -93,9 +92,9 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
 		spin_lock_irqsave(&irq->lock, flags);
 		list_for_each_entry_safe(fence, next, &irq->pending, irq_link) {
 			list_del_init(&fence->irq_link);
-			err = dma_fence_signal_locked(&fence->dma);
+			XE_WARN_ON(dma_fence_test_signaled_flag(&fence->dma));
+			dma_fence_signal_locked(&fence->dma);
 			dma_fence_put(&fence->dma);
-			XE_WARN_ON(err);
 		}
 		spin_unlock_irqrestore(&irq->lock, flags);
 		dma_fence_end_signalling(tmp);
-- 
2.49.0


