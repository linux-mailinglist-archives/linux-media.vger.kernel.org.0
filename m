Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F66024705C
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 20:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390329AbgHQSHM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 14:07:12 -0400
Received: from mga07.intel.com ([134.134.136.100]:20293 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388469AbgHQQIv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 12:08:51 -0400
IronPort-SDR: DC+JTXbK57fGMti3X46z1M6NmHMBwibSjU5SRWF+rXaXoXjHoR9lBL/jWqZNouc3shM0obNvxj
 eherMWljUWlA==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="219062288"
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="219062288"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 09:08:42 -0700
IronPort-SDR: tPlUr4MYdqelFI1HdpfLjDH2tIbFLd1+SfjMCXKi6xjDm+rv2Zbs1eAyMEh4ew26rMLGNyrrLH
 VdThRn2/afzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="296532479"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 17 Aug 2020 09:08:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 13F7816D; Mon, 17 Aug 2020 19:08:38 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2 03/10] media: ipu2-cio2: Replace custom definition with PAGE_SIZE
Date:   Mon, 17 Aug 2020 19:07:26 +0300
Message-Id: <20200817160734.12402-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817160734.12402-1-andriy.shevchenko@linux.intel.com>
References: <20200817160734.12402-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It's quite unlikely that another page size will be supported,
but in any case there is still an inconsistency between custom
page size definition and generic macros used in the driver.

