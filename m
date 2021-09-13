Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD62408E23
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 15:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238400AbhIMNbl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 09:31:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240003AbhIMNTx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 09:19:53 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9A92C0613E6
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:25 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id d6so14631726wrc.11
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E+vlHAHze2GbFEMjJ18FaF4XzFbDHKUq0E4VCOiUNuo=;
        b=cIaoNW7Pu71uAxZQrsu/xnmOwW4Bc5B869gtUROGkegEYgkxFg9VkD02qtnGbmKz0l
         r7HD1XwBYzQRvbt9qjF9ccsBOGjHtODOy1AGr44+JhyEb4vjHPFdomDedOEniYh8bB6V
         MdVentOMB0CkWNarQsEwl5Ru0CWRr4J+NntBzk7mFYxorok6dnYsv76Wg769nN/H20K/
         zStSwZi9jLzed5G+TRqiV2gHKeqm+0K5eGXNCgISkxmzGkQ4kdBAP6xnUdFrxpYAFHPh
         hGGEAXtwTeUE3L50+GZR/39vCe/CboqjmHuMMYpcZflJl0+JS7herysbSicpKlD1gBg0
         NloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E+vlHAHze2GbFEMjJ18FaF4XzFbDHKUq0E4VCOiUNuo=;
        b=m6UohxA7RpMma8ebA0HsA9DvEVbVY/MQXSP6cH4hgfJapYvlf3YRvc7K/wJvZWLcWE
         PLom4qjVlEDN1fzV8/Cj1PEQtbVvpSiVeSjJjCA0G67wd59nKjZvqAagQu+XwWNZscd2
         hrETDoIEcs7NMaqNWXq+YEr2rJWoD/ZKOgzFjMYFhXGM+q0km2Zyv7iOIcglsEOv2Rva
         a0837abdfWAi41/8TQNRO4oj2Vs4QPwkKJ3luvj1Yqtr7i7iB0ZQoUa8t5JVufY3DOpO
         RQqf857ykpHFWSXDi8VhY+pvejPYw6kLZWdcL7PSxAW8WkbftBgYu6ONYEVJmO61d7cY
         ecwg==
X-Gm-Message-State: AOAM533QwJSUKz9N/KDNF5Qk6fm3UV9+OnDUAe5wgtARGBIURHx7tgvz
        aH84uQSGSsxXTvfbR+34zme0OAwF/l4MNzDj
X-Google-Smtp-Source: ABdhPJxLsXI8wPKkwytM0i7YOK1uTgTTkrkYfOP7JpKZmiofMgoeOrjtHMbPc5TauiHJ7pU4s2Wl/A==
X-Received: by 2002:a5d:4a4e:: with SMTP id v14mr12452364wrs.271.1631539044369;
        Mon, 13 Sep 2021 06:17:24 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id h18sm7602834wrb.33.2021.09.13.06.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:17:24 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
Subject: [PATCH 09/26] drm/amdgpu: use new iterator in amdgpu_ttm_bo_eviction_valuable
Date:   Mon, 13 Sep 2021 15:16:50 +0200
Message-Id: <20210913131707.45639-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913131707.45639-1-christian.koenig@amd.com>
References: <20210913131707.45639-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplifying the code a bit.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 489e22190e29..0a927006ba9c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1332,10 +1332,9 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 					    const struct ttm_place *place)
 {
 	unsigned long num_pages = bo->resource->num_pages;
+	struct dma_resv_cursor resv_cursor;
 	struct amdgpu_res_cursor cursor;
-	struct dma_resv_list *flist;
 	struct dma_fence *f;
-	int i;
 
 	/* Swapout? */
 	if (bo->resource->mem_type == TTM_PL_SYSTEM)
@@ -1349,14 +1348,9 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 	 * If true, then return false as any KFD process needs all its BOs to
 	 * be resident to run successfully
 	 */
-	flist = dma_resv_shared_list(bo->base.resv);
-	if (flist) {
-		for (i = 0; i < flist->shared_count; ++i) {
-			f = rcu_dereference_protected(flist->shared[i],
-				dma_resv_held(bo->base.resv));
-			if (amdkfd_fence_check_mm(f, current->mm))
-				return false;
-		}
+	dma_resv_for_each_fence(bo->base.resv, &resv_cursor, true, f) {
+		if (amdkfd_fence_check_mm(f, current->mm))
+			return false;
 	}
 
 	switch (bo->resource->mem_type) {
-- 
2.25.1

