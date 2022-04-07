Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5234F7AD6
	for <lists+linux-media@lfdr.de>; Thu,  7 Apr 2022 11:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243512AbiDGJCA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Apr 2022 05:02:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243516AbiDGJB6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Apr 2022 05:01:58 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66D931B2546
        for <linux-media@vger.kernel.org>; Thu,  7 Apr 2022 01:59:57 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id r13so9444386ejd.5
        for <linux-media@vger.kernel.org>; Thu, 07 Apr 2022 01:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oXj3Kbe7xDHiyyOo1B4OYi1sImslS+0K/zY6uVLIi6w=;
        b=YbmXAOFs+gy5D015qYxvG2OieoMf/vdwD/ijlCdS+KTOgB+FyIOdBGxI0D9+AcoxAZ
         isJBepkWkxA29ApS2kbZ8HRDiEWC7TbAOQzWqAjH2B0ODJxOBxBUgZ/nz9+PAN1DyRA5
         aTTYgeZvDUB0bqCdohjupaIHeLIL5viYu1FZmssQG0WpIHSwufaYPJAswLtKfm1tcJ98
         s2U5q/OWTnGDL/2KSyUsvHzqwyRvhqL+RmGZCZ68VuzS3thVWTNv3uC49pPAtjIU+1W7
         ozpA6iCVtF/NRZOm2W8OJjSVhMi5tXXNrXIKcl2l70mQBO/5vnlaH62o8Lcd24LMBbd7
         qT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oXj3Kbe7xDHiyyOo1B4OYi1sImslS+0K/zY6uVLIi6w=;
        b=KpKmUooa8ftdHCZLfoxwt7l3Umitbq+IRuQUfW2H5rKtiOWp/ZmI6xTufSvD2OvqIC
         O8nO9tBbmhOsWn2bXzx4gLSJddPL7WD/NbYvN0qz/7JKpNV4Rmp3wSHA5ubjJA9NNqvp
         NnBeyP4OTcVErY0rAzbUxxNbVlKc1r/GsDUV7SBhLk6JLIDntqTIeMDvjpJTKHP8GB5r
         5t8HxuDdpECjbtvsc7jgGPz+Y1Pd/tObaYYnxFC9B5BL1YCvGp1uucFFe/gTFNn6BRkM
         2OURn+5UnVkqceAIq7DjNh1kVhDJZvOZhEKRjMDz0wuViWZZ6Po5swEEqhT1OWsONUTV
         YAjQ==
X-Gm-Message-State: AOAM530lQqZ/lvHRqLINzQ1/o2UVi2yh0jhzPm6CYxjGJz863xHEeAy6
        FoOIkjoeRfRlXU9c/ViB7Ixip+WGkcc=
X-Google-Smtp-Source: ABdhPJyvjeR9CZoQ4PIU/jrK26usfsiKkXh6Wyjwbj4nnnWpODNbwTBex5/ZVXURFPN9veF3SERFhw==
X-Received: by 2002:a17:906:2991:b0:6cd:ac19:ce34 with SMTP id x17-20020a170906299100b006cdac19ce34mr12376953eje.746.1649321995641;
        Thu, 07 Apr 2022 01:59:55 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906111a00b006e778bd4fc8sm5186563eja.38.2022.04.07.01.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 01:59:55 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        intel-gfx@lists.freedesktop.org
Cc:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 05/15] drm/amdgpu: use DMA_RESV_USAGE_KERNEL
Date:   Thu,  7 Apr 2022 10:59:36 +0200
Message-Id: <20220407085946.744568-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407085946.744568-1-christian.koenig@amd.com>
References: <20220407085946.744568-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Wait only for kernel fences before kmap or UVD direct submission.

This also makes sure that we always wait in amdgpu_bo_kmap() even when
returning a cached pointer.

Signed-off-by: Christian König <christian.koenig@amd.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 10 +++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c    |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index a3cdf8a24377..5832c05ab10d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -761,6 +761,11 @@ int amdgpu_bo_kmap(struct amdgpu_bo *bo, void **ptr)
 	if (bo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS)
 		return -EPERM;
 
+	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_KERNEL,
+				  false, MAX_SCHEDULE_TIMEOUT);
+	if (r < 0)
+		return r;
+
 	kptr = amdgpu_bo_kptr(bo);
 	if (kptr) {
 		if (ptr)
@@ -768,11 +773,6 @@ int amdgpu_bo_kmap(struct amdgpu_bo *bo, void **ptr)
 		return 0;
 	}
 
-	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_WRITE,
-				  false, MAX_SCHEDULE_TIMEOUT);
-	if (r < 0)
-		return r;
-
 	r = ttm_bo_kmap(&bo->tbo, 0, bo->tbo.resource->num_pages, &bo->kmap);
 	if (r)
 		return r;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
index 3654326219e0..6eac649499d3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
@@ -1164,7 +1164,7 @@ static int amdgpu_uvd_send_msg(struct amdgpu_ring *ring, struct amdgpu_bo *bo,
 
 	if (direct) {
 		r = dma_resv_wait_timeout(bo->tbo.base.resv,
-					  DMA_RESV_USAGE_WRITE, false,
+					  DMA_RESV_USAGE_KERNEL, false,
 					  msecs_to_jiffies(10));
 		if (r == 0)
 			r = -ETIMEDOUT;
-- 
2.25.1

