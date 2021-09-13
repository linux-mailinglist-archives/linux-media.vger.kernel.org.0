Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4913408E10
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 15:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242212AbhIMNbT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 09:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239894AbhIMNTw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 09:19:52 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72E6CC0613E3
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:22 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id g19-20020a1c9d13000000b003075062d4daso1434320wme.0
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TJQg28bFaecRK4P62bX0pUmzGEviWdAsp9Jh6zjSttQ=;
        b=kn4xgCEQdvO1BCSi0iHQQ0kacxYSTOPUYw3NHrF63wrqhX48b/bf2+P6omFeXtAxyJ
         GHF8sJWq49Xm6SzdeFQF5k3IpzCVMGzATecR+f2vSJvSnhXBw+lIy0cxtTIzADiJ74HU
         iukxaG9WYYhBnUolSXkNmKSemXJ6hSK/O0rr8QWVNa6UVIWAZ52TpoaMgTTjS7vVl7Ef
         t2PQ6aEQhOL6+bY/MO09qioW58af6xvmaUiQlTfGv481dbepotATlIwhMq5H99sxYiAE
         CGiFq+TL7Df2le4Dto/L+VeNHxjbGrRmoJBP5NwqiX0uI4PFAizIfPGZEIS12XRo34u2
         LwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TJQg28bFaecRK4P62bX0pUmzGEviWdAsp9Jh6zjSttQ=;
        b=brmu0GVlZLpaEA8mnUEidFsa2IOlq4aO1nUDeGFp5m86EZlia2sdVafYJwQNWPgalS
         6TpiBPBMLAfPc6d2dpi+64uQPHjIGDKJGlIQ9fsPVKRosTOG704a8N3HHOkJUqhxVjsR
         2JzV4x2MiuBVwnNoJ9jo7F7ImBllVoH+4umsTWdmvWCKL9r862jKfN8XlznrSGKKYr7x
         lr8hN8wturdFuRmVsr4QdkU++GVkfOaRnpDXcpUt/k8zZro1zWmFcI4BX5z4Sq7BUDae
         9fxQwh4Mf/4uNMc+G9q6k9KO8jzzlI7SLQjkoeAnQqNxgMaJO06Z7HYd6I8w7h/vPGC8
         jEDg==
X-Gm-Message-State: AOAM532u2Au6ZkA/59XssoxxDAIlz1+FrAZz90HvyP++TaBBVnjLZYWM
        t06tVA7IGlvnYIr8Vvvc/ac=
X-Google-Smtp-Source: ABdhPJxsF8ekyIhptLBRFZnw0TAc+pj/p8qyebaV0i7XwfKFZ+xEEW11vFlKszAqDIypX26YpaXSJA==
X-Received: by 2002:a7b:c191:: with SMTP id y17mr3424889wmi.122.1631539041044;
        Mon, 13 Sep 2021 06:17:21 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id h18sm7602834wrb.33.2021.09.13.06.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:17:20 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
Subject: [PATCH 06/26] dma-buf: use new iterator in dma_resv_test_signaled
Date:   Mon, 13 Sep 2021 15:16:47 +0200
Message-Id: <20210913131707.45639-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913131707.45639-1-christian.koenig@amd.com>
References: <20210913131707.45639-1-christian.koenig@amd.com>
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
 drivers/dma-buf/dma-resv.c | 54 +++++---------------------------------
 1 file changed, 7 insertions(+), 47 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 3ce929b770ea..fefc7ec37029 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -593,22 +593,6 @@ long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 EXPORT_SYMBOL_GPL(dma_resv_wait_timeout);
 
 
-static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
-{
-	struct dma_fence *fence, *lfence = passed_fence;
-	int ret = 1;
-
-	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &lfence->flags)) {
-		fence = dma_fence_get_rcu(lfence);
-		if (!fence)
-			return -1;
-
-		ret = !!dma_fence_is_signaled(fence);
-		dma_fence_put(fence);
-	}
-	return ret;
-}
-
 /**
  * dma_resv_test_signaled - Test if a reservation object's fences have been
  * signaled.
@@ -625,43 +609,19 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
  */
 bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
 {
+	struct dma_resv_cursor cursor;
 	struct dma_fence *fence;
-	unsigned int seq;
-	int ret;
 
 	rcu_read_lock();
-retry:
-	ret = true;
-	seq = read_seqcount_begin(&obj->seq);
-
-	if (test_all) {
-		struct dma_resv_list *fobj = dma_resv_shared_list(obj);
-		unsigned int i, shared_count;
-
-		shared_count = fobj ? fobj->shared_count : 0;
-		for (i = 0; i < shared_count; ++i) {
-			fence = rcu_dereference(fobj->shared[i]);
-			ret = dma_resv_test_signaled_single(fence);
-			if (ret < 0)
-				goto retry;
-			else if (!ret)
-				break;
+	dma_resv_for_each_fence_unlocked(obj, &cursor, test_all, fence) {
+		if (!dma_fence_is_signaled(fence)) {
+			rcu_read_unlock();
+			dma_fence_put(fence);
+			return false;
 		}
 	}
-
-	fence = dma_resv_excl_fence(obj);
-	if (ret && fence) {
-		ret = dma_resv_test_signaled_single(fence);
-		if (ret < 0)
-			goto retry;
-
-	}
-
-	if (read_seqcount_retry(&obj->seq, seq))
-		goto retry;
-
 	rcu_read_unlock();
-	return ret;
+	return true;
 }
 EXPORT_SYMBOL_GPL(dma_resv_test_signaled);
 
-- 
2.25.1

