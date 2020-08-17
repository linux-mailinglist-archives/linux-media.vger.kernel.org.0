Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8989C24704D
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 20:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390291AbgHQSGg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 14:06:36 -0400
Received: from mga11.intel.com ([192.55.52.93]:29632 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388472AbgHQQIv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 12:08:51 -0400
IronPort-SDR: Nsr5ZXGNvYEmuXN1e92Y6yL2sDgMu7Yq4v09TSAEoh7darzlFaHiYr8rlUDPbMsCNzSQBf1D/O
 4htqG5HrZJJA==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="152379914"
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="152379914"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 09:08:46 -0700
IronPort-SDR: Vwz5Ac4p6sxThUsn2NKK/OC1ecG8uhbLObI/rX2zToaxiW7FXW79EBguFiHtGbZKVS6q5BvGSf
 3NuYjBbEU07g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="370610470"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 17 Aug 2020 09:08:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 724951A3; Mon, 17 Aug 2020 19:08:44 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2 08/10] media: ipu3-cio2: Drop bogus check and error message
Date:   Mon, 17 Aug 2020 19:07:31 +0300
Message-Id: <20200817160734.12402-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817160734.12402-1-andriy.shevchenko@linux.intel.com>
References: <20200817160734.12402-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

pcim_iomap_table() won't fail if previous pcim_iomap_regions() hasn't.
Since we check pcim_iomap_regions() for failure the check close to
pcim_iomap_table() is bogus and not needed.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: new patch
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 57310d7874ce..f5c27c1aa9a2 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1715,7 +1715,6 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 			  const struct pci_device_id *id)
 {
 	struct cio2_device *cio2;
-	void __iomem *const *iomap;
 	int r;
 
 	cio2 = devm_kzalloc(&pci_dev->dev, sizeof(*cio2), GFP_KERNEL);
@@ -1738,13 +1737,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 		return -ENODEV;
 	}
 
-	iomap = pcim_iomap_table(pci_dev);
-	if (!iomap) {
-		dev_err(&pci_dev->dev, "failed to iomap table\n");
-		return -ENODEV;
-	}
-
-	cio2->base = iomap[CIO2_PCI_BAR];
+	cio2->base = pcim_iomap_table(pci_dev)[CIO2_PCI_BAR];
 
 	pci_set_drvdata(pci_dev, cio2);
 
-- 
2.28.0

