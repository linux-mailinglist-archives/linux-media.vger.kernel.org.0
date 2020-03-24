Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2572119131E
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 15:27:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728249AbgCXO0a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 10:26:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:35832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728224AbgCXO01 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 10:26:27 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E429821927;
        Tue, 24 Mar 2020 14:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585059986;
        bh=oSsb+HN55pEmPfT+clNvUwcyNluPUo3+cd4CjUseYKo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XQspI4/GUWC57HDEi4kc7G8lOmzKMvC+tIu6V8hOzBACbS/WfiNzhn5Dk9is66W5F
         udumSTrak+I25S72IJsuhQi6xa5sAT27ULzfUqTOYallAYbCZ5+VlrgbwLxXBnXZ7f
         17XNeUCUUUYxxiXwfH/QiZDXV5JZo7HAhlenzBcM=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jGkVc-00267m-6e; Tue, 24 Mar 2020 15:26:24 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v2 18/20] media: Kconfig: place all options under a sub-menu
Date:   Tue, 24 Mar 2020 15:26:19 +0100
Message-Id: <967506cc001ad7f194ee24e823a398c293b352ab.1585059897.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1585059896.git.mchehab+huawei@kernel.org>
References: <cover.1585059896.git.mchehab+huawei@kernel.org>
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
index 026a1151273c..6c55d20458ee 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -124,48 +124,49 @@ config MEDIA_TEST_SUPPORT
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
 	default MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT || V4L_PLATFORM_DRIVERS
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
 
 #
 # V4L platform/mem2mem drivers
@@ -188,7 +189,9 @@ endif # MEDIA_EMBEDDED_SUPPORT
 
 source "drivers/media/firewire/Kconfig"
 
-comment "Media ancillary drivers (tuners, sensors, i2c, spi, frontends)"
+endmenu
+
+menu "Media ancillary drivers (tuners, sensors, i2c, spi, frontends)"
 
 #
 # Ancillary drivers (tuners, i2c, spi, frontends)
@@ -233,4 +236,6 @@ source "drivers/media/spi/Kconfig"
 source "drivers/media/tuners/Kconfig"
 source "drivers/media/dvb-frontends/Kconfig"
 
+endmenu
+
 endif # MEDIA_SUPPORT
-- 
2.24.1