Switch over to the generic PAGE_SIZE for sake of the consistency.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: no change
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 30 ++++++++++--------------
 drivers/media/pci/intel/ipu3/ipu3-cio2.h |  1 -
 2 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index a89cb3c7e0dc..0cb5461bfb1e 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -96,12 +96,12 @@ static inline u32 cio2_bytesperline(const unsigned int width)
 static void cio2_fbpt_exit_dummy(struct cio2_device *cio2)
 {
 	if (cio2->dummy_lop) {
-		dma_free_coherent(&cio2->pci_dev->dev, CIO2_PAGE_SIZE,
+		dma_free_coherent(&cio2->pci_dev->dev, PAGE_SIZE,
 				  cio2->dummy_lop, cio2->dummy_lop_bus_addr);
 		cio2->dummy_lop = NULL;
 	}
 	if (cio2->dummy_page) {
-		dma_free_coherent(&cio2->pci_dev->dev, CIO2_PAGE_SIZE,
+		dma_free_coherent(&cio2->pci_dev->dev, PAGE_SIZE,
 				  cio2->dummy_page, cio2->dummy_page_bus_addr);
 		cio2->dummy_page = NULL;
 	}
@@ -111,12 +111,10 @@ static int cio2_fbpt_init_dummy(struct cio2_device *cio2)
 {
 	unsigned int i;
 
-	cio2->dummy_page = dma_alloc_coherent(&cio2->pci_dev->dev,
-					      CIO2_PAGE_SIZE,
+	cio2->dummy_page = dma_alloc_coherent(&cio2->pci_dev->dev, PAGE_SIZE,
 					      &cio2->dummy_page_bus_addr,
 					      GFP_KERNEL);
-	cio2->dummy_lop = dma_alloc_coherent(&cio2->pci_dev->dev,
-					     CIO2_PAGE_SIZE,
+	cio2->dummy_lop = dma_alloc_coherent(&cio2->pci_dev->dev, PAGE_SIZE,
 					     &cio2->dummy_lop_bus_addr,
 					     GFP_KERNEL);
 	if (!cio2->dummy_page || !cio2->dummy_lop) {
@@ -161,7 +159,7 @@ static void cio2_fbpt_entry_init_dummy(struct cio2_device *cio2,
 
 	entry[0].first_entry.first_page_offset = 0;
 	entry[1].second_entry.num_of_pages = CIO2_LOP_ENTRIES * CIO2_MAX_LOPS;
-	entry[1].second_entry.last_page_available_bytes = CIO2_PAGE_SIZE - 1;
+	entry[1].second_entry.last_page_available_bytes = PAGE_SIZE - 1;
 
 	for (i = 0; i < CIO2_MAX_LOPS; i++)
 		entry[i].lop_page_addr = cio2->dummy_lop_bus_addr >> PAGE_SHIFT;
@@ -182,25 +180,24 @@ static void cio2_fbpt_entry_init_buf(struct cio2_device *cio2,
 	entry[0].first_entry.first_page_offset = b->offset;
 	remaining = length + entry[0].first_entry.first_page_offset;
 	entry[1].second_entry.num_of_pages =
-		DIV_ROUND_UP(remaining, CIO2_PAGE_SIZE);
+		DIV_ROUND_UP(remaining, PAGE_SIZE);
 	/*
 	 * last_page_available_bytes has the offset of the last byte in the
 	 * last page which is still accessible by DMA. DMA cannot access
 	 * beyond this point. Valid range for this is from 0 to 4095.
 	 * 0 indicates 1st byte in the page is DMA accessible.
-	 * 4095 (CIO2_PAGE_SIZE - 1) means every single byte in the last page
+	 * 4095 (PAGE_SIZE - 1) means every single byte in the last page
 	 * is available for DMA transfer.
 	 */
 	entry[1].second_entry.last_page_available_bytes =
 			(remaining & ~PAGE_MASK) ?
-				(remaining & ~PAGE_MASK) - 1 :
-				CIO2_PAGE_SIZE - 1;
+				(remaining & ~PAGE_MASK) - 1 : PAGE_SIZE - 1;
 	/* Fill FBPT */
 	remaining = length;
 	i = 0;
 	while (remaining > 0) {
 		entry->lop_page_addr = b->lop_bus_addr[i] >> PAGE_SHIFT;
-		remaining -= CIO2_LOP_ENTRIES * CIO2_PAGE_SIZE;
+		remaining -= CIO2_LOP_ENTRIES * PAGE_SIZE;
 		entry++;
 		i++;
 	}
@@ -840,7 +837,7 @@ static int cio2_vb2_buf_init(struct vb2_buffer *vb)
 	struct device *dev = &cio2->pci_dev->dev;
 	struct cio2_buffer *b =
 		container_of(vb, struct cio2_buffer, vbb.vb2_buf);
-	unsigned int pages = DIV_ROUND_UP(vb->planes[0].length, CIO2_PAGE_SIZE);
+	unsigned int pages = DIV_ROUND_UP(vb->planes[0].length, PAGE_SIZE);
 	unsigned int lops = DIV_ROUND_UP(pages + 1, CIO2_LOP_ENTRIES);
 	struct sg_table *sg;
 	struct sg_dma_page_iter sg_iter;
@@ -855,7 +852,7 @@ static int cio2_vb2_buf_init(struct vb2_buffer *vb)
 	memset(b->lop, 0, sizeof(b->lop));
 	/* Allocate LOP table */
 	for (i = 0; i < lops; i++) {
-		b->lop[i] = dma_alloc_coherent(dev, CIO2_PAGE_SIZE,
+		b->lop[i] = dma_alloc_coherent(dev, PAGE_SIZE,
 					       &b->lop_bus_addr[i], GFP_KERNEL);
 		if (!b->lop[i])
 			goto fail;
@@ -885,8 +882,7 @@ static int cio2_vb2_buf_init(struct vb2_buffer *vb)
 	return 0;
 fail:
 	while (i--)
-		dma_free_coherent(dev, CIO2_PAGE_SIZE,
-				  b->lop[i], b->lop_bus_addr[i]);
+		dma_free_coherent(dev, PAGE_SIZE, b->lop[i], b->lop_bus_addr[i]);
 	return -ENOMEM;
 }
 
@@ -976,7 +972,7 @@ static void cio2_vb2_buf_cleanup(struct vb2_buffer *vb)
 	/* Free LOP table */
 	for (i = 0; i < CIO2_MAX_LOPS; i++) {
 		if (b->lop[i])
-			dma_free_coherent(&cio2->pci_dev->dev, CIO2_PAGE_SIZE,
+			dma_free_coherent(&cio2->pci_dev->dev, PAGE_SIZE,
 					  b->lop[i], b->lop_bus_addr[i]);
 	}
 }
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.h b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
index a64a829acc34..549b08f88f0c 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.h
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
@@ -392,7 +392,6 @@ struct cio2_device {
 					 sizeof(struct cio2_fbpt_entry))
 
 #define CIO2_FBPT_SUBENTRY_UNIT		4
-#define CIO2_PAGE_SIZE			4096
 
 /* cio2 fbpt first_entry ctrl status */
 #define CIO2_FBPT_CTRL_VALID		BIT(0)
-- 
2.28.0

