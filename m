Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4497045A545
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 15:21:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237881AbhKWOYt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 09:24:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237830AbhKWOYs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 09:24:48 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97248C061574
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:40 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 133so18933542wme.0
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pldTMC4RaLfk2VlDsi1M7JoBSDyFXLyiGqqy6PtuOhM=;
        b=Bj8VXu498aYHYw2Lu4AJkw2hjKPHM004v59aCYY/c412UQ+F9D+lBFy88aNGRE64Zm
         W/f+lajYacxiR9UAXH4vKn6KnNaDN8gPGNG0imzR0ICVxtOQmIct0SC2g42pam0pOnGT
         VWFNJquTH06BhLX2NWLSW3uk5nOkmzONn9jHG9ymLVvGmVyODCSdNbbKiMglKBeHL0Ks
         90orZdqnAW0//9BUybqCSVg8hEWNH0vGH0tQ7knBclRM2BWYPWUd0pPIjM6fkCU7WzM+
         PK5xtlMzKxjROS9h7K+ahT0AKrwoGarqDvgE59PB4dnmzRTGJm5d76tKIEKX2lh5NrvT
         Qtaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pldTMC4RaLfk2VlDsi1M7JoBSDyFXLyiGqqy6PtuOhM=;
        b=IyBxlgjzkExX1IfR9ZyFsw7tajTdnKyY050LGB912wBGK1gT6ANcoq4qmkhH4K1a1L
         aAfezoVjd831RlEFYk+bth/NvfZLNKdkieEY5NY7cBQ48HJvOucfw2qeByTHDUmaG/TB
         F4kZn5DP6ZpANS1ftbIfaKIYbx/JgsJxROXDHht7ZTzN2Zku+/gIwUejMrF2i+x7UeYy
         fB3ZVradPE5fnd8s0gFoL25bg47sGAUxSKeqjMhMugKydtZA1NkNkKqejXFlD/3F9w8o
         U2qYBH+bqQRbkui5opkfDIawFINpkMfF6Kme8Y20uUEcAEiAJdwFo5f3E1MhpgbrPYJe
         h62g==
X-Gm-Message-State: AOAM533l8tFa8Vi3jMZDbFGF4jJwLg5YG+s/na4fReE/4Iy5+arGj7ti
        cZTCRLyil17/h/nUC3ypbxA=
X-Google-Smtp-Source: ABdhPJz911F8IY9Y0VBvle8G+wVlmlq4mcVedn/iG/AUr/XpKjKYgEubS8eqreLXD4JqwGaF9cPBEw==
X-Received: by 2002:a05:600c:c1:: with SMTP id u1mr3426832wmm.163.1637677299261;
        Tue, 23 Nov 2021 06:21:39 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 06:21:38 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 14/26] drm/amdgpu: remove excl as shared workarounds
Date:   Tue, 23 Nov 2021 15:20:59 +0100
Message-Id: <20211123142111.3885-15-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
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

