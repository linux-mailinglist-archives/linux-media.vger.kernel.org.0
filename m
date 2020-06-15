Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE831F8D5B
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 07:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728268AbgFOFnJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 01:43:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:41724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725648AbgFOFnI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 01:43:08 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D4B4820679;
        Mon, 15 Jun 2020 05:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592199787;
        bh=F0HSnIgr+/nj4f4OoJWMedidccIF5oN1P0Lnc/e+mOQ=;
        h=From:To:Cc:Subject:Date:From;
        b=tiZjLAxUd26Og8M4aW8suDdDIualcWcpbGxpIMrcNhiFGDTyYVOqnC9BdyVKPReko
         /BvBdq9EQk9PZx7W2uwV0L9gHwcsyC4Hx2cp1CcC/NNTX9XMpX1wvF2xZ6LszOWWjO
         JRBAs+j1PnWtLPNjmZ8pF/AW5adSsmTbLk7rLfF0=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jkhtg-009hQu-Mj; Mon, 15 Jun 2020 07:43:04 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org
Subject: [PATCH 1/2] media: atomisp: fix identation at I2C Kconfig menu
Date:   Mon, 15 Jun 2020 07:43:03 +0200
Message-Id: <a6fa7016f510f13ed6e31052b8bcf83e4680d899.1592199777.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are several bad whitespacing usage there. Remove them.

While here, place all Kconfig options for sensors at the
same place.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/i2c/Kconfig     | 74 +++++++++++--------
 .../staging/media/atomisp/i2c/ov5693/Kconfig  | 12 ---
 2 files changed, 42 insertions(+), 44 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/i2c/ov5693/Kconfig

diff --git a/drivers/staging/media/atomisp/i2c/Kconfig b/drivers/staging/media/atomisp/i2c/Kconfig
index 7c7f0fc090b3..a772b833a85f 100644
--- a/drivers/staging/media/atomisp/i2c/Kconfig
+++ b/drivers/staging/media/atomisp/i2c/Kconfig
@@ -3,53 +3,51 @@
 # Kconfig for sensor drivers
 #
 
-source "drivers/staging/media/atomisp/i2c/ov5693/Kconfig"
-
 config VIDEO_ATOMISP_OV2722
-       tristate "OVT ov2722 sensor support"
+	tristate "OVT ov2722 sensor support"
 	depends on ACPI
-       depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_V4L2
 	help
-	 This is a Video4Linux2 sensor-level driver for the OVT
-	 OV2722 raw camera.
+	  This is a Video4Linux2 sensor-level driver for the OVT
+	  OV2722 raw camera.
 
-	 OVT is a 2M raw sensor.
+	  OVT is a 2M raw sensor.
 
-	 It currently only works with the atomisp driver.
+	  It currently only works with the atomisp driver.
 
 config VIDEO_ATOMISP_GC2235
-       tristate "Galaxy gc2235 sensor support"
+	tristate "Galaxy gc2235 sensor support"
 	depends on ACPI
-       depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_V4L2
 	help
-	 This is a Video4Linux2 sensor-level driver for the OVT
-	 GC2235 raw camera.
+	  This is a Video4Linux2 sensor-level driver for the OVT
+	  GC2235 raw camera.
 
-	 GC2235 is a 2M raw sensor.
+	  GC2235 is a 2M raw sensor.
 
-	 It currently only works with the atomisp driver.
+	  It currently only works with the atomisp driver.
 
 config VIDEO_ATOMISP_MSRLIST_HELPER
-       tristate "Helper library to load, parse and apply large register lists."
-       depends on I2C
+	tristate "Helper library to load, parse and apply large register lists."
+	depends on I2C
 	help
-	 This is a helper library to be used from a sensor driver to load, parse
-	 and apply large register lists.
+	  This is a helper library to be used from a sensor driver to load, parse
+	  and apply large register lists.
 
-	 To compile this driver as a module, choose M here: the
-	 module will be called libmsrlisthelper.
+	  To compile this driver as a module, choose M here: the
+	  module will be called libmsrlisthelper.
 
 config VIDEO_ATOMISP_MT9M114
-       tristate "Aptina mt9m114 sensor support"
+	tristate "Aptina mt9m114 sensor support"
 	depends on ACPI
-       depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_V4L2
 	help
-	 This is a Video4Linux2 sensor-level driver for the Micron
-	 mt9m114 1.3 Mpixel camera.
+	  This is a Video4Linux2 sensor-level driver for the Micron
+	  mt9m114 1.3 Mpixel camera.
 
-	 mt9m114 is video camera sensor.
+	  mt9m114 is video camera sensor.
 
-	 It currently only works with the atomisp driver.
+	  It currently only works with the atomisp driver.
 
 config VIDEO_ATOMISP_GC0310
 	tristate "GC0310 sensor support"
@@ -60,16 +58,28 @@ config VIDEO_ATOMISP_GC0310
 	  GC0310 0.3MP sensor.
 
 config VIDEO_ATOMISP_OV2680
-       tristate "Omnivision OV2680 sensor support"
+	tristate "Omnivision OV2680 sensor support"
 	depends on ACPI
-       depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_V4L2
 	help
-	 This is a Video4Linux2 sensor-level driver for the Omnivision
-	 OV2680 raw camera.
+	  This is a Video4Linux2 sensor-level driver for the Omnivision
+	  OV2680 raw camera.
 
-	 ov2680 is a 2M raw sensor.
+	  ov2680 is a 2M raw sensor.
 
-	 It currently only works with the atomisp driver.
+	  It currently only works with the atomisp driver.
+
+config VIDEO_ATOMISP_OV5693
+	tristate "Omnivision ov5693 sensor support"
+	depends on ACPI
+	depends on I2C && VIDEO_V4L2
+	help
+	  This is a Video4Linux2 sensor-level driver for the Micron
+	  ov5693 5 Mpixel camera.
+
+	  ov5693 is video camera sensor.
+
+	  It currently only works with the atomisp driver.
 
 #
 # Kconfig for flash drivers
diff --git a/drivers/staging/media/atomisp/i2c/ov5693/Kconfig b/drivers/staging/media/atomisp/i2c/ov5693/Kconfig
deleted file mode 100644
index c8d09f416c35..000000000000
--- a/drivers/staging/media/atomisp/i2c/ov5693/Kconfig
+++ /dev/null
@@ -1,12 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-config VIDEO_ATOMISP_OV5693
-       tristate "Omnivision ov5693 sensor support"
-	depends on ACPI
-       depends on I2C && VIDEO_V4L2
-	help
-	 This is a Video4Linux2 sensor-level driver for the Micron
-	 ov5693 5 Mpixel camera.
-
-	 ov5693 is video camera sensor.
-
-	 It currently only works with the atomisp driver.
-- 
2.26.2

