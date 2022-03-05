Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4BF04CE4B8
	for <lists+linux-media@lfdr.de>; Sat,  5 Mar 2022 13:17:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231178AbiCEMSN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Mar 2022 07:18:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbiCEMSN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Mar 2022 07:18:13 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E26FF43AD8
        for <linux-media@vger.kernel.org>; Sat,  5 Mar 2022 04:17:23 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id ay5so10035790plb.1
        for <linux-media@vger.kernel.org>; Sat, 05 Mar 2022 04:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=As7hVMsPOFgRRyj2g+9QKSheeaMQmbJCYo1136pnD3w=;
        b=oPTtem8MrcBUiOBs70K5qRUpjbSOEtnzFf7f4fnGmHhRicBxc9TKO9YUfPPWot1KUR
         ijWTghW9y7IGRycgPeSF2SrYfDYDKiQgM6c0y5WSil+oyWaki1Hla47g/nuPMiYsvjTU
         StCrczr3IGCe1FG47GkrjwEPweX7WGF0LjdxoM/xQgJ8YRYRYpr87VfPuDgKR0DhRKU1
         6bdeiYJhEopI/g40/K24EDPSbOoA7MOufNoBuu3G/37oN6TBN2bpIspp1VdXBHZbwi8S
         +lgOH2l118HSQBZX+Blo+F50LYXcrnN6ql4dY1xxyKE7EfuF4YX++/QI5JqGJzkDF9R6
         BKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=As7hVMsPOFgRRyj2g+9QKSheeaMQmbJCYo1136pnD3w=;
        b=cST6Qi0YOMbDbD/5F8PvURR/MpatUHdLP8WqZ4egB8n+79A/onZF77F7Dy7szy/9Qa
         LVHwFjmP5IabJKV3pO42e7HXdOnNfoLVvraWqGYleDEfXHcf3dpwfzisib8LO/9/6beo
         x3uykctm2bEnMY2R22ySAMxaWnv41WHapfLqAscOTL7gKJN7OytpYEwrYCM+3jTT6Ma4
         8n8JoGoQRdWyWs+Rj1kmCHI0H83Ms7OXnP/VgM9mtGgFl/FvyNEnLC1YpYJ+q+wTbYd7
         M2YSVsGYINf3bVSWjIecn7nVGCuqPWiEnv/VGnDBc24NXBAhpg0REZebALj4JFN1Qupi
         GyAw==
X-Gm-Message-State: AOAM530z+nX6NMcaAj/3zfyMTl5eLVX+xjqEG5mlzgOUqx0xGy/Bfql0
        ENBWEbqzZjN0gMcq1pZGtUKuA0ofTK7Og1EH0QujzQ==
X-Google-Smtp-Source: ABdhPJyxDXTIIIZDoRs76X22sySaK+1GJzMHk1aLvX4rXnEayQHsfPOUonh+aMgsr08eXP98NLVK2g==
X-Received: by 2002:a17:902:f155:b0:151:8377:9a8e with SMTP id d21-20020a170902f15500b0015183779a8emr3185454plb.21.1646482643449;
        Sat, 05 Mar 2022 04:17:23 -0800 (PST)
Received: from localhost.localdomain ([49.65.245.47])
        by smtp.gmail.com with ESMTPSA id k17-20020a056a00135100b004f3a9a477d0sm9520526pfu.110.2022.03.05.04.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Mar 2022 04:17:23 -0800 (PST)
From:   wangshumin <pdsrazor@gmail.com>
To:     sumit.semwal@linaro.org, gustavo@padovan.org,
        christian.koenig@amd.com
Cc:     linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        wangshumin <pdsrazor@gmail.com>
Subject: [PATCH] dma-fence: fix free sync object incorrectly
Date:   Sat,  5 Mar 2022 20:17:03 +0800
Message-Id: <20220305121703.17041-1-pdsrazor@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The function dma_fence_free() works fine because
struct dma_fence is the first member of sync object.

Use `kfree` make it more reasonable.

Signed-off-by: wangshumin <pdsrazor@gmail.com>
---
 drivers/dma-buf/dma-fence-array.c | 2 +-
 drivers/dma-buf/dma-fence-chain.c | 2 +-
 drivers/dma-buf/sw_sync.c         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index cb1bacb5a42b..fc52d837e579 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -120,7 +120,7 @@ static void dma_fence_array_release(struct dma_fence *fence)
 		dma_fence_put(array->fences[i]);
 
 	kfree(array->fences);
-	dma_fence_free(fence);
+	kfree(array);
 }
 
 const struct dma_fence_ops dma_fence_array_ops = {
diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index 06f8ef97c6e8..b29e1f22f08e 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -203,7 +203,7 @@ static void dma_fence_chain_release(struct dma_fence *fence)
 	dma_fence_put(prev);
 
 	dma_fence_put(chain->fence);
-	dma_fence_free(fence);
+	kfree(chain);
 }
 
 const struct dma_fence_ops dma_fence_chain_ops = {
diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 348b3a9170fa..80432eeb58c3 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -142,7 +142,7 @@ static void timeline_fence_release(struct dma_fence *fence)
 	spin_unlock_irqrestore(fence->lock, flags);
 
 	sync_timeline_put(parent);
-	dma_fence_free(fence);
+	kfree(pt);
 }
 
 static bool timeline_fence_signaled(struct dma_fence *fence)
-- 
2.17.1

