Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D33A13525C2
	for <lists+linux-media@lfdr.de>; Fri,  2 Apr 2021 05:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233817AbhDBDwK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 23:52:10 -0400
Received: from m15114.mail.126.com ([220.181.15.114]:58158 "EHLO
        m15114.mail.126.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233786AbhDBDwK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 23:52:10 -0400
X-Greylist: delayed 1855 seconds by postgrey-1.27 at vger.kernel.org; Thu, 01 Apr 2021 23:52:09 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=6Kim097pCo81vc2sXb
        pdlitPc6VpRrbnKVChlbFJMpA=; b=BIuE9AoUHmnIDE0Or9/Y9WXO0ZhvHoZnS1
        rj9YOCFzwDuH7G50yuOWmwSqq77CC415Tg9cfxQh9+XLc1ZLLx30DIzIbIH5Juop
        MH0unEdZlhx23xThqHpg+Kt4zdjuODwe7zV0RD6A4aO7QHyKfYRVvqF/6vBJTnVA
        vwPXPwWM4=
Received: from localhost.localdomain.localdomain (unknown [182.150.46.145])
        by smtp7 (Coremail) with SMTP id DsmowABHgnQfjWZgWTR9PQ--.23034S2;
        Fri, 02 Apr 2021 11:18:56 +0800 (CST)
From:   Qu Huang <jinsdb@126.com>
To:     alexander.deucher@amd.com, christian.koenig@amd.com,
        airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
        airlied@redhat.com, ray.huang@amd.com, Mihir.Patel@amd.com,
        nirmoy.aiemd@gmail.com
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, jinsdb@126.com
Subject: [PATCH] drm/amdgpu: Fix a potential sdma invalid access
Date:   Fri,  2 Apr 2021 11:18:47 +0800
Message-Id: <1617333527-89782-1-git-send-email-jinsdb@126.com>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: DsmowABHgnQfjWZgWTR9PQ--.23034S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrykXFW3CF1fur4fuF45Wrg_yoW8WF1DpF
        s5GFy2kr1UZw47XrWDZF4kX3s0k3Z3XFy8GF4av3ZIqw13XF98XFyrJFW3tF17XF4xursF
        qF1vk3yfu3Wj9F7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRAsqAUUUUU=
X-Originating-IP: [182.150.46.145]
X-CM-SenderInfo: pmlq2vbe6rjloofrz/1tbigQBoDlpECr--IAAAsT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Before dma_resv_lock(bo->base.resv, NULL) in amdgpu_bo_release_notify(),
the bo->base.resv lock may be held by ttm_mem_evict_first(),
and the VRAM mem will be evicted, mem region was replaced
by Gtt mem region. amdgpu_bo_release_notify() will then
hold the bo->base.resv lock, and SDMA will get an invalid
address in amdgpu_fill_buffer(), resulting in a VMFAULT
or memory corruption.

To avoid it, we have to hold bo->base.resv lock first, and
check whether the mem.mem_type is TTM_PL_VRAM.

Signed-off-by: Qu Huang <jinsdb@126.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 4b29b82..8018574 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1300,12 +1300,16 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 	if (bo->base.resv == &bo->base._resv)
 		amdgpu_amdkfd_remove_fence_on_pt_pd_bos(abo);

-	if (bo->mem.mem_type != TTM_PL_VRAM || !bo->mem.mm_node ||
-	    !(abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE))
+	if (!(abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE))
 		return;

 	dma_resv_lock(bo->base.resv, NULL);

+	if (bo->mem.mem_type != TTM_PL_VRAM || !bo->mem.mm_node) {
+		dma_resv_unlock(bo->base.resv);
+		return;
+	}
+
 	r = amdgpu_fill_buffer(abo, AMDGPU_POISON, bo->base.resv, &fence);
 	if (!WARN_ON(r)) {
 		amdgpu_bo_fence(abo, fence, false);
--
1.8.3.1

