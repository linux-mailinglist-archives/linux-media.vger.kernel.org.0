Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8F3919249D
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 10:50:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727539AbgCYJtn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 05:49:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:51356 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727501AbgCYJtl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 05:49:41 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6187B2166E;
        Wed, 25 Mar 2020 09:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585129780;
        bh=pliirKaD0kBPzAdfusuXwTDp164pti/+2asNdlWPtls=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dNP/HqRM3z38saDGpetzsTZpBV0zNcQxa5GSEoIrY4rQO+1kO9fWTKaO4rLqdzfbo
         fPq2p+27l7DBv3I6OOgKY9O/ZowZZzJ9mahNgCcAJ6kF4JNugWiUDswLFvPM268d96
         bwtqd5o2CkBc449Hwhz+cVCAk00j1ux/W2fCSNAk=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jH2fK-003HUm-ME; Wed, 25 Mar 2020 10:49:38 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Walls <awalls@md.metrocast.net>,
        Mike Isely <isely@pobox.com>
Subject: [PATCH v3 22/22] media: Kconfig: better support hybrid TV devices
Date:   Wed, 25 Mar 2020 10:49:36 +0100
Message-Id: <dc2d32af44bc03620bde14fc3c3ea5f9bde5530d.1585129041.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585129041.git.mchehab+huawei@kernel.org>
References: <cover.1585129041.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Right now, if one has an hybrid TV card, it has to select
both analog and digital TV support, as otherwise the needed
core support won't be selected.

Change the logic to auto-select the core support for those
drivers, as this is a way more intuitive.

It should be noticed that, as now both DVB_CORE and VIDEO_DEV
defaults depends on selecting a hybrid cards, we had to remove
the explicit dependencies there, in order to avoid circular
dependencies. In order to get it right, we used a little trick,
to ensure that the core will be built as "y" if any driver
was built with "y".

Note: while here, moved two pure V4L2 PCI drivers out of the
"hybrid" part of config and consider pvrusb2 as an hybrid
device.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/Kconfig             | 18 ++++--------------
 drivers/media/pci/Kconfig         | 11 +++++++++--
 drivers/media/pci/bt8xx/Kconfig   |  5 ++---
 drivers/media/pci/cx18/Kconfig    |  2 +-
 drivers/media/pci/cx23885/Kconfig |  4 ++--
 drivers/media/pci/cx88/Kconfig    |  4 ++--
 drivers/media/pci/saa7134/Kconfig |  4 ++--
 drivers/media/pci/saa7164/Kconfig |  2 +-
 drivers/media/usb/Kconfig         |  8 +++++++-
 drivers/media/usb/au0828/Kconfig  |  6 ++----
 drivers/media/usb/cx231xx/Kconfig |  4 ++--
 drivers/media/usb/pvrusb2/Kconfig |  4 ++--
 drivers/media/usb/tm6000/Kconfig  |  4 ++--
 13 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index 2a69b8024a0f..98695438c4af 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -76,12 +76,7 @@ config MEDIA_ANALOG_TV_SUPPORT
 	help
 	  Enable analog TV support.
 
-	  Say Y when you have a TV board with analog support or with a
-	  hybrid analog/digital TV chipset.
-
-	  Note: There are several DVB cards that are based on chips that
-		support both analog and digital TV. Disabling this option
-		will disable support for them.
+	  Say Y when you have a board with analog TV support.
 
 config MEDIA_DIGITAL_TV_SUPPORT
 	bool "Digital TV"
@@ -89,8 +84,7 @@ config MEDIA_DIGITAL_TV_SUPPORT
 	help
 	  Enable digital TV support.
 
-	  Say Y when you have a board with digital support or a board with
-	  hybrid digital TV and analog TV.
+	  Say Y when you have a board with digital TV support.
 
 config MEDIA_RADIO_SUPPORT
 	bool "AM/FM radio receivers/transmitters"
@@ -103,10 +97,6 @@ config MEDIA_RADIO_SUPPORT
 
 	  Say Y when you have a board with radio support.
 
-	  Note: There are several TV cards that are based on chips that
-		support radio reception. Disabling this option will
-		disable support for them.
-
 config MEDIA_SDR_SUPPORT
 	bool "Software defined radio"
 	default y if !MEDIA_SUPPORT_FILTER
@@ -156,7 +146,7 @@ menu "Media core support"
 
 config VIDEO_DEV
 	tristate "Video4Linux core"
-	default MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT || MEDIA_PLATFORM_SUPPORT
+	default MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT || MEDIA_PLATFORM_SUPPORT || MEDIA_HYBRID_USB || MEDIA_HYBRID_PCI
 	help
 	  Enables the V4L2 API, used by cameras, analog TV, video grabbers,
 	  radio devices and by some input devices.
