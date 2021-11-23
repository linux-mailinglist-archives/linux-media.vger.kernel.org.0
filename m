Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D63645A547
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 15:21:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237941AbhKWOYu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 09:24:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237830AbhKWOYu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 09:24:50 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31D4DC061574
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:42 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id n33-20020a05600c502100b0032fb900951eso2407591wmr.4
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qBmtGbBu1QXhKmWazU6APumSvKhR6nIEoW+jVAv5tCQ=;
        b=aEZ/5Co18nmkp4u62saEitAQxChSJWjNnhcmwRyA7HJWR3C3GTieWR2z66rxkMFfq+
         tS4X5c47nYBWxBnijFMqa9zD0nNrtGgqN+EOxv92Fi7QkseSFSHXuT3xv6kWnOAzPbDV
         4zy4ec69l7ELE9julXZ/0CnQijZK4TNtcZjHH/YagK1wCHMCLtM80e6mc8qroihM/xYt
         +aBvAZ7f1373MuUiM2oZ9wjxQ2g7tfmrnh+eybJqnpzG56xXtCGv+qr8VbtplHFlj3vL
         pkhUgI2D5Lk+le3R0J9UE94THxI2DlHtKNlmmKKHVsbbpcMjL9kPE9tczUyAHjCcZJpL
         R35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qBmtGbBu1QXhKmWazU6APumSvKhR6nIEoW+jVAv5tCQ=;
        b=dTUbUPWkAABtSK3N9CoKKr+lueO4G4WMXZGu5m1G+yG6CYNJEoWj6G0MrrUSrUsEtv
         g6Ml2bMMN1rQFgTNZh2rFQDQXKrItHpjgZr7mdwzQdP7M1Dqd3FOvWtBcofBU75aMgO1
         0C8TDanWOCkn2/mSKtK4GLZSSegTVQ/FW+g6mXj0R7jUxBtVIkxZq6ig2uDvI4IBUMxh
         OfrIJIQriEocF3fqOiWW/X5gwBYhKcRfvoW8itzoSWkfjgIDmIvO+9KLBapi7csyNu8r
         9g+tQSQyh9Hs7VcMtcIpvgQjk+dtwxCClX1Birs3Zv65CUiitn+QRaHeqbkw0IcEFvt3
         0l2A==
X-Gm-Message-State: AOAM533zHFpNP0YDywLco6JmZBHvwyAPELX7PCa0oXhBkqtKejPMuQy1
        ss+LRAR+1tbo8lKt1T71RIQ=
X-Google-Smtp-Source: ABdhPJwU5ehlAAReHLP8vmHUQVVd0ybuX/CrJukp6q5v77UxVmI5GfpdLM8DWJnlQ9mVR3h91d45Bg==
X-Received: by 2002:a05:600c:4e8d:: with SMTP id f13mr3661249wmq.7.1637677300824;
        Tue, 23 Nov 2021 06:21:40 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 06:21:40 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 15/26] drm/amdgpu: use dma_resv_for_each_fence for CS workaround
Date:   Tue, 23 Nov 2021 15:21:00 +0100
Message-Id: <20211123142111.3885-16-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Get the write fence using dma_resv_for_each_fence instead of accessing
it manually.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 53e407ea4c89..7facd614e50a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1268,6 +1268,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
 		struct dma_resv *resv = e->tv.bo->base.resv;
 		struct dma_fence_chain *chain = e->chain;
+		struct dma_resv_iter cursor;
+		struct dma_fence *fence;
 
 		if (!chain)
 			continue;
@@ -1277,9 +1279,10 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 		 * submission in a dma_fence_chain and add it as exclusive
 		 * fence.
 		 */
-		dma_fence_chain_init(chain, dma_resv_excl_fence(resv),
-				     dma_fence_get(p->fence), 1);
-
+		dma_resv_for_each_fence(&cursor, resv, false, fence) {
+			break;
+		}
+		dma_fence_chain_init(chain, fence, dma_fence_get(p->fence), 1);
 		rcu_assign_pointer(resv->fence_excl, &chain->base);
 		e->chain = NULL;
 	}
-- 
2.25.1

