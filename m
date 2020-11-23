Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F172A2C043F
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 12:26:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728852AbgKWLTf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 06:19:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728848AbgKWLTe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 06:19:34 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 838DCC061A4D
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 03:19:34 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id l1so18172155wrb.9
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 03:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wuoHjkSuaTmEWAC5wBJbYvKG9ftbec5HzD4t8NHscL0=;
        b=Q8/F5dkv4HHgJAblxBG31tsXQ9e4Y1SvpMMk9ptk+QHDVSiYCvAPXSmfvSkut0Vb2T
         FbSE/FcTesIoOgShRcjPdSI0R/TlXnou23f0nDG3aSfIsh5FQm8f2OR97Tx04NZJj07b
         fT+koqDmkCl9c01yYEYGWS2pPQK3RCPINQp3s5S8DZWyoLSogz5AsVqD5g3koTgEuud1
         MrUoEe1R5xhWOLLgwf72/YnglY7op0GSZOCf+mJtL0HtoDXIpscciledSLJsOX3sHzdQ
         BLrGPIYbbd8S9vjvRdCbOCjbkRCgK9y3F0NTK+OxOYA1B1Zix/JcNfD3ZcJKh5SdOl7q
         xjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wuoHjkSuaTmEWAC5wBJbYvKG9ftbec5HzD4t8NHscL0=;
        b=P/0phUqcaMNS4ooL38g/gvO739RhP/h8g675Xg5I84cAeD/tqthvBYjMOK3+ss5hWk
         PWjPE0U9YIYPk49MXGcz38tULXLG89Hmupn9khK9fkS4TtkQvGakkpFQRZp4NQW50yK0
         WXNnIjmNdiOUy98j70sAdeXgnNY7CsenqXPwII4MIs+viGpQvaOlETDt4Gjk48Hn/Da6
         G5b/zSr03j7rjPMNp8n+uHGsItaFmv7stysgPUEuCfrlVAZtEs6954XOHBiyDIDx/JP8
         fH2hlKNeyd5DbAABAZXJJKhcmxdjMJ5gFHYdMUVS1xR0ZKeDADg7cqWb+Z2zpsxfY7eS
         mxXQ==
X-Gm-Message-State: AOAM533mtMYWlBabMUi1cT2Yea0JhH+QoDrhjdEz4jaAzhQ8YgKlmvnS
        RSnXv14aDTJPozG5C7P5luSovA==
X-Google-Smtp-Source: ABdhPJy6wybSwhfnJSxyMtRzl6BIQMAvE+2CXdAuCKYhgXw6g6aqYrUlSKFAlKmyPOuMlXN/4AytRQ==
X-Received: by 2002:adf:f441:: with SMTP id f1mr30639986wrp.225.1606130373264;
        Mon, 23 Nov 2020 03:19:33 -0800 (PST)
Received: from dell.default ([91.110.221.218])
        by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 03:19:32 -0800 (PST)
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
Subject: [PATCH 08/40] drm/amd/amdgpu/cik_sdma: Supply some missing function param descriptions
Date:   Mon, 23 Nov 2020 11:18:47 +0000
Message-Id: <20201123111919.233376-9-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/cik_sdma.c:226: warning: Function parameter or member 'job' not described in 'cik_sdma_ring_emit_ib'
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c:226: warning: Function parameter or member 'flags' not described in 'cik_sdma_ring_emit_ib'
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c:278: warning: Function parameter or member 'addr' not described in 'cik_sdma_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c:278: warning: Function parameter or member 'seq' not described in 'cik_sdma_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c:278: warning: Function parameter or member 'flags' not described in 'cik_sdma_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c:278: warning: Excess function parameter 'fence' description in 'cik_sdma_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c:663: warning: Function parameter or member 'timeout' not described in 'cik_sdma_ring_test_ib'
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c:808: warning: Function parameter or member 'ring' not described in 'cik_sdma_ring_pad_ib'
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c:859: warning: Function parameter or member 'vmid' not described in 'cik_sdma_ring_emit_vm_flush'
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c:859: warning: Function parameter or member 'pd_addr' not described in 'cik_sdma_ring_emit_vm_flush'
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c:859: warning: Excess function parameter 'vm' description in 'cik_sdma_ring_emit_vm_flush'
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c:1315: warning: Function parameter or member 'ib' not described in 'cik_sdma_emit_copy_buffer'
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c:1315: warning: Function parameter or member 'tmz' not described in 'cik_sdma_emit_copy_buffer'
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c:1315: warning: Excess function parameter 'ring' description in 'cik_sdma_emit_copy_buffer'
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c:1339: warning: Function parameter or member 'ib' not described in 'cik_sdma_emit_fill_buffer'
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c:1339: warning: Excess function parameter 'ring' description in 'cik_sdma_emit_fill_buffer'

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
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
index 1a6494ea50912..f1e9966e7244e 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
@@ -215,7 +215,9 @@ static void cik_sdma_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
  * cik_sdma_ring_emit_ib - Schedule an IB on the DMA engine
  *
  * @ring: amdgpu ring pointer
