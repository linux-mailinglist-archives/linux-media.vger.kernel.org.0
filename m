Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F1F71A9999
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 11:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896078AbgDOJxR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 05:53:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:46398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2895864AbgDOJtc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 05:49:32 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8E6C820784;
        Wed, 15 Apr 2020 09:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586944170;
        bh=xdz3RoKumpaxvestZt1SahUleekGW1uaan639E4vNCU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RE0X8/2tPzHLv0AIf+hdmret8Oew+SjDFG6NT5FMKAytRdI3ztwaVhNiI5dKjiKKv
         QhcdtNh6k9n1LP1MXAMoHZB2XRa+Kj8N7yH13E2uP58ZB6NqCDfWl3sABUwujp8TOI
         rOsQ0Ku+Yb+2nGsZU1pwarMj8YkJ10TBuOWcO7Kc=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOefg-006WIa-4z; Wed, 15 Apr 2020 11:49:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 4/4] media: move CEC USB drivers to a separate directory
Date:   Wed, 15 Apr 2020 11:49:27 +0200
Message-Id: <f80212298261d2779ef0a8745454b02b43514a4a.1586944045.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586944045.git.mchehab+huawei@kernel.org>
References: <cover.1586944045.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As CEC support doesn't depend on MEDIA_SUPPORT, let's
place the platform drivers outside the media menu.

As a side effect, instead of depends on	USB, drivers
just select it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/cec/Kconfig                                   | 1 +
 drivers/media/cec/Makefile                                  | 2 +-
 drivers/media/cec/usb/Kconfig                               | 6 ++++++
 drivers/media/cec/usb/Makefile                              | 6 ++++++
 drivers/media/{usb/pulse8-cec => cec/usb/pulse8}/Kconfig    | 3 ++-
 drivers/media/{usb/pulse8-cec => cec/usb/pulse8}/Makefile   | 0
 .../media/{usb/pulse8-cec => cec/usb/pulse8}/pulse8-cec.c   | 0
 .../{usb/rainshadow-cec => cec/usb/rainshadow}/Kconfig      | 3 ++-
 .../{usb/rainshadow-cec => cec/usb/rainshadow}/Makefile     | 0
 .../rainshadow-cec => cec/usb/rainshadow}/rainshadow-cec.c  | 0
 drivers/media/usb/Kconfig                                   | 6 ------
 drivers/media/usb/Makefile                                  | 2 --
 12 files changed, 18 insertions(+), 11 deletions(-)
 create mode 100644 drivers/media/cec/usb/Kconfig
 create mode 100644 drivers/media/cec/usb/Makefile
 rename drivers/media/{usb/pulse8-cec => cec/usb/pulse8}/Kconfig (91%)
 rename drivers/media/{usb/pulse8-cec => cec/usb/pulse8}/Makefile (100%)
 rename drivers/media/{usb/pulse8-cec => cec/usb/pulse8}/pulse8-cec.c (100%)
 rename drivers/media/{usb/rainshadow-cec => cec/usb/rainshadow}/Kconfig (92%)
 rename drivers/media/{usb/rainshadow-cec => cec/usb/rainshadow}/Makefile (100%)
 rename drivers/media/{usb/rainshadow-cec => cec/usb/rainshadow}/rainshadow-cec.c (100%)

diff --git a/drivers/media/cec/Kconfig b/drivers/media/cec/Kconfig
index 7b1fb70066bd..eea74b7cfa8c 100644
--- a/drivers/media/cec/Kconfig
+++ b/drivers/media/cec/Kconfig
@@ -34,4 +34,5 @@ menuconfig MEDIA_CEC_SUPPORT
 
 if MEDIA_CEC_SUPPORT
 source "drivers/media/cec/platform/Kconfig"
+source "drivers/media/cec/usb/Kconfig"
 endif
