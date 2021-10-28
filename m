Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07D0643E215
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 15:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbhJ1N3F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 09:29:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230265AbhJ1N3E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 09:29:04 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D424BC061570
        for <linux-media@vger.kernel.org>; Thu, 28 Oct 2021 06:26:37 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id j35-20020a05600c1c2300b0032caeca81b7so4700777wms.0
        for <linux-media@vger.kernel.org>; Thu, 28 Oct 2021 06:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=e+8fJ8qEMMMqeIZ3F1ua658PpkVFhH+XcSxIsmdPPN0=;
        b=EU2MSDkmpLBlyxYoFxQDehm+rttAByW+1sx0AHb7428+3h4Vvhf1YLcR20jST2wIS8
         RXO4c/1ovzIGzUhpa5LlIvUmni6QVo2WtF5r987qIIkmV/sk0mtJQitb9a3hR8j21OiA
         xe+ZsnT1yyWgxLL2pgz2Az2eQqWioHiGPvrzswLrd5pbh4TKlFNzrx8H8solOFT5D7Uh
         zz17J9aZs0uUQl4Usmjfo4ME3mXf5A0RWr3rkXCnJKGdtzHY8v2TzjR8NzYpeEA7Fcag
         E/ZOBk/5BZlM3okACjo4dGEJ6il5FzLaGEtHpdbJRktuDrWfpoQXiloWEgBZjvTyL/NS
         6oBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e+8fJ8qEMMMqeIZ3F1ua658PpkVFhH+XcSxIsmdPPN0=;
        b=phFOgKyQsP8DuUA86DV+vNd5bPxLT+3+Vio9YHSSfztefkfuB05joV7uWec29/+Wrz
         wHEx5JaAqx4yYVKCTRwL9ODjKS3ATS05zBWooubGhX0VOFPs2H0C0MmVktChExq26MN9
         N5k4QpryMpb+f1/KtxObb5Lm1kUypk23T7USxYh8HXhs5ApNp4D0EkdHBvj2BqGwVGY7
         m4oKU0Pb6yEzDayBR67GJkTTuLMQ9BBQ6DbHfZHkuy86ghbLl8JIsiPL9Qa2tiLTOMAA
         H3fvNozsNGuPbZsO+n4I0EOVmUqreRIj7nfsNV/duHyV5msTEMzM9XFJOXnKyDNIwasK
         RjYQ==
X-Gm-Message-State: AOAM530k/X/c8KFv0EWQAWn/Ikp/w4vfT2VjqjxZE/a693eWehzLyEOl
        Mvs540f9G4Q7/DsXNkfnElWOgiNNQUc=
X-Google-Smtp-Source: ABdhPJxVYI6AkcFJUSk41xOEyRBmUiX5QjAXTS8UFeWQOkEEVBPh6d2GQPqGnmkDAIygbNjFjtpzsA==
X-Received: by 2002:a05:600c:17d4:: with SMTP id y20mr9318505wmo.113.1635427596472;
        Thu, 28 Oct 2021 06:26:36 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l11sm2935695wrt.49.2021.10.28.06.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 06:26:35 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        etnaviv@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 5/6] RDMA: use dma_resv_wait() instead of extracting the fence
Date:   Thu, 28 Oct 2021 15:26:29 +0200
Message-Id: <20211028132630.2330-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028132630.2330-1-christian.koenig@amd.com>
References: <20211028132630.2330-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use dma_resv_wait() instead of extracting the exclusive fence and
waiting on it manually.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/infiniband/core/umem_dmabuf.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
index e824baf4640d..258ba9b8c17d 100644
--- a/drivers/infiniband/core/umem_dmabuf.c
+++ b/drivers/infiniband/core/umem_dmabuf.c
@@ -13,7 +13,6 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
 {
 	struct sg_table *sgt;
 	struct scatterlist *sg;
-	struct dma_fence *fence;
 	unsigned long start, end, cur = 0;
 	unsigned int nmap = 0;
 	int i;
@@ -65,11 +64,8 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
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

