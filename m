Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71E7E46BB20
	for <lists+linux-media@lfdr.de>; Tue,  7 Dec 2021 13:34:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236388AbhLGMhv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Dec 2021 07:37:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236377AbhLGMhu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Dec 2021 07:37:50 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78BCAC061574
        for <linux-media@vger.kernel.org>; Tue,  7 Dec 2021 04:34:20 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id o13so29093430wrs.12
        for <linux-media@vger.kernel.org>; Tue, 07 Dec 2021 04:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dLcViOC9XeBrn0i9874Oh2sdjjvie7K1Wv9yyTZ+XyU=;
        b=ksASwDpOozDKfkgmuhUobuf5S+I3igKxv057Mq0YdeUClMti17zjuyO0dtPhIazBsa
         K0CQ6idQkVK53Ighc4orZ61bwrxnVYlaJaNvTiNLm2zT4WyZ1+Vg63hBQxfJwbvIYdgH
         p3wRzx+xtLq68nkO/8Xa5tCLVOrk/XLVqG9ZOBWN7hC945PoSsvp4WzQOBE8wsEGnH++
         6gMVexLIrOGxz0r/ppgDu+yCTAaxb0+Y7nnZ4+HFF1AhVI/8Da63+d8K41B+MZXyyqHW
         8o3spLKQIYxFAipICqIkNy+m6bO+YYK2AIpJaTQEQ2Nk3QfHBjrk/NWgJ9vv+y0WgmRx
         PE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dLcViOC9XeBrn0i9874Oh2sdjjvie7K1Wv9yyTZ+XyU=;
        b=Or6RXL4OP5TgS2MA4QVcFcSD8CETAAs0eSBpWEz4Pa23LVMkWUwknBNsYFz+NjaNh6
         WjYRpcDHNa99pIA05B28bVdk1Fz1m3kv9ePKGkaiZA+e4Bcn4DcTsYkEklFmznXoepTt
         jZICzFL+YDnFTsDW0gZPeEIjUV2jEEm2TFrgKXs5NvJFglXd71FXc55H2Toq9M3c6FyK
         p7bTOuhSUiGNAkYmXL7xwEEId0h8aUaR+kWQcpEVIw/ymFJBnDyBb1ZoCHg6ikmWlSXn
         WbUamTP3xXHak8wEO9Y/VbQEBhnGBQD6J2BcfoXTZFnElwVaIrYGCsp8S3gysHtARsB+
         6CNQ==
X-Gm-Message-State: AOAM530EbSu4UOHfaLSxSiQn02cMs/v+s6hmppTRJ5aHxwT7ntX/+j1b
        IoUIGl8/vgOg6MaB1JhFkTI=
X-Google-Smtp-Source: ABdhPJzmkbXp8UBZZZZabjHsDdIHC7Z8dlHeQlWcOGJ0jrJG4Bh/1ieAer3oIVyym2DfcGtOqSssTw==
X-Received: by 2002:a5d:5888:: with SMTP id n8mr50578793wrf.234.1638880459108;
        Tue, 07 Dec 2021 04:34:19 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 04:34:18 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 05/24] RDMA: use dma_resv_wait() instead of extracting the fence
Date:   Tue,  7 Dec 2021 13:33:52 +0100
Message-Id: <20211207123411.167006-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207123411.167006-1-christian.koenig@amd.com>
References: <20211207123411.167006-1-christian.koenig@amd.com>
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

