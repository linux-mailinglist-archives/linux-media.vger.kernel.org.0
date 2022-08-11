Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78CB358F9F5
	for <lists+linux-media@lfdr.de>; Thu, 11 Aug 2022 11:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234909AbiHKJSO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Aug 2022 05:18:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234956AbiHKJSH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Aug 2022 05:18:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34C20923E9
        for <linux-media@vger.kernel.org>; Thu, 11 Aug 2022 02:18:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B111EB81F8B
        for <linux-media@vger.kernel.org>; Thu, 11 Aug 2022 09:18:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F1DC433D7;
        Thu, 11 Aug 2022 09:18:01 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 9/9] av7110: move to staging/media/deprecated/saa7146
Date:   Thu, 11 Aug 2022 11:17:49 +0200
Message-Id: <20220811091749.3956641-10-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811091749.3956641-1-hverkuil-cisco@xs4all.nl>
References: <20220811091749.3956641-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The av7110 driver depends on saa7146, so move it there.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/staging/media/Kconfig                 |  2 --
 drivers/staging/media/Makefile                |  1 -
 drivers/staging/media/av7110/TODO             |  3 ---
 .../staging/media/deprecated/saa7146/Kconfig  |  1 +
 .../staging/media/deprecated/saa7146/Makefile |  2 +-
 .../{ => deprecated/saa7146}/av7110/Kconfig   | 20 +++++++++++++++----
 .../{ => deprecated/saa7146}/av7110/Makefile  |  0
 .../media/deprecated/saa7146/av7110/TODO      |  9 +++++++++
 .../av7110/audio-bilingual-channel-select.rst |  0
 .../saa7146}/av7110/audio-channel-select.rst  |  0
 .../saa7146}/av7110/audio-clear-buffer.rst    |  0
 .../saa7146}/av7110/audio-continue.rst        |  0
 .../saa7146}/av7110/audio-fclose.rst          |  0
 .../saa7146}/av7110/audio-fopen.rst           |  0
 .../saa7146}/av7110/audio-fwrite.rst          |  0
 .../av7110/audio-get-capabilities.rst         |  0
 .../saa7146}/av7110/audio-get-status.rst      |  0
 .../saa7146}/av7110/audio-pause.rst           |  0
 .../saa7146}/av7110/audio-play.rst            |  0
 .../saa7146}/av7110/audio-select-source.rst   |  0
 .../saa7146}/av7110/audio-set-av-sync.rst     |  0
 .../saa7146}/av7110/audio-set-bypass-mode.rst |  0
 .../saa7146}/av7110/audio-set-id.rst          |  0
 .../saa7146}/av7110/audio-set-mixer.rst       |  0
 .../saa7146}/av7110/audio-set-mute.rst        |  0
 .../saa7146}/av7110/audio-set-streamtype.rst  |  0
 .../saa7146}/av7110/audio-stop.rst            |  0
 .../{ => deprecated/saa7146}/av7110/audio.rst |  0
 .../saa7146}/av7110/audio_data_types.rst      |  0
 .../saa7146}/av7110/audio_function_calls.rst  |  0
 .../{ => deprecated/saa7146}/av7110/av7110.c  |  0
 .../{ => deprecated/saa7146}/av7110/av7110.h  |  0
 .../saa7146}/av7110/av7110_av.c               |  0
 .../saa7146}/av7110/av7110_av.h               |  0
 .../saa7146}/av7110/av7110_ca.c               |  0
 .../saa7146}/av7110/av7110_ca.h               |  0
 .../saa7146}/av7110/av7110_hw.c               |  0
 .../saa7146}/av7110/av7110_hw.h               |  0
 .../saa7146}/av7110/av7110_ipack.c            |  0
 .../saa7146}/av7110/av7110_ipack.h            |  0
 .../saa7146}/av7110/av7110_ir.c               |  0
 .../saa7146}/av7110/av7110_v4l.c              |  0
 .../saa7146}/av7110/budget-patch.c            |  0
 .../saa7146}/av7110/dvb_filter.c              |  0
 .../saa7146}/av7110/dvb_filter.h              |  0
 .../{ => deprecated/saa7146}/av7110/sp8870.c  |  0
 .../{ => deprecated/saa7146}/av7110/sp8870.h  |  0
 .../saa7146}/av7110/video-clear-buffer.rst    |  0
 .../saa7146}/av7110/video-command.rst         |  0
 .../saa7146}/av7110/video-continue.rst        |  0
 .../saa7146}/av7110/video-fast-forward.rst    |  0
 .../saa7146}/av7110/video-fclose.rst          |  0
 .../saa7146}/av7110/video-fopen.rst           |  0
 .../saa7146}/av7110/video-freeze.rst          |  0
 .../saa7146}/av7110/video-fwrite.rst          |  0
 .../av7110/video-get-capabilities.rst         |  0
 .../saa7146}/av7110/video-get-event.rst       |  0
 .../saa7146}/av7110/video-get-frame-count.rst |  0
 .../saa7146}/av7110/video-get-pts.rst         |  0
 .../saa7146}/av7110/video-get-size.rst        |  0
 .../saa7146}/av7110/video-get-status.rst      |  0
 .../saa7146}/av7110/video-play.rst            |  0
 .../saa7146}/av7110/video-select-source.rst   |  0
 .../saa7146}/av7110/video-set-blank.rst       |  0
 .../av7110/video-set-display-format.rst       |  0
 .../saa7146}/av7110/video-set-format.rst      |  0
 .../saa7146}/av7110/video-set-streamtype.rst  |  0
 .../saa7146}/av7110/video-slowmotion.rst      |  0
 .../saa7146}/av7110/video-stillpicture.rst    |  0
 .../saa7146}/av7110/video-stop.rst            |  0
 .../saa7146}/av7110/video-try-command.rst     |  0
 .../{ => deprecated/saa7146}/av7110/video.rst |  0
 .../saa7146}/av7110/video_function_calls.rst  |  0
 .../saa7146}/av7110/video_types.rst           |  0
 74 files changed, 27 insertions(+), 11 deletions(-)
 delete mode 100644 drivers/staging/media/av7110/TODO
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/Kconfig (82%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/Makefile (100%)
 create mode 100644 drivers/staging/media/deprecated/saa7146/av7110/TODO
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-bilingual-channel-select.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-channel-select.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-clear-buffer.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-continue.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-fclose.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-fopen.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-fwrite.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-get-capabilities.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-get-status.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-pause.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-play.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-select-source.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-set-av-sync.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-set-bypass-mode.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-set-id.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-set-mixer.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-set-mute.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-set-streamtype.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio-stop.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio_data_types.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/audio_function_calls.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110.c (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110.h (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110_av.c (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110_av.h (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110_ca.c (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110_ca.h (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110_hw.c (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110_hw.h (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110_ipack.c (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110_ipack.h (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110_ir.c (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/av7110_v4l.c (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/budget-patch.c (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/dvb_filter.c (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/dvb_filter.h (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/sp8870.c (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/sp8870.h (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-clear-buffer.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-command.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-continue.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-fast-forward.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-fclose.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-fopen.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-freeze.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-fwrite.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-get-capabilities.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-get-event.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-get-frame-count.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-get-pts.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-get-size.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-get-status.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-play.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-select-source.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-set-blank.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-set-display-format.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-set-format.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-set-streamtype.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-slowmotion.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-stillpicture.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-stop.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video-try-command.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video_function_calls.rst (100%)
 rename drivers/staging/media/{ => deprecated/saa7146}/av7110/video_types.rst (100%)

diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index 7fb9fc2fa923..9886f77b6927 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -22,8 +22,6 @@ if STAGING_MEDIA && MEDIA_SUPPORT
 # Please keep them in alphabetic order
 source "drivers/staging/media/atomisp/Kconfig"
 
-source "drivers/staging/media/av7110/Kconfig"
-
 source "drivers/staging/media/hantro/Kconfig"
 
 source "drivers/staging/media/imx/Kconfig"
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 399b3c48d4d2..b2646db2a0ce 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -16,6 +16,5 @@ obj-$(CONFIG_VIDEO_TM6000)	+= deprecated/tm6000/
 obj-$(CONFIG_VIDEO_VIU)		+= deprecated/fsl-viu/
 obj-$(CONFIG_VIDEO_ZORAN)	+= zoran/
 obj-$(CONFIG_USB_ZR364XX)	+= deprecated/zr364xx/
-obj-$(CONFIG_DVB_AV7110)	+= av7110/
 obj-y += deprecated/vpfe_capture/
 obj-y += deprecated/saa7146/
diff --git a/drivers/staging/media/av7110/TODO b/drivers/staging/media/av7110/TODO
deleted file mode 100644
index 60062d8441b3..000000000000
--- a/drivers/staging/media/av7110/TODO
+++ /dev/null
@@ -1,3 +0,0 @@
-- This driver is too old and relies on a different API.
-  Drop it from Kernel on a couple of versions.
-- Cleanup patches for the drivers here won't be accepted.
diff --git a/drivers/staging/media/deprecated/saa7146/Kconfig b/drivers/staging/media/deprecated/saa7146/Kconfig
index d0cb52164ff8..54154da79f59 100644
--- a/drivers/staging/media/deprecated/saa7146/Kconfig
+++ b/drivers/staging/media/deprecated/saa7146/Kconfig
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 source "drivers/staging/media/deprecated/saa7146/common/Kconfig"
+source "drivers/staging/media/deprecated/saa7146/av7110/Kconfig"
 source "drivers/staging/media/deprecated/saa7146/saa7146/Kconfig"
 source "drivers/staging/media/deprecated/saa7146/ttpci/Kconfig"
diff --git a/drivers/staging/media/deprecated/saa7146/Makefile b/drivers/staging/media/deprecated/saa7146/Makefile
index 9d99fdedf813..68e7aa10c639 100644
--- a/drivers/staging/media/deprecated/saa7146/Makefile
+++ b/drivers/staging/media/deprecated/saa7146/Makefile
@@ -1,2 +1,2 @@
  # SPDX-License-Identifier: GPL-2.0-only
-obj-y += common/ saa7146/ ttpci/
+obj-y += common/ av7110/ saa7146/ ttpci/
diff --git a/drivers/staging/media/av7110/Kconfig b/drivers/staging/media/deprecated/saa7146/av7110/Kconfig
similarity index 82%
rename from drivers/staging/media/av7110/Kconfig
rename to drivers/staging/media/deprecated/saa7146/av7110/Kconfig
index 9faf9d2d4001..1571eab31926 100644
--- a/drivers/staging/media/av7110/Kconfig
+++ b/drivers/staging/media/deprecated/saa7146/av7110/Kconfig
@@ -5,7 +5,7 @@ config DVB_AV7110_IR
 	default DVB_AV7110
 
 config DVB_AV7110
-	tristate "AV7110 cards"
+	tristate "AV7110 cards (DEPRECATED)"
 	depends on DVB_CORE && PCI && I2C
 	select TTPCI_EEPROM
 	select VIDEO_SAA7146_VV
@@ -35,10 +35,13 @@ config DVB_AV7110
 	  kernel image by adding the filename to the EXTRA_FIRMWARE
 	  configuration option string.
 
+	  This driver is deprecated and is scheduled for removal by
+	  the beginning of 2023. See the TODO file for more information.
+
 	  Say Y if you own such a card and want to use it.
 
 config DVB_AV7110_OSD
-	bool "AV7110 OSD support"
+	bool "AV7110 OSD support (DEPRECATED)"
 	depends on DVB_AV7110
 	default y if DVB_AV7110=y || DVB_AV7110=m
 	help
@@ -49,10 +52,13 @@ config DVB_AV7110_OSD
 	  Anyway, some popular DVB software like VDR uses this OSD to render
 	  its menus, so say Y if you want to use this software.
 
+	  This driver is deprecated and is scheduled for removal by
+	  the beginning of 2023. See the TODO file for more information.
+
 	  All other people say N.
 
 config DVB_BUDGET_PATCH
-	tristate "AV7110 cards with Budget Patch"
+	tristate "AV7110 cards with Budget Patch (DEPRECATED)"
 	depends on DVB_BUDGET_CORE && I2C
 	depends on DVB_AV7110
 	select DVB_STV0299 if MEDIA_SUBDRV_AUTOSELECT
@@ -68,6 +74,9 @@ config DVB_BUDGET_PATCH
 	  standard AV7110 driver prior to loading this
 	  driver.
 
+	  This driver is deprecated and is scheduled for removal by
+	  the beginning of 2023. See the TODO file for more information.
+
 	  Say Y if you own such a card and want to use it.
 
 	  To compile this driver as a module, choose M here: the
@@ -80,7 +89,7 @@ if DVB_AV7110
 # it if we drop support for AV7110, as no other driver will use it.
 
 config DVB_SP8870
-	tristate "Spase sp8870 based"
+	tristate "Spase sp8870 based (DEPRECATED)"
 	depends on DVB_CORE && I2C
 	default m if !MEDIA_SUBDRV_AUTOSELECT
 	help
@@ -91,4 +100,7 @@ config DVB_SP8870
 	  download/extract it, and then copy it to /usr/lib/hotplug/firmware
 	  or /lib/firmware (depending on configuration of firmware hotplug).
 
+	  This driver is deprecated and is scheduled for removal by
+	  the beginning of 2023. See the TODO file for more information.
+
 endif
diff --git a/drivers/staging/media/av7110/Makefile b/drivers/staging/media/deprecated/saa7146/av7110/Makefile
similarity index 100%
rename from drivers/staging/media/av7110/Makefile
rename to drivers/staging/media/deprecated/saa7146/av7110/Makefile
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/TODO b/drivers/staging/media/deprecated/saa7146/av7110/TODO
new file mode 100644
index 000000000000..38817e04bb67
--- /dev/null
+++ b/drivers/staging/media/deprecated/saa7146/av7110/TODO
@@ -0,0 +1,9 @@
+- This driver is too old and relies on a different API.
+  Drop it from Kernel on a couple of versions.
+- Cleanup patches for the drivers here won't be accepted.
+
+These drivers are now deprecated with the intent of
+removing them altogether by the beginning of 2023.
+
+If someone is interested in doing this work, then contact the
+linux-media mailinglist (https://linuxtv.org/lists.php).
diff --git a/drivers/staging/media/av7110/audio-bilingual-channel-select.rst b/drivers/staging/media/deprecated/saa7146/av7110/audio-bilingual-channel-select.rst
similarity index 100%
rename from drivers/staging/media/av7110/audio-bilingual-channel-select.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/audio-bilingual-channel-select.rst
diff --git a/drivers/staging/media/av7110/audio-channel-select.rst b/drivers/staging/media/deprecated/saa7146/av7110/audio-channel-select.rst
similarity index 100%
rename from drivers/staging/media/av7110/audio-channel-select.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/audio-channel-select.rst
diff --git a/drivers/staging/media/av7110/audio-clear-buffer.rst b/drivers/staging/media/deprecated/saa7146/av7110/audio-clear-buffer.rst
similarity index 100%
rename from drivers/staging/media/av7110/audio-clear-buffer.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/audio-clear-buffer.rst
diff --git a/drivers/staging/media/av7110/audio-continue.rst b/drivers/staging/media/deprecated/saa7146/av7110/audio-continue.rst
similarity index 100%
rename from drivers/staging/media/av7110/audio-continue.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/audio-continue.rst
diff --git a/drivers/staging/media/av7110/audio-fclose.rst b/drivers/staging/media/deprecated/saa7146/av7110/audio-fclose.rst
similarity index 100%
rename from drivers/staging/media/av7110/audio-fclose.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/audio-fclose.rst
diff --git a/drivers/staging/media/av7110/audio-fopen.rst b/drivers/staging/media/deprecated/saa7146/av7110/audio-fopen.rst
similarity index 100%
rename from drivers/staging/media/av7110/audio-fopen.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/audio-fopen.rst
diff --git a/drivers/staging/media/av7110/audio-fwrite.rst b/drivers/staging/media/deprecated/saa7146/av7110/audio-fwrite.rst
similarity index 100%
rename from drivers/staging/media/av7110/audio-fwrite.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/audio-fwrite.rst
diff --git a/drivers/staging/media/av7110/audio-get-capabilities.rst b/drivers/staging/media/deprecated/saa7146/av7110/audio-get-capabilities.rst
similarity index 100%
rename from drivers/staging/media/av7110/audio-get-capabilities.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/audio-get-capabilities.rst
diff --git a/drivers/staging/media/av7110/audio-get-status.rst b/drivers/staging/media/deprecated/saa7146/av7110/audio-get-status.rst
similarity index 100%
rename from drivers/staging/media/av7110/audio-get-status.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/audio-get-status.rst
diff --git a/drivers/staging/media/av7110/audio-pause.rst b/drivers/staging/media/deprecated/saa7146/av7110/audio-pause.rst
similarity index 100%
rename from drivers/staging/media/av7110/audio-pause.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/audio-pause.rst
diff --git a/drivers/staging/media/av7110/audio-play.rst b/drivers/staging/media/deprecated/saa7146/av7110/audio-play.rst
similarity index 100%
rename from drivers/staging/media/av7110/audio-play.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/audio-play.rst
diff --git a/drivers/staging/media/av7110/audio-select-source.rst b/drivers/staging/media/deprecated/saa7146/av7110/audio-select-source.rst
similarity index 100%
rename from drivers/staging/media/av7110/audio-select-source.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/audio-select-source.rst
diff --git a/drivers/staging/media/av7110/audio-set-av-sync.rst b/drivers/staging/media/deprecated/saa7146/av7110/audio-set-av-sync.rst
similarity index 100%
rename from drivers/staging/media/av7110/audio-set-av-sync.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/audio-set-av-sync.rst
diff --git a/drivers/staging/media/av7110/audio-set-bypass-mode.rst b/drivers/staging/media/deprecated/saa7146/av7110/audio-set-bypass-mode.rst
similarity index 100%
rename from drivers/staging/media/av7110/audio-set-bypass-mode.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/audio-set-bypass-mode.rst
diff --git a/drivers/staging/media/av7110/audio-set-id.rst b/drivers/staging/media/deprecated/saa7146/av7110/audio-set-id.rst
similarity index 100%
rename from drivers/staging/media/av7110/audio-set-id.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/audio-set-id.rst
diff --git a/drivers/staging/media/av7110/audio-set-mixer.rst b/drivers/staging/media/deprecated/saa7146/av7110/audio-set-mixer.rst
similarity index 100%
rename from drivers/staging/media/av7110/audio-set-mixer.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/audio-set-mixer.rst
diff --git a/drivers/staging/media/av7110/audio-set-mute.rst b/drivers/staging/media/deprecated/saa7146/av7110/audio-set-mute.rst
similarity index 100%
rename from drivers/staging/media/av7110/audio-set-mute.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/audio-set-mute.rst
diff --git a/drivers/staging/media/av7110/audio-set-streamtype.rst b/drivers/staging/media/deprecated/saa7146/av7110/audio-set-streamtype.rst
similarity index 100%
rename from drivers/staging/media/av7110/audio-set-streamtype.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/audio-set-streamtype.rst
diff --git a/drivers/staging/media/av7110/audio-stop.rst b/drivers/staging/media/deprecated/saa7146/av7110/audio-stop.rst
similarity index 100%
rename from drivers/staging/media/av7110/audio-stop.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/audio-stop.rst
diff --git a/drivers/staging/media/av7110/audio.rst b/drivers/staging/media/deprecated/saa7146/av7110/audio.rst
similarity index 100%
rename from drivers/staging/media/av7110/audio.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/audio.rst
diff --git a/drivers/staging/media/av7110/audio_data_types.rst b/drivers/staging/media/deprecated/saa7146/av7110/audio_data_types.rst
similarity index 100%
rename from drivers/staging/media/av7110/audio_data_types.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/audio_data_types.rst
diff --git a/drivers/staging/media/av7110/audio_function_calls.rst b/drivers/staging/media/deprecated/saa7146/av7110/audio_function_calls.rst
similarity index 100%
rename from drivers/staging/media/av7110/audio_function_calls.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/audio_function_calls.rst
diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/deprecated/saa7146/av7110/av7110.c
similarity index 100%
rename from drivers/staging/media/av7110/av7110.c
rename to drivers/staging/media/deprecated/saa7146/av7110/av7110.c
diff --git a/drivers/staging/media/av7110/av7110.h b/drivers/staging/media/deprecated/saa7146/av7110/av7110.h
similarity index 100%
rename from drivers/staging/media/av7110/av7110.h
rename to drivers/staging/media/deprecated/saa7146/av7110/av7110.h
diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/deprecated/saa7146/av7110/av7110_av.c
similarity index 100%
rename from drivers/staging/media/av7110/av7110_av.c
rename to drivers/staging/media/deprecated/saa7146/av7110/av7110_av.c
diff --git a/drivers/staging/media/av7110/av7110_av.h b/drivers/staging/media/deprecated/saa7146/av7110/av7110_av.h
similarity index 100%
rename from drivers/staging/media/av7110/av7110_av.h
rename to drivers/staging/media/deprecated/saa7146/av7110/av7110_av.h
diff --git a/drivers/staging/media/av7110/av7110_ca.c b/drivers/staging/media/deprecated/saa7146/av7110/av7110_ca.c
similarity index 100%
rename from drivers/staging/media/av7110/av7110_ca.c
rename to drivers/staging/media/deprecated/saa7146/av7110/av7110_ca.c
diff --git a/drivers/staging/media/av7110/av7110_ca.h b/drivers/staging/media/deprecated/saa7146/av7110/av7110_ca.h
similarity index 100%
rename from drivers/staging/media/av7110/av7110_ca.h
rename to drivers/staging/media/deprecated/saa7146/av7110/av7110_ca.h
diff --git a/drivers/staging/media/av7110/av7110_hw.c b/drivers/staging/media/deprecated/saa7146/av7110/av7110_hw.c
similarity index 100%
rename from drivers/staging/media/av7110/av7110_hw.c
rename to drivers/staging/media/deprecated/saa7146/av7110/av7110_hw.c
diff --git a/drivers/staging/media/av7110/av7110_hw.h b/drivers/staging/media/deprecated/saa7146/av7110/av7110_hw.h
similarity index 100%
rename from drivers/staging/media/av7110/av7110_hw.h
rename to drivers/staging/media/deprecated/saa7146/av7110/av7110_hw.h
diff --git a/drivers/staging/media/av7110/av7110_ipack.c b/drivers/staging/media/deprecated/saa7146/av7110/av7110_ipack.c
similarity index 100%
rename from drivers/staging/media/av7110/av7110_ipack.c
rename to drivers/staging/media/deprecated/saa7146/av7110/av7110_ipack.c
diff --git a/drivers/staging/media/av7110/av7110_ipack.h b/drivers/staging/media/deprecated/saa7146/av7110/av7110_ipack.h
similarity index 100%
rename from drivers/staging/media/av7110/av7110_ipack.h
rename to drivers/staging/media/deprecated/saa7146/av7110/av7110_ipack.h
diff --git a/drivers/staging/media/av7110/av7110_ir.c b/drivers/staging/media/deprecated/saa7146/av7110/av7110_ir.c
similarity index 100%
rename from drivers/staging/media/av7110/av7110_ir.c
rename to drivers/staging/media/deprecated/saa7146/av7110/av7110_ir.c
diff --git a/drivers/staging/media/av7110/av7110_v4l.c b/drivers/staging/media/deprecated/saa7146/av7110/av7110_v4l.c
similarity index 100%
rename from drivers/staging/media/av7110/av7110_v4l.c
rename to drivers/staging/media/deprecated/saa7146/av7110/av7110_v4l.c
diff --git a/drivers/staging/media/av7110/budget-patch.c b/drivers/staging/media/deprecated/saa7146/av7110/budget-patch.c
similarity index 100%
rename from drivers/staging/media/av7110/budget-patch.c
rename to drivers/staging/media/deprecated/saa7146/av7110/budget-patch.c
diff --git a/drivers/staging/media/av7110/dvb_filter.c b/drivers/staging/media/deprecated/saa7146/av7110/dvb_filter.c
similarity index 100%
rename from drivers/staging/media/av7110/dvb_filter.c
rename to drivers/staging/media/deprecated/saa7146/av7110/dvb_filter.c
diff --git a/drivers/staging/media/av7110/dvb_filter.h b/drivers/staging/media/deprecated/saa7146/av7110/dvb_filter.h
similarity index 100%
rename from drivers/staging/media/av7110/dvb_filter.h
rename to drivers/staging/media/deprecated/saa7146/av7110/dvb_filter.h
diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/media/deprecated/saa7146/av7110/sp8870.c
similarity index 100%
rename from drivers/staging/media/av7110/sp8870.c
rename to drivers/staging/media/deprecated/saa7146/av7110/sp8870.c
diff --git a/drivers/staging/media/av7110/sp8870.h b/drivers/staging/media/deprecated/saa7146/av7110/sp8870.h
similarity index 100%
rename from drivers/staging/media/av7110/sp8870.h
rename to drivers/staging/media/deprecated/saa7146/av7110/sp8870.h
diff --git a/drivers/staging/media/av7110/video-clear-buffer.rst b/drivers/staging/media/deprecated/saa7146/av7110/video-clear-buffer.rst
similarity index 100%
rename from drivers/staging/media/av7110/video-clear-buffer.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/video-clear-buffer.rst
diff --git a/drivers/staging/media/av7110/video-command.rst b/drivers/staging/media/deprecated/saa7146/av7110/video-command.rst
similarity index 100%
rename from drivers/staging/media/av7110/video-command.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/video-command.rst
diff --git a/drivers/staging/media/av7110/video-continue.rst b/drivers/staging/media/deprecated/saa7146/av7110/video-continue.rst
similarity index 100%
rename from drivers/staging/media/av7110/video-continue.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/video-continue.rst
diff --git a/drivers/staging/media/av7110/video-fast-forward.rst b/drivers/staging/media/deprecated/saa7146/av7110/video-fast-forward.rst
similarity index 100%
rename from drivers/staging/media/av7110/video-fast-forward.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/video-fast-forward.rst
diff --git a/drivers/staging/media/av7110/video-fclose.rst b/drivers/staging/media/deprecated/saa7146/av7110/video-fclose.rst
similarity index 100%
rename from drivers/staging/media/av7110/video-fclose.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/video-fclose.rst
diff --git a/drivers/staging/media/av7110/video-fopen.rst b/drivers/staging/media/deprecated/saa7146/av7110/video-fopen.rst
similarity index 100%
rename from drivers/staging/media/av7110/video-fopen.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/video-fopen.rst
diff --git a/drivers/staging/media/av7110/video-freeze.rst b/drivers/staging/media/deprecated/saa7146/av7110/video-freeze.rst
similarity index 100%
rename from drivers/staging/media/av7110/video-freeze.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/video-freeze.rst
diff --git a/drivers/staging/media/av7110/video-fwrite.rst b/drivers/staging/media/deprecated/saa7146/av7110/video-fwrite.rst
similarity index 100%
rename from drivers/staging/media/av7110/video-fwrite.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/video-fwrite.rst
diff --git a/drivers/staging/media/av7110/video-get-capabilities.rst b/drivers/staging/media/deprecated/saa7146/av7110/video-get-capabilities.rst
similarity index 100%
rename from drivers/staging/media/av7110/video-get-capabilities.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/video-get-capabilities.rst
diff --git a/drivers/staging/media/av7110/video-get-event.rst b/drivers/staging/media/deprecated/saa7146/av7110/video-get-event.rst
similarity index 100%
rename from drivers/staging/media/av7110/video-get-event.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/video-get-event.rst
diff --git a/drivers/staging/media/av7110/video-get-frame-count.rst b/drivers/staging/media/deprecated/saa7146/av7110/video-get-frame-count.rst
similarity index 100%
rename from drivers/staging/media/av7110/video-get-frame-count.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/video-get-frame-count.rst
diff --git a/drivers/staging/media/av7110/video-get-pts.rst b/drivers/staging/media/deprecated/saa7146/av7110/video-get-pts.rst
similarity index 100%
rename from drivers/staging/media/av7110/video-get-pts.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/video-get-pts.rst
diff --git a/drivers/staging/media/av7110/video-get-size.rst b/drivers/staging/media/deprecated/saa7146/av7110/video-get-size.rst
similarity index 100%
rename from drivers/staging/media/av7110/video-get-size.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/video-get-size.rst
diff --git a/drivers/staging/media/av7110/video-get-status.rst b/drivers/staging/media/deprecated/saa7146/av7110/video-get-status.rst
similarity index 100%
rename from drivers/staging/media/av7110/video-get-status.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/video-get-status.rst
diff --git a/drivers/staging/media/av7110/video-play.rst b/drivers/staging/media/deprecated/saa7146/av7110/video-play.rst
similarity index 100%
rename from drivers/staging/media/av7110/video-play.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/video-play.rst
diff --git a/drivers/staging/media/av7110/video-select-source.rst b/drivers/staging/media/deprecated/saa7146/av7110/video-select-source.rst
similarity index 100%
rename from drivers/staging/media/av7110/video-select-source.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/video-select-source.rst
diff --git a/drivers/staging/media/av7110/video-set-blank.rst b/drivers/staging/media/deprecated/saa7146/av7110/video-set-blank.rst
similarity index 100%
rename from drivers/staging/media/av7110/video-set-blank.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/video-set-blank.rst
diff --git a/drivers/staging/media/av7110/video-set-display-format.rst b/drivers/staging/media/deprecated/saa7146/av7110/video-set-display-format.rst
similarity index 100%
rename from drivers/staging/media/av7110/video-set-display-format.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/video-set-display-format.rst
diff --git a/drivers/staging/media/av7110/video-set-format.rst b/drivers/staging/media/deprecated/saa7146/av7110/video-set-format.rst
similarity index 100%
rename from drivers/staging/media/av7110/video-set-format.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/video-set-format.rst
diff --git a/drivers/staging/media/av7110/video-set-streamtype.rst b/drivers/staging/media/deprecated/saa7146/av7110/video-set-streamtype.rst
similarity index 100%
rename from drivers/staging/media/av7110/video-set-streamtype.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/video-set-streamtype.rst
diff --git a/drivers/staging/media/av7110/video-slowmotion.rst b/drivers/staging/media/deprecated/saa7146/av7110/video-slowmotion.rst
similarity index 100%
rename from drivers/staging/media/av7110/video-slowmotion.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/video-slowmotion.rst
diff --git a/drivers/staging/media/av7110/video-stillpicture.rst b/drivers/staging/media/deprecated/saa7146/av7110/video-stillpicture.rst
similarity index 100%
rename from drivers/staging/media/av7110/video-stillpicture.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/video-stillpicture.rst
diff --git a/drivers/staging/media/av7110/video-stop.rst b/drivers/staging/media/deprecated/saa7146/av7110/video-stop.rst
similarity index 100%
rename from drivers/staging/media/av7110/video-stop.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/video-stop.rst
diff --git a/drivers/staging/media/av7110/video-try-command.rst b/drivers/staging/media/deprecated/saa7146/av7110/video-try-command.rst
similarity index 100%
rename from drivers/staging/media/av7110/video-try-command.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/video-try-command.rst
diff --git a/drivers/staging/media/av7110/video.rst b/drivers/staging/media/deprecated/saa7146/av7110/video.rst
similarity index 100%
rename from drivers/staging/media/av7110/video.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/video.rst
diff --git a/drivers/staging/media/av7110/video_function_calls.rst b/drivers/staging/media/deprecated/saa7146/av7110/video_function_calls.rst
similarity index 100%
rename from drivers/staging/media/av7110/video_function_calls.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/video_function_calls.rst
diff --git a/drivers/staging/media/av7110/video_types.rst b/drivers/staging/media/deprecated/saa7146/av7110/video_types.rst
similarity index 100%
rename from drivers/staging/media/av7110/video_types.rst
rename to drivers/staging/media/deprecated/saa7146/av7110/video_types.rst
-- 
2.35.1

