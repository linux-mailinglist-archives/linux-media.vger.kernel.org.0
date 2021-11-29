Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8AD646164E
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 14:26:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243368AbhK2NaJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Nov 2021 08:30:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233319AbhK2N2I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Nov 2021 08:28:08 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BD18C09B071
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:18 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id j3so36293681wrp.1
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pldTMC4RaLfk2VlDsi1M7JoBSDyFXLyiGqqy6PtuOhM=;
        b=NXIfDAaQ1BF3hKDmfKrx0LttajQYL6RtJf+1p4ZsPv5RL37K0ane91/wkNiQgVwuhL
         or7BDdF/S85jyaKQwg1yNxzqZ/0f1mULxLUk47jbvZ2rA6+6J9/b8ECML9A5Wg+bifpR
         /gyWBOFGUNo8PGVwHJdqSBeD3J0Bivf4n9LwUsrI6AqDmDQrCJAKjXAGdSJnp8pPa8WE
         6TZPEya5D9AAeLQVuOqwZXm43sTfKcmWtWs8UfTvEZVOv5F5g+ZtKdjBrE7DmWoYhjjQ
         iH7OMOnACRfw/KyjPgkjqEnsuA6qrI/ltnYGlaXZkyayoCzpcnq+kmy9Y5h161C6AwM1
         c/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pldTMC4RaLfk2VlDsi1M7JoBSDyFXLyiGqqy6PtuOhM=;
        b=iULxx5ja3Bv4w/7ErLXfMWb9JfijXscyRaOqf2vjiWsYiR5JSujCEZYPrXDmHphnBD
         LOxS8XLXXCMLm7k/q8xT6lF2um/8X3lzI0sGy25mV4tvi1XztpJKzr358VzOxzLFz6Fk
         9bXh9ze+69bkQCCxRvD9VKV9yQCeQ10GHLkKsYAgF8SW9d6mgxR+G3nG7LdnPgEIonAb
         r18BoKoz9EcCvglDPlYvJg0rgF5i9vHGtHjFm/b/OcDlemteh2IcKNa5eCW+urShJ8id
         M4C6kP97XzhbxCkkrmGtupjnZsPQG1Nn2VVEchOMsDhQ0eSimsSF9mx+rPnZZxhx9ZQL
         KPDA==
X-Gm-Message-State: AOAM532HgkO7bSvMTg5P2a6gLmb6qF4VJT5auXxNRuvUf7L/gzVaI8IB
        svlHd/H3B7Ykvv4kCf1OBg+05g8lyRo=
X-Google-Smtp-Source: ABdhPJyh5pEO5g2mwwyaLStXH0XC8zZcDrYA7MtxctYQ2fN21UoLzY9IpgPMs/eB69iqJMqY5fnNeg==
X-Received: by 2002:a5d:4343:: with SMTP id u3mr34055061wrr.450.1638187637034;
        Mon, 29 Nov 2021 04:07:17 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 04:07:16 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 14/28] drm/amdgpu: remove excl as shared workarounds
Date:   Mon, 29 Nov 2021 13:06:45 +0100
Message-Id: <20211129120659.1815-15-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
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

