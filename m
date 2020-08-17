Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55F2E247051
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 20:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390215AbgHQSGu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 14:06:50 -0400
Received: from mga03.intel.com ([134.134.136.65]:8067 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388474AbgHQQIv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 12:08:51 -0400
IronPort-SDR: dPY5q0bDRwIKsNt+6/8QKUCRifRaxMuwT/E6ofXCui+AU5d5MK7addf755pSwth7+yVdOvE3ru
 eNVFESIzSN1A==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="154715337"
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="154715337"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 09:08:47 -0700
IronPort-SDR: rTkf75h/1XnFdxzxGPVgv+LhqMj8MWrJ63/3rDn8o8sOq5salU3l7D3iISakFZoSPFoUy2n7Qk
 Q1ZsnjqdQ6Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="277796319"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 17 Aug 2020 09:08:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A427C16D; Mon, 17 Aug 2020 19:08:45 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2 09/10] media: ipu3-cio2: Drop useless assignments
Date:   Mon, 17 Aug 2020 19:07:32 +0300
Message-Id: <20200817160734.12402-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817160734.12402-1-andriy.shevchenko@linux.intel.com>
References: <20200817160734.12402-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are assignments inside the functions which are useless.
Drop them for good.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: new patch
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index f5c27c1aa9a2..f3ec2d62cace 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1979,8 +1979,8 @@ static int __maybe_unused cio2_suspend(struct device *dev)
 static int __maybe_unused cio2_resume(struct device *dev)
 {
 	struct cio2_device *cio2 = dev_get_drvdata(dev);
-	int r = 0;
 	struct cio2_queue *q = cio2->cur_queue;
+	int r;
 
 	dev_dbg(dev, "cio2 resume\n");
 	if (!cio2->streaming)
@@ -2007,7 +2007,7 @@ static const struct dev_pm_ops cio2_pm_ops = {
 
 static const struct pci_device_id cio2_pci_id_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, CIO2_PCI_ID) },
-	{ 0 }
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, cio2_pci_id_table);
-- 
2.28.0

