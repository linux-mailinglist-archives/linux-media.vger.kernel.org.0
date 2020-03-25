Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B214192DB6
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 17:04:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728023AbgCYQEC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 12:04:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:53256 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727912AbgCYQEB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 12:04:01 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EBF762073E;
        Wed, 25 Mar 2020 16:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585152241;
        bh=VwOGMvmFIUAOYJ5KYlw2ctCIG2B6CyiMdt0uEEwF4fI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ybJD+7vj+AZ7ucK1II6ilM7ofDTOAOe3/16v76BerCseaBAVP/DRwNtrnBhJ8NL42
         N/IJm9uWnBRBZ3l8AjTpatxw7x4vip0Ay6A4N8xD9ogldilSD64iZAWCjAy9OvDNg7
         0FpuzlovdAablCzogqRap+7O6cLdHrm8dZ8hEnkQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jH8Va-003MJJ-Nq; Wed, 25 Mar 2020 17:03:58 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 3/4] media: i2c/Kconfig: reorganize items there
Date:   Wed, 25 Mar 2020 17:03:56 +0100
Message-Id: <284ec136c43dd208023f116851fb6ece0ee01069.1585151701.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585151701.git.mchehab+huawei@kernel.org>
References: <cover.1585151701.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Right now, there are I2C drivers that don't depend on
camera support before and after those.

