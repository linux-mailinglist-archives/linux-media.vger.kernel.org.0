Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8C8D205A21
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 20:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733204AbgFWSFm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 14:05:42 -0400
Received: from mga11.intel.com ([192.55.52.93]:1935 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733193AbgFWSFk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 14:05:40 -0400
IronPort-SDR: leaD6S007AZnhH0xbSiGF1+4BYYmw70AC7e/tXyHhesYp7A0I6nzGRfuCIkTFNdNMvfT+11snC
 EAQBsMYvS+TA==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="142404329"
X-IronPort-AV: E=Sophos;i="5.75,272,1589266800"; 
   d="scan'208";a="142404329"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2020 11:05:36 -0700
IronPort-SDR: 5Ch0N9djfR09sOKmkac3YYG9usb/7eSppbNBj1Ca3OsdRG3K7l45gLdXmAD3PI1bLS7KnLWoqK
 88tkN/r8aTLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,272,1589266800"; 
   d="scan'208";a="423093617"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 23 Jun 2020 11:05:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 0B03711C; Tue, 23 Jun 2020 21:05:34 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/9] media: atomisp: move CCK endpoint address to generic header
Date:   Tue, 23 Jun 2020 21:05:26 +0300
Message-Id: <20200623180533.65970-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623180533.65970-1-andriy.shevchenko@linux.intel.com>
References: <20200623180533.65970-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

IOSF MBI header contains a lot of definitions, such as
end point addresses of IPs. Move CCK address from AtomISP driver
to generic header.

While here, drop unused one.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/x86/include/asm/iosf_mbi.h                  | 1 +
 drivers/staging/media/atomisp/pci/atomisp-regs.h | 3 ---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 2 +-
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/iosf_mbi.h b/arch/x86/include/asm/iosf_mbi.h
index 5270ff39b9af..a1911fea8739 100644
--- a/arch/x86/include/asm/iosf_mbi.h
+++ b/arch/x86/include/asm/iosf_mbi.h
@@ -39,6 +39,7 @@
 #define BT_MBI_UNIT_PMC		0x04
 #define BT_MBI_UNIT_GFX		0x06
 #define BT_MBI_UNIT_SMI		0x0C
+#define BT_MBI_UNIT_CCK		0x14
 #define BT_MBI_UNIT_USB		0x43
 #define BT_MBI_UNIT_SATA	0xA3
 #define BT_MBI_UNIT_PCIE	0xA6
diff --git a/drivers/staging/media/atomisp/pci/atomisp-regs.h b/drivers/staging/media/atomisp/pci/atomisp-regs.h
index de34ee28e390..022997f47121 100644
--- a/drivers/staging/media/atomisp/pci/atomisp-regs.h
+++ b/drivers/staging/media/atomisp/pci/atomisp-regs.h
@@ -20,9 +20,6 @@
 #define ATOMISP_REGS_H
 
 /* common register definitions */
-#define PUNIT_PORT		0x04
-#define CCK_PORT		0x14
-
 #define PCICMDSTS		0x01
 #define INTR			0x0f
 #define MSI_CAPID		0x24
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index d36809a0182c..fa07cbaf0422 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1685,7 +1685,7 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 		isp->dfs = &dfs_config_cht;
 		isp->pdev->d3cold_delay = 0;
 
-		iosf_mbi_read(CCK_PORT, MBI_REG_READ, CCK_FUSE_REG_0, &val);
+		iosf_mbi_read(BT_MBI_UNIT_CCK, MBI_REG_READ, CCK_FUSE_REG_0, &val);
 		switch (val & CCK_FUSE_HPLL_FREQ_MASK) {
 		case 0x00:
 			isp->hpll_freq = HPLL_FREQ_800MHZ;
-- 
2.27.0

