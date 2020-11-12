Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB2802B0D43
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 20:06:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbgKLTBE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 14:01:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726614AbgKLTBD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 14:01:03 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 463AFC0613D4
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2020 11:01:03 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id s13so6428565wmh.4
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2020 11:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mzTBD6bXnToow7y30j0wcO7cLIFklFZSxhnu2Adjze8=;
        b=R5t7wb0QJwlNzlSddPQ32LAfqqewHgBSYPv56bsw5qfjGDpNqJXAat91m8ZBaDWnzU
         z7qLGrUP+h/Gg/YDb6dObuaLLdYddhhni2yPpZQj55OpxnRzyOsgNzJG8dEH8zhJLSks
         xVNqGy7nRmLEfLGxYxbuOuoP8xA7fg9zh/sVjgPAiVryTR332MRwRsLyllFWNNuoJPoX
         Z4EsbpQhUOTY6CE/1lJVahnVCddCTkEmn0nbx4EqomedksR7JEJ6EqXudECIu/5vUJsQ
         5ev5kB6ttgvJSvlNW5nT52+VPMePRlJIs3ZdEH3rG9y2S2SM9CXNoelER4mNKSDE3JD8
         1ZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mzTBD6bXnToow7y30j0wcO7cLIFklFZSxhnu2Adjze8=;
        b=jmi8HUqquIknXmjXlAVOVAS0GSZWksyjSqYtBINi5FN3ZG5/KKVMJPX8YblzaRnojd
         OnulW0NJRlwSFwL3zBap0TPpXtQnt/4Qph0tl7au5Gvju9lpbT4pNmgJJ+YBHAj18gHl
         nJ9OzoDUhn8YfAEMMp4gCAu/Nl0n2zOIADoElvnGVofhFf5P2iq+sQQK9l8J4wuszcJX
         DtvFs3/C4aEILZX0nu7ngxTohd/ddrl7Dsjm5UobwM3gCAaT6y8NA1jAsExeEqYFESbV
         sj2BsN9v3EeNY0o0IX4/uOAme8gPjOEkfj/NPhrQAK1rHOTbiSKxtbRhNMJRlXYDB3yB
         Z3PQ==
X-Gm-Message-State: AOAM533mqDeaUcMgwkP2FgNgUIqdpqG1apy1rko2+DHAsDXc+6xQAZlV
        p9JUW2YnOPAxKPPgdyoH9/CBvw==
X-Google-Smtp-Source: ABdhPJz8r2wxy6OF4yojGOw2K3wDi0wT1gEJzasqwacViLS533DzYX6Piz/RKx/1Earq7FPRGEW8Dg==
X-Received: by 2002:a7b:c8d3:: with SMTP id f19mr1042992wml.17.1605207661941;
        Thu, 12 Nov 2020 11:01:01 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 11:01:01 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Jerome Glisse <glisse@freedesktop.org>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 07/30] drm/amd/amdgpu/amdgpu_fence: Fix some issues pertaining to function documentation
Date:   Thu, 12 Nov 2020 19:00:16 +0000
Message-Id: <20201112190039.2785914-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112190039.2785914-1-lee.jones@linaro.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:139: warning: Function parameter or member 'flags' not described in 'amdgpu_fence_emit'
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:197: warning: Function parameter or member 'timeout' not described in 'amdgpu_fence_emit_polling'
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:302: warning: Function parameter or member 't' not described in 'amdgpu_fence_fallback'
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:302: warning: Excess function parameter 'work' description in 'amdgpu_fence_fallback'
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:320: warning: Excess function parameter 'adev' description in 'amdgpu_fence_wait_empty'
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:649: warning: Function parameter or member 'f' not described in 'amdgpu_fence_enable_signaling'
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:649: warning: Excess function parameter 'fence' description in 'amdgpu_fence_enable_signaling'
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:684: warning: Function parameter or member 'f' not described in 'amdgpu_fence_release'
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:684: warning: Excess function parameter 'fence' description in 'amdgpu_fence_release'
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:749: warning: Function parameter or member 'm' not described in 'amdgpu_debugfs_gpu_recover'
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:749: warning: Function parameter or member 'data' not described in 'amdgpu_debugfs_gpu_recover'

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Jerome Glisse <glisse@freedesktop.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index fe2d495d08ab0..d56f4023ebb31 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -130,6 +130,7 @@ static u32 amdgpu_fence_read(struct amdgpu_ring *ring)
  *
  * @ring: ring the fence is associated with
  * @f: resulting fence object
+ * @flags: flags to pass into the subordinate .emit_fence() call
  *
  * Emits a fence command on the requested ring (all asics).
  * Returns 0 on success, -ENOMEM on failure.
@@ -187,6 +188,7 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f,
  *
  * @ring: ring the fence is associated with
  * @s: resulting sequence number
+ * @timeout: the timeout for waiting in usecs
  *
  * Emits a fence command on the requested ring (all asics).
  * Used For polling fence.
@@ -294,7 +296,7 @@ bool amdgpu_fence_process(struct amdgpu_ring *ring)
 /**
  * amdgpu_fence_fallback - fallback for hardware interrupts
  *
- * @work: delayed work item
+ * @t: timer context used to obtain the pointer to ring structure
  *
  * Checks for fence activity.
  */
@@ -310,7 +312,6 @@ static void amdgpu_fence_fallback(struct timer_list *t)
 /**
  * amdgpu_fence_wait_empty - wait for all fences to signal
  *
- * @adev: amdgpu device pointer
  * @ring: ring index the fence is associated with
  *
  * Wait for all fences on the requested ring to signal (all asics).
@@ -639,7 +640,7 @@ static const char *amdgpu_fence_get_timeline_name(struct dma_fence *f)
 
 /**
  * amdgpu_fence_enable_signaling - enable signalling on fence
- * @fence: fence
+ * @f: fence
  *
  * This function is called with fence_queue lock held, and adds a callback
  * to fence_queue that checks if this fence is signaled, and if so it
@@ -675,7 +676,7 @@ static void amdgpu_fence_free(struct rcu_head *rcu)
 /**
  * amdgpu_fence_release - callback that fence can be freed
  *
- * @fence: fence
+ * @f: fence
  *
  * This function is called when the reference count becomes zero.
  * It just RCU schedules freeing up the fence.
@@ -740,7 +741,7 @@ static int amdgpu_debugfs_fence_info(struct seq_file *m, void *data)
 	return 0;
 }
 
-/**
+/*
  * amdgpu_debugfs_gpu_recover - manually trigger a gpu reset & recover
  *
  * Manually trigger a gpu reset at the next fence wait.
-- 
2.25.1

