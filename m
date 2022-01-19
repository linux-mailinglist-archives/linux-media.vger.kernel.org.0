Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84748493B4C
	for <lists+linux-media@lfdr.de>; Wed, 19 Jan 2022 14:43:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354881AbiASNnu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jan 2022 08:43:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245443AbiASNno (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jan 2022 08:43:44 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAEF9C06161C
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 05:43:43 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id c71so11849741edf.6
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 05:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZBnr8W3NhjErF+08iBcJ135fidhwJh6suv4msEwXqUY=;
        b=Xm6IWY1PeF5288tssLFaZn1by7Vu5JTy0T4ztY6KDjbHZC0M47grNGiEe/yIkQ3hob
         XsAw9Ag+Yj7/z8JbC0TJQ6TmTebV/YyVTwM3TQ0SIINgm7ZkXYNCSsOlyi/ov5NxQmf1
         HLDO27OQb7OG4PgEQIxvqkmB/JDPgw/FzbXH2rUDzTbhIsfxN/GY10slrnxNTamYdIJN
         9N1DvBxsOMBQZl3pKCSgSeqiz+d2NbMAP/IIKOwTmAQ6/HC4ra4egPhweB1qwiNteR4I
         8CNhz/L/qDyqK1lP2g9y0QeAkEjCZNQnOrF8ninP8l95Ghxx6ZRO52Aac4IaHrEBCU/6
         YQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZBnr8W3NhjErF+08iBcJ135fidhwJh6suv4msEwXqUY=;
        b=4XmCUAEke+p2OrsnYyCx9L4AnIT9ukqYUXy3EDwUEiN6abQzQA9WJYSa+oPHYUVTxI
         sF+kOIwu0dyJimqDe557WsF4dgdV+/o6DnZU0Cyr+sj4e7RWhoWTtACeuRSZuPN1TYBK
         wvT9hoZX++TFp6mM29uCYNxbAWzrTIaDgBq8J8ru+idXr49kHAAAQBMgsVghwQaSzzv0
         sNqmRzjkRr1kLdxEM5LKWeeXJXDmiYiIN3j1wC8l+eoHxMRaaXbJXqygdfrbi2nk8ltW
         GDBgVUl2RHWf+DBa7c8Nv051IpJwe+kFW6S/PkjK9Z2/v2pgxUxwn5o4xSJDz2lFcins
         ytcA==
X-Gm-Message-State: AOAM530idsSplZ7v4JfLRyygwuUnMrUyRXb3r/+jVBi/9HikFkLJ1Yrr
        mXKuzcF7dC3T4yUyInmFI7w=
X-Google-Smtp-Source: ABdhPJwRKHZmp53LX3TFftfhKR37HscsIXg23NmT8Lxx/R9T/LsqBsK1KO902EToCEEBzlGRYFkCow==
X-Received: by 2002:a5d:5745:: with SMTP id q5mr7199118wrw.160.1642599822463;
        Wed, 19 Jan 2022 05:43:42 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id g15sm19733583wrm.2.2022.01.19.05.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 05:43:42 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, gustavo@padovan.org,
        daniel.vetter@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/4] dma-buf: warn about dma_fence_array container rules
Date:   Wed, 19 Jan 2022 14:43:37 +0100
Message-Id: <20220119134339.3102-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119134339.3102-1-christian.koenig@amd.com>
References: <20220119134339.3102-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It's not allowed to nest another dma_fence container into a dma_fence_array
or otherwise we can run into recursion.

Warn about that when we create a dma_fence_array.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-array.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 3e07f961e2f3..4bfbcb885bbc 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -176,6 +176,19 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 
 	array->base.error = PENDING_ERROR;
 
+	/* dma_fence_array objects should never contain any other fence
+	 * containers or otherwise we run into recursion and potential kernel
+	 * stack overflow on operations on the dma_fence_array.
+	 *
+	 * The correct way of handling this is to flatten out the array by the
+	 * caller instead.
+	 *
+	 * Enforce this here by checking that we don't create a dma_fence_array
+	 * with any container inside.
+	 */
+	while (seqno--)
+		WARN_ON(dma_fence_is_container(fences[seqno]));
+
 	return array;
 }
 EXPORT_SYMBOL(dma_fence_array_create);
-- 
2.25.1

