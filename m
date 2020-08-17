Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9913C24704B
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 20:08:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390288AbgHQSG0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 14:06:26 -0400
Received: from mga07.intel.com ([134.134.136.100]:20289 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388305AbgHQQIw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 12:08:52 -0400
IronPort-SDR: vQ4pYZqyC6qokUzGGKS55rtmAtJqYfjF0ILFEAkaghbFJgqXFeL3v7XTM4wgIkydgazNoOd1K0
 bLbOkqaBjdeA==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="219062287"
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="219062287"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 09:08:42 -0700
IronPort-SDR: 42tdZwnhG2xZsTnZswr8Wf5gfNqUEm5A4YxV0i7NEfdDIzJw+ng1rEqj8doyUSgMwSbQ8j8dNz
 j3gJcmCEX43Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="336321298"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 17 Aug 2020 09:08:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 583D91A3; Mon, 17 Aug 2020 19:08:39 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2 04/10] media: ipu3-cio2: Use macros from pfn.h
Date:   Mon, 17 Aug 2020 19:07:27 +0300
Message-Id: <20200817160734.12402-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817160734.12402-1-andriy.shevchenko@linux.intel.com>
References: <20200817160734.12402-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are few nice macros in pfn.h, some of which we may use here.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: no change
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 0cb5461bfb1e..35bf05de5d5d 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -16,6 +16,7 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/pfn.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/vmalloc.h>
@@ -126,7 +127,7 @@ static int cio2_fbpt_init_dummy(struct cio2_device *cio2)
 	 * Initialize each entry to dummy_page bus base address.
 	 */
 	for (i = 0; i < CIO2_LOP_ENTRIES; i++)
-		cio2->dummy_lop[i] = cio2->dummy_page_bus_addr >> PAGE_SHIFT;
+		cio2->dummy_lop[i] = PFN_DOWN(cio2->dummy_page_bus_addr);
 
 	return 0;
 }
@@ -162,7 +163,7 @@ static void cio2_fbpt_entry_init_dummy(struct cio2_device *cio2,
 	entry[1].second_entry.last_page_available_bytes = PAGE_SIZE - 1;
 
 	for (i = 0; i < CIO2_MAX_LOPS; i++)
-		entry[i].lop_page_addr = cio2->dummy_lop_bus_addr >> PAGE_SHIFT;
+		entry[i].lop_page_addr = PFN_DOWN(cio2->dummy_lop_bus_addr);
 
 	cio2_fbpt_entry_enable(cio2, entry);
 }
@@ -179,8 +180,7 @@ static void cio2_fbpt_entry_init_buf(struct cio2_device *cio2,
 
 	entry[0].first_entry.first_page_offset = b->offset;
 	remaining = length + entry[0].first_entry.first_page_offset;
-	entry[1].second_entry.num_of_pages =
-		DIV_ROUND_UP(remaining, PAGE_SIZE);
+	entry[1].second_entry.num_of_pages = PFN_UP(remaining);
 	/*
 	 * last_page_available_bytes has the offset of the last byte in the
 	 * last page which is still accessible by DMA. DMA cannot access
@@ -196,7 +196,7 @@ static void cio2_fbpt_entry_init_buf(struct cio2_device *cio2,
 	remaining = length;
 	i = 0;
 	while (remaining > 0) {
-		entry->lop_page_addr = b->lop_bus_addr[i] >> PAGE_SHIFT;
+		entry->lop_page_addr = PFN_DOWN(b->lop_bus_addr[i]);
 		remaining -= CIO2_LOP_ENTRIES * PAGE_SIZE;
 		entry++;
 		i++;
@@ -205,7 +205,7 @@ static void cio2_fbpt_entry_init_buf(struct cio2_device *cio2,
 	/*
 	 * The first not meaningful FBPT entry should point to a valid LOP
 	 */
-	entry->lop_page_addr = cio2->dummy_lop_bus_addr >> PAGE_SHIFT;
+	entry->lop_page_addr = PFN_DOWN(cio2->dummy_lop_bus_addr);
 
 	cio2_fbpt_entry_enable(cio2, entry);
 }
@@ -471,8 +471,7 @@ static int cio2_hw_init(struct cio2_device *cio2, struct cio2_queue *q)
 	}
 
 	/* Enable DMA */
-	writel(q->fbpt_bus_addr >> PAGE_SHIFT,
-	       base + CIO2_REG_CDMABA(CIO2_DMA_CHAN));
+	writel(PFN_DOWN(q->fbpt_bus_addr), base + CIO2_REG_CDMABA(CIO2_DMA_CHAN));
 
 	writel(num_buffers1 << CIO2_CDMAC0_FBPT_LEN_SHIFT |
 	       FBPT_WIDTH << CIO2_CDMAC0_FBPT_WIDTH_SHIFT |
@@ -837,7 +836,7 @@ static int cio2_vb2_buf_init(struct vb2_buffer *vb)
 	struct device *dev = &cio2->pci_dev->dev;
 	struct cio2_buffer *b =
 		container_of(vb, struct cio2_buffer, vbb.vb2_buf);
-	unsigned int pages = DIV_ROUND_UP(vb->planes[0].length, PAGE_SIZE);
+	unsigned int pages = PFN_UP(vb->planes[0].length);
 	unsigned int lops = DIV_ROUND_UP(pages + 1, CIO2_LOP_ENTRIES);
 	struct sg_table *sg;
 	struct sg_dma_page_iter sg_iter;
@@ -870,7 +869,7 @@ static int cio2_vb2_buf_init(struct vb2_buffer *vb)
 	for_each_sg_dma_page (sg->sgl, &sg_iter, sg->nents, 0) {
 		if (!pages--)
 			break;
-		b->lop[i][j] = sg_page_iter_dma_address(&sg_iter) >> PAGE_SHIFT;
+		b->lop[i][j] = PFN_DOWN(sg_page_iter_dma_address(&sg_iter));
 		j++;
 		if (j == CIO2_LOP_ENTRIES) {
 			i++;
@@ -878,7 +877,7 @@ static int cio2_vb2_buf_init(struct vb2_buffer *vb)
 		}
 	}
 
-	b->lop[i][j] = cio2->dummy_page_bus_addr >> PAGE_SHIFT;
+	b->lop[i][j] = PFN_DOWN(cio2->dummy_page_bus_addr);
 	return 0;
 fail:
 	while (i--)
-- 
2.28.0

