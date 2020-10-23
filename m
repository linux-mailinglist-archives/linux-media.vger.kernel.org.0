Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14F4F296E6B
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 14:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S463625AbgJWMWq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 08:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S463615AbgJWMWp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 08:22:45 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C9F6C0613D2
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2020 05:22:45 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id h5so1574100wrv.7
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2020 05:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XJ633h4wxlhAhAPHZ0cgOENHyn8crds9DoKAsmETQdY=;
        b=NXRWzX+f27c5mLWSBbXv3t/s+HOpVOJMSfj43lC7wtwyQ0sNjxQe/5gdW8X+eqKEih
         sTztwRjWJVIq89lcKZxO3E4hXo85pvlb4M1L91yA5wLRe1PHPncXn7uGl3/ZxammiFHv
         brSTcO8r0ks2c6CuwTrumQKrDrUClLq4lH/Yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XJ633h4wxlhAhAPHZ0cgOENHyn8crds9DoKAsmETQdY=;
        b=FoVT2pr54e+dsFpF2EArvdrcu1v6AOW9MnEYrFoULFrYkPNrE1V42EiV62uR4b/PXP
         LQwp9i7C3Vce4GvQ3dewnlaJ5sbOWiJcF1GGyC1e11EQwYiQtk37pZOY6haRmuU7o9/T
         oAam8/IwUaYU3r7BKlFZJP8eAiRmD0k/P2qYJYHlm6QF+WZwZDU/bqP/jAetEO9BzPoX
         MRX8GgoYYFW0jP6tvtHrXmOX5CnhMsNnaBSy7B56lc26EG/taInl4Zq9V1dydaKqJaNH
         K9WAqvW8ReqPw26BNdRKzoEKPEAdedQd7X5dX/o8YXbipdg1LyUIyjfQp/cJJn/l6md7
         ZY/Q==
X-Gm-Message-State: AOAM533k7llNvND1WCCDfsXTuI0p0FAfBi8Ci10tvDQohFMkAlciWL91
        hgqo2PAuPH7yYnrFowrY2qpO9g==
X-Google-Smtp-Source: ABdhPJwcF2clDMCt70ko8y66TM4vU0KRO3am4a0vWyGSDSz/G+LltJn7Wxasz4t10w4zbpKLQ7S82Q==
X-Received: by 2002:a05:6000:10cd:: with SMTP id b13mr2256558wrx.4.1603455763781;
        Fri, 23 Oct 2020 05:22:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y4sm3056484wrp.74.2020.10.23.05.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 05:22:43 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH 19/65] drm/amdgpu: s/GFP_KERNEL/GFP_ATOMIC in scheduler code
Date:   Fri, 23 Oct 2020 14:21:30 +0200
Message-Id: <20201023122216.2373294-19-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
index fe2d495d08ab..09614b325b5f 100644
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
index 7521f4ab55de..2a4cde7cd746 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
@@ -208,7 +208,7 @@ static int amdgpu_vmid_grab_idle(struct amdgpu_vm *vm,
 	if (ring->vmid_wait && !dma_fence_is_signaled(ring->vmid_wait))
 		return amdgpu_sync_fence(sync, ring->vmid_wait);
 
-	fences = kmalloc_array(sizeof(void *), id_mgr->num_ids, GFP_KERNEL);
+	fences = kmalloc_array(sizeof(void *), id_mgr->num_ids, GFP_ATOMIC);
 	if (!fences)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index 8ea6c49529e7..af22b526cec9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -160,7 +160,7 @@ int amdgpu_sync_fence(struct amdgpu_sync *sync, struct dma_fence *f)
 	if (amdgpu_sync_add_later(sync, f))
 		return 0;
 
-	e = kmem_cache_alloc(amdgpu_sync_slab, GFP_KERNEL);
+	e = kmem_cache_alloc(amdgpu_sync_slab, GFP_ATOMIC);
 	if (!e)
 		return -ENOMEM;
 
-- 
2.28.0

