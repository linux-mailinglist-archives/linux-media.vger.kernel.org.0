Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 562412C3132
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 20:49:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727513AbgKXTpv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 14:45:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726991AbgKXTo1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 14:44:27 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93E52C08C5F2
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 11:44:26 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id g14so8354914wrm.13
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 11:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9NW0MDrAw37SsOvIJSRvh6ImxSmAwP/Asfge8kUE5i0=;
        b=IFCyF/6o5vNgTBeN2bKtqP4+PAOGU+zf+DfPyxPrfFwBBrci3JpZ3T5AD6SSBjGTkW
         BfC6tWgb0GrxhNDxFpCkPG38BjKSm4AY3LUiBSYdCNSl/rvIG2vsvgohVeHN8ol1FtRj
         sJIHmOoE6ba5MsvxQu7cLfJ3fkwU6KVFljyYrLcLPzSqshEg++8MD5/cWAWcOL5FX5ZI
         W1MrEShmL6+kbj9iQXzGmDeqIOVfu9Z5aaJJSHCf5Ks0W6m4CRRWpPAjQTOjxI8YpL+W
         hG1HhEgS5cRCFpNil6/g+96mWe/odlfqJje4tsxJ4nUXeIoZeAMuCX8YbrMon2vlsE0i
         Abvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9NW0MDrAw37SsOvIJSRvh6ImxSmAwP/Asfge8kUE5i0=;
        b=t7hefuE6RGC+GeUcZBzAw3kUd0EIgf76EKjvJuGwV+VUM5iWfxutjz8oVTnJfTqsUe
         lQz2JpeuO1nXxhXROSMnBOq7Le5zuj0270BiQlTAb5ZOfyup/xqfeGB2ikxVUOVCEbMk
         oiPEGVXd8K7pEj6/5zHmXpzp/u5cHaP/XXOzHB745qCfI6ITKaWTu1yBA8CY1pJge7aZ
         j36fStpM0HMzzgBNVJB8UyxSYBGahFHVKZpMSHs+XSTEOgqkF4a4xhVM17KDMRR0NX2/
         G1Z8C/ooM258bAbT3KV4AF1OLIYMGu8VUqsET4Si+HZVdCT9FwWBCSNTzd5pYRf0WWSL
         mqWg==
X-Gm-Message-State: AOAM531tlTi+oQ/q9Ee3HQmJzOz8u+WRDUKJUibt1TS9uEj8gfwaSRvn
        vWFK/GpzSNonFkbJ8owRzyr21Q==
X-Google-Smtp-Source: ABdhPJxj+JkpZ3el5PvriuNtF1e3LBMw/iuEbOLrEyf/j75ZG01IxwZ3n8D6a4SddPZhXtFXthwlyA==
X-Received: by 2002:adf:f9c4:: with SMTP id w4mr123276wrr.64.1606247065329;
        Tue, 24 Nov 2020 11:44:25 -0800 (PST)
Received: from dell.default ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 11:44:24 -0800 (PST)
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
Subject: [PATCH 21/40] drm/amd/amdgpu/sdma_v4_0: Repair a bunch of kernel-doc problems
Date:   Tue, 24 Nov 2020 19:38:05 +0000
Message-Id: <20201124193824.1118741-22-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:848: warning: Function parameter or member 'job' not described in 'sdma_v4_0_ring_emit_ib'
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:848: warning: Function parameter or member 'flags' not described in 'sdma_v4_0_ring_emit_ib'
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:923: warning: Function parameter or member 'addr' not described in 'sdma_v4_0_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:923: warning: Function parameter or member 'seq' not described in 'sdma_v4_0_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:923: warning: Function parameter or member 'flags' not described in 'sdma_v4_0_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:923: warning: Excess function parameter 'fence' description in 'sdma_v4_0_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:1117: warning: Function parameter or member 'ring' not described in 'sdma_v4_0_rb_cntl'
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:1117: warning: Function parameter or member 'rb_cntl' not described in 'sdma_v4_0_rb_cntl'
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:1581: warning: Function parameter or member 'timeout' not described in 'sdma_v4_0_ring_test_ib'
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:1682: warning: Function parameter or member 'value' not described in 'sdma_v4_0_vm_write_pte'
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:1682: warning: Excess function parameter 'addr' description in 'sdma_v4_0_vm_write_pte'
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:1682: warning: Excess function parameter 'flags' description in 'sdma_v4_0_vm_write_pte'
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:1734: warning: Function parameter or member 'ring' not described in 'sdma_v4_0_ring_pad_ib'
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:1782: warning: Function parameter or member 'vmid' not described in 'sdma_v4_0_ring_emit_vm_flush'
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:1782: warning: Function parameter or member 'pd_addr' not described in 'sdma_v4_0_ring_emit_vm_flush'
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:1782: warning: Excess function parameter 'vm' description in 'sdma_v4_0_ring_emit_vm_flush'
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:2508: warning: Function parameter or member 'ib' not described in 'sdma_v4_0_emit_copy_buffer'
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:2508: warning: Function parameter or member 'tmz' not described in 'sdma_v4_0_emit_copy_buffer'
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:2508: warning: Excess function parameter 'ring' description in 'sdma_v4_0_emit_copy_buffer'
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:2534: warning: Function parameter or member 'ib' not described in 'sdma_v4_0_emit_fill_buffer'
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:2534: warning: Excess function parameter 'ring' description in 'sdma_v4_0_emit_fill_buffer'

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
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index dc74ca2aa8926..512efb31cc9fe 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -837,7 +837,9 @@ static void sdma_v4_0_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
  * sdma_v4_0_ring_emit_ib - Schedule an IB on the DMA engine
  *
  * @ring: amdgpu ring pointer
