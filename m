Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9862F42253B
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 13:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234500AbhJELkB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 07:40:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234497AbhJELkB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 07:40:01 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB13C061749
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 04:38:10 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id t2so13229959wrb.8
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 04:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jIUir/k9ok0mhA9lZLcDk0nsv9skwzmV2ts7X5dBo9o=;
        b=AFfVS3EWatdXDmvJKODPj1SdKmMBygV+2zYjnLRZQm4t+YFtQDSrgbUnoeiH9a6g6X
         dwfOR6wkZyjnKeNPdc2BdrrO9p+BzhqCIBhwLchvosIffnY7GB+KWgcfZ2v6aNKyiIbd
         TZSOvmrcMR8UvL87/pPXVb3PS3j/TpMiB50HocpnnPcXh3+guH5zyU6KFEZQdxZZttvV
         8qaNiT3MBBc4Vx5LsNo2HG/KOStQkWdObfMGxWeGmB74/MaPfRVHPBasKMc5252g9FmJ
         kxcD9i/J/Zk2E8mlWm23J1x69Wi8O/AaiPwzlEw0DouCNUewcPcqHTAUqTNajSCO/5IS
         P9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jIUir/k9ok0mhA9lZLcDk0nsv9skwzmV2ts7X5dBo9o=;
        b=ijCKt/rEycFm5zRNw17tIvpDy1w8BcIZQh0BMC775mGnPjqS81IarQnDaKBq1DabQ5
         30/sxaYVX4Lu3RZWQHtZxBTlaY+bLnww7VqISgTvWkSONTbqw2GXVY4wRPWmbzz3O/Hw
         iY3/JdSt8KF/HEg/cBMcjLrbhglJ/eT0IKKO5JTyjCDgPk6tIbN/LXa3/FJEYVcB1g2A
         hi0Di1/O5VD+C9RmUJAtSdcS9fdy0IjAm5r0xDJoUgXcvhLKu92XQzKibFvwikleiWc9
         CxU2vG8pXhbWKaAeH4+6ozGyY2BHsIyqc2ALiYf/Q/aa3SeAlT8ozTCCAE+OJw3FEyHM
         JVnw==
X-Gm-Message-State: AOAM531QeTloBqOZj8uZHXDF8yAHTFHyTe7wI6Zrp+SZHgmyKJmKYQZb
        FfNa1BaEjWFw1e1dQNBnLL8=
X-Google-Smtp-Source: ABdhPJyQsKTgszTwklwG0r3ygsT3n1ok04hVt8J1DHvwjaVGb8x9pAazd6kfJucPcvgKD6pbZRW4SQ==
X-Received: by 2002:adf:8bcf:: with SMTP id w15mr21725807wra.144.1633433889373;
        Tue, 05 Oct 2021 04:38:09 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c5sm1739912wml.9.2021.10.05.04.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 04:38:09 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 27/28] drm/etnaviv: use new iterator in etnaviv_gem_describe
Date:   Tue,  5 Oct 2021 13:37:41 +0200
Message-Id: <20211005113742.1101-28-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005113742.1101-1-christian.koenig@amd.com>
References: <20211005113742.1101-1-christian.koenig@amd.com>
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

