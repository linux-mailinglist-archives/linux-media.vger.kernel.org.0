Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1272B1C99
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 14:53:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727342AbgKMNwj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 08:52:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbgKMNuD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 08:50:03 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC939C061A04
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2020 05:50:02 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id l1so9972763wrb.9
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2020 05:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z4Rt5MfpdBDV0pCvJqA/7OOspni5CCJQuMFleU8qAsI=;
        b=N+zM6zcZSVFZCdJrsj9mEKmy9LZp5xIJvVdJJOafLItXmWclcO1seEQot59X2vEN+w
         bSSFvnDESI+BXkh18u4frFboxNp/Zsh+WDRUEnVccULFIUmPkdRnIqGkBl8cWCRs7FZ0
         NIZoh5uDPA5xR8R0TpAZDiJeGdaHeoOs6ny1ukNzxgV8YtJL7uaG0VJWfzf56e6qYWUc
         xuPAfqt3r5t9ltpEXF8RfhRyDn65i/O6VCpZmvQSiCxiLVanxYpfxCk7th1SV9qhR1mA
         5vwX900qX5B5BGhC1qN/gvuOyJQnV/JkcIHm97z97SOCx/wejQBjzrUiLbQ93PyAjUIb
         WtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z4Rt5MfpdBDV0pCvJqA/7OOspni5CCJQuMFleU8qAsI=;
        b=S/nVAHFPdEeYC3a9KH92NZvm6Kq++/SSz9IfaRVLUSol3IUc/ti5WjGnudlS5KNFfw
         jIFX6npLBDTfiPDH2slaQ3ZL50a/Ka7YHksQaU1Hx3Yp+18AFM1dh7kMvTgNPXptyNxF
         wMTGIy64PDLImLFnA79NkbpIsuLbCxD7T4MM1la5x5Ljqv29xsC/AvBGhcyST//14k3k
         JWcJ/nmvNOYAaBVbNkmMgvuhB5dB53Xpeqhf4vv98A1zbGTk2woWqwRS1Zxx4azCQNFc
         YGZMxw2qkNMj+5SMH1n2eYkxpW5FK/3D8YAJcG/+F80MVZApWL/hj+WAZ1UhkUWSt+vc
         51EQ==
X-Gm-Message-State: AOAM530ovoWek3boRbzIeIAF3+coIPT5dGgVR3RNNP3oqFF44r25mbCw
        aP5lmNkwsm8xfR3Yv/rYprWTHQ==
X-Google-Smtp-Source: ABdhPJx0smt20aVTrHVG68Hi6o1SogLHhzsaE/8xGQk5oruEnBKEdMWr2G0xpdZpuag2G6RsfPRBoA==
X-Received: by 2002:adf:ce87:: with SMTP id r7mr3568696wrn.212.1605275401516;
        Fri, 13 Nov 2020 05:50:01 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 05:50:00 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 16/40] drm/amd/amdgpu/amdgpu_sync: Fix misnamed, missing and extra param descriptions
Date:   Fri, 13 Nov 2020 13:49:14 +0000
Message-Id: <20201113134938.4004947-17-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c:86: warning: Function parameter or member 'f' not described in 'amdgpu_sync_get_owner'
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c:86: warning: Excess function parameter 'fence' description in 'amdgpu_sync_get_owner'
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c:182: warning: Excess function parameter 'adev' description in 'amdgpu_sync_vm_fence'
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c:203: warning: Function parameter or member 'adev' not described in 'amdgpu_sync_resv'

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index 8ea6c49529e7d..4e558632a5d2b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -78,7 +78,7 @@ static bool amdgpu_sync_same_dev(struct amdgpu_device *adev,
 /**
  * amdgpu_sync_get_owner - extract the owner of a fence
  *
- * @fence: fence get the owner from
+ * @f: fence get the owner from
  *
  * Extract who originally created the fence.
  */
@@ -172,7 +172,6 @@ int amdgpu_sync_fence(struct amdgpu_sync *sync, struct dma_fence *f)
 /**
  * amdgpu_sync_vm_fence - remember to sync to this VM fence
  *
- * @adev: amdgpu device
  * @sync: sync object to add fence to
  * @fence: the VM fence to add
  *
@@ -190,6 +189,7 @@ int amdgpu_sync_vm_fence(struct amdgpu_sync *sync, struct dma_fence *fence)
 /**
  * amdgpu_sync_resv - sync to a reservation object
  *
+ * @adev: amdgpu device
  * @sync: sync object to add fences from reservation object to
  * @resv: reservation object with embedded fence
  * @mode: how owner affects which fences we sync to
-- 
2.25.1

