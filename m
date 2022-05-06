Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC7251DA22
	for <lists+linux-media@lfdr.de>; Fri,  6 May 2022 16:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442046AbiEFOOS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 May 2022 10:14:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442117AbiEFOOJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 May 2022 10:14:09 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F9A6928D
        for <linux-media@vger.kernel.org>; Fri,  6 May 2022 07:10:14 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id p18so8854328edr.7
        for <linux-media@vger.kernel.org>; Fri, 06 May 2022 07:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QNt760DjFBo7HAT2HJsEWq9kQPdH1wnsqRHak7OGdbE=;
        b=C2w/6N6kbyW7wVnzjHEOL+TPmgmnkRUjE4m7nOD0xETPp8focvjo6CypBlsChAFjdH
         rIYi5xu4cR7HFotKDwR/oi2wvpCLJyQ/Iqq07iNVjrJbN8ISFmXogi0dAO3Jxx7SkmU4
         MOyoIiT75Gh7/1zH//eMuwRZ5WI7NtDLtFwZ9R5qgDyQk9k2x27IR79vVvc7qetLDs9F
         mB4d0A7Of9GBAJR7GLYDVjHG6ftXGFXhlUKgr1JuV7gaCebYbNBSBkXunxic38FXLmrh
         TTkQjQOmES6doapjyvA0yToi+JAZXUG1ezejkLs28vHTZy8sX7P3ZtU32v9yjGenzF9V
         wWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QNt760DjFBo7HAT2HJsEWq9kQPdH1wnsqRHak7OGdbE=;
        b=aDZKs+IAjtG7G1xIvcW1jdJKfldsSO/Gdn3YDIVVRDLGIYGgst9t+MwuGiFyDftcKQ
         m/j3+7KJ4CgWs9M5MQLt1QM9bZG458WMy2AWho24krF4Q+HycMEoVA+DlV2Uoiri/5l5
         RGiX/groGqMhjKr/F9dgoCKJbnm7OoDRnVWNxVB9fxPK1vYuBX1J7mP3gummAcZpDBNm
         xqDaMfuOhab393cXJrIHrwpn+J01/vkjKqKEJLmz8KFpznd4Y+l9jzT1gBl6YklIzeDw
         Rw9eZUcbVLxriRNPsj317HtRj5Me9is6WwgfRLZdOizDoi9SImHIH+CLQju9mCwA56Q/
         wP0Q==
X-Gm-Message-State: AOAM5301VEEGaYvKqXk0uRvlPI+x8MraWkop+Yvk+14gqIS9nb7RAmF8
        bTUbi83nVJsfbbMDYBlLQnNB98Sthfs=
X-Google-Smtp-Source: ABdhPJxuGXiCo/++b2braxDlEZUUiIW9zHboM3NzkydRtAsGo5ltD8AOTRLv4lnCa/0vWeRSaQqT8w==
X-Received: by 2002:a05:6402:3490:b0:427:b471:9e1e with SMTP id v16-20020a056402349000b00427b4719e1emr3624011edc.36.1651846213529;
        Fri, 06 May 2022 07:10:13 -0700 (PDT)
Received: from able.fritz.box (p57b0b3fd.dip0.t-ipconnect.de. [87.176.179.253])
        by smtp.gmail.com with ESMTPSA id jx3-20020a170907760300b006f3ef214e22sm1915415ejc.136.2022.05.06.07.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 07:10:13 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 3/5] dma-buf: return only unsignaled fences in dma_fence_unwrap_for_each v3
Date:   Fri,  6 May 2022 16:10:07 +0200
Message-Id: <20220506141009.18047-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506141009.18047-1-christian.koenig@amd.com>
References: <20220506141009.18047-1-christian.koenig@amd.com>
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

dma_fence_chain containers cleanup signaled fences automatically, so
filter those out from arrays as well.

v2: fix missing walk over the array
v3: massively simplify the patch and actually update the description.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 include/linux/dma-fence-unwrap.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/linux/dma-fence-unwrap.h b/include/linux/dma-fence-unwrap.h
index e7c219da4ed7..a4d342fef8e0 100644
--- a/include/linux/dma-fence-unwrap.h
+++ b/include/linux/dma-fence-unwrap.h
@@ -43,9 +43,13 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor);
  * Unwrap dma_fence_chain and dma_fence_array containers and deep dive into all
  * potential fences in them. If @head is just a normal fence only that one is
  * returned.
+ *
+ * Note that signalled fences are opportunistically filtered out, which
+ * means the iteration is potentially over no fence at all.
  */
 #define dma_fence_unwrap_for_each(fence, cursor, head)			\
 	for (fence = dma_fence_unwrap_first(head, cursor); fence;	\
-	     fence = dma_fence_unwrap_next(cursor))
+	     fence = dma_fence_unwrap_next(cursor))			\
+		if (!dma_fence_is_signaled(fence))
 
 #endif
-- 
2.25.1

