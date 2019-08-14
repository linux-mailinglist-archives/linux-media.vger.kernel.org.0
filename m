Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 262D48CF1D
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 11:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbfHNJMg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 05:12:36 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:37894 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfHNJMf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 05:12:35 -0400
Received: from ramsan ([84.194.98.4])
        by michel.telenet-ops.be with bizsmtp
        id oxCY2000f05gfCL06xCYaD; Wed, 14 Aug 2019 11:12:33 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hxpKa-0003Pg-Ps; Wed, 14 Aug 2019 11:12:32 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hxpKa-0003Cl-Nb; Wed, 14 Aug 2019 11:12:32 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] media: Fix various misspellings of disconnected
Date:   Wed, 14 Aug 2019 11:12:31 +0200
Message-Id: <20190814091231.12278-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix typos.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Merge "media: cx231xx: Spelling s/diconencted/diconnected/"
    and "media: tm6000: Spelling s/diconencted/diconnected/",
  - Fix silly second spelling mistake in above,
  - Add fixes for more variants.
---
 drivers/media/usb/cx231xx/cx231xx-cards.c | 4 ++--
 drivers/media/usb/cx231xx/cx231xx-core.c  | 2 +-
 drivers/media/usb/cx231xx/cx231xx-video.c | 2 +-
 drivers/media/usb/em28xx/em28xx-video.c   | 2 +-
 drivers/media/usb/em28xx/em28xx.h         | 2 +-
 drivers/media/usb/tm6000/tm6000-cards.c   | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-cards.c b/drivers/media/usb/cx231xx/cx231xx-cards.c
index e0d98ba8fdbfa829..e123e74c549ed57c 100644
--- a/drivers/media/usb/cx231xx/cx231xx-cards.c
+++ b/drivers/media/usb/cx231xx/cx231xx-cards.c
@@ -1351,7 +1351,7 @@ static void cx231xx_unregister_media_device(struct cx231xx *dev)
 /*
  * cx231xx_realease_resources()
  * unregisters the v4l2,i2c and usb devices
- * called when the device gets disconected or at module unload
+ * called when the device gets disconnected or at module unload
 */
 void cx231xx_release_resources(struct cx231xx *dev)
 {
@@ -1924,7 +1924,7 @@ static int cx231xx_usb_probe(struct usb_interface *interface,
 
 /*
  * cx231xx_usb_disconnect()
- * called when the device gets diconencted
+ * called when the device gets disconnected
  * video device will be unregistered on v4l2_close in case it is still open
  */
 static void cx231xx_usb_disconnect(struct usb_interface *interface)
diff --git a/drivers/media/usb/cx231xx/cx231xx-core.c b/drivers/media/usb/cx231xx/cx231xx-core.c
index a749baadc1f12f04..982cb56e97e9641f 100644
--- a/drivers/media/usb/cx231xx/cx231xx-core.c
+++ b/drivers/media/usb/cx231xx/cx231xx-core.c
@@ -53,7 +53,7 @@ static DEFINE_MUTEX(cx231xx_devlist_mutex);
 /*
  * cx231xx_realease_resources()
  * unregisters the v4l2,i2c and usb devices
- * called when the device gets disconected or at module unload
+ * called when the device gets disconnected or at module unload
 */
 void cx231xx_remove_from_devlist(struct cx231xx *dev)
 {
diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
index c77597917ca18e54..9b51f07a729e4e94 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -1837,7 +1837,7 @@ static int cx231xx_v4l2_open(struct file *filp)
 /*
  * cx231xx_realease_resources()
  * unregisters the v4l2,i2c and usb devices
- * called when the device gets disconected or at module unload
+ * called when the device gets disconnected or at module unload
 */
 void cx231xx_release_analog_resources(struct cx231xx *dev)
 {
diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index fc6d37d76dc9282b..b0f7390e4b4f2ac6 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -2199,7 +2199,7 @@ static int em28xx_v4l2_open(struct file *filp)
 /*
  * em28xx_v4l2_fini()
  * unregisters the v4l2,i2c and usb devices
- * called when the device gets disconected or at module unload
+ * called when the device gets disconnected or at module unload
  */
 static int em28xx_v4l2_fini(struct em28xx *dev)
 {
diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
index c69e0bc46eb7d58b..c8bc59059a19e5d0 100644
--- a/drivers/media/usb/em28xx/em28xx.h
+++ b/drivers/media/usb/em28xx/em28xx.h
@@ -655,7 +655,7 @@ struct em28xx {
 	enum em28xx_chip_id chip_id;
 
 	unsigned int is_em25xx:1;	// em25xx/em276x/7x/8x family bridge
-	unsigned int disconnected:1;	// device has been diconnected
+	unsigned int disconnected:1;	// device has been disconnected
 	unsigned int has_video:1;
 	unsigned int is_audio_only:1;
 	unsigned int is_webcam:1;
diff --git a/drivers/media/usb/tm6000/tm6000-cards.c b/drivers/media/usb/tm6000/tm6000-cards.c
index 23df50aa0a4af6da..5358cd8c46030837 100644
--- a/drivers/media/usb/tm6000/tm6000-cards.c
+++ b/drivers/media/usb/tm6000/tm6000-cards.c
@@ -1328,7 +1328,7 @@ static int tm6000_usb_probe(struct usb_interface *interface,
 
 /*
  * tm6000_usb_disconnect()
- * called when the device gets diconencted
+ * called when the device gets disconnected
  * video device will be unregistered on v4l2_close in case it is still open
  */
 static void tm6000_usb_disconnect(struct usb_interface *interface)
-- 
2.17.1

