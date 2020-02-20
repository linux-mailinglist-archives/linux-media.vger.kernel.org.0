Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FD19165D6F
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2020 13:20:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727789AbgBTMUi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Feb 2020 07:20:38 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:57373 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727747AbgBTMUi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Feb 2020 07:20:38 -0500
Received: from [IPv6:2001:420:44c1:2577:ac15:94e:5ea0:8199]
 ([IPv6:2001:420:44c1:2577:ac15:94e:5ea0:8199])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 4koijY0b4jmHT4koljJV0T; Thu, 20 Feb 2020 13:20:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582201235; bh=+ZHo0x3SUOGvQ3UEiunAj3S5CJspUiNolr84ISmYpMg=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=LiuCojcZ6Z8BAmaRpT1Ig5v0Q53hMohqlTkQqHBzpSozcJ0SDFFc2Kr0C8Y4fbYTu
         nOzsYFZXiOxH0erSbkU4EuxmSru8bwTR82FRPaopSAEvED7i/qB8gC6Xfc7w3qHSUZ
         HIRzg8NvpEjm0u8zA52AHwzWkzr81aG21/Dav92ojOor7YpJ2t2L/1EVJojaZXcjYw
         2yZZdktxAGkM/HpQBV3zn6usm3603zDKt3eV/vuq+CGsLYqmbtCKglVRrqzE9BtqWM
         xrKk8CMqZoE90VfjowkbIGViyRvZvJ83s3a+Vnp1cXukbeqIp0uLL5Lrgnvu8zWfW2
         EQrKXHejflw+g==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] usbvision: deprecate driver
Message-ID: <8b915159-6beb-a033-307a-b44e7481187b@xs4all.nl>
Date:   Thu, 20 Feb 2020 13:20:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFX1gm8mnwMjhthV73bC1u6xSN/J97aRibP6LC7nXMlVK91aMMybqL0BCbM3Qh32+EGq5G+4LxMvdlraZklw3oTVvFicrvQVyupYjvrxs5y50lRSCzt7
 5t0gbk9rAcb9jS6bNwg3wCDxu+Rk+Wd8VmQuHXoQADClqjLo1rBbovx8ysSFGmmuZ4GbFTVZxXRgU4F9JfKHqauOp/kTTEL1ZNmuwNGLKVDLjY6nhrwBSRBE
 s8/LcId15Gru9Zc8srmIJVlcI2AUNV3i6loKimjDG1piY1s3xFiWmvwaLz8GEeIG
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver is deprecated and scheduled for removal by the end
of 2020. The reason is that this driver is for old and obsolete
hardware, and it produces a continuous stream of syzbot errors due
to poor code.

In order to prevent removal the following actions would have to
be taken:

- clean up the code
- convert to the vb2 framework
- fix the disconnect and free-on-last-user handling (i.e., add
  a release callback for struct v4l2_device and rework the code
  to use that correctly).

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 MAINTAINERS                                           |  2 +-
 drivers/media/usb/Kconfig                             |  1 -
 drivers/media/usb/Makefile                            |  1 -
 drivers/staging/media/Kconfig                         |  4 ++++
 drivers/staging/media/Makefile                        |  1 +
 .../{media/usb => staging/media}/usbvision/Kconfig    |  7 ++++++-
 .../{media/usb => staging/media}/usbvision/Makefile   |  0
 drivers/staging/media/usbvision/TODO                  | 11 +++++++++++
 .../usb => staging/media}/usbvision/usbvision-cards.c |  0
 .../usb => staging/media}/usbvision/usbvision-cards.h |  0
 .../usb => staging/media}/usbvision/usbvision-core.c  |  0
 .../usb => staging/media}/usbvision/usbvision-i2c.c   |  0
 .../usb => staging/media}/usbvision/usbvision-video.c |  0
 .../usb => staging/media}/usbvision/usbvision.h       |  0
 14 files changed, 23 insertions(+), 4 deletions(-)
 rename drivers/{media/usb => staging/media}/usbvision/Kconfig (57%)
 rename drivers/{media/usb => staging/media}/usbvision/Makefile (100%)
 create mode 100644 drivers/staging/media/usbvision/TODO
 rename drivers/{media/usb => staging/media}/usbvision/usbvision-cards.c (100%)
 rename drivers/{media/usb => staging/media}/usbvision/usbvision-cards.h (100%)
 rename drivers/{media/usb => staging/media}/usbvision/usbvision-core.c (100%)
 rename drivers/{media/usb => staging/media}/usbvision/usbvision-i2c.c (100%)
 rename drivers/{media/usb => staging/media}/usbvision/usbvision-video.c (100%)
 rename drivers/{media/usb => staging/media}/usbvision/usbvision.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 38fe2f3f7b6f..5a976815a0a4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17444,7 +17444,7 @@ L:	linux-media@vger.kernel.org
 T:	git git://linuxtv.org/media_tree.git
 W:	https://linuxtv.org
 S:	Odd Fixes
-F:	drivers/media/usb/usbvision/
+F:	drivers/staging/media/usbvision/

 USB WEBCAM GADGET
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
diff --git a/drivers/media/usb/Kconfig b/drivers/media/usb/Kconfig
index 03c2944f6273..e678d3d11467 100644
--- a/drivers/media/usb/Kconfig
+++ b/drivers/media/usb/Kconfig
@@ -25,7 +25,6 @@ if MEDIA_ANALOG_TV_SUPPORT
 	comment "Analog TV USB devices"
 source "drivers/media/usb/pvrusb2/Kconfig"
 source "drivers/media/usb/hdpvr/Kconfig"
-source "drivers/media/usb/usbvision/Kconfig"
 source "drivers/media/usb/stk1160/Kconfig"
 source "drivers/media/usb/go7007/Kconfig"
 endif
