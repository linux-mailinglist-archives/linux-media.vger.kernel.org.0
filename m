Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98CE019131F
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 15:27:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728430AbgCXO0b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 10:26:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:35810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728248AbgCXO01 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 10:26:27 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EC71921973;
        Tue, 24 Mar 2020 14:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585059986;
        bh=UlVlNM0FLSUH7YYtNY9HtjBUnh0YugA1ybPJXdnSUj4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P2+3g0q8BP9yKCyv9M1QFWlA3cCGCsnGIbxOzb7gD6L14RRBhRXDR7mnZLRUo7Bah
         tXOa6rqbi6gy/OWn5JfCzrGxJW1/EozGNYKahnmeNTOhfkZvqGLZThdljFlmG/cZlL
         Xdw+4ao8XVOJH5OZ4N5QwWfybb8F9oB+psOKnq68=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jGkVc-00267r-7h; Tue, 24 Mar 2020 15:26:24 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v2 19/20] media: Kconfig: move the position of sub-driver autoselection
Date:   Tue, 24 Mar 2020 15:26:20 +0100
Message-Id: <dc63b3f9dfa70ce47e305667381c88325472c9f5.1585059897.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1585059896.git.mchehab+huawei@kernel.org>
References: <cover.1585059896.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Let's place the sub-driver-autoselection option just below
the device filtering one, as it also controls a filter menu,
with is not even visible if !EXPERT && !EMBEDDED.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/Kconfig | 50 +++++++++++++++++++++----------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index 6c55d20458ee..81259287ffa3 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -33,6 +33,28 @@ config MEDIA_SUPPORT_FILTER
 	   needed to support media drivers will be enabled. Also, all
 	   media device drivers should be shown.
 
+config MEDIA_SUBDRV_AUTOSELECT
+	bool "Autoselect ancillary drivers (tuners, sensors, i2c, spi, frontends)"
+	depends on HAS_IOMEM
+	select I2C
+	select I2C_MUX
+	default y if MEDIA_SUPPORT_FILTER
+	help
+	  By default, a media driver auto-selects all possible ancillary
+	  devices such as tuners, sensors, video encoders/decoders and
+	  frontends, that are used by any of the supported devices.
+
+	  This is generally the right thing to do, except when there
+	  are strict constraints with regards to the kernel size,
+	  like on embedded systems.
+
+	  Use this option with care, as deselecting ancillary drivers which
+	  are, in fact, necessary will result in the lack of the needed
+	  functionality for your device (it may not tune or may not have
+	  the needed demodulators).
+
+	  If unsure say Y.
+
 menu "Media device types"
 	visible if MEDIA_SUPPORT_FILTER
 
@@ -191,40 +213,18 @@ source "drivers/media/firewire/Kconfig"
 
 endmenu
 
-menu "Media ancillary drivers (tuners, sensors, i2c, spi, frontends)"
-
 #
 # Ancillary drivers (tuners, i2c, spi, frontends)
 #
 
-config MEDIA_SUBDRV_AUTOSELECT
-	bool "Autoselect ancillary drivers (tuners, sensors, i2c, spi, frontends)"
-	depends on MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT || MEDIA_CAMERA_SUPPORT || MEDIA_SDR_SUPPORT
-	depends on HAS_IOMEM
-	select I2C
-	select I2C_MUX
-	default y if !EMBEDDED
-	help
-	  By default, a media driver auto-selects all possible ancillary
-	  devices such as tuners, sensors, video encoders/decoders and
-	  frontends, that are used by any of the supported devices.
-
-	  This is generally the right thing to do, except when there
-	  are strict constraints with regards to the kernel size,
-	  like on embedded systems.
-
-	  Use this option with care, as deselecting ancillary drivers which
-	  are, in fact, necessary will result in the lack of the needed
-	  functionality for your device (it may not tune or may not have
-	  the needed demodulators).
-
-	  If unsure say Y.
-
 config MEDIA_HIDE_ANCILLARY_SUBDRV
 	bool
 	depends on MEDIA_SUBDRV_AUTOSELECT && !COMPILE_TEST && !EXPERT
 	default y
 
+menu "Media ancillary drivers"
+	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
+
 config MEDIA_ATTACH
 	bool
 	depends on MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT || MEDIA_RADIO_SUPPORT
-- 
2.24.1

