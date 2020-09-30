Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A112A27EE78
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 18:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731054AbgI3QJf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 12:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730980AbgI3QJc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 12:09:32 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36BC2C061755;
        Wed, 30 Sep 2020 09:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=fcJxwoQ+kZKNx/nryCD7ZbkgjtXm1YK3I5cf/tzI15g=; b=K7EO9cRvqiyOHHAuOj+yInRw9e
        aJTZbNY6h8qg6La0bk5dj+xM/PU5+VeOuJ9YhhDCqKy1IV6JfVpsa3QNZRUxOxNDVyZubSBafYpw/
        8B9KbiiBu8HF6qFaWoZ9Nc1tvZfosiixYgC0KZ5+3cBXrJfVVvacmmaHlgPaa24vT44E19Bi/Pw5F
        rLE3znMdkvvyCdJJAy8KkMJaJNP4aoskq1wfuDz0gHU+pCLAIPQTTeEJowpQDT53HF24P5Rhuj3xs
        +qv4bBP1a4NuwrtJnJLhYVWbWli41HX7YLlCWv7SmF4pi/giKNBMZ768eYdOWjDVKv0Iy3bedlGyc
        l+0H6jqQ==;
Received: from [2001:4bb8:180:7b62:c70:4a89:bc61:4] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kNefU-0003D8-Uo; Wed, 30 Sep 2020 16:09:25 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        iommu@lists.linux-foundation.org
Cc:     Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 3/8] dma-direct check for highmem pages in dma_direct_alloc_pages
Date:   Wed, 30 Sep 2020 18:09:12 +0200
Message-Id: <20200930160917.1234225-4-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930160917.1234225-1-hch@lst.de>
References: <20200930160917.1234225-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Check for highmem pages from CMA, just like in the dma_direct_alloc path.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/direct.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 121a9c1969dd3a..b5f20781d3a96f 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -309,6 +309,17 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 	page = __dma_direct_alloc_pages(dev, size, gfp);
 	if (!page)
 		return NULL;
+	if (PageHighMem(page)) {
+		/*
+		 * Depending on the cma= arguments and per-arch setup
+		 * dma_alloc_contiguous could return highmem pages.
+		 * Without remapping there is no way to return them here,
+		 * so log an error and fail.
+		 */
+		dev_info(dev, "Rejecting highmem page from CMA.\n");
+		goto out_free_pages;
+	}
+
 	ret = page_address(page);
 	if (force_dma_unencrypted(dev)) {
 		if (set_memory_decrypted((unsigned long)ret,
-- 
2.28.0

