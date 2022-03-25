Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C23D34E7830
	for <lists+linux-media@lfdr.de>; Fri, 25 Mar 2022 16:44:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245287AbiCYPpb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Mar 2022 11:45:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378118AbiCYPpC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Mar 2022 11:45:02 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF69234B8C
        for <linux-media@vger.kernel.org>; Fri, 25 Mar 2022 08:43:27 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id z92so9682587ede.13
        for <linux-media@vger.kernel.org>; Fri, 25 Mar 2022 08:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UP4oquXI/E3mtdW950mzpwsU3zSTx1OYvcht8inS1yQ=;
        b=lZZDUTz79zDw3QYJiXP15xKVaJZLoUdcKasNVnNzVkhiYpSRANlH6yrHPIk0D0fF57
         6armA0Dn1otC3IA3Jz1L8T9mXPwoBI+A5NwUfGvg6CNe/+y51it2bxHbUpYoYrgnpbbA
         4p/JAfYBRo8+eq+wefQa7M1wgoPp1OepEj4RcxuoIwFBtVFYDUk0oH/dEpmTdq+MBDYV
         2z305zdugDZFq+8FnIZ0HlAB7etMX72TvJVFj1NQ78r+xuG54pLlSJccxtQ37ykX8isY
         S53fl9wIBozfXdx13wJqUfjl8Xt3FIbDgpe7D1YPvf5KiiuXdawN0kpQ37xLn+BooCk3
         HhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UP4oquXI/E3mtdW950mzpwsU3zSTx1OYvcht8inS1yQ=;
        b=lU8pEHmXM8PAqiCMlE7c1MIZvTLEPF+NfYa1L9KBMs/f9Bft1Mb8QU9Za/BXzCthHV
         sEOTjZrIAeI45YpB8xWV3uohU0oj1t/9boenDxMS6QLOe3GnxLBBPliQ8V/Uivfl5jNd
         MQYkQtWZHRkZ3w3HmV/cMVhxC6a4BKwwD8pmqJ13frTDpKXs7I3az0+PAJ80GPRGviD4
         HGKY47uyQuPFUO7p0DbpT1XyAifizdTVR/xwy0U3jfRr50ftkLSbVauEU554ES5r+zNA
         F1ra0YI+mtRe3033sgAOGT0x32Flh7jJ8aZ2SjIaAiqqCw1VPdd9MLmZsH6k5/hQ9UWK
         VSEg==
X-Gm-Message-State: AOAM530gCFKL8GKBfyawW10i3YvgNvl3ZRpayF7xibRijABuzT36kHHK
        B2xs+tK0J7F+X5yjzHdUP30=
X-Google-Smtp-Source: ABdhPJzycRLB4TnsWMwakRM/fgWS7O99ZGSgmT5FuDWQeIKDN8+qshW2+aLHqHXTeUlq69ucfM4bjA==
X-Received: by 2002:a05:6402:4247:b0:419:3c6e:b0bf with SMTP id g7-20020a056402424700b004193c6eb0bfmr13539604edb.374.1648223006327;
        Fri, 25 Mar 2022 08:43:26 -0700 (PDT)
Received: from EliteBook.fritz.box ([2a02:908:1252:fb60:17b5:736b:9621:3369])
        by smtp.gmail.com with ESMTPSA id hs12-20020a1709073e8c00b006dfd8074d27sm2439558ejc.79.2022.03.25.08.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 08:43:25 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc:     ville.syrjala@linux.intel.com, daniel@ffwll.ch,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] dma-buf: WIP dma_fence_array_first fix
Date:   Fri, 25 Mar 2022 16:43:23 +0100
Message-Id: <20220325154323.221765-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Looks like somebody is creating an empty dma_fence_array.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-array.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 52b85d292383..5c8a7084577b 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -159,6 +159,8 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 	struct dma_fence_array *array;
 	size_t size = sizeof(*array);
 
+	WARN_ON(!num_fences || !fences);
+
 	/* Allocate the callback structures behind the array. */
 	size += num_fences * sizeof(struct dma_fence_array_cb);
 	array = kzalloc(size, GFP_KERNEL);
@@ -231,6 +233,9 @@ struct dma_fence *dma_fence_array_first(struct dma_fence *head)
 	if (!array)
 		return head;
 
+	if (!array->num_fences)
+		return NULL;
+
 	return array->fences[0];
 }
 EXPORT_SYMBOL(dma_fence_array_first);
-- 
2.25.1

