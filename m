Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53DE645A53E
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 15:21:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237871AbhKWOYm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 09:24:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237898AbhKWOYk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 09:24:40 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92488C061574
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:32 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id s13so39318211wrb.3
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dLcViOC9XeBrn0i9874Oh2sdjjvie7K1Wv9yyTZ+XyU=;
        b=akxICZXzLT9qtfacHcLRkxnnH4e1GhkjSh2NfXBDrFUxWDM0CP1y0XpXg/zOJaAQqS
         CkuBD1CEOo8tlhe2JFZ8flhAhx/8iEmveVxWH9XRkXbyQBfJaXJ4XwExglAnvBW+M9Hf
         RUtoSugHiY20kI7TAookU8Wudy+fiUsIek1LKBiRBjvlRXt8Wsr2R0Gczi1efK7I2jni
         fEPCuI+Gbme2NajqmrMc75CrMDBp9o/EXq1SnV6tq0h9HikqCjIIKg1ChE+71uWgOGxZ
         aGOnwEt0w9P+DIXzmzPYZcCrd+6e7gxjwuUcfTLFUyoS9eflr6A04/T4A/QQGPDpFT67
         UBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dLcViOC9XeBrn0i9874Oh2sdjjvie7K1Wv9yyTZ+XyU=;
        b=hIJ/rSiIAzcyLDAq0cOZ+aR9rBDXYhVeYi47R/grOoSSvWTbnQrSb6jEDKs7yKZZu4
         BVAigIxN8laK3hULKEkFwIuq6hrxDueCnDSrVTghx7gHHQ+rt9rZ+9crCmIT+mgbd8b6
         cf7cXUj5KItlo1bXG+EXfCnvzPU43jhUHBDRFgiB8kLS/SVXoVOkd/vGWoPUhoQ9aJFn
         8rF2soARLKjd0cjAO5dLb088R7wXljbakTaa1mZgE/eqY81Jc8JkXzICHkMAM65IHIE4
         kFxjJZU7mrVTvjZyE63+VPH2i37K7JheuwvbYLRKJR0xbrTJYx+t6kqnHijDwGYuG2zD
         H8XQ==
X-Gm-Message-State: AOAM53273bPF45vV0D3FXwhxNx9Sb+K4eFNzQT2hPVmrLfFEgE4IZUoT
        wBy3kEfiRWE+Y3Buv0hxKZaq+SIqk9s=
X-Google-Smtp-Source: ABdhPJwL0j2p6QTFl0fJ4Pb+Hz/6hTqyAYg8+HAIBA7AcBESaZ9Hk4Pop+uh7AuarwcCBR/GqvX45g==
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr7509995wrd.179.1637677291125;
        Tue, 23 Nov 2021 06:21:31 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 06:21:30 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 09/26] RDMA: use dma_resv_wait() instead of extracting the fence
Date:   Tue, 23 Nov 2021 15:20:54 +0100
Message-Id: <20211123142111.3885-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
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

