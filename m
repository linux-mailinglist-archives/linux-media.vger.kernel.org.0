Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E61074F7ADD
	for <lists+linux-media@lfdr.de>; Thu,  7 Apr 2022 11:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243530AbiDGJCH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Apr 2022 05:02:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243523AbiDGJCF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Apr 2022 05:02:05 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79B9B11DD18
        for <linux-media@vger.kernel.org>; Thu,  7 Apr 2022 02:00:02 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id x20so5573219edi.12
        for <linux-media@vger.kernel.org>; Thu, 07 Apr 2022 02:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cJnlk9Oe18dreLhx9uK9ZwzcTZstYY5iUuUfkW8tRrM=;
        b=l2gjx89JUUtewB70mA2emV55sPZiTfAi1iEeA9vMVFBvGhGRfb5pueQojIJxWZ2CUv
         cMXLooNuYPfOgXmDvsDzpMIwkdeaISPyy2/s4xZEF22nv4BqiYRhWJ29tTGizcZqDtc5
         LISUMM2tv7hWHZYeP5J3gkjwXgrMlZkMXvtIOcOK9oK2KVubkeZ1vCpi0Om+drJq/4Iv
         XtGDB6y8hzgZkcQ10/ufDpNfgN04DK/n5Gldbyt7aJNaYIzcgyDvvvHgaZ97AY9/xEwS
         PYtX5LpOPCufWjFmaI3c5QF/FHPOz6N+lorzoO8MSxc+yKxWmv/M2E7kcyIEmAGokuIM
         KTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cJnlk9Oe18dreLhx9uK9ZwzcTZstYY5iUuUfkW8tRrM=;
        b=KCS2l9cFcGn7V/6roMBCs2pyaQBe1SL4dp0X0rQngyc3HECeNwMkVqVLvmvfzWU+Tu
         X9ETl2MGrmp1A4vRjhAAFmJsLaekZGyidVvro6Yseg3rcpZjnPc6WkVe8e6MmORXjN7r
         wV/Y1Smv2PNnBBQAq3Twbh7eF4Rl+qk3tAVSxkieLVVq8RubVsgw2dcChrC5OYdYL7Jy
         v3YEKyYsseYMwLYjs2qLKXXpUdh5dTFpuym/6kg/LQNr6GsvHpKM9C1z3P//jOg7ds9I
         R2b6CgRrSMivmfkJUUHaOHdqdvXkP4amB1V9FyVUFG53+9L9IDACLqNeHzST83InNDbC
         tJYQ==
X-Gm-Message-State: AOAM531joxRVLXlIccawClK38B+8TNWcREsSFI+MS2PD5wNz5zFQY4aZ
        dGVZssqU1jEqFm85K6JBOD8oboO/j9I=
X-Google-Smtp-Source: ABdhPJz10luuyog+RiWlnfRijKPRqrjTT5XDcO7k91kIKNaQlGO+86J2TKiPrmCi9PjeJ0hM4s96Sg==
X-Received: by 2002:a05:6402:42d4:b0:412:c26b:789 with SMTP id i20-20020a05640242d400b00412c26b0789mr13097363edc.232.1649322001125;
        Thu, 07 Apr 2022 02:00:01 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906111a00b006e778bd4fc8sm5186563eja.38.2022.04.07.02.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 02:00:00 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        intel-gfx@lists.freedesktop.org
Cc:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 10/15] drm/amdgpu: use DMA_RESV_USAGE_BOOKKEEP
Date:   Thu,  7 Apr 2022 10:59:41 +0200
Message-Id: <20220407085946.744568-11-christian.koenig@amd.com>
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

Use DMA_RESV_USAGE_BOOKKEEP for VM page table updates and KFD preemption fence.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c      | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 5031e26e6716..808e21dcb517 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -263,7 +263,7 @@ static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
 	 */
 	replacement = dma_fence_get_stub();
 	dma_resv_replace_fences(bo->tbo.base.resv, ef->base.context,
-				replacement, DMA_RESV_USAGE_READ);
+				replacement, DMA_RESV_USAGE_BOOKKEEP);
 	dma_fence_put(replacement);
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
index dbb551762805..9485b541947e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
@@ -112,7 +112,8 @@ static int amdgpu_vm_sdma_commit(struct amdgpu_vm_update_params *p,
 		swap(p->vm->last_unlocked, f);
 		dma_fence_put(tmp);
 	} else {
-		amdgpu_bo_fence(p->vm->root.bo, f, true);
+		dma_resv_add_fence(p->vm->root.bo->tbo.base.resv, f,
+				   DMA_RESV_USAGE_BOOKKEEP);
 	}
 
 	if (fence && !p->immediate)
-- 
2.25.1