@@ -172,7 +162,7 @@ config MEDIA_CONTROLLER
 
 config DVB_CORE
 	tristate "Digital TV core"
-	default MEDIA_DIGITAL_TV_SUPPORT
+	default MEDIA_DIGITAL_TV_SUPPORT || MEDIA_HYBRID_USB || MEDIA_HYBRID_PCI
 	depends on (I2C || I2C=n)
 	select CRC32
 	help
diff --git a/drivers/media/pci/Kconfig b/drivers/media/pci/Kconfig
index 9336f8446cf0..21ee43fd7d8e 100644
--- a/drivers/media/pci/Kconfig
+++ b/drivers/media/pci/Kconfig
@@ -1,4 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+# Should match the hybrid card list below
+config MEDIA_HYBRID_PCI
+	bool
+	depends on VIDEO_CX18 || VIDEO_CX23885 || VIDEO_CX88 || VIDEO_BT848 || VIDEO_SAA7134 || VIDEO_SAA7164
+	default y
+
 if PCI && MEDIA_SUPPORT
 
 menuconfig MEDIA_PCI_SUPPORT
@@ -24,18 +31,18 @@ if MEDIA_ANALOG_TV_SUPPORT
 source "drivers/media/pci/ivtv/Kconfig"
 source "drivers/media/pci/saa7146/Kconfig"
 source "drivers/media/pci/dt3155/Kconfig"
+source "drivers/media/pci/cx25821/Kconfig"
+source "drivers/media/pci/cobalt/Kconfig"
 endif
 
 if MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT
 	comment "Media capture/analog/hybrid TV support"
 source "drivers/media/pci/cx18/Kconfig"
 source "drivers/media/pci/cx23885/Kconfig"
-source "drivers/media/pci/cx25821/Kconfig"
 source "drivers/media/pci/cx88/Kconfig"
 source "drivers/media/pci/bt8xx/Kconfig"
 source "drivers/media/pci/saa7134/Kconfig"
 source "drivers/media/pci/saa7164/Kconfig"
-source "drivers/media/pci/cobalt/Kconfig"
 
 endif
 
diff --git a/drivers/media/pci/bt8xx/Kconfig b/drivers/media/pci/bt8xx/Kconfig
index 75d172a6f54c..c79c6175c262 100644
--- a/drivers/media/pci/bt8xx/Kconfig
+++ b/drivers/media/pci/bt8xx/Kconfig
@@ -1,11 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_BT848
 	tristate "BT848 Video For Linux"
-	depends on VIDEO_DEV && PCI && I2C && VIDEO_V4L2
+	depends on PCI && I2C
 	select I2C_ALGOBIT
 	select VIDEOBUF_DMA_SG
 	depends on RC_CORE
-	depends on MEDIA_RADIO_SUPPORT
 	select VIDEO_TUNER
 	select VIDEO_TVEEPROM
 	select VIDEO_MSP3400 if MEDIA_SUBDRV_AUTOSELECT
@@ -24,7 +23,7 @@ config VIDEO_BT848
 
 config DVB_BT8XX
 	tristate "DVB/ATSC Support for bt878 based TV cards"
-	depends on DVB_CORE && PCI && I2C && VIDEO_BT848
+	depends on PCI && I2C && VIDEO_BT848
 	select DVB_MT352 if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_SP887X if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_NXT6000 if MEDIA_SUBDRV_AUTOSELECT
diff --git a/drivers/media/pci/cx18/Kconfig b/drivers/media/pci/cx18/Kconfig
index 7074a1071302..110e072bd8ba 100644
--- a/drivers/media/pci/cx18/Kconfig
+++ b/drivers/media/pci/cx18/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_CX18
 	tristate "Conexant cx23418 MPEG encoder support"
-	depends on VIDEO_V4L2 && DVB_CORE && PCI && I2C
+	depends on PCI && I2C
 	select I2C_ALGOBIT
 	select VIDEOBUF_VMALLOC
 	depends on RC_CORE
diff --git a/drivers/media/pci/cx23885/Kconfig b/drivers/media/pci/cx23885/Kconfig
index 926da881929d..e8f4edf270c8 100644
--- a/drivers/media/pci/cx23885/Kconfig
+++ b/drivers/media/pci/cx23885/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_CX23885
 	tristate "Conexant cx23885 (2388x successor) support"
-	depends on DVB_CORE && VIDEO_DEV && PCI && I2C && INPUT && SND
+	depends on PCI && I2C && INPUT && SND
 	select SND_PCM
 	select I2C_ALGOBIT
 	select VIDEO_TUNER
