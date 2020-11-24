Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E95752C2B94
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 16:39:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387992AbgKXPjI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 10:39:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389795AbgKXPiu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 10:38:50 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8926C061A4E
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 07:38:49 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id 64so9353257wra.11
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 07:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nhjzpN/I0YbMNWZ/cuMZ/ssTNlecoXIrDpTSY4gcP5k=;
        b=R4iABjEvQuBHvnc+z9r2hhUutog05+6ThoWbUMykt7He8q7/Lm2MAV0kmbeONcOsxN
         U2G4j4uIxzcbx66W51sw80c9eTxt/OKrFsuZ2UvdrOfTO25Ud9jfdkZp/nNgFi5xd4uI
         Q/97qiFwUbs+YE8Pkx8HCm4VLRpdrdwGyTIe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nhjzpN/I0YbMNWZ/cuMZ/ssTNlecoXIrDpTSY4gcP5k=;
        b=KjqQJYLHKCGCp4HfuW+ovRcfnu7EdpvDO0n0TPcIOTFsbw2BHW9j5BufS4zfJwNFiI
         4Au14xVGSaC9+IZ3juJlN0xMCePaOM/BdEJdATLEB5yPeHBRuHxZm3VuhM8ywc5tfXOd
         ZwDjztJpe2IKm9bsodhT91/8vzJju+IQF6EFyqKcCiRYZJUhOMdT5jKbA9fMWoYDpw5c
         MXtxY026hLDg26+8RMyWwoeYgkssdRZrE8PB50eCAfRacywOrpE7cpBGLxiqFl8siG46
         OsQXA8NetrSQNGqa5Vg7csNcSrLYg5+irqP4SIXNhn16dnbboGQWzjYGbzUzw+EWsiTq
         LsCw==
X-Gm-Message-State: AOAM533Vtiw2SKyaAsS/S4zjbRJSBLjkiiVibadEAXJDkSps88YubO55
        8eKj3lbw1CL8ifYojRGCmWjy0Q==
X-Google-Smtp-Source: ABdhPJyV94IkqLC3tQEI4e07+BimW/uaxT27Q28R/rp8nTUS06m6LEQw8+T51Xjpu9YZ6o8rFd6DgQ==
X-Received: by 2002:adf:f944:: with SMTP id q4mr5883724wrr.120.1606232328515;
        Tue, 24 Nov 2020 07:38:48 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id 25sm5814752wmk.19.2020.11.24.07.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 07:38:48 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>
Subject: [PATCH 2/6] dma-direct: use __GFP_ZERO in dma_direct_alloc_pages
Date:   Tue, 24 Nov 2020 16:38:41 +0100
Message-Id: <20201124153845.132207-2-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
In-Reply-To: <20201124153845.132207-1-ribalda@chromium.org>
References: <20201124153845.132207-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Christoph Hellwig <hch@lst.de>

Prepare for supporting the DMA_ATTR_NO_KERNEL_MAPPING flag in
dma_alloc_pages.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/direct.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 06c111544f61..76c741e610fc 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -280,13 +280,12 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
 {
 	struct page *page;
-	void *ret;
 
 	if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
 	    force_dma_unencrypted(dev) && !gfpflags_allow_blocking(gfp))
 		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
 
-	page = __dma_direct_alloc_pages(dev, size, gfp);
+	page = __dma_direct_alloc_pages(dev, size, gfp | __GFP_ZERO);
 	if (!page)
 		return NULL;
 	if (PageHighMem(page)) {
@@ -300,13 +299,11 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 		goto out_free_pages;
 	}
 
-	ret = page_address(page);
 	if (force_dma_unencrypted(dev)) {
-		if (set_memory_decrypted((unsigned long)ret,
+		if (set_memory_decrypted((unsigned long) page_address(page),
 				1 << get_order(size)))
 			goto out_free_pages;
 	}
-	memset(ret, 0, size);
 	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
 	return page;
 out_free_pages:
-- 
2.29.2.454.gaff20da3a2-goog

