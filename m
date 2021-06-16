Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30EBE3A94F0
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 10:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231666AbhFPI3K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 04:29:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231602AbhFPI3J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 04:29:09 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EC42C06175F
        for <linux-media@vger.kernel.org>; Wed, 16 Jun 2021 01:27:03 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id u24so1521675edy.11
        for <linux-media@vger.kernel.org>; Wed, 16 Jun 2021 01:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ND7KwC2J9bqQZCM3dXcypP939eYSZ8A7ifwwevA1684=;
        b=unqs/raZ1t5J4i0tVMb8sZRh9eQVDcU+0zh4oyD9beiUYRJFxM0B6pk7bdOaSRv6pz
         ALXYdvQLZ6aV6zWNTRTeW/y/XkFlFbPJ+A9EIeBHMK5zR760JaTihUqsgb8FecRjuHKc
         A2YBF7tB3TSkCzFPDmcwzeuZ9+OX1ZbomPk3SV/kzWe6/vS2HO3oOQGTTunKbCvELRoP
         K0cPNjiWbjaJHsNkgwAjFWGMGjoOoSQ+wfkoncM4ivOQWAqmL7fRrqMuWYYpVW+NvLKh
         daOem2XyiML/PNHiudTUm5y7hyCDxNpTx92LDOX7Yoxw6ingJzlFpSiPeDrHJOqSFQ+N
         40Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ND7KwC2J9bqQZCM3dXcypP939eYSZ8A7ifwwevA1684=;
        b=pY07tscKMXzxxzKSNmWsXmeRyuyE4L+6r/IwZOarIpiO4tELVAe2sPTPnhb4n2OceI
         VQ/Pa4z2ZItuCFrHXtP9fT+/9CPI7yzQYATLHC0FJgQtXE+9qaLl5eF6gURkqMzeRdWa
         FT1FqJFwj7MSYUFzexVzbYdROTMO5/PM+d9l/SvIaeUyfAFIvtH5JdHW0CFInyh9D9q1
         VcFqrU9DXqSlXMddZ9zYuXwtIh2syGNkrZxDn11twOEeevvNb/T2CBkgDCu7Ih3zR7jj
         Kq0H9iZg8mSDO8A6J/Uh6MuYihAyawLWieC2M9ZjO9wUkbj/CRj4TjtpWWRpMLw3a9pb
         fsHQ==
X-Gm-Message-State: AOAM532TGJcWMG/siMmSnKosa2O2hf/5HMLJfuG7zZJaZ7sTsRxsRGfE
        bu7W0UVfs7ldp5MjJemau9E=
X-Google-Smtp-Source: ABdhPJxW25RCxGgBd4Rp2bAkplsJ1rs8Gw3ttP6+9OZanazszl0LNYDwjaUxdetHpXeEzpHYeOcshQ==
X-Received: by 2002:a05:6402:520c:: with SMTP id s12mr2753961edd.304.1623832022213;
        Wed, 16 Jun 2021 01:27:02 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8b88:17a4:582b:121f])
        by smtp.gmail.com with ESMTPSA id v7sm1152639edx.38.2021.06.16.01.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 01:27:01 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        sumit.semwal@linaro.org
Subject: [PATCH 4/7] drm/nouveau: always wait for the exclusive fence
Date:   Wed, 16 Jun 2021 10:26:52 +0200
Message-Id: <20210616082655.111001-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616082655.111001-1-christian.koenig@amd.com>
References: <20210616082655.111001-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drivers also need to to sync to the exclusive fence when
a shared one is present.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 6b43918035df..05d0b3eb3690 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -358,7 +358,7 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool e
 	fobj = dma_resv_shared_list(resv);
 	fence = dma_resv_excl_fence(resv);
 
-	if (fence && (!exclusive || !fobj || !fobj->shared_count)) {
+	if (fence) {
 		struct nouveau_channel *prev = NULL;
 		bool must_wait = true;
 
-- 
2.25.1

