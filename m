Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E5F31EDF33
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 10:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbgFDIMu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 04:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727781AbgFDIMr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 04:12:47 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8651DC03E96D
        for <linux-media@vger.kernel.org>; Thu,  4 Jun 2020 01:12:47 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id u26so6243059wmn.1
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2020 01:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r5PRcG/JtprEwCOUf2/ZPMLqKS9RbW1APrGVc2im3Nw=;
        b=dPeG6VwrGWYvNwNN0ZEMIw4vWjkVci2qTgMSxope6UETE3fRl01e8viI9oFa4083Jj
         DdYccEo90yhy8XH5cdnxNbrh1jbM/izjkui8sSYKCs2y4PK9kM6I2sbEqQBA/eIPT+Ca
         9IeXeC1lYJxLhEUT92aKE6kgkpD4NJkeUxG+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r5PRcG/JtprEwCOUf2/ZPMLqKS9RbW1APrGVc2im3Nw=;
        b=Xnx570tYZSdiHl4hXm+u1p1dfC2MAg6z22IyVvdO5PuzmYDuSfPPnDFmGfCGKOQKpH
         D4Pn3twGAPvPhkRfKy2WdOzvu0axc01HIaLHR/Og15juMSUpwf8Ijr3FYtvYjb/HI9l0
         A2o0jkGtmv18thgvIQySd8OSwKOzw5lZPc/r9CQ6kQ8eKSzp9qtj5L8aQbT3MW+wF9jT
         4Whki60L00IHpbKC1WfOkl9Pd5AdIF7gIgjZBUNYQr8B/1K1scaDkaJBAiTx/hBa+TPm
         vXUabiWG6ygevFauD5zCX14gVAEAPgMdWDgUDnoiY2BlMSAPK55t0SVyE2UiBZjD4elI
         7GLQ==
X-Gm-Message-State: AOAM5323TvrivD16jXTT9uy6Af7YuZSHCNy6XCPQeF6a3ds7PhmnOQ9u
        yPCvbIIjEAe4bVMheYqHE1hQgA==
X-Google-Smtp-Source: ABdhPJxlvHiwLUKpMc/fibX83rHdeLrkjFY5wrTostf2iwbBSmbJPCuso4jxxSuY+d7sEL6BpjrzbQ==
X-Received: by 2002:a1c:7305:: with SMTP id d5mr2952331wmb.85.1591258366300;
        Thu, 04 Jun 2020 01:12:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id f11sm6873305wrj.2.2020.06.04.01.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 01:12:45 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-rdma@vger.kernel.org,
        amd-gfx@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH 11/18] drm/amdgpu: s/GFP_KERNEL/GFP_ATOMIC in scheduler code
Date:   Thu,  4 Jun 2020 10:12:17 +0200
Message-Id: <20200604081224.863494-12-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

My dma-fence lockdep annotations caught an inversion because we
allocate memory where we really shouldn't:

	kmem_cache_alloc+0x2b/0x6d0
	amdgpu_fence_emit+0x30/0x330 [amdgpu]
	amdgpu_ib_schedule+0x306/0x550 [amdgpu]
	amdgpu_job_run+0x10f/0x260 [amdgpu]
	drm_sched_main+0x1b9/0x490 [gpu_sched]
	kthread+0x12e/0x150

Trouble right now is that lockdep only validates against GFP_FS, which
would be good enough for shrinkers. But for mmu_notifiers we actually
need !GFP_ATOMIC, since they can be called from any page laundering,
even if GFP_NOFS or GFP_NOIO are set.

I guess we should improve the lockdep annotations for
fs_reclaim_acquire/release.

Ofc real fix is to properly preallocate this fence and stuff it into
the amdgpu job structure. But GFP_ATOMIC gets the lockdep splat out of
the way.

v2: Two more allocations in scheduler paths.

Frist one:

	__kmalloc+0x58/0x720
	amdgpu_vmid_grab+0x100/0xca0 [amdgpu]
	amdgpu_job_dependency+0xf9/0x120 [amdgpu]
	drm_sched_entity_pop_job+0x3f/0x440 [gpu_sched]
	drm_sched_main+0xf9/0x490 [gpu_sched]

Second one:

	kmem_cache_alloc+0x2b/0x6d0
	amdgpu_sync_fence+0x7e/0x110 [amdgpu]
	amdgpu_vmid_grab+0x86b/0xca0 [amdgpu]
	amdgpu_job_dependency+0xf9/0x120 [amdgpu]
	drm_sched_entity_pop_job+0x3f/0x440 [gpu_sched]
	drm_sched_main+0xf9/0x490 [gpu_sched]

Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-rdma@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c   | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index d878fe7fee51..055b47241bb1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -143,7 +143,7 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f,
 	uint32_t seq;
 	int r;
 
-	fence = kmem_cache_alloc(amdgpu_fence_slab, GFP_KERNEL);
+	fence = kmem_cache_alloc(amdgpu_fence_slab, GFP_ATOMIC);
 	if (fence == NULL)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
index fe92dcd94d4a..fdcd6659f5ad 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
@@ -208,7 +208,7 @@ static int amdgpu_vmid_grab_idle(struct amdgpu_vm *vm,
 	if (ring->vmid_wait && !dma_fence_is_signaled(ring->vmid_wait))
 		return amdgpu_sync_fence(sync, ring->vmid_wait, false);
 
-	fences = kmalloc_array(sizeof(void *), id_mgr->num_ids, GFP_KERNEL);
+	fences = kmalloc_array(sizeof(void *), id_mgr->num_ids, GFP_ATOMIC);
 	if (!fences)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index b87ca171986a..330476cc0c86 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -168,7 +168,7 @@ int amdgpu_sync_fence(struct amdgpu_sync *sync, struct dma_fence *f,
 	if (amdgpu_sync_add_later(sync, f, explicit))
 		return 0;
 
-	e = kmem_cache_alloc(amdgpu_sync_slab, GFP_KERNEL);
+	e = kmem_cache_alloc(amdgpu_sync_slab, GFP_ATOMIC);
 	if (!e)
 		return -ENOMEM;
 
-- 
2.26.2

