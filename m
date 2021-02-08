Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9DE9312AF4
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 07:54:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbhBHGyK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 01:54:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:57788 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229690AbhBHGyJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Feb 2021 01:54:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D6D764E6D;
        Mon,  8 Feb 2021 06:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612767208;
        bh=BR7mbpA42Dw0VjJUltevW4NRVrhtoUOnMNji/bpsGiY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ciqQGB3gd5R0tF9NgozvGTBpfS7l93130jXaPvyTsPxGPVeBaBth0tp10UTyToDVM
         Q5rqUyIzgvdfunclKp1zL3i5jmt1LNDEzO/hUdBwZScS5yw4DFxt3H8OPmsb5UcMo5
         lcCxPY/sv2MhJ3uTvADUre3Buour5q5kQZJmerWEqC+pZIRE1pbz6W2jEeWm4IiNQr
         j+QmECiD9RoPg/pA1vzNtKp3Yogtn/BDewq91E/WwcBzaO5AE0W3ab5ocQLqOBGqQw
         gjsmu+9z2NmTkaEhc2xpfjCtLcz2qDxyGUbqNWDcyzNHzhA1GRNNKNtnMC1i7298GH
         o7rDj267QZyuQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1l90QH-00826D-Kf; Mon, 08 Feb 2021 07:53:25 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-next@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH] media: i2c: fix max9271 build dependencies
Date:   Mon,  8 Feb 2021 07:53:15 +0100
Message-Id: <20210208065315.1914616-1-mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208113208.35449879@canb.auug.org.au>
References: <20210208113208.35449879@canb.auug.org.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As described on its c file, the Maxim MAX9271 GMSL serializer isn't a
self-contained driver, as MAX9271 is usually embedded in camera modules
with at least one image sensor and optional additional components,
such as uController units or ISPs/DSPs.

After chanseset a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module"),
there are now two drivers currently needing it: rdacm20 and rdacm21.

Building with allmodconfig is now causing those warnings:

	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_serial_link' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_configure_i2c' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_high_threshold' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_configure_gmsl_link' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_clear_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_enable_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_disable_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_verify_id' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_address' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_deserializer_address' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
	WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_translation' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko

Address the issue by adding a Kconfig item for it, that it is
seleced if either one of the modules that need max9271 is used.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/i2c/Kconfig  | 10 ++++++++++
 drivers/media/i2c/Makefile |  8 ++++----
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 2d3dc0d82f9e..a6802195d583 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -712,6 +712,16 @@ config VIDEO_ST_MIPID02
 	  module will be called st-mipid02.
 endmenu
 
+#
+# Camera ancillary chips
+#
+
+# MAX9271 is usually embedded in camera modules
+config VIDEO_MAX9271_SERIALIZER
+	tristate
+	default y
+	depends on VIDEO_RDACM20 || VIDEO_RDACM21
+
 #
 # V4L2 I2C drivers that are related with Camera support
 #
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 6bd22d63e1a7..63bb16e51876 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -125,10 +125,10 @@ obj-$(CONFIG_VIDEO_IMX319)	+= imx319.o
 obj-$(CONFIG_VIDEO_IMX334)	+= imx334.o
 obj-$(CONFIG_VIDEO_IMX355)	+= imx355.o
 obj-$(CONFIG_VIDEO_MAX9286)	+= max9286.o
-rdacm20-camera_module-objs	:= rdacm20.o max9271.o
-obj-$(CONFIG_VIDEO_RDACM20)	+= rdacm20-camera_module.o
-rdacm21-camera_module-objs	:= rdacm21.o max9271.o
-obj-$(CONFIG_VIDEO_RDACM21)	+= rdacm21-camera_module.o
+obj-$(CONFIG_VIDEO_RDACM20)	+= rdacm20.o
+obj-$(CONFIG_VIDEO_RDACM21)	+= rdacm21.o
 obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o
 
+obj-$(CONFIG_VIDEO_MAX9271_SERIALIZER) += max9271.o
+
 obj-$(CONFIG_SDR_MAX2175) += max2175.o
-- 
2.29.2