diff --git a/drivers/media/cec/Makefile b/drivers/media/cec/Makefile
index 8c6448bee386..74e80e1b3571 100644
--- a/drivers/media/cec/Makefile
+++ b/drivers/media/cec/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-y += core/ platform/
+obj-y += core/ platform/ usb/
diff --git a/drivers/media/cec/usb/Kconfig b/drivers/media/cec/usb/Kconfig
new file mode 100644
index 000000000000..d3bbef464bdb
--- /dev/null
+++ b/drivers/media/cec/usb/Kconfig
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# USB drivers
+
+source "drivers/media/cec/usb/pulse8/Kconfig"
+source "drivers/media/cec/usb/rainshadow/Kconfig"
diff --git a/drivers/media/cec/usb/Makefile b/drivers/media/cec/usb/Makefile
new file mode 100644
index 000000000000..e4183d1bfa9a
--- /dev/null
+++ b/drivers/media/cec/usb/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the CEC USB device drivers.
+#
+obj-$(CONFIG_USB_PULSE8_CEC) += pulse8/
+obj-$(CONFIG_USB_RAINSHADOW_CEC) += rainshadow/
diff --git a/drivers/media/usb/pulse8-cec/Kconfig b/drivers/media/cec/usb/pulse8/Kconfig
similarity index 91%
rename from drivers/media/usb/pulse8-cec/Kconfig
rename to drivers/media/cec/usb/pulse8/Kconfig
index e802d30dbbee..a0224ef80e6c 100644
--- a/drivers/media/usb/pulse8-cec/Kconfig
+++ b/drivers/media/cec/usb/pulse8/Kconfig
@@ -1,8 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config USB_PULSE8_CEC
 	tristate "Pulse Eight HDMI CEC"
-	depends on USB_ACM
 	select CEC_CORE
+	select USB
+	select USB_ACM
 	select SERIO
 	select SERIO_SERPORT
 	help
diff --git a/drivers/media/usb/pulse8-cec/Makefile b/drivers/media/cec/usb/pulse8/Makefile
similarity index 100%
rename from drivers/media/usb/pulse8-cec/Makefile
rename to drivers/media/cec/usb/pulse8/Makefile
diff --git a/drivers/media/usb/pulse8-cec/pulse8-cec.c b/drivers/media/cec/usb/pulse8/pulse8-cec.c
similarity index 100%
rename from drivers/media/usb/pulse8-cec/pulse8-cec.c
rename to drivers/media/cec/usb/pulse8/pulse8-cec.c
diff --git a/drivers/media/usb/rainshadow-cec/Kconfig b/drivers/media/cec/usb/rainshadow/Kconfig
similarity index 92%
rename from drivers/media/usb/rainshadow-cec/Kconfig
rename to drivers/media/cec/usb/rainshadow/Kconfig
index b481c5157d7e..c9ef2c192b17 100644
--- a/drivers/media/usb/rainshadow-cec/Kconfig
+++ b/drivers/media/cec/usb/rainshadow/Kconfig
@@ -1,8 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config USB_RAINSHADOW_CEC
 	tristate "RainShadow Tech HDMI CEC"
-	depends on USB_ACM
 	select CEC_CORE
+	select USB
+	select USB_ACM
 	select SERIO
 	select SERIO_SERPORT
 	help
diff --git a/drivers/media/usb/rainshadow-cec/Makefile b/drivers/media/cec/usb/rainshadow/Makefile
similarity index 100%
rename from drivers/media/usb/rainshadow-cec/Makefile
rename to drivers/media/cec/usb/rainshadow/Makefile
diff --git a/drivers/media/usb/rainshadow-cec/rainshadow-cec.c b/drivers/media/cec/usb/rainshadow/rainshadow-cec.c
similarity index 100%
rename from drivers/media/usb/rainshadow-cec/rainshadow-cec.c
rename to drivers/media/cec/usb/rainshadow/rainshadow-cec.c
diff --git a/drivers/media/usb/Kconfig b/drivers/media/usb/Kconfig
index bf08393e38d1..00feadb217d8 100644
--- a/drivers/media/usb/Kconfig
+++ b/drivers/media/usb/Kconfig
@@ -66,11 +66,5 @@ source "drivers/media/usb/hackrf/Kconfig"
 source "drivers/media/usb/msi2500/Kconfig"
 endif
 
-if MEDIA_CEC_SUPPORT
-	comment "USB HDMI CEC adapters"
-source "drivers/media/usb/pulse8-cec/Kconfig"
-source "drivers/media/usb/rainshadow-cec/Kconfig"
-endif
-
 endif #MEDIA_USB_SUPPORT
 endif #USB
diff --git a/drivers/media/usb/Makefile b/drivers/media/usb/Makefile
index 169aa07c97bd..3eaff3149ef4 100644
--- a/drivers/media/usb/Makefile
+++ b/drivers/media/usb/Makefile
@@ -24,5 +24,3 @@ obj-$(CONFIG_VIDEO_EM28XX) += em28xx/
 obj-$(CONFIG_VIDEO_USBTV) += usbtv/
 obj-$(CONFIG_VIDEO_GO7007) += go7007/
 obj-$(CONFIG_DVB_AS102) += as102/
-obj-$(CONFIG_USB_PULSE8_CEC) += pulse8-cec/
-obj-$(CONFIG_USB_RAINSHADOW_CEC) += rainshadow-cec/
-- 
2.25.2