+ * @job: job to retrive vmid from
  * @ib: IB object to schedule
+ * @flags: unused
  *
  * Schedule an IB in the DMA ring (CIK).
  */
@@ -267,6 +269,8 @@ static void cik_sdma_ring_emit_hdp_flush(struct amdgpu_ring *ring)
  * cik_sdma_ring_emit_fence - emit a fence on the DMA ring
  *
  * @ring: amdgpu ring pointer
+ * @addr: address
+ * @seq: sequence number
  * @fence: amdgpu fence object
  *
  * Add a DMA fence packet to the ring to write
@@ -655,6 +659,7 @@ static int cik_sdma_ring_test_ring(struct amdgpu_ring *ring)
  * cik_sdma_ring_test_ib - test an IB on the DMA engine
  *
  * @ring: amdgpu_ring structure holding ring information
+ * @timeout: timeout value in jiffies, or MAX_SCHEDULE_TIMEOUT
  *
  * Test a simple IB in the DMA ring (CIK).
  * Returns 0 on success, error on failure.
@@ -801,6 +806,7 @@ static void cik_sdma_vm_set_pte_pde(struct amdgpu_ib *ib, uint64_t pe,
 /**
  * cik_sdma_vm_pad_ib - pad the IB to the required number of dw
  *
+ * @ring: amdgpu_ring structure holding ring information
  * @ib: indirect buffer to fill with padding
  *
  */
@@ -849,7 +855,8 @@ static void cik_sdma_ring_emit_pipeline_sync(struct amdgpu_ring *ring)
  * cik_sdma_ring_emit_vm_flush - cik vm flush using sDMA
  *
  * @ring: amdgpu_ring pointer
- * @vm: amdgpu_vm pointer
+ * @vmid: vmid number to use
+ * @pd_addr: address
  *
  * Update the page table base and flush the VM TLB
  * using sDMA (CIK).
@@ -1298,10 +1305,11 @@ static void cik_sdma_set_irq_funcs(struct amdgpu_device *adev)
 /**
  * cik_sdma_emit_copy_buffer - copy buffer using the sDMA engine
  *
- * @ring: amdgpu_ring structure holding ring information
+ * @ib: indirect buffer to copy to
  * @src_offset: src GPU address
  * @dst_offset: dst GPU address
  * @byte_count: number of bytes to xfer
+ * @tmz: unused
  *
  * Copy GPU buffers using the DMA engine (CIK).
  * Used by the amdgpu ttm implementation to move pages if
@@ -1325,7 +1333,7 @@ static void cik_sdma_emit_copy_buffer(struct amdgpu_ib *ib,
 /**
  * cik_sdma_emit_fill_buffer - fill buffer using the sDMA engine
  *
- * @ring: amdgpu_ring structure holding ring information
+ * @ib: indirect buffer to fill
  * @src_data: value to write to buffer
  * @dst_offset: dst GPU address
  * @byte_count: number of bytes to xfer
-- 
2.25.1

