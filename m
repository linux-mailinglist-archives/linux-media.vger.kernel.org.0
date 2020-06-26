Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91C7C20B145
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 14:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728328AbgFZMTg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 08:19:36 -0400
Received: from mga11.intel.com ([192.55.52.93]:29757 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728278AbgFZMTe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 08:19:34 -0400
IronPort-SDR: hafgQrP4kzrJwaU02V/1Yb4FyCZFduWVHxvGl+mVAKvBgQ6Aredz0+bgyyU/WBqsvOs6DbvJx3
 f3qug9oeFXaA==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="143544877"
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; 
   d="scan'208";a="143544877"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2020 05:19:32 -0700
IronPort-SDR: 4uUnVZCa7B1kT2xvja5xo+9lPWEPB19TW2j3xKQX3Q7a+7KC2wO9oY38Avmsqlpg9TKOUADI2t
 Cisr1/3nW3bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; 
   d="scan'208";a="312306792"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 26 Jun 2020 05:19:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8FCB86B9; Fri, 26 Jun 2020 15:19:28 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 14/15] media: atomisp: Get rid of ugly and leaky ACPI handling in gmin_subdev_add()
Date:   Fri, 26 Jun 2020 15:19:24 +0300
Message-Id: <20200626121925.14365-15-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626121925.14365-1-andriy.shevchenko@linux.intel.com>
References: <20200626121925.14365-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

First of all ACPI HID is a part of the device name which is printed
as a part of the dev_info(dev, ...); line. Second, since the only BID
is left, it's a part of ACPI path, which can be printed via %pfw.

Get rid of ugly and leaky ACPI handling in gmin_subdev_add() by replacing it
with %pfw.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../media/atomisp/pci/atomisp_gmin_platform.c       | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index d0b9d906a563..7f9e93a9a4b1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -463,20 +463,9 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev, struct gm
 {
 	struct i2c_client *client = v4l2_get_subdevdata(subdev);
 	struct device *dev = &client->dev;
-	struct acpi_device *adev;
-	acpi_handle handle;
 	int ret;
 
-	handle = ACPI_HANDLE(dev);
-
-	// FIXME: may need to release resources allocated by acpi_bus_get_device()
-	if (!handle || acpi_bus_get_device(handle, &adev)) {
-		dev_err(dev, "Error could not get ACPI device\n");
-		return NULL;
-	}
-
-	dev_info(&client->dev, "%s: ACPI detected it on bus ID=%s, HID=%s\n",
-		__func__, acpi_device_bid(adev), acpi_device_hid(adev));
+	dev_info(&client->dev, "%s: ACPI path is %pfw\n", __func__, dev_fwnode(dev));
 
 	if (power) {
 		gdev->pwm_i2c_addr = power->addr;
-- 
2.27.0

