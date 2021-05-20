Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 553A638AEC4
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 14:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242626AbhETMo5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 08:44:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242409AbhETMns (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 08:43:48 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A9CC0611AE
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 05:03:09 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id b7so8429032wmh.5
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 05:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EkPRRoz7F84TTvDB6+0jP5Wh7M4ODElC4NQcMjBtFnE=;
        b=C7sgYTiANrC4NQXV+e5udHxsCPzVZnTdUONTGFy0elAjMgOr4a4/G1J+MxGPYWhgeG
         fKGfGMfyFUqP/jfVk/15fcyt5KfukAI0rN0/N2CeMI481eYGwA/ae2yAGB5r+KY8XBHU
         WS7b7Qm8Ple3GdMdCYcMp+hm6XJtj1QmCU9DJk9LqD58oSjspNVNWGzgWaitErSc4qWm
         NMIpVZzr8aIs+wkkMsvfH0oKbSph/Ecueoe50rcU9k85CjFRwvRRmZROlZdtpcEc19U9
         YWDrGUfx/MmdtGpYp/+KlYsxMkUJg5YvQj8KD4ya/3Nq0FnI2SucE+lTMo8DIpSGJcX6
         ygwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EkPRRoz7F84TTvDB6+0jP5Wh7M4ODElC4NQcMjBtFnE=;
        b=AQVUd3BsOqa3fOeIxeS8SNTabkyqBT/EZzowI0b8haJiJToll7RwXy3vXzqjDvg2j2
         8zop4YgRm1RNoWPfv64zPnrGwwLnBj5ZZNN3geeL/3ij0j3czhw+03iolN+y8vOd+UGL
         1njwsF34L0X2sYHO4SjF4/TjTz0Fo+yxrc2qelOZZCVUaQDhWFadqIxNvNUvVQvUaBjS
         xm+tMX17VUZvjBaXytZz3gQeJAzXpi5j9CgZ82g2SO6K/z0Fb6nfJUltHyXnwBhA0u2j
         svLEKMsb1DqIuNzlz8GUOY/uowStUwZ4ZmDqkYh5Xonds4NIuUnP1vbO7GUG77J3ZWA/
         SJ6Q==
X-Gm-Message-State: AOAM531L67B3iN3gJLDdXzMZBnXCsqouyCo7OsKH3dKYQSPep6YaQxLm
        +2xz/zb+gPmyWrFg4O74d+tmVg==
X-Google-Smtp-Source: ABdhPJzPnAPqk77sjtNc+xUnzh/WodTD1UR6pw3gSJKCE5waqxLJcs6BuyWwb2EH/6hrtLLTYjuCKA==
X-Received: by 2002:a7b:c8ce:: with SMTP id f14mr3283573wml.81.1621512188364;
        Thu, 20 May 2021 05:03:08 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 05:03:07 -0700 (PDT)
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
Subject: [PATCH 16/38] drm/amd/amdgpu/si_dma: Fix some function name disparity
Date:   Thu, 20 May 2021 13:02:26 +0100
Message-Id: <20210520120248.3464013-17-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/si_dma.c:320: warning: expecting prototype for cik_dma_vm_copy_pte(). Prototype was for si_dma_vm_copy_pte() instead
 drivers/gpu/drm/amd/amdgpu/si_dma.c:412: warning: expecting prototype for si_dma_pad_ib(). Prototype was for si_dma_ring_pad_ib() instead
 drivers/gpu/drm/amd/amdgpu/si_dma.c:425: warning: expecting prototype for cik_sdma_ring_emit_pipeline_sync(). Prototype was for si_dma_ring_emit_pipeline_sync() instead

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
 drivers/gpu/drm/amd/amdgpu/si_dma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c b/drivers/gpu/drm/amd/amdgpu/si_dma.c
index cb703e307238d..195b45bcb8ad9 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
@@ -305,7 +305,7 @@ static int si_dma_ring_test_ib(struct amdgpu_ring *ring, long timeout)
 }
 
 /**
- * cik_dma_vm_copy_pte - update PTEs by copying them from the GART
+ * si_dma_vm_copy_pte - update PTEs by copying them from the GART
  *
  * @ib: indirect buffer to fill with commands
  * @pe: addr of the page entry
@@ -402,7 +402,7 @@ static void si_dma_vm_set_pte_pde(struct amdgpu_ib *ib,
 }
 
 /**
- * si_dma_pad_ib - pad the IB to the required number of dw
+ * si_dma_ring_pad_ib - pad the IB to the required number of dw
  *
  * @ring: amdgpu_ring pointer
  * @ib: indirect buffer to fill with padding
@@ -415,7 +415,7 @@ static void si_dma_ring_pad_ib(struct amdgpu_ring *ring, struct amdgpu_ib *ib)
 }
 
 /**
- * cik_sdma_ring_emit_pipeline_sync - sync the pipeline
+ * si_dma_ring_emit_pipeline_sync - sync the pipeline
  *
  * @ring: amdgpu_ring pointer
  *
-- 
2.31.1

