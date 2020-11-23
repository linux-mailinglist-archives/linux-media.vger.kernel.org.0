Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4012A2C0477
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 12:27:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728888AbgKWLVm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 06:21:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728858AbgKWLTg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 06:19:36 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA23AC061A4D
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 03:19:35 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id p8so18210883wrx.5
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 03:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6PNe63QSqzIOAFvdSbqBBH6uw9VqajeEy9sWGo6R4j8=;
        b=RkBlQJ+x9SNdFfBeEkr2mAFd8dPH3dHViN3an5nL1lfDEtE8Ms781sckHN9wr1zfPF
         QH4M6289hISdlts3trLSL9NjeSCocAVH3PL0PeOA6yiCAiLa3J7800lTw7SBnc/MSXij
         ljx1o4MioROT8koCwq12c3xujT9/x5l6uzBGF1rbw7/hk769ARygvSLHjpcJeJ5wHrsQ
         A371zGosGvD2MqhEADydkPWY2VRFPcgRuq6Uy3gDRky4wqWJJZ+Q0CpRWcbL68yZGbZb
         Qv6BrPxHDbcA/GKs9E5ttFN/tP2LXxOlrrfPaXp+bZuB4MzmvGSpOyD1FeCp5mDubxMZ
         Dfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6PNe63QSqzIOAFvdSbqBBH6uw9VqajeEy9sWGo6R4j8=;
        b=f3qEsJ+IMNc4XHYIv+APADw/P59ZEz7N6IeSyxlChl6spnUoCwgdtq5oTiYgdzx4b0
         lCmyUaDGpk44CnClEBOVwW9fzJ/jZdQFl95n9LxhbcgQB/0p5+MB+iYnMj5WY5qJw+R2
         etFkyhK0PDI5RNvh5upgiGWUnIgfLShJQqwwzpHymfiZt7jZ5jctPtQlGyMJKUGDEKmM
         jEYGI7dl2PKy/YlfdhttsJEpwpRy4qutlJnqVayvxRxumpyBQw3beE/QdLML3cbi8ay8
         aFxjcaW1CLJkH3M46T2doeD7EkKilLTdvGlAQDILQUtwJ2eNRbFXGDfG9wf1+tCgw8yk
         lJjw==
X-Gm-Message-State: AOAM530DkpQMTgskd0+ailLCgYiqzSPVSr9ZoP1/QZA3kU2Z2POQOqIN
        xG5kqVowBie9akZAEKnCFHquJg==
X-Google-Smtp-Source: ABdhPJwSKmJHEX1mXlW2JuUsWqIDGkeXjFRx8CpJ8HKWMw8t83ENQo6yULtw8+eKHfudo7CAaD+FQA==
X-Received: by 2002:adf:ecd0:: with SMTP id s16mr115694wro.415.1606130374503;
        Mon, 23 Nov 2020 03:19:34 -0800 (PST)
Received: from dell.default ([91.110.221.218])
        by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 03:19:33 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 09/40] drm/amd/amdgpu/gfx_v7_0: Clean-up a bunch of kernel-doc related issues
