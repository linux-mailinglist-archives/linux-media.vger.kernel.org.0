Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E741B38AEC7
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 14:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242691AbhETMpC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 08:45:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242858AbhETMoX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 08:44:23 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E89BEC0564AE
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 05:03:36 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id a4so17425227wrr.2
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 05:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yuvzJ7XKyB2J8XQ1p95NuNGQFyxLRMRhEwI7C8RcNw8=;
        b=KyloU0Voex0hBA1Vx66+tEWWQZSCdnxYcCTC9umTlXk2zRxDTFsqFUwWYcXMI55fpw
         ENKGyXCKnhBGEV7Dp0TCokF1f7aFF3VqhQ8JHMJb8TCCO7bG5a29KxxBijKLRur7EiWk
         TxQoHuk1+XSmKHRK/beFAE08KhwcQNYY/Nh6/KbpAeHraYFF6nQIVAdVrj8qay8qdJOe
         vac1Q+oLGtJH/WukRqAUD4Dq6aKwi9vX0isP8Rhb/LuvpCeG0ju/5erm5eesC0yaV/cG
         LSBgbZrY3r05ZoFaJPbh6jdbqCB2Lhg5D2/LZD6itG6VLVoOavS+G5pLuI21bl23jZ/B
         M0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yuvzJ7XKyB2J8XQ1p95NuNGQFyxLRMRhEwI7C8RcNw8=;
        b=l9ApFJiP0pFiokbX5Wwmv8jiytXkzwq0+Koyg+bDMKdTz2+/BTknoFeRYJzFx0lbpf
         rXizvfTB4fCiIuASV9rTaW11IRj44BIfetVZF3Ud64AMhM2guuEfDlRvKZSfVN0mSvxv
         ZhjvfJmk8i0IdCWUr2IonTxVNI30SzIvJHS1URhdxHqnzg5KBX1e6Usy93gI/V0tifl5
         6bxnQdYt5TSgQH/+xycOvl7ut2hIvx4BTniEJCxJJkmJP1K2PRcDxjNiwRkCjbndBOOm
         YT10BRE5YDDKiNOsEjKMluIg4f/1PDiJPHZ1D4BWIH0dwfDZXOVHIG/edO+Df9Dh0RwP
         dIQA==
X-Gm-Message-State: AOAM533BwoqrIfS7/sM4JtOS99BphU05YyWnmQ44ISElrX7e9yG8UNqf
        rG7KtCzdFX4eUiN2ZlcL3mJKog==
X-Google-Smtp-Source: ABdhPJy0xmbVP0jsnJYQuIk/ot8CWGqLOEp/599UQ2CXy8d5CQ9PYnIIK35Er7h+2CYObNbUZS63DQ==
X-Received: by 2002:a5d:4536:: with SMTP id j22mr3889313wra.329.1621512215520;
        Thu, 20 May 2021 05:03:35 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 05:03:34 -0700 (PDT)
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
Subject: [PATCH 33/38] drm/amd/amdgpu/sdma_v5_0: Fix typo in function name
Date:   Thu, 20 May 2021 13:02:43 +0100
Message-Id: <20210520120248.3464013-34-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:563: warning: expecting prototype for sdma_v_0_ctx_switch_enable(). Prototype was for sdma_v5_0_ctx_switch_enable() instead

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
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
index 75d7310f84392..2a2b9d50afb70 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -571,7 +571,7 @@ static void sdma_v5_0_rlc_stop(struct amdgpu_device *adev)
 }
 
 /**
- * sdma_v_0_ctx_switch_enable - stop the async dma engines context switch
+ * sdma_v5_0_ctx_switch_enable - stop the async dma engines context switch
  *
  * @adev: amdgpu_device pointer
  * @enable: enable/disable the DMA MEs context switch.
-- 
2.31.1

