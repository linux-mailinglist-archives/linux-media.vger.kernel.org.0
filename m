Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B3A83A94EE
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 10:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231589AbhFPI3J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 04:29:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231389AbhFPI3I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 04:29:08 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7EFEC061760
        for <linux-media@vger.kernel.org>; Wed, 16 Jun 2021 01:27:02 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id t7so1550178edd.5
        for <linux-media@vger.kernel.org>; Wed, 16 Jun 2021 01:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yylOD234iuv0OMUdGg2HNgmrF+LL5FUxi7mZp3iTQtM=;
        b=IPfZjfHVbG0OCn+KKeCOXK5UK6WlYoq3WBGAITBYT177wcs8YEOrG/D5j6Pp+dx+XV
         vSuDXkWFGTMI7iX1g1KUfz8RItABTnIqmtbDDAY1AWZpafqbDjoaJXVzvEeAeEIwfgaX
         BFPj5kDSgkf4OrxL5PxuTu8KmnfFPOrk1HGMANOPQDIg8H2qYtp5h0nW16B430t54YiA
         MnOxWddiKvBCw6XlkdZViIlvwxe7tfrdg/PKmkm/tQ/RDvOhtvjSZVMHsF6KaTq3m9nA
         dUz3Bob1iSVI11XSMvyWBeYQTflU+vBQWBbgL04E4SnPh1maV/mIVlGaMJQQ8Wty3SNu
         JaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yylOD234iuv0OMUdGg2HNgmrF+LL5FUxi7mZp3iTQtM=;
        b=I+A/tLhVwbOfdiXGRL4dd98a3d8Mv2S/tjHw1R8yuoF86hgozhBeEP4sPpmLbMImiY
         LK9eFKZzz47s/0R8YtQuFerauzpNTmb3xVqf5H1rw72/pKLsk8BXSM+IHMzKqYpHpYxn
         PHo5BOs7LLKviQZd0aMcjvBp9wHoVztNbJBNS4NiyPt/TE/l9ehm2AfVQ2EqOYO2neT8
         Kw9wof7y+AANKgH7PE3HAvKGnF9S9vG3tgUh6O4u/d6wPoHwYIzvM7ydkjrPqda7wqVX
         Z6tFbsToOZIytOSHzD05ge96Jzis9doLZMdpJAgYwzDCroFyyMOKsvpy0ewSWMA0ra9C
         j67w==
X-Gm-Message-State: AOAM532WVGo0ruqquwfO3qpWA1xHcgvw3foOXQhnG2ARbqlR3Z0Xiq0y
        3uIX1kdPbyEL/HhgSOjF7QY=
X-Google-Smtp-Source: ABdhPJxMIYtsfV1dgkVNP3Vy0nsp5M8aYGD7HNMOvq14lrRQdJQKg7mZZynBVSsqgsANM28ZJBEXJg==
X-Received: by 2002:aa7:d288:: with SMTP id w8mr2730674edq.276.1623832021459;
        Wed, 16 Jun 2021 01:27:01 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8b88:17a4:582b:121f])
        by smtp.gmail.com with ESMTPSA id v7sm1152639edx.38.2021.06.16.01.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 01:27:01 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        sumit.semwal@linaro.org
Subject: [PATCH 3/7] dma-buf: fix dma_resv_test_signaled test_all handling v2
Date:   Wed, 16 Jun 2021 10:26:51 +0200
Message-Id: <20210616082655.111001-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616082655.111001-1-christian.koenig@amd.com>
References: <20210616082655.111001-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As the name implies if testing all fences is requested we
should indeed test all fences and not skip the exclusive
one because we see shared ones.

v2: fix logic once more

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 33 ++++++++++++---------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 4ab02b6c387a..18dd5a6ca06c 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -618,25 +618,21 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
  */
 bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
 {
-	unsigned int seq, shared_count;
+	struct dma_fence *fence;
+	unsigned int seq;
 	int ret;
 
 	rcu_read_lock();
 retry:
 	ret = true;
-	shared_count = 0;
 	seq = read_seqcount_begin(&obj->seq);
 
 	if (test_all) {
 		struct dma_resv_list *fobj = dma_resv_shared_list(obj);
-		unsigned int i;
-
-		if (fobj)
-			shared_count = fobj->shared_count;
+		unsigned int i, shared_count;
 
+		shared_count = fobj ? fobj->shared_count : 0;
 		for (i = 0; i < shared_count; ++i) {
-			struct dma_fence *fence;
-
 			fence = rcu_dereference(fobj->shared[i]);
 			ret = dma_resv_test_signaled_single(fence);
 			if (ret < 0)
@@ -644,24 +640,19 @@ bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
 			else if (!ret)
 				break;
 		}
-
-		if (read_seqcount_retry(&obj->seq, seq))
-			goto retry;
 	}
 
-	if (!shared_count) {
-		struct dma_fence *fence_excl = dma_resv_excl_fence(obj);
-
-		if (fence_excl) {
-			ret = dma_resv_test_signaled_single(fence_excl);
-			if (ret < 0)
-				goto retry;
+	fence = dma_resv_excl_fence(obj);
+	if (ret && fence) {
+		ret = dma_resv_test_signaled_single(fence);
+		if (ret < 0)
+			goto retry;
 
-			if (read_seqcount_retry(&obj->seq, seq))
-				goto retry;
-		}
 	}
 
+	if (read_seqcount_retry(&obj->seq, seq))
+		goto retry;
+
 	rcu_read_unlock();
 	return ret;
 }
-- 
2.25.1