Date:   Mon, 23 Nov 2020 11:18:48 +0000
Message-Id: <20201123111919.233376-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:1590: warning: Function parameter or member 'instance' not described in 'gfx_v7_0_select_se_sh'
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:1788: warning: Excess function parameter 'se_num' description in 'gfx_v7_0_setup_rb'
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:1788: warning: Excess function parameter 'sh_per_se' description in 'gfx_v7_0_setup_rb'
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:1852: warning: Excess function parameter 'adev' description in 'DEFAULT_SH_MEM_BASES'
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2086: warning: Excess function parameter 'adev' description in 'gfx_v7_0_ring_test_ring'
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2130: warning: Function parameter or member 'ring' not described in 'gfx_v7_0_ring_emit_hdp_flush'
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2130: warning: Excess function parameter 'adev' description in 'gfx_v7_0_ring_emit_hdp_flush'
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2130: warning: Excess function parameter 'ridx' description in 'gfx_v7_0_ring_emit_hdp_flush'
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2182: warning: Function parameter or member 'ring' not described in 'gfx_v7_0_ring_emit_fence_gfx'
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2182: warning: Function parameter or member 'addr' not described in 'gfx_v7_0_ring_emit_fence_gfx'
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2182: warning: Function parameter or member 'seq' not described in 'gfx_v7_0_ring_emit_fence_gfx'
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2182: warning: Function parameter or member 'flags' not described in 'gfx_v7_0_ring_emit_fence_gfx'
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2182: warning: Excess function parameter 'adev' description in 'gfx_v7_0_ring_emit_fence_gfx'
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2182: warning: Excess function parameter 'fence' description in 'gfx_v7_0_ring_emit_fence_gfx'
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2224: warning: Function parameter or member 'ring' not described in 'gfx_v7_0_ring_emit_fence_compute'
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2224: warning: Function parameter or member 'addr' not described in 'gfx_v7_0_ring_emit_fence_compute'
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2224: warning: Function parameter or member 'seq' not described in 'gfx_v7_0_ring_emit_fence_compute'
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2224: warning: Function parameter or member 'flags' not described in 'gfx_v7_0_ring_emit_fence_compute'
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2224: warning: Excess function parameter 'adev' description in 'gfx_v7_0_ring_emit_fence_compute'
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2224: warning: Excess function parameter 'fence' description in 'gfx_v7_0_ring_emit_fence_compute'
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2260: warning: Function parameter or member 'job' not described in 'gfx_v7_0_ring_emit_ib_gfx'
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2260: warning: Function parameter or member 'flags' not described in 'gfx_v7_0_ring_emit_ib_gfx'
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2351: warning: Function parameter or member 'timeout' not described in 'gfx_v7_0_ring_test_ib'
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3244: warning: Function parameter or member 'ring' not described in 'gfx_v7_0_ring_emit_vm_flush'
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3244: warning: Function parameter or member 'vmid' not described in 'gfx_v7_0_ring_emit_vm_flush'
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3244: warning: Function parameter or member 'pd_addr' not described in 'gfx_v7_0_ring_emit_vm_flush'
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3244: warning: Excess function parameter 'adev' description in 'gfx_v7_0_ring_emit_vm_flush'

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c | 33 +++++++++++++++------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
index 04e1e92f5f3cf..f2490f915a8be 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
@@ -1580,10 +1580,10 @@ static void gfx_v7_0_tiling_mode_table_init(struct amdgpu_device *adev)
  * @adev: amdgpu_device pointer
  * @se_num: shader engine to address
  * @sh_num: sh block to address
+ * @instance: Certain registers are instanced per SE or SH.
+ *            0xffffffff means broadcast to all SEs or SHs (CIK).
  *
- * Select which SE, SH combinations to address. Certain
- * registers are instanced per SE or SH.  0xffffffff means
- * broadcast to all SEs or SHs (CIK).
+ * Select which SE, SH combinations to address.
  */
 static void gfx_v7_0_select_se_sh(struct amdgpu_device *adev,
 				  u32 se_num, u32 sh_num, u32 instance)
@@ -1779,8 +1779,6 @@ gfx_v7_0_write_harvested_raster_configs(struct amdgpu_device *adev,
  * gfx_v7_0_setup_rb - setup the RBs on the asic
  *
  * @adev: amdgpu_device pointer
- * @se_num: number of SEs (shader engines) for the asic
- * @sh_per_se: number of SH blocks per SE for the asic
  *
  * Configures per-SE/SH RB registers (CIK).
  */
@@ -1841,6 +1839,7 @@ static void gfx_v7_0_setup_rb(struct amdgpu_device *adev)
 	mutex_unlock(&adev->grbm_idx_mutex);
 }
 
