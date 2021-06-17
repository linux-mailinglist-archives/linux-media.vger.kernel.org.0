Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A9883AB22F
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 13:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232466AbhFQLSS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 07:18:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232462AbhFQLSR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 07:18:17 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CEAAC06175F
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 04:16:09 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id g8so9292971ejx.1
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 04:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Y/imVMS+E7ZynWw7iSiIjDs1SxBWXyWjuW715+Mfo5c=;
        b=M2EfIXDhNhQGfnqZeXtxmNfwHZoQaW2MTVa3UzNYhdb2fsMUXtcdPuWkWBrGvEWEp9
         sDzydRS9HenKK/Y5oenkwtBngqHPZOEk1hYGnQcqYOfDW+JdluHZyfgpXR2DKVeYlOq+
         k/brasQwC83W9K83wlbEsSexWGzNhSHlavnvMoz0pj2IxjrQFD/EVPJ9HG3LKfY9nUg/
         Cnmuujua6BAvCTBE/nJOIP/+2mSp4qi2A1F+99Nwy53hzXnB6w/pnT0lkPjUPVfgJJVV
         wWebCzXZQ9+bl1u6+aK7nvKJDR7cRxPrcwUG01ob7hSLxVWgigrBvaJznD2ytWqOwcRT
         68ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y/imVMS+E7ZynWw7iSiIjDs1SxBWXyWjuW715+Mfo5c=;
        b=jGT4sVFyfN1MnR2k6E82NHZrjX9/faFXnK+v1LmFrjzHjWSg5PPUygfygwQNlQBy/B
         DrztM0T6NlKhQQcnv7x4bTHOxLtq4mC4bQ5hQ+VNVyzgG2pL93Jvp10zmbSvYP3HAyme
         TL7JsIw6cfmOpqtzxYd5J3Dv3ZSqozBmlLHM0Ww72+7DYR9sR+uAbdCTiUNtC6KNJLCH
         46gpbhRwAf9qGlEa1rDYNvYwG1VqAI/GDmpmMSQe/f/TN9kyJogZS0JH/61P33012ig4
         nekhsR7wJDGD8mD2IVKWd6K+ntrDdvpJqkHZECHaL49D1Fixr8tHc+NplWZoK0ijf4GA
         ieHA==
X-Gm-Message-State: AOAM530FCpOvoxN7ocl0aMSrgTcSVN9TYHq+A0GlXfnGpNmtzRSt6+dT
        eykX4tzmrU1G7f7ntlLpXGChIEQjrtM=
X-Google-Smtp-Source: ABdhPJxtONqJjTKNIkmenxgCWwIo2UFCZPig/Nqaq0PPK0Qw8TAhJetxxVTpxyIT5mpgKNhpreu58A==
X-Received: by 2002:a17:906:f6d7:: with SMTP id jo23mr4756958ejb.302.1623928568108;
        Thu, 17 Jun 2021 04:16:08 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8534:5e76:1ee5:f3ad])
        by smtp.gmail.com with ESMTPSA id y10sm3531353ejm.76.2021.06.17.04.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 04:16:07 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, sumit.semwal@linaro.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Subject: [PATCH 10/16] drm/etnaviv: use new iterator in etnaviv_gem_describe
Date:   Thu, 17 Jun 2021 13:15:52 +0200
Message-Id: <20210617111558.28486-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617111558.28486-1-christian.koenig@amd.com>
References: <20210617111558.28486-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of hand rolling the logic.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index b8fa6ed3dd73..6808dbef5c79 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -437,19 +437,17 @@ int etnaviv_gem_wait_bo(struct etnaviv_gpu *gpu, struct drm_gem_object *obj,
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
+	struct dma_resv_cursor cursor;
 	struct dma_fence *fence;
 	unsigned long off = drm_vma_node_start(&obj->vma_node);
 
@@ -459,19 +457,12 @@ static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 			off, etnaviv_obj->vaddr, obj->size);
 
 	rcu_read_lock();
-	fobj = dma_resv_shared_list(robj);
-	if (fobj) {
-		unsigned int i, shared_count = fobj->shared_count;
-
-		for (i = 0; i < shared_count; i++) {
-			fence = rcu_dereference(fobj->shared[i]);
+	dma_resv_for_each_fence_unlocked(robj, &cursor, true, fence) {
+		if (cursor.is_exclusive)
+			etnaviv_gem_describe_fence(fence, "Exclusive", m);
+		else
 			etnaviv_gem_describe_fence(fence, "Shared", m);
-		}
 	}
-
-	fence = dma_resv_excl_fence(robj);
-	if (fence)
-		etnaviv_gem_describe_fence(fence, "Exclusive", m);
 	rcu_read_unlock();
 }
 
-- 
2.25.1

