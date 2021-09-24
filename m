Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46DFC4177B4
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 17:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347212AbhIXPdS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 11:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347211AbhIXPdR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 11:33:17 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07CD0C061571
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:44 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id d21so28562482wra.12
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jIUir/k9ok0mhA9lZLcDk0nsv9skwzmV2ts7X5dBo9o=;
        b=OaedxYvHghmjqk4DBag2kWlEQZeISxgQBnPcRCG5N4NPM1OqwH9utjCi/E7qmvqPAO
         63nXRQ0FZgU2WClkMphgqMFB+2765rp9KhDXZfEl/d1ExnvmGUgDOmYF+9gkzBd3iYM4
         AAiVOYVCMVN+xyKIbuD0SWsBYl9M8p2LS3xGf3Be3gYopRJCnrHJwSmDwqKqFWuFPaNB
         ap48mrEfys/ZGfWz8LFuYpqjqmQFzUw7A47qH09zgf+aEmF73HIMtdSU4To54BEsUtes
         gkJFAKyWEXk+t979Q4WhmL0nrDhcekrMPLMaLmZfGegZUsE1QWy/922WmOkcG/p6HQ8C
         6w0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jIUir/k9ok0mhA9lZLcDk0nsv9skwzmV2ts7X5dBo9o=;
        b=ws9QKZAp08/CzOd8gO2ECuGIwF6nVLLBTUUS6ANgFtfvMUTYdaVmrXzcYM7MJ4OzMx
         aS7oWrFVP7sOBaTG4CZC5Tqk1AYkEk6mVfJzsaS2rOZlxCqkMjbqH7ZtTSPsi45mcySU
         kkwXoWGCUzzfVx9X+oNbhct95B3DmEeddAtGD2NeUuYxdI2cQP+fEcWL/QWvLrd3/nqM
         ScsrkCKQ/rBzpMAQlLoEAiQyKXNU6uf+0Pz+9O4YO3VftSUIIQV5n57d7ewGu7vU8IvZ
         QQavhowfAUVhjeZKWqcd1hw10ppvOMlVn9r41/QLS2uqCyXnWwVdqQOfsTIFoSZOn/HJ
         VefA==
X-Gm-Message-State: AOAM530oiRdeMJuyFVJYqZzSn/Ta+EUzCriPx3P4lUVJoqubOJGov5ye
        Km5nnVpm/mRZBJq5PrpugLs=
X-Google-Smtp-Source: ABdhPJz8idSpsAtOJoVoMECo8YlmNubvC2BJykpIFF14bKjqW+Dmv7uDeIq1SLFp6iGiqENrmWyFnQ==
X-Received: by 2002:a5d:6292:: with SMTP id k18mr12306437wru.110.1632497502693;
        Fri, 24 Sep 2021 08:31:42 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id u25sm9902248wmm.5.2021.09.24.08.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 08:31:42 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 26/27] drm/etnaviv: use new iterator in etnaviv_gem_describe
Date:   Fri, 24 Sep 2021 17:31:12 +0200
Message-Id: <20210924153113.2159-26-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924153113.2159-1-christian.koenig@amd.com>
References: <20210924153113.2159-1-christian.koenig@amd.com>
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