+#define DEFAULT_SH_MEM_BASES	(0x6000)
 /**
  * gfx_v7_0_init_compute_vmid - gart enable
  *
@@ -1849,7 +1848,6 @@ static void gfx_v7_0_setup_rb(struct amdgpu_device *adev)
  * Initialize compute vmid sh_mem registers
  *
  */
-#define DEFAULT_SH_MEM_BASES	(0x6000)
 static void gfx_v7_0_init_compute_vmid(struct amdgpu_device *adev)
 {
 	int i;
@@ -2074,7 +2072,6 @@ static void gfx_v7_0_scratch_init(struct amdgpu_device *adev)
 /**
  * gfx_v7_0_ring_test_ring - basic gfx ring test
  *
- * @adev: amdgpu_device pointer
  * @ring: amdgpu_ring structure holding ring information
  *
  * Allocate a scratch register and write to it using the gfx ring (CIK).
@@ -2121,8 +2118,7 @@ static int gfx_v7_0_ring_test_ring(struct amdgpu_ring *ring)
 /**
  * gfx_v7_0_ring_emit_hdp - emit an hdp flush on the cp
  *
- * @adev: amdgpu_device pointer
- * @ridx: amdgpu ring index
+ * @ring: amdgpu_ring structure holding ring information
  *
  * Emits an hdp flush on the cp.
  */
@@ -2171,8 +2167,10 @@ static void gfx_v7_0_ring_emit_vgt_flush(struct amdgpu_ring *ring)
 /**
  * gfx_v7_0_ring_emit_fence_gfx - emit a fence on the gfx ring
  *
- * @adev: amdgpu_device pointer
- * @fence: amdgpu fence object
+ * @ring: amdgpu_ring structure holding ring information
+ * @addr: address
+ * @seq: sequence number
+ * @flags: fence related flags
  *
  * Emits a fence sequnce number on the gfx ring and flushes
  * GPU caches.
@@ -2212,8 +2210,10 @@ static void gfx_v7_0_ring_emit_fence_gfx(struct amdgpu_ring *ring, u64 addr,
 /**
  * gfx_v7_0_ring_emit_fence_compute - emit a fence on the compute ring
  *
- * @adev: amdgpu_device pointer
- * @fence: amdgpu fence object
+ * @ring: amdgpu_ring structure holding ring information
+ * @addr: address
+ * @seq: sequence number
+ * @flags: fence related flags
  *
  * Emits a fence sequnce number on the compute ring and flushes
  * GPU caches.
@@ -2245,7 +2245,9 @@ static void gfx_v7_0_ring_emit_fence_compute(struct amdgpu_ring *ring,
  * gfx_v7_0_ring_emit_ib - emit an IB (Indirect Buffer) on the ring
  *
  * @ring: amdgpu_ring structure holding ring information
+ * @job: job to retrive vmid from
  * @ib: amdgpu indirect buffer object
+ * @flags: options (AMDGPU_HAVE_CTX_SWITCH)
  *
  * Emits an DE (drawing engine) or CE (constant engine) IB
  * on the gfx ring.  IBs are usually generated by userspace
@@ -2342,6 +2344,7 @@ static void gfx_v7_ring_emit_cntxcntl(struct amdgpu_ring *ring, uint32_t flags)
  * gfx_v7_0_ring_test_ib - basic ring IB test
  *
  * @ring: amdgpu_ring structure holding ring information
+ * @timeout: timeout value in jiffies, or MAX_SCHEDULE_TIMEOUT
  *
  * Allocate an IB and execute it on the gfx ring (CIK).
  * Provides a basic gfx ring test to verify that IBs are working.
@@ -3234,7 +3237,9 @@ static void gfx_v7_0_ring_emit_pipeline_sync(struct amdgpu_ring *ring)
 /**
  * gfx_v7_0_ring_emit_vm_flush - cik vm flush using the CP
  *
- * @adev: amdgpu_device pointer
+ * @ring: amdgpu_ring pointer
+ * @vmid: vmid number to use
+ * @pd_addr: address
  *
  * Update the page table base and flush the VM TLB
  * using the CP (CIK).
-- 
2.25.1

