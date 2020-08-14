Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D169244CA7
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 18:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbgHNQaZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 12:30:25 -0400
Received: from mga18.intel.com ([134.134.136.126]:29792 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728129AbgHNQaX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 12:30:23 -0400
IronPort-SDR: b3ubtzdyAmHfLqHXMIDASFWKQLtZ3KqorKtg7/Wsq6FKRQD5lDn/NwHI0ZtqmHPjeBfX9CwYqd
 sfSQj0VmTyqQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9713"; a="142064537"
X-IronPort-AV: E=Sophos;i="5.76,312,1592895600"; 
   d="scan'208";a="142064537"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2020 09:30:23 -0700
IronPort-SDR: U0sBx6InpTBH3hjdaLu+/nuJbIFRW6pmLl1xxdupv0e99UMkBMqTngypihfGGkGAorokyuwsbc
 7X8361Qo8NNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,312,1592895600"; 
   d="scan'208";a="278449489"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 14 Aug 2020 09:30:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 341513A3; Fri, 14 Aug 2020 19:30:18 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 6/7] media: ipu3-cio2: Use readl_poll_timeout() helper
Date:   Fri, 14 Aug 2020 19:30:16 +0300
Message-Id: <20200814163017.35001-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814163017.35001-1-andriy.shevchenko@linux.intel.com>
References: <20200814163017.35001-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We may use special helper macro to poll IO till condition or timeout occurs.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index f4175dc1501a..5f8ff91dbf09 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -14,6 +14,7 @@
 
 #include <linux/delay.h>
 #include <linux/interrupt.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/pfn.h>
@@ -509,7 +510,10 @@ static int cio2_hw_init(struct cio2_device *cio2, struct cio2_queue *q)
 static void cio2_hw_exit(struct cio2_device *cio2, struct cio2_queue *q)
 {
 	void __iomem *base = cio2->base;
-	unsigned int i, maxloops = 1000;
+	void __iomem *dma = base + CIO2_REG_CDMAC0(CIO2_DMA_CHAN);
+	unsigned int i;
+	u32 value;
+	int ret;
 
 	/* Disable CSI receiver and MIPI backend devices */
 	writel(0, q->csi_rx_base + CIO2_REG_IRQCTRL_MASK);
@@ -518,14 +522,9 @@ static void cio2_hw_exit(struct cio2_device *cio2, struct cio2_queue *q)
 	writel(0, q->csi_rx_base + CIO2_REG_MIPIBE_ENABLE);
 
 	/* Halt DMA */
-	writel(0, base + CIO2_REG_CDMAC0(CIO2_DMA_CHAN));
-	do {
-		if (readl(base + CIO2_REG_CDMAC0(CIO2_DMA_CHAN)) &
-		    CIO2_CDMAC0_DMA_HALTED)
-			break;
-		usleep_range(1000, 2000);
-	} while (--maxloops);
-	if (!maxloops)
+	writel(0, dma);
+	ret = readl_poll_timeout(dma, value, value & CIO2_CDMAC0_DMA_HALTED, 4000, 2000000);
+	if (ret)
 		dev_err(&cio2->pci_dev->dev,
 			"DMA %i can not be halted\n", CIO2_DMA_CHAN);
 
-- 
2.28.0

