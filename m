Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C058D46BB27
	for <lists+linux-media@lfdr.de>; Tue,  7 Dec 2021 13:34:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236407AbhLGMh5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Dec 2021 07:37:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236391AbhLGMh4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Dec 2021 07:37:56 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC005C061574
        for <linux-media@vger.kernel.org>; Tue,  7 Dec 2021 04:34:25 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id q3so29144999wru.5
        for <linux-media@vger.kernel.org>; Tue, 07 Dec 2021 04:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pldTMC4RaLfk2VlDsi1M7JoBSDyFXLyiGqqy6PtuOhM=;
        b=c+0NOkdT/QqTSQAF6PmNLtGkrvVqf+24DUlL1C3JcbL8Qs+qC6YwzNQduLJK3ZfIf5
         GcOpat2T1/SRP1c8qU4mjI5+IKr+4kd2/y9GDiVCm+8HPFLLkxs1ed8K8OvY+HwB3zki
         Wxc349MPcU3SG+HM3jHs5nblFHwvw99+hHfopGVRkoJXg010FKnqAHvHGCNT1/MLpQk6
         nba4ogHEcTJvbUxcMFsOEuKfwXPaHrIT/3I2sDtll5QAg+J+wQbkURhT7iawRz2p1eJW
         zfJJ1LVAviH5illjT6HwVXi1+0fK9XNj5zSF2qTc63oaFdZ5Dn4KIC25PqKbUd2JF2yb
         778w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pldTMC4RaLfk2VlDsi1M7JoBSDyFXLyiGqqy6PtuOhM=;
        b=irzQT+DlneplYgIeINExngm9g2cMq5sDXYWj7PSJniyPCtgdJwvRQFRf9i+/f3ucJa
         kQSLYoGjshchOCVFNOoAA1cXldID6F2L9Bs86OLen85cCdsOqaScPOX3la95SLw4CbpQ
         ToiZFB5YBSupMxs6+P00MA9wNxXy5a+jw4X+EZXgM2Gio1aUqjYh8gcgl5xEr1sSLqV9
         uf/a42QtnATFWCDEP7PNb3gzo/Z3lUxHGiVSFsaf8mQpUpjv0bs1mby3odKEYWqWotIc
         MbEEeTNL7Ovxvz6SoasgVUe2RkzoHP8wmQAg0M+qr2UYajazdOwscnTFKGXRtUtfNMkN
         vC+Q==
X-Gm-Message-State: AOAM530H80aMfOv6elJQr7F8YMAnySGk8GiqY8JWzCyZ+IEgpZtDKm4Q
        ZyrwDKqSmf6Eoy9VXdjSMUvhThfs3//bHQ==
X-Google-Smtp-Source: ABdhPJxJpHkmDeikHdyonzJqnlmZZkB+TfvfV4pk5/CeTV94ATIJ+fr695BoYYJjI0oxRSz04MIjGA==
X-Received: by 2002:adf:dd46:: with SMTP id u6mr52747900wrm.280.1638880464586;
        Tue, 07 Dec 2021 04:34:24 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 04:34:23 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 10/24] drm/amdgpu: remove excl as shared workarounds
Date:   Tue,  7 Dec 2021 13:33:57 +0100
Message-Id: <20211207123411.167006-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207123411.167006-1-christian.koenig@amd.com>
References: <20211207123411.167006-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This was added because of the now dropped shared on excl dependency.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  | 5 +----
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 6 ------
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 0311d799a010..53e407ea4c89 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1275,14 +1275,11 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 		/*
 		 * Work around dma_resv shortcommings by wrapping up the
 		 * submission in a dma_fence_chain and add it as exclusive
-		 * fence, but first add the submission as shared fence to make
-		 * sure that shared fences never signal before the exclusive
-		 * one.
+		 * fence.
 		 */
 		dma_fence_chain_init(chain, dma_resv_excl_fence(resv),
 				     dma_fence_get(p->fence), 1);
 
-		dma_resv_add_shared_fence(resv, p->fence);
 		rcu_assign_pointer(resv->fence_excl, &chain->base);
 		e->chain = NULL;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index a1e63ba4c54a..85d31d85c384 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
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

