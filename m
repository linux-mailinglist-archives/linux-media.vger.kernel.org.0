Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B541027EE86
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 18:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731029AbgI3QJe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 12:09:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730984AbgI3QJc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 12:09:32 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6233AC0613D0;
        Wed, 30 Sep 2020 09:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=TmfaCnUd+7mEz2YuYjVCYbtQ0kXcXuqBuz2CDTaW1SU=; b=vTUKxlHvoBZU8oPuhfyrBvMush
        R8HWo77aaA/LJrPmDuWZoiiDEH5yrCNR3FWG2OnLJ7+urDV58UGL9mWxIRaiQu0dullqNzBTf5wAU
        pKdhVu2W/dOFVAwdroM1B55Rhhws/gIKMi8HWTMWuFeAQvOc9bLTw23c9Uy9fAhoGpi7fgBmWeQ4k
        quQOt/+R406V/VviQHvuyRe3bFdwJQlDenY5GHU7VuR+9Hhv/brb8OJVzK8YlqfnvDS0Pog73xU2r
        GVbYqmzOXj8rj/iA0Sit4Ms7NjLAmayqY7L5ime3YuIlMssIibDUhdvSI8nL5TlzWtCmOTpFUWy/O
        6Rr9StWw==;
Received: from [2001:4bb8:180:7b62:c70:4a89:bc61:4] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kNefW-0003DH-6X; Wed, 30 Sep 2020 16:09:26 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        iommu@lists.linux-foundation.org
Cc:     Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 4/8] dma-direct: use __GFP_ZERO in dma_direct_alloc_pages
Date:   Wed, 30 Sep 2020 18:09:13 +0200
Message-Id: <20200930160917.1234225-5-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930160917.1234225-1-hch@lst.de>
References: <20200930160917.1234225-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Prepare for supporting the DMA_ATTR_NO_KERNEL_MAPPING flag in
dma_alloc_pages.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/direct.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index b5f20781d3a96f..b5d56810130b22 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -296,9 +296,10 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
 {
 	struct page *page;
-	void *ret;
 
 	if (dma_should_alloc_from_pool(dev, gfp, 0)) {
+		void *ret;
+
 		page = dma_alloc_from_pool(dev, size, &ret, gfp,
 				dma_coherent_ok);
 		if (!page)
@@ -306,7 +307,7 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 		goto done;
 	}
 
-	page = __dma_direct_alloc_pages(dev, size, gfp);
+	page = __dma_direct_alloc_pages(dev, size, gfp | __GFP_ZERO);
 	if (!page)
 		return NULL;
 	if (PageHighMem(page)) {
@@ -320,13 +321,11 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 		goto out_free_pages;
 	}
 
-	ret = page_address(page);
 	if (force_dma_unencrypted(dev)) {
-		if (set_memory_decrypted((unsigned long)ret,
+		if (set_memory_decrypted((unsigned long)page_address(page),
 				1 << get_order(size)))
 			goto out_free_pages;
 	}
-	memset(ret, 0, size);
 done:
 	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
 	return page;
-- 
2.28.0

