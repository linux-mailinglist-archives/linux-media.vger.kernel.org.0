Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E90D33C77D1
	for <lists+linux-media@lfdr.de>; Tue, 13 Jul 2021 22:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235251AbhGMUYF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jul 2021 16:24:05 -0400
Received: from mga02.intel.com ([134.134.136.20]:18055 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235144AbhGMUYE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jul 2021 16:24:04 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="197421626"
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; 
   d="scan'208";a="197421626"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2021 13:21:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; 
   d="scan'208";a="649643241"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 13 Jul 2021 13:21:09 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 215A0551; Tue, 13 Jul 2021 23:21:37 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v1 4/6] media: ipu3-cio2: Introduce to_sensor_asd() helper macro
Date:   Tue, 13 Jul 2021 23:21:29 +0300
Message-Id: <20210713202131.13906-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210713202131.13906-1-andriy.shevchenko@linux.intel.com>
References: <20210713202131.13906-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Provide to_sensor_asd() helper macro and convert users to make
code easier to read.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 2f8ded58a949..8abb34f47b7b 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -1372,6 +1372,8 @@ struct sensor_async_subdev {
 	struct csi2_bus_info csi2;
 };
 
+#define to_sensor_asd(asd)	container_of(asd, struct sensor_async_subdev, asd)
+
 /* The .bound() notifier callback when a match is found */
 static int cio2_notifier_bound(struct v4l2_async_notifier *notifier,
 			       struct v4l2_subdev *sd,
@@ -1379,8 +1381,7 @@ static int cio2_notifier_bound(struct v4l2_async_notifier *notifier,
 {
 	struct cio2_device *cio2 = container_of(notifier,
 					struct cio2_device, notifier);
-	struct sensor_async_subdev *s_asd = container_of(asd,
-					struct sensor_async_subdev, asd);
+	struct sensor_async_subdev *s_asd = to_sensor_asd(asd);
 	struct cio2_queue *q;
 
 	if (cio2->queue[s_asd->csi2.port].sensor)
@@ -1402,8 +1403,7 @@ static void cio2_notifier_unbind(struct v4l2_async_notifier *notifier,
 {
 	struct cio2_device *cio2 = container_of(notifier,
 						struct cio2_device, notifier);
-	struct sensor_async_subdev *s_asd = container_of(asd,
-					struct sensor_async_subdev, asd);
+	struct sensor_async_subdev *s_asd = to_sensor_asd(asd);
 
 	cio2->queue[s_asd->csi2.port].sensor = NULL;
 }
@@ -1421,7 +1421,7 @@ static int cio2_notifier_complete(struct v4l2_async_notifier *notifier)
 	int ret;
 
 	list_for_each_entry(asd, &cio2->notifier.asd_list, asd_list) {
-		s_asd = container_of(asd, struct sensor_async_subdev, asd);
+		s_asd = to_sensor_asd(asd);
 		q = &cio2->queue[s_asd->csi2.port];
 
 		for (pad = 0; pad < q->sensor->entity.num_pads; pad++)
-- 
2.30.2

