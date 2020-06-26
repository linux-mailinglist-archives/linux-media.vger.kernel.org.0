Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7368C20B149
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 14:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbgFZMTt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 08:19:49 -0400
Received: from mga11.intel.com ([192.55.52.93]:29764 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728354AbgFZMTt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 08:19:49 -0400
IronPort-SDR: +jKEjxHBRXleA+op/a9FZl2BoPnHJCAQSDNnBW5vjvdeFcnTej5mbqhDD0fvhRsdbkGjcmsNnF
 5j8FKrxUWuag==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="143544892"
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; 
   d="scan'208";a="143544892"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2020 05:19:34 -0700
IronPort-SDR: NOud4+RQuRtxPTdBCGDmx+V9evZ3iB8328AgJIHOWMLypYSsnKPfXsDSy2JBK9478mm9IOv5vM
 UPzV0st1OkTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; 
   d="scan'208";a="312306796"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 26 Jun 2020 05:19:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9EB81710; Fri, 26 Jun 2020 15:19:28 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 15/15] media: atomisp: Deduplicate return ret in gmin_i2c_write()
Date:   Fri, 26 Jun 2020 15:19:25 +0300
Message-Id: <20200626121925.14365-16-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626121925.14365-1-andriy.shevchenko@linux.intel.com>
References: <20200626121925.14365-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Deduplicate return ret in gmin_i2c_write().

While here, replace 'Kernel' by 'kernel' in the message and
reduce amount of LOCs.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../staging/media/atomisp/pci/atomisp_gmin_platform.c  | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 7f9e93a9a4b1..11437161ef20 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -423,16 +423,12 @@ static int gmin_i2c_write(struct device *dev, u16 i2c_addr, u8 reg,
 		"I2C write, addr: 0x%02x, reg: 0x%02x, value: 0x%02x, mask: 0x%02x\n",
 		i2c_addr, reg, value, mask);
 
-	ret = intel_soc_pmic_exec_mipi_pmic_seq_element(i2c_addr, reg,
-							value, mask);
-
-	if (ret == -EOPNOTSUPP) {
+	ret = intel_soc_pmic_exec_mipi_pmic_seq_element(i2c_addr, reg, value, mask);
+	if (ret == -EOPNOTSUPP)
 		dev_err(dev,
 			"ACPI didn't mapped the OpRegion needed to access I2C address 0x%02x.\n"
-			"Need to compile the Kernel using CONFIG_*_PMIC_OPREGION settings\n",
+			"Need to compile the kernel using CONFIG_*_PMIC_OPREGION settings\n",
 			i2c_addr);
-		return ret;
-	}
 
 	return ret;
 }
-- 
2.27.0

