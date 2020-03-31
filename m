Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9699199503
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 13:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730700AbgCaLMa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 07:12:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:57906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730583AbgCaLMP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 07:12:15 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9CEAA21D7F;
        Tue, 31 Mar 2020 11:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585653133;
        bh=KUIQ3vcEsDJQk74mDvlDuFs/v2+UtvM3VF0y0liI1JI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PWP/sgzwrpXir5clRYwz7ol2kHgcSdAbknGRtm87us9txN19tcnZA/PPBRHIp/22k
         DuozHQXKjVX0k+c3az3NxefUdrk3273rSCzBmcZK+H9DhTIfIKMrp81WFC9OQWRPAs
         3li6iaxZ/KRYmNupLWxGBrS3JaxOv5N9+cqhizlE=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jJEoV-002bs3-Tz; Tue, 31 Mar 2020 13:12:11 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v4 28/33] media: Kconfig: place all options under a sub-menu
Date:   Tue, 31 Mar 2020 13:12:04 +0200
Message-Id: <fcc634d4576817b109a8194be871736b9e28eb9a.1585651678.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585651678.git.mchehab+huawei@kernel.org>
References: <cover.1585651678.git.mchehab+huawei@kernel.org>
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
 drivers/media/Kconfig | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index 9c1de28ef070..c95b534c5d40 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -121,12 +121,9 @@ config MEDIA_TEST_SUPPORT
 	  Say Y when you have a software defined radio device.
 endmenu # media device types
 
-comment "Multimedia core features"
 
-#
-# Video4Linux support
-#	Only enables if one of the V4L2 types (ATV, webcam, radio) is selected
-#
+menu "Media core support"
+	visible if !MEDIA_SUPPORT_FILTER
 
 comment "Video4Linux core enabled to support hybrid TV devices"
 	depends on MEDIA_HYBRID_USB || MEDIA_HYBRID_PCI
@@ -135,6 +132,9 @@ config VIDEO_DEV
 	tristate
 	prompt "Video4Linux core" if !(MEDIA_HYBRID_USB || MEDIA_HYBRID_PCI)
 	default MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT || MEDIA_PLATFORM_SUPPORT || MEDIA_TEST_SUPPORT || MEDIA_HYBRID_USB || MEDIA_HYBRID_PCI
+	help
+	  Enables the V4L2 API, used by cameras, analog TV, video grabbers,
+	  radio devices and by some input devices.
 
 config MEDIA_CONTROLLER
 	bool "Media Controller API"
@@ -158,20 +158,24 @@ config DVB_CORE
 	prompt "Digital TV core"  if !(MEDIA_HYBRID_USB || MEDIA_HYBRID_PCI)
 	depends on MEDIA_DIGITAL_TV_SUPPORT
 	depends on (I2C || I2C=n)
-	default y
 	select CRC32
-
 	help
+	  Enables the DVB API, used by Digital TV devices. Supports several
+	  standards, including DVB, ATSC, ISDB and CMDB.
 
+endmenu # Media core support
 
+#
+# Extra per-media API core functionality
 
-
+menu "Media core additional options"
 source "drivers/media/v4l2-core/Kconfig"
 source "drivers/media/mc/Kconfig"
 source "drivers/media/dvb-core/Kconfig"
 source "drivers/media/cec/Kconfig"
+endmenu
 
-comment "Media drivers"
+menu "Media drivers"
 
 comment "Drivers filtered as selected at 'Filter media drivers'"
 	depends on MEDIA_SUPPORT_FILTER
@@ -191,7 +195,9 @@ endif
 
 source "drivers/media/firewire/Kconfig"
 
-comment "Media ancillary drivers (tuners, sensors, i2c, spi, frontends)"
+endmenu
+
+menu "Media ancillary drivers (tuners, sensors, i2c, spi, frontends)"
 
 #
 # Ancillary drivers (tuners, i2c, spi, frontends)
@@ -236,4 +242,6 @@ source "drivers/media/spi/Kconfig"
 source "drivers/media/tuners/Kconfig"
 source "drivers/media/dvb-frontends/Kconfig"
 
+endmenu
+
 endif # MEDIA_SUPPORT
-- 
2.25.1

