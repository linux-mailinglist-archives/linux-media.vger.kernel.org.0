Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8979B20D348
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2020 21:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729847AbgF2S5l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 14:57:41 -0400
Received: from mga05.intel.com ([192.55.52.43]:57279 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729853AbgF2S5e (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 14:57:34 -0400
IronPort-SDR: WPLWXoBIZfB6XYmAJb11ragEGMD3DJ2wXSAr1IMMhMDrHBT7pkd+aJ0A8lKEIJc8pExCde3UjG
 9FpOMGX1jXuw==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="230832149"
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; 
   d="scan'208";a="230832149"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2020 09:22:05 -0700
IronPort-SDR: 0fCuV/AXPQcNQxdH4vNh0YF3rehP8pyLbxkmvvehPiK/T7pVjhQQShdC3E4pqOKMQcLZDdP/aP
 cbxXu0jswyvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; 
   d="scan'208";a="424868761"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 29 Jun 2020 09:22:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 65ABD2CB; Mon, 29 Jun 2020 13:57:40 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 4/5] media: atomisp: Get rid of ACPI specifics in gmin_subdev_add()
Date:   Mon, 29 Jun 2020 13:57:38 +0300
Message-Id: <20200629105739.3098-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629105739.3098-1-andriy.shevchenko@linux.intel.com>
References: <20200629105739.3098-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

First of all ACPI HID is a part of the device name which is printed
as a part of the dev_info(dev, ...); line. Second, since the only BID
is left, it's a part of ACPI path, which can be printed via %pfw.

Besides that, drop ACPI handle from atomisp_get_acpi_power() parameters.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../media/atomisp/pci/atomisp_gmin_platform.c      | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 8e66fe6f407e..63a812ac2b43 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -423,12 +423,13 @@ static int gmin_i2c_write(struct device *dev, u16 i2c_addr, u8 reg,
 	return ret;
 }
 
-static int atomisp_get_acpi_power(struct device *dev, acpi_handle handle)
+static int atomisp_get_acpi_power(struct device *dev)
 {
 	char name[5];
 	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
 	struct acpi_buffer b_name = { sizeof(name), name };
 	union acpi_object *package, *element;
+	acpi_handle handle = ACPI_HANDLE(dev);
 	acpi_handle rhandle;
 	acpi_status status;
 	int clock_num = -1;
@@ -515,15 +516,10 @@ static int gmin_subdev_add(struct gmin_subdev *gs)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(gs->subdev);
 	struct device *dev = &client->dev;
-	struct acpi_device *adev;
-	acpi_handle handle;
+	struct acpi_device *adev = ACPI_COMPANION(dev);
 	int ret, clock_num = -1;
 
-	handle = ACPI_HANDLE(dev);
-	adev = ACPI_COMPANION(dev);
-
-	dev_info(&client->dev, "%s: ACPI detected it on bus ID=%s, HID=%s\n",
-		__func__, acpi_device_bid(adev), acpi_device_hid(adev));
+	dev_info(dev, "%s: ACPI path is %pfw\n", __func__, dev_fwnode(dev));
 
 	/*
 	 * FIXME:
@@ -625,7 +621,7 @@ static int gmin_subdev_add(struct gmin_subdev *gs)
 
 	/* Try first to use ACPI to get the clock resource */
 	if (acpi_device_power_manageable(adev))
-		clock_num = atomisp_get_acpi_power(dev, handle);
+		clock_num = atomisp_get_acpi_power(dev);
 
 	/* Fall-back use EFI and/or DMI match */
 	if (clock_num < 0)
-- 
2.27.0

