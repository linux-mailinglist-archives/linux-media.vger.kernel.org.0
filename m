Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC9792D9B01
	for <lists+linux-media@lfdr.de>; Mon, 14 Dec 2020 16:33:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732964AbgLNPa2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 10:30:28 -0500
Received: from mga12.intel.com ([192.55.52.136]:59093 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731592AbgLNPaZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 10:30:25 -0500
IronPort-SDR: TbMPaZEbh+QAOvHnN0j5NfTDUwv79hYSNO2ssajlLF7P55MdDC3FnHlxTaHzxR5E3v0y/BmI2Z
 GkYF0MhV+jiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="153956403"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="153956403"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2020 07:28:36 -0800
IronPort-SDR: Naemgtj/MnnhEZYSls6Ue1vYQiUAFQlhRHv4cRLHQf/KwqDmaU95sZnpVYrGRq/Y4BZ83+OwHu
 QMaDGVprXE2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="556066302"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 14 Dec 2020 07:28:34 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A01312A7; Mon, 14 Dec 2020 17:28:33 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        kernel test robot <lkp@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v1] media: ipu3-cio2: Build only for x86
Date:   Mon, 14 Dec 2020 17:28:32 +0200
Message-Id: <20201214152832.39463-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to the original code in the driver it was never assumed to work
with big page sizes: unsigned short type followed by PAGE_SHIFT and PAGE_MASK
which may be different on non-x86 architectures.

Recently LKP found an issue on non-x86 architectures due to above mentioned
limitations. Since Sakari acknowledges that it's not really useful to be able
to compile this elsewhere, mark it x86 only.

Fixes: a31d19f88932 ("media: ipu3: allow building it with COMPILE_TEST on non-x86 archs")
Reported-by: kernel test robot <lkp@intel.com>
Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu3/Kconfig b/drivers/media/pci/intel/ipu3/Kconfig
index 82d7f17e6a02..7a805201034b 100644
--- a/drivers/media/pci/intel/ipu3/Kconfig
+++ b/drivers/media/pci/intel/ipu3/Kconfig
@@ -2,7 +2,8 @@
 config VIDEO_IPU3_CIO2
 	tristate "Intel ipu3-cio2 driver"
 	depends on VIDEO_V4L2 && PCI
-	depends on (X86 && ACPI) || COMPILE_TEST
+	depends on ACPI || COMPILE_TEST
+	depends on X86
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
-- 
2.29.2

