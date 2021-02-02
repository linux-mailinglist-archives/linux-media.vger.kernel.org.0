Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB91730BB73
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 10:54:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231157AbhBBJwq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 04:52:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbhBBJwK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 04:52:10 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57CB7C0613D6;
        Tue,  2 Feb 2021 01:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=V9Mg8tXW0rNlZuOFD1i/bt5R8THD0IcaaC9lFgbmReU=; b=L1fWioLwTtRfOXtTgZb+howLjx
        1EOfyYP2fxMMgZOqeg6cYBIek1eFvmNWURkW/ho5a4l+tE/MUIANWk3E0S7h/Mt7LCiz6TxpjYp6E
        x5mWQKiAczR8jnfqIiZyAvVaMj7O+YebW2+i/5VgKXJWTWR6m9sYkwPwbLX5hqxSyaYFPbLWGRkE5
        7m93kXAk6+bWufC3sEZD67B8GM6J0auo3xk96027YqMgGr2L+eLrS91h7Yc9QKKdmsghG4ZPc9VV8
        79cNjJiENTav+zXR7nuu8SDFnkffhIwzK5Hl3epzy1iGNrSVRGIo4fizoql04VTcLzdf7wIVMfUBC
        jkkdGOfw==;
Received: from [2001:4bb8:198:6bf4:7f38:755e:a6e0:73e9] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l6sL7-00F0wH-31; Tue, 02 Feb 2021 09:51:20 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        iommu@lists.linux-foundation.org
Cc:     Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 2/7] dma-mapping: add a dma_mmap_pages helper
Date:   Tue,  2 Feb 2021 10:51:05 +0100
Message-Id: <20210202095110.1215346-3-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202095110.1215346-1-hch@lst.de>
References: <20210202095110.1215346-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a helper to map memory allocated using dma_alloc_pages into
a user address space, similar to the dma_alloc_attrs function for
coherent allocations.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 Documentation/core-api/dma-api.rst | 10 ++++++++++
 include/linux/dma-mapping.h        |  2 ++
 kernel/dma/mapping.c               | 13 +++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
index e6d23f117308df..157a474ae54416 100644
--- a/Documentation/core-api/dma-api.rst
+++ b/Documentation/core-api/dma-api.rst
@@ -563,6 +563,16 @@ Free a region of memory previously allocated using dma_alloc_pages().
 dev, size, dma_handle and dir must all be the same as those passed into
 dma_alloc_pages().  page must be the pointer returned by dma_alloc_pages().
 
+::
+
+	int
+	dma_mmap_pages(struct device *dev, struct vm_area_struct *vma,
+		       size_t size, struct page *page)
+
+Map an allocation returned from dma_alloc_pages() into a user address space.
+dev and size must be the same as those passed into dma_alloc_pages().
+page must be the pointer returned by dma_alloc_pages().
+
 ::
 
 	void *
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index fbfa3f5abd9498..4977a748cb9483 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -263,6 +263,8 @@ struct page *dma_alloc_pages(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp);
 void dma_free_pages(struct device *dev, size_t size, struct page *page,
 		dma_addr_t dma_handle, enum dma_data_direction dir);
+int dma_mmap_pages(struct device *dev, struct vm_area_struct *vma,
+		size_t size, struct page *page);
 
 static inline void *dma_alloc_noncoherent(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 68992e35c8c3a7..c1e515496c067b 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -515,6 +515,19 @@ void dma_free_pages(struct device *dev, size_t size, struct page *page,
 }
 EXPORT_SYMBOL_GPL(dma_free_pages);
 
+int dma_mmap_pages(struct device *dev, struct vm_area_struct *vma,
+		size_t size, struct page *page)
+{
+	unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
+
+	if (vma->vm_pgoff >= count || vma_pages(vma) > count - vma->vm_pgoff)
+		return -ENXIO;
+	return remap_pfn_range(vma, vma->vm_start,
+			       page_to_pfn(page) + vma->vm_pgoff,
+			       vma_pages(vma) << PAGE_SHIFT, vma->vm_page_prot);
+}
+EXPORT_SYMBOL_GPL(dma_mmap_pages);
+
 int dma_supported(struct device *dev, u64 mask)
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
-- 
2.29.2

