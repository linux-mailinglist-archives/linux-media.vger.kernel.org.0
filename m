Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 399D22C310E
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 20:45:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727162AbgKXToo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 14:44:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727081AbgKXTof (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 14:44:35 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51444C0613D6
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 11:44:34 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id r3so5249662wrt.2
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 11:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JS9uTMLaKdVfj89+NH+0EWo0gbidkJFHUn1k7XbDpfY=;
        b=rJGrv4FglC7c/+gCAzdvDDmkI2vRPWMp4d3vg/5zddv22Sw4CDGdC7A8D+W1Vy0RhG
         vMFCz4hngaqnKOv+gEtZZoEM1b0vuWRx1OQ2HJa0A1yrc3VOGtwNMEtU/8cqxlSDsiSa
         3b84G5c1h99IcCmTnm/mS3+MaD/Af0yHY9mvSqM7dhSB3xGvPgfL2pCXwjFKaw8X9RjI
         nwxsJPxl8BVHuaIebbE2X5B2ul5ZvqsCns6vhnnd3ZrJxPIjoyVQfe/ULaXUjvcnDJNu
         sr7l2QEBx9fIxKTcMvW0Fdfq9N+v/Wy5i4lBF+Mc0xkGB8XbAqoMYTgOFFjkLV14nI9J
         ivLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JS9uTMLaKdVfj89+NH+0EWo0gbidkJFHUn1k7XbDpfY=;
        b=GexYaLmfKUdSl8/I7o0Y1YXnF9BD47DgmKzeq+Ee16+eNBydfxX/CiRA4YStdKsqks
         9epQi0Dz8Gg2HO6IZTIUT9BmX4rYQl1MQR54X3R8v5HkEvwqfiNwcN73oolA3l1j4ccM
         xy5hqCaXnqfVMfAduYYFGJLNsWiiOS43EMbVdyQb59yS40PO/zdgq9xG4q+UaaVPIAiR
         naWvXFwDX2zvGB6q4Mgpuei0aCWrwTryxb2WDjCpCZoIWgwe0FKzqzW30dqXwoO3Gn4Z
         LZ80enXQ32gYyrNmDr32q0hk6oinjeQutcuG0eg7HPNKB587AHW/denfR6Evtu76pBPF
         8grQ==
X-Gm-Message-State: AOAM532o8a45iJK3gnGknXC217iL+WO9/EAKkc1nQUb9piAdpWeTTKJ9
        G2MJqfQOh2twYGXxup7KbtHVbg==
X-Google-Smtp-Source: ABdhPJzwPMb7VqgH0OjbCfq+fbL+sZ1uUf5VhzJiipD77GrlUGYnbAW5ljbutzT82IQCJRWlb+K7cg==
X-Received: by 2002:a5d:51c2:: with SMTP id n2mr94110wrv.326.1606247073070;
        Tue, 24 Nov 2020 11:44:33 -0800 (PST)
Received: from dell.default ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 11:44:32 -0800 (PST)
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
Subject: [PATCH 27/40] drm/amd/amdgpu/uvd_v7_0: Fix a bunch of kernel-doc function documentation issues
Date:   Tue, 24 Nov 2020 19:38:11 +0000
Message-Id: <20201124193824.1118741-28-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:219: warning: Function parameter or member 'bo' not described in 'uvd_v7_0_enc_get_create_msg'
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:219: warning: Excess function parameter 'adev' description in 'uvd_v7_0_enc_get_create_msg'
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:282: warning: Function parameter or member 'bo' not described in 'uvd_v7_0_enc_get_destroy_msg'
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:282: warning: Excess function parameter 'adev' description in 'uvd_v7_0_enc_get_destroy_msg'
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:339: warning: Function parameter or member 'timeout' not described in 'uvd_v7_0_enc_ring_test_ib'
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:527: warning: Function parameter or member 'handle' not described in 'uvd_v7_0_hw_init'
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:527: warning: Excess function parameter 'adev' description in 'uvd_v7_0_hw_init'
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:605: warning: Function parameter or member 'handle' not described in 'uvd_v7_0_hw_fini'
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:605: warning: Excess function parameter 'adev' description in 'uvd_v7_0_hw_fini'
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:1156: warning: Function parameter or member 'addr' not described in 'uvd_v7_0_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:1156: warning: Function parameter or member 'seq' not described in 'uvd_v7_0_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:1156: warning: Function parameter or member 'flags' not described in 'uvd_v7_0_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:1156: warning: Excess function parameter 'fence' description in 'uvd_v7_0_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:1195: warning: Function parameter or member 'addr' not described in 'uvd_v7_0_enc_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:1195: warning: Function parameter or member 'seq' not described in 'uvd_v7_0_enc_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:1195: warning: Function parameter or member 'flags' not described in 'uvd_v7_0_enc_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:1195: warning: Excess function parameter 'fence' description in 'uvd_v7_0_enc_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:1293: warning: Function parameter or member 'job' not described in 'uvd_v7_0_ring_emit_ib'
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:1293: warning: Function parameter or member 'flags' not described in 'uvd_v7_0_ring_emit_ib'
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:1324: warning: Function parameter or member 'job' not described in 'uvd_v7_0_enc_ring_emit_ib'
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:1324: warning: Function parameter or member 'flags' not described in 'uvd_v7_0_enc_ring_emit_ib'

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
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
index b44c8677ce8d5..9911ff80a6776 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
@@ -206,9 +206,9 @@ static int uvd_v7_0_enc_ring_test_ring(struct amdgpu_ring *ring)
 /**
  * uvd_v7_0_enc_get_create_msg - generate a UVD ENC create msg
  *
- * @adev: amdgpu_device pointer
  * @ring: ring we should submit the msg to
  * @handle: session handle to use
+ * @bo: amdgpu object for which we query the offset
  * @fence: optional fence to return
  *
  * Open up a stream for HW test
@@ -269,9 +269,9 @@ static int uvd_v7_0_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t handle
 /**
  * uvd_v7_0_enc_get_destroy_msg - generate a UVD ENC destroy msg
  *
- * @adev: amdgpu_device pointer
  * @ring: ring we should submit the msg to
  * @handle: session handle to use
+ * @bo: amdgpu object for which we query the offset
  * @fence: optional fence to return
  *
  * Close up a stream for HW test or if userspace failed to do so
@@ -333,6 +333,7 @@ static int uvd_v7_0_enc_get_destroy_msg(struct amdgpu_ring *ring, uint32_t handl
  * uvd_v7_0_enc_ring_test_ib - test if UVD ENC IBs are working
  *
  * @ring: the engine to test on
+ * @timeout: timeout value in jiffies, or MAX_SCHEDULE_TIMEOUT
  *
  */
 static int uvd_v7_0_enc_ring_test_ib(struct amdgpu_ring *ring, long timeout)
@@ -519,7 +520,7 @@ static int uvd_v7_0_sw_fini(void *handle)
 /**
  * uvd_v7_0_hw_init - start and test UVD block
  *
- * @adev: amdgpu_device pointer
+ * @handle: handle used to pass amdgpu_device pointer
  *
  * Initialize the hardware, boot up the VCPU and do some testing
  */
@@ -597,7 +598,7 @@ static int uvd_v7_0_hw_init(void *handle)
 /**
  * uvd_v7_0_hw_fini - stop the hardware block
  *
- * @adev: amdgpu_device pointer
+ * @handle: handle used to pass amdgpu_device pointer
  *
  * Stop the UVD block, mark ring as not ready any more
  */
@@ -1147,7 +1148,9 @@ static void uvd_v7_0_stop(struct amdgpu_device *adev)
  * uvd_v7_0_ring_emit_fence - emit an fence & trap command
  *
  * @ring: amdgpu_ring pointer
- * @fence: fence to emit
+ * @addr: address
+ * @seq: sequence number
+ * @flags: fence related flags
  *
  * Write a fence and a trap command to the ring.
  */
@@ -1186,7 +1189,9 @@ static void uvd_v7_0_ring_emit_fence(struct amdgpu_ring *ring, u64 addr, u64 seq
  * uvd_v7_0_enc_ring_emit_fence - emit an enc fence & trap command
  *
  * @ring: amdgpu_ring pointer
- * @fence: fence to emit
+ * @addr: address
+ * @seq: sequence number
+ * @flags: fence related flags
  *
  * Write enc a fence and a trap command to the ring.
  */
@@ -1282,7 +1287,9 @@ static int uvd_v7_0_ring_patch_cs_in_place(struct amdgpu_cs_parser *p,
  * uvd_v7_0_ring_emit_ib - execute indirect buffer
  *
  * @ring: amdgpu_ring pointer
+ * @job: job to retrive vmid from
  * @ib: indirect buffer to execute
+ * @flags: unused
  *
  * Write ring commands to execute the indirect buffer
  */
@@ -1313,7 +1320,9 @@ static void uvd_v7_0_ring_emit_ib(struct amdgpu_ring *ring,
  * uvd_v7_0_enc_ring_emit_ib - enc execute indirect buffer
  *
  * @ring: amdgpu_ring pointer
+ * @job: job to retrive vmid from
  * @ib: indirect buffer to execute
+ * @flags: unused
  *
  * Write enc ring commands to execute the indirect buffer
  */
-- 
2.25.1

