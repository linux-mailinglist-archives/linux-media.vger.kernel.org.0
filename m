Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE4846BB2C
	for <lists+linux-media@lfdr.de>; Tue,  7 Dec 2021 13:34:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236418AbhLGMiA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Dec 2021 07:38:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236414AbhLGMh7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Dec 2021 07:37:59 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98724C061574
        for <linux-media@vger.kernel.org>; Tue,  7 Dec 2021 04:34:29 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id j3so29231850wrp.1
        for <linux-media@vger.kernel.org>; Tue, 07 Dec 2021 04:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CtkJ4ZyrlGXLYLNyAbl2XqtGUnhKIK61F0cIYJH+rgs=;
        b=SxJ7tS4I1VTI2d4zhEUvqgOILQy0taj+7D7MmoHKpCS8+4okA/O+5vjLlK2c6TOAFT
         DrkAUHTWvy6B7Bl/0aBcd6nZN/KOR8x8oVXuWD0hxPbzaxymNKsZ/XdqdMq30XtfprNa
         BxAiiNfuLB3h+VeJZVNQx0M+ARNB0xuxFoCZbQYQVv9hiYpMdsAXGhC+n6WifzJdn5DY
         1XeX7iP0VawOxGPzmK4oVpoOYicJOkpBWqnvxyOoLAAOe3Zw/Mj5P+RM+w1NhRuG3nrO
         eYWmxoI+it8kor1aTUbwlUy1IMTfE4B+LkIMiZTG33qDeFLa4vqlF/5+l3Iv5zNQ64op
         FSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CtkJ4ZyrlGXLYLNyAbl2XqtGUnhKIK61F0cIYJH+rgs=;
        b=kxweZ7col7EB9B7LXSuBeBNCTAJYYAAZcxmrtWXgEPt64yaTmmXAafeiq5LmVTUCvx
         zhyyl7PWRz1HS8KsHeFAokI9CGIG7oqdHNP5TUlRBxYrNMF1HcqsqV36KvAsfGalE1oy
         lfs8wB5i/P8u//UYP1+loFwGeElbMWwqecuYfWuHGWpDnDpI9T0ORtz0p66o39Si6kZ2
         67DS/fxIzJSzvH2qARqgSsWE+tsyMHQC9zz2oZb/l3dacF0aKCcMi13jEbLK7Pnm/yxR
         cJaM/I+in2Q38Miza5X5rMwP/sQJDUk95wQkNGKSGftwPXjE8SUIcSqKepPFdFnPJVTu
         GA1w==
X-Gm-Message-State: AOAM530DCjV9rq7a96YQGl7+Tg570Z0cVoS1SQrujziJQUjiQwPq2+bN
        hqeV/r/Ef/l3YIUtTJgfSlll2F8eU5jJkg==
X-Google-Smtp-Source: ABdhPJxRw3zErjp8Aco3pgx884gSt+EaYwT69bA1R5ukSSnQByQldt7mClxcQJ260RUMNdkZg02oyA==
X-Received: by 2002:a5d:5272:: with SMTP id l18mr50688259wrc.208.1638880468281;
        Tue, 07 Dec 2021 04:34:28 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 04:34:27 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 13/24] dma-buf: drop the DAG approach for the dma_resv object
Date:   Tue,  7 Dec 2021 13:34:00 +0100
Message-Id: <20211207123411.167006-14-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207123411.167006-1-christian.koenig@amd.com>
References: <20211207123411.167006-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

So far we had the approach of using a directed acyclic
graph with the dma_resv obj.

This turned out to have many downsides, especially it means
that every single driver and user of this interface needs
to be aware of this restriction when adding fences. If the
rules for the DAG are not followed then we end up with
potential hard to debug memory corruption, information
leaks or even elephant big security holes because we allow
userspace to access freed up memory.

Since we already took a step back from that by always
looking at all fences we now go a step further and stop
dropping the shared fences when a new exclusive one is
added.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 9acceabc9399..ecb2ff606bac 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -383,29 +383,16 @@ EXPORT_SYMBOL(dma_resv_replace_fences);
 void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 {
 	struct dma_fence *old_fence = dma_resv_excl_fence(obj);
-	struct dma_resv_list *old;
-	u32 i = 0;
 
 	dma_resv_assert_held(obj);
 
-	old = dma_resv_shared_list(obj);
-	if (old)
-		i = old->shared_count;
-
 	dma_fence_get(fence);
 
 	write_seqcount_begin(&obj->seq);
 	/* write_seqcount_begin provides the necessary memory barrier */
 	RCU_INIT_POINTER(obj->fence_excl, fence);
-	if (old)
-		old->shared_count = 0;
 	write_seqcount_end(&obj->seq);
 
-	/* inplace update, no shared fences */
-	while (i--)
-		dma_fence_put(rcu_dereference_protected(old->shared[i],
-						dma_resv_held(obj)));
-
 	dma_fence_put(old_fence);
 }
 EXPORT_SYMBOL(dma_resv_add_excl_fence);
-- 
2.25.1

