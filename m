Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93A12461652
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 14:27:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243691AbhK2NaZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Nov 2021 08:30:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233450AbhK2N2R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Nov 2021 08:28:17 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33B0BC09B074
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:26 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id v11so36246251wrw.10
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CtkJ4ZyrlGXLYLNyAbl2XqtGUnhKIK61F0cIYJH+rgs=;
        b=hFZQ7Wf2ThMK4Kov/Dv2SnYi3D7u4kzKzjSQ8AX2QU/GCquzNtMp18zmHP+23uIuUm
         bBOQnWWzKIsi4FrnfRYuiU5EKe8/LQ6hh5HuOzzFHXL0Df1F/J8fYDNbhFrlmrEM8mFz
         bjV0OOU6B2elOAHI9IJeJKJnwi275xqKpK0RbCt19TH6pR9Si9Uz7RWn23WO4+t73z/G
         KuIYYfemWIC9ZMvqsr+QXQGuSOuvoniVnD8R7A8iurUuV26MHDn1Vu8e0nnZqD89pLXZ
         lhy62fcQwH6Aq9t1tHORVZq6hTPp55/pgRkSlRN1PQIGzAM5htuTFqj4Uyx/cXo7Dnrn
         bWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CtkJ4ZyrlGXLYLNyAbl2XqtGUnhKIK61F0cIYJH+rgs=;
        b=XpEDnctTSmt7vPx4yRA8EjBF6J/ZPU22mJd3jWMxHVJd6UXvAio01wfXrxbD/ThPoJ
         7MbAO4GtzM6gqapVVqAFzheHAjLjP1E8H7gH80NbQyZWKaBvx5s544cN5LhsKoTWzu93
         ZHLuvCcUye1DvA2EzEL/XosFffVuZYQxIHcvUSa5OWdTMCmcCI1mcLg1GElSf/pBGYNr
         DyVsczaiO83FY5GSEnRM8TJHTIxkY50GTW5QQuVs5iuFU9ltXEF/zEDcYTEp1qMiFEv2
         y9WVwQ/rqUwVnuf5gWuy5bdtNsJndIXMeyNT9ZAs1IfE/wOUflaY/DULEZ8TgXUW2Psy
         JYKw==
X-Gm-Message-State: AOAM531F6fDKaJtBG+COSD0dCOrhdpU3JFHiUOrjcyKHUNsHz5h7J1u2
        J9gTYAVdf5FoZpZ57mI1UkQ=
X-Google-Smtp-Source: ABdhPJz962doMvhn03X+ZY/g+6uiiAPD6K5IJ8HZjvKQ5sMZE8sDlV5ApFT8d9w3VQFXWjIQq19wSw==
X-Received: by 2002:adf:d22a:: with SMTP id k10mr34329840wrh.80.1638187644851;
        Mon, 29 Nov 2021 04:07:24 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 04:07:24 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 17/28] dma-buf: drop the DAG approach for the dma_resv object
Date:   Mon, 29 Nov 2021 13:06:48 +0100
Message-Id: <20211129120659.1815-18-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
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

