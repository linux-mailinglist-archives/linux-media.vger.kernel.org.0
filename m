Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E78A43A94F2
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 10:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231846AbhFPI3M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 04:29:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231602AbhFPI3L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 04:29:11 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 443B3C06175F
        for <linux-media@vger.kernel.org>; Wed, 16 Jun 2021 01:27:05 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id t7so1550323edd.5
        for <linux-media@vger.kernel.org>; Wed, 16 Jun 2021 01:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=eOLQYHUi8EbWMSyj8fpL7+TUOhuUkdVsm2sbvIBW7rQ=;
        b=peIJ6pH3RtosgHbcBzthWIHp5Ht3/i9wko21RYQ4Wwjat8wwNDxFQLd+PS9YmzbNn6
         zYW9IB3T/spJ9QbFwbV1eQFf0KyS1qSyk/N2KYypvl3q+WP6vULhFB6zQ/r4/8pBgIlx
         nCD3ORHu2xcgasBZuy2uKg9TdsycDRBe0Ooqre8wVRqK27vy9bx/meJJciYH9ebkUC61
         7CdfbPXBFbuzxTxe7HGoqdktglROg90cs7h7L1O/vT1vHc/Tp4AIPeMeQ/Gi/jd/8BS6
         wilmsl8Et949y7ZreBxhqO+RmJgtPtm+V3RK4bpOAziaE/HSriApWjAfJNqWKk3OOzDB
         c4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eOLQYHUi8EbWMSyj8fpL7+TUOhuUkdVsm2sbvIBW7rQ=;
        b=rKJH8NjJT8fF2jAcdjY8ApAYb2F7HVsVfCCkzQghHruQL6Hgmgey95lSAlu7+zx2L/
         TncJCEo3dJ4+fwJXwnKuT+ui3Rr1lBoY6U36OA6eHNO1zrDmKL2oZt13Mnk7x2xsdj4B
         ivDF51RpAA0jsu4EGzpTcNyOCwqiFK5BjwUWyBr3+oFbbsCDu8ju1o2XZlDTFRa/of95
         x59TEKqTE9fzfhGA9A9YH5Hmw6Ro2zX10ubmu7m4C0ou8cgvHAf8LYmCYcm3M4oqYINy
         +3PW/u3pTlyXv0rHkLDS8gZSVubMBf4pJnJVlAqeeXm/x7flFgcNMFmCOyhgCb6D4z7I
         habg==
X-Gm-Message-State: AOAM532zZZGM2wV2Lw/OF25+8uRAdQlz1/O/3pcW4Wx2kDfFwjPU0oUs
        nFg5WTQaAuY+QzvbxCWVjsQ=
X-Google-Smtp-Source: ABdhPJxTFpqW21OrNereNEfws2tTVm4Wn0Se9rWNC+9t5y4vIFlD5DkHnDgU/63ucoG65cOJGMdm8A==
X-Received: by 2002:a05:6402:54f:: with SMTP id i15mr2671173edx.339.1623832023875;
        Wed, 16 Jun 2021 01:27:03 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8b88:17a4:582b:121f])
        by smtp.gmail.com with ESMTPSA id v7sm1152639edx.38.2021.06.16.01.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 01:27:03 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        sumit.semwal@linaro.org
Subject: [PATCH 6/7] drm/amdgpu: drop workaround for adding page table clears as shared fence
Date:   Wed, 16 Jun 2021 10:26:54 +0200
Message-Id: <20210616082655.111001-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616082655.111001-1-christian.koenig@amd.com>
References: <20210616082655.111001-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We no longer need to add the exclusive fence as shared fence as
welldrm/amdgpu: drop workaround for adding page table clears as shared
fence

We no longer need to add the exclusive fence as shared fence as well..

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 0780e8d18992..d7baa207f391 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -207,7 +207,7 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
 	INIT_LIST_HEAD(&duplicates);
 
 	tv.bo = &bo->tbo;
-	tv.num_shared = 2;
+	tv.num_shared = 1;
 	list_add(&tv.head, &list);
 
 	amdgpu_vm_get_pd_bo(vm, &list, &vm_pd);
@@ -226,12 +226,6 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
 	if (!amdgpu_vm_ready(vm))
 		goto out_unlock;
 
-	fence = dma_resv_excl_fence(bo->tbo.base.resv);
-	if (fence) {
-		amdgpu_bo_fence(bo, fence, true);
-		fence = NULL;
-	}
-
 	r = amdgpu_vm_clear_freed(adev, vm, &fence);
 	if (r || !fence)
 		goto out_unlock;
-- 
2.25.1