diff --git a/drivers/media/usb/Makefile b/drivers/media/usb/Makefile
index 21e46b10caa5..169aa07c97bd 100644
--- a/drivers/media/usb/Makefile
+++ b/drivers/media/usb/Makefile
@@ -17,7 +17,6 @@ obj-$(CONFIG_VIDEO_CPIA2) += cpia2/
 obj-$(CONFIG_VIDEO_AU0828) += au0828/
 obj-$(CONFIG_VIDEO_HDPVR)	+= hdpvr/
 obj-$(CONFIG_VIDEO_PVRUSB2) += pvrusb2/
-obj-$(CONFIG_VIDEO_USBVISION) += usbvision/
 obj-$(CONFIG_VIDEO_STK1160) += stk1160/
 obj-$(CONFIG_VIDEO_CX231XX) += cx231xx/
 obj-$(CONFIG_VIDEO_TM6000) += tm6000/
diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index c394abffea86..e59a846bc909 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -42,4 +42,8 @@ source "drivers/staging/media/phy-rockchip-dphy-rx0/Kconfig"

 source "drivers/staging/media/rkisp1/Kconfig"

+if MEDIA_ANALOG_TV_SUPPORT
+source "drivers/staging/media/usbvision/Kconfig"
+endif
+
 endif
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index ea9fce8014bb..23c682461b62 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_VIDEO_IPU3_IMGU)	+= ipu3/
 obj-$(CONFIG_SOC_CAMERA)	+= soc_camera/
 obj-$(CONFIG_PHY_ROCKCHIP_DPHY_RX0)	+= phy-rockchip-dphy-rx0/
 obj-$(CONFIG_VIDEO_ROCKCHIP_ISP1)	+= rkisp1/
+obj-$(CONFIG_VIDEO_USBVISION)	+= usbvision/
diff --git a/drivers/media/usb/usbvision/Kconfig b/drivers/staging/media/usbvision/Kconfig
similarity index 57%
rename from drivers/media/usb/usbvision/Kconfig
rename to drivers/staging/media/usbvision/Kconfig
index e1039fdfb0ea..7903f558494e 100644
--- a/drivers/media/usb/usbvision/Kconfig
+++ b/drivers/staging/media/usbvision/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_USBVISION
-	tristate "USB video devices based on Nogatech NT1003/1004/1005"
+	tristate "USB video devices based on Nogatech NT1003/1004/1005 (Deprecated)"
 	depends on I2C && VIDEO_V4L2
 	select VIDEO_TUNER
 	select VIDEO_SAA711X if MEDIA_SUBDRV_AUTOSELECT
@@ -9,5 +9,10 @@ config VIDEO_USBVISION
 	  NT1003/1004/1005 USB Bridges. This driver enables using those
 	  devices.

+	  This driver is deprecated and scheduled for removal by the
+	  end of 2020. See the TODO file in drivers/staging/media/usbvision
+	  for a list of actions that have to be done in order to prevent
+	  removal of this driver.
+
 	  To compile this driver as a module, choose M here: the
 	  module will be called usbvision.
diff --git a/drivers/media/usb/usbvision/Makefile b/drivers/staging/media/usbvision/Makefile
similarity index 100%
rename from drivers/media/usb/usbvision/Makefile
rename to drivers/staging/media/usbvision/Makefile
diff --git a/drivers/staging/media/usbvision/TODO b/drivers/staging/media/usbvision/TODO
new file mode 100644
index 000000000000..e9fb4d125581
--- /dev/null
+++ b/drivers/staging/media/usbvision/TODO
@@ -0,0 +1,11 @@
+The driver is deprecated and scheduled for removal by the end
+of 2020.
+
+In order to prevent removal the following actions would have to
+be taken:
+
+- clean up the code
+- convert to the vb2 framework
+- fix the disconnect and free-on-last-user handling (i.e., add
+  a release callback for struct v4l2_device and rework the code
+  to use that correctly).
diff --git a/drivers/media/usb/usbvision/usbvision-cards.c b/drivers/staging/media/usbvision/usbvision-cards.c
similarity index 100%
rename from drivers/media/usb/usbvision/usbvision-cards.c
rename to drivers/staging/media/usbvision/usbvision-cards.c
diff --git a/drivers/media/usb/usbvision/usbvision-cards.h b/drivers/staging/media/usbvision/usbvision-cards.h
similarity index 100%
rename from drivers/media/usb/usbvision/usbvision-cards.h
rename to drivers/staging/media/usbvision/usbvision-cards.h
diff --git a/drivers/media/usb/usbvision/usbvision-core.c b/drivers/staging/media/usbvision/usbvision-core.c
similarity index 100%
rename from drivers/media/usb/usbvision/usbvision-core.c
rename to drivers/staging/media/usbvision/usbvision-core.c
diff --git a/drivers/media/usb/usbvision/usbvision-i2c.c b/drivers/staging/media/usbvision/usbvision-i2c.c
similarity index 100%
rename from drivers/media/usb/usbvision/usbvision-i2c.c
rename to drivers/staging/media/usbvision/usbvision-i2c.c
diff --git a/drivers/media/usb/usbvision/usbvision-video.c b/drivers/staging/media/usbvision/usbvision-video.c
similarity index 100%
rename from drivers/media/usb/usbvision/usbvision-video.c
rename to drivers/staging/media/usbvision/usbvision-video.c
diff --git a/drivers/media/usb/usbvision/usbvision.h b/drivers/staging/media/usbvision/usbvision.h
similarity index 100%
rename from drivers/media/usb/usbvision/usbvision.h
rename to drivers/staging/media/usbvision/usbvision.h
-- 
2.24.1

