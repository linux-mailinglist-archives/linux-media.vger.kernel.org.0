Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 509252B1C8C
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 14:53:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbgKMNvt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 08:51:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727076AbgKMNuW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 08:50:22 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BF35C0617A7
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2020 05:50:21 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id a3so8547218wmb.5
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2020 05:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xrnyrit0v6fzfrooRNMi88M6HiPrfycz27kzVEg4yYM=;
        b=xzX7/w5JkEJWFNmWJ9XhEULYWxZdlL484sgDqokJC2N74ZDAzRW9fNa/+pZRfQXoPX
         w8vSlD7sbufyf6Tbg3R5IVs4V60sFs7/H1PbDBA3gNe9bY4Alpdn5tnIKN9vL33TD/0/
         mBKobWhQGaWzcEpKoZgfmMMnI6AFkzBZ2vwAbhyHidq2K495ZRsaes76xKfe29AD2cyR
         nySZLdB8HAYVQO489IHNmmRwG9MTK+nyLd/nS9jyON3UfUIlWkwfmGp8vli3eiE1+llt
         U96cfho0m+d73d4rKqV6kECpeYyodlf1MvO+KdIAWSFaXtAEGdGp4kXCjLjro1ttEEA5
         qnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xrnyrit0v6fzfrooRNMi88M6HiPrfycz27kzVEg4yYM=;
        b=dxWQLZRqNMBs0C+hwVCKLNu2mDQ3kHIj/MZotBusLPRMRnMBS73Y49Y4YPxEolvj3C
         8xPqBjjrBImmbdy+5iypPcbqF99n9A1holaPjhfOG8jduxdlvax11d8587KLslxVvyjH
         GdfRToAzZuJOxVe6rGtKV66DX1muGpwpHkTQWskvsku0/XRH0Zzk8+hT+/jYITac/cKn
         zfxMTjW86k94rZ4WIyE8c9g5ifYRHAlcV7WFyg9vajwOewQakmylC6dAd/p4sgz1iDnL
         u/mdDfsTXaBn5ZTqcUI8I5DJ8tJMDgRcXBZ+BMz8rKqM75RGkWXfA3/rWAL7dgFiybi1
         3kSA==
X-Gm-Message-State: AOAM530Xh6wfYsMheU0dwZkET3VBDa/sWTHNHfrm0W2EbMF+j14Q/rK2
        nLj74aPD0zinIYnG0N+h0bf/uw==
X-Google-Smtp-Source: ABdhPJxleAxe551m1648cnVusxHBA+2YOfp8Wr3sW/9AY28jfMWSIiglJKFPwmqZEbfjZhTBw2Q2Yw==
X-Received: by 2002:a1c:448:: with SMTP id 69mr2516516wme.12.1605275420178;
        Fri, 13 Nov 2020 05:50:20 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 05:50:19 -0800 (PST)
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
Subject: [PATCH 31/40] drm/amd/amdgpu/amdgpu_vm_sdma: Fix 'amdgpu_vm_sdma_prepare()'s doc-rot
Date:   Fri, 13 Nov 2020 13:49:29 +0000
Message-Id: <20201113134938.4004947-32-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c:63: warning: Function parameter or member 'resv' not described in 'amdgpu_vm_sdma_prepare'
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c:63: warning: Function parameter or member 'sync_mode' not described in 'amdgpu_vm_sdma_prepare'
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c:63: warning: Excess function parameter 'owner' description in 'amdgpu_vm_sdma_prepare'
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c:63: warning: Excess function parameter 'exclusive' description in 'amdgpu_vm_sdma_prepare'

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
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
index db790574dc2e8..a83a646759c58 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
@@ -51,8 +51,8 @@ static int amdgpu_vm_sdma_map_table(struct amdgpu_bo *table)
  * amdgpu_vm_sdma_prepare - prepare SDMA command submission
  *
  * @p: see amdgpu_vm_update_params definition
- * @owner: owner we need to sync to
- * @exclusive: exclusive move fence we need to sync to
+ * @resv: reservation object with embedded fence
+ * @sync_mode: synchronization mode
  *
  * Returns:
  * Negativ errno, 0 for success.
-- 
2.25.1

