Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D250406855
	for <lists+linux-media@lfdr.de>; Fri, 10 Sep 2021 10:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231776AbhIJI2O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Sep 2021 04:28:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231774AbhIJI2N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Sep 2021 04:28:13 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D32F6C061574
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 01:27:02 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id u16so1449631wrn.5
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 01:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iv3iL4Al5MFxDujFTlhS5KAG1aDR1CSRZPf6sBHgzmk=;
        b=Yqzo7HG07zVVhXVU1Pt7gjvFnqhuaXnhZaPz5IBwfMJmjnqY3jL/EGOBvHw6xsNSHV
         Xh7Kt1ZYxdDl//EZRgG3MhNtDrNkvxrSGH+1khUDORwVypfH8EMYZlax9gQ3rkVbnSTm
         uWDBcg35eInF+K9AKkdcAI3SX3zjZe/+gNUMNu57O/JVqK58elyRqJVKE3zbSF1/d/GC
         bXlfwhNoQwRMoA1fWfuLve2JbbIDMW5yQo0u9EcKJ17UACE9AmWHom2Hi7Vg1im/d7eI
         NxrLLZf7Hwd3r4T24C2T7gGk15p2n+dMSBzcwVpJKos67lfXB2R76kAlEaV5rYJFr9eG
         8+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iv3iL4Al5MFxDujFTlhS5KAG1aDR1CSRZPf6sBHgzmk=;
        b=LY5LXvuvUrRJ31lM8cKA3LrfIfCHmv5AABL+Uh/COMiB9d+aNxZx+kA41MQ7eOdzlG
         DktG+aOShunBZM/7QUway2j/TRu9SlmQEQkT8jc6ruWIDbGNYP5OXF+9a8dEIXjrWJr9
         aWuHWzLGF8k0Rpl4cmzWgFW1o1ZLyeq797lqeZ/Y6WT43ElqGYov+kecmQOtX7RLqzdj
         y+BgeGWAjKxEEeUmDBG45c396Cehn1/2qkE457r5RH/N9DGfZmFmz0qBvVFqfV2fd4kR
         Uo357QRzZS1o+SBPrXYo0hZ6gpwaPzSmJBn5Nb+G0UE/oQAX5f1QBC6fAEcpqztDd9hJ
         TDpw==
X-Gm-Message-State: AOAM5333gyrPhU8OmIsD9v8RBGt+dUrnq6QL6nhk0oKxUdasld70pQaf
        ICjdlfOo9sGVbdlSvsloxlQ=
X-Google-Smtp-Source: ABdhPJwvkdWSjL3l6YyCllswNbQ1FNCp5nB/7SmqNLTNtMIAhMCUuwSEjPqPSPVvHJV0GqPjrH6zbQ==
X-Received: by 2002:adf:dc8a:: with SMTP id r10mr8348379wrj.371.1631262421539;
        Fri, 10 Sep 2021 01:27:01 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l10sm4429756wrg.50.2021.09.10.01.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 01:27:01 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 05/14] dma-buf: use new iterator in dma_resv_wait_timeout
Date:   Fri, 10 Sep 2021 10:26:46 +0200
Message-Id: <20210910082655.82168-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910082655.82168-1-christian.koenig@amd.com>
References: <20210910082655.82168-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This makes the function much simpler since the complex
retry logic is now handled elsewhere.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 64 +++++---------------------------------
 1 file changed, 7 insertions(+), 57 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 2dfb04e6a62f..645cf52a6a6c 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -571,74 +571,24 @@ long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 			   unsigned long timeout)
 {
 	long ret = timeout ? timeout : 1;
-	unsigned int seq, shared_count;
+	struct dma_resv_cursor cursor;
 	struct dma_fence *fence;
-	int i;
 
-retry:
-	shared_count = 0;
-	seq = read_seqcount_begin(&obj->seq);
 	rcu_read_lock();
-	i = -1;
-
-	fence = dma_resv_excl_fence(obj);
-	if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
-		if (!dma_fence_get_rcu(fence))
-			goto unlock_retry;
+	dma_resv_for_each_fence_unlocked(obj, &cursor, wait_all, fence) {
+		rcu_read_unlock();
 
-		if (dma_fence_is_signaled(fence)) {
+		ret = dma_fence_wait_timeout(fence, intr, ret);
+		if (ret <= 0) {
 			dma_fence_put(fence);
-			fence = NULL;
+			return ret;
 		}
 
-	} else {
-		fence = NULL;
-	}
-
-	if (wait_all) {
-		struct dma_resv_list *fobj = dma_resv_shared_list(obj);
-
-		if (fobj)
-			shared_count = fobj->shared_count;
-
-		for (i = 0; !fence && i < shared_count; ++i) {
-			struct dma_fence *lfence;
-
-			lfence = rcu_dereference(fobj->shared[i]);
-			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
-				     &lfence->flags))
-				continue;
-
-			if (!dma_fence_get_rcu(lfence))
-				goto unlock_retry;
-
-			if (dma_fence_is_signaled(lfence)) {
-				dma_fence_put(lfence);
-				continue;
-			}
-
-			fence = lfence;
-			break;
-		}
+		rcu_read_lock();
 	}
-
 	rcu_read_unlock();
-	if (fence) {
-		if (read_seqcount_retry(&obj->seq, seq)) {
-			dma_fence_put(fence);
-			goto retry;
-		}
 
-		ret = dma_fence_wait_timeout(fence, intr, ret);
-		dma_fence_put(fence);
-		if (ret > 0 && wait_all && (i + 1 < shared_count))
-			goto retry;
-	}
 	return ret;
-
-unlock_retry:
-	rcu_read_unlock();
-	goto retry;
 }
 EXPORT_SYMBOL_GPL(dma_resv_wait_timeout);
 
-- 
2.25.1

