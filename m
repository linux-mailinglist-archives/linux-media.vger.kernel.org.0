Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2598E1942EC
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 16:21:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbgCZPVh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 11:21:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:40530 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727502AbgCZPVg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 11:21:36 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 808C12077D;
        Thu, 26 Mar 2020 15:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585236095;
        bh=Yhqe+F7leXl5P23tKcOpeWtNplg5vKpXTN5wlfpN/DQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tDxnzQVhP0VSMaslEopPw95W1++yinDWnkUN/HGGmTJv22BAneM/idKLYnnqrrNTP
         sfgtFyq3MnR1W5r0NCs1pnTUhhwdy/5J3NNzj/1L9wlClS6hZ6n21BgKeAShFJ4K+d
         xLvZHT6d4OaLEWKnnXPpgzmF7Ezz+iJ0hCDo5X7M=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jHUK5-003dj3-Qi; Thu, 26 Mar 2020 16:21:33 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 6/7] media: Kconfig: fix selection for test drivers
Date:   Thu, 26 Mar 2020 16:21:31 +0100
Message-Id: <c267c23e0884172beac4fb4e68c35fc26ff2e615.1585235736.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585235736.git.mchehab+huawei@kernel.org>
References: <cover.1585235736.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are some long-time mistakes related to build test
drivers, with regards to depends on/select. Also, as we
now want to build any test driver without needing to
enable anything else, change the logic in order to properly
filter them.

Please notice that the PCI skeleton is somewhat an
exception, as it requires to select *both* SAMPLES and
MEDIA_TEST_SUPPORT. I almost changed it to be either one,
but decided to keep it as-is, as this is something that
we don't really need to be included on any distribution.

The only reason for someone to build it is for COMPILE_TEST
purposes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/Kconfig               |  2 +-
 drivers/media/dvb-frontends/Kconfig |  9 +++++++--
 drivers/media/pci/Kconfig           | 10 +++++-----
 drivers/media/test_drivers/Kconfig  |  2 +-
 4 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index bb8148f2d4c0..35be61bf36aa 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -157,7 +157,7 @@ comment "Video4Linux core enabled to support hybrid TV devices"
 config VIDEO_DEV
 	tristate
 	prompt "Video4Linux core" if !(MEDIA_HYBRID_USB || MEDIA_HYBRID_PCI)
-	default MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT || MEDIA_PLATFORM_SUPPORT || MEDIA_HYBRID_USB || MEDIA_HYBRID_PCI
+	default MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT || MEDIA_PLATFORM_SUPPORT || MEDIA_TEST_SUPPORT || MEDIA_HYBRID_USB || MEDIA_HYBRID_PCI
 	help
 	  Enables the V4L2 API, used by cameras, analog TV, video grabbers,
 	  radio devices and by some input devices.
diff --git a/drivers/media/dvb-frontends/Kconfig b/drivers/media/dvb-frontends/Kconfig
index 932fd88fdc12..1f45808d94da 100644
--- a/drivers/media/dvb-frontends/Kconfig
+++ b/drivers/media/dvb-frontends/Kconfig
@@ -1,3 +1,5 @@
+if MEDIA_DIGITAL_TV_SUPPORT
+
 comment "DVB Frontend drivers hidden by 'Autoselect ancillary drivers'"
 	depends on MEDIA_HIDE_ANCILLARY_SUBDRV
 
@@ -943,13 +945,16 @@ config DVB_SP2
 	help
 	  CIMaX SP2/SP2HF Common Interface module.
 
+endmenu # Customise DVB Frontends
+
+endif # MEDIA_DIGITAL_TV_SUPPORT
+
 comment "Tools to develop new frontends"
 	depends on MEDIA_TEST_SUPPORT
 
 config DVB_DUMMY_FE
 	tristate "Dummy frontend driver"
-	depends on DVB_CORE
 	depends on MEDIA_TEST_SUPPORT
+	select DVB_CORE
 	help
 	  Dummy skeleton frontend driver.
-endmenu
diff --git a/drivers/media/pci/Kconfig b/drivers/media/pci/Kconfig
index 348da044ec78..44f1efd21272 100644
--- a/drivers/media/pci/Kconfig
+++ b/drivers/media/pci/Kconfig
@@ -6,7 +6,7 @@ config MEDIA_HYBRID_PCI
 	depends on VIDEO_CX18 || VIDEO_CX23885 || VIDEO_CX88 || VIDEO_BT848 || VIDEO_SAA7134 || VIDEO_SAA7164
 	default y
 
-if PCI && MEDIA_SUPPORT
+if PCI
 
 menuconfig MEDIA_PCI_SUPPORT
 	bool "Media PCI Adapters"
@@ -65,11 +65,11 @@ source "drivers/media/pci/intel/ipu3/Kconfig"
 
 config VIDEO_PCI_SKELETON
 	tristate "Skeleton PCI V4L2 driver"
-	depends on MEDIA_TEST_SUPPORT
-	depends on PCI
 	depends on SAMPLES
-	depends on VIDEO_V4L2 && VIDEOBUF2_CORE
-	depends on VIDEOBUF2_MEMOPS && VIDEOBUF2_DMA_CONTIG
+	depends on MEDIA_TEST_SUPPORT
+	depends on PCI && VIDEO_V4L2
+	select VIDEOBUF2_MEMOPS
+	select VIDEOBUF2_DMA_CONTIG
 	help
 	  Enable build of the skeleton PCI driver, used as a reference
 	  when developing new drivers.
diff --git a/drivers/media/test_drivers/Kconfig b/drivers/media/test_drivers/Kconfig
index 258a4d36c0d3..9f4a9cfbacc9 100644
--- a/drivers/media/test_drivers/Kconfig
+++ b/drivers/media/test_drivers/Kconfig
@@ -4,7 +4,7 @@ if MEDIA_TEST_SUPPORT
 
 menuconfig V4L_TEST_DRIVERS
 	bool "V4L test drivers"
-	depends on MEDIA_CAMERA_SUPPORT
+	depends on VIDEO_DEV
 
 if V4L_TEST_DRIVERS
 
-- 
2.25.1

