Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 607CE24702F
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 20:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388500AbgHQQJQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 12:09:16 -0400
Received: from mga07.intel.com ([134.134.136.100]:20293 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388461AbgHQQI5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 12:08:57 -0400
IronPort-SDR: Injr4Y/ptjOHetW5waHF6BfFWEtnEauSFpiodiK+P9zpE+WfLwooG5jD+vq87+zGKeFv8xdFHl
 2qOPaXPrU8Pg==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="219062300"
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="219062300"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 09:08:45 -0700
IronPort-SDR: FbmxnCJ7QRR08ot5Xx0raqwe8YRFX/24jMZrmrqb8UkRXOwldubSC5FbTrbRLjHZ19ct+Z3tjr
 kIHONMewEdQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="336321306"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 17 Aug 2020 09:08:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2EE3E16D; Mon, 17 Aug 2020 19:08:43 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2 07/10] media: ipu3-cio2: Get rid of pci_set_master() duplication
Date:   Mon, 17 Aug 2020 19:07:30 +0300
Message-Id: <20200817160734.12402-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817160734.12402-1-andriy.shevchenko@linux.intel.com>
References: <20200817160734.12402-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It's unclear why driver repeats the code from PCI core.
Drop it for good.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: new patch
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 26 +++++-------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 7bcde3ba8f6e..57310d7874ce 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1711,24 +1711,6 @@ static void cio2_queues_exit(struct cio2_device *cio2)
 
 /**************** PCI interface ****************/
 
-static int cio2_pci_config_setup(struct pci_dev *dev)
-{
-	u16 pci_command;
-	int r = pci_enable_msi(dev);
-
-	if (r) {
-		dev_err(&dev->dev, "failed to enable MSI (%d)\n", r);
-		return r;
-	}
-
-	pci_read_config_word(dev, PCI_COMMAND, &pci_command);
-	pci_command |= PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER |
-		PCI_COMMAND_INTX_DISABLE;
-	pci_write_config_word(dev, PCI_COMMAND, pci_command);
-
-	return 0;
-}
-
 static int cio2_pci_probe(struct pci_dev *pci_dev,
 			  const struct pci_device_id *id)
 {
@@ -1774,9 +1756,11 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 		return -ENODEV;
 	}
 
-	r = cio2_pci_config_setup(pci_dev);
-	if (r)
-		return -ENODEV;
+	r = pci_enable_msi(pci_dev);
+	if (r) {
+		dev_err(&pci_dev->dev, "failed to enable MSI (%d)\n", r);
+		return r;
+	}
 
 	r = cio2_fbpt_init_dummy(cio2);
 	if (r)
-- 
2.28.0

