Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6B9C20B142
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 14:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728320AbgFZMTf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 08:19:35 -0400
Received: from mga05.intel.com ([192.55.52.43]:3716 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726667AbgFZMTc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 08:19:32 -0400
IronPort-SDR: Oks5GDRpm7ABBM9W6KfrSrWM4el9OHltgFwFl5SJt8XP2Wk1bRUTvxcJvjlmArRm3VX8exvkDz
 xSRXjGTFs9jQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="230076578"
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; 
   d="scan'208";a="230076578"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2020 05:19:30 -0700
IronPort-SDR: PJYb08jRJB+R2iKeo+VoaY5hA6ZLF24bWa+Gq6r0PiyWEzbPizBVaWVwOHqGoxPwQyavXxcOQ1
 ZzCdvNZXjGjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; 
   d="scan'208";a="301031920"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 26 Jun 2020 05:19:29 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2CEE1352; Fri, 26 Jun 2020 15:19:28 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 02/15] media: atomisp: move CCK endpoint address to generic header
Date:   Fri, 26 Jun 2020 15:19:12 +0300
Message-Id: <20200626121925.14365-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626121925.14365-1-andriy.shevchenko@linux.intel.com>
References: <20200626121925.14365-1-andriy.shevchenko@linux.intel.com>
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

