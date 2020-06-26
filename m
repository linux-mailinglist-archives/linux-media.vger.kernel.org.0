Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60C3020B147
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 14:19:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbgFZMTt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 08:19:49 -0400
Received: from mga01.intel.com ([192.55.52.88]:27852 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728286AbgFZMTi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 08:19:38 -0400
IronPort-SDR: 0+TqU2V0xgdnng6W2CxbaKFX3YL3a5o3FZTKkk8UrcwoYK7B4Ce4TYCB3zlQMl+kQJLbjrVe//
 RaOxnUEeK0eg==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="163348543"
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; 
   d="scan'208";a="163348543"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2020 05:19:32 -0700
IronPort-SDR: a+MpeqzzMWa8jC9dofplje9un30PEFV7VlOcQqW6/4U1m4dPMf5IE+oojaMAIQinNpArXkJgAG
 YWoU0JQsyBYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; 
   d="scan'208";a="479985589"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 26 Jun 2020 05:19:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 70F896A8; Fri, 26 Jun 2020 15:19:28 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 11/15] media: atomisp: Make pointer to PMIC client global
Date:   Fri, 26 Jun 2020 15:19:21 +0300
Message-Id: <20200626121925.14365-12-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626121925.14365-1-andriy.shevchenko@linux.intel.com>
References: <20200626121925.14365-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When we enumerate second device when PMIC has been successfully detected
to AXP, we got into troubles dereferencing NULL pointer. It seems
we have to detect PMIC only once because pmic_id is a global variable
and code doesn't expect the change of it: Two PMICs on one platform?
It's impossible.

Crash excerpt:
[   34.335237] BUG: kernel NULL pointer dereference, address: 0000000000000002
...
[   35.652036] RIP: 0010:gmin_subdev_add.cold+0x32f/0x33e [atomisp_gmin_platform]

So, as a quick fix make power a global variable. In next patches we move
PMIC detection to be more independent from subdevices.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index f06c0eb6d288..84e9bf1825fa 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -437,9 +437,11 @@ static int gmin_i2c_write(struct device *dev, u16 i2c_addr, u8 reg,
 	return ret;
 }
 
+static struct i2c_client *power;
+
 static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 {
-	struct i2c_client *power = NULL, *client = v4l2_get_subdevdata(subdev);
+	struct i2c_client *client = v4l2_get_subdevdata(subdev);
 	struct acpi_device *adev;
 	acpi_handle handle;
 	struct device *dev;
@@ -570,7 +572,6 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 		gmin_subdevs[i].eldo2_ctrl_shift = gmin_get_var_int(dev, false,
 								    "eldo2_ctrl_shift",
 								    ELDO2_CTRL_SHIFT);
-		gmin_subdevs[i].pwm_i2c_addr = power->addr;
 		break;
 
 	default:
-- 
2.27.0

