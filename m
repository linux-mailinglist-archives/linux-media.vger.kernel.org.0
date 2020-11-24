Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 517562C310C
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 20:45:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727119AbgKXToj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 14:44:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727010AbgKXToa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 14:44:30 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18A16C061A4E
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 11:44:29 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id p8so23563932wrx.5
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 11:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R/UQVzp5t/843EY6ppRphRVAVupyrmwyb92XCyM15Wo=;
        b=aqz8p6m1y8u9iRDM8778MHzwp/jjK8uddIAnjuWOPOOtnkCw6y5wUG66aTJIjoU1Ql
         +8QAgzunBNCv0ij3cGOu2EBQzxSGW9nvcrxgQ5PMGbou0MeahIRa1UarsDdZmoK89qrB
         PnRxu9HJoB1PsExnvE2pzdH4o30i18gSyyCMANsXJmT9sUMwkNx5RrPKvfHPQfjf4h8A
         SEhzf6w0MCffigcFHB0jA63C9A3wINcgiAxi1OjF8f6hvFwk49l1I7HvhqAhuWVc16jl
         q2xgwJgrVsyYtK1EO9azsg3NB8+ZfIPO7cbAwOUQVLQ8ngfv8ckiQepqRqoidg9JKMrO
         GFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R/UQVzp5t/843EY6ppRphRVAVupyrmwyb92XCyM15Wo=;
        b=dkPzDW4P4p93M39pmrG/hXUFtdSUwTcpT0grmJTDx6FdzuY33qPv52aU+BxNN2EEgM
         myZKR3ZgxYRX72GYbiSJAgYBiBVhUwxb9JWDN7sy832drzrp2QApivLwcdc2vDoMD7Rz
         rnJrajE927oyBzL7ndnqlq0PvRZ6j9nPk5QootadXOW+EBimcGkctyQW2aqQbo4POk9x
         /vsiC2pCaPvB8KatkKpTJ/GR80APjiVBWTa+QFq+XoIuhspEPAWAwXPTptYNxHVDkdRD
         Opf4+CzAC0tSHZakAqED/qbQH9pHCO6F+BPqVg4ZGIC0R6w3hVdJCtSrlYMt8AfVV9/d
         Z0ag==
X-Gm-Message-State: AOAM533KgS9DrS8fpYqCSMOpKS5KaS7rPiS7ITC96dNUiokZGE1AYIfr
        Mqa5RvW9B/SCu0SNnAepw2FilQ==
X-Google-Smtp-Source: ABdhPJyNvL8AI6lQpfzWAv3VHW+2TI5kNAXcBCmBQvN5oBRLWs48IHIbDu6CgSFyLCvkjvEbYarrlA==
X-Received: by 2002:adf:df8e:: with SMTP id z14mr84931wrl.406.1606247067758;
        Tue, 24 Nov 2020 11:44:27 -0800 (PST)
Received: from dell.default ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 11:44:27 -0800 (PST)
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
Subject: [PATCH 23/40] drm/amd/amdgpu/sdma_v5_0: Provide some missing and repair other function params
Date:   Tue, 24 Nov 2020 19:38:07 +0000
Message-Id: <20201124193824.1118741-24-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124193824.1118741-1-lee.jones@linaro.org>
References: <20201124193824.1118741-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:403: warning: Function parameter or member 'job' not described in 'sdma_v5_0_ring_emit_ib'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:403: warning: Function parameter or member 'flags' not described in 'sdma_v5_0_ring_emit_ib'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:480: warning: Function parameter or member 'addr' not described in 'sdma_v5_0_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:480: warning: Function parameter or member 'seq' not described in 'sdma_v5_0_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:480: warning: Function parameter or member 'flags' not described in 'sdma_v5_0_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:480: warning: Excess function parameter 'fence' description in 'sdma_v5_0_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:967: warning: Function parameter or member 'timeout' not described in 'sdma_v5_0_ring_test_ib'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:1074: warning: Function parameter or member 'value' not described in 'sdma_v5_0_vm_write_pte'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:1074: warning: Excess function parameter 'addr' description in 'sdma_v5_0_vm_write_pte'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:1074: warning: Excess function parameter 'flags' description in 'sdma_v5_0_vm_write_pte'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:1126: warning: Function parameter or member 'ring' not described in 'sdma_v5_0_ring_pad_ib'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:1180: warning: Function parameter or member 'vmid' not described in 'sdma_v5_0_ring_emit_vm_flush'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:1180: warning: Function parameter or member 'pd_addr' not described in 'sdma_v5_0_ring_emit_vm_flush'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:1180: warning: Excess function parameter 'vm' description in 'sdma_v5_0_ring_emit_vm_flush'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:1703: warning: Function parameter or member 'ib' not described in 'sdma_v5_0_emit_copy_buffer'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:1703: warning: Function parameter or member 'tmz' not described in 'sdma_v5_0_emit_copy_buffer'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:1703: warning: Excess function parameter 'ring' description in 'sdma_v5_0_emit_copy_buffer'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:1729: warning: Function parameter or member 'ib' not described in 'sdma_v5_0_emit_fill_buffer'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:1729: warning: Excess function parameter 'ring' description in 'sdma_v5_0_emit_fill_buffer'

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
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
index 9c72b95b74639..5180a52a79a54 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -392,7 +392,9 @@ static void sdma_v5_0_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
  * sdma_v5_0_ring_emit_ib - Schedule an IB on the DMA engine
  *
  * @ring: amdgpu ring pointer