+ * @job: job to retrive vmid from
  * @ib: IB object to schedule
+ * @flags: unused
  *
  * Schedule an IB in the DMA ring (VEGA10).
  */
@@ -912,7 +914,9 @@ static void sdma_v4_0_ring_emit_hdp_flush(struct amdgpu_ring *ring)
  * sdma_v4_0_ring_emit_fence - emit a fence on the DMA ring
  *
  * @ring: amdgpu ring pointer
- * @fence: amdgpu fence object
+ * @addr: address
+ * @seq: sequence number
+ * @flags: fence related flags
  *
  * Add a DMA fence packet to the ring to write
  * the fence seq number and DMA trap packet to generate
@@ -1110,7 +1114,7 @@ static void sdma_v4_0_enable(struct amdgpu_device *adev, bool enable)
 	}
 }
 
-/**
+/*
  * sdma_v4_0_rb_cntl - get parameters for rb_cntl
  */
 static uint32_t sdma_v4_0_rb_cntl(struct amdgpu_ring *ring, uint32_t rb_cntl)
@@ -1573,6 +1577,7 @@ static int sdma_v4_0_ring_test_ring(struct amdgpu_ring *ring)
  * sdma_v4_0_ring_test_ib - test an IB on the DMA engine
  *
  * @ring: amdgpu_ring structure holding ring information
+ * @timeout: timeout value in jiffies, or MAX_SCHEDULE_TIMEOUT
  *
  * Test a simple IB in the DMA ring (VEGA10).
  * Returns 0 on success, error on failure.
@@ -1669,10 +1674,9 @@ static void sdma_v4_0_vm_copy_pte(struct amdgpu_ib *ib,
  *
  * @ib: indirect buffer to fill with commands
  * @pe: addr of the page entry
- * @addr: dst addr to write into pe
+ * @value: dst addr to write into pe
  * @count: number of page entries to update
  * @incr: increase next addr by incr bytes
- * @flags: access flags
  *
  * Update PTEs by writing them manually using sDMA (VEGA10).
  */
@@ -1727,8 +1731,8 @@ static void sdma_v4_0_vm_set_pte_pde(struct amdgpu_ib *ib,
 /**
  * sdma_v4_0_ring_pad_ib - pad the IB to the required number of dw
  *
+ * @ring: amdgpu_ring structure holding ring information
  * @ib: indirect buffer to fill with padding
- *
  */
 static void sdma_v4_0_ring_pad_ib(struct amdgpu_ring *ring, struct amdgpu_ib *ib)
 {
@@ -1772,7 +1776,8 @@ static void sdma_v4_0_ring_emit_pipeline_sync(struct amdgpu_ring *ring)
  * sdma_v4_0_ring_emit_vm_flush - vm flush using sDMA
  *
  * @ring: amdgpu_ring pointer
- * @vm: amdgpu_vm pointer
+ * @vmid: vmid number to use
+ * @pd_addr: address
  *
  * Update the page table base and flush the VM TLB
  * using sDMA (VEGA10).
@@ -2491,10 +2496,11 @@ static void sdma_v4_0_set_irq_funcs(struct amdgpu_device *adev)
 /**
  * sdma_v4_0_emit_copy_buffer - copy buffer using the sDMA engine
  *
- * @ring: amdgpu_ring structure holding ring information
+ * @ib: indirect buffer to copy to
  * @src_offset: src GPU address
  * @dst_offset: dst GPU address
  * @byte_count: number of bytes to xfer
+ * @tmz: if a secure copy should be used
  *
  * Copy GPU buffers using the DMA engine (VEGA10/12).
  * Used by the amdgpu ttm implementation to move pages if
@@ -2520,7 +2526,7 @@ static void sdma_v4_0_emit_copy_buffer(struct amdgpu_ib *ib,
 /**
  * sdma_v4_0_emit_fill_buffer - fill buffer using the sDMA engine
  *
- * @ring: amdgpu_ring structure holding ring information
+ * @ib: indirect buffer to copy to
  * @src_data: value to write to buffer
  * @dst_offset: dst GPU address
  * @byte_count: number of bytes to xfer
-- 
2.25.1

