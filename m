Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6FD2C3137
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 20:49:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727850AbgKXTqN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 14:46:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726915AbgKXToV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 14:44:21 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85B51C061A4D
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 11:44:21 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id e7so6012702wrv.6
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 11:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SRL9lLS7p/gz4Z4Wr7b5LHim3G2zyPAROtlDIp3v0L0=;
        b=mBBzIPUC8jYBVAFELwIVGecNKMGKNmTdEf5VLOVi/USB5oC/0uv7xqgQ3odzATq7To
         loz2B18WqpG0JZrQsyq9cY4uX8LgUBrL2S+pjAcfRh2ij0rbqnIet/uNEk2bMR0Qke1h
         ddtV0hSlaJ5uLc5Am99pu72TVxmMyMEcVdR78gcGD0O/CVl2lZmVhYONDV0SLo5CCmHM
         /ltFvo9Pc6QoWY+o5wuY1Iw+fCQItGfpOMtRFVwm0yXYfd6le4e83/YEzkcqNVnBheC4
         IEz0sh8CJV1omFIZ441FM8j4yxmakPhBeBpo8B1BPlatxL8n9HP2fjWEBTWuH14Xq8Tg
         GhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SRL9lLS7p/gz4Z4Wr7b5LHim3G2zyPAROtlDIp3v0L0=;
        b=gyQalllbs0oUrdY3+CKrAe/YER3ycrd+bpCMfRAooBSH6f1YkJJxQCfD5wvUJC4/ld
         7QgOShzz3rz3dYI2EQMcQcN18Ram8nHr3eh76lOd7L6KeHO8IEJ6CHYXV3HdNTGrnKXb
         9yRrt1NkaWCYhYc3rEWpTmUHf5S4BEJXR4otBIGA7293Sjb69SB3A0+qboak9y77x76m
         xRHUN4ylmOJ5gmcmXIl4niZjFl7umIH7qTeihLtXrDW5XfzcunEoJakmqECe89Z2I6ZT
         W2NmrjQuZTUZioCKDIRGSquBmtGBC2qXL2wtdHAsibv0fXjIZ1hLenW1MyXdd2Z8K42v
         WAtg==
X-Gm-Message-State: AOAM532LNmzJvXklQV3eDYn3jCpID7NOh/+J9Ofmj+MM+hHEPvAqy4+V
        va0GUAsX1GfZ4Ah6ISJg+3DI4g==
X-Google-Smtp-Source: ABdhPJw8207IW9wX+bkrQpyEy+0pF/L1LsVht0RJudswXuq7OGihYdOPNdjsJ8GoV5MlBJiSFe8EQA==
X-Received: by 2002:adf:e60e:: with SMTP id p14mr105845wrm.188.1606247060293;
        Tue, 24 Nov 2020 11:44:20 -0800 (PST)
Received: from dell.default ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 11:44:19 -0800 (PST)
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
Subject: [PATCH 17/40] drm/amd/amdgpu/sdma_v2_4: Fix a bunch of kernel-doc function documentation issues
Date:   Tue, 24 Nov 2020 19:38:01 +0000
Message-Id: <20201124193824.1118741-18-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:254: warning: Function parameter or member 'job' not described in 'sdma_v2_4_ring_emit_ib'
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:254: warning: Function parameter or member 'flags' not described in 'sdma_v2_4_ring_emit_ib'
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:310: warning: Function parameter or member 'addr' not described in 'sdma_v2_4_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:310: warning: Function parameter or member 'seq' not described in 'sdma_v2_4_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:310: warning: Function parameter or member 'flags' not described in 'sdma_v2_4_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:310: warning: Excess function parameter 'fence' description in 'sdma_v2_4_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:598: warning: Function parameter or member 'timeout' not described in 'sdma_v2_4_ring_test_ib'
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:747: warning: Function parameter or member 'ring' not described in 'sdma_v2_4_ring_pad_ib'
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:799: warning: Function parameter or member 'vmid' not described in 'sdma_v2_4_ring_emit_vm_flush'
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:799: warning: Function parameter or member 'pd_addr' not described in 'sdma_v2_4_ring_emit_vm_flush'
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:799: warning: Excess function parameter 'vm' description in 'sdma_v2_4_ring_emit_vm_flush'
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:1205: warning: Function parameter or member 'ib' not described in 'sdma_v2_4_emit_copy_buffer'
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:1205: warning: Function parameter or member 'tmz' not described in 'sdma_v2_4_emit_copy_buffer'
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:1205: warning: Excess function parameter 'ring' description in 'sdma_v2_4_emit_copy_buffer'
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:1230: warning: Function parameter or member 'ib' not described in 'sdma_v2_4_emit_fill_buffer'
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:1230: warning: Excess function parameter 'ring' description in 'sdma_v2_4_emit_fill_buffer'

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
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
index 5f304d61999eb..22e9e4fe561d9 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
@@ -243,7 +243,9 @@ static void sdma_v2_4_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
  * sdma_v2_4_ring_emit_ib - Schedule an IB on the DMA engine
  *
  * @ring: amdgpu ring pointer
