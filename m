Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C799338AEC0
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 14:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242566AbhETMou (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 08:44:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242788AbhETMoR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 08:44:17 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CCF7C0564AB
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 05:03:34 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id u133so9025651wmg.1
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 05:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nynxxR/OsBCzgQqs0HwpEzxLm2OUnGw35ueUBnmCZ5g=;
        b=UVushAvSHMxa0C5XeIr0bdnDeei0Y1WMhTJYIgy8dRMkWcdNb44elX1h9GjF+D91/g
         3k64urbysVJKIrBU6PzA9VQ3NsXOwtgj13lRJYOyJYsJA3e0j/9qshxBzBZ6TtR5YRPe
         y/FRBOgs+Ef7wwJovho+qJW4lgNU1EePROSRQxihFEpoh+ATXkOFcIUpzwu4AUnPeVOm
         EeRD4yDhkcOrQtK2qkzw9DlMihFqF2Kcnh/TOt5xZU2mcps7qvrMLId8Ald+2NeO/5nr
         4koCiRAM+2HJ0uXudQpe77PWXptcGWavHthevwz9C/nmG0EBxHYBX7QkwZ5OVHTnadHs
         /Pkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nynxxR/OsBCzgQqs0HwpEzxLm2OUnGw35ueUBnmCZ5g=;
        b=PGtwrPrIF3Uoe4GBqgDgUhftFf956OLFwghz4repqK4/C4thpwchFHNmeSvZ/O6C8X
         2J2jCJ8Udzuj1IT3+4M5DIgWFVR0dZ6AuFDWfojpGEHB2bcNqNi775mlxsWB/LSWGjM9
         6+Zon4ue5LR9Vzewncemk62YdNy4Mf+ZYoN7Igp+QHMxOWb4WWXXLS81bO3q44AXzY7+
         Rep7LNXqetnjhHXwXQc44IJdDkLz8qRbJrU+bMb2lkIiSzlVvULnSUWSODTMAlzs+ekV
         pod7X0LqlwNw/HCdaRGmYI2HbwlYxWHXKrcZMxc/W5P7Z3pD9jf0R1KTjK6PXn5ccXUt
         5KSA==
X-Gm-Message-State: AOAM533eCqU6AMxwaGosXPYZe2xVH1blRSu2gKteB+duRuWpsu6sAyBq
        kZ+H6knhbUkkvh/hXKE/4mJkg0Xm303eDA==
X-Google-Smtp-Source: ABdhPJwMr2S46p+INbbf4IlG3gi+W3uNAXiPXWi5P3w8PnLPD7lw+1iFRHCGlUXFBNZ3FsCYsPxzCA==
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr3317496wmq.138.1621512213083;
        Thu, 20 May 2021 05:03:33 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 05:03:32 -0700 (PDT)
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
Subject: [PATCH 31/38] drm/amd/amdgpu/sdma_v2_4: Correct misnamed function 'sdma_v2_4_ring_emit_hdp_flush()'
Date:   Thu, 20 May 2021 13:02:41 +0100
Message-Id: <20210520120248.3464013-32-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:281: warning: expecting prototype for sdma_v2_4_hdp_flush_ring_emit(). Prototype was for sdma_v2_4_ring_emit_hdp_flush() instead

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
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
index 9f0dda040ec88..4509bd4cce2d6 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
@@ -271,7 +271,7 @@ static void sdma_v2_4_ring_emit_ib(struct amdgpu_ring *ring,
 }
 
 /**
- * sdma_v2_4_hdp_flush_ring_emit - emit an hdp flush on the DMA ring
+ * sdma_v2_4_ring_emit_hdp_flush - emit an hdp flush on the DMA ring
  *
  * @ring: amdgpu ring pointer
  *
-- 
2.31.1

