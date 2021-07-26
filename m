Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A07643D55C5
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 10:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232380AbhGZIAH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 04:00:07 -0400
Received: from mga11.intel.com ([192.55.52.93]:11900 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231925AbhGZIAH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 04:00:07 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="209071531"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; 
   d="scan'208";a="209071531"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2021 01:40:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; 
   d="scan'208";a="436694609"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 26 Jul 2021 01:40:30 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 0E778DE; Mon, 26 Jul 2021 11:40:58 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jens Axboe <axboe@kernel.dk>
Subject: [PATCH v1 1/1] media: ipu3-cio2: Drop reference on error path in cio2_bridge_connect_sensor()
Date:   Mon, 26 Jul 2021 11:40:55 +0300
Message-Id: <20210726084055.54887-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The commit 71f642833284 ("ACPI: utils: Fix reference counting in
for_each_acpi_dev_match()") moved adev assignment outside of error
path and hence made acpi_dev_put(sensor->adev) a no-op. We still
need to drop reference count on error path, and to achieve that,
replace sensor->adev by locally assigned adev.

Fixes: 71f642833284 ("ACPI: utils: Fix reference counting in for_each_acpi_dev_match()")
Depends-on: fc68f42aa737 ("ACPI: fix NULL pointer dereference")
Reported-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/cio2-bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
index 59a36f922675..30d29b96a339 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
@@ -226,7 +226,7 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 err_free_swnodes:
 	software_node_unregister_nodes(sensor->swnodes);
 err_put_adev:
-	acpi_dev_put(sensor->adev);
+	acpi_dev_put(adev);
 	return ret;
 }
 
-- 
2.30.2

