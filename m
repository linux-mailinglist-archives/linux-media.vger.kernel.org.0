Return-Path: <linux-media+bounces-36683-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE17AF79DA
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 17:06:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D6963BFC54
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 15:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AEA72E7BBF;
	Thu,  3 Jul 2025 15:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VLIiBmn0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A4B2EE299
	for <linux-media@vger.kernel.org>; Thu,  3 Jul 2025 15:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555007; cv=none; b=O07wQzY6xRfgVnlSd6lXibptBoev5DeKXcVMY1MTGvefOFwctPu6Wcm8Bt1NQswF+fDHJu1SEmr0zN27o/UuxHKRzlRebHw2SfvNhouBqZK0ge1C0ofvXlnhJAZ5DCFwbSALTA2idzvLvt0IOPR/lQG3nITlhvzqGvQtynl9yv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555007; c=relaxed/simple;
	bh=QW0BACX/d+IzlFbytQXmRqmZFSTB5MZXFlpT8mlsP0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZqAz5EUXp2ESMSXn60srXMljR51XtjFuKxGvGIeD1oYQUL5uwPfOT1/IjSwyAS9aNXup4iQ6tF3GEDKCGnN4R5aR+xDuE9D08LafavA8BvI7vsKNIoeF/8yPXlnY7obBWeLrO2aFtcrS+1BXEHRUhc07ycU5Q33xxDv4I+glqQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VLIiBmn0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86BCBC4CEED;
	Thu,  3 Jul 2025 15:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751555006;
	bh=QW0BACX/d+IzlFbytQXmRqmZFSTB5MZXFlpT8mlsP0s=;
	h=From:To:Cc:Subject:Date:From;
	b=VLIiBmn0NiOfvE0T/UBiIUYYjn3442Sqp2BKSgCCaPX9DJDNO6eUbo1fydh5dPejw
	 8gNVTd+9viE8omUTBsmHjfcTdAM0PFWUKHQ25DboVZhCcKnm246wnoCJjvsG9TekfK
	 8pgJXauEe9YqQrK8wmnnSll2718qkgXnYf2+6+AlyzmxcM8eiRsee9OVLNCVq9srLL
	 s8IipX8zu3QRhixBWZ8jTG2diP83oioKBwPhwZlQyfBSeukejg2G6Z2qUG224AOD8Z
	 shMoRHy/rSL4sjRe1HjrfRkhSKJR2edOUdjxHMkH8K71Svtx7BdWCOal9TJbWaQcxQ
	 QPOcoNP4yAEgQ==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH resend] media: i2c: Automatically select common options for lens drivers
Date: Thu,  3 Jul 2025 17:03:15 +0200
Message-ID: <20250703150315.25187-1-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hdegoede@redhat.com>

In commit 7d3c7d2a2914 ("media: i2c: Add a camera sensor top level menu")
a top level menu was added for sensor drivers so that all sensor drivers
would depend on I2C and so that MEDIA_CONTROLLER, FWNODE and
VIDEO_V4L2_SUBDEV_API would be automatically selected for all sensor
drivers.

All lens drivers must depend on I2C and VIDEO_DEV and must select
MEDIA_CONTROLLER, V4L2_FWNODE and VIDEO_V4L2_SUBDEV_API and most already
do, but e.g. VIDEO_V4L2_SUBDEV_API is not consistenly selected.

Change the "Lens drivers" menu into a menuconfig option with
the necessary depends and selects. This ensures that these options are
depended on / selected consistently and simplifies the Kconfig snippets
for the various lens voice coil drivers.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202411061152.VKd9JYpa-lkp@intel.com/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/Kconfig | 38 ++++++++++++--------------------------
 1 file changed, 12 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 616b3cf25e3a..48a4b3b1ded3 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -778,24 +778,25 @@ config VIDEO_THP7312
 
 endmenu
 
-menu "Lens drivers"
-	visible if MEDIA_CAMERA_SUPPORT
+menuconfig VIDEO_CAMERA_LENS
+	bool "Lens drivers"
+	depends on MEDIA_CAMERA_SUPPORT && I2C
+	select MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	default y
+
+if VIDEO_CAMERA_LENS
 
 config VIDEO_AD5820
 	tristate "AD5820 lens voice coil support"
-	depends on GPIOLIB && I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select V4L2_ASYNC
+	depends on GPIOLIB
 	help
 	  This is a driver for the AD5820 camera lens voice coil.
 	  It is used for example in Nokia N900 (RX-51).
 
 config VIDEO_AK7375
 	tristate "AK7375 lens voice coil support"
-	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_ASYNC
 	help
 	  This is a driver for the AK7375 camera lens voice coil.
 	  AK7375 is a 12 bit DAC with 120mA output current sink
@@ -804,10 +805,7 @@ config VIDEO_AK7375
 
 config VIDEO_DW9714
 	tristate "DW9714 lens voice coil support"
-	depends on GPIOLIB && I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_ASYNC
+	depends on GPIOLIB
 	help
 	  This is a driver for the DW9714 camera lens voice coil.
 	  DW9714 is a 10 bit DAC with 120mA output current sink
@@ -816,10 +814,6 @@ config VIDEO_DW9714
 
 config VIDEO_DW9719
 	tristate "DW9719 lens voice coil support"
-	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_ASYNC
 	select V4L2_CCI_I2C
 	help
 	  This is a driver for the DW9719 camera lens voice coil.
@@ -828,10 +822,6 @@ config VIDEO_DW9719
 
 config VIDEO_DW9768
 	tristate "DW9768 lens voice coil support"
-	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
 	help
 	  This is a driver for the DW9768 camera lens voice coil.
 	  DW9768 is a 10 bit DAC with 100mA output current sink
@@ -840,17 +830,13 @@ config VIDEO_DW9768
 
 config VIDEO_DW9807_VCM
 	tristate "DW9807 lens voice coil support"
-	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_ASYNC
 	help
 	  This is a driver for the DW9807 camera lens voice coil.
 	  DW9807 is a 10 bit DAC with 100mA output current sink
 	  capability. This is designed for linear control of
 	  voice coil motors, controlled via I2C serial interface.
 
-endmenu
+endif
 
 menu "Flash devices"
 	visible if MEDIA_CAMERA_SUPPORT
-- 
2.49.0


