Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C521A422535
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 13:38:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234479AbhJELj6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 07:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234470AbhJELj5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 07:39:57 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BEA8C061749
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 04:38:07 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id k7so36616234wrd.13
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 04:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=99i5D3wyL80PzFY23pT70i10IrSlrn1OjZ/9oRLQj94=;
        b=HC0YUY7zostVVN6Uj/chvxuJpIrKKhTM3znTwTO6/QPx6LPdCN+6X6rDUjhM1/tt4a
         FiZV984VSAYawnWNeybqLyxlheeqH4dU79pmqJP9Js0CrRJxO+6RybK6NWy8KPi9Yp1c
         sPRUYFFRQlILyWRBZUaM36nc8+faJoXTV0RjyeRoWxXVr7NSqNKifbro7wrggy45TW/H
         nYtP4aQa9vj7Y78mdoog7KyOqKUeatEJPhJyQ7On5JcCrE0gcbXiG99hrUmgWvkbhdM/
         a4giukIvX9eDIuQQJb9xfvVtRfTOU9gid0IYuEY1DictnHP4cklGzVs7B/3Pihd6aDck
         /RGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=99i5D3wyL80PzFY23pT70i10IrSlrn1OjZ/9oRLQj94=;
        b=yJuwP3H2Hp0KKHtrgHrIJSGVXKg143asmGvolQFJxIft3vEZsWbFEtaNunB3w57KRD
         PP3jXzZg2lNHcow1shOTG10zdZuKV5D/KlqBZtaJTCdKO1f7SDxiqeM0e5uGJNLiK4Aw
         iJLKjiTW3KsUSkNcTPoXF5rodmt12p4QK1c8QSf1tPc72tB6L59+Av965gvPPj5fMGqB
         y0Zdwj8I8HnrFgVizLXriM/bBLWpQUk4K6WCYLpnT7pmBxQUFsKBb1ZBzRZLqZ8mkmt/
         mBznppNqmJ1pfLVbxfvaIru0L1F6oLonT21+QuWtWmyy1biDOAXuGgph+shXmwjIpXzW
         luTA==
X-Gm-Message-State: AOAM532ZrEVKL1kem8sKgLJPbIP2Hq4AgunjLqE8RMsaKTk2h2RzEasr
        KsJiCD/rcgFwnnLmLQngtUo=
X-Google-Smtp-Source: ABdhPJxoIw+5xj4/957H3iLKItAuRkDyREWwpI72tdDYTCwpNUfsh8nl5b0khPgnl2+T0LZwN8Zw+A==
X-Received: by 2002:adf:f507:: with SMTP id q7mr21072954wro.7.1633433885717;
        Tue, 05 Oct 2021 04:38:05 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c5sm1739912wml.9.2021.10.05.04.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 04:38:05 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 23/28] drm: use new iterator in drm_gem_fence_array_add_implicit v3
Date:   Tue,  5 Oct 2021 13:37:37 +0200
Message-Id: <20211005113742.1101-24-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005113742.1101-1-christian.koenig@amd.com>
References: <20211005113742.1101-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplifying the code a bit.

v2: add missing rcu_read_lock()/unlock()
v3: switch to locked version

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/drm_gem.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 09c820045859..4dcdec6487bb 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1340,31 +1340,15 @@ int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
 				     struct drm_gem_object *obj,
 				     bool write)
 {
-	int ret;
-	struct dma_fence **fences;
-	unsigned int i, fence_count;
-
-	if (!write) {
-		struct dma_fence *fence =
-			dma_resv_get_excl_unlocked(obj->resv);
-
-		return drm_gem_fence_array_add(fence_array, fence);
-	}
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
+	int ret = 0;
 
-	ret = dma_resv_get_fences(obj->resv, NULL,
-						&fence_count, &fences);
-	if (ret || !fence_count)
-		return ret;
-
-	for (i = 0; i < fence_count; i++) {
-		ret = drm_gem_fence_array_add(fence_array, fences[i]);
+	dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
+		ret = drm_gem_fence_array_add(fence_array, fence);
 		if (ret)
 			break;
 	}
-
-	for (; i < fence_count; i++)
-		dma_fence_put(fences[i]);
-	kfree(fences);
 	return ret;
 }
 EXPORT_SYMBOL(drm_gem_fence_array_add_implicit);
-- 
2.25.1

