Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5CE2C3130
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 20:49:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727364AbgKXTpu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 14:45:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726998AbgKXTo2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 14:44:28 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAE86C061A54
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 11:44:27 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id z7so7731674wrn.3
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 11:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GB6kY4upxQFv24rJ06X4HvdfBkp1xJnyjNfSH8+ifmU=;
        b=gYSO/nVmFciixTFJ8ZqVydxt3ETrnljhtml21uB6O8PC1QhgpWZ06dgSyH4KjrinuJ
         iDlUGLl+ysxrcvtrKWR8gHxcgxhwk792cp/ZUjMKxj88lWvnMA9mpfqh7e21oCtZnhsI
         xziWQg/ze7wmJg8oj2FustOlfqEuy3LxlDUk75pZx2jz7IgRDlQwfa/pUUtvkVOkK5Ei
         hUnmDpvxI8xt4AD4521/sTVwp3Ar2j9aOGeR/LQRrVO6PCcHejb5SGXlzyY4PuKDsJXQ
         YY/2k1rlA6BCsIialIdRJf1Ocac398uulw8nhlphGmB5WId/BPHtX0XafqS8z2W92uVY
         kCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GB6kY4upxQFv24rJ06X4HvdfBkp1xJnyjNfSH8+ifmU=;
        b=pXotbiAMZPutEIY7SNag+FiFpBZ/xGe6c4P8s1wQ76Os0575pl0AMBCd6dL2gFUY+M
         mJt++cpfsiyvfxD41Su3OtIdKeyHMT6fXzdkMrttP6i+/Z8lI2u1/fGN7nOztkTWnvNb
         51CyDQc6wlLzzA/sXUDA/u9WYeExs5O0CVIsu7AJDxjJi/+iwbD6TICujLCZvSGHgVNJ
         Omrrd2nXuYBiRU/cS1wEblH8JcM8Ds6btEaVGi38VK42n2ksAOU9VC22YErFhJcfmhNd
         rcqhhCfISm/NxkvD1UBfKP1vERCFKL7rBm8+lECOpjFq8QescRSLt4TzaFSHc0lx0zmb
         MQAw==
X-Gm-Message-State: AOAM532Cz9QbsDvNVNoSwpParRUgABVArNztA9ltlaXhuxHsIB1VQ5WW
        JCN28vxJ9k034hTEXmL3zZAfqw==
X-Google-Smtp-Source: ABdhPJwiHOsXolfK7RoFeBDciBoIZeZ34wXHdP5DHmDy6yg7Zg4BiP+i4fA7AqCywCu48B/vP+y7JQ==
X-Received: by 2002:adf:f143:: with SMTP id y3mr112155wro.138.1606247066571;
        Tue, 24 Nov 2020 11:44:26 -0800 (PST)
Received: from dell.default ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 11:44:25 -0800 (PST)
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
Subject: [PATCH 22/40] drm/amd/amdgpu/amdgpu_uvd: Fix some function documentation headers
Date:   Tue, 24 Nov 2020 19:38:06 +0000
Message-Id: <20201124193824.1118741-23-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:95: warning: cannot understand function prototype: 'struct amdgpu_uvd_cs_ctx '
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:555: warning: Function parameter or member 'adev' not described in 'amdgpu_uvd_cs_msg_decode'
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1012: warning: Function parameter or member 'ib_idx' not described in 'amdgpu_uvd_ring_parse_cs'
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1286: warning: Function parameter or member 'timeout' not described in 'amdgpu_uvd_ring_test_ib'

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
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
index f8bebf18ee362..f8f0384a8d9ad 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
@@ -87,7 +87,7 @@
 #define UVD_NO_OP				0x03ff
 #define UVD_BASE_SI				0x3800
 
-/**
+/*
  * amdgpu_uvd_cs_ctx - Command submission parser context
  *
  * Used for emulating virtual memory support on UVD 4.2.
@@ -545,8 +545,8 @@ static int amdgpu_uvd_cs_pass1(struct amdgpu_uvd_cs_ctx *ctx)
 /**
  * amdgpu_uvd_cs_msg_decode - handle UVD decode message
  *
+ * @adev: amdgpu_device pointer
  * @msg: pointer to message structure
- * @buf_sizes: returned buffer sizes
  *
  * Peek into the decode message and calculate the necessary buffer sizes.
  */
@@ -1005,6 +1005,7 @@ static int amdgpu_uvd_cs_packets(struct amdgpu_uvd_cs_ctx *ctx,
  * amdgpu_uvd_ring_parse_cs - UVD command submission parser
  *
  * @parser: Command submission parser context
+ * @ib_idx: Which indirect buffer to use
  *
  * Parse the command stream, patch in addresses as necessary.
  */
@@ -1279,6 +1280,7 @@ void amdgpu_uvd_ring_end_use(struct amdgpu_ring *ring)
  * amdgpu_uvd_ring_test_ib - test ib execution
  *
  * @ring: amdgpu_ring pointer
+ * @timeout: timeout value in jiffies, or MAX_SCHEDULE_TIMEOUT
  *
  * Test if we can successfully execute an IB
  */
-- 
2.25.1