@@ -53,7 +53,7 @@ config VIDEO_CX23885
 
 config MEDIA_ALTERA_CI
 	tristate "Altera FPGA based CI module"
-	depends on VIDEO_CX23885 && DVB_CORE
+	depends on VIDEO_CX23885
 	select ALTERA_STAPL
 	help
 	  An Altera FPGA CI module for NetUP Dual DVB-T/C RF CI card.
diff --git a/drivers/media/pci/cx88/Kconfig b/drivers/media/pci/cx88/Kconfig
index 24e1e7c41744..ab994b3049f4 100644
--- a/drivers/media/pci/cx88/Kconfig
+++ b/drivers/media/pci/cx88/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_CX88
 	tristate "Conexant 2388x (bt878 successor) support"
-	depends on VIDEO_DEV && PCI && I2C && RC_CORE
+	depends on PCI && I2C && RC_CORE
 	select I2C_ALGOBIT
 	select VIDEOBUF2_DMA_SG
 	select VIDEO_TUNER
@@ -44,7 +44,7 @@ config VIDEO_CX88_BLACKBIRD
 
 config VIDEO_CX88_DVB
 	tristate "DVB/ATSC Support for cx2388x based TV cards"
-	depends on VIDEO_CX88 && DVB_CORE
+	depends on VIDEO_CX88
 	select VIDEOBUF2_DVB
 	select DVB_PLL if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_MT352 if MEDIA_SUBDRV_AUTOSELECT
diff --git a/drivers/media/pci/saa7134/Kconfig b/drivers/media/pci/saa7134/Kconfig
index 30c1759682a9..a2af02f6d593 100644
--- a/drivers/media/pci/saa7134/Kconfig
+++ b/drivers/media/pci/saa7134/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_SAA7134
 	tristate "Philips SAA7134 support"
-	depends on VIDEO_DEV && PCI && I2C
+	depends on PCI && I2C
 	select VIDEOBUF2_DMA_SG
 	select VIDEO_TUNER
 	select VIDEO_TVEEPROM
@@ -37,7 +37,7 @@ config VIDEO_SAA7134_RC
 
 config VIDEO_SAA7134_DVB
 	tristate "DVB/ATSC Support for saa7134 based TV cards"
-	depends on VIDEO_SAA7134 && DVB_CORE
+	depends on VIDEO_SAA7134
 	select VIDEOBUF2_DVB
 	select DVB_PLL if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_MT352 if MEDIA_SUBDRV_AUTOSELECT
diff --git a/drivers/media/pci/saa7164/Kconfig b/drivers/media/pci/saa7164/Kconfig
index 6655c3e504cd..8df933a722a7 100644
--- a/drivers/media/pci/saa7164/Kconfig
+++ b/drivers/media/pci/saa7164/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_SAA7164
 	tristate "NXP SAA7164 support"
-	depends on DVB_CORE && VIDEO_DEV && PCI && I2C
+	depends on PCI && I2C
 	select I2C_ALGOBIT
 	select FW_LOADER
 	select VIDEO_TUNER
diff --git a/drivers/media/usb/Kconfig b/drivers/media/usb/Kconfig
index bf08393e38d1..036aa4385fdc 100644
--- a/drivers/media/usb/Kconfig
+++ b/drivers/media/usb/Kconfig
@@ -5,6 +5,12 @@ config TTPCI_EEPROM
 	tristate
 	depends on I2C
 
+# Should match the hybrid card list below
+config MEDIA_HYBRID_USB
+	bool
+	depends on VIDEO_AU0828 || VIDEO_CX231XX || VIDEO_TM6000 || VIDEO_PVRUSB2
+	default y
+
 if USB && MEDIA_SUPPORT
 
 menuconfig MEDIA_USB_SUPPORT
@@ -29,7 +35,6 @@ endif
 
 if MEDIA_ANALOG_TV_SUPPORT
 	comment "Analog TV USB devices"
-source "drivers/media/usb/pvrusb2/Kconfig"
 source "drivers/media/usb/hdpvr/Kconfig"
 source "drivers/media/usb/stk1160/Kconfig"
 source "drivers/media/usb/go7007/Kconfig"
@@ -39,6 +44,7 @@ if (MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT)
 	comment "Analog/digital TV USB devices"
 source "drivers/media/usb/au0828/Kconfig"
 source "drivers/media/usb/cx231xx/Kconfig"
+source "drivers/media/usb/pvrusb2/Kconfig"
 source "drivers/media/usb/tm6000/Kconfig"
 endif
 
diff --git a/drivers/media/usb/au0828/Kconfig b/drivers/media/usb/au0828/Kconfig
index 05cc6c48c26f..2f5ee684a278 100644
--- a/drivers/media/usb/au0828/Kconfig
+++ b/drivers/media/usb/au0828/Kconfig
@@ -2,12 +2,12 @@
 
 config VIDEO_AU0828
 	tristate "Auvitek AU0828 support"
