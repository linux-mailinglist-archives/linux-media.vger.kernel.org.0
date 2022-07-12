Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDAB957174F
	for <lists+linux-media@lfdr.de>; Tue, 12 Jul 2022 12:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbiGLK2z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jul 2022 06:28:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232351AbiGLK2y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jul 2022 06:28:54 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 321364F68B
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 03:28:53 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id ez10so13467058ejc.13
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 03:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9EL4uc2GNr9WKPYdUaDRndHBqgmHq7u3C8hTHLq2e30=;
        b=YiRc9+LOrD1GMrizBdS2PYQ/qFnCY1epAi+IP4WrCuSgTufRlRAZCD9fKbA+/KPR/s
         mnh9K4KSTw4gsdtm2qKe5RUQ5Iw3bAEfPlXGlpjnwHxhBfobYhLM+5Aar3oYmwaAnT4G
         I0q4oW3fLuGYdn8YY1wLSVBrzy6dIYFy8RHSuUX7fnTUJQUc1zpKj/YdDY3BkcRR0pr1
         vLWA2MrtnT7FnK3ANzN4CSDkuDreBWky90YlJ6mvVaDyuCcC11QXUpS7VOaPUl5KYlFt
         PIGxTCtoYUp6xGAtW9EUAfN21O0ZF47e8mxgYrP+V7utJHHRsmZIlqCkECgAJW/VPkZ8
         G+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9EL4uc2GNr9WKPYdUaDRndHBqgmHq7u3C8hTHLq2e30=;
        b=caYpD3sja/AruFkywTOcZzgmqbQ1m1S0196x0Tkds/tg7tQ7RU7VEoZ0ryb7IvjlSV
         Kc78CVmVRaOp4pOJ1aV5sHR0WW7+DdzF1C63vWPstKLiOysAZ3SI92n1aAU3WXMInXee
         zEgNWej6DRjksY1asssWUMXt3UN+/ndRFFMxAlOX2ds7zgVjK25hEhC/kRIRhflMrlLi
         CGVcW3ASEugHxKkRmYMZX8i1CEgpZwH2DOzKoEOCjARng3yBVyJ9UmP9m4ykOy0sXyuj
         H2ILLVLbv33IfxhZxXtgDiBhMas+Wvwa9mrjcVAk4A4ygL/zCJMm12GxBu2RBi9YMgl/
         4YdQ==
X-Gm-Message-State: AJIora/IWQ39yOiT2D4cI0REMMbVYxzsTexFtx5OICTmXAKlfMILkwpQ
        RbnD9pBWeOI4dvCyReY1kX8TbgCtt7o=
X-Google-Smtp-Source: AGRyM1u8EGwzFvXheiDLWV5f6fOamncJ1eS/rHiYb+aMaChi6Tr+nA9yDejxa9G4mZ+O4NUNhNBYgQ==
X-Received: by 2002:a17:906:8a6a:b0:72b:552e:67f0 with SMTP id hy10-20020a1709068a6a00b0072b552e67f0mr9569935ejc.733.1657621731677;
        Tue, 12 Jul 2022 03:28:51 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
        by smtp.gmail.com with ESMTPSA id o23-20020a170906769700b0072b3391193dsm3634028ejm.154.2022.07.12.03.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 03:28:51 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     karolina.drobnik@intel.com, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Cc:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] dma-buf: revert "return only unsignaled fences in dma_fence_unwrap_for_each v3"
Date:   Tue, 12 Jul 2022 12:28:49 +0200
Message-Id: <20220712102849.1562-1-christian.koenig@amd.com>
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

This reverts commit 8f61973718485f3e89bc4f408f929048b7b47c83.

It turned out that this is not correct. Especially the sync_file info
IOCTL needs to see even signaled fences to correctly report back their
status to userspace.

Instead add the filter in the merge function again where it makes sense.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-unwrap.c | 3 ++-
 include/linux/dma-fence-unwrap.h   | 6 +-----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
index 502a65ea6d44..7002bca792ff 100644
--- a/drivers/dma-buf/dma-fence-unwrap.c
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -72,7 +72,8 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
 	count = 0;
 	for (i = 0; i < num_fences; ++i) {
 		dma_fence_unwrap_for_each(tmp, &iter[i], fences[i])
-			++count;
+			if (!dma_fence_is_signaled(tmp))
+				++count;
 	}
 
 	if (count == 0)
diff --git a/include/linux/dma-fence-unwrap.h b/include/linux/dma-fence-unwrap.h
index 390de1ee9d35..66b1e56fbb81 100644
--- a/include/linux/dma-fence-unwrap.h
+++ b/include/linux/dma-fence-unwrap.h
@@ -43,14 +43,10 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor);
  * Unwrap dma_fence_chain and dma_fence_array containers and deep dive into all
  * potential fences in them. If @head is just a normal fence only that one is
  * returned.
- *
- * Note that signalled fences are opportunistically filtered out, which
- * means the iteration is potentially over no fence at all.
  */
 #define dma_fence_unwrap_for_each(fence, cursor, head)			\
 	for (fence = dma_fence_unwrap_first(head, cursor); fence;	\
-	     fence = dma_fence_unwrap_next(cursor))			\
-		if (!dma_fence_is_signaled(fence))
+	     fence = dma_fence_unwrap_next(cursor))
 
 struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
 					   struct dma_fence **fences,
-- 
2.25.1