+ * @job: job to retrive vmid from
  * @ib: IB object to schedule
+ * @flags: unused
  *
  * Schedule an IB in the DMA ring (NAVI10).
  */
@@ -469,7 +471,9 @@ static void sdma_v5_0_ring_emit_hdp_flush(struct amdgpu_ring *ring)
  * sdma_v5_0_ring_emit_fence - emit a fence on the DMA ring
  *
  * @ring: amdgpu ring pointer
- * @fence: amdgpu fence object
+ * @addr: address
+ * @seq: sequence number
+ * @flags: fence related flags
  *
  * Add a DMA fence packet to the ring to write
  * the fence seq number and DMA trap packet to generate
@@ -959,6 +963,7 @@ static int sdma_v5_0_ring_test_ring(struct amdgpu_ring *ring)
  * sdma_v5_0_ring_test_ib - test an IB on the DMA engine
  *
  * @ring: amdgpu_ring structure holding ring information
+ * @timeout: timeout value in jiffies, or MAX_SCHEDULE_TIMEOUT
  *
  * Test a simple IB in the DMA ring (NAVI10).
  * Returns 0 on success, error on failure.
@@ -1061,10 +1066,9 @@ static void sdma_v5_0_vm_copy_pte(struct amdgpu_ib *ib,
  *
  * @ib: indirect buffer to fill with commands
  * @pe: addr of the page entry
- * @addr: dst addr to write into pe
+ * @value: dst addr to write into pe
  * @count: number of page entries to update
  * @incr: increase next addr by incr bytes
- * @flags: access flags
  *
  * Update PTEs by writing them manually using sDMA (NAVI10).
  */
@@ -1118,6 +1122,7 @@ static void sdma_v5_0_vm_set_pte_pde(struct amdgpu_ib *ib,
 
 /**
  * sdma_v5_0_ring_pad_ib - pad the IB
+ * @ring: amdgpu_ring structure holding ring information
  * @ib: indirect buffer to fill with padding
  *
  * Pad the IB with NOPs to a boundary multiple of 8.
@@ -1170,7 +1175,8 @@ static void sdma_v5_0_ring_emit_pipeline_sync(struct amdgpu_ring *ring)
  * sdma_v5_0_ring_emit_vm_flush - vm flush using sDMA
  *
  * @ring: amdgpu_ring pointer
- * @vm: amdgpu_vm pointer
+ * @vmid: vmid number to use
+ * @pd_addr: address
  *
  * Update the page table base and flush the VM TLB
  * using sDMA (NAVI10).
@@ -1686,10 +1692,11 @@ static void sdma_v5_0_set_irq_funcs(struct amdgpu_device *adev)
 /**
  * sdma_v5_0_emit_copy_buffer - copy buffer using the sDMA engine
  *
- * @ring: amdgpu_ring structure holding ring information
+ * @ib: indirect buffer to copy to
  * @src_offset: src GPU address
  * @dst_offset: dst GPU address
  * @byte_count: number of bytes to xfer
+ * @tmz: if a secure copy should be used
  *
  * Copy GPU buffers using the DMA engine (NAVI10).
  * Used by the amdgpu ttm implementation to move pages if
@@ -1715,7 +1722,7 @@ static void sdma_v5_0_emit_copy_buffer(struct amdgpu_ib *ib,
 /**
  * sdma_v5_0_emit_fill_buffer - fill buffer using the sDMA engine
  *
- * @ring: amdgpu_ring structure holding ring information
+ * @ib: indirect buffer to fill
  * @src_data: value to write to buffer
  * @dst_offset: dst GPU address
  * @byte_count: number of bytes to xfer
-- 
2.25.1

