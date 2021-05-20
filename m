Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFC7A38AEB1
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 14:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240171AbhETMoG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 08:44:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242308AbhETMnV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 08:43:21 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2D57C0611AA
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 05:03:06 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id j14so15647761wrq.5
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 05:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p87lVshS5WtAkP+vwHETLCg2+KWBSmqiA1YnmqxNMnI=;
        b=a0NIQqA5rLn8/zDIH1ZHgTKtjrdQNFOqYKVUhlTWUmu+HMX/QdYMhzdfw1vnVRI6h9
         5ftpgP6sU1hD4Yn0LY+AZQcGCSfvqqS1Z0rNcyjthxY2amFnTWc+tBhkI+IXvW6ISVPy
         Znuiyk6IycvT5V+n60HIOQd+Agl7RJ2VvoUzoTkPlhNskqEB+uSoeWDAft89rOUwhqOn
         GJskOcGB3CvTGt/Qy4NqIM/pw4JTKpD6N1mdJVmotEQdhStQMDA1j/V3xJBruo5ull0c
         96oVQpgw0QpTNeNkj73P8Zfrg3kq8efATw2NO6gQqRt5Uxk5RXecfUzUiHsY24AKuzno
         pMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p87lVshS5WtAkP+vwHETLCg2+KWBSmqiA1YnmqxNMnI=;
        b=sCBl1R1eBOwJglGlzTqf8nPXwIpVotaHz2DnYKKRelfVR+R9IHydmxtiAas1v4I10j
         1gs0rCh8x+7UV8Pyl0/6btJRGOP+LCrOO8wBOlG1ovAB8RMUt9QO87M/9344Z7pbzM8t
         TnZUMVJ1KzXGzoSXh9YXzDWVFyqe4y9BXMJOSYKvv9UBqT/pRPeUqFaBfiLtRhLGerkN
         u3Hbuuvyouge7Y1utZOFxLwCIYEP70vxCg0k6SzVv0+bdCvimUUF0J/YZDnQRmVuu9Uo
         vNCbARZuN1a5LUYjqou8meWaonKdWkqYoziszP7HN7Kdx3hi0gMsdrcFEQs+5VW/k4Sd
         pYdw==
X-Gm-Message-State: AOAM532ifdfFdKfaukmkQXdufXS+btrTtIx1YquPCj8SDb35UoGETtuS
        j38waAK5gqlFzm0qKIKA7HH2sg==
X-Google-Smtp-Source: ABdhPJztEhcLl1ZB7W0IJsYbUWN1YgmHDJ7/kY6TYSk37pdkh/b5zgKfJXBzKdNZaNHzScPv6WULWQ==
X-Received: by 2002:adf:f80f:: with SMTP id s15mr3888694wrp.341.1621512185252;
        Thu, 20 May 2021 05:03:05 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 05:03:04 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Evan Quan <evan.quan@amd.com>, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 13/38] drm/amd/amdgpu/cik_sdma: Fix a few incorrectly named functions
Date:   Thu, 20 May 2021 13:02:23 +0100
Message-Id: <20210520120248.3464013-14-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/cik_sdma.c:735: warning: expecting prototype for cik_sdma_vm_copy_pages(). Prototype was for cik_sdma_vm_copy_pte() instead
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c:762: warning: expecting prototype for cik_sdma_vm_write_pages(). Prototype was for cik_sdma_vm_write_pte() instead
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c:792: warning: expecting prototype for cik_sdma_vm_set_pages(). Prototype was for cik_sdma_vm_set_pte_pde() instead
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c:814: warning: expecting prototype for cik_sdma_vm_pad_ib(). Prototype was for cik_sdma_ring_pad_ib() instead

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Evan Quan <evan.quan@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
index c4bb8eed246d6..c8ebd108548d3 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
@@ -720,7 +720,7 @@ static int cik_sdma_ring_test_ib(struct amdgpu_ring *ring, long timeout)
 }
 
 /**
- * cik_sdma_vm_copy_pages - update PTEs by copying them from the GART
+ * cik_sdma_vm_copy_pte - update PTEs by copying them from the GART
  *
  * @ib: indirect buffer to fill with commands
  * @pe: addr of the page entry
@@ -746,7 +746,7 @@ static void cik_sdma_vm_copy_pte(struct amdgpu_ib *ib,
 }
 
 /**
- * cik_sdma_vm_write_pages - update PTEs by writing them manually
+ * cik_sdma_vm_write_pte - update PTEs by writing them manually
  *
  * @ib: indirect buffer to fill with commands
  * @pe: addr of the page entry
@@ -775,7 +775,7 @@ static void cik_sdma_vm_write_pte(struct amdgpu_ib *ib, uint64_t pe,
 }
 
 /**
- * cik_sdma_vm_set_pages - update the page tables using sDMA
+ * cik_sdma_vm_set_pte_pde - update the page tables using sDMA
  *
  * @ib: indirect buffer to fill with commands
  * @pe: addr of the page entry
@@ -804,7 +804,7 @@ static void cik_sdma_vm_set_pte_pde(struct amdgpu_ib *ib, uint64_t pe,
 }
 
 /**
- * cik_sdma_vm_pad_ib - pad the IB to the required number of dw
+ * cik_sdma_ring_pad_ib - pad the IB to the required number of dw
  *
  * @ring: amdgpu_ring structure holding ring information
  * @ib: indirect buffer to fill with padding
-- 
2.31.1

