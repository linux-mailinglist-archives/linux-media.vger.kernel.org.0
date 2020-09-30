Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD0A727EE84
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 18:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731181AbgI3QJy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 12:09:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727438AbgI3QJe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 12:09:34 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA506C0613D1;
        Wed, 30 Sep 2020 09:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=WZ4uxbVNk31AEBkp8OQl6jt0fRfNiunxqubb4E1eSbY=; b=bMti5Xtqqs0GqczNh80QjZ0mrX
        ZctdYFhCjEFzMm7Uux0RVA7zUG85KKurUiilgkQJBz2NT8UKwG08a20rIj4Q4D24U6JMNa0aNNlIi
        LbEPRdmI8oPJiREjU7L8A+2Pi6RdjS32Fm4L/Wyl+1UrZO6rKAe7QBH9ae45600MYZOzfK2DsjH+/
        I3iiPcauAN8zuwme92upF2nNwbmePCAXhtRR7oxoXg5LNg2g3mGNB5hZ7S4ITERGyVBusRixjqiPs
        XqRecu3wTMA1dHLCU5XPSXJsTy5y1w8bXYgehaj0FwbRq5t24H6BvQH/MkQkDHY2RrqeNKwmXKK27
        +XD4hGFw==;
Received: from [2001:4bb8:180:7b62:c70:4a89:bc61:4] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kNefX-0003DT-L8; Wed, 30 Sep 2020 16:09:28 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        iommu@lists.linux-foundation.org
Cc:     Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 5/8] dma-direct: factor out a dma_direct_alloc_from_pool helper
Date:   Wed, 30 Sep 2020 18:09:14 +0200
Message-Id: <20200930160917.1234225-6-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930160917.1234225-1-hch@lst.de>
References: <20200930160917.1234225-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This ensures dma_direct_alloc_pages will use the right gfp mask, as
well as keeping the code for that common.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/direct.c | 41 ++++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index b5d56810130b22..ace9159c992f65 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -147,6 +147,22 @@ static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
 	return page;
 }
 
+static void *dma_direct_alloc_from_pool(struct device *dev, size_t size,
+		dma_addr_t *dma_handle, gfp_t gfp)
+{
+	struct page *page;
+	u64 phys_mask;
+	void *ret;
+
+	gfp |= dma_direct_optimal_gfp_mask(dev, dev->coherent_dma_mask,
+					   &phys_mask);
+	page = dma_alloc_from_pool(dev, size, &ret, gfp, dma_coherent_ok);
+	if (!page)
+		return NULL;
+	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
+	return ret;
+}
+
 void *dma_direct_alloc(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
 {
@@ -163,17 +179,8 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 	if (attrs & DMA_ATTR_NO_WARN)
 		gfp |= __GFP_NOWARN;
 
-	if (dma_should_alloc_from_pool(dev, gfp, attrs)) {
-		u64 phys_mask;
-
-		gfp |= dma_direct_optimal_gfp_mask(dev, dev->coherent_dma_mask,
-				&phys_mask);
-		page = dma_alloc_from_pool(dev, size, &ret, gfp,
-				dma_coherent_ok);
-		if (!page)
-			return NULL;
-		goto done;
-	}
+	if (dma_should_alloc_from_pool(dev, gfp, attrs))
+		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
 
 	/* we always manually zero the memory once we are done */
 	page = __dma_direct_alloc_pages(dev, size, gfp & ~__GFP_ZERO);
@@ -297,15 +304,8 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 {
 	struct page *page;
 
-	if (dma_should_alloc_from_pool(dev, gfp, 0)) {
-		void *ret;
-
-		page = dma_alloc_from_pool(dev, size, &ret, gfp,
-				dma_coherent_ok);
-		if (!page)
-			return NULL;
-		goto done;
-	}
+	if (dma_should_alloc_from_pool(dev, gfp, 0))
+		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
 
 	page = __dma_direct_alloc_pages(dev, size, gfp | __GFP_ZERO);
 	if (!page)
@@ -326,7 +326,6 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 				1 << get_order(size)))
 			goto out_free_pages;
 	}
-done:
 	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
 	return page;
 out_free_pages:
-- 
2.28.0

