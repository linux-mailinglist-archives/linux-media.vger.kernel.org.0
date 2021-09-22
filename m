Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C4BD4144C3
	for <lists+linux-media@lfdr.de>; Wed, 22 Sep 2021 11:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234340AbhIVJNP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 05:13:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234349AbhIVJMl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 05:12:41 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D7B4C061574
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:11:11 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id t7so4542169wrw.13
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jIUir/k9ok0mhA9lZLcDk0nsv9skwzmV2ts7X5dBo9o=;
        b=har+vsS8yRNzI3s10KW66JS2Uu8/I1YaY29brQx2gQ1PejRghzu41MOrbFMZGiCtX9
         WY9NLw14sMvICKVqjxXpueP6NBfQOyv14ovyW2nRQ3p2LqqSvhnyQSVSyVNvTEzqCj3H
         4eoNk3lQZVSW4rigPwVRYJyVaulFQPSukt5u9kmOrBvmp/dw2HzXyGyi18fQOU9Xfl1n
         TaoYf9lhBR8CLQjbrQ/nJ4LE94O0NHarXxHtQtfm3IvzI2aMmWmYQ4nFy/CUe17VkWhQ
         TgCYuvnyeh3FXeW2AiQWhXSlXZs/f6GutP+5OCsKfyES/YkYNLJzYAU8/pmqiXH3i2Jb
         6H5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jIUir/k9ok0mhA9lZLcDk0nsv9skwzmV2ts7X5dBo9o=;
        b=XzaFWLQgIdGen8c8LzFcXMD9SvxFZeUAWNMf3HjA0PoOoDyx9rJ7eiLMfVjsH2iqaN
         aY+8s7+XQCm2GbzItpnJnBrLmav/AUxy0qfQqbA8dTeUwOPyQSK0zMNQQmxhON3ncT17
         PXoTMZ2g4bPd3dUHFFjwlDaKxGmbSSuVAJrBh1fcpduU+ZjvSdGUdo5FFv6d4AiSGJZ+
         ffpQl4aBoxVR1PH20A+IqQj2g2nMej3LQPiuU8ZY8MTa0j4mx8n6EOqtWNu8RaAWLXxa
         Ju9OoJT0HWYvk+9LXMsjO3ZrnkILeuXg7GxhT5UpWUWLkURqmNwgo1y5Rr7vTpPpaNUM
         9hUQ==
X-Gm-Message-State: AOAM532Z91XaqBARCv/ZHU6xP+Wcr4yGZezrP3vHyBA4QezXtfJE/NvP
        OxJAtt6OxoOnQPocqCY7Q1arDJ39Zdk=
X-Google-Smtp-Source: ABdhPJwu/swkkmUY+jKJHmtIgTzIWYWlBsRn/NA0iNxUPAuP0MfzAeeURtllkSsSbtHNWiKwkY9WwQ==
X-Received: by 2002:a05:6000:18a4:: with SMTP id b4mr33407538wri.96.1632301870190;
        Wed, 22 Sep 2021 02:11:10 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id r25sm1535515wra.76.2021.09.22.02.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 02:11:09 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 24/26] drm/etnaviv: use new iterator in etnaviv_gem_describe
Date:   Wed, 22 Sep 2021 11:10:42 +0200
Message-Id: <20210922091044.2612-25-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922091044.2612-1-christian.koenig@amd.com>
References: <20210922091044.2612-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of hand rolling the logic.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 31 ++++++++++-----------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 8f1b5af47dd6..0eeb33de2ff4 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -428,19 +428,17 @@ int etnaviv_gem_wait_bo(struct etnaviv_gpu *gpu, struct drm_gem_object *obj,
 static void etnaviv_gem_describe_fence(struct dma_fence *fence,
 	const char *type, struct seq_file *m)
 {
-	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
-		seq_printf(m, "\t%9s: %s %s seq %llu\n",
-			   type,
-			   fence->ops->get_driver_name(fence),
-			   fence->ops->get_timeline_name(fence),
-			   fence->seqno);
+	seq_printf(m, "\t%9s: %s %s seq %llu\n", type,
+		   fence->ops->get_driver_name(fence),
+		   fence->ops->get_timeline_name(fence),
+		   fence->seqno);
 }
 
 static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 {
 	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
 	struct dma_resv *robj = obj->resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 	unsigned long off = drm_vma_node_start(&obj->vma_node);
 
@@ -449,21 +447,14 @@ static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 			obj->name, kref_read(&obj->refcount),
 			off, etnaviv_obj->vaddr, obj->size);
 
-	rcu_read_lock();
-	fobj = dma_resv_shared_list(robj);
-	if (fobj) {
-		unsigned int i, shared_count = fobj->shared_count;
-
-		for (i = 0; i < shared_count; i++) {
-			fence = rcu_dereference(fobj->shared[i]);
+	dma_resv_iter_begin(&cursor, robj, true);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		if (dma_resv_iter_is_exclusive(&cursor))
+			etnaviv_gem_describe_fence(fence, "Exclusive", m);
+		else
 			etnaviv_gem_describe_fence(fence, "Shared", m);
-		}
 	}
-
-	fence = dma_resv_excl_fence(robj);
-	if (fence)
-		etnaviv_gem_describe_fence(fence, "Exclusive", m);
-	rcu_read_unlock();
+	dma_resv_iter_end(&cursor);
 }
 
 void etnaviv_gem_describe_objects(struct etnaviv_drm_private *priv,
-- 
2.25.1

