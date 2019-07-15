Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E85469DF4
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 23:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731555AbfGOVYN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 17:24:13 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52814 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730076AbfGOVYM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 17:24:12 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id E56E328B679
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com, linux-media@vger.kernel.org,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 2/2] media: Don't hide any menu if "ancillary drivers autoselect" is enabled
Date:   Mon, 15 Jul 2019 18:23:16 -0300
Message-Id: <20190715212316.352-3-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212316.352-1-ezequiel@collabora.com>
References: <20190715212316.352-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Many users have been complaining about not being able to find
certain menu options. One such example are camera sensor drivers
(e.g IMX219, OV5645, etc) which are common on embedded platforms
and not always ancillary devices.

The problem with MEDIA_SUBDRV_AUTOSELECT seems to be related
to the fact that it uses the "visible" kbuild syntax to hide
entire group of drivers.

This is not obvious and, as explained above, not always desired.

To fix the problem, drop the "visible" and stop hiding any menu
options. Users skilled enough to configure their kernel are expected
to be skilled enough to know what (not) to configure anyway.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/dvb-frontends/Kconfig | 1 -
 drivers/media/i2c/Kconfig           | 1 -
 drivers/media/spi/Kconfig           | 1 -
 drivers/media/tuners/Kconfig        | 1 -
 4 files changed, 4 deletions(-)

diff --git a/drivers/media/dvb-frontends/Kconfig b/drivers/media/dvb-frontends/Kconfig
index dc43749177df..2d1fea3bf546 100644
--- a/drivers/media/dvb-frontends/Kconfig
+++ b/drivers/media/dvb-frontends/Kconfig
@@ -1,5 +1,4 @@
 menu "Customise DVB Frontends"
-	visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT
 
 comment "Multistandard (satellite) frontends"
 	depends on DVB_CORE
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 79ce9ec6fc1b..475072bb67d6 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -23,7 +23,6 @@ config VIDEO_IR_I2C
 #
 
 menu "I2C Encoders, decoders, sensors and other helper chips"
-	visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT
 
 comment "Audio decoders, processors and mixers"
 
diff --git a/drivers/media/spi/Kconfig b/drivers/media/spi/Kconfig
index 08386abb9bbc..d94921fe3db5 100644
--- a/drivers/media/spi/Kconfig
+++ b/drivers/media/spi/Kconfig
@@ -2,7 +2,6 @@
 if VIDEO_V4L2
 
 menu "SPI helper chips"
-	visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT
 
 config VIDEO_GS1662
 	tristate "Gennum Serializers video"
diff --git a/drivers/media/tuners/Kconfig b/drivers/media/tuners/Kconfig
index a7108e575e9b..01212df505ae 100644
--- a/drivers/media/tuners/Kconfig
+++ b/drivers/media/tuners/Kconfig
@@ -16,7 +16,6 @@ config MEDIA_TUNER
 	select MEDIA_TUNER_MC44S803 if MEDIA_SUBDRV_AUTOSELECT
 
 menu "Customize TV tuners"
-	visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT
 	depends on MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT
 
 config MEDIA_TUNER_SIMPLE
-- 
2.22.0

