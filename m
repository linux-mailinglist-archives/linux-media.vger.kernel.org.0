Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C34902B0D30
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 20:01:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbgKLTBU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 14:01:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726588AbgKLTBT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 14:01:19 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05D8FC0613D6
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2020 11:01:18 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id 33so7149772wrl.7
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2020 11:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YpyVTU+tqYpOdqYFV7Yyz8eI/R9DV3oM3CFnCgiNLh8=;
        b=Uu4xJvWHcKPPYDjs+hyK5B7d8HMBUj/yTACwflvslo/PKGX4dzLVg8Hm2afZX0yNzn
         IDxJzY8ETvFBci87UC/2BGc2ifN3TWH8lMFAHzZndmdHXJYtrIwDZHJfeo03Y5ve8Zp5
         x+W0zF325jR3ygT6nKBe7p1NieYmy6NrEQJYOBV1zP8RQxGbVKRhZVPXTBZZ4dF/cUx2
         ugbkhIUsvKOdUYuhlxRpfXENXWUsYIDuof1ifFMSBFof/er1k5RLhLM6i+Fr2gfz9nDH
         +QBN2RD5gFdbhcqQRP9+iwAQPFFmt1TJUSDskdxnPH5ilO/6PI7BmUPxEbRVR7r19B/2
         tSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YpyVTU+tqYpOdqYFV7Yyz8eI/R9DV3oM3CFnCgiNLh8=;
        b=hnk+w2eaUFEVG993V31a/bpuz59+p8QQAL6gwwHSlMOwq2BsLfk8xOCLMqkOCN8//b
         wWG5zLnSI6yuUqdlrewjxc3sLTtzg5ZHoNlkzSaBMHCGqMHkUF8h+8x6Lg52Tep09LKw
         yA5lRRaCP6E7FdDKyCzgKIHTe9fjklQBrPVc0jriMMq612Ypb/2YqyRf6upBri+TAC/j
         C0QY/6LhIFTX0eQKq4hu8NVjVmlDnqBOGmW3c+11wHc1a4ovjumRAXGFrjEDLICUFmgR
         zkUU5C3VBHo6BQGmsjzziqIQYkfWpMYn61d6fJ3+8LrY0jZE/eUSe0Ow7OGvRrPu7+YW
         Odhw==
X-Gm-Message-State: AOAM533PWVv9BABAs1gctTkmCYZleoWAL+lp5Na3taEEnUeGg8kGgD8K
        3LyE7aTaA0cxKD5lxW3j/lkq+g==
X-Google-Smtp-Source: ABdhPJzJ40gK1ueU/SRBTE+WvtebXdGobO4IoV/Z4CnmJ6+QGNkXlX+7zClpejlFtHF5WFI8Pe9XTA==
X-Received: by 2002:a5d:6286:: with SMTP id k6mr1116225wru.216.1605207676690;
        Thu, 12 Nov 2020 11:01:16 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 11:01:16 -0800 (PST)
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
Subject: [PATCH 14/30] drm/amd/amdgpu/amdgpu_ring: Fix a bunch of function misdocumentation
Date:   Thu, 12 Nov 2020 19:00:23 +0000
Message-Id: <20201112190039.2785914-15-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:63: warning: Excess function parameter 'adev' description in 'amdgpu_ring_alloc'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:122: warning: Excess function parameter 'adev' description in 'amdgpu_ring_commit'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:167: warning: Function parameter or member 'max_dw' not described in 'amdgpu_ring_init'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:167: warning: Function parameter or member 'irq_src' not described in 'amdgpu_ring_init'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:167: warning: Function parameter or member 'irq_type' not described in 'amdgpu_ring_init'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:167: warning: Function parameter or member 'hw_prio' not described in 'amdgpu_ring_init'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:167: warning: Excess function parameter 'max_ndw' description in 'amdgpu_ring_init'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:167: warning: Excess function parameter 'nop' description in 'amdgpu_ring_init'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:285: warning: Excess function parameter 'adev' description in 'amdgpu_ring_fini'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:325: warning: Function parameter or member 'ring' not described in 'amdgpu_ring_emit_reg_write_reg_wait_helper'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:325: warning: Excess function parameter 'adev' description in 'amdgpu_ring_emit_reg_write_reg_wait_helper'

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
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
index 2697b250dc326..a23b2079696a1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
@@ -52,7 +52,6 @@
 /**
  * amdgpu_ring_alloc - allocate space on the ring buffer
  *
- * @adev: amdgpu_device pointer
  * @ring: amdgpu_ring structure holding ring information
  * @ndw: number of dwords to allocate in the ring buffer
  *
@@ -95,7 +94,8 @@ void amdgpu_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
 		amdgpu_ring_write(ring, ring->funcs->nop);
 }
 
-/** amdgpu_ring_generic_pad_ib - pad IB with NOP packets
+/**
+ * amdgpu_ring_generic_pad_ib - pad IB with NOP packets
  *
  * @ring: amdgpu_ring structure holding ring information
  * @ib: IB to add NOP packets to
@@ -112,7 +112,6 @@ void amdgpu_ring_generic_pad_ib(struct amdgpu_ring *ring, struct amdgpu_ib *ib)
  * amdgpu_ring_commit - tell the GPU to execute the new
  * commands on the ring buffer
  *
- * @adev: amdgpu_device pointer
  * @ring: amdgpu_ring structure holding ring information
  *
  * Update the wptr (write pointer) to tell the GPU to
@@ -156,7 +155,9 @@ void amdgpu_ring_undo(struct amdgpu_ring *ring)
  * @adev: amdgpu_device pointer
  * @ring: amdgpu_ring structure holding ring information
  * @max_ndw: maximum number of dw for ring alloc
- * @nop: nop packet for this ring
+ * @irq_src: interrupt source to use for this ring
+ * @irq_type: interrupt type to use for this ring
+ * @hw_prio: ring priority (NORMAL/HIGH)
  *
  * Initialize the driver information for the selected ring (all asics).
  * Returns 0 on success, error on failure.
@@ -276,7 +277,6 @@ int amdgpu_ring_init(struct amdgpu_device *adev, struct amdgpu_ring *ring,
 /**
  * amdgpu_ring_fini - tear down the driver ring struct.
  *
- * @adev: amdgpu_device pointer
  * @ring: amdgpu_ring structure holding ring information
  *
  * Tear down the driver information for the selected ring (all asics).
@@ -310,7 +310,7 @@ void amdgpu_ring_fini(struct amdgpu_ring *ring)
 /**
  * amdgpu_ring_emit_reg_write_reg_wait_helper - ring helper
  *
- * @adev: amdgpu_device pointer
+ * @ring: ring to write to
  * @reg0: register to write
  * @reg1: register to wait on
  * @ref: reference value to write/wait on
-- 
2.25.1

