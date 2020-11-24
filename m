Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC1322C3131
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 20:49:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727147AbgKXTpu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 14:45:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727032AbgKXTob (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 14:44:31 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77575C061A52
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 11:44:30 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id t4so10608102wrr.12
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 11:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zLv2tzTUg6hRfBb4zoaAZo803fwr+tjrjxHqDKZ3aM4=;
        b=G+laA0eevQxIooEg9oZfCmtU2VNwu5hMu7kSumImnDGETx9L6pdgsV3eGfxuOjSYfc
         cV134nVQp1nliAA6eGfB32pCi7J5zRtwGczpxL4TUBQptoHhawL+yDId60mP2r/cofCf
         LjW1x7MT9RBmHjuT+eI/nmfascGL8rrR4vccPYNMc0Hgz6PxK7n/T7AaWCB0KZB89AIt
         1/+Eb4ol7k1ZhgqurMOsQufVwza6WMJ2c42MD/GaHf1tUfYvaWhZ/tkpz3X8SlHIFImo
         0jguddZTdqtFQJH2FwN/v84EHKUiL4sxVDYJtIoxzdywP3+R2HdQgku5VM6EQrsMbKDV
         xd4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zLv2tzTUg6hRfBb4zoaAZo803fwr+tjrjxHqDKZ3aM4=;
        b=Wsvxs5khVGLsgbE6Ox799CGICPJKzGoI0qhVMsXpv20xCOqOWh3iOkJSqliGpsgPDj
         aqUqzCiZN7n2HxTed+vhebSJac0JCTiVfTyqtKEG0xQ7KQhkMidb9QIGRjjMDby9vJXE
         eWiPSEyO0GbcadVXgDHZWSJnkaKlLT4giHfOKHhCMsvBqAETHdAyyhHiMN4p6BVadOW6
         W3yzou38W5kLJcSfnECDMEo4WCjhMMdKdQlDwI6tBOC3hbyllgM4HDkY2UVHi7zsWK8j
         Ff6gzvTpkbphgn63AJG1hfpAMAWCyuQa04pF4JDqC6eouXBJ9pzYUd+LfqOtzqtNYFx5
         k8gg==
X-Gm-Message-State: AOAM5338cZM7gVvhJK0qLck2zJ1bp+vYcklFh0l/l5Tcv/3gcibKd4cP
        Z30OMCHHVmVFrbXLIlTAdsQbhQ==
X-Google-Smtp-Source: ABdhPJylJmbRtVLec+J8x/2kqt9RCS1ITwppMrLKPCm5u8DQMfgiLDVVUHQpAuFJElms7PFXsH3/uA==
X-Received: by 2002:a5d:4001:: with SMTP id n1mr105944wrp.176.1606247069198;
        Tue, 24 Nov 2020 11:44:29 -0800 (PST)
Received: from dell.default ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 11:44:28 -0800 (PST)
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
Subject: [PATCH 24/40] drm/amd/amdgpu/sdma_v5_2: Provide some missing and repair other function params
Date:   Tue, 24 Nov 2020 19:38:08 +0000
Message-Id: <20201124193824.1118741-25-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:367: warning: Function parameter or member 'job' not described in 'sdma_v5_2_ring_emit_ib'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:367: warning: Function parameter or member 'flags' not described in 'sdma_v5_2_ring_emit_ib'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:429: warning: Function parameter or member 'addr' not described in 'sdma_v5_2_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:429: warning: Function parameter or member 'seq' not described in 'sdma_v5_2_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:429: warning: Function parameter or member 'flags' not described in 'sdma_v5_2_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:429: warning: Excess function parameter 'fence' description in 'sdma_v5_2_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:924: warning: Function parameter or member 'timeout' not described in 'sdma_v5_2_ring_test_ib'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1030: warning: Function parameter or member 'value' not described in 'sdma_v5_2_vm_write_pte'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1030: warning: Excess function parameter 'addr' description in 'sdma_v5_2_vm_write_pte'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1030: warning: Excess function parameter 'flags' description in 'sdma_v5_2_vm_write_pte'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1083: warning: Function parameter or member 'ring' not described in 'sdma_v5_2_ring_pad_ib'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1137: warning: Function parameter or member 'vmid' not described in 'sdma_v5_2_ring_emit_vm_flush'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1137: warning: Function parameter or member 'pd_addr' not described in 'sdma_v5_2_ring_emit_vm_flush'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1137: warning: Excess function parameter 'vm' description in 'sdma_v5_2_ring_emit_vm_flush'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1717: warning: Function parameter or member 'ib' not described in 'sdma_v5_2_emit_copy_buffer'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1717: warning: Function parameter or member 'tmz' not described in 'sdma_v5_2_emit_copy_buffer'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1717: warning: Excess function parameter 'ring' description in 'sdma_v5_2_emit_copy_buffer'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1743: warning: Function parameter or member 'ib' not described in 'sdma_v5_2_emit_fill_buffer'
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1743: warning: Excess function parameter 'ring' description in 'sdma_v5_2_emit_fill_buffer'

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
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index cb5a6f1437f81..e8736360d1a9f 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -356,7 +356,9 @@ static void sdma_v5_2_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
  * sdma_v5_2_ring_emit_ib - Schedule an IB on the DMA engine
  *
  * @ring: amdgpu ring pointer
+ * @job: job to retrive vmid from
  * @ib: IB object to schedule
+ * @flags: unused
  *
  * Schedule an IB in the DMA ring.
  */
@@ -418,7 +420,9 @@ static void sdma_v5_2_ring_emit_hdp_flush(struct amdgpu_ring *ring)
  * sdma_v5_2_ring_emit_fence - emit a fence on the DMA ring
  *
  * @ring: amdgpu ring pointer
- * @fence: amdgpu fence object
+ * @addr: address
+ * @seq: sequence number
+ * @flags: fence related flags
  *
  * Add a DMA fence packet to the ring to write
  * the fence seq number and DMA trap packet to generate
@@ -916,6 +920,7 @@ static int sdma_v5_2_ring_test_ring(struct amdgpu_ring *ring)
  * sdma_v5_2_ring_test_ib - test an IB on the DMA engine
  *
  * @ring: amdgpu_ring structure holding ring information
+ * @timeout: timeout value in jiffies, or MAX_SCHEDULE_TIMEOUT
  *
  * Test a simple IB in the DMA ring.
  * Returns 0 on success, error on failure.
@@ -1017,10 +1022,9 @@ static void sdma_v5_2_vm_copy_pte(struct amdgpu_ib *ib,
  *
  * @ib: indirect buffer to fill with commands
  * @pe: addr of the page entry
- * @addr: dst addr to write into pe
+ * @value: dst addr to write into pe
  * @count: number of page entries to update
  * @incr: increase next addr by incr bytes
- * @flags: access flags
  *
  * Update PTEs by writing them manually using sDMA.
  */
@@ -1076,6 +1080,7 @@ static void sdma_v5_2_vm_set_pte_pde(struct amdgpu_ib *ib,
  * sdma_v5_2_ring_pad_ib - pad the IB
  *
  * @ib: indirect buffer to fill with padding
+ * @ring: amdgpu_ring structure holding ring information
  *
  * Pad the IB with NOPs to a boundary multiple of 8.
  */
@@ -1127,7 +1132,8 @@ static void sdma_v5_2_ring_emit_pipeline_sync(struct amdgpu_ring *ring)
  * sdma_v5_2_ring_emit_vm_flush - vm flush using sDMA
  *
  * @ring: amdgpu_ring pointer
- * @vm: amdgpu_vm pointer
+ * @vmid: vmid number to use
+ * @pd_addr: address
  *
  * Update the page table base and flush the VM TLB
  * using sDMA.
@@ -1700,10 +1706,11 @@ static void sdma_v5_2_set_irq_funcs(struct amdgpu_device *adev)
 /**
  * sdma_v5_2_emit_copy_buffer - copy buffer using the sDMA engine
  *
- * @ring: amdgpu_ring structure holding ring information
+ * @ib: indirect buffer to copy to
  * @src_offset: src GPU address
  * @dst_offset: dst GPU address
  * @byte_count: number of bytes to xfer
+ * @tmz: if a secure copy should be used
  *
  * Copy GPU buffers using the DMA engine.
  * Used by the amdgpu ttm implementation to move pages if
@@ -1729,7 +1736,7 @@ static void sdma_v5_2_emit_copy_buffer(struct amdgpu_ib *ib,
 /**
  * sdma_v5_2_emit_fill_buffer - fill buffer using the sDMA engine
  *
- * @ring: amdgpu_ring structure holding ring information
+ * @ib: indirect buffer to fill
  * @src_data: value to write to buffer
  * @dst_offset: dst GPU address
  * @byte_count: number of bytes to xfer
-- 
2.25.1

