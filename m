Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A185F413896
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 19:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231468AbhIURjC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 13:39:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231386AbhIURiz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 13:38:55 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56111C061575
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:26 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id i23so41645978wrb.2
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jIUir/k9ok0mhA9lZLcDk0nsv9skwzmV2ts7X5dBo9o=;
        b=qNFqSzSSKxBU2c+wJ5dNSFN3fmWJWKj5/S4wITuPePVjHBThf10BU6Ze2py7g3GP6T
         TM6MV+9qgUO0IlFwkr3BrgNkBAKd93By5Yus3sXAyJMWVRy8kO9yzZ9NfpNQ5RPBWZd8
         DwHc2mgfbLsoF5nocFHowXpq3ZxK56Auy3a4Trd+wJli9+gjHxwtA4BOQVkPnnjtH2gf
         VloDBtHT4iwZzoTRUejVNkoQWsSp8TfEsgAutrQl9Dc2obrhEVcICN/BHYm9e1nQVjjg
         jnVEIBTjknqgbeHpF1FqEVd+G8u5EMgpLpVn52kxOGHrqLtZUMjWhnE7rePe2qbbLSps
         eQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jIUir/k9ok0mhA9lZLcDk0nsv9skwzmV2ts7X5dBo9o=;
        b=wxLBpqxolpqrounWv+ClDfSumyxVmnsCDtBrodHpAkoz6sd6yJwfsU+YXk3AUVqfg8
         m3M8MQVI7Y0HQ+iuBhKu3laqCJdPmEhPrzy4RDui4AoTtp9Oeg/wewlka1U4DSXkP6Y5
         N7vCXgS8pvJi3MUeZOlxEaGUWCoaCnhbIXqYINJSnHYFabuTD/Yk5fYHofCqvNWd2cA3
         e/zRjGjabtayhnkFPVHAWuYuxj2ga/mfhV89qN1L1NutHjc86RyT22WAQ5EHfVm7iF69
         5D5EstgxV0GDuOlq6sUHsxGEHQ7aLZS+f4izs0beSc/E5uFaK85D8TkQdg0fRfRn4vDB
         3VIQ==
X-Gm-Message-State: AOAM5333gLte2/8h01Cv2qRlbM/F/V5HDO5iQ8t43lrLuMNrIhnG9p7w
        pfu1Ek05Mn9EZ9fEtn0j1TI=
X-Google-Smtp-Source: ABdhPJxOWEBg2QDxOb4uSsvYLkB5zttxf6ozsEDB1Zi+AcbsCDbTDDFsJzVS3kZiRxPdXo9f6M61xg==
X-Received: by 2002:a5d:6944:: with SMTP id r4mr36621549wrw.186.1632245844899;
        Tue, 21 Sep 2021 10:37:24 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id z13sm23310477wrs.90.2021.09.21.10.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 10:37:24 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 24/26] drm/etnaviv: use new iterator in etnaviv_gem_describe
Date:   Tue, 21 Sep 2021 19:36:57 +0200
Message-Id: <20210921173659.246165-24-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921173659.246165-1-christian.koenig@amd.com>
References: <20210921173659.246165-1-christian.koenig@amd.com>
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

