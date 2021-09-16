Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76E5F40D8C0
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 13:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238307AbhIPLcb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 07:32:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238286AbhIPLc2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 07:32:28 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8650BC061574
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:31:08 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id t8so8947236wrq.4
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2+bkO5HBs2j3ln93bw25BJPWcYxbkv7E+H/9pqR/bfQ=;
        b=mP52YOcL+AxVz3KiSw3fvvB9zkcKwA/zAUKLTenIz5Oa1eenF2UaMiJf4ra00whqaT
         jSRK3l7QP14ml2qIGTeNfa4mBRahp7oCn/FbkqEajnMzw7oMWv0ytpqRdB8rHpJQfV98
         iqQ6i2OdCDaxwtNFokVlZ3g603hb7V1Y/yWR+0OP3lijze9oSpZnE+168aLNxKXify/w
         jVoJ99rwc8PwZFq5usRU8v6xRmanjkje93JcXitEZirN5uC5yO8/CS7PqemNJrPcLtoK
         tff06ih+3C+88UMEFeKpXjQQ8EebwJqohzX+jb8I9ubBrJKi2kZfzPAfyZTgPB0Mtmds
         t3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2+bkO5HBs2j3ln93bw25BJPWcYxbkv7E+H/9pqR/bfQ=;
        b=WysoO3EGYWhQhJMlbeW8/VhPTrOfZWzIeXuX60eN6imA8DfjxfnqPAO7Zjvrv1KYi6
         mGIvPA1JmBgEWZvLTOvCYD+iUkYdJcfDCLs5pGNH5j4nYmPFxld7EHrPdpfGF220IYfv
         s+B1FsS8OF944VV7nzeLf2nPse8VcOLieJ8aB2xPD1mfitkoapX6vWeXtwwu6ADi+JCo
         imvThEWvLYFOSKhpChhqx392/GdxlOB9EIhjpGysK2samzI8V7xqmWCuWnJyAKGGmogy
         Viu/1XKp6YHUqZITz4fjmRYDVVuXxCKvlPx5zlqnZ/PvYVMI7dB0Q3bYYWppokNadhmu
         mUdg==
X-Gm-Message-State: AOAM530Z+0IbwkpMkAtZ+kkdw5L+wawYnq9ISYm44KSEsG2qTFamT4OT
        YWu1nrbwuYLKonb2cpo6fgI=
X-Google-Smtp-Source: ABdhPJy4mIlf7AvTUapLD1nLkmHwTh8uuMjAJTBuggOraBaigWUULuCE0bYamy+ETUj70VPoDk9jYQ==
X-Received: by 2002:adf:cf10:: with SMTP id o16mr5453601wrj.12.1631791867219;
        Thu, 16 Sep 2021 04:31:07 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c17sm3803674wrn.54.2021.09.16.04.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 04:31:06 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 24/26] drm/etnaviv: use new iterator in etnaviv_gem_describe
Date:   Thu, 16 Sep 2021 13:30:40 +0200
Message-Id: <20210916113042.3631-25-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
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
index 8f1b5af47dd6..dc2a2615db38 100644
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
 
@@ -450,19 +448,12 @@ static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 			off, etnaviv_obj->vaddr, obj->size);
 
 	rcu_read_lock();
-	fobj = dma_resv_shared_list(robj);
-	if (fobj) {
-		unsigned int i, shared_count = fobj->shared_count;
-
-		for (i = 0; i < shared_count; i++) {
-			fence = rcu_dereference(fobj->shared[i]);
+	dma_resv_for_each_fence_unlocked(robj, &cursor, true, fence) {
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
 	rcu_read_unlock();
 }
 
-- 
2.25.1

