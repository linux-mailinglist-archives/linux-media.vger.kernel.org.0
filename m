Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2D9C20077A
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 13:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732461AbgFSLG1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 07:06:27 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:40903 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732438AbgFSLG0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 07:06:26 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 0D56E60002;
        Fri, 19 Jun 2020 11:06:22 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org
Subject: [PATCH] media: i2c: Kconfig: imx214: select V4L2_FWNODE'
Date:   Fri, 19 Jun 2020 13:09:40 +0200
Message-Id: <20200619110940.164789-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jacopo Mondi <jacopo+renesas@jmondi.org>

After the recent conversion of the media build infrastructure to select
V4L2 components instead of depending on their presence, which took place
in:
32a363d0b0b14 ("media: Kconfig files: use select for V4L2 subdevs and MC")

imx214 stands out as being the (only?) media I2C driver that still depends
on a V4L2 core symbol instead of selecting it.

This confuses the build system which claims it has detected a circular
dependency when other drivers select the same symbol as the imx214
driver does.

drivers/media/i2c/Kconfig:728:error: recursive dependency detected!
drivers/media/i2c/Kconfig:728:	symbol VIDEO_IMX214 depends on V4L2_FWNODE
drivers/media/v4l2-core/Kconfig:71:	symbol V4L2_FWNODE is selected by VIDEO_BCM2835_UNICAM
drivers/media/platform/bcm2835/Kconfig:3:	symbol VIDEO_BCM2835_UNICAM depends on VIDEO_V4L2_SUBDEV_API
drivers/media/v4l2-core/Kconfig:19:	symbol VIDEO_V4L2_SUBDEV_API depends on MEDIA_CONTROLLER
drivers/media/Kconfig:168:	symbol MEDIA_CONTROLLER is selected by VIDEO_IMX214

Fix this by making the imx214 driver select V4L2_FWNODE instead of
depending on it and align it with all the other drivers.

Fixes: 32a363d0b0b14 ("media: Kconfig files: use select for V4L2 subdevs and MC")
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index da11036ad804d..6b1a6851ccb0b 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -728,7 +728,7 @@ config VIDEO_HI556
 config VIDEO_IMX214
 	tristate "Sony IMX214 sensor support"
 	depends on GPIOLIB && I2C && VIDEO_V4L2
-	depends on V4L2_FWNODE
+	select V4L2_FWNODE
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select REGMAP_I2C
--
2.27.0

