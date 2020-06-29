Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3CC320D9E1
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2020 22:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388214AbgF2Tvy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 15:51:54 -0400
Received: from mga07.intel.com ([134.134.136.100]:58002 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387713AbgF2Tkb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 15:40:31 -0400
IronPort-SDR: g8a0he2nHZlnaZhU3njqQbqewEUftLYU4N2MQUeSjTSXLdJ1YyvxZuQ+T365G2vhmUf/Yv2RwI
 vt+M19BHPEYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="211080107"
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; 
   d="scan'208";a="211080107"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2020 09:22:04 -0700
IronPort-SDR: /q+RtWXWvKmeLRpINcXoUrFDfGKuP+aWYfd3r32KmAC2Yfhfzh0eVzyy4RA616VQtk9mp9FT4m
 epK84cUWBG0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; 
   d="scan'208";a="294928961"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 29 Jun 2020 09:22:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 50E2917D; Mon, 29 Jun 2020 13:57:40 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 2/5] media: atomisp: Use temporary variable for device in gmin_subdev_add()
Date:   Mon, 29 Jun 2020 13:57:36 +0300
Message-Id: <20200629105739.3098-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629105739.3098-1-andriy.shevchenko@linux.intel.com>
References: <20200629105739.3098-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use temporary variable for device in gmin_subdev_add().

While here, drop unused temporary variable for device in other places.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../media/atomisp/pci/atomisp_gmin_platform.c   | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 7f846a61858d..aa4424a60e92 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -514,19 +514,14 @@ static int gmin_detect_pmic(struct v4l2_subdev *subdev)
 static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(subdev);
+	struct device *dev = &client->dev;
 	struct acpi_device *adev;
 	struct gmin_subdev *gs;
 	acpi_handle handle;
-	struct device *dev;
 	int i, ret, clock_num = -1;
 
-	if (!client)
-		return NULL;
-
-	dev = &client->dev;
-
 	handle = ACPI_HANDLE(dev);
-	adev = ACPI_COMPANION(&client->dev);
+	adev = ACPI_COMPANION(dev);
 
 	dev_info(&client->dev, "%s: ACPI detected it on bus ID=%s, HID=%s\n",
 		__func__, acpi_device_bid(adev), acpi_device_hid(adev));
@@ -842,12 +837,8 @@ static int gmin_v1p8_ctrl(struct v4l2_subdev *subdev, int on)
 {
 	struct gmin_subdev *gs = find_gmin_subdev(subdev);
 	int ret;
-	struct device *dev;
-	struct i2c_client *client = v4l2_get_subdevdata(subdev);
 	int value;
 
-	dev = &client->dev;
-
 	if (gs->v1p8_gpio >= 0) {
 		pr_info("atomisp_gmin_platform: 1.8v power on GPIO %d\n",
 			gs->v1p8_gpio);
@@ -900,12 +891,8 @@ static int gmin_v2p8_ctrl(struct v4l2_subdev *subdev, int on)
 {
 	struct gmin_subdev *gs = find_gmin_subdev(subdev);
 	int ret;
-	struct device *dev;
-	struct i2c_client *client = v4l2_get_subdevdata(subdev);
 	int value;
 
-	dev = &client->dev;
-
 	if (gs->v2p8_gpio >= 0) {
 		pr_info("atomisp_gmin_platform: 2.8v power on GPIO %d\n",
 			gs->v2p8_gpio);
-- 
2.27.0

