Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D32CC24705F
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 20:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389141AbgHQSHq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 14:07:46 -0400
Received: from mga14.intel.com ([192.55.52.115]:40728 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388466AbgHQQIr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 12:08:47 -0400
IronPort-SDR: FJ2VBOXWFmPsX/fqjV22/79+1vFxfjEstIdsgFf4MIcjY8MZyr7w33H7BQzuI1VgTsYJ27GccQ
 wWCORfC4AJBw==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="153995981"
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="153995981"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 09:08:39 -0700
IronPort-SDR: 39y/OL/AkHcLAUgSKglW+3FMcNdXP9O37dPgdhrnz6qHwuPniNmnkrnQZ8oot9AGYJWPtrQrhm
 7vlemjaQgiRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="310139133"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 17 Aug 2020 09:08:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id BC34C1A3; Mon, 17 Aug 2020 19:08:35 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2 02/10] media: ipu3-cio2: Introduce CIO2_LOP_ENTRIES constant
Date:   Mon, 17 Aug 2020 19:07:25 +0300
Message-Id: <20200817160734.12402-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817160734.12402-1-andriy.shevchenko@linux.intel.com>
References: <20200817160734.12402-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This constant is used in several places in the code, define it
for better maintenance.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: renamed CIO2_MAX_ENTRIES -> CIO2_LOP_ENTRIES (Sakari)
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 13 +++++--------
 drivers/media/pci/intel/ipu3/ipu3-cio2.h |  3 +++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index cb74d49934f1..a89cb3c7e0dc 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -127,7 +127,7 @@ static int cio2_fbpt_init_dummy(struct cio2_device *cio2)
 	 * List of Pointers(LOP) contains 1024x32b pointers to 4KB page each
 	 * Initialize each entry to dummy_page bus base address.
 	 */
-	for (i = 0; i < CIO2_PAGE_SIZE / sizeof(*cio2->dummy_lop); i++)
+	for (i = 0; i < CIO2_LOP_ENTRIES; i++)
 		cio2->dummy_lop[i] = cio2->dummy_page_bus_addr >> PAGE_SHIFT;
 
 	return 0;
@@ -160,8 +160,7 @@ static void cio2_fbpt_entry_init_dummy(struct cio2_device *cio2,
 	unsigned int i;
 
 	entry[0].first_entry.first_page_offset = 0;
-	entry[1].second_entry.num_of_pages =
-		CIO2_PAGE_SIZE / sizeof(u32) * CIO2_MAX_LOPS;
+	entry[1].second_entry.num_of_pages = CIO2_LOP_ENTRIES * CIO2_MAX_LOPS;
 	entry[1].second_entry.last_page_available_bytes = CIO2_PAGE_SIZE - 1;
 
 	for (i = 0; i < CIO2_MAX_LOPS; i++)
@@ -201,7 +200,7 @@ static void cio2_fbpt_entry_init_buf(struct cio2_device *cio2,
 	i = 0;
 	while (remaining > 0) {
 		entry->lop_page_addr = b->lop_bus_addr[i] >> PAGE_SHIFT;
-		remaining -= CIO2_PAGE_SIZE / sizeof(u32) * CIO2_PAGE_SIZE;
+		remaining -= CIO2_LOP_ENTRIES * CIO2_PAGE_SIZE;
 		entry++;
 		i++;
 	}
@@ -841,10 +840,8 @@ static int cio2_vb2_buf_init(struct vb2_buffer *vb)
 	struct device *dev = &cio2->pci_dev->dev;
 	struct cio2_buffer *b =
 		container_of(vb, struct cio2_buffer, vbb.vb2_buf);
-	static const unsigned int entries_per_page =
-		CIO2_PAGE_SIZE / sizeof(u32);
 	unsigned int pages = DIV_ROUND_UP(vb->planes[0].length, CIO2_PAGE_SIZE);
-	unsigned int lops = DIV_ROUND_UP(pages + 1, entries_per_page);
+	unsigned int lops = DIV_ROUND_UP(pages + 1, CIO2_LOP_ENTRIES);
 	struct sg_table *sg;
 	struct sg_dma_page_iter sg_iter;
 	unsigned int i, j;
@@ -878,7 +875,7 @@ static int cio2_vb2_buf_init(struct vb2_buffer *vb)
 			break;
 		b->lop[i][j] = sg_page_iter_dma_address(&sg_iter) >> PAGE_SHIFT;
 		j++;
-		if (j == entries_per_page) {
+		if (j == CIO2_LOP_ENTRIES) {
 			i++;
 			j = 0;
 		}
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.h b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
index 7caab9b8c2b9..a64a829acc34 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.h
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
@@ -4,6 +4,8 @@
 #ifndef __IPU3_CIO2_H
 #define __IPU3_CIO2_H
 
+#include <linux/types.h>
+
 #define CIO2_NAME					"ipu3-cio2"
 #define CIO2_DEVICE_NAME				"Intel IPU3 CIO2"
 #define CIO2_ENTITY_NAME				"ipu3-csi2"
@@ -17,6 +19,7 @@
 /* 32MB = 8xFBPT_entry */
 #define CIO2_MAX_LOPS					8
 #define CIO2_MAX_BUFFERS			(PAGE_SIZE / 16 / CIO2_MAX_LOPS)
+#define CIO2_LOP_ENTRIES			(PAGE_SIZE / sizeof(u32))
 
 #define CIO2_PAD_SINK					0
 #define CIO2_PAD_SOURCE					1
-- 
2.28.0

