Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B90A2686757
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 14:46:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231576AbjBANqY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 08:46:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231789AbjBANqX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 08:46:23 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 393A14E536
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 05:46:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C5DD5B82168
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 13:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E81EFC433D2
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 13:46:12 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/2] Revert "media: av7110: move to staging/media/deprecated/saa7146"
Date:   Wed,  1 Feb 2023 14:46:09 +0100
Message-Id: <20230201134610.873393-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230201134610.873393-1-hverkuil-cisco@xs4all.nl>
References: <20230201134610.873393-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This reverts commit 3e9ad662e34eb2d42ddef5a2883abd34461dfd9a.

The av7110 is still in use, so it can't be deprecated. Move it back
to staging/media for now.
---
 drivers/staging/media/Kconfig                 |  2 ++
 drivers/staging/media/Makefile                |  1 +
 .../{deprecated/saa7146 => }/av7110/Kconfig   | 20 ++++---------------
 .../{deprecated/saa7146 => }/av7110/Makefile  |  0
 drivers/staging/media/av7110/TODO             |  3 +++
 .../av7110/audio-bilingual-channel-select.rst |  0
 .../av7110/audio-channel-select.rst           |  0
 .../av7110/audio-clear-buffer.rst             |  0
 .../saa7146 => }/av7110/audio-continue.rst    |  0
 .../saa7146 => }/av7110/audio-fclose.rst      |  0
 .../saa7146 => }/av7110/audio-fopen.rst       |  0
 .../saa7146 => }/av7110/audio-fwrite.rst      |  0
 .../av7110/audio-get-capabilities.rst         |  0
 .../saa7146 => }/av7110/audio-get-status.rst  |  0
 .../saa7146 => }/av7110/audio-pause.rst       |  0
 .../saa7146 => }/av7110/audio-play.rst        |  0
 .../av7110/audio-select-source.rst            |  0
 .../saa7146 => }/av7110/audio-set-av-sync.rst |  0
 .../av7110/audio-set-bypass-mode.rst          |  0
 .../saa7146 => }/av7110/audio-set-id.rst      |  0
 .../saa7146 => }/av7110/audio-set-mixer.rst   |  0
 .../saa7146 => }/av7110/audio-set-mute.rst    |  0
 .../av7110/audio-set-streamtype.rst           |  0
 .../saa7146 => }/av7110/audio-stop.rst        |  0
 .../{deprecated/saa7146 => }/av7110/audio.rst |  0
 .../saa7146 => }/av7110/audio_data_types.rst  |  0
 .../av7110/audio_function_calls.rst           |  0
 .../{deprecated/saa7146 => }/av7110/av7110.c  |  0
 .../{deprecated/saa7146 => }/av7110/av7110.h  |  0
 .../saa7146 => }/av7110/av7110_av.c           |  0
 .../saa7146 => }/av7110/av7110_av.h           |  0
 .../saa7146 => }/av7110/av7110_ca.c           |  0
 .../saa7146 => }/av7110/av7110_ca.h           |  0
 .../saa7146 => }/av7110/av7110_hw.c           |  0
 .../saa7146 => }/av7110/av7110_hw.h           |  0
 .../saa7146 => }/av7110/av7110_ipack.c        |  0
 .../saa7146 => }/av7110/av7110_ipack.h        |  0
 .../saa7146 => }/av7110/av7110_ir.c           |  0
 .../saa7146 => }/av7110/av7110_v4l.c          |  0
 .../saa7146 => }/av7110/budget-patch.c        |  0
 .../saa7146 => }/av7110/dvb_filter.c          |  0
 .../saa7146 => }/av7110/dvb_filter.h          |  0
 .../{deprecated/saa7146 => }/av7110/sp8870.c  |  0
 .../{deprecated/saa7146 => }/av7110/sp8870.h  |  0
 .../av7110/video-clear-buffer.rst             |  0
 .../saa7146 => }/av7110/video-command.rst     |  0
 .../saa7146 => }/av7110/video-continue.rst    |  0
 .../av7110/video-fast-forward.rst             |  0
 .../saa7146 => }/av7110/video-fclose.rst      |  0
 .../saa7146 => }/av7110/video-fopen.rst       |  0
 .../saa7146 => }/av7110/video-freeze.rst      |  0
 .../saa7146 => }/av7110/video-fwrite.rst      |  0
 .../av7110/video-get-capabilities.rst         |  0
 .../saa7146 => }/av7110/video-get-event.rst   |  0
 .../av7110/video-get-frame-count.rst          |  0
 .../saa7146 => }/av7110/video-get-pts.rst     |  0
 .../saa7146 => }/av7110/video-get-size.rst    |  0
 .../saa7146 => }/av7110/video-get-status.rst  |  0
 .../saa7146 => }/av7110/video-play.rst        |  0
 .../av7110/video-select-source.rst            |  0
 .../saa7146 => }/av7110/video-set-blank.rst   |  0
 .../av7110/video-set-display-format.rst       |  0
 .../saa7146 => }/av7110/video-set-format.rst  |  0
 .../av7110/video-set-streamtype.rst           |  0
 .../saa7146 => }/av7110/video-slowmotion.rst  |  0
 .../av7110/video-stillpicture.rst             |  0
 .../saa7146 => }/av7110/video-stop.rst        |  0
 .../saa7146 => }/av7110/video-try-command.rst |  0
 .../{deprecated/saa7146 => }/av7110/video.rst |  0
 .../av7110/video_function_calls.rst           |  0
 .../saa7146 => }/av7110/video_types.rst       |  0
 .../staging/media/deprecated/saa7146/Kconfig  |  1 -
 .../staging/media/deprecated/saa7146/Makefile |  2 +-
 .../media/deprecated/saa7146/av7110/TODO      |  9 ---------
 74 files changed, 11 insertions(+), 27 deletions(-)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/Kconfig (82%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/Makefile (100%)
 create mode 100644 drivers/staging/media/av7110/TODO
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-bilingual-channel-select.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-channel-select.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-clear-buffer.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-continue.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-fclose.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-fopen.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-fwrite.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-get-capabilities.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-get-status.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-pause.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-play.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-select-source.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-set-av-sync.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-set-bypass-mode.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-set-id.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-set-mixer.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-set-mute.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-set-streamtype.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio-stop.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio_data_types.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/audio_function_calls.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110.c (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110.h (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110_av.c (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110_av.h (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110_ca.c (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110_ca.h (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110_hw.c (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110_hw.h (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110_ipack.c (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110_ipack.h (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110_ir.c (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/av7110_v4l.c (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/budget-patch.c (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/dvb_filter.c (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/dvb_filter.h (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/sp8870.c (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/sp8870.h (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-clear-buffer.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-command.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-continue.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-fast-forward.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-fclose.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-fopen.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-freeze.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-fwrite.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-get-capabilities.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-get-event.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-get-frame-count.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-get-pts.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-get-size.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-get-status.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-play.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-select-source.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-set-blank.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-set-display-format.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-set-format.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-set-streamtype.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-slowmotion.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-stillpicture.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-stop.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video-try-command.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video_function_calls.rst (100%)
 rename drivers/staging/media/{deprecated/saa7146 => }/av7110/video_types.rst (100%)
 delete mode 100644 drivers/staging/media/deprecated/saa7146/av7110/TODO

diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index d71ee9a5d04b..9a43d8872324 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -22,6 +22,8 @@ if STAGING_MEDIA && MEDIA_SUPPORT
 # Please keep them in alphabetic order
 source "drivers/staging/media/atomisp/Kconfig"
 
+source "drivers/staging/media/av7110/Kconfig"
+
 source "drivers/staging/media/imx/Kconfig"
 
 source "drivers/staging/media/ipu3/Kconfig"
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 1a01c1af3224..2efdbf78d5ef 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -9,4 +9,5 @@ obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC)	+= rkvdec/
 obj-$(CONFIG_VIDEO_SUNXI)	+= sunxi/
 obj-$(CONFIG_VIDEO_TEGRA)	+= tegra-video/
 obj-$(CONFIG_VIDEO_IPU3_IMGU)	+= ipu3/
+obj-$(CONFIG_DVB_AV7110)	+= av7110/
 obj-y += deprecated/saa7146/
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/Kconfig b/drivers/staging/media/av7110/Kconfig
similarity index 82%
rename from drivers/staging/media/deprecated/saa7146/av7110/Kconfig
rename to drivers/staging/media/av7110/Kconfig
index 1571eab31926..9faf9d2d4001 100644
--- a/drivers/staging/media/deprecated/saa7146/av7110/Kconfig
+++ b/drivers/staging/media/av7110/Kconfig
@@ -5,7 +5,7 @@ config DVB_AV7110_IR
 	default DVB_AV7110
 
 config DVB_AV7110
-	tristate "AV7110 cards (DEPRECATED)"
+	tristate "AV7110 cards"
 	depends on DVB_CORE && PCI && I2C
 	select TTPCI_EEPROM
 	select VIDEO_SAA7146_VV
@@ -35,13 +35,10 @@ config DVB_AV7110
 	  kernel image by adding the filename to the EXTRA_FIRMWARE
 	  configuration option string.
 
-	  This driver is deprecated and is scheduled for removal by
-	  the beginning of 2023. See the TODO file for more information.
-
 	  Say Y if you own such a card and want to use it.
 
 config DVB_AV7110_OSD
-	bool "AV7110 OSD support (DEPRECATED)"
+	bool "AV7110 OSD support"
 	depends on DVB_AV7110
 	default y if DVB_AV7110=y || DVB_AV7110=m
 	help
@@ -52,13 +49,10 @@ config DVB_AV7110_OSD
 	  Anyway, some popular DVB software like VDR uses this OSD to render
 	  its menus, so say Y if you want to use this software.
 
-	  This driver is deprecated and is scheduled for removal by
-	  the beginning of 2023. See the TODO file for more information.
-
 	  All other people say N.
 
 config DVB_BUDGET_PATCH
-	tristate "AV7110 cards with Budget Patch (DEPRECATED)"
+	tristate "AV7110 cards with Budget Patch"
 	depends on DVB_BUDGET_CORE && I2C
 	depends on DVB_AV7110
 	select DVB_STV0299 if MEDIA_SUBDRV_AUTOSELECT
@@ -74,9 +68,6 @@ config DVB_BUDGET_PATCH
 	  standard AV7110 driver prior to loading this
 	  driver.
 
-	  This driver is deprecated and is scheduled for removal by
-	  the beginning of 2023. See the TODO file for more information.
-
 	  Say Y if you own such a card and want to use it.
 
 	  To compile this driver as a module, choose M here: the
@@ -89,7 +80,7 @@ if DVB_AV7110
 # it if we drop support for AV7110, as no other driver will use it.
 
 config DVB_SP8870
-	tristate "Spase sp8870 based (DEPRECATED)"
+	tristate "Spase sp8870 based"
 	depends on DVB_CORE && I2C
 	default m if !MEDIA_SUBDRV_AUTOSELECT
 	help
@@ -100,7 +91,4 @@ config DVB_SP8870
 	  download/extract it, and then copy it to /usr/lib/hotplug/firmware
 	  or /lib/firmware (depending on configuration of firmware hotplug).
 
-	  This driver is deprecated and is scheduled for removal by
-	  the beginning of 2023. See the TODO file for more information.
-
 endif
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/Makefile b/drivers/staging/media/av7110/Makefile
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/Makefile
rename to drivers/staging/media/av7110/Makefile
diff --git a/drivers/staging/media/av7110/TODO b/drivers/staging/media/av7110/TODO
new file mode 100644
index 000000000000..60062d8441b3
--- /dev/null
+++ b/drivers/staging/media/av7110/TODO
@@ -0,0 +1,3 @@
+- This driver is too old and relies on a different API.
+  Drop it from Kernel on a couple of versions.
+- Cleanup patches for the drivers here won't be accepted.
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/audio-bilingual-channel-select.rst b/drivers/staging/media/av7110/audio-bilingual-channel-select.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/audio-bilingual-channel-select.rst
rename to drivers/staging/media/av7110/audio-bilingual-channel-select.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/audio-channel-select.rst b/drivers/staging/media/av7110/audio-channel-select.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/audio-channel-select.rst
rename to drivers/staging/media/av7110/audio-channel-select.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/audio-clear-buffer.rst b/drivers/staging/media/av7110/audio-clear-buffer.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/audio-clear-buffer.rst
rename to drivers/staging/media/av7110/audio-clear-buffer.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/audio-continue.rst b/drivers/staging/media/av7110/audio-continue.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/audio-continue.rst
rename to drivers/staging/media/av7110/audio-continue.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/audio-fclose.rst b/drivers/staging/media/av7110/audio-fclose.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/audio-fclose.rst
rename to drivers/staging/media/av7110/audio-fclose.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/audio-fopen.rst b/drivers/staging/media/av7110/audio-fopen.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/audio-fopen.rst
rename to drivers/staging/media/av7110/audio-fopen.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/audio-fwrite.rst b/drivers/staging/media/av7110/audio-fwrite.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/audio-fwrite.rst
rename to drivers/staging/media/av7110/audio-fwrite.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/audio-get-capabilities.rst b/drivers/staging/media/av7110/audio-get-capabilities.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/audio-get-capabilities.rst
rename to drivers/staging/media/av7110/audio-get-capabilities.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/audio-get-status.rst b/drivers/staging/media/av7110/audio-get-status.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/audio-get-status.rst
rename to drivers/staging/media/av7110/audio-get-status.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/audio-pause.rst b/drivers/staging/media/av7110/audio-pause.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/audio-pause.rst
rename to drivers/staging/media/av7110/audio-pause.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/audio-play.rst b/drivers/staging/media/av7110/audio-play.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/audio-play.rst
rename to drivers/staging/media/av7110/audio-play.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/audio-select-source.rst b/drivers/staging/media/av7110/audio-select-source.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/audio-select-source.rst
rename to drivers/staging/media/av7110/audio-select-source.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/audio-set-av-sync.rst b/drivers/staging/media/av7110/audio-set-av-sync.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/audio-set-av-sync.rst
rename to drivers/staging/media/av7110/audio-set-av-sync.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/audio-set-bypass-mode.rst b/drivers/staging/media/av7110/audio-set-bypass-mode.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/audio-set-bypass-mode.rst
rename to drivers/staging/media/av7110/audio-set-bypass-mode.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/audio-set-id.rst b/drivers/staging/media/av7110/audio-set-id.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/audio-set-id.rst
rename to drivers/staging/media/av7110/audio-set-id.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/audio-set-mixer.rst b/drivers/staging/media/av7110/audio-set-mixer.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/audio-set-mixer.rst
rename to drivers/staging/media/av7110/audio-set-mixer.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/audio-set-mute.rst b/drivers/staging/media/av7110/audio-set-mute.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/audio-set-mute.rst
rename to drivers/staging/media/av7110/audio-set-mute.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/audio-set-streamtype.rst b/drivers/staging/media/av7110/audio-set-streamtype.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/audio-set-streamtype.rst
rename to drivers/staging/media/av7110/audio-set-streamtype.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/audio-stop.rst b/drivers/staging/media/av7110/audio-stop.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/audio-stop.rst
rename to drivers/staging/media/av7110/audio-stop.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/audio.rst b/drivers/staging/media/av7110/audio.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/audio.rst
rename to drivers/staging/media/av7110/audio.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/audio_data_types.rst b/drivers/staging/media/av7110/audio_data_types.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/audio_data_types.rst
rename to drivers/staging/media/av7110/audio_data_types.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/audio_function_calls.rst b/drivers/staging/media/av7110/audio_function_calls.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/audio_function_calls.rst
rename to drivers/staging/media/av7110/audio_function_calls.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/av7110.c
rename to drivers/staging/media/av7110/av7110.c
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/av7110.h b/drivers/staging/media/av7110/av7110.h
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/av7110.h
rename to drivers/staging/media/av7110/av7110.h
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/av7110_av.c
rename to drivers/staging/media/av7110/av7110_av.c
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/av7110_av.h b/drivers/staging/media/av7110/av7110_av.h
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/av7110_av.h
rename to drivers/staging/media/av7110/av7110_av.h
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/av7110_ca.c b/drivers/staging/media/av7110/av7110_ca.c
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/av7110_ca.c
rename to drivers/staging/media/av7110/av7110_ca.c
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/av7110_ca.h b/drivers/staging/media/av7110/av7110_ca.h
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/av7110_ca.h
rename to drivers/staging/media/av7110/av7110_ca.h
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/av7110_hw.c b/drivers/staging/media/av7110/av7110_hw.c
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/av7110_hw.c
rename to drivers/staging/media/av7110/av7110_hw.c
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/av7110_hw.h b/drivers/staging/media/av7110/av7110_hw.h
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/av7110_hw.h
rename to drivers/staging/media/av7110/av7110_hw.h
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/av7110_ipack.c b/drivers/staging/media/av7110/av7110_ipack.c
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/av7110_ipack.c
rename to drivers/staging/media/av7110/av7110_ipack.c
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/av7110_ipack.h b/drivers/staging/media/av7110/av7110_ipack.h
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/av7110_ipack.h
rename to drivers/staging/media/av7110/av7110_ipack.h
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/av7110_ir.c b/drivers/staging/media/av7110/av7110_ir.c
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/av7110_ir.c
rename to drivers/staging/media/av7110/av7110_ir.c
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/av7110_v4l.c b/drivers/staging/media/av7110/av7110_v4l.c
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/av7110_v4l.c
rename to drivers/staging/media/av7110/av7110_v4l.c
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/budget-patch.c b/drivers/staging/media/av7110/budget-patch.c
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/budget-patch.c
rename to drivers/staging/media/av7110/budget-patch.c
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/dvb_filter.c b/drivers/staging/media/av7110/dvb_filter.c
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/dvb_filter.c
rename to drivers/staging/media/av7110/dvb_filter.c
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/dvb_filter.h b/drivers/staging/media/av7110/dvb_filter.h
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/dvb_filter.h
rename to drivers/staging/media/av7110/dvb_filter.h
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/sp8870.c b/drivers/staging/media/av7110/sp8870.c
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/sp8870.c
rename to drivers/staging/media/av7110/sp8870.c
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/sp8870.h b/drivers/staging/media/av7110/sp8870.h
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/sp8870.h
rename to drivers/staging/media/av7110/sp8870.h
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/video-clear-buffer.rst b/drivers/staging/media/av7110/video-clear-buffer.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/video-clear-buffer.rst
rename to drivers/staging/media/av7110/video-clear-buffer.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/video-command.rst b/drivers/staging/media/av7110/video-command.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/video-command.rst
rename to drivers/staging/media/av7110/video-command.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/video-continue.rst b/drivers/staging/media/av7110/video-continue.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/video-continue.rst
rename to drivers/staging/media/av7110/video-continue.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/video-fast-forward.rst b/drivers/staging/media/av7110/video-fast-forward.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/video-fast-forward.rst
rename to drivers/staging/media/av7110/video-fast-forward.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/video-fclose.rst b/drivers/staging/media/av7110/video-fclose.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/video-fclose.rst
rename to drivers/staging/media/av7110/video-fclose.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/video-fopen.rst b/drivers/staging/media/av7110/video-fopen.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/video-fopen.rst
rename to drivers/staging/media/av7110/video-fopen.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/video-freeze.rst b/drivers/staging/media/av7110/video-freeze.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/video-freeze.rst
rename to drivers/staging/media/av7110/video-freeze.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/video-fwrite.rst b/drivers/staging/media/av7110/video-fwrite.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/video-fwrite.rst
rename to drivers/staging/media/av7110/video-fwrite.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/video-get-capabilities.rst b/drivers/staging/media/av7110/video-get-capabilities.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/video-get-capabilities.rst
rename to drivers/staging/media/av7110/video-get-capabilities.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/video-get-event.rst b/drivers/staging/media/av7110/video-get-event.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/video-get-event.rst
rename to drivers/staging/media/av7110/video-get-event.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/video-get-frame-count.rst b/drivers/staging/media/av7110/video-get-frame-count.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/video-get-frame-count.rst
rename to drivers/staging/media/av7110/video-get-frame-count.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/video-get-pts.rst b/drivers/staging/media/av7110/video-get-pts.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/video-get-pts.rst
rename to drivers/staging/media/av7110/video-get-pts.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/video-get-size.rst b/drivers/staging/media/av7110/video-get-size.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/video-get-size.rst
rename to drivers/staging/media/av7110/video-get-size.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/video-get-status.rst b/drivers/staging/media/av7110/video-get-status.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/video-get-status.rst
rename to drivers/staging/media/av7110/video-get-status.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/video-play.rst b/drivers/staging/media/av7110/video-play.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/video-play.rst
rename to drivers/staging/media/av7110/video-play.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/video-select-source.rst b/drivers/staging/media/av7110/video-select-source.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/video-select-source.rst
rename to drivers/staging/media/av7110/video-select-source.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/video-set-blank.rst b/drivers/staging/media/av7110/video-set-blank.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/video-set-blank.rst
rename to drivers/staging/media/av7110/video-set-blank.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/video-set-display-format.rst b/drivers/staging/media/av7110/video-set-display-format.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/video-set-display-format.rst
rename to drivers/staging/media/av7110/video-set-display-format.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/video-set-format.rst b/drivers/staging/media/av7110/video-set-format.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/video-set-format.rst
rename to drivers/staging/media/av7110/video-set-format.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/video-set-streamtype.rst b/drivers/staging/media/av7110/video-set-streamtype.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/video-set-streamtype.rst
rename to drivers/staging/media/av7110/video-set-streamtype.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/video-slowmotion.rst b/drivers/staging/media/av7110/video-slowmotion.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/video-slowmotion.rst
rename to drivers/staging/media/av7110/video-slowmotion.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/video-stillpicture.rst b/drivers/staging/media/av7110/video-stillpicture.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/video-stillpicture.rst
rename to drivers/staging/media/av7110/video-stillpicture.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/video-stop.rst b/drivers/staging/media/av7110/video-stop.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/video-stop.rst
rename to drivers/staging/media/av7110/video-stop.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/video-try-command.rst b/drivers/staging/media/av7110/video-try-command.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/video-try-command.rst
rename to drivers/staging/media/av7110/video-try-command.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/video.rst b/drivers/staging/media/av7110/video.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/video.rst
rename to drivers/staging/media/av7110/video.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/video_function_calls.rst b/drivers/staging/media/av7110/video_function_calls.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/video_function_calls.rst
rename to drivers/staging/media/av7110/video_function_calls.rst
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/video_types.rst b/drivers/staging/media/av7110/video_types.rst
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/av7110/video_types.rst
rename to drivers/staging/media/av7110/video_types.rst
diff --git a/drivers/staging/media/deprecated/saa7146/Kconfig b/drivers/staging/media/deprecated/saa7146/Kconfig
index 54154da79f59..d0cb52164ff8 100644
--- a/drivers/staging/media/deprecated/saa7146/Kconfig
+++ b/drivers/staging/media/deprecated/saa7146/Kconfig
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 source "drivers/staging/media/deprecated/saa7146/common/Kconfig"
-source "drivers/staging/media/deprecated/saa7146/av7110/Kconfig"
 source "drivers/staging/media/deprecated/saa7146/saa7146/Kconfig"
 source "drivers/staging/media/deprecated/saa7146/ttpci/Kconfig"
diff --git a/drivers/staging/media/deprecated/saa7146/Makefile b/drivers/staging/media/deprecated/saa7146/Makefile
index 68e7aa10c639..9d99fdedf813 100644
--- a/drivers/staging/media/deprecated/saa7146/Makefile
+++ b/drivers/staging/media/deprecated/saa7146/Makefile
@@ -1,2 +1,2 @@
  # SPDX-License-Identifier: GPL-2.0-only
-obj-y += common/ av7110/ saa7146/ ttpci/
+obj-y += common/ saa7146/ ttpci/
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/TODO b/drivers/staging/media/deprecated/saa7146/av7110/TODO
deleted file mode 100644
index 38817e04bb67..000000000000
--- a/drivers/staging/media/deprecated/saa7146/av7110/TODO
+++ /dev/null
@@ -1,9 +0,0 @@
-- This driver is too old and relies on a different API.
-  Drop it from Kernel on a couple of versions.
-- Cleanup patches for the drivers here won't be accepted.
-
-These drivers are now deprecated with the intent of
-removing them altogether by the beginning of 2023.
-
-If someone is interested in doing this work, then contact the
-linux-media mailinglist (https://linuxtv.org/lists.php).
-- 
2.39.0

