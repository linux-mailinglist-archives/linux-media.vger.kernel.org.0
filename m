Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87D5F1924A0
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 10:50:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727547AbgCYJtq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 05:49:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:51370 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727473AbgCYJtl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 05:49:41 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3D8D720CC7;
        Wed, 25 Mar 2020 09:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585129780;
        bh=uRg4SKFhZlTru+GRvz9lGoRpXT4EWwkNy/YzQb/0k3w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u2srnqnE8iwKWJAS6KzUI6qbaUXiiEiVxQ0GleULcY1Ow/0NgfyosnM5HB4i0Ilws
         3ou6ljw1bwLLBK3/36jWxxPbzb9W8709or+Gte/I6CO/RUBXV8GorvHicSXMsLbpBm
         JJxFJ2GlwLYPxrLIbgOYa0ehpA91o7N1tlWngZKo=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jH2fK-003HUS-Hz; Wed, 25 Mar 2020 10:49:38 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v3 18/22] media: Kconfig: place all options under a sub-menu
Date:   Wed, 25 Mar 2020 10:49:32 +0100
Message-Id: <44943596ff8a59356727ffb344db695a47fff6c0.1585129041.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585129041.git.mchehab+huawei@kernel.org>
References: <cover.1585129041.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

That should make easier for people setting the media
subsystem config options, as they'll be split by the
type of functionality that will be enabled.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/Kconfig | 43 ++++++++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index ad9636692183..a8cda10b506c 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -128,48 +128,49 @@ config MEDIA_TEST_SUPPORT
 	  Say Y when you have a software defined radio device.
 endmenu # media device types
 
-comment "Media core options"
-
-#
-# Video4Linux support
-#	Only enables if one of the V4L2 types (ATV, webcam, radio) is selected
-#
+menu "Media core support"
+	visible if !MEDIA_SUPPORT_FILTER
 
 config VIDEO_DEV
-	tristate
+	tristate "Video4Linux core"
 	depends on MEDIA_SUPPORT
 	default MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT || MEDIA_PLATFORM_SUPPORT
+	help
+	  Enables the V4L2 API, used by cameras, analog TV, video grabbers,
+	  radio devices and by some input devices.
 
 config MEDIA_CONTROLLER
 	bool "Media Controller API"
-	depends on MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT
+	default MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT || MEDIA_EMBEDDED_SUPPORT
 	help
 	  Enable the media controller API used to query media devices internal
 	  topology and configure it dynamically.
 
 	  This API is mostly used by camera interfaces in embedded platforms.
 
-#
-# DVB Core
-#	Only enables if one of DTV is selected
-#
-
 config DVB_CORE
-	tristate
+	tristate "Digital TV core"
 	depends on MEDIA_SUPPORT
-	depends on MEDIA_DIGITAL_TV_SUPPORT
+	default MEDIA_DIGITAL_TV_SUPPORT
 	depends on (I2C || I2C=n)
-	default y
 	select CRC32
-
 	help
+	  Enables the DVB API, used by Digital TV devices. Supports several
+	  standards, including DVB, ATSC, ISDB and CMDB.
 
+endmenu # Media core support
+
+#
+# Extra per-media API core functionality
+
+menu "Media core additional options"
 source "drivers/media/v4l2-core/Kconfig"
 source "drivers/media/mc/Kconfig"
 source "drivers/media/dvb-core/Kconfig"
 source "drivers/media/cec/Kconfig"
+endmenu
 
-comment "Media drivers"
+menu "Media drivers"
 
 source "drivers/media/usb/Kconfig"
 source "drivers/media/pci/Kconfig"
@@ -187,7 +188,9 @@ endif
 
 source "drivers/media/firewire/Kconfig"
 
-comment "Media ancillary drivers (tuners, sensors, i2c, spi, frontends)"
+endmenu
+
+menu "Media ancillary drivers (tuners, sensors, i2c, spi, frontends)"
 
 #
 # Ancillary drivers (tuners, i2c, spi, frontends)
@@ -232,4 +235,6 @@ source "drivers/media/spi/Kconfig"
 source "drivers/media/tuners/Kconfig"
 source "drivers/media/dvb-frontends/Kconfig"
 
+endmenu
+
 endif # MEDIA_SUPPORT
-- 
2.25.1