+ * @job: job to retrive vmid from
  * @ib: IB object to schedule
+ * @flags: unused
  *
  * Schedule an IB in the DMA ring (VI).
  */
@@ -299,7 +301,9 @@ static void sdma_v2_4_ring_emit_hdp_flush(struct amdgpu_ring *ring)
  * sdma_v2_4_ring_emit_fence - emit a fence on the DMA ring
  *
  * @ring: amdgpu ring pointer
- * @fence: amdgpu fence object
+ * @addr: address
+ * @seq: sequence number
+ * @flags: fence related flags
  *
  * Add a DMA fence packet to the ring to write
  * the fence seq number and DMA trap packet to generate
@@ -590,6 +594,7 @@ static int sdma_v2_4_ring_test_ring(struct amdgpu_ring *ring)
  * sdma_v2_4_ring_test_ib - test an IB on the DMA engine
  *
  * @ring: amdgpu_ring structure holding ring information
+ * @timeout: timeout value in jiffies, or MAX_SCHEDULE_TIMEOUT
  *
  * Test a simple IB in the DMA ring (VI).
  * Returns 0 on success, error on failure.
@@ -740,6 +745,7 @@ static void sdma_v2_4_vm_set_pte_pde(struct amdgpu_ib *ib, uint64_t pe,
 /**
  * sdma_v2_4_ring_pad_ib - pad the IB to the required number of dw
  *
+ * @ring: amdgpu_ring structure holding ring information
  * @ib: indirect buffer to fill with padding
  *
  */
@@ -789,7 +795,8 @@ static void sdma_v2_4_ring_emit_pipeline_sync(struct amdgpu_ring *ring)
  * sdma_v2_4_ring_emit_vm_flush - cik vm flush using sDMA
  *
  * @ring: amdgpu_ring pointer
- * @vm: amdgpu_vm pointer
+ * @vmid: vmid number to use
+ * @pd_addr: address
  *
  * Update the page table base and flush the VM TLB
  * using sDMA (VI).
@@ -1188,10 +1195,11 @@ static void sdma_v2_4_set_irq_funcs(struct amdgpu_device *adev)
 /**
  * sdma_v2_4_emit_copy_buffer - copy buffer using the sDMA engine
  *
- * @ring: amdgpu_ring structure holding ring information
+ * @ib: indirect buffer to copy to
  * @src_offset: src GPU address
  * @dst_offset: dst GPU address
  * @byte_count: number of bytes to xfer
+ * @tmz: unused
  *
  * Copy GPU buffers using the DMA engine (VI).
  * Used by the amdgpu ttm implementation to move pages if
@@ -1216,7 +1224,7 @@ static void sdma_v2_4_emit_copy_buffer(struct amdgpu_ib *ib,
 /**
  * sdma_v2_4_emit_fill_buffer - fill buffer using the sDMA engine
  *
- * @ring: amdgpu_ring structure holding ring information
+ * @ib: indirect buffer to copy to
  * @src_data: value to write to buffer
  * @dst_offset: dst GPU address
  * @byte_count: number of bytes to xfer
-- 
2.25.1

