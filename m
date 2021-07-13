Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2A33C77D5
	for <lists+linux-media@lfdr.de>; Tue, 13 Jul 2021 22:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235382AbhGMUYH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jul 2021 16:24:07 -0400
Received: from mga18.intel.com ([134.134.136.126]:59988 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235322AbhGMUYG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jul 2021 16:24:06 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="197509893"
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; 
   d="scan'208";a="197509893"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2021 13:21:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; 
   d="scan'208";a="465206511"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 13 Jul 2021 13:21:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 331235E4; Tue, 13 Jul 2021 23:21:37 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v1 6/6] media: ipu3-cio2: Introduce to_cio2_device() helper macro
Date:   Tue, 13 Jul 2021 23:21:31 +0300
Message-Id: <20210713202131.13906-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210713202131.13906-1-andriy.shevchenko@linux.intel.com>
References: <20210713202131.13906-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Provide to_cio2_device() helper macro and convert users to make
code easier to read.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 9 +++------
 drivers/media/pci/intel/ipu3/ipu3-cio2.h      | 2 ++
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 3acee7a623c0..88d6dd7d864e 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -1376,8 +1376,7 @@ static int cio2_notifier_bound(struct v4l2_async_notifier *notifier,
 			       struct v4l2_subdev *sd,
 			       struct v4l2_async_subdev *asd)
 {
-	struct cio2_device *cio2 = container_of(notifier,
-					struct cio2_device, notifier);
+	struct cio2_device *cio2 = to_cio2_device(notifier);
 	struct sensor_async_subdev *s_asd = to_sensor_asd(asd);
 	struct cio2_queue *q;
 
@@ -1398,8 +1397,7 @@ static void cio2_notifier_unbind(struct v4l2_async_notifier *notifier,
 				 struct v4l2_subdev *sd,
 				 struct v4l2_async_subdev *asd)
 {
-	struct cio2_device *cio2 = container_of(notifier,
-						struct cio2_device, notifier);
+	struct cio2_device *cio2 = to_cio2_device(notifier);
 	struct sensor_async_subdev *s_asd = to_sensor_asd(asd);
 
 	cio2->queue[s_asd->csi2.port].sensor = NULL;
@@ -1408,8 +1406,7 @@ static void cio2_notifier_unbind(struct v4l2_async_notifier *notifier,
 /* .complete() is called after all subdevices have been located */
 static int cio2_notifier_complete(struct v4l2_async_notifier *notifier)
 {
-	struct cio2_device *cio2 = container_of(notifier, struct cio2_device,
-						notifier);
+	struct cio2_device *cio2 = to_cio2_device(notifier);
 	struct device *dev = &cio2->pci_dev->dev;
 	struct sensor_async_subdev *s_asd;
 	struct v4l2_async_subdev *asd;
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.h b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
index f82f9b2590b9..3a1f394e05aa 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.h
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
@@ -401,6 +401,8 @@ struct cio2_device {
 	dma_addr_t dummy_lop_bus_addr;
 };
 
+#define to_cio2_device(n)	container_of(n, struct cio2_device, notifier)
+
 /**************** Virtual channel ****************/
 /*
  * This should come from sensor driver. No
-- 
2.30.2

