Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 306B04E291D
	for <lists+linux-media@lfdr.de>; Mon, 21 Mar 2022 15:00:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344684AbiCUOBt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Mar 2022 10:01:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348693AbiCUOBD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Mar 2022 10:01:03 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B00BB40E59
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 06:59:11 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id m30so10984651wrb.1
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 06:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O11PH6cXQ1MKcgOLse/KKqk/aB8D36jCk5wxFLe7PFE=;
        b=BeZOzQyTxNdI4cHo3kAnjSyk+1Uoo7bWLwNubN37E4M+JEA7E4ZMt1cLl2pVfVun3Z
         lvPs2aJjVCZt60j/kQcnmDrVB3C41u9PAupknkipPeYOaPeeBgvyCvwIuDE+MzuRtG5n
         SD00rWxu4xXGHBmFeYMSSFR2Zos0hEHeAbILrmLy1iwvmo3Wk1RTu5zbq1OI/haeLGpg
         vAPFYpx3yWg6USdqSzk53Vpei1t5CSyvXjh5Woo+Xl/UFH+DO10h0h7Vii2xtZqYgzog
         sJ4AAWaJ22i9u6Wt/x9Iq8rUneYq3dsxB4oOKNgJK8ubIV6xNvv+eM98coU3tVoGfOWI
         BmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O11PH6cXQ1MKcgOLse/KKqk/aB8D36jCk5wxFLe7PFE=;
        b=hRunOvUKozzhn9iNP5Fvi7Odfy8bStjT6eeDZ7dSG9vmkz1g64wGvl4wdl5ZyNeRVP
         z+nTlbkaalvGmBqkFeej6EijuadIlJD8LBEiZtVF3cqw/KAYEgVjbp2uwUHZdSCo/URm
         1ssAyLAZN9GLCCt0yFJuWYYj+RedyRzWC/Ej00m+CONdpmGzorgaY5phhbIWKIQQYFq+
         AnTLuHtgWY5It19ITBh7khphtv6KCrdzt/lJJ944iOngP+NpXsHUcndCRWty0JvHGIGF
         FDx4jlksLFP1cySVSLflcxwqxOc6aDlLTxgbIwDUJnAdM2AWZhLeWTI1fJPk62GKxPdo
         4L1A==
X-Gm-Message-State: AOAM532eFJMONSCUsbUQOipW5EwhP25g7SOkOFQ4fa3O9YxU+kvwSzzI
        4mGSHPrI7rH16wNgS9lknGU=
X-Google-Smtp-Source: ABdhPJwcMuF/i5dfyY6n9V+H6t9XfrLdv1W24U8TH6lNcLfnngdykUQgOIkydPBGaI8xlQvzBEDnog==
X-Received: by 2002:a05:6000:1689:b0:204:19f5:541f with SMTP id y9-20020a056000168900b0020419f5541fmr2380469wrd.704.1647871140887;
        Mon, 21 Mar 2022 06:59:00 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
        by smtp.gmail.com with ESMTPSA id m3-20020a5d6243000000b001e33760776fsm13317640wrv.10.2022.03.21.06.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 06:59:00 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Cc:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Leon Romanovsky <leon@kernel.org>,
        Maor Gottlieb <maorg@nvidia.com>,
        Gal Pressman <galpress@amazon.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 04/23] RDMA: use dma_resv_wait() instead of extracting the fence
Date:   Mon, 21 Mar 2022 14:58:37 +0100
Message-Id: <20220321135856.1331-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321135856.1331-1-christian.koenig@amd.com>
References: <20220321135856.1331-1-christian.koenig@amd.com>
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

Use dma_resv_wait() instead of extracting the exclusive fence and
waiting on it manually.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: Maor Gottlieb <maorg@nvidia.com>
Cc: Gal Pressman <galpress@amazon.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/infiniband/core/umem_dmabuf.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
index f0760741f281..d32cd7538835 100644
--- a/drivers/infiniband/core/umem_dmabuf.c
+++ b/drivers/infiniband/core/umem_dmabuf.c
@@ -16,7 +16,6 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
 {
 	struct sg_table *sgt;
 	struct scatterlist *sg;
-	struct dma_fence *fence;
 	unsigned long start, end, cur = 0;
 	unsigned int nmap = 0;
 	int i;
@@ -68,11 +67,8 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
 	 * may be not up-to-date. Wait for the exporter to finish
 	 * the migration.
 	 */
-	fence = dma_resv_excl_fence(umem_dmabuf->attach->dmabuf->resv);
-	if (fence)
-		return dma_fence_wait(fence, false);
-
-	return 0;
+	return dma_resv_wait_timeout(umem_dmabuf->attach->dmabuf->resv, false,
+				     false, MAX_SCHEDULE_TIMEOUT);
 }
 EXPORT_SYMBOL(ib_umem_dmabuf_map_pages);
 
-- 
2.25.1