Move the camera support drivers to the end, and add
a notice at the "endif", in order to make easier to
maintain and to avoid adding extra dependencies at
the other i2c/*/Kconfig files.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/i2c/Kconfig | 218 +++++++++++++++++++-------------------
 1 file changed, 107 insertions(+), 111 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 4bc4cfea2f20..efd12bf4f8eb 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -581,6 +581,113 @@ config VIDEO_THS8200
 	  To compile this driver as a module, choose M here: the
 	  module will be called ths8200.
 
+comment "Video improvement chips"
+
+config VIDEO_UPD64031A
+	tristate "NEC Electronics uPD64031A Ghost Reduction"
+	depends on VIDEO_V4L2 && I2C
+	help
+	  Support for the NEC Electronics uPD64031A Ghost Reduction
+	  video chip. It is most often found in NTSC TV cards made for
+	  Japan and is used to reduce the 'ghosting' effect that can
+	  be present in analog TV broadcasts.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called upd64031a.
+
+config VIDEO_UPD64083
+	tristate "NEC Electronics uPD64083 3-Dimensional Y/C separation"
+	depends on VIDEO_V4L2 && I2C
+	help
+	  Support for the NEC Electronics uPD64083 3-Dimensional Y/C
+	  separation video chip. It is used to improve the quality of
+	  the colors of a composite signal.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called upd64083.
+
+comment "Audio/Video compression chips"
+
+config VIDEO_SAA6752HS
+	tristate "Philips SAA6752HS MPEG-2 Audio/Video Encoder"
+	depends on VIDEO_V4L2 && I2C
+	select CRC32
+	help
+	  Support for the Philips SAA6752HS MPEG-2 video and MPEG-audio/AC-3
+	  audio encoder with multiplexer.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called saa6752hs.
+
+comment "SDR tuner chips"
+
+config SDR_MAX2175
+	tristate "Maxim 2175 RF to Bits tuner"
+	depends on VIDEO_V4L2 && MEDIA_SDR_SUPPORT && I2C
+	select REGMAP_I2C
+	help
+	  Support for Maxim 2175 tuner. It is an advanced analog/digital
+	  radio receiver with RF-to-Bits front-end designed for SDR solutions.
+
+	  To compile this driver as a module, choose M here; the
+	  module will be called max2175.
+
+comment "Miscellaneous helper chips"
+
+config VIDEO_THS7303
+	tristate "THS7303/53 Video Amplifier"
+	depends on VIDEO_V4L2 && I2C
+	help
+	  Support for TI THS7303/53 video amplifier
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called ths7303.
+
+config VIDEO_M52790
+	tristate "Mitsubishi M52790 A/V switch"
+	depends on VIDEO_V4L2 && I2C
+	help
+	 Support for the Mitsubishi M52790 A/V switch.
+
+	 To compile this driver as a module, choose M here: the
+	 module will be called m52790.
+
+config VIDEO_I2C
+	tristate "I2C transport video support"
+	depends on VIDEO_V4L2 && I2C
+	select VIDEOBUF2_VMALLOC
+	imply HWMON
+	help
+	  Enable the I2C transport video support which supports the
+	  following:
+	   * Panasonic AMG88xx Grid-Eye Sensors
+	   * Melexis MLX90640 Thermal Cameras
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called video-i2c
+
+config VIDEO_ST_MIPID02
+	tristate "STMicroelectronics MIPID02 CSI-2 to PARALLEL bridge"
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	select V4L2_FWNODE
+	help
+	  Support for STMicroelectronics MIPID02 CSI-2 to PARALLEL bridge.
+	  It is used to allow usage of CSI-2 sensor with PARALLEL port
+	  controller.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called st-mipid02.
+
+endmenu
+
+#
+# All drivers that are related to Media Camera Support should be here
+#
+
+if MEDIA_CAMERA_SUPPORT
+
 comment "Camera sensor devices"
 
 config VIDEO_APTINA_PLL
@@ -589,12 +696,6 @@ config VIDEO_APTINA_PLL
 config VIDEO_SMIAPP_PLL
 	tristate
 
-#
-# All drivers that are related to Media Camera Support should be here
-#
-
-if MEDIA_CAMERA_SUPPORT
-
 config VIDEO_HI556
 	tristate "Hynix Hi-556 sensor support"
 	depends on I2C && VIDEO_V4L2
@@ -1162,109 +1263,4 @@ config VIDEO_LM3646
 
 endif # MEDIA_CAMERA_SUPPORT
 
-#
-# Other V4L2 drivers that aren't related with Camera support
-#
-
-comment "Video improvement chips"
-
-config VIDEO_UPD64031A
-	tristate "NEC Electronics uPD64031A Ghost Reduction"
-	depends on VIDEO_V4L2 && I2C
-	help
-	  Support for the NEC Electronics uPD64031A Ghost Reduction
-	  video chip. It is most often found in NTSC TV cards made for
-	  Japan and is used to reduce the 'ghosting' effect that can
-	  be present in analog TV broadcasts.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called upd64031a.
-
-config VIDEO_UPD64083
-	tristate "NEC Electronics uPD64083 3-Dimensional Y/C separation"
-	depends on VIDEO_V4L2 && I2C
-	help
-	  Support for the NEC Electronics uPD64083 3-Dimensional Y/C
-	  separation video chip. It is used to improve the quality of
-	  the colors of a composite signal.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called upd64083.
-
-comment "Audio/Video compression chips"
-
-config VIDEO_SAA6752HS
-	tristate "Philips SAA6752HS MPEG-2 Audio/Video Encoder"
-	depends on VIDEO_V4L2 && I2C
-	select CRC32
-	help
-	  Support for the Philips SAA6752HS MPEG-2 video and MPEG-audio/AC-3
-	  audio encoder with multiplexer.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called saa6752hs.
-
-comment "SDR tuner chips"
-
-config SDR_MAX2175
-	tristate "Maxim 2175 RF to Bits tuner"
-	depends on VIDEO_V4L2 && MEDIA_SDR_SUPPORT && I2C
-	select REGMAP_I2C
-	help
-	  Support for Maxim 2175 tuner. It is an advanced analog/digital
-	  radio receiver with RF-to-Bits front-end designed for SDR solutions.
-
-	  To compile this driver as a module, choose M here; the
-	  module will be called max2175.
-
-comment "Miscellaneous helper chips"
-
-config VIDEO_THS7303
-	tristate "THS7303/53 Video Amplifier"
-	depends on VIDEO_V4L2 && I2C
-	help
-	  Support for TI THS7303/53 video amplifier
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called ths7303.
-
-config VIDEO_M52790
-	tristate "Mitsubishi M52790 A/V switch"
-	depends on VIDEO_V4L2 && I2C
-	help
-	 Support for the Mitsubishi M52790 A/V switch.
-
-	 To compile this driver as a module, choose M here: the
-	 module will be called m52790.
-
-config VIDEO_I2C
-	tristate "I2C transport video support"
-	depends on VIDEO_V4L2 && I2C
-	select VIDEOBUF2_VMALLOC
-	imply HWMON
-	help
-	  Enable the I2C transport video support which supports the
-	  following:
-	   * Panasonic AMG88xx Grid-Eye Sensors
-	   * Melexis MLX90640 Thermal Cameras
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called video-i2c
-
-config VIDEO_ST_MIPID02
-	tristate "STMicroelectronics MIPID02 CSI-2 to PARALLEL bridge"
-	depends on I2C && VIDEO_V4L2
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
-	help
-	  Support for STMicroelectronics MIPID02 CSI-2 to PARALLEL bridge.
-	  It is used to allow usage of CSI-2 sensor with PARALLEL port
-	  controller.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called st-mipid02.
-
-endmenu
-
 endif # VIDEO_V4L2
-- 
2.25.1

