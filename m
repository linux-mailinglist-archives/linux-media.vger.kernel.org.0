Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82E07778F3
	for <lists+linux-media@lfdr.de>; Sat, 27 Jul 2019 15:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387656AbfG0Nbn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Jul 2019 09:31:43 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40246 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387514AbfG0Nbn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Jul 2019 09:31:43 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 064AC26B072
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH] media: Clarify how menus are hidden by SUBDRV_AUTOSELECT
Date:   Sat, 27 Jul 2019 10:31:29 -0300
Message-Id: <20190727133129.18468-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some users have been having a hard time finding the hidden
menus. A typically case are camera sensor drivers
(e.g IMX219, OV5645, etc), which are common on embedded
platforms and not really "ancillary" devices.

The problem with MEDIA_SUBDRV_AUTOSELECT seems to be related
to the fact that it uses the "visible" syntax to hide
the menus.

This is not obvious and it normally takes some time to
figure out.

To fix the problem, add a comment on each of hidden menus,
which should clarify what option is causing menus to be hidden.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/Kconfig               | 5 +++++
 drivers/media/dvb-frontends/Kconfig | 5 ++++-
 drivers/media/i2c/Kconfig           | 5 ++++-
 drivers/media/spi/Kconfig           | 5 ++++-
 drivers/media/tuners/Kconfig        | 6 +++++-
 5 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index 8404e80aa38e..b36a41332867 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -207,6 +207,11 @@ config MEDIA_SUBDRV_AUTOSELECT
 
 	  If unsure say Y.
 
+config MEDIA_HIDE_ANCILLARY_SUBDRV
+        bool
+        depends on MEDIA_SUBDRV_AUTOSELECT && !COMPILE_TEST && !EXPERT
+        default y
+
 config MEDIA_ATTACH
 	bool
 	depends on MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT || MEDIA_RADIO_SUPPORT
diff --git a/drivers/media/dvb-frontends/Kconfig b/drivers/media/dvb-frontends/Kconfig
index dc43749177df..a29e9ddf9c82 100644
--- a/drivers/media/dvb-frontends/Kconfig
+++ b/drivers/media/dvb-frontends/Kconfig
@@ -1,5 +1,8 @@
+comment "DVB Frontend drivers hidden by 'Autoselect ancillary drivers'"
+	depends on MEDIA_HIDE_ANCILLARY_SUBDRV
+
 menu "Customise DVB Frontends"
-	visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT
+	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
 
 comment "Multistandard (satellite) frontends"
 	depends on DVB_CORE
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 79ce9ec6fc1b..1f72eafa7d1a 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -22,8 +22,11 @@ config VIDEO_IR_I2C
 # Encoder / Decoder module configuration
 #
 
+comment "I2C drivers hidden by 'Autoselect ancillary drivers'"
+	depends on MEDIA_HIDE_ANCILLARY_SUBDRV
+
 menu "I2C Encoders, decoders, sensors and other helper chips"
-	visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT
+	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
 
 comment "Audio decoders, processors and mixers"
 
diff --git a/drivers/media/spi/Kconfig b/drivers/media/spi/Kconfig
index 08386abb9bbc..bcc49cb47de6 100644
--- a/drivers/media/spi/Kconfig
+++ b/drivers/media/spi/Kconfig
@@ -1,8 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
 if VIDEO_V4L2
 
+comment "SPI drivers hidden by 'Autoselect ancillary drivers'"
+	depends on MEDIA_HIDE_ANCILLARY_SUBDRV
+
 menu "SPI helper chips"
-	visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT
+	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
 
 config VIDEO_GS1662
 	tristate "Gennum Serializers video"
diff --git a/drivers/media/tuners/Kconfig b/drivers/media/tuners/Kconfig
index a7108e575e9b..e104bb7766e1 100644
--- a/drivers/media/tuners/Kconfig
+++ b/drivers/media/tuners/Kconfig
@@ -15,8 +15,12 @@ config MEDIA_TUNER
 	select MEDIA_TUNER_TDA9887 if MEDIA_SUBDRV_AUTOSELECT
 	select MEDIA_TUNER_MC44S803 if MEDIA_SUBDRV_AUTOSELECT
 
+comment "Tuner drivers hidden by 'Autoselect ancillary drivers'"
+	depends on MEDIA_HIDE_ANCILLARY_SUBDRV
+	depends on MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT
+
 menu "Customize TV tuners"
-	visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT
+	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
 	depends on MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT
 
 config MEDIA_TUNER_SIMPLE
-- 
2.22.0

