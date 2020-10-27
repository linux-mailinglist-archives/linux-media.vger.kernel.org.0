Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3D4529C62E
	for <lists+linux-media@lfdr.de>; Tue, 27 Oct 2020 19:27:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1825808AbgJ0SOJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Oct 2020 14:14:09 -0400
Received: from mga03.intel.com ([134.134.136.65]:35785 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756492AbgJ0SOI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Oct 2020 14:14:08 -0400
IronPort-SDR: ZAfaEY1+D8H8kqLf4IiqWoNlYj/sBPEz9oqiEMEiiFIyqjLggDwhOzwrotx6fRfzI0MofH5hez
 HgKnMX9yhYYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9787"; a="168234149"
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; 
   d="scan'208";a="168234149"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2020 11:14:07 -0700
IronPort-SDR: Kr/cnUwOXEUdOiiYEzvC3lEQpNhyTu7gp55zNNQ/sbt2GudugD/eNN7wvQZ+1I7qfGrqeIJlH8
 tW50TzCGYMyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; 
   d="scan'208";a="350370917"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 27 Oct 2020 11:14:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id BB49C179; Tue, 27 Oct 2020 20:14:04 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] media: ipu3-cio2: Use macros from mm.h
Date:   Tue, 27 Oct 2020 20:14:04 +0200
Message-Id: <20201027181404.20996-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are few nice macros in mm.h, some of which we may use here.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index d4b575813300..3ef5cf46647c 100644
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
+	remaining = offset_in_page(remaining);
+	entry[1].second_entry.last_page_available_bytes = (remaining ?: PAGE_SIZE) - 1;
 	/* Fill FBPT */
 	remaining = length;
 	i = 0;
-- 
2.28.0

