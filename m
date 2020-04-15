Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E668B1A9A8C
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 12:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408668AbgDOKcN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 06:32:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:33650 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2408586AbgDOKbl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 06:31:41 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CEC032078A;
        Wed, 15 Apr 2020 10:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586946701;
        bh=BMCAYOBEXBk7709Ogb1+PRVp1vR+ZXuSQgMdbDqEF2A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=h2W1Sjn54RrNFoUVRrBKlgtCUYsXRqbZLyFvZJW7GegZ4bBuDl32ahqu5pnN51Bq3
         u/q6Sd+RNUQ4hNa2eYej0tc9+11DrKXQpgzhzzHmQO/iokB8abCNbEEKRllMD4diD7
         Fv7nvvMEpIu856GuaAIDuXwzySPefWyODV8VcD8Q=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOfKV-006gM7-4i; Wed, 15 Apr 2020 12:31:39 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 2/6] media: place CEC menu before MEDIA_SUPPORT
Date:   Wed, 15 Apr 2020 12:31:33 +0200
Message-Id: <32565659d6778e92bd9ac7d17622149bd95973c5.1586946605.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586946605.git.mchehab+huawei@kernel.org>
References: <cover.1586946605.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The only item that opens at the CEC Kconfig menu is related
to Remote Controller. Also, its support should not depend on
media support, so it makes sense to keep both RC and CEC together.

After this change, the main media menus that are visible
under "Device Drivers" menu are:

	<*> Remote Controller support  --->
	[ ] HDMI CEC RC integration (NEW)
	< > HDMI CEC drivers
	<M> Multimedia support  --->

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/Kconfig     | 30 ++----------------------------
 drivers/media/cec/Kconfig | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+), 28 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index e8bd354a0f75..8694e3c6d183 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -4,19 +4,10 @@
 #
 
 #
-# NOTE: Those symbols can't depend on MEDIA_SUPPORT, as it would cause
-# unmatched dependencies
+# NOTE: CEC and Remote Controller support should not depend on MEDIA_SUPPORT
 #
-config CEC_CORE
-	tristate
-
-config CEC_NOTIFIER
-	bool
-
-config CEC_PIN
-	bool
-
 source "drivers/media/rc/Kconfig"
+source "drivers/media/cec/Kconfig"
 
 menuconfig MEDIA_SUPPORT
 	tristate "Multimedia support"
@@ -132,17 +123,6 @@ config MEDIA_SDR_SUPPORT
 
 	  Say Y when you have a software defined radio device.
 
-config MEDIA_CEC_SUPPORT
-	bool
-	prompt "HDMI CEC support" if MEDIA_SUPPORT_FILTER
-	default y if !MEDIA_SUPPORT_FILTER
-	help
-	  Enable support for HDMI CEC (Consumer Electronics Control),
-	  which is an optional HDMI feature.
-
-	  Say Y when you have an HDMI receiver, transmitter or a USB CEC
-	  adapter that supports HDMI CEC.
-
 config MEDIA_PLATFORM_SUPPORT
 	bool
 	prompt "Platform-specific devices" if MEDIA_SUPPORT_FILTER
@@ -232,12 +212,6 @@ menu "Digital TV options"
 source "drivers/media/dvb-core/Kconfig"
 endmenu
 
-menu "HDMI CEC options"
-	visible if CEC_CORE
-
-source "drivers/media/cec/Kconfig"
-endmenu
-
 menu "Media drivers"
 
 comment "Drivers filtered as selected at 'Filter media drivers'"
diff --git a/drivers/media/cec/Kconfig b/drivers/media/cec/Kconfig
index c01919713ab9..1586dd899302 100644
--- a/drivers/media/cec/Kconfig
+++ b/drivers/media/cec/Kconfig
@@ -1,4 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0-only
+config CEC_CORE
+	tristate
+
+config CEC_NOTIFIER
+	bool
+
+config CEC_PIN
+	bool
+
 config MEDIA_CEC_RC
 	bool "HDMI CEC RC integration"
 	depends on CEC_CORE && RC_CORE
@@ -11,3 +20,14 @@ config CEC_PIN_ERROR_INJ
 	depends on CEC_PIN && DEBUG_FS
 	help
 	  This option enables CEC error injection using debugfs.
+
+config MEDIA_CEC_SUPPORT
+	bool
+	prompt "HDMI CEC drivers"
+	default y if !MEDIA_SUPPORT_FILTER
+	help
+	  Enable support for HDMI CEC (Consumer Electronics Control),
+	  which is an optional HDMI feature.
+
+	  Say Y when you have an HDMI receiver, transmitter or a USB CEC
+	  adapter that supports HDMI CEC.
-- 
2.25.2

