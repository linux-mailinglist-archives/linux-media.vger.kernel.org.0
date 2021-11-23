Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE4845A54B
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 15:21:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237967AbhKWOYy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 09:24:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237830AbhKWOYx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 09:24:53 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2318C061574
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:45 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id l16so1313042wrp.11
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0m5E3AR75LeGECS5IYeG+cVquPxCmS2lBy6eXY5PgkM=;
        b=HUA7qtJj+ZTsIM+Q0l+p/sj0hiFdpqRUzm96MTGPVdFim7sLKlNlrGNBX7+z2Si3w8
         W8HIBSxSgd4tjVbWP+oOjAi9pXrMfh66OkJAy8gyOFI8kMGazPUGLV89Rgdh33xY3EMK
         0lORdbgAbIb+zb/sll7Ty1fjKmOLZvfN5Zu5fBWx3BpMHMnOTomfr7t7Ehd2d4dRz0Kl
         V0VlNeCL6t5/BKnycoi21iMekOGg8o4l9Pk42FJ+qPN1xZPXKTF6ZN08vB6h9KrW0csK
         UwZsdvjweAH3FvzHTNQHRPHnJjlqdVAmefSLKt/6JROAMV+npNkSFNc4Nqoh+106MCvl
         dioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0m5E3AR75LeGECS5IYeG+cVquPxCmS2lBy6eXY5PgkM=;
        b=REAlXaio9Qj27bFWu5rbqtt7gRyrOkcMJNXGsgwfQVk3smVtpe9s/dtgChOsQ/Gl9B
         /ozRVxHOn/6fQcIRgXVFG3zoWPDBOuYhUly9jTv+FEligU5iuyhLbThiiLqdDtcvmpk+
         ZBiKWIE/PPtFOh8EoxF9tDbnZhVTvWMXKMbbY9BUwqjT3g/qfxxAVv8DZBLVBymV+URR
         FdZHlYew9Ui7ojdFFivhl4gj63y0AKvWB+sZdEperHfaYVaCyb3MAkxcbsAeYbXO8Q7t
         r8QB20NAwseMjRnKzXv7vhys3FQS6W8Q5ry+qlRmmqE3zBRjWn/55Aiv2GCZEqxBvz3C
         aVrw==
X-Gm-Message-State: AOAM530zYYIH8B0GMziK2cBZWsEmiKKYVfbFlQrVFLPwtSm3iojluYhq
        1/HG9PxlbTiRuwkY9tF/Kjc=
X-Google-Smtp-Source: ABdhPJxFodcSQdq8IIGizebR8zbNcFO3Pr22YZuFiZsgi8Yi6eRNaaAPNxYIGsFqGL0V/ZOQmIRetg==
X-Received: by 2002:adf:f98c:: with SMTP id f12mr7662667wrr.184.1637677304304;
        Tue, 23 Nov 2021 06:21:44 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 06:21:44 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 17/26] dma-buf: drop the DAG approach for the dma_resv object
Date:   Tue, 23 Nov 2021 15:21:02 +0100
Message-Id: <20211123142111.3885-18-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
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
 drivers/dma-buf/dma-resv.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 539b9b1df640..3b0001c5ff3a 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -411,29 +411,17 @@ EXPORT_SYMBOL(dma_resv_replace_fences);
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
+	dma_resv_list_prune(dma_resv_shared_list(obj), obj);
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

