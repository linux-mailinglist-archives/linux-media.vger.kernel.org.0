Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A85A72C310F
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 20:45:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbgKXTop (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 14:44:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727071AbgKXToe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 14:44:34 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18B07C08E861
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 11:44:33 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id p22so80884wmg.3
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 11:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zgo7JmY69RwDnmQPFFjSp8OXJnWBR1Skr0sTGilavH0=;
        b=pnb7UGwhsivARYdn/SHGjf4AuC6faCF5kXy4Fzly4qlQmZ2cQza0Gy1TmijgwyHFXB
         FrOj3X3mGmcdKRUBkQ76dqY4wGrY7PlSW8lDVOjsG9BcsSoV/Oekn6dsVZLl/mrGVHIo
         2VDUXqqWlE2FBfWlQHFitK/e4+htwrssETtlledZ/WwTUfWL/6Lv4cpgjasfdHfLSmd6
         c9igT+8OyzLczXRN1kvWI1Dbc9VG3LMSExj4h2AbofF+oImx9JSPmAbLWJIrbGu/yqAP
         0ua2CqVhxeKGkZbAH2wMlRk+KLzF7MY0DLx3L7sUvO12uH9ef0gqUjARqdE2xtmnYyyR
         FPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zgo7JmY69RwDnmQPFFjSp8OXJnWBR1Skr0sTGilavH0=;
        b=P4TysREiSJ4kvOLKJ981/TIy56a0ruFUdgaQFzI7wpadM+oe7QaX0JPMZ6kIyqFlWd
         JhC9rFeJm/h8dZRSH7okVGe13QoFFHUDBf37NpM+pZuMLp/fJj9teuu0Wtdi0xG52Z5i
         CSCJ4bLAZ6+5RQpOrWtfr1CKcpoCbOSXfaO29Z/V6f9sqTHbXpwmWXZ6Co492lfLVhsB
         7MOJLUcS353HfgLfJwXMB8slsUMRJEMNGwMomvhWsOvkCKnJi9nV6J5w8sv7k+eFO4bP
         nv0PCO3H87hugBh91IFSiHFPJrekeocZ+BhsqxweW98cWn3+75HZ6ovXMnJMKe4HdNtw
         bpWg==
X-Gm-Message-State: AOAM533q0FA9aUequCvIaqAi4+hf2HEKm7WaGD/6ggVLpcDv4WV0h1H7
        VUZG1dQtdvJsRC8sG2NF9T/ILQ==
X-Google-Smtp-Source: ABdhPJzVIy1p4LK20siLNNslo12/pck+pQUiB7cmMcnZxPx5Z2t8DeDQodmS0bWcERQZ994m8ptfdg==
X-Received: by 2002:a1c:9901:: with SMTP id b1mr24449wme.18.1606247071834;
        Tue, 24 Nov 2020 11:44:31 -0800 (PST)
Received: from dell.default ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 11:44:31 -0800 (PST)
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
Subject: [PATCH 26/40] drm/amd/amdgpu/uvd_v6_0: Fix a bunch of kernel-doc function documentation issues
Date:   Tue, 24 Nov 2020 19:38:10 +0000
Message-Id: <20201124193824.1118741-27-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:211: warning: Function parameter or member 'bo' not described in 'uvd_v6_0_enc_get_create_msg'
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:211: warning: Excess function parameter 'adev' description in 'uvd_v6_0_enc_get_create_msg'
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:275: warning: Function parameter or member 'bo' not described in 'uvd_v6_0_enc_get_destroy_msg'
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:275: warning: Excess function parameter 'adev' description in 'uvd_v6_0_enc_get_destroy_msg'
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:332: warning: Function parameter or member 'timeout' not described in 'uvd_v6_0_enc_ring_test_ib'
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:472: warning: Function parameter or member 'handle' not described in 'uvd_v6_0_hw_init'
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:472: warning: Excess function parameter 'adev' description in 'uvd_v6_0_hw_init'
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:541: warning: Function parameter or member 'handle' not described in 'uvd_v6_0_hw_fini'
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:541: warning: Excess function parameter 'adev' description in 'uvd_v6_0_hw_fini'
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:900: warning: Function parameter or member 'addr' not described in 'uvd_v6_0_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:900: warning: Function parameter or member 'seq' not described in 'uvd_v6_0_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:900: warning: Function parameter or member 'flags' not described in 'uvd_v6_0_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:900: warning: Excess function parameter 'fence' description in 'uvd_v6_0_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:930: warning: Function parameter or member 'addr' not described in 'uvd_v6_0_enc_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:930: warning: Function parameter or member 'seq' not described in 'uvd_v6_0_enc_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:930: warning: Function parameter or member 'flags' not described in 'uvd_v6_0_enc_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:930: warning: Excess function parameter 'fence' description in 'uvd_v6_0_enc_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:997: warning: Function parameter or member 'job' not described in 'uvd_v6_0_ring_emit_ib'
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:997: warning: Function parameter or member 'flags' not described in 'uvd_v6_0_ring_emit_ib'
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:1023: warning: Function parameter or member 'job' not described in 'uvd_v6_0_enc_ring_emit_ib'
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:1023: warning: Function parameter or member 'flags' not described in 'uvd_v6_0_enc_ring_emit_ib'

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
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
index 666bfa4a0b8ea..69cf7edf4cc61 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
@@ -198,9 +198,9 @@ static int uvd_v6_0_enc_ring_test_ring(struct amdgpu_ring *ring)
 /**
  * uvd_v6_0_enc_get_create_msg - generate a UVD ENC create msg
  *
- * @adev: amdgpu_device pointer
  * @ring: ring we should submit the msg to
  * @handle: session handle to use
+ * @bo: amdgpu object for which we query the offset
  * @fence: optional fence to return
  *
  * Open up a stream for HW test
@@ -261,9 +261,9 @@ static int uvd_v6_0_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t handle
 /**
  * uvd_v6_0_enc_get_destroy_msg - generate a UVD ENC destroy msg
  *
- * @adev: amdgpu_device pointer
  * @ring: ring we should submit the msg to
  * @handle: session handle to use
+ * @bo: amdgpu object for which we query the offset
  * @fence: optional fence to return
  *
  * Close up a stream for HW test or if userspace failed to do so
@@ -326,6 +326,7 @@ static int uvd_v6_0_enc_get_destroy_msg(struct amdgpu_ring *ring,
  * uvd_v6_0_enc_ring_test_ib - test if UVD ENC IBs are working
  *
  * @ring: the engine to test on
+ * @timeout: timeout value in jiffies, or MAX_SCHEDULE_TIMEOUT
  *
  */
 static int uvd_v6_0_enc_ring_test_ib(struct amdgpu_ring *ring, long timeout)
@@ -464,7 +465,7 @@ static int uvd_v6_0_sw_fini(void *handle)
 /**
  * uvd_v6_0_hw_init - start and test UVD block
  *
- * @adev: amdgpu_device pointer
+ * @handle: handle used to pass amdgpu_device pointer
  *
  * Initialize the hardware, boot up the VCPU and do some testing
  */
@@ -533,7 +534,7 @@ static int uvd_v6_0_hw_init(void *handle)
 /**
  * uvd_v6_0_hw_fini - stop the hardware block
  *
- * @adev: amdgpu_device pointer
+ * @handle: handle used to pass amdgpu_device pointer
  *
  * Stop the UVD block, mark ring as not ready any more
  */
@@ -891,7 +892,9 @@ static void uvd_v6_0_stop(struct amdgpu_device *adev)
  * uvd_v6_0_ring_emit_fence - emit an fence & trap command
  *
  * @ring: amdgpu_ring pointer
- * @fence: fence to emit
+ * @addr: address
+ * @seq: sequence number
+ * @flags: fence related flags
  *
  * Write a fence and a trap command to the ring.
  */
@@ -921,7 +924,9 @@ static void uvd_v6_0_ring_emit_fence(struct amdgpu_ring *ring, u64 addr, u64 seq
  * uvd_v6_0_enc_ring_emit_fence - emit an enc fence & trap command
  *
  * @ring: amdgpu_ring pointer
- * @fence: fence to emit
+ * @addr: address
+ * @seq: sequence number
+ * @flags: fence related flags
  *
  * Write enc a fence and a trap command to the ring.
  */
@@ -986,7 +991,9 @@ static int uvd_v6_0_ring_test_ring(struct amdgpu_ring *ring)
  * uvd_v6_0_ring_emit_ib - execute indirect buffer
  *
  * @ring: amdgpu_ring pointer
+ * @job: job to retrive vmid from
  * @ib: indirect buffer to execute
+ * @flags: unused
  *
  * Write ring commands to execute the indirect buffer
  */
@@ -1012,7 +1019,9 @@ static void uvd_v6_0_ring_emit_ib(struct amdgpu_ring *ring,
  * uvd_v6_0_enc_ring_emit_ib - enc execute indirect buffer
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

