Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6969427EE8E
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 18:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730034AbgI3QJa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 12:09:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgI3QJa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 12:09:30 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1236C0613D0;
        Wed, 30 Sep 2020 09:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=ss1B5LS02Dl8LXyPvF2nQEHb1zf2SKhaR9X/Ikso6f4=; b=U3M0mwN0TpO/LPCKIbzUN6bVR3
        sbfhV1rPcgeix+8XaxfVRCcQskhVhU7vvvKQ7ecovz8eNTM0uT3zhlxPMm5uT9VR+0rO6xnsMVzap
        nByo9G9jhaMzKIf8fmMD1FQxS75w0+1uAS7PVzz3PVEyXv17geuHe1R8lRORK07fWWHQdlFCSzD5X
        rKP9QzSli/u5mKEeRgUXa3i1goK5SJBCfFIVU+uTkVNHrY2hZycKCYo2q+2wNWyAk/uDcJk6X2DK3
        gENyet37MSyh/MLgo6meq2uwbImm42OXGensQcnMr6w0GaqKzyqeqPZms5J/I2eDM/GpYbvpwKpUy
        ye+htRWg==;
Received: from [2001:4bb8:180:7b62:c70:4a89:bc61:4] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kNefT-0003Cx-Mk; Wed, 30 Sep 2020 16:09:24 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        iommu@lists.linux-foundation.org
Cc:     Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 2/8] dma-mapping: document dma_{alloc,free}_pages
Date:   Wed, 30 Sep 2020 18:09:11 +0200
Message-Id: <20200930160917.1234225-3-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930160917.1234225-1-hch@lst.de>
References: <20200930160917.1234225-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document the new dma_alloc_pages and dma_free_pages APIs, and fix
up the documentation for dma_alloc_noncoherent and dma_free_noncoherent.

Reported-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 Documentation/core-api/dma-api.rst | 45 ++++++++++++++++++++++++++----
 1 file changed, 40 insertions(+), 5 deletions(-)

diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
index ea0413276ddb70..a75c469dbcaa7c 100644
--- a/Documentation/core-api/dma-api.rst
+++ b/Documentation/core-api/dma-api.rst
@@ -534,11 +534,9 @@ an I/O device, you should not be using this part of the API.
 			dma_addr_t *dma_handle, enum dma_data_direction dir,
 			gfp_t gfp)
 
-This routine allocates a region of <size> bytes of consistent memory.  It
+This routine allocates a region of <size> bytes of non-coherent memory.  It
 returns a pointer to the allocated region (in the processor's virtual address
-space) or NULL if the allocation failed.  The returned memory may or may not
-be in the kernels direct mapping.  Drivers must not call virt_to_page on
-the returned memory region.
+space) or NULL if the allocation failed.
 
 It also returns a <dma_handle> which may be cast to an unsigned integer the
 same width as the bus and given to the device as the DMA address base of
@@ -565,7 +563,44 @@ reused.
 Free a region of memory previously allocated using dma_alloc_noncoherent().
 dev, size and dma_handle and dir must all be the same as those passed into
 dma_alloc_noncoherent().  cpu_addr must be the virtual address returned by
-the dma_alloc_noncoherent().
+dma_alloc_noncoherent().
+
+::
+
+	struct page *
+	dma_alloc_pages(struct device *dev, size_t size, dma_addr_t *dma_handle,
+			enum dma_data_direction dir, gfp_t gfp)
+
+This routine allocates a region of <size> bytes of non-coherent memory.  It
+returns a pointer to first struct page for the region, or NULL if the
+allocation failed.
+
+It also returns a <dma_handle> which may be cast to an unsigned integer the
+same width as the bus and given to the device as the DMA address base of
+the region.
+
+The dir parameter specified if data is read and/or written by the device,
+see dma_map_single() for details.
+
+The gfp parameter allows the caller to specify the ``GFP_`` flags (see
+kmalloc()) for the allocation, but rejects flags used to specify a memory
+zone such as GFP_DMA or GFP_HIGHMEM.
+
+Before giving the memory to the device, dma_sync_single_for_device() needs
+to be called, and before reading memory written by the device,
+dma_sync_single_for_cpu(), just like for streaming DMA mappings that are
+reused.
+
+::
+
+	void
+	dma_free_pages(struct device *dev, size_t size, struct page *page,
+			dma_addr_t dma_handle, enum dma_data_direction dir)
+
+Free a region of memory previously allocated using dma_alloc_pages().
+dev, size and dma_handle and dir must all be the same as those passed into
+dma_alloc_noncoherent().  page must be the pointer returned by
+dma_alloc_pages().
 
 ::
 
-- 
2.28.0

