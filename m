Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9637441EA69
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 12:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353472AbhJAKIV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 06:08:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353394AbhJAKIP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 06:08:15 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5542EC061775
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 03:06:31 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id m22so9154568wrb.0
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 03:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y78+lw9uajwG2nya7zXv9lL0eVUeHEAbTx0GIeLnzI0=;
        b=BP6jRFQE6j4XrQH1SqYs4MKpf087zibEfrPSq4Yl8tJ6hUX1Ct8GXdHKSdGUctrhzh
         MCea6G8WbuliBoevLNWxXBhVNzlhG2fB8TysQ0cz+JfdOUNjAHSFtknVTzVLnzXbNIrM
         RJDLwKb7N7t0O42P4/jYaZhwS7L6jGYoqgNLG4KXhMjl1BMQ5dNJ53PFlPZ8UH1D7x/V
         b5wgjp0a/CSZvGmOUZ7r4lnSgUdFysONd3bqENiql/yc76UMLPs6yWx1kCY6xZYKWsoc
         S+X/uiLbvXDSgVKviXTmawH8Q6LDskU/tJu/MnrL459scjRVUXqQuN4zsoiS29dOKwYT
         zb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y78+lw9uajwG2nya7zXv9lL0eVUeHEAbTx0GIeLnzI0=;
        b=UEttBMwAxCHzeNxenWRBNWQ2etOrHiX8w8vZEYMMJb3kHzF/YvW2IG2ZB9EU39SqZZ
         YB10HpbU4e1ZXCSplK4AbAkT8heIdAOF5FeoHk/HU4hv5qc0AIhuNCDQWMLRviwzTpB3
         0nUxkVriINCnEOZn6/y7br2ubgvhhEGHIvs5LBylfjXbQYkSx9V+ZFoOAgAoindirHPU
         RWFq2BITDi7AFB6NVKZI2KQDbefAx6GV0XdMvIrD4+40lnvvXBJRz3WRFGTF9KRDjN+I
         4/rdV5/1JwjcjWLm7opr8RSHNkZKZEig+om6qk/rW+Dm5Nxnd2uQoXEBfD6uGXiRez5F
         4LBA==
X-Gm-Message-State: AOAM533imza70DM4847vEeCSK6ukxG1y5UjH9NMGXoj8L5RalyCAf01d
        18IKrRMiIjJdalL+n5VQC8E=
X-Google-Smtp-Source: ABdhPJxfUTaPbuI7VagQKKHsUlhxfQWHViZmyo/qnbH0HU/kn19HyeiJwQKHXYxtIJ5amoCPz2Lb6Q==
X-Received: by 2002:a5d:6ace:: with SMTP id u14mr11639570wrw.206.1633082789927;
        Fri, 01 Oct 2021 03:06:29 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id v17sm5746069wro.34.2021.10.01.03.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 03:06:29 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 19/28] drm/i915: use the new iterator in i915_request_await_object v2
Date:   Fri,  1 Oct 2021 12:06:01 +0200
Message-Id: <20211001100610.2899-20-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001100610.2899-1-christian.koenig@amd.com>
References: <20211001100610.2899-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplifying the code a bit.

v2: add missing rcu_read_lock()/rcu_read_unlock()
v3: use dma_resv_for_each_fence instead

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_request.c | 34 +++++------------------------
 1 file changed, 5 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index ce446716d092..3839712ebd23 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1509,38 +1509,14 @@ i915_request_await_object(struct i915_request *to,
 			  struct drm_i915_gem_object *obj,
 			  bool write)
 {
-	struct dma_fence *excl;
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 	int ret = 0;
 
-	if (write) {
-		struct dma_fence **shared;
-		unsigned int count, i;
-
-		ret = dma_resv_get_fences(obj->base.resv, &excl, &count,
-					  &shared);
+	dma_resv_for_each_fence(&cursor, obj->base.resv, write, fence) {
+		ret = i915_request_await_dma_fence(to, fence);
 		if (ret)
-			return ret;
-
-		for (i = 0; i < count; i++) {
-			ret = i915_request_await_dma_fence(to, shared[i]);
-			if (ret)
-				break;
-
-			dma_fence_put(shared[i]);
-		}
-
-		for (; i < count; i++)
-			dma_fence_put(shared[i]);
-		kfree(shared);
-	} else {
-		excl = dma_resv_get_excl_unlocked(obj->base.resv);
-	}
-
-	if (excl) {
-		if (ret == 0)
-			ret = i915_request_await_dma_fence(to, excl);
-
-		dma_fence_put(excl);
+			break;
 	}
 
 	return ret;
-- 
2.25.1

