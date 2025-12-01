Return-Path: <linux-media+bounces-47938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9810AC96BE3
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 11:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A41033A3220
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 10:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23163064A1;
	Mon,  1 Dec 2025 10:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nriw1m3h"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC903054C5;
	Mon,  1 Dec 2025 10:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764586251; cv=none; b=TvJpKrepsSvtlthtk+pcfIFCDwwuXmg8TKvx5PHUAERD1y75ADeeoCUmT0J/C7wj8JzLSgFPfWOIBENQgS1zYZtCB/tP5BE7RcaBb1kfib1fQt66WyY8rchJfH+shYrwHdfeSBdx9ZTUXsbc47w34XIMtuOgopbTtVOmmFiM+dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764586251; c=relaxed/simple;
	bh=nBUlplmOKh9m9ly7/GmxFt4mHujNHh6V7/MgT8pL33Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LT9ysTA9N0vD8Aaf0jO/An476XHFx458XISVzAr4vms29uKG8Z+AJ/No0OFNzblL2+CsBJPCntOZC4Zf9ng8sUhlAgMh0Ju1t2MVgquo09VtwjQBz2y6Qt75Xsb2vKg5HAdAYY5L8ed5p0bzsBgTZVMqb6m7Ow6unlkPuvdm5cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nriw1m3h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B218C4CEF1;
	Mon,  1 Dec 2025 10:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764586250;
	bh=nBUlplmOKh9m9ly7/GmxFt4mHujNHh6V7/MgT8pL33Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nriw1m3ha4OTMH/XMePE3kBvGPVChGJ8qPbWQ39WnGIxGjLjrkiW7TjT+SYIlx5KI
	 gxMIADDj5J1EO+GsWRp+mXIlg5q2Yz6mcXTK9wu8RFTGHd4AtDnUXXmA5jIDDwsV+c
	 nOWkPuHG4o3RGGIB/mOLL8htcaUQATnjDvBAaeA4hiUYFKMVMQEFBC4UgXOeJ7uFAY
	 812WELGcmLbETDKsQkPI+jZT9h2aWiY1jBB+aSWrplQKrujJkdDS9UYGVJ4vqpr6rx
	 uGgxxJ2stgT6/76F+u6muDqBxIaGHOKBg6+avfXm6HZQJg2P1oACiNANVb+HoR5H/+
	 A34XQiNOAJH6Q==
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
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v2 4/8] drm/xe: Use dma_fence_check_and_signal_locked()
Date: Mon,  1 Dec 2025 11:50:08 +0100
Message-ID: <20251201105011.19386-6-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251201105011.19386-2-phasta@kernel.org>
References: <20251201105011.19386-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xe is one of the few users utilizing the return code of
dma_fence_signal() to check whether a fence had already been signaled by
someone else.

To clean up and simplify the dma_fence API, the few kernel users relying
on that behavior shall be ported to an alternative function.

Replace dma_fence_signal_locked() with
dma_fence_check_and_signal_locked().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/xe/xe_hw_fence.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index b2a0c46dfcd4..f6057456e460 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -85,7 +85,6 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
 {
 	struct xe_hw_fence *fence, *next;
 	unsigned long flags;
-	int err;
 	bool tmp;
 
 	if (XE_WARN_ON(!list_empty(&irq->pending))) {
@@ -93,9 +92,8 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
 		spin_lock_irqsave(&irq->lock, flags);
 		list_for_each_entry_safe(fence, next, &irq->pending, irq_link) {
 			list_del_init(&fence->irq_link);
-			err = dma_fence_signal_locked(&fence->dma);
+			XE_WARN_ON(dma_fence_check_and_signal_locked(&fence->dma));
 			dma_fence_put(&fence->dma);
-			XE_WARN_ON(err);
 		}
 		spin_unlock_irqrestore(&irq->lock, flags);
 		dma_fence_end_signalling(tmp);
-- 
2.49.0


