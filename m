Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECB2024705D
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 20:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390331AbgHQSHO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 14:07:14 -0400
Received: from mga03.intel.com ([134.134.136.65]:8065 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388470AbgHQQIv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 12:08:51 -0400
IronPort-SDR: SXZJE9+WG1nsOycEVfw/BilqXEQI+Z2ZthMTtCXxOuHtOyPzu1rNR83tQhpI1eoa05cmUFwPov
 wu+TXZLoWPZQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="154715334"
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="154715334"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 09:08:44 -0700
IronPort-SDR: Ekp55ySh+p3rDs/TcMHiY9E8weQ5rFqW1GcEuGJ/eh17mMD2s+zvK/Wj8OQhocofmwBiraRJ2R
 V5WoUjnYPPtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="277796305"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 17 Aug 2020 09:08:42 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E0437250; Mon, 17 Aug 2020 19:08:41 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2 06/10] media: ipu3-cio2: Use readl_poll_timeout() helper
Date:   Mon, 17 Aug 2020 19:07:29 +0300
Message-Id: <20200817160734.12402-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817160734.12402-1-andriy.shevchenko@linux.intel.com>
References: <20200817160734.12402-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We may use special helper macro to poll IO till condition or timeout occurs.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: wrapped long line (Bingbu)
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 36b4c7730f43..7bcde3ba8f6e 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -14,6 +14,7 @@
 
 #include <linux/delay.h>
 #include <linux/interrupt.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/pfn.h>
@@ -507,8 +508,10 @@ static int cio2_hw_init(struct cio2_device *cio2, struct cio2_queue *q)
 
 static void cio2_hw_exit(struct cio2_device *cio2, struct cio2_queue *q)
 {
-	void __iomem *base = cio2->base;
-	unsigned int i, maxloops = 1000;
+	void __iomem *const base = cio2->base;
+	unsigned int i;
+	u32 value;
+	int ret;
 
 	/* Disable CSI receiver and MIPI backend devices */
 	writel(0, q->csi_rx_base + CIO2_REG_IRQCTRL_MASK);
@@ -518,13 +521,10 @@ static void cio2_hw_exit(struct cio2_device *cio2, struct cio2_queue *q)
 
 	/* Halt DMA */
 	writel(0, base + CIO2_REG_CDMAC0(CIO2_DMA_CHAN));
-	do {
-		if (readl(base + CIO2_REG_CDMAC0(CIO2_DMA_CHAN)) &
-		    CIO2_CDMAC0_DMA_HALTED)
-			break;
-		usleep_range(1000, 2000);
-	} while (--maxloops);
-	if (!maxloops)
+	ret = readl_poll_timeout(base + CIO2_REG_CDMAC0(CIO2_DMA_CHAN),
+				 value, value & CIO2_CDMAC0_DMA_HALTED,
+				 4000, 2000000);
+	if (ret)
 		dev_err(&cio2->pci_dev->dev,
 			"DMA %i can not be halted\n", CIO2_DMA_CHAN);
 
-- 
2.28.0