-	depends on I2C && INPUT && DVB_CORE && USB && VIDEO_V4L2
+	depends on I2C && INPUT && USB
 	select MEDIA_CONTROLLER
 	select MEDIA_CONTROLLER_DVB
 	select I2C_ALGOBIT
 	select VIDEO_TVEEPROM
-	select VIDEOBUF2_VMALLOC if VIDEO_V4L2
+	select VIDEOBUF2_VMALLOC
 	select DVB_AU8522_DTV if MEDIA_SUBDRV_AUTOSELECT
 	select MEDIA_TUNER_XC5000 if MEDIA_SUBDRV_AUTOSELECT
 	select MEDIA_TUNER_MXL5007T if MEDIA_SUBDRV_AUTOSELECT
@@ -22,8 +22,6 @@ config VIDEO_AU0828
 config VIDEO_AU0828_V4L2
 	bool "Auvitek AU0828 v4l2 analog video support"
 	depends on VIDEO_AU0828
-	depends on VIDEO_V4L2=y || VIDEO_V4L2=VIDEO_AU0828
-	select DVB_AU8522_V4L if MEDIA_SUBDRV_AUTOSELECT
 	select VIDEO_TUNER
 	default y
 	help
diff --git a/drivers/media/usb/cx231xx/Kconfig b/drivers/media/usb/cx231xx/Kconfig
index 2fe2b2d335ba..7e3b189f9dca 100644
--- a/drivers/media/usb/cx231xx/Kconfig
+++ b/drivers/media/usb/cx231xx/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_CX231XX
 	tristate "Conexant cx231xx USB video capture support"
-	depends on VIDEO_DEV && I2C && I2C_MUX
+	depends on I2C && I2C_MUX
 	select VIDEO_TUNER
 	select VIDEO_TVEEPROM
 	select VIDEOBUF2_VMALLOC
@@ -40,7 +40,7 @@ config VIDEO_CX231XX_ALSA
 
 config VIDEO_CX231XX_DVB
 	tristate "DVB/ATSC Support for Cx231xx based TV cards"
-	depends on VIDEO_CX231XX && DVB_CORE
+	depends on VIDEO_CX231XX
 	select MEDIA_TUNER_XC5000 if MEDIA_SUBDRV_AUTOSELECT
 	select MEDIA_TUNER_TDA18271 if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_MB86A20S if MEDIA_SUBDRV_AUTOSELECT
diff --git a/drivers/media/usb/pvrusb2/Kconfig b/drivers/media/usb/pvrusb2/Kconfig
index e6a4f730591b..5bf45f2b2517 100644
--- a/drivers/media/usb/pvrusb2/Kconfig
+++ b/drivers/media/usb/pvrusb2/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_PVRUSB2
 	tristate "Hauppauge WinTV-PVR USB2 support"
-	depends on VIDEO_V4L2 && I2C
+	depends on I2C
 	select VIDEO_TUNER
 	select VIDEO_TVEEPROM
 	select VIDEO_CX2341X
@@ -36,7 +36,7 @@ config VIDEO_PVRUSB2_SYSFS
 config VIDEO_PVRUSB2_DVB
 	bool "pvrusb2 ATSC/DVB support"
 	default y
-	depends on VIDEO_PVRUSB2 && DVB_CORE
+	depends on VIDEO_PVRUSB2
 	select DVB_LGDT330X if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_S5H1409 if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_S5H1411 if MEDIA_SUBDRV_AUTOSELECT
diff --git a/drivers/media/usb/tm6000/Kconfig b/drivers/media/usb/tm6000/Kconfig
index 56e977deba81..ad9cfa855eac 100644
--- a/drivers/media/usb/tm6000/Kconfig
+++ b/drivers/media/usb/tm6000/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_TM6000
 	tristate "TV Master TM5600/6000/6010 driver"
-	depends on VIDEO_DEV && I2C && INPUT && RC_CORE && USB
+	depends on I2C && INPUT && RC_CORE && USB
 	select VIDEO_TUNER
 	select MEDIA_TUNER_XC2028
 	select MEDIA_TUNER_XC5000
@@ -28,7 +28,7 @@ config VIDEO_TM6000_ALSA
 
 config VIDEO_TM6000_DVB
 	tristate "DVB Support for tm6000 based TV cards"
-	depends on VIDEO_TM6000 && DVB_CORE && USB
+	depends on VIDEO_TM6000 && USB
 	select DVB_ZL10353
 	help
 	  This adds support for DVB cards based on the tm5600/tm6000 chip.
-- 
2.25.1

