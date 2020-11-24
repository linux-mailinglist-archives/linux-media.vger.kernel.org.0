Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0B7E2C3116
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 20:45:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727387AbgKXTpK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 14:45:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727046AbgKXTod (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 14:44:33 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6331C08E85F
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 11:44:31 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id 64so10129120wra.11
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 11:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uVkIB1YxHcZNrW38Tx+txcMTHXQZd6e/lftZRJDs9f0=;
        b=okAWJ55hHArGH+gudCDhObEguxG2EjpeWCNfuNR50FJ4Z3ZcLrgiklY5dr5HJ8Vm3T
         9HlyrLQM6k5NkxGu4vtlQBIswHfbXMzHStxiJ3RL2Y9l3ty/O8W4lVuj1d8DL0oKd9nd
         6W5/BwBsbBBeJplGMWjexo6yBp3rtQr3jr9Titg5CbgOX9y0R1ePJF6rQjPWTuOupASk
         BULuSwz67nSOIOo9cKoVx15j/xMOfSFgsJ3zzhRbR3k6Y6SQ10VsFR8CHtFoSygqRHEp
         dinbBiODvirdgIZQ9aJMaq/ssAfRREM7t1abSI4Lkh4uGn8LHiMaz23bQZwkt6rOB/1k
         RsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uVkIB1YxHcZNrW38Tx+txcMTHXQZd6e/lftZRJDs9f0=;
        b=F+mDwavrTd/jrrgdECNIeBtsmhj79Y0FNgiYby8xcT5jHdNPExdlx9mEIM+6nIuukQ
         EcjUgqBAPdkXQXdjcqwxbHGfYVbt8s/A9G6yqpBZtz65lsisgIWWI1lyr2LxbsDA8iZd
         MHGMNWgDHefQZWBYl0wtjaxkyFbo/y0vxXJWnpfDwMrBauZ6sJeiOzNOubsCpPQ07kDX
         6t8eInmyRByAS/lIXlK79+VkgppDlsJqQEbIU2TebUeYjMM84EDQ4qTz5/voeRRb/oEi
         pN4mOQZFmOx8GSjB2J+L8L5cP4kJls1lOOnNdbjySmH+euabwoUPFFTuvShE8O222DsD
         NCLg==
X-Gm-Message-State: AOAM531ljAcz7zYDD2q4wdWhkaD0GmuB26N7VidoKcM9z2Hg/tWGcCmD
        7rENcCT5NdCIPEh5nxcgwjfcJg==
X-Google-Smtp-Source: ABdhPJzFkzOs4jTHWKOArl4hEEW3smkvTZHYQG6ENXa9HZPVNb3xdH2vPlkL6b9NYJyBbuao9J8v3w==
X-Received: by 2002:adf:9b98:: with SMTP id d24mr78208wrc.17.1606247070542;
        Tue, 24 Nov 2020 11:44:30 -0800 (PST)
Received: from dell.default ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 11:44:29 -0800 (PST)
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
Subject: [PATCH 25/40] drm/amd/amdgpu/amdgpu_vce: Provide some missing and repair other function params
Date:   Tue, 24 Nov 2020 19:38:09 +0000
Message-Id: <20201124193824.1118741-26-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:97: warning: Function parameter or member 'size' not described in 'amdgpu_vce_sw_init'
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:441: warning: Function parameter or member 'bo' not described in 'amdgpu_vce_get_create_msg'
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:441: warning: Excess function parameter 'adev' description in 'amdgpu_vce_get_create_msg'
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:521: warning: Function parameter or member 'direct' not described in 'amdgpu_vce_get_destroy_msg'
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:521: warning: Excess function parameter 'adev' description in 'amdgpu_vce_get_destroy_msg'
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:588: warning: Function parameter or member 'ib_idx' not described in 'amdgpu_vce_validate_bo'
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:636: warning: Function parameter or member 'ib_idx' not described in 'amdgpu_vce_cs_reloc'
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:636: warning: Function parameter or member 'index' not described in 'amdgpu_vce_cs_reloc'
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:720: warning: Function parameter or member 'ib_idx' not described in 'amdgpu_vce_ring_parse_cs'
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:956: warning: Function parameter or member 'ib_idx' not described in 'amdgpu_vce_ring_parse_cs_vm'
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:1050: warning: Function parameter or member 'job' not described in 'amdgpu_vce_ring_emit_ib'
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:1050: warning: Function parameter or member 'flags' not described in 'amdgpu_vce_ring_emit_ib'
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:1066: warning: Function parameter or member 'addr' not described in 'amdgpu_vce_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:1066: warning: Function parameter or member 'seq' not described in 'amdgpu_vce_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:1066: warning: Function parameter or member 'flags' not described in 'amdgpu_vce_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:1066: warning: Excess function parameter 'fence' description in 'amdgpu_vce_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:1122: warning: Function parameter or member 'timeout' not described in 'amdgpu_vce_ring_test_ib'

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
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
index ecaa2d7483b20..1d8db318b0758 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
@@ -90,6 +90,7 @@ static int amdgpu_vce_get_destroy_msg(struct amdgpu_ring *ring, uint32_t handle,
  * amdgpu_vce_init - allocate memory, load vce firmware
  *
  * @adev: amdgpu_device pointer
+ * @size: size for the new BO
  *
  * First step to get VCE online, allocate memory and load the firmware
  */
@@ -428,9 +429,9 @@ void amdgpu_vce_free_handles(struct amdgpu_device *adev, struct drm_file *filp)
 /**
  * amdgpu_vce_get_create_msg - generate a VCE create msg
  *
- * @adev: amdgpu_device pointer
  * @ring: ring we should submit the msg to
  * @handle: VCE session handle to use
+ * @bo: amdgpu object for which we query the offset
  * @fence: optional fence to return
  *
  * Open up a stream for HW test
@@ -509,9 +510,9 @@ static int amdgpu_vce_get_create_msg(struct amdgpu_ring *ring, uint32_t handle,
 /**
  * amdgpu_vce_get_destroy_msg - generate a VCE destroy msg
  *
- * @adev: amdgpu_device pointer
  * @ring: ring we should submit the msg to
  * @handle: VCE session handle to use
+ * @direct: direct or delayed pool
  * @fence: optional fence to return
  *
  * Close up a stream for HW test or if userspace failed to do so
@@ -576,6 +577,7 @@ static int amdgpu_vce_get_destroy_msg(struct amdgpu_ring *ring, uint32_t handle,
  * amdgpu_vce_cs_validate_bo - make sure not to cross 4GB boundary
  *
  * @p: parser context
+ * @ib_idx: indirect buffer to use
  * @lo: address of lower dword
  * @hi: address of higher dword
  * @size: minimum size
@@ -625,9 +627,11 @@ static int amdgpu_vce_validate_bo(struct amdgpu_cs_parser *p, uint32_t ib_idx,
  * amdgpu_vce_cs_reloc - command submission relocation
  *
  * @p: parser context
+ * @ib_idx: indirect buffer to use
  * @lo: address of lower dword
  * @hi: address of higher dword
  * @size: minimum size
+ * @index: bs/fb index
  *
  * Patch relocation inside command stream with real buffer address
  */
@@ -714,7 +718,7 @@ static int amdgpu_vce_validate_handle(struct amdgpu_cs_parser *p,
  * amdgpu_vce_cs_parse - parse and validate the command stream
  *
  * @p: parser context
- *
+ * @ib_idx: indirect buffer to use
  */
 int amdgpu_vce_ring_parse_cs(struct amdgpu_cs_parser *p, uint32_t ib_idx)
 {
@@ -950,7 +954,7 @@ int amdgpu_vce_ring_parse_cs(struct amdgpu_cs_parser *p, uint32_t ib_idx)
  * amdgpu_vce_cs_parse_vm - parse the command stream in VM mode
  *
  * @p: parser context
- *
+ * @ib_idx: indirect buffer to use
  */
 int amdgpu_vce_ring_parse_cs_vm(struct amdgpu_cs_parser *p, uint32_t ib_idx)
 {
@@ -1040,7 +1044,9 @@ int amdgpu_vce_ring_parse_cs_vm(struct amdgpu_cs_parser *p, uint32_t ib_idx)
  * amdgpu_vce_ring_emit_ib - execute indirect buffer
  *
  * @ring: engine to use
+ * @job: job to retrive vmid from
  * @ib: the IB to execute
+ * @flags: unused
  *
  */
 void amdgpu_vce_ring_emit_ib(struct amdgpu_ring *ring,
@@ -1058,7 +1064,9 @@ void amdgpu_vce_ring_emit_ib(struct amdgpu_ring *ring,
  * amdgpu_vce_ring_emit_fence - add a fence command to the ring
  *
  * @ring: engine to use
- * @fence: the fence
+ * @addr: address
+ * @seq: sequence number
+ * @flags: fence related flags
  *
  */
 void amdgpu_vce_ring_emit_fence(struct amdgpu_ring *ring, u64 addr, u64 seq,
@@ -1116,6 +1124,7 @@ int amdgpu_vce_ring_test_ring(struct amdgpu_ring *ring)
  * amdgpu_vce_ring_test_ib - test if VCE IBs are working
  *
  * @ring: the engine to test on
+ * @timeout: timeout value in jiffies, or MAX_SCHEDULE_TIMEOUT
  *
  */
 int amdgpu_vce_ring_test_ib(struct amdgpu_ring *ring, long timeout)
-- 
2.25.1

