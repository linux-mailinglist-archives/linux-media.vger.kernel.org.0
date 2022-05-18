Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CF8152B569
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 11:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233608AbiERIyz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 May 2022 04:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233588AbiERIyw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 May 2022 04:54:52 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B28326D4F3
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 01:54:49 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id fd25so2098400edb.3
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 01:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NmakBTu/yOyy+SXgm2S0IBtesj4DDqTwypdR4z2zMUA=;
        b=KEz4Bfyh0z1RizjUSsJ/8CTRYSpajI+zNYxQ01gkSHN/0/3A+AfdT3/4ghmoOnHgvk
         9rIaBHU16WWuEpAjx6IMmBKtkD8+VLM59YIrx8m1UzK9HVyM4dPZ8nDOfxUrIRI8wyFj
         AyaEit+RDj2uSN1DzdGcuKR5zRmdtdEkcyhpVtgUaWfagBiINDG7WXmJxLrVbnCFChqA
         SG+J0yRnkL/jGE4i6dba2XRZ+t/IP8f6Zp5w8BTAoyHampntK0UGTEMl49rWIKtPCNC7
         /X21EGM594pLwxJ8TJn1AB9rk7DNP4E0hw8ad73ftcNWl4meyDyroyt0RMN9VTJ0I1bH
         Jy9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NmakBTu/yOyy+SXgm2S0IBtesj4DDqTwypdR4z2zMUA=;
        b=BILwTYqBLj6MOJznLcGSvdyo+dYgfM/lRQOw3b+Ta/bNpLFw0S5+/fWjlI3YNkwbkg
         Z++w4jLhikQQ3V34WNtoT14ErInOT9oj591bwOElXNBEn9mftQpsptGD2LzqMyCifVPZ
         s9XJglPvlnhs2o2GRFJkc1VAl2K5gcBC0BZIRw6KVeuYuAvCCt3BMzvNAQMh+2/5uAUr
         HTcKGeDTI1c4XjQc1zmb07Mp6Fz5JAh7gMPbwRcppf9LHNrp6yE9QjW2pCYv6eSIy5d7
         tfyIi13Zt6xvNFMvazkbvFiz/QVjKP1hEJnj4B84uy6jEKU9EaylDORfIpBPgFcGX25C
         JVwA==
X-Gm-Message-State: AOAM531h00xwM/ROFhJ73IMyMhTfGRjEQyPiN2vRGLvzL7v0o51Kc0ry
        eRNCqCyU5ZsZHAZznGpRZ3Y=
X-Google-Smtp-Source: ABdhPJxDonz8lzrvTV+KHVl0KiPlKtNFlPmtROdCUy+WJuAexza7caYRXnzxmG8UipUDKo4MqaZrIQ==
X-Received: by 2002:a05:6402:354d:b0:428:19be:2447 with SMTP id f13-20020a056402354d00b0042819be2447mr23188331edd.308.1652864088372;
        Wed, 18 May 2022 01:54:48 -0700 (PDT)
Received: from able.fritz.box (p57b0bdaa.dip0.t-ipconnect.de. [87.176.189.170])
        by smtp.gmail.com with ESMTPSA id jl26-20020a17090775da00b006f3ef214df0sm699275ejc.86.2022.05.18.01.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 01:54:47 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] dma-buf: cleanup dma_fence_chain_walk
Date:   Wed, 18 May 2022 10:54:46 +0200
Message-Id: <20220518085446.31338-1-christian.koenig@amd.com>
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

Use unrcu_pointer() instead of the manual cast.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-chain.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index 06f8ef97c6e8..a0d920576ba6 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -62,8 +62,8 @@ struct dma_fence *dma_fence_chain_walk(struct dma_fence *fence)
 			replacement = NULL;
 		}
 
-		tmp = cmpxchg((struct dma_fence __force **)&chain->prev,
-			      prev, replacement);
+		tmp = unrcu_pointer(cmpxchg(&chain->prev, RCU_INITIALIZER(prev),
+					     RCU_INITIALIZER(replacement)));
 		if (tmp == prev)
 			dma_fence_put(tmp);
 		else
-- 
2.25.1

