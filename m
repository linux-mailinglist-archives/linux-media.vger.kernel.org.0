Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 574ED205A20
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 20:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733203AbgFWSFl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 14:05:41 -0400
Received: from mga11.intel.com ([192.55.52.93]:1925 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733184AbgFWSFk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 14:05:40 -0400
IronPort-SDR: gLfFryoh7fIDaoc+mQniNEO4xAJtH51cqKDvD3pCvYgn3QF5F5K+nvjHqXvHj32FgmPJaXHjNc
 0+R4gqdFv2tA==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="142404330"
X-IronPort-AV: E=Sophos;i="5.75,272,1589266800"; 
   d="scan'208";a="142404330"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2020 11:05:36 -0700
IronPort-SDR: 4rguJC/mSzZ8WdgZQSyAov5pt1+5iwuA6fP5DjEDFmI3ukYIY2RIseWYnk3tnI4MaPgpblZq/h
 JnrT4v1ywakQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,272,1589266800"; 
   d="scan'208";a="452323920"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 23 Jun 2020 11:05:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 20530234; Tue, 23 Jun 2020 21:05:34 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 4/9] media: atomisp: don't pass struct device_driver as parameter
Date:   Tue, 23 Jun 2020 21:05:28 +0300
Message-Id: <20200623180533.65970-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623180533.65970-1-andriy.shevchenko@linux.intel.com>
References: <20200623180533.65970-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is no need to pass a pointer to struct device_driver
when we have an access to struct device already.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/staging/media/atomisp/pci/atomisp_drvfs.c | 3 ++-
 drivers/staging/media/atomisp/pci/atomisp_drvfs.h | 2 +-
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c  | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_drvfs.c b/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
index fe0e2bfde27f..3711df111fbf 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
@@ -185,8 +185,9 @@ static void iunit_drvfs_remove_files(struct device_driver *drv)
 		driver_remove_file(drv, &iunit_drvfs_attrs[i]);
 }
 
-int atomisp_drvfs_init(struct device_driver *drv, struct atomisp_device *isp)
+int atomisp_drvfs_init(struct atomisp_device *isp)
 {
+	struct device_driver *drv = isp->dev->driver;
 	int ret;
 
 	iunit_debug.isp = isp;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_drvfs.h b/drivers/staging/media/atomisp/pci/atomisp_drvfs.h
index 4911037231fb..8f4cc722b881 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_drvfs.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_drvfs.h
@@ -19,7 +19,7 @@
 #ifndef	__ATOMISP_DRVFS_H__
 #define	__ATOMISP_DRVFS_H__
 
-int atomisp_drvfs_init(struct device_driver *drv, struct atomisp_device *isp);
+int atomisp_drvfs_init(struct atomisp_device *isp);
 void atomisp_drvfs_exit(void);
 
 #endif /* __ATOMISP_DRVFS_H__ */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index fa07cbaf0422..c6996b1f228b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1838,7 +1838,7 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 	isp->firmware = NULL;
 	isp->css_env.isp_css_fw.data = NULL;
 
-	atomisp_drvfs_init(&dev->driver->driver, isp);
+	atomisp_drvfs_init(isp);
 
 	return 0;
 
-- 
2.27.0

