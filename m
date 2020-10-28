Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D83629EE76
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 15:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727806AbgJ2Oih (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 10:38:37 -0400
Received: from mga12.intel.com ([192.55.52.136]:25597 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726633AbgJ2Oig (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 10:38:36 -0400
IronPort-SDR: 4m0csV/i7fOKNgyssw+j08D2uoeYtfjZrfuAQ67fh4JAp2z2iuQ52+AO+S18spKNVO/vEQTF1B
 X1819Y53HOfw==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="147722770"
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="147722770"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 07:38:36 -0700
IronPort-SDR: Kyk6fedtF9ySuh/QD6/Gc8jl3F9tPaT+fDyDd24VgkclWngSZbhnAtv9ITJX0GGpUIYk33+Mrc
 yDP91F1pLIbw==
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="469158026"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 07:38:34 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1kY95V-001JNe-3j; Thu, 29 Oct 2020 16:39:37 +0200
X-Original-To: andriy.shevchenko@linux.intel.com
Received: from linux.intel.com [10.54.29.200]
        by smile.fi.intel.com with IMAP (fetchmail-6.4.12)
        for <andy@localhost> (single-drop); Wed, 28 Oct 2020 18:00:05 +0200 (EET)
Received: from fmsmga001.fm.intel.com (fmsmga001.fm.intel.com [10.253.24.23])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by linux.intel.com (Postfix) with ESMTPS id B693958087A;
        Wed, 28 Oct 2020 08:55:23 -0700 (PDT)
IronPort-SDR: 3wiC9QmEggQr7VREF2Wrd1h67K8MiJ9WQveHTtFzpgk/5i8GTeyEvrGzYU2mKUaYvWthPEEadK
 z57RuWSh+zag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,427,1596524400"; 
   d="scan'208";a="424766974"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 28 Oct 2020 08:55:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id EBAD4453; Wed, 28 Oct 2020 17:55:20 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2] media: ipu3-cio2: Use macros from mm.h
Date:   Wed, 28 Oct 2020 17:55:20 +0200
Message-Id: <20201028155520.14458-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are few nice macros in mm.h, some of which we may use here.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
---
v2: rewrote to make it short and neat (Bingbu), added Rb tag (Bingbu)
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index d4b575813300..3d0c867e9762 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -15,6 +15,7 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
+#include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/pfn.h>
@@ -190,9 +191,8 @@ static void cio2_fbpt_entry_init_buf(struct cio2_device *cio2,
 	 * 4095 (PAGE_SIZE - 1) means every single byte in the last page
 	 * is available for DMA transfer.
 	 */
-	entry[1].second_entry.last_page_available_bytes =
-			(remaining & ~PAGE_MASK) ?
-				(remaining & ~PAGE_MASK) - 1 : PAGE_SIZE - 1;
+	remaining = offset_in_page(remaining) ?: PAGE_SIZE;
+	entry[1].second_entry.last_page_available_bytes = remaining - 1;
 	/* Fill FBPT */
 	remaining = length;
 	i = 0;
-- 
2.28.0

