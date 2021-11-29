Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A50FC461648
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 14:26:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241188AbhK2N3c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Nov 2021 08:29:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377232AbhK2N1b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Nov 2021 08:27:31 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71989C09B060
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:14 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 137so14401153wma.1
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dLcViOC9XeBrn0i9874Oh2sdjjvie7K1Wv9yyTZ+XyU=;
        b=UABOkQkMsx3b8AE1aqUWcIzMoJSnDFss/wAcVi7moSF4GxMLp+EGkwq9yFczUrxQUu
         ePKRe8KRkZwHXSxu/iKJJ+JXX+Kr1G+tOfUivTevI2h1ca7+vY0BCRGUuLmtZAm9dRfz
         dxXy+b9K058OCKnr6fxX1f28InMGiYiFU1PLQYpOL0tyPsc2TH9+KzngzqH+sIVrzPha
         7N4moqf9vms6aJuwP1TpZepoG78hnC77m6g8m1TGudoROpZuCEq6A+cd3lwztJoJ80iH
         BpCCWqRTbpNQd7kA9KHboKit7cxBHAM1uD6h7Z39RLgvhVp4rXLKKvLhPIL1pGRoRLjW
         lXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dLcViOC9XeBrn0i9874Oh2sdjjvie7K1Wv9yyTZ+XyU=;
        b=r54BlqbPgVCr1gWEUkmIDNw4swCrf6f4wcQgRxeKujjcqiY/oIvgDoV/lO3nO1T1wy
         FAgP8/lPzYskrHE/UgopoH2AMV0vXHaKDDB1Oh9FZXpx8q8esC9FKSvucJH5U7GejYpX
         7SCveMXXI//uihfUuO9XR9OyaS6NggaK81rzcEycJQf2PD6sMBQWncNvSwPwaTi1MP9i
         PpNxzHiO8FnQC6nRhti8tahQpNS/YG4C6XvUzbhlCUbjY8zPY04ydqZbGV0io9oDSgMc
         jgXJBIcZT0zxfnIw85oYYy7h9RjtpQw6l4b0PC5WN+AUFIj/iTfVjcFlqS0s9lBR0r8p
         NuMA==
X-Gm-Message-State: AOAM532fF+x2RBr7BHd9dLet1FBb2S0TVE2ISFdasIohrIcZ+BCU2xxN
        SMHL77Cf0w7cyP+/l8xAFww=
X-Google-Smtp-Source: ABdhPJyBuq2+7jBLai2fJFG+lkGEmimW29kV0AHD/bcGITv/dKdippw+QrURG+ltqW7PdZ7iFqd+Jg==
X-Received: by 2002:a1c:9d48:: with SMTP id g69mr37049157wme.188.1638187630956;
        Mon, 29 Nov 2021 04:07:10 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 04:07:10 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 09/28] RDMA: use dma_resv_wait() instead of extracting the fence
Date:   Mon, 29 Nov 2021 13:06:40 +0100
Message-Id: <20211129120659.1815-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
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

