Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0D8509D9
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2019 13:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727945AbfFXLg5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jun 2019 07:36:57 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:50217 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726622AbfFXLg4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jun 2019 07:36:56 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 349DCC0006
        for <linux-media@vger.kernel.org>; Mon, 24 Jun 2019 11:36:31 +0000 (UTC)
Message-ID: <8e9ebbe1e566d06ba56da4ae732d4b11af5321a8.camel@hadess.net>
Subject: [PATCH] media: rc: Prefer KEY_NUMERIC_* for number buttons on
 remotes
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-media@vger.kernel.org
Date:   Mon, 24 Jun 2019 13:36:30 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Prefer KEY_NUMERIC_* for number buttons on remotes. Now all the remotes
use KEY_NUMERIC_[0-9] for the number buttons rather than keys that
could be affected by modifiers (Caps-Lock, or Num-Lock) or regional
keymaps.

Created using:
sed -i  's/KEY_\([0-9]\) /KEY_NUMERIC_\1 /' *.c
sed -i  's/KEY_\([0-9]\)}/KEY_NUMERIC_\1}/' *.c

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 .../media/rc/keymaps/rc-adstech-dvb-t-pci.c   |  20 ++--
 drivers/media/rc/keymaps/rc-alink-dtu-m.c     |  20 ++--
 drivers/media/rc/keymaps/rc-anysee.c          |  20 ++--
 drivers/media/rc/keymaps/rc-apac-viewcomp.c   |  20 ++--
 .../media/rc/keymaps/rc-astrometa-t2hybrid.c  |  20 ++--
 drivers/media/rc/keymaps/rc-asus-pc39.c       |  20 ++--
 drivers/media/rc/keymaps/rc-asus-ps3-100.c    |  20 ++--
 drivers/media/rc/keymaps/rc-ati-x10.c         |  20 ++--
 drivers/media/rc/keymaps/rc-avermedia-a16d.c  |  20 ++--
 .../media/rc/keymaps/rc-avermedia-cardbus.c   |  20 ++--
 drivers/media/rc/keymaps/rc-avermedia-dvbt.c  |  20 ++--
 drivers/media/rc/keymaps/rc-avermedia-m135a.c |  40 +++----
 .../rc/keymaps/rc-avermedia-m733a-rm-k6.c     |  20 ++--
 drivers/media/rc/keymaps/rc-avermedia-rm-ks.c |  20 ++--
 drivers/media/rc/keymaps/rc-avermedia.c       |  20 ++--
 drivers/media/rc/keymaps/rc-avertv-303.c      |  20 ++--
 .../media/rc/keymaps/rc-azurewave-ad-tu700.c  |  20 ++--
 drivers/media/rc/keymaps/rc-behold-columbus.c |  20 ++--
 drivers/media/rc/keymaps/rc-behold.c          |  20 ++--
 drivers/media/rc/keymaps/rc-budget-ci-old.c   |  20 ++--
 drivers/media/rc/keymaps/rc-cinergy-1400.c    |  20 ++--
 drivers/media/rc/keymaps/rc-cinergy.c         |  20 ++--
 drivers/media/rc/keymaps/rc-d680-dmb.c        |  20 ++--
 drivers/media/rc/keymaps/rc-delock-61959.c    |  20 ++--
 drivers/media/rc/keymaps/rc-dib0700-nec.c     |  40 +++----
 drivers/media/rc/keymaps/rc-dib0700-rc5.c     | 100 +++++++++---------
 .../media/rc/keymaps/rc-digitalnow-tinytwin.c |  20 ++--
 drivers/media/rc/keymaps/rc-digittrade.c      |  20 ++--
 drivers/media/rc/keymaps/rc-dm1105-nec.c      |  20 ++--
 drivers/media/rc/keymaps/rc-dntv-live-dvb-t.c |  20 ++--
 .../media/rc/keymaps/rc-dntv-live-dvbt-pro.c  |  20 ++--
 drivers/media/rc/keymaps/rc-dtt200u.c         |  20 ++--
 drivers/media/rc/keymaps/rc-dvbsky.c          |  20 ++--
 drivers/media/rc/keymaps/rc-dvico-mce.c       |  20 ++--
 drivers/media/rc/keymaps/rc-dvico-portable.c  |  20 ++--
 drivers/media/rc/keymaps/rc-em-terratec.c     |  20 ++--
 .../media/rc/keymaps/rc-encore-enltv-fm53.c   |  20 ++--
 drivers/media/rc/keymaps/rc-encore-enltv.c    |  20 ++--
 drivers/media/rc/keymaps/rc-encore-enltv2.c   |  20 ++--
 drivers/media/rc/keymaps/rc-eztv.c            |  20 ++--
 drivers/media/rc/keymaps/rc-flydvb.c          |  20 ++--
 drivers/media/rc/keymaps/rc-flyvideo.c        |  20 ++--
 drivers/media/rc/keymaps/rc-fusionhdtv-mce.c  |  20 ++--
 drivers/media/rc/keymaps/rc-gadmei-rm008z.c   |  20 ++--
 .../media/rc/keymaps/rc-genius-tvgo-a11mce.c  |  20 ++--
 drivers/media/rc/keymaps/rc-gotview7135.c     |  20 ++--
 drivers/media/rc/keymaps/rc-hauppauge.c       | 100 +++++++++---------
 drivers/media/rc/keymaps/rc-hisi-poplar.c     |  20 ++--
 drivers/media/rc/keymaps/rc-hisi-tv-demo.c    |  20 ++--
 drivers/media/rc/keymaps/rc-iodata-bctv7e.c   |  20 ++--
 drivers/media/rc/keymaps/rc-it913x-v1.c       |  40 +++----
 drivers/media/rc/keymaps/rc-it913x-v2.c       |  40 +++----
 drivers/media/rc/keymaps/rc-kaiomy.c          |  20 ++--
 drivers/media/rc/keymaps/rc-kworld-315u.c     |  20 ++--
 drivers/media/rc/keymaps/rc-kworld-pc150u.c   |  20 ++--
 .../rc/keymaps/rc-kworld-plus-tv-analog.c     |  20 ++--
 .../media/rc/keymaps/rc-leadtek-y04g0051.c    |  20 ++--
 drivers/media/rc/keymaps/rc-lme2510.c         |  60 +++++------
 drivers/media/rc/keymaps/rc-manli.c           |  20 ++--
 .../rc/keymaps/rc-medion-x10-digitainer.c     |  20 ++--
 drivers/media/rc/keymaps/rc-medion-x10-or2x.c |  20 ++--
 drivers/media/rc/keymaps/rc-medion-x10.c      |  20 ++--
 drivers/media/rc/keymaps/rc-msi-digivox-ii.c  |  20 ++--
 drivers/media/rc/keymaps/rc-msi-digivox-iii.c |  20 ++--
 .../media/rc/keymaps/rc-msi-tvanywhere-plus.c |  20 ++--
 drivers/media/rc/keymaps/rc-msi-tvanywhere.c  |  20 ++--
 drivers/media/rc/keymaps/rc-nebula.c          |  20 ++--
 .../rc/keymaps/rc-nec-terratec-cinergy-xs.c   |  40 +++----
 drivers/media/rc/keymaps/rc-norwood.c         |  20 ++--
 drivers/media/rc/keymaps/rc-npgtech.c         |  20 ++--
 drivers/media/rc/keymaps/rc-pctv-sedna.c      |  20 ++--
 drivers/media/rc/keymaps/rc-pinnacle-color.c  |  20 ++--
 drivers/media/rc/keymaps/rc-pinnacle-grey.c   |  20 ++--
 .../media/rc/keymaps/rc-pinnacle-pctv-hd.c    |  20 ++--
 drivers/media/rc/keymaps/rc-pixelview-002t.c  |  20 ++--
 drivers/media/rc/keymaps/rc-pixelview-mk12.c  |  20 ++--
 drivers/media/rc/keymaps/rc-pixelview-new.c   |  20 ++--
 drivers/media/rc/keymaps/rc-pixelview.c       |  20 ++--
 .../rc/keymaps/rc-powercolor-real-angel.c     |  20 ++--
 drivers/media/rc/keymaps/rc-proteus-2309.c    |  20 ++--
 drivers/media/rc/keymaps/rc-purpletv.c        |  20 ++--
 drivers/media/rc/keymaps/rc-pv951.c           |  20 ++--
 .../rc/keymaps/rc-real-audio-220-32-keys.c    |  20 ++--
 drivers/media/rc/keymaps/rc-reddo.c           |  20 ++--
 .../media/rc/keymaps/rc-snapstream-firefly.c  |  20 ++--
 drivers/media/rc/keymaps/rc-su3000.c          |  20 ++--
 drivers/media/rc/keymaps/rc-tango.c           |  20 ++--
 drivers/media/rc/keymaps/rc-tbs-nec.c         |  20 ++--
 drivers/media/rc/keymaps/rc-technisat-ts35.c  |  20 ++--
 drivers/media/rc/keymaps/rc-technisat-usb2.c  |  20 ++--
 .../rc/keymaps/rc-terratec-cinergy-c-pci.c    |  20 ++--
 .../rc/keymaps/rc-terratec-cinergy-s2-hd.c    |  20 ++--
 .../media/rc/keymaps/rc-terratec-cinergy-xs.c |  20 ++--
 drivers/media/rc/keymaps/rc-terratec-slim-2.c |  20 ++--
 drivers/media/rc/keymaps/rc-terratec-slim.c   |  20 ++--
 drivers/media/rc/keymaps/rc-tevii-nec.c       |  20 ++--
 .../rc/keymaps/rc-total-media-in-hand-02.c    |  20 ++--
 .../media/rc/keymaps/rc-total-media-in-hand.c |  20 ++--
 drivers/media/rc/keymaps/rc-trekstor.c        |  20 ++--
 drivers/media/rc/keymaps/rc-tt-1500.c         |  20 ++--
 .../media/rc/keymaps/rc-twinhan-dtv-cab-ci.c  |  20 ++--
 drivers/media/rc/keymaps/rc-twinhan1027.c     |  20 ++--
 drivers/media/rc/keymaps/rc-videomate-m1f.c   |  20 ++--
 drivers/media/rc/keymaps/rc-videomate-s350.c  |  20 ++--
 .../media/rc/keymaps/rc-videomate-tv-pvr.c    |  20 ++--
 .../rc/keymaps/rc-winfast-usbii-deluxe.c      |  20 ++--
 drivers/media/rc/keymaps/rc-winfast.c         |  20 ++--
 drivers/media/rc/keymaps/rc-xbox-dvd.c        |  20 ++--
 drivers/media/rc/keymaps/rc-zx-irdec.c        |  20 ++--
 109 files changed, 1240 insertions(+), 1240 deletions(-)

diff --git a/drivers/media/rc/keymaps/rc-adstech-dvb-t-pci.c b/drivers/media/rc/keymaps/rc-adstech-dvb-t-pci.c
index 732687ce0637..0a867ca90038 100644
--- a/drivers/media/rc/keymaps/rc-adstech-dvb-t-pci.c
+++ b/drivers/media/rc/keymaps/rc-adstech-dvb-t-pci.c
@@ -12,16 +12,16 @@
 
 static struct rc_map_table adstech_dvb_t_pci[] = {
 	/* Keys 0 to 9 */
-	{ 0x4d, KEY_0 },
-	{ 0x57, KEY_1 },
-	{ 0x4f, KEY_2 },
-	{ 0x53, KEY_3 },
-	{ 0x56, KEY_4 },
-	{ 0x4e, KEY_5 },
-	{ 0x5e, KEY_6 },
-	{ 0x54, KEY_7 },
-	{ 0x4c, KEY_8 },
-	{ 0x5c, KEY_9 },
+	{ 0x4d, KEY_NUMERIC_0 },
+	{ 0x57, KEY_NUMERIC_1 },
+	{ 0x4f, KEY_NUMERIC_2 },
+	{ 0x53, KEY_NUMERIC_3 },
+	{ 0x56, KEY_NUMERIC_4 },
+	{ 0x4e, KEY_NUMERIC_5 },
+	{ 0x5e, KEY_NUMERIC_6 },
+	{ 0x54, KEY_NUMERIC_7 },
+	{ 0x4c, KEY_NUMERIC_8 },
+	{ 0x5c, KEY_NUMERIC_9 },
 
 	{ 0x5b, KEY_POWER },
 	{ 0x5f, KEY_MUTE },
diff --git a/drivers/media/rc/keymaps/rc-alink-dtu-m.c b/drivers/media/rc/keymaps/rc-alink-dtu-m.c
index 530af333af8e..8a2ccaf3b817 100644
--- a/drivers/media/rc/keymaps/rc-alink-dtu-m.c
+++ b/drivers/media/rc/keymaps/rc-alink-dtu-m.c
@@ -11,22 +11,22 @@
 /* A-Link DTU(m) slim remote, 6 rows, 3 columns. */
 static struct rc_map_table alink_dtu_m[] = {
 	{ 0x0800, KEY_VOLUMEUP },
-	{ 0x0801, KEY_1 },
-	{ 0x0802, KEY_3 },
-	{ 0x0803, KEY_7 },
-	{ 0x0804, KEY_9 },
+	{ 0x0801, KEY_NUMERIC_1 },
+	{ 0x0802, KEY_NUMERIC_3 },
+	{ 0x0803, KEY_NUMERIC_7 },
+	{ 0x0804, KEY_NUMERIC_9 },
 	{ 0x0805, KEY_NEW },             /* symbol: PIP */
-	{ 0x0806, KEY_0 },
+	{ 0x0806, KEY_NUMERIC_0 },
 	{ 0x0807, KEY_CHANNEL },         /* JUMP */
-	{ 0x080d, KEY_5 },
-	{ 0x080f, KEY_2 },
+	{ 0x080d, KEY_NUMERIC_5 },
+	{ 0x080f, KEY_NUMERIC_2 },
 	{ 0x0812, KEY_POWER2 },
 	{ 0x0814, KEY_CHANNELUP },
 	{ 0x0816, KEY_VOLUMEDOWN },
-	{ 0x0818, KEY_6 },
+	{ 0x0818, KEY_NUMERIC_6 },
 	{ 0x081a, KEY_MUTE },
-	{ 0x081b, KEY_8 },
-	{ 0x081c, KEY_4 },
+	{ 0x081b, KEY_NUMERIC_8 },
+	{ 0x081c, KEY_NUMERIC_4 },
 	{ 0x081d, KEY_CHANNELDOWN },
 };
 
diff --git a/drivers/media/rc/keymaps/rc-anysee.c b/drivers/media/rc/keymaps/rc-anysee.c
index 9d1eee1f0515..34da03c46104 100644
--- a/drivers/media/rc/keymaps/rc-anysee.c
+++ b/drivers/media/rc/keymaps/rc-anysee.c
@@ -9,16 +9,16 @@
 #include <linux/module.h>
 
 static struct rc_map_table anysee[] = {
-	{ 0x0800, KEY_0 },
-	{ 0x0801, KEY_1 },
-	{ 0x0802, KEY_2 },
-	{ 0x0803, KEY_3 },
-	{ 0x0804, KEY_4 },
-	{ 0x0805, KEY_5 },
-	{ 0x0806, KEY_6 },
-	{ 0x0807, KEY_7 },
-	{ 0x0808, KEY_8 },
-	{ 0x0809, KEY_9 },
+	{ 0x0800, KEY_NUMERIC_0 },
+	{ 0x0801, KEY_NUMERIC_1 },
+	{ 0x0802, KEY_NUMERIC_2 },
+	{ 0x0803, KEY_NUMERIC_3 },
+	{ 0x0804, KEY_NUMERIC_4 },
+	{ 0x0805, KEY_NUMERIC_5 },
+	{ 0x0806, KEY_NUMERIC_6 },
+	{ 0x0807, KEY_NUMERIC_7 },
+	{ 0x0808, KEY_NUMERIC_8 },
+	{ 0x0809, KEY_NUMERIC_9 },
 	{ 0x080a, KEY_POWER2 },          /* [red power button] */
 	{ 0x080b, KEY_VIDEO },           /* [*] MODE */
 	{ 0x080c, KEY_CHANNEL },         /* [symbol counterclockwise arrow] */
diff --git a/drivers/media/rc/keymaps/rc-apac-viewcomp.c b/drivers/media/rc/keymaps/rc-apac-viewcomp.c
index af2e7fdc7b85..bdc47e25d46e 100644
--- a/drivers/media/rc/keymaps/rc-apac-viewcomp.c
+++ b/drivers/media/rc/keymaps/rc-apac-viewcomp.c
@@ -12,16 +12,16 @@
 
 static struct rc_map_table apac_viewcomp[] = {
 
-	{ 0x01, KEY_1 },
-	{ 0x02, KEY_2 },
-	{ 0x03, KEY_3 },
-	{ 0x04, KEY_4 },
-	{ 0x05, KEY_5 },
-	{ 0x06, KEY_6 },
-	{ 0x07, KEY_7 },
-	{ 0x08, KEY_8 },
-	{ 0x09, KEY_9 },
-	{ 0x00, KEY_0 },
+	{ 0x01, KEY_NUMERIC_1 },
+	{ 0x02, KEY_NUMERIC_2 },
+	{ 0x03, KEY_NUMERIC_3 },
+	{ 0x04, KEY_NUMERIC_4 },
+	{ 0x05, KEY_NUMERIC_5 },
+	{ 0x06, KEY_NUMERIC_6 },
+	{ 0x07, KEY_NUMERIC_7 },
+	{ 0x08, KEY_NUMERIC_8 },
+	{ 0x09, KEY_NUMERIC_9 },
+	{ 0x00, KEY_NUMERIC_0 },
 	{ 0x17, KEY_LAST },		/* +100 */
 	{ 0x0a, KEY_LIST },		/* recall */
 
diff --git a/drivers/media/rc/keymaps/rc-astrometa-t2hybrid.c b/drivers/media/rc/keymaps/rc-astrometa-t2hybrid.c
index 727e35c31039..1d322137898e 100644
--- a/drivers/media/rc/keymaps/rc-astrometa-t2hybrid.c
+++ b/drivers/media/rc/keymaps/rc-astrometa-t2hybrid.c
@@ -21,21 +21,21 @@ static struct rc_map_table t2hybrid[] = {
 	{ 0x40, KEY_ZOOM }, /* Fullscreen */
 	{ 0x1e, KEY_VOLUMEUP },
 
-	{ 0x12, KEY_0 },
+	{ 0x12, KEY_NUMERIC_0 },
 	{ 0x02, KEY_CHANNELDOWN },
 	{ 0x1c, KEY_AGAIN }, /* Recall */
 
-	{ 0x09, KEY_1 },
-	{ 0x1d, KEY_2 },
-	{ 0x1f, KEY_3 },
+	{ 0x09, KEY_NUMERIC_1 },
+	{ 0x1d, KEY_NUMERIC_2 },
+	{ 0x1f, KEY_NUMERIC_3 },
 
-	{ 0x0d, KEY_4 },
-	{ 0x19, KEY_5 },
-	{ 0x1b, KEY_6 },
+	{ 0x0d, KEY_NUMERIC_4 },
+	{ 0x19, KEY_NUMERIC_5 },
+	{ 0x1b, KEY_NUMERIC_6 },
 
-	{ 0x11, KEY_7 },
-	{ 0x15, KEY_8 },
-	{ 0x17, KEY_9 },
+	{ 0x11, KEY_NUMERIC_7 },
+	{ 0x15, KEY_NUMERIC_8 },
+	{ 0x17, KEY_NUMERIC_9 },
 };
 
 static struct rc_map_list t2hybrid_map = {
diff --git a/drivers/media/rc/keymaps/rc-asus-pc39.c b/drivers/media/rc/keymaps/rc-asus-pc39.c
index 13a935c3ac59..7a4b3a6e3a49 100644
--- a/drivers/media/rc/keymaps/rc-asus-pc39.c
+++ b/drivers/media/rc/keymaps/rc-asus-pc39.c
@@ -16,16 +16,16 @@
 
 static struct rc_map_table asus_pc39[] = {
 	/* Keys 0 to 9 */
-	{ 0x082a, KEY_0 },
-	{ 0x0816, KEY_1 },
-	{ 0x0812, KEY_2 },
-	{ 0x0814, KEY_3 },
-	{ 0x0836, KEY_4 },
-	{ 0x0832, KEY_5 },
-	{ 0x0834, KEY_6 },
-	{ 0x080e, KEY_7 },
-	{ 0x080a, KEY_8 },
-	{ 0x080c, KEY_9 },
+	{ 0x082a, KEY_NUMERIC_0 },
+	{ 0x0816, KEY_NUMERIC_1 },
+	{ 0x0812, KEY_NUMERIC_2 },
+	{ 0x0814, KEY_NUMERIC_3 },
+	{ 0x0836, KEY_NUMERIC_4 },
+	{ 0x0832, KEY_NUMERIC_5 },
+	{ 0x0834, KEY_NUMERIC_6 },
+	{ 0x080e, KEY_NUMERIC_7 },
+	{ 0x080a, KEY_NUMERIC_8 },
+	{ 0x080c, KEY_NUMERIC_9 },
 
 	{ 0x0801, KEY_RADIO },		/* radio */
 	{ 0x083c, KEY_MENU },		/* dvd/menu */
diff --git a/drivers/media/rc/keymaps/rc-asus-ps3-100.c b/drivers/media/rc/keymaps/rc-asus-ps3-100.c
index 7f836fcc68ac..09b60fa335e3 100644
--- a/drivers/media/rc/keymaps/rc-asus-ps3-100.c
+++ b/drivers/media/rc/keymaps/rc-asus-ps3-100.c
@@ -20,16 +20,16 @@ static struct rc_map_table asus_ps3_100[] = {
 	{ 0x0807, KEY_GREEN },            /* green */
 
 	/* Keys 0 to 9 */
-	{ 0x082a, KEY_0 },
-	{ 0x0816, KEY_1 },
-	{ 0x0812, KEY_2 },
-	{ 0x0814, KEY_3 },
-	{ 0x0836, KEY_4 },
-	{ 0x0832, KEY_5 },
-	{ 0x0834, KEY_6 },
-	{ 0x080e, KEY_7 },
-	{ 0x080a, KEY_8 },
-	{ 0x080c, KEY_9 },
+	{ 0x082a, KEY_NUMERIC_0 },
+	{ 0x0816, KEY_NUMERIC_1 },
+	{ 0x0812, KEY_NUMERIC_2 },
+	{ 0x0814, KEY_NUMERIC_3 },
+	{ 0x0836, KEY_NUMERIC_4 },
+	{ 0x0832, KEY_NUMERIC_5 },
+	{ 0x0834, KEY_NUMERIC_6 },
+	{ 0x080e, KEY_NUMERIC_7 },
+	{ 0x080a, KEY_NUMERIC_8 },
+	{ 0x080c, KEY_NUMERIC_9 },
 
 	{ 0x0815, KEY_VOLUMEUP },
 	{ 0x0826, KEY_VOLUMEDOWN },
diff --git a/drivers/media/rc/keymaps/rc-ati-x10.c b/drivers/media/rc/keymaps/rc-ati-x10.c
index 2f800dd5aa19..31fe1106b708 100644
--- a/drivers/media/rc/keymaps/rc-ati-x10.c
+++ b/drivers/media/rc/keymaps/rc-ati-x10.c
@@ -49,18 +49,18 @@ static struct rc_map_table ati_x10[] = {
 	 * has problems with keycodes greater than 255, so avoid those high
 	 * keycodes in default maps.
 	 */
-	{ 0x0d, KEY_1 },
-	{ 0x0e, KEY_2 },
-	{ 0x0f, KEY_3 },
-	{ 0x10, KEY_4 },
-	{ 0x11, KEY_5 },
-	{ 0x12, KEY_6 },
-	{ 0x13, KEY_7 },
-	{ 0x14, KEY_8 },
-	{ 0x15, KEY_9 },
+	{ 0x0d, KEY_NUMERIC_1 },
+	{ 0x0e, KEY_NUMERIC_2 },
+	{ 0x0f, KEY_NUMERIC_3 },
+	{ 0x10, KEY_NUMERIC_4 },
+	{ 0x11, KEY_NUMERIC_5 },
+	{ 0x12, KEY_NUMERIC_6 },
+	{ 0x13, KEY_NUMERIC_7 },
+	{ 0x14, KEY_NUMERIC_8 },
+	{ 0x15, KEY_NUMERIC_9 },
 	{ 0x16, KEY_MENU },       /* "menu": DVD root menu */
 				  /* KEY_NUMERIC_STAR? */
-	{ 0x17, KEY_0 },
+	{ 0x17, KEY_NUMERIC_0 },
 	{ 0x18, KEY_SETUP },      /* "check": DVD setup menu */
 				  /* KEY_NUMERIC_POUND? */
 
diff --git a/drivers/media/rc/keymaps/rc-avermedia-a16d.c b/drivers/media/rc/keymaps/rc-avermedia-a16d.c
index 5549c043cfe4..6467ff6e48d7 100644
--- a/drivers/media/rc/keymaps/rc-avermedia-a16d.c
+++ b/drivers/media/rc/keymaps/rc-avermedia-a16d.c
@@ -11,17 +11,17 @@
 static struct rc_map_table avermedia_a16d[] = {
 	{ 0x20, KEY_LIST},
 	{ 0x00, KEY_POWER},
-	{ 0x28, KEY_1},
-	{ 0x18, KEY_2},
-	{ 0x38, KEY_3},
-	{ 0x24, KEY_4},
-	{ 0x14, KEY_5},
-	{ 0x34, KEY_6},
-	{ 0x2c, KEY_7},
-	{ 0x1c, KEY_8},
-	{ 0x3c, KEY_9},
+	{ 0x28, KEY_NUMERIC_1},
+	{ 0x18, KEY_NUMERIC_2},
+	{ 0x38, KEY_NUMERIC_3},
+	{ 0x24, KEY_NUMERIC_4},
+	{ 0x14, KEY_NUMERIC_5},
+	{ 0x34, KEY_NUMERIC_6},
+	{ 0x2c, KEY_NUMERIC_7},
+	{ 0x1c, KEY_NUMERIC_8},
+	{ 0x3c, KEY_NUMERIC_9},
 	{ 0x12, KEY_SUBTITLE},
-	{ 0x22, KEY_0},
+	{ 0x22, KEY_NUMERIC_0},
 	{ 0x32, KEY_REWIND},
 	{ 0x3a, KEY_SHUFFLE},
 	{ 0x02, KEY_PRINT},
diff --git a/drivers/media/rc/keymaps/rc-avermedia-cardbus.c b/drivers/media/rc/keymaps/rc-avermedia-cardbus.c
index 74edcd82e685..54fc6d9022c2 100644
--- a/drivers/media/rc/keymaps/rc-avermedia-cardbus.c
+++ b/drivers/media/rc/keymaps/rc-avermedia-cardbus.c
@@ -15,19 +15,19 @@ static struct rc_map_table avermedia_cardbus[] = {
 	{ 0x01, KEY_TUNER },		/* TV/FM */
 	{ 0x03, KEY_TEXT },		/* Teletext */
 	{ 0x04, KEY_EPG },
-	{ 0x05, KEY_1 },
-	{ 0x06, KEY_2 },
-	{ 0x07, KEY_3 },
+	{ 0x05, KEY_NUMERIC_1 },
+	{ 0x06, KEY_NUMERIC_2 },
+	{ 0x07, KEY_NUMERIC_3 },
 	{ 0x08, KEY_AUDIO },
-	{ 0x09, KEY_4 },
-	{ 0x0a, KEY_5 },
-	{ 0x0b, KEY_6 },
+	{ 0x09, KEY_NUMERIC_4 },
+	{ 0x0a, KEY_NUMERIC_5 },
+	{ 0x0b, KEY_NUMERIC_6 },
 	{ 0x0c, KEY_ZOOM },		/* Full screen */
-	{ 0x0d, KEY_7 },
-	{ 0x0e, KEY_8 },
-	{ 0x0f, KEY_9 },
+	{ 0x0d, KEY_NUMERIC_7 },
+	{ 0x0e, KEY_NUMERIC_8 },
+	{ 0x0f, KEY_NUMERIC_9 },
 	{ 0x10, KEY_PAGEUP },		/* 16-CH PREV */
-	{ 0x11, KEY_0 },
+	{ 0x11, KEY_NUMERIC_0 },
 	{ 0x12, KEY_INFO },
 	{ 0x13, KEY_AGAIN },		/* CH RTN - channel return */
 	{ 0x14, KEY_MUTE },
diff --git a/drivers/media/rc/keymaps/rc-avermedia-dvbt.c b/drivers/media/rc/keymaps/rc-avermedia-dvbt.c
index 796184160a48..27de2aedab78 100644
--- a/drivers/media/rc/keymaps/rc-avermedia-dvbt.c
+++ b/drivers/media/rc/keymaps/rc-avermedia-dvbt.c
@@ -11,16 +11,16 @@
 /* Matt Jesson <dvb@jesson.eclipse.co.uk */
 
 static struct rc_map_table avermedia_dvbt[] = {
-	{ 0x28, KEY_0 },		/* '0' / 'enter' */
-	{ 0x22, KEY_1 },		/* '1' */
-	{ 0x12, KEY_2 },		/* '2' / 'up arrow' */
-	{ 0x32, KEY_3 },		/* '3' */
-	{ 0x24, KEY_4 },		/* '4' / 'left arrow' */
-	{ 0x14, KEY_5 },		/* '5' */
-	{ 0x34, KEY_6 },		/* '6' / 'right arrow' */
-	{ 0x26, KEY_7 },		/* '7' */
-	{ 0x16, KEY_8 },		/* '8' / 'down arrow' */
-	{ 0x36, KEY_9 },		/* '9' */
+	{ 0x28, KEY_NUMERIC_0 },		/* '0' / 'enter' */
+	{ 0x22, KEY_NUMERIC_1 },		/* '1' */
+	{ 0x12, KEY_NUMERIC_2 },		/* '2' / 'up arrow' */
+	{ 0x32, KEY_NUMERIC_3 },		/* '3' */
+	{ 0x24, KEY_NUMERIC_4 },		/* '4' / 'left arrow' */
+	{ 0x14, KEY_NUMERIC_5 },		/* '5' */
+	{ 0x34, KEY_NUMERIC_6 },		/* '6' / 'right arrow' */
+	{ 0x26, KEY_NUMERIC_7 },		/* '7' */
+	{ 0x16, KEY_NUMERIC_8 },		/* '8' / 'down arrow' */
+	{ 0x36, KEY_NUMERIC_9 },		/* '9' */
 
 	{ 0x20, KEY_VIDEO },		/* 'source' */
 	{ 0x10, KEY_TEXT },		/* 'teletext' */
diff --git a/drivers/media/rc/keymaps/rc-avermedia-m135a.c b/drivers/media/rc/keymaps/rc-avermedia-m135a.c
index d275d98d066a..311ddeb061ca 100644
--- a/drivers/media/rc/keymaps/rc-avermedia-m135a.c
+++ b/drivers/media/rc/keymaps/rc-avermedia-m135a.c
@@ -24,16 +24,16 @@ static struct rc_map_table avermedia_m135a[] = {
 	{ 0x022e, KEY_DOT },		/* '.' */
 	{ 0x0201, KEY_MODE },		/* TV/FM or SOURCE */
 
-	{ 0x0205, KEY_1 },
-	{ 0x0206, KEY_2 },
-	{ 0x0207, KEY_3 },
-	{ 0x0209, KEY_4 },
-	{ 0x020a, KEY_5 },
-	{ 0x020b, KEY_6 },
-	{ 0x020d, KEY_7 },
-	{ 0x020e, KEY_8 },
-	{ 0x020f, KEY_9 },
-	{ 0x0211, KEY_0 },
+	{ 0x0205, KEY_NUMERIC_1 },
+	{ 0x0206, KEY_NUMERIC_2 },
+	{ 0x0207, KEY_NUMERIC_3 },
+	{ 0x0209, KEY_NUMERIC_4 },
+	{ 0x020a, KEY_NUMERIC_5 },
+	{ 0x020b, KEY_NUMERIC_6 },
+	{ 0x020d, KEY_NUMERIC_7 },
+	{ 0x020e, KEY_NUMERIC_8 },
+	{ 0x020f, KEY_NUMERIC_9 },
+	{ 0x0211, KEY_NUMERIC_0 },
 
 	{ 0x0213, KEY_RIGHT },		/* -> or L */
 	{ 0x0212, KEY_LEFT },		/* <- or R */
@@ -70,17 +70,17 @@ static struct rc_map_table avermedia_m135a[] = {
 	{ 0x0406, KEY_MUTE },
 	{ 0x0408, KEY_MODE },     /* TV/FM */
 
-	{ 0x0409, KEY_1 },
-	{ 0x040a, KEY_2 },
-	{ 0x040b, KEY_3 },
-	{ 0x040c, KEY_4 },
-	{ 0x040d, KEY_5 },
-	{ 0x040e, KEY_6 },
-	{ 0x040f, KEY_7 },
-	{ 0x0410, KEY_8 },
-	{ 0x0411, KEY_9 },
+	{ 0x0409, KEY_NUMERIC_1 },
+	{ 0x040a, KEY_NUMERIC_2 },
+	{ 0x040b, KEY_NUMERIC_3 },
+	{ 0x040c, KEY_NUMERIC_4 },
+	{ 0x040d, KEY_NUMERIC_5 },
+	{ 0x040e, KEY_NUMERIC_6 },
+	{ 0x040f, KEY_NUMERIC_7 },
+	{ 0x0410, KEY_NUMERIC_8 },
+	{ 0x0411, KEY_NUMERIC_9 },
 	{ 0x044c, KEY_DOT },      /* '.' */
-	{ 0x0412, KEY_0 },
+	{ 0x0412, KEY_NUMERIC_0 },
 	{ 0x0407, KEY_REFRESH },  /* Refresh/Reload */
 
 	{ 0x0413, KEY_AUDIO },
diff --git a/drivers/media/rc/keymaps/rc-avermedia-m733a-rm-k6.c b/drivers/media/rc/keymaps/rc-avermedia-m733a-rm-k6.c
index 6a70aba92dfb..a970ed5a090b 100644
--- a/drivers/media/rc/keymaps/rc-avermedia-m733a-rm-k6.c
+++ b/drivers/media/rc/keymaps/rc-avermedia-m733a-rm-k6.c
@@ -18,17 +18,17 @@ static struct rc_map_table avermedia_m733a_rm_k6[] = {
 	{ 0x0406, KEY_MUTE },
 	{ 0x0408, KEY_MODE },     /* TV/FM */
 
-	{ 0x0409, KEY_1 },
-	{ 0x040a, KEY_2 },
-	{ 0x040b, KEY_3 },
-	{ 0x040c, KEY_4 },
-	{ 0x040d, KEY_5 },
-	{ 0x040e, KEY_6 },
-	{ 0x040f, KEY_7 },
-	{ 0x0410, KEY_8 },
-	{ 0x0411, KEY_9 },
+	{ 0x0409, KEY_NUMERIC_1 },
+	{ 0x040a, KEY_NUMERIC_2 },
+	{ 0x040b, KEY_NUMERIC_3 },
+	{ 0x040c, KEY_NUMERIC_4 },
+	{ 0x040d, KEY_NUMERIC_5 },
+	{ 0x040e, KEY_NUMERIC_6 },
+	{ 0x040f, KEY_NUMERIC_7 },
+	{ 0x0410, KEY_NUMERIC_8 },
+	{ 0x0411, KEY_NUMERIC_9 },
 	{ 0x044c, KEY_DOT },      /* '.' */
-	{ 0x0412, KEY_0 },
+	{ 0x0412, KEY_NUMERIC_0 },
 	{ 0x0407, KEY_REFRESH },  /* Refresh/Reload */
 
 	{ 0x0413, KEY_AUDIO },
diff --git a/drivers/media/rc/keymaps/rc-avermedia-rm-ks.c b/drivers/media/rc/keymaps/rc-avermedia-rm-ks.c
index 61348894c93b..cf8a4fd107f4 100644
--- a/drivers/media/rc/keymaps/rc-avermedia-rm-ks.c
+++ b/drivers/media/rc/keymaps/rc-avermedia-rm-ks.c
@@ -20,16 +20,16 @@ static struct rc_map_table avermedia_rm_ks[] = {
 	{ 0x0506, KEY_MUTE }, /* Mute */
 	{ 0x0507, KEY_AGAIN }, /* Recall */
 	{ 0x0508, KEY_VIDEO }, /* Source */
-	{ 0x0509, KEY_1 }, /* 1 */
-	{ 0x050a, KEY_2 }, /* 2 */
-	{ 0x050b, KEY_3 }, /* 3 */
-	{ 0x050c, KEY_4 }, /* 4 */
-	{ 0x050d, KEY_5 }, /* 5 */
-	{ 0x050e, KEY_6 }, /* 6 */
-	{ 0x050f, KEY_7 }, /* 7 */
-	{ 0x0510, KEY_8 }, /* 8 */
-	{ 0x0511, KEY_9 }, /* 9 */
-	{ 0x0512, KEY_0 }, /* 0 */
+	{ 0x0509, KEY_NUMERIC_1 }, /* 1 */
+	{ 0x050a, KEY_NUMERIC_2 }, /* 2 */
+	{ 0x050b, KEY_NUMERIC_3 }, /* 3 */
+	{ 0x050c, KEY_NUMERIC_4 }, /* 4 */
+	{ 0x050d, KEY_NUMERIC_5 }, /* 5 */
+	{ 0x050e, KEY_NUMERIC_6 }, /* 6 */
+	{ 0x050f, KEY_NUMERIC_7 }, /* 7 */
+	{ 0x0510, KEY_NUMERIC_8 }, /* 8 */
+	{ 0x0511, KEY_NUMERIC_9 }, /* 9 */
+	{ 0x0512, KEY_NUMERIC_0 }, /* 0 */
 	{ 0x0513, KEY_AUDIO }, /* Audio */
 	{ 0x0515, KEY_EPG }, /* EPG */
 	{ 0x0516, KEY_PLAYPAUSE }, /* Play/Pause */
diff --git a/drivers/media/rc/keymaps/rc-avermedia.c b/drivers/media/rc/keymaps/rc-avermedia.c
index 631ff52564f0..f96f229b70bb 100644
--- a/drivers/media/rc/keymaps/rc-avermedia.c
+++ b/drivers/media/rc/keymaps/rc-avermedia.c
@@ -11,16 +11,16 @@
 /* Alex Hermann <gaaf@gmx.net> */
 
 static struct rc_map_table avermedia[] = {
-	{ 0x28, KEY_1 },
-	{ 0x18, KEY_2 },
-	{ 0x38, KEY_3 },
-	{ 0x24, KEY_4 },
-	{ 0x14, KEY_5 },
-	{ 0x34, KEY_6 },
-	{ 0x2c, KEY_7 },
-	{ 0x1c, KEY_8 },
-	{ 0x3c, KEY_9 },
-	{ 0x22, KEY_0 },
+	{ 0x28, KEY_NUMERIC_1 },
+	{ 0x18, KEY_NUMERIC_2 },
+	{ 0x38, KEY_NUMERIC_3 },
+	{ 0x24, KEY_NUMERIC_4 },
+	{ 0x14, KEY_NUMERIC_5 },
+	{ 0x34, KEY_NUMERIC_6 },
+	{ 0x2c, KEY_NUMERIC_7 },
+	{ 0x1c, KEY_NUMERIC_8 },
+	{ 0x3c, KEY_NUMERIC_9 },
+	{ 0x22, KEY_NUMERIC_0 },
 
 	{ 0x20, KEY_TV },		/* TV/FM */
 	{ 0x10, KEY_CD },		/* CD */
diff --git a/drivers/media/rc/keymaps/rc-avertv-303.c b/drivers/media/rc/keymaps/rc-avertv-303.c
index 47ca8b7ea532..a3e2e945c769 100644
--- a/drivers/media/rc/keymaps/rc-avertv-303.c
+++ b/drivers/media/rc/keymaps/rc-avertv-303.c
@@ -11,16 +11,16 @@
 /* AVERTV STUDIO 303 Remote */
 
 static struct rc_map_table avertv_303[] = {
-	{ 0x2a, KEY_1 },
-	{ 0x32, KEY_2 },
-	{ 0x3a, KEY_3 },
-	{ 0x4a, KEY_4 },
-	{ 0x52, KEY_5 },
-	{ 0x5a, KEY_6 },
-	{ 0x6a, KEY_7 },
-	{ 0x72, KEY_8 },
-	{ 0x7a, KEY_9 },
-	{ 0x0e, KEY_0 },
+	{ 0x2a, KEY_NUMERIC_1 },
+	{ 0x32, KEY_NUMERIC_2 },
+	{ 0x3a, KEY_NUMERIC_3 },
+	{ 0x4a, KEY_NUMERIC_4 },
+	{ 0x52, KEY_NUMERIC_5 },
+	{ 0x5a, KEY_NUMERIC_6 },
+	{ 0x6a, KEY_NUMERIC_7 },
+	{ 0x72, KEY_NUMERIC_8 },
+	{ 0x7a, KEY_NUMERIC_9 },
+	{ 0x0e, KEY_NUMERIC_0 },
 
 	{ 0x02, KEY_POWER },
 	{ 0x22, KEY_VIDEO },
diff --git a/drivers/media/rc/keymaps/rc-azurewave-ad-tu700.c b/drivers/media/rc/keymaps/rc-azurewave-ad-tu700.c
index 8e7e95306a5c..5fc8e4cd102e 100644
--- a/drivers/media/rc/keymaps/rc-azurewave-ad-tu700.c
+++ b/drivers/media/rc/keymaps/rc-azurewave-ad-tu700.c
@@ -10,18 +10,18 @@
 
 static struct rc_map_table azurewave_ad_tu700[] = {
 	{ 0x0000, KEY_TAB },             /* Tab */
-	{ 0x0001, KEY_2 },
+	{ 0x0001, KEY_NUMERIC_2 },
 	{ 0x0002, KEY_CHANNELDOWN },
-	{ 0x0003, KEY_1 },
+	{ 0x0003, KEY_NUMERIC_1 },
 	{ 0x0004, KEY_MENU },            /* Record List */
 	{ 0x0005, KEY_CHANNELUP },
-	{ 0x0006, KEY_3 },
+	{ 0x0006, KEY_NUMERIC_3 },
 	{ 0x0007, KEY_SLEEP },           /* Hibernate */
 	{ 0x0008, KEY_VIDEO },           /* A/V */
-	{ 0x0009, KEY_4 },
+	{ 0x0009, KEY_NUMERIC_4 },
 	{ 0x000a, KEY_VOLUMEDOWN },
 	{ 0x000c, KEY_CANCEL },          /* Cancel */
-	{ 0x000d, KEY_7 },
+	{ 0x000d, KEY_NUMERIC_7 },
 	{ 0x000e, KEY_AGAIN },           /* Recall */
 	{ 0x000f, KEY_TEXT },            /* Teletext */
 	{ 0x0010, KEY_MUTE },
@@ -29,17 +29,17 @@ static struct rc_map_table azurewave_ad_tu700[] = {
 	{ 0x0012, KEY_FASTFORWARD },     /* FF >> */
 	{ 0x0013, KEY_BACK },            /* Back */
 	{ 0x0014, KEY_PLAY },
-	{ 0x0015, KEY_0 },
+	{ 0x0015, KEY_NUMERIC_0 },
 	{ 0x0016, KEY_POWER2 },          /* [red power button] */
 	{ 0x0017, KEY_FAVORITES },       /* Favorite List */
 	{ 0x0018, KEY_RED },
-	{ 0x0019, KEY_8 },
+	{ 0x0019, KEY_NUMERIC_8 },
 	{ 0x001a, KEY_STOP },
-	{ 0x001b, KEY_9 },
+	{ 0x001b, KEY_NUMERIC_9 },
 	{ 0x001c, KEY_EPG },             /* Info/EPG */
-	{ 0x001d, KEY_5 },
+	{ 0x001d, KEY_NUMERIC_5 },
 	{ 0x001e, KEY_VOLUMEUP },
-	{ 0x001f, KEY_6 },
+	{ 0x001f, KEY_NUMERIC_6 },
 	{ 0x0040, KEY_REWIND },          /* FR << */
 	{ 0x0041, KEY_PREVIOUS },        /* Replay */
 	{ 0x0042, KEY_NEXT },            /* Skip */
diff --git a/drivers/media/rc/keymaps/rc-behold-columbus.c b/drivers/media/rc/keymaps/rc-behold-columbus.c
index b68380a76010..8579b3d5128d 100644
--- a/drivers/media/rc/keymaps/rc-behold-columbus.c
+++ b/drivers/media/rc/keymaps/rc-behold-columbus.c
@@ -37,24 +37,24 @@ static struct rc_map_table behold_columbus[] = {
 	 *  0x07    0x08    0x09  0x10    *
 	 *   7       8       9    Zoom	  *
 	 *                                */
-	{ 0x01, KEY_1 },
-	{ 0x02, KEY_2 },
-	{ 0x03, KEY_3 },
+	{ 0x01, KEY_NUMERIC_1 },
+	{ 0x02, KEY_NUMERIC_2 },
+	{ 0x03, KEY_NUMERIC_3 },
 	{ 0x0D, KEY_SETUP },	  /* Setup key */
-	{ 0x04, KEY_4 },
-	{ 0x05, KEY_5 },
-	{ 0x06, KEY_6 },
+	{ 0x04, KEY_NUMERIC_4 },
+	{ 0x05, KEY_NUMERIC_5 },
+	{ 0x06, KEY_NUMERIC_6 },
 	{ 0x19, KEY_CAMERA },	/* Snapshot key */
-	{ 0x07, KEY_7 },
-	{ 0x08, KEY_8 },
-	{ 0x09, KEY_9 },
+	{ 0x07, KEY_NUMERIC_7 },
+	{ 0x08, KEY_NUMERIC_8 },
+	{ 0x09, KEY_NUMERIC_9 },
 	{ 0x10, KEY_ZOOM },
 
 	/*  0x0A    0x00    0x0B       0x0C   *
 	 * RECALL    0    ChannelUp  VolumeUp *
 	 *                                    */
 	{ 0x0A, KEY_AGAIN },
-	{ 0x00, KEY_0 },
+	{ 0x00, KEY_NUMERIC_0 },
 	{ 0x0B, KEY_CHANNELUP },
 	{ 0x0C, KEY_VOLUMEUP },
 
diff --git a/drivers/media/rc/keymaps/rc-behold.c b/drivers/media/rc/keymaps/rc-behold.c
index 2b7cddb2f36d..28397ce05a7f 100644
--- a/drivers/media/rc/keymaps/rc-behold.c
+++ b/drivers/media/rc/keymaps/rc-behold.c
@@ -37,21 +37,21 @@ static struct rc_map_table behold[] = {
 	 *  0x07    0x08    0x09  *
 	 *   7       8       9    *
 	 *                        */
-	{ 0x866b01, KEY_1 },
-	{ 0x866b02, KEY_2 },
-	{ 0x866b03, KEY_3 },
-	{ 0x866b04, KEY_4 },
-	{ 0x866b05, KEY_5 },
-	{ 0x866b06, KEY_6 },
-	{ 0x866b07, KEY_7 },
-	{ 0x866b08, KEY_8 },
-	{ 0x866b09, KEY_9 },
+	{ 0x866b01, KEY_NUMERIC_1 },
+	{ 0x866b02, KEY_NUMERIC_2 },
+	{ 0x866b03, KEY_NUMERIC_3 },
+	{ 0x866b04, KEY_NUMERIC_4 },
+	{ 0x866b05, KEY_NUMERIC_5 },
+	{ 0x866b06, KEY_NUMERIC_6 },
+	{ 0x866b07, KEY_NUMERIC_7 },
+	{ 0x866b08, KEY_NUMERIC_8 },
+	{ 0x866b09, KEY_NUMERIC_9 },
 
 	/*  0x0a    0x00    0x17  *
 	 * RECALL    0      MODE  *
 	 *                        */
 	{ 0x866b0a, KEY_AGAIN },
-	{ 0x866b00, KEY_0 },
+	{ 0x866b00, KEY_NUMERIC_0 },
 	{ 0x866b17, KEY_MODE },
 
 	/*  0x14          0x10    *
diff --git a/drivers/media/rc/keymaps/rc-budget-ci-old.c b/drivers/media/rc/keymaps/rc-budget-ci-old.c
index 56f051af6154..6ca822256862 100644
--- a/drivers/media/rc/keymaps/rc-budget-ci-old.c
+++ b/drivers/media/rc/keymaps/rc-budget-ci-old.c
@@ -16,16 +16,16 @@
  */
 
 static struct rc_map_table budget_ci_old[] = {
-	{ 0x00, KEY_0 },
-	{ 0x01, KEY_1 },
-	{ 0x02, KEY_2 },
-	{ 0x03, KEY_3 },
-	{ 0x04, KEY_4 },
-	{ 0x05, KEY_5 },
-	{ 0x06, KEY_6 },
-	{ 0x07, KEY_7 },
-	{ 0x08, KEY_8 },
-	{ 0x09, KEY_9 },
+	{ 0x00, KEY_NUMERIC_0 },
+	{ 0x01, KEY_NUMERIC_1 },
+	{ 0x02, KEY_NUMERIC_2 },
+	{ 0x03, KEY_NUMERIC_3 },
+	{ 0x04, KEY_NUMERIC_4 },
+	{ 0x05, KEY_NUMERIC_5 },
+	{ 0x06, KEY_NUMERIC_6 },
+	{ 0x07, KEY_NUMERIC_7 },
+	{ 0x08, KEY_NUMERIC_8 },
+	{ 0x09, KEY_NUMERIC_9 },
 	{ 0x0a, KEY_ENTER },
 	{ 0x0b, KEY_RED },
 	{ 0x0c, KEY_POWER },		/* RADIO on Hauppauge */
diff --git a/drivers/media/rc/keymaps/rc-cinergy-1400.c b/drivers/media/rc/keymaps/rc-cinergy-1400.c
index dacb13c53bb4..4433d28b219c 100644
--- a/drivers/media/rc/keymaps/rc-cinergy-1400.c
+++ b/drivers/media/rc/keymaps/rc-cinergy-1400.c
@@ -12,16 +12,16 @@
 
 static struct rc_map_table cinergy_1400[] = {
 	{ 0x01, KEY_POWER },
-	{ 0x02, KEY_1 },
-	{ 0x03, KEY_2 },
-	{ 0x04, KEY_3 },
-	{ 0x05, KEY_4 },
-	{ 0x06, KEY_5 },
-	{ 0x07, KEY_6 },
-	{ 0x08, KEY_7 },
-	{ 0x09, KEY_8 },
-	{ 0x0a, KEY_9 },
-	{ 0x0c, KEY_0 },
+	{ 0x02, KEY_NUMERIC_1 },
+	{ 0x03, KEY_NUMERIC_2 },
+	{ 0x04, KEY_NUMERIC_3 },
+	{ 0x05, KEY_NUMERIC_4 },
+	{ 0x06, KEY_NUMERIC_5 },
+	{ 0x07, KEY_NUMERIC_6 },
+	{ 0x08, KEY_NUMERIC_7 },
+	{ 0x09, KEY_NUMERIC_8 },
+	{ 0x0a, KEY_NUMERIC_9 },
+	{ 0x0c, KEY_NUMERIC_0 },
 
 	{ 0x0b, KEY_VIDEO },
 	{ 0x0d, KEY_REFRESH },
diff --git a/drivers/media/rc/keymaps/rc-cinergy.c b/drivers/media/rc/keymaps/rc-cinergy.c
index 6ab2e51b764d..b34a37b8fe61 100644
--- a/drivers/media/rc/keymaps/rc-cinergy.c
+++ b/drivers/media/rc/keymaps/rc-cinergy.c
@@ -9,16 +9,16 @@
 #include <linux/module.h>
 
 static struct rc_map_table cinergy[] = {
-	{ 0x00, KEY_0 },
-	{ 0x01, KEY_1 },
-	{ 0x02, KEY_2 },
-	{ 0x03, KEY_3 },
-	{ 0x04, KEY_4 },
-	{ 0x05, KEY_5 },
-	{ 0x06, KEY_6 },
-	{ 0x07, KEY_7 },
-	{ 0x08, KEY_8 },
-	{ 0x09, KEY_9 },
+	{ 0x00, KEY_NUMERIC_0 },
+	{ 0x01, KEY_NUMERIC_1 },
+	{ 0x02, KEY_NUMERIC_2 },
+	{ 0x03, KEY_NUMERIC_3 },
+	{ 0x04, KEY_NUMERIC_4 },
+	{ 0x05, KEY_NUMERIC_5 },
+	{ 0x06, KEY_NUMERIC_6 },
+	{ 0x07, KEY_NUMERIC_7 },
+	{ 0x08, KEY_NUMERIC_8 },
+	{ 0x09, KEY_NUMERIC_9 },
 
 	{ 0x0a, KEY_POWER },
 	{ 0x0b, KEY_MEDIA },		/* app */
diff --git a/drivers/media/rc/keymaps/rc-d680-dmb.c b/drivers/media/rc/keymaps/rc-d680-dmb.c
index f67aa597a75b..d491a5e9750f 100644
--- a/drivers/media/rc/keymaps/rc-d680-dmb.c
+++ b/drivers/media/rc/keymaps/rc-d680-dmb.c
@@ -11,16 +11,16 @@
 static struct rc_map_table rc_map_d680_dmb_table[] = {
 	{ 0x0038, KEY_SWITCHVIDEOMODE },	/* TV/AV */
 	{ 0x080c, KEY_ZOOM },
-	{ 0x0800, KEY_0 },
-	{ 0x0001, KEY_1 },
-	{ 0x0802, KEY_2 },
-	{ 0x0003, KEY_3 },
-	{ 0x0804, KEY_4 },
-	{ 0x0005, KEY_5 },
-	{ 0x0806, KEY_6 },
-	{ 0x0007, KEY_7 },
-	{ 0x0808, KEY_8 },
-	{ 0x0009, KEY_9 },
+	{ 0x0800, KEY_NUMERIC_0 },
+	{ 0x0001, KEY_NUMERIC_1 },
+	{ 0x0802, KEY_NUMERIC_2 },
+	{ 0x0003, KEY_NUMERIC_3 },
+	{ 0x0804, KEY_NUMERIC_4 },
+	{ 0x0005, KEY_NUMERIC_5 },
+	{ 0x0806, KEY_NUMERIC_6 },
+	{ 0x0007, KEY_NUMERIC_7 },
+	{ 0x0808, KEY_NUMERIC_8 },
+	{ 0x0009, KEY_NUMERIC_9 },
 	{ 0x000a, KEY_MUTE },
 	{ 0x0829, KEY_BACK },
 	{ 0x0012, KEY_CHANNELUP },
diff --git a/drivers/media/rc/keymaps/rc-delock-61959.c b/drivers/media/rc/keymaps/rc-delock-61959.c
index c60fc1e46fc5..529435e8d416 100644
--- a/drivers/media/rc/keymaps/rc-delock-61959.c
+++ b/drivers/media/rc/keymaps/rc-delock-61959.c
@@ -14,16 +14,16 @@ static struct rc_map_table delock_61959[] = {
 	{ 0x866b16, KEY_POWER2 },	/* Power */
 	{ 0x866b0c, KEY_POWER },	/* Shut Down */
 
-	{ 0x866b00, KEY_1},
-	{ 0x866b01, KEY_2},
-	{ 0x866b02, KEY_3},
-	{ 0x866b03, KEY_4},
-	{ 0x866b04, KEY_5},
-	{ 0x866b05, KEY_6},
-	{ 0x866b06, KEY_7},
-	{ 0x866b07, KEY_8},
-	{ 0x866b08, KEY_9},
-	{ 0x866b14, KEY_0},
+	{ 0x866b00, KEY_NUMERIC_1},
+	{ 0x866b01, KEY_NUMERIC_2},
+	{ 0x866b02, KEY_NUMERIC_3},
+	{ 0x866b03, KEY_NUMERIC_4},
+	{ 0x866b04, KEY_NUMERIC_5},
+	{ 0x866b05, KEY_NUMERIC_6},
+	{ 0x866b06, KEY_NUMERIC_7},
+	{ 0x866b07, KEY_NUMERIC_8},
+	{ 0x866b08, KEY_NUMERIC_9},
+	{ 0x866b14, KEY_NUMERIC_0},
 
 	{ 0x866b0a, KEY_ZOOM},		/* Full Screen */
 	{ 0x866b10, KEY_CAMERA},	/* Photo */
diff --git a/drivers/media/rc/keymaps/rc-dib0700-nec.c b/drivers/media/rc/keymaps/rc-dib0700-nec.c
index 4ee801acb089..f1fcdf16f485 100644
--- a/drivers/media/rc/keymaps/rc-dib0700-nec.c
+++ b/drivers/media/rc/keymaps/rc-dib0700-nec.c
@@ -17,16 +17,16 @@ static struct rc_map_table dib0700_nec_table[] = {
 	/* Key codes for the Pixelview SBTVD remote */
 	{ 0x866b13, KEY_MUTE },
 	{ 0x866b12, KEY_POWER },
-	{ 0x866b01, KEY_1 },
-	{ 0x866b02, KEY_2 },
-	{ 0x866b03, KEY_3 },
-	{ 0x866b04, KEY_4 },
-	{ 0x866b05, KEY_5 },
-	{ 0x866b06, KEY_6 },
-	{ 0x866b07, KEY_7 },
-	{ 0x866b08, KEY_8 },
-	{ 0x866b09, KEY_9 },
-	{ 0x866b00, KEY_0 },
+	{ 0x866b01, KEY_NUMERIC_1 },
+	{ 0x866b02, KEY_NUMERIC_2 },
+	{ 0x866b03, KEY_NUMERIC_3 },
+	{ 0x866b04, KEY_NUMERIC_4 },
+	{ 0x866b05, KEY_NUMERIC_5 },
+	{ 0x866b06, KEY_NUMERIC_6 },
+	{ 0x866b07, KEY_NUMERIC_7 },
+	{ 0x866b08, KEY_NUMERIC_8 },
+	{ 0x866b09, KEY_NUMERIC_9 },
+	{ 0x866b00, KEY_NUMERIC_0 },
 	{ 0x866b0d, KEY_CHANNELUP },
 	{ 0x866b19, KEY_CHANNELDOWN },
 	{ 0x866b10, KEY_VOLUMEUP },
@@ -60,17 +60,17 @@ static struct rc_map_table dib0700_nec_table[] = {
 	/* Key codes for the Elgato EyeTV Diversity silver remote */
 	{ 0x4501, KEY_POWER },
 	{ 0x4502, KEY_MUTE },
-	{ 0x4503, KEY_1 },
-	{ 0x4504, KEY_2 },
-	{ 0x4505, KEY_3 },
-	{ 0x4506, KEY_4 },
-	{ 0x4507, KEY_5 },
-	{ 0x4508, KEY_6 },
-	{ 0x4509, KEY_7 },
-	{ 0x450a, KEY_8 },
-	{ 0x450b, KEY_9 },
+	{ 0x4503, KEY_NUMERIC_1 },
+	{ 0x4504, KEY_NUMERIC_2 },
+	{ 0x4505, KEY_NUMERIC_3 },
+	{ 0x4506, KEY_NUMERIC_4 },
+	{ 0x4507, KEY_NUMERIC_5 },
+	{ 0x4508, KEY_NUMERIC_6 },
+	{ 0x4509, KEY_NUMERIC_7 },
+	{ 0x450a, KEY_NUMERIC_8 },
+	{ 0x450b, KEY_NUMERIC_9 },
 	{ 0x450c, KEY_LAST },
-	{ 0x450d, KEY_0 },
+	{ 0x450d, KEY_NUMERIC_0 },
 	{ 0x450e, KEY_ENTER },
 	{ 0x450f, KEY_RED },
 	{ 0x4510, KEY_CHANNELUP },
diff --git a/drivers/media/rc/keymaps/rc-dib0700-rc5.c b/drivers/media/rc/keymaps/rc-dib0700-rc5.c
index ef4085a0fda3..002fffcba95d 100644
--- a/drivers/media/rc/keymaps/rc-dib0700-rc5.c
+++ b/drivers/media/rc/keymaps/rc-dib0700-rc5.c
@@ -22,16 +22,16 @@ static struct rc_map_table dib0700_rc5_table[] = {
 	{ 0x0709, KEY_VOLUMEDOWN },
 	{ 0x0706, KEY_CHANNELUP },
 	{ 0x070c, KEY_CHANNELDOWN },
-	{ 0x070f, KEY_1 },
-	{ 0x0715, KEY_2 },
-	{ 0x0710, KEY_3 },
-	{ 0x0718, KEY_4 },
-	{ 0x071b, KEY_5 },
-	{ 0x071e, KEY_6 },
-	{ 0x0711, KEY_7 },
-	{ 0x0721, KEY_8 },
-	{ 0x0712, KEY_9 },
-	{ 0x0727, KEY_0 },
+	{ 0x070f, KEY_NUMERIC_1 },
+	{ 0x0715, KEY_NUMERIC_2 },
+	{ 0x0710, KEY_NUMERIC_3 },
+	{ 0x0718, KEY_NUMERIC_4 },
+	{ 0x071b, KEY_NUMERIC_5 },
+	{ 0x071e, KEY_NUMERIC_6 },
+	{ 0x0711, KEY_NUMERIC_7 },
+	{ 0x0721, KEY_NUMERIC_8 },
+	{ 0x0712, KEY_NUMERIC_9 },
+	{ 0x0727, KEY_NUMERIC_0 },
 	{ 0x0724, KEY_SCREEN }, /* 'Square' key */
 	{ 0x072a, KEY_TEXT },   /* 'T' key */
 	{ 0x072d, KEY_REWIND },
@@ -43,17 +43,17 @@ static struct rc_map_table dib0700_rc5_table[] = {
 
 	/* Key codes for the Terratec Cinergy DT XS Diversity, similar to cinergyT2.c */
 	{ 0xeb01, KEY_POWER },
-	{ 0xeb02, KEY_1 },
-	{ 0xeb03, KEY_2 },
-	{ 0xeb04, KEY_3 },
-	{ 0xeb05, KEY_4 },
-	{ 0xeb06, KEY_5 },
-	{ 0xeb07, KEY_6 },
-	{ 0xeb08, KEY_7 },
-	{ 0xeb09, KEY_8 },
-	{ 0xeb0a, KEY_9 },
+	{ 0xeb02, KEY_NUMERIC_1 },
+	{ 0xeb03, KEY_NUMERIC_2 },
+	{ 0xeb04, KEY_NUMERIC_3 },
+	{ 0xeb05, KEY_NUMERIC_4 },
+	{ 0xeb06, KEY_NUMERIC_5 },
+	{ 0xeb07, KEY_NUMERIC_6 },
+	{ 0xeb08, KEY_NUMERIC_7 },
+	{ 0xeb09, KEY_NUMERIC_8 },
+	{ 0xeb0a, KEY_NUMERIC_9 },
 	{ 0xeb0b, KEY_VIDEO },
-	{ 0xeb0c, KEY_0 },
+	{ 0xeb0c, KEY_NUMERIC_0 },
 	{ 0xeb0d, KEY_REFRESH },
 	{ 0xeb0f, KEY_EPG },
 	{ 0xeb10, KEY_UP },
@@ -92,16 +92,16 @@ static struct rc_map_table dib0700_rc5_table[] = {
 	{ 0xeb5c, KEY_NEXT },
 
 	/* Key codes for the Haupauge WinTV Nova-TD, copied from nova-t-usb2.c (Nova-T USB2) */
-	{ 0x1e00, KEY_0 },
-	{ 0x1e01, KEY_1 },
-	{ 0x1e02, KEY_2 },
-	{ 0x1e03, KEY_3 },
-	{ 0x1e04, KEY_4 },
-	{ 0x1e05, KEY_5 },
-	{ 0x1e06, KEY_6 },
-	{ 0x1e07, KEY_7 },
-	{ 0x1e08, KEY_8 },
-	{ 0x1e09, KEY_9 },
+	{ 0x1e00, KEY_NUMERIC_0 },
+	{ 0x1e01, KEY_NUMERIC_1 },
+	{ 0x1e02, KEY_NUMERIC_2 },
+	{ 0x1e03, KEY_NUMERIC_3 },
+	{ 0x1e04, KEY_NUMERIC_4 },
+	{ 0x1e05, KEY_NUMERIC_5 },
+	{ 0x1e06, KEY_NUMERIC_6 },
+	{ 0x1e07, KEY_NUMERIC_7 },
+	{ 0x1e08, KEY_NUMERIC_8 },
+	{ 0x1e09, KEY_NUMERIC_9 },
 	{ 0x1e0a, KEY_KPASTERISK },
 	{ 0x1e0b, KEY_RED },
 	{ 0x1e0c, KEY_RADIO },
@@ -144,16 +144,16 @@ static struct rc_map_table dib0700_rc5_table[] = {
 	{ 0x0f4e, KEY_PRINT }, /* PREVIEW */
 	{ 0x0840, KEY_SCREEN }, /* full screen toggle*/
 	{ 0x0f71, KEY_DOT }, /* frequency */
-	{ 0x0743, KEY_0 },
-	{ 0x0c41, KEY_1 },
-	{ 0x0443, KEY_2 },
-	{ 0x0b7f, KEY_3 },
-	{ 0x0e41, KEY_4 },
-	{ 0x0643, KEY_5 },
-	{ 0x097f, KEY_6 },
-	{ 0x0d7e, KEY_7 },
-	{ 0x057c, KEY_8 },
-	{ 0x0a40, KEY_9 },
+	{ 0x0743, KEY_NUMERIC_0 },
+	{ 0x0c41, KEY_NUMERIC_1 },
+	{ 0x0443, KEY_NUMERIC_2 },
+	{ 0x0b7f, KEY_NUMERIC_3 },
+	{ 0x0e41, KEY_NUMERIC_4 },
+	{ 0x0643, KEY_NUMERIC_5 },
+	{ 0x097f, KEY_NUMERIC_6 },
+	{ 0x0d7e, KEY_NUMERIC_7 },
+	{ 0x057c, KEY_NUMERIC_8 },
+	{ 0x0a40, KEY_NUMERIC_9 },
 	{ 0x0e4e, KEY_CLEAR },
 	{ 0x047c, KEY_CHANNEL }, /* show channel number */
 	{ 0x0f41, KEY_LAST }, /* recall */
@@ -168,16 +168,16 @@ static struct rc_map_table dib0700_rc5_table[] = {
 	{ 0x007d, KEY_CHANNELDOWN },
 
 	/* Key codes for Nova-TD "credit card" remote control. */
-	{ 0x1d00, KEY_0 },
-	{ 0x1d01, KEY_1 },
-	{ 0x1d02, KEY_2 },
-	{ 0x1d03, KEY_3 },
-	{ 0x1d04, KEY_4 },
-	{ 0x1d05, KEY_5 },
-	{ 0x1d06, KEY_6 },
-	{ 0x1d07, KEY_7 },
-	{ 0x1d08, KEY_8 },
-	{ 0x1d09, KEY_9 },
+	{ 0x1d00, KEY_NUMERIC_0 },
+	{ 0x1d01, KEY_NUMERIC_1 },
+	{ 0x1d02, KEY_NUMERIC_2 },
+	{ 0x1d03, KEY_NUMERIC_3 },
+	{ 0x1d04, KEY_NUMERIC_4 },
+	{ 0x1d05, KEY_NUMERIC_5 },
+	{ 0x1d06, KEY_NUMERIC_6 },
+	{ 0x1d07, KEY_NUMERIC_7 },
+	{ 0x1d08, KEY_NUMERIC_8 },
+	{ 0x1d09, KEY_NUMERIC_9 },
 	{ 0x1d0a, KEY_TEXT },
 	{ 0x1d0d, KEY_MENU },
 	{ 0x1d0f, KEY_MUTE },
diff --git a/drivers/media/rc/keymaps/rc-digitalnow-tinytwin.c b/drivers/media/rc/keymaps/rc-digitalnow-tinytwin.c
index f4d0799dcc72..2466d8c50226 100644
--- a/drivers/media/rc/keymaps/rc-digitalnow-tinytwin.c
+++ b/drivers/media/rc/keymaps/rc-digitalnow-tinytwin.c
@@ -12,14 +12,14 @@ static struct rc_map_table digitalnow_tinytwin[] = {
 	{ 0x0000, KEY_MUTE },            /* [symbol speaker] */
 	{ 0x0001, KEY_VOLUMEUP },
 	{ 0x0002, KEY_POWER2 },          /* TV [power button] */
-	{ 0x0003, KEY_2 },
-	{ 0x0004, KEY_3 },
-	{ 0x0005, KEY_4 },
-	{ 0x0006, KEY_6 },
-	{ 0x0007, KEY_7 },
-	{ 0x0008, KEY_8 },
+	{ 0x0003, KEY_NUMERIC_2 },
+	{ 0x0004, KEY_NUMERIC_3 },
+	{ 0x0005, KEY_NUMERIC_4 },
+	{ 0x0006, KEY_NUMERIC_6 },
+	{ 0x0007, KEY_NUMERIC_7 },
+	{ 0x0008, KEY_NUMERIC_8 },
 	{ 0x0009, KEY_NUMERIC_STAR },    /* [*] */
-	{ 0x000a, KEY_0 },
+	{ 0x000a, KEY_NUMERIC_0 },
 	{ 0x000b, KEY_NUMERIC_POUND },   /* [#] */
 	{ 0x000c, KEY_RIGHT },           /* [right arrow] */
 	{ 0x000d, KEY_HOMEPAGE },        /* [symbol home] Start */
@@ -36,10 +36,10 @@ static struct rc_map_table digitalnow_tinytwin[] = {
 	{ 0x0019, KEY_BLUE },            /* [blue] MyTV */
 	{ 0x001a, KEY_REWIND },          /* REW [<<] */
 	{ 0x001b, KEY_PLAY },            /* PLAY */
-	{ 0x001c, KEY_5 },
-	{ 0x001d, KEY_9 },
+	{ 0x001c, KEY_NUMERIC_5 },
+	{ 0x001d, KEY_NUMERIC_9 },
 	{ 0x001e, KEY_VOLUMEDOWN },
-	{ 0x001f, KEY_1 },
+	{ 0x001f, KEY_NUMERIC_1 },
 	{ 0x0040, KEY_STOP },            /* STOP */
 	{ 0x0042, KEY_PAUSE },           /* PAUSE */
 	{ 0x0043, KEY_SCREEN },          /* Aspect */
diff --git a/drivers/media/rc/keymaps/rc-digittrade.c b/drivers/media/rc/keymaps/rc-digittrade.c
index 6849f1a5721c..65bc8ad7e52c 100644
--- a/drivers/media/rc/keymaps/rc-digittrade.c
+++ b/drivers/media/rc/keymaps/rc-digittrade.c
@@ -14,11 +14,11 @@
 
 /* Digittrade DVB-T USB Stick */
 static struct rc_map_table digittrade[] = {
-	{ 0x0000, KEY_9 },
+	{ 0x0000, KEY_NUMERIC_9 },
 	{ 0x0001, KEY_EPG },             /* EPG */
 	{ 0x0002, KEY_VOLUMEDOWN },      /* Vol Dn */
 	{ 0x0003, KEY_TEXT },            /* TELETEXT */
-	{ 0x0004, KEY_8 },
+	{ 0x0004, KEY_NUMERIC_8 },
 	{ 0x0005, KEY_MUTE },            /* MUTE */
 	{ 0x0006, KEY_POWER2 },          /* POWER */
 	{ 0x0009, KEY_ZOOM },            /* FULLSCREEN */
@@ -26,22 +26,22 @@ static struct rc_map_table digittrade[] = {
 	{ 0x000d, KEY_SUBTITLE },        /* SUBTITLE */
 	{ 0x000e, KEY_STOP },            /* STOP */
 	{ 0x0010, KEY_OK },              /* RETURN */
-	{ 0x0011, KEY_2 },
-	{ 0x0012, KEY_4 },
-	{ 0x0015, KEY_3 },
-	{ 0x0016, KEY_5 },
+	{ 0x0011, KEY_NUMERIC_2 },
+	{ 0x0012, KEY_NUMERIC_4 },
+	{ 0x0015, KEY_NUMERIC_3 },
+	{ 0x0016, KEY_NUMERIC_5 },
 	{ 0x0017, KEY_CHANNELDOWN },     /* Ch Dn */
 	{ 0x0019, KEY_CHANNELUP },       /* CH Up */
 	{ 0x001a, KEY_PAUSE },           /* PAUSE */
-	{ 0x001b, KEY_1 },
+	{ 0x001b, KEY_NUMERIC_1 },
 	{ 0x001d, KEY_AUDIO },           /* DUAL SOUND */
 	{ 0x001e, KEY_PLAY },            /* PLAY */
 	{ 0x001f, KEY_CAMERA },          /* SNAPSHOT */
 	{ 0x0040, KEY_VOLUMEUP },        /* Vol Up */
-	{ 0x0048, KEY_7 },
-	{ 0x004c, KEY_6 },
+	{ 0x0048, KEY_NUMERIC_7 },
+	{ 0x004c, KEY_NUMERIC_6 },
 	{ 0x004d, KEY_PLAYPAUSE },       /* TIMESHIFT */
-	{ 0x0054, KEY_0 },
+	{ 0x0054, KEY_NUMERIC_0 },
 };
 
 static struct rc_map_list digittrade_map = {
diff --git a/drivers/media/rc/keymaps/rc-dm1105-nec.c b/drivers/media/rc/keymaps/rc-dm1105-nec.c
index d853cd9a0936..cd0b985c994d 100644
--- a/drivers/media/rc/keymaps/rc-dm1105-nec.c
+++ b/drivers/media/rc/keymaps/rc-dm1105-nec.c
@@ -15,16 +15,16 @@
 static struct rc_map_table dm1105_nec[] = {
 	{ 0x0a, KEY_POWER2},		/* power */
 	{ 0x0c, KEY_MUTE},		/* mute */
-	{ 0x11, KEY_1},
-	{ 0x12, KEY_2},
-	{ 0x13, KEY_3},
-	{ 0x14, KEY_4},
-	{ 0x15, KEY_5},
-	{ 0x16, KEY_6},
-	{ 0x17, KEY_7},
-	{ 0x18, KEY_8},
-	{ 0x19, KEY_9},
-	{ 0x10, KEY_0},
+	{ 0x11, KEY_NUMERIC_1},
+	{ 0x12, KEY_NUMERIC_2},
+	{ 0x13, KEY_NUMERIC_3},
+	{ 0x14, KEY_NUMERIC_4},
+	{ 0x15, KEY_NUMERIC_5},
+	{ 0x16, KEY_NUMERIC_6},
+	{ 0x17, KEY_NUMERIC_7},
+	{ 0x18, KEY_NUMERIC_8},
+	{ 0x19, KEY_NUMERIC_9},
+	{ 0x10, KEY_NUMERIC_0},
 	{ 0x1c, KEY_CHANNELUP},		/* ch+ */
 	{ 0x0f, KEY_CHANNELDOWN},	/* ch- */
 	{ 0x1a, KEY_VOLUMEUP},		/* vol+ */
diff --git a/drivers/media/rc/keymaps/rc-dntv-live-dvb-t.c b/drivers/media/rc/keymaps/rc-dntv-live-dvb-t.c
index cdc1d8c990cb..a82f64dc9411 100644
--- a/drivers/media/rc/keymaps/rc-dntv-live-dvb-t.c
+++ b/drivers/media/rc/keymaps/rc-dntv-live-dvb-t.c
@@ -13,16 +13,16 @@
 static struct rc_map_table dntv_live_dvb_t[] = {
 	{ 0x00, KEY_ESC },		/* 'go up a level?' */
 	/* Keys 0 to 9 */
-	{ 0x0a, KEY_0 },
-	{ 0x01, KEY_1 },
-	{ 0x02, KEY_2 },
-	{ 0x03, KEY_3 },
-	{ 0x04, KEY_4 },
-	{ 0x05, KEY_5 },
-	{ 0x06, KEY_6 },
-	{ 0x07, KEY_7 },
-	{ 0x08, KEY_8 },
-	{ 0x09, KEY_9 },
+	{ 0x0a, KEY_NUMERIC_0 },
+	{ 0x01, KEY_NUMERIC_1 },
+	{ 0x02, KEY_NUMERIC_2 },
+	{ 0x03, KEY_NUMERIC_3 },
+	{ 0x04, KEY_NUMERIC_4 },
+	{ 0x05, KEY_NUMERIC_5 },
+	{ 0x06, KEY_NUMERIC_6 },
+	{ 0x07, KEY_NUMERIC_7 },
+	{ 0x08, KEY_NUMERIC_8 },
+	{ 0x09, KEY_NUMERIC_9 },
 
 	{ 0x0b, KEY_TUNER },		/* tv/fm */
 	{ 0x0c, KEY_SEARCH },		/* scan */
diff --git a/drivers/media/rc/keymaps/rc-dntv-live-dvbt-pro.c b/drivers/media/rc/keymaps/rc-dntv-live-dvbt-pro.c
index 38e1d1b837da..d3f5048a0220 100644
--- a/drivers/media/rc/keymaps/rc-dntv-live-dvbt-pro.c
+++ b/drivers/media/rc/keymaps/rc-dntv-live-dvbt-pro.c
@@ -18,17 +18,17 @@ static struct rc_map_table dntv_live_dvbt_pro[] = {
 	{ 0x58, KEY_TUNER },		/* digital Radio */
 	{ 0x5a, KEY_RADIO },		/* FM radio */
 	{ 0x59, KEY_DVD },		/* dvd menu */
-	{ 0x03, KEY_1 },
-	{ 0x01, KEY_2 },
-	{ 0x06, KEY_3 },
-	{ 0x09, KEY_4 },
-	{ 0x1d, KEY_5 },
-	{ 0x1f, KEY_6 },
-	{ 0x0d, KEY_7 },
-	{ 0x19, KEY_8 },
-	{ 0x1b, KEY_9 },
+	{ 0x03, KEY_NUMERIC_1 },
+	{ 0x01, KEY_NUMERIC_2 },
+	{ 0x06, KEY_NUMERIC_3 },
+	{ 0x09, KEY_NUMERIC_4 },
+	{ 0x1d, KEY_NUMERIC_5 },
+	{ 0x1f, KEY_NUMERIC_6 },
+	{ 0x0d, KEY_NUMERIC_7 },
+	{ 0x19, KEY_NUMERIC_8 },
+	{ 0x1b, KEY_NUMERIC_9 },
 	{ 0x0c, KEY_CANCEL },
-	{ 0x15, KEY_0 },
+	{ 0x15, KEY_NUMERIC_0 },
 	{ 0x4a, KEY_CLEAR },
 	{ 0x13, KEY_BACK },
 	{ 0x00, KEY_TAB },
diff --git a/drivers/media/rc/keymaps/rc-dtt200u.c b/drivers/media/rc/keymaps/rc-dtt200u.c
index 86fd6a1668af..e7f87baa3212 100644
--- a/drivers/media/rc/keymaps/rc-dtt200u.c
+++ b/drivers/media/rc/keymaps/rc-dtt200u.c
@@ -12,21 +12,21 @@ static struct rc_map_table dtt200u_table[] = {
 	{ 0x8001, KEY_MUTE },
 	{ 0x8002, KEY_CHANNELDOWN },
 	{ 0x8003, KEY_VOLUMEDOWN },
-	{ 0x8004, KEY_1 },
-	{ 0x8005, KEY_2 },
-	{ 0x8006, KEY_3 },
-	{ 0x8007, KEY_4 },
-	{ 0x8008, KEY_5 },
-	{ 0x8009, KEY_6 },
-	{ 0x800a, KEY_7 },
+	{ 0x8004, KEY_NUMERIC_1 },
+	{ 0x8005, KEY_NUMERIC_2 },
+	{ 0x8006, KEY_NUMERIC_3 },
+	{ 0x8007, KEY_NUMERIC_4 },
+	{ 0x8008, KEY_NUMERIC_5 },
+	{ 0x8009, KEY_NUMERIC_6 },
+	{ 0x800a, KEY_NUMERIC_7 },
 	{ 0x800c, KEY_ZOOM },
-	{ 0x800d, KEY_0 },
+	{ 0x800d, KEY_NUMERIC_0 },
 	{ 0x800e, KEY_SELECT },
 	{ 0x8012, KEY_POWER },
 	{ 0x801a, KEY_CHANNELUP },
-	{ 0x801b, KEY_8 },
+	{ 0x801b, KEY_NUMERIC_8 },
 	{ 0x801e, KEY_VOLUMEUP },
-	{ 0x801f, KEY_9 },
+	{ 0x801f, KEY_NUMERIC_9 },
 };
 
 static struct rc_map_list dtt200u_map = {
diff --git a/drivers/media/rc/keymaps/rc-dvbsky.c b/drivers/media/rc/keymaps/rc-dvbsky.c
index 4b61f60a4854..f5063af2e5bc 100644
--- a/drivers/media/rc/keymaps/rc-dvbsky.c
+++ b/drivers/media/rc/keymaps/rc-dvbsky.c
@@ -13,16 +13,16 @@
  */
 
 static struct rc_map_table rc5_dvbsky[] = {
-	{ 0x0000, KEY_0 },
-	{ 0x0001, KEY_1 },
-	{ 0x0002, KEY_2 },
-	{ 0x0003, KEY_3 },
-	{ 0x0004, KEY_4 },
-	{ 0x0005, KEY_5 },
-	{ 0x0006, KEY_6 },
-	{ 0x0007, KEY_7 },
-	{ 0x0008, KEY_8 },
-	{ 0x0009, KEY_9 },
+	{ 0x0000, KEY_NUMERIC_0 },
+	{ 0x0001, KEY_NUMERIC_1 },
+	{ 0x0002, KEY_NUMERIC_2 },
+	{ 0x0003, KEY_NUMERIC_3 },
+	{ 0x0004, KEY_NUMERIC_4 },
+	{ 0x0005, KEY_NUMERIC_5 },
+	{ 0x0006, KEY_NUMERIC_6 },
+	{ 0x0007, KEY_NUMERIC_7 },
+	{ 0x0008, KEY_NUMERIC_8 },
+	{ 0x0009, KEY_NUMERIC_9 },
 	{ 0x000a, KEY_MUTE },
 	{ 0x000d, KEY_OK },
 	{ 0x000b, KEY_STOP },
diff --git a/drivers/media/rc/keymaps/rc-dvico-mce.c b/drivers/media/rc/keymaps/rc-dvico-mce.c
index 8342c32f58fd..b1bb8cdb3705 100644
--- a/drivers/media/rc/keymaps/rc-dvico-mce.c
+++ b/drivers/media/rc/keymaps/rc-dvico-mce.c
@@ -35,17 +35,17 @@ static struct rc_map_table rc_map_dvico_mce_table[] = {
 	{ 0x0152, KEY_CAMERA },
 	{ 0x015a, KEY_TUNER },	/* Live */
 	{ 0x0119, KEY_OPEN },
-	{ 0x010b, KEY_1 },
-	{ 0x0117, KEY_2 },
-	{ 0x011b, KEY_3 },
-	{ 0x0107, KEY_4 },
-	{ 0x0150, KEY_5 },
-	{ 0x0154, KEY_6 },
-	{ 0x0148, KEY_7 },
-	{ 0x014c, KEY_8 },
-	{ 0x0158, KEY_9 },
+	{ 0x010b, KEY_NUMERIC_1 },
+	{ 0x0117, KEY_NUMERIC_2 },
+	{ 0x011b, KEY_NUMERIC_3 },
+	{ 0x0107, KEY_NUMERIC_4 },
+	{ 0x0150, KEY_NUMERIC_5 },
+	{ 0x0154, KEY_NUMERIC_6 },
+	{ 0x0148, KEY_NUMERIC_7 },
+	{ 0x014c, KEY_NUMERIC_8 },
+	{ 0x0158, KEY_NUMERIC_9 },
 	{ 0x0113, KEY_ANGLE },	/* Aspect */
-	{ 0x0103, KEY_0 },
+	{ 0x0103, KEY_NUMERIC_0 },
 	{ 0x011f, KEY_ZOOM },
 	{ 0x0143, KEY_REWIND },
 	{ 0x0147, KEY_PLAYPAUSE },
diff --git a/drivers/media/rc/keymaps/rc-dvico-portable.c b/drivers/media/rc/keymaps/rc-dvico-portable.c
index 366bd10bf987..ec12ba6995dc 100644
--- a/drivers/media/rc/keymaps/rc-dvico-portable.c
+++ b/drivers/media/rc/keymaps/rc-dvico-portable.c
@@ -24,17 +24,17 @@ static struct rc_map_table rc_map_dvico_portable_table[] = {
 	{ 0x0316, KEY_CAMERA },
 	{ 0x0340, KEY_TUNER },	/* ATV/DTV */
 	{ 0x0345, KEY_OPEN },
-	{ 0x0319, KEY_1 },
-	{ 0x0318, KEY_2 },
-	{ 0x031b, KEY_3 },
-	{ 0x031a, KEY_4 },
-	{ 0x0358, KEY_5 },
-	{ 0x0359, KEY_6 },
-	{ 0x0315, KEY_7 },
-	{ 0x0314, KEY_8 },
-	{ 0x0317, KEY_9 },
+	{ 0x0319, KEY_NUMERIC_1 },
+	{ 0x0318, KEY_NUMERIC_2 },
+	{ 0x031b, KEY_NUMERIC_3 },
+	{ 0x031a, KEY_NUMERIC_4 },
+	{ 0x0358, KEY_NUMERIC_5 },
+	{ 0x0359, KEY_NUMERIC_6 },
+	{ 0x0315, KEY_NUMERIC_7 },
+	{ 0x0314, KEY_NUMERIC_8 },
+	{ 0x0317, KEY_NUMERIC_9 },
 	{ 0x0344, KEY_ANGLE },	/* Aspect */
-	{ 0x0355, KEY_0 },
+	{ 0x0355, KEY_NUMERIC_0 },
 	{ 0x0307, KEY_ZOOM },
 	{ 0x030a, KEY_REWIND },
 	{ 0x0308, KEY_PLAYPAUSE },
diff --git a/drivers/media/rc/keymaps/rc-em-terratec.c b/drivers/media/rc/keymaps/rc-em-terratec.c
index cbbba21484fb..a1f59aa6ff23 100644
--- a/drivers/media/rc/keymaps/rc-em-terratec.c
+++ b/drivers/media/rc/keymaps/rc-em-terratec.c
@@ -13,19 +13,19 @@ static struct rc_map_table em_terratec[] = {
 	{ 0x02, KEY_SELECT },
 	{ 0x03, KEY_MUTE },
 	{ 0x04, KEY_POWER },
-	{ 0x05, KEY_1 },
-	{ 0x06, KEY_2 },
-	{ 0x07, KEY_3 },
+	{ 0x05, KEY_NUMERIC_1 },
+	{ 0x06, KEY_NUMERIC_2 },
+	{ 0x07, KEY_NUMERIC_3 },
 	{ 0x08, KEY_CHANNELUP },
-	{ 0x09, KEY_4 },
-	{ 0x0a, KEY_5 },
-	{ 0x0b, KEY_6 },
+	{ 0x09, KEY_NUMERIC_4 },
+	{ 0x0a, KEY_NUMERIC_5 },
+	{ 0x0b, KEY_NUMERIC_6 },
 	{ 0x0c, KEY_CHANNELDOWN },
-	{ 0x0d, KEY_7 },
-	{ 0x0e, KEY_8 },
-	{ 0x0f, KEY_9 },
+	{ 0x0d, KEY_NUMERIC_7 },
+	{ 0x0e, KEY_NUMERIC_8 },
+	{ 0x0f, KEY_NUMERIC_9 },
 	{ 0x10, KEY_VOLUMEUP },
-	{ 0x11, KEY_0 },
+	{ 0x11, KEY_NUMERIC_0 },
 	{ 0x12, KEY_MENU },
 	{ 0x13, KEY_PRINT },
 	{ 0x14, KEY_VOLUMEDOWN },
diff --git a/drivers/media/rc/keymaps/rc-encore-enltv-fm53.c b/drivers/media/rc/keymaps/rc-encore-enltv-fm53.c
index 057c13b765ef..7a00471b6005 100644
--- a/drivers/media/rc/keymaps/rc-encore-enltv-fm53.c
+++ b/drivers/media/rc/keymaps/rc-encore-enltv-fm53.c
@@ -16,16 +16,16 @@ static struct rc_map_table encore_enltv_fm53[] = {
 	{ 0x10, KEY_POWER2},
 	{ 0x06, KEY_MUTE},
 
-	{ 0x09, KEY_1},
-	{ 0x1d, KEY_2},
-	{ 0x1f, KEY_3},
-	{ 0x19, KEY_4},
-	{ 0x1b, KEY_5},
-	{ 0x11, KEY_6},
-	{ 0x17, KEY_7},
-	{ 0x12, KEY_8},
-	{ 0x16, KEY_9},
-	{ 0x48, KEY_0},
+	{ 0x09, KEY_NUMERIC_1},
+	{ 0x1d, KEY_NUMERIC_2},
+	{ 0x1f, KEY_NUMERIC_3},
+	{ 0x19, KEY_NUMERIC_4},
+	{ 0x1b, KEY_NUMERIC_5},
+	{ 0x11, KEY_NUMERIC_6},
+	{ 0x17, KEY_NUMERIC_7},
+	{ 0x12, KEY_NUMERIC_8},
+	{ 0x16, KEY_NUMERIC_9},
+	{ 0x48, KEY_NUMERIC_0},
 
 	{ 0x04, KEY_LIST},		/* -/-- */
 	{ 0x40, KEY_LAST},		/* recall */
diff --git a/drivers/media/rc/keymaps/rc-encore-enltv.c b/drivers/media/rc/keymaps/rc-encore-enltv.c
index 5b4e832d5fac..712210097b4d 100644
--- a/drivers/media/rc/keymaps/rc-encore-enltv.c
+++ b/drivers/media/rc/keymaps/rc-encore-enltv.c
@@ -22,16 +22,16 @@ static struct rc_map_table encore_enltv[] = {
 	{ 0x01, KEY_AUDIO },		/* music */
 	{ 0x02, KEY_CAMERA },		/* picture */
 
-	{ 0x1f, KEY_1 },
-	{ 0x03, KEY_2 },
-	{ 0x04, KEY_3 },
-	{ 0x05, KEY_4 },
-	{ 0x1c, KEY_5 },
-	{ 0x06, KEY_6 },
-	{ 0x07, KEY_7 },
-	{ 0x08, KEY_8 },
-	{ 0x1d, KEY_9 },
-	{ 0x0a, KEY_0 },
+	{ 0x1f, KEY_NUMERIC_1 },
+	{ 0x03, KEY_NUMERIC_2 },
+	{ 0x04, KEY_NUMERIC_3 },
+	{ 0x05, KEY_NUMERIC_4 },
+	{ 0x1c, KEY_NUMERIC_5 },
+	{ 0x06, KEY_NUMERIC_6 },
+	{ 0x07, KEY_NUMERIC_7 },
+	{ 0x08, KEY_NUMERIC_8 },
+	{ 0x1d, KEY_NUMERIC_9 },
+	{ 0x0a, KEY_NUMERIC_0 },
 
 	{ 0x09, KEY_LIST },		/* -/-- */
 	{ 0x0b, KEY_LAST },		/* recall */
diff --git a/drivers/media/rc/keymaps/rc-encore-enltv2.c b/drivers/media/rc/keymaps/rc-encore-enltv2.c
index cd0555924456..a08470b4f187 100644
--- a/drivers/media/rc/keymaps/rc-encore-enltv2.c
+++ b/drivers/media/rc/keymaps/rc-encore-enltv2.c
@@ -14,16 +14,16 @@
 static struct rc_map_table encore_enltv2[] = {
 	{ 0x4c, KEY_POWER2 },
 	{ 0x4a, KEY_TUNER },
-	{ 0x40, KEY_1 },
-	{ 0x60, KEY_2 },
-	{ 0x50, KEY_3 },
-	{ 0x70, KEY_4 },
-	{ 0x48, KEY_5 },
-	{ 0x68, KEY_6 },
-	{ 0x58, KEY_7 },
-	{ 0x78, KEY_8 },
-	{ 0x44, KEY_9 },
-	{ 0x54, KEY_0 },
+	{ 0x40, KEY_NUMERIC_1 },
+	{ 0x60, KEY_NUMERIC_2 },
+	{ 0x50, KEY_NUMERIC_3 },
+	{ 0x70, KEY_NUMERIC_4 },
+	{ 0x48, KEY_NUMERIC_5 },
+	{ 0x68, KEY_NUMERIC_6 },
+	{ 0x58, KEY_NUMERIC_7 },
+	{ 0x78, KEY_NUMERIC_8 },
+	{ 0x44, KEY_NUMERIC_9 },
+	{ 0x54, KEY_NUMERIC_0 },
 
 	{ 0x64, KEY_LAST },		/* +100 */
 	{ 0x4e, KEY_AGAIN },		/* Recall */
diff --git a/drivers/media/rc/keymaps/rc-eztv.c b/drivers/media/rc/keymaps/rc-eztv.c
index 0e481d51fcb5..4e494d953e33 100644
--- a/drivers/media/rc/keymaps/rc-eztv.c
+++ b/drivers/media/rc/keymaps/rc-eztv.c
@@ -46,16 +46,16 @@ static struct rc_map_table eztv[] = {
 	{ 0x2d, KEY_PLAY },	/* play */
 	{ 0x2e, KEY_CAMERA },	/* snapshot / shuffle */
 
-	{ 0x00, KEY_0 },
-	{ 0x05, KEY_1 },
-	{ 0x06, KEY_2 },
-	{ 0x07, KEY_3 },
-	{ 0x09, KEY_4 },
-	{ 0x0a, KEY_5 },
-	{ 0x0b, KEY_6 },
-	{ 0x0d, KEY_7 },
-	{ 0x0e, KEY_8 },
-	{ 0x0f, KEY_9 },
+	{ 0x00, KEY_NUMERIC_0 },
+	{ 0x05, KEY_NUMERIC_1 },
+	{ 0x06, KEY_NUMERIC_2 },
+	{ 0x07, KEY_NUMERIC_3 },
+	{ 0x09, KEY_NUMERIC_4 },
+	{ 0x0a, KEY_NUMERIC_5 },
+	{ 0x0b, KEY_NUMERIC_6 },
+	{ 0x0d, KEY_NUMERIC_7 },
+	{ 0x0e, KEY_NUMERIC_8 },
+	{ 0x0f, KEY_NUMERIC_9 },
 
 	{ 0x2a, KEY_VOLUMEUP },
 	{ 0x11, KEY_VOLUMEDOWN },
diff --git a/drivers/media/rc/keymaps/rc-flydvb.c b/drivers/media/rc/keymaps/rc-flydvb.c
index 45940d7c92d0..202a1fbd1935 100644
--- a/drivers/media/rc/keymaps/rc-flydvb.c
+++ b/drivers/media/rc/keymaps/rc-flydvb.c
@@ -12,17 +12,17 @@ static struct rc_map_table flydvb[] = {
 	{ 0x01, KEY_ZOOM },		/* Full Screen */
 	{ 0x00, KEY_POWER },		/* Power */
 
-	{ 0x03, KEY_1 },
-	{ 0x04, KEY_2 },
-	{ 0x05, KEY_3 },
-	{ 0x07, KEY_4 },
-	{ 0x08, KEY_5 },
-	{ 0x09, KEY_6 },
-	{ 0x0b, KEY_7 },
-	{ 0x0c, KEY_8 },
-	{ 0x0d, KEY_9 },
+	{ 0x03, KEY_NUMERIC_1 },
+	{ 0x04, KEY_NUMERIC_2 },
+	{ 0x05, KEY_NUMERIC_3 },
+	{ 0x07, KEY_NUMERIC_4 },
+	{ 0x08, KEY_NUMERIC_5 },
+	{ 0x09, KEY_NUMERIC_6 },
+	{ 0x0b, KEY_NUMERIC_7 },
+	{ 0x0c, KEY_NUMERIC_8 },
+	{ 0x0d, KEY_NUMERIC_9 },
 	{ 0x06, KEY_AGAIN },		/* Recall */
-	{ 0x0f, KEY_0 },
+	{ 0x0f, KEY_NUMERIC_0 },
 	{ 0x10, KEY_MUTE },		/* Mute */
 	{ 0x02, KEY_RADIO },		/* TV/Radio */
 	{ 0x1b, KEY_LANGUAGE },		/* SAP (Second Audio Program) */
diff --git a/drivers/media/rc/keymaps/rc-flyvideo.c b/drivers/media/rc/keymaps/rc-flyvideo.c
index b2d4e4c7b192..a44467fb15cb 100644
--- a/drivers/media/rc/keymaps/rc-flyvideo.c
+++ b/drivers/media/rc/keymaps/rc-flyvideo.c
@@ -9,16 +9,16 @@
 #include <linux/module.h>
 
 static struct rc_map_table flyvideo[] = {
-	{ 0x0f, KEY_0 },
-	{ 0x03, KEY_1 },
-	{ 0x04, KEY_2 },
-	{ 0x05, KEY_3 },
-	{ 0x07, KEY_4 },
-	{ 0x08, KEY_5 },
-	{ 0x09, KEY_6 },
-	{ 0x0b, KEY_7 },
-	{ 0x0c, KEY_8 },
-	{ 0x0d, KEY_9 },
+	{ 0x0f, KEY_NUMERIC_0 },
+	{ 0x03, KEY_NUMERIC_1 },
+	{ 0x04, KEY_NUMERIC_2 },
+	{ 0x05, KEY_NUMERIC_3 },
+	{ 0x07, KEY_NUMERIC_4 },
+	{ 0x08, KEY_NUMERIC_5 },
+	{ 0x09, KEY_NUMERIC_6 },
+	{ 0x0b, KEY_NUMERIC_7 },
+	{ 0x0c, KEY_NUMERIC_8 },
+	{ 0x0d, KEY_NUMERIC_9 },
 
 	{ 0x0e, KEY_MODE },	/* Air/Cable */
 	{ 0x11, KEY_VIDEO },	/* Video */
diff --git a/drivers/media/rc/keymaps/rc-fusionhdtv-mce.c b/drivers/media/rc/keymaps/rc-fusionhdtv-mce.c
index 1c63fc7d4576..253199f5531a 100644
--- a/drivers/media/rc/keymaps/rc-fusionhdtv-mce.c
+++ b/drivers/media/rc/keymaps/rc-fusionhdtv-mce.c
@@ -12,16 +12,16 @@
 
 static struct rc_map_table fusionhdtv_mce[] = {
 
-	{ 0x0b, KEY_1 },
-	{ 0x17, KEY_2 },
-	{ 0x1b, KEY_3 },
-	{ 0x07, KEY_4 },
-	{ 0x50, KEY_5 },
-	{ 0x54, KEY_6 },
-	{ 0x48, KEY_7 },
-	{ 0x4c, KEY_8 },
-	{ 0x58, KEY_9 },
-	{ 0x03, KEY_0 },
+	{ 0x0b, KEY_NUMERIC_1 },
+	{ 0x17, KEY_NUMERIC_2 },
+	{ 0x1b, KEY_NUMERIC_3 },
+	{ 0x07, KEY_NUMERIC_4 },
+	{ 0x50, KEY_NUMERIC_5 },
+	{ 0x54, KEY_NUMERIC_6 },
+	{ 0x48, KEY_NUMERIC_7 },
+	{ 0x4c, KEY_NUMERIC_8 },
+	{ 0x58, KEY_NUMERIC_9 },
+	{ 0x03, KEY_NUMERIC_0 },
 
 	{ 0x5e, KEY_OK },
 	{ 0x51, KEY_UP },
diff --git a/drivers/media/rc/keymaps/rc-gadmei-rm008z.c b/drivers/media/rc/keymaps/rc-gadmei-rm008z.c
index 4a0a9786914f..c630ef306f11 100644
--- a/drivers/media/rc/keymaps/rc-gadmei-rm008z.c
+++ b/drivers/media/rc/keymaps/rc-gadmei-rm008z.c
@@ -21,16 +21,16 @@ static struct rc_map_table gadmei_rm008z[] = {
 	{ 0x0b, KEY_AUDIO},		/* SV */
 	{ 0x0f, KEY_RADIO},		/* FM */
 
-	{ 0x00, KEY_1},
-	{ 0x01, KEY_2},
-	{ 0x02, KEY_3},
-	{ 0x03, KEY_4},
-	{ 0x04, KEY_5},
-	{ 0x05, KEY_6},
-	{ 0x06, KEY_7},
-	{ 0x07, KEY_8},
-	{ 0x08, KEY_9},
-	{ 0x09, KEY_0},
+	{ 0x00, KEY_NUMERIC_1},
+	{ 0x01, KEY_NUMERIC_2},
+	{ 0x02, KEY_NUMERIC_3},
+	{ 0x03, KEY_NUMERIC_4},
+	{ 0x04, KEY_NUMERIC_5},
+	{ 0x05, KEY_NUMERIC_6},
+	{ 0x06, KEY_NUMERIC_7},
+	{ 0x07, KEY_NUMERIC_8},
+	{ 0x08, KEY_NUMERIC_9},
+	{ 0x09, KEY_NUMERIC_0},
 	{ 0x0a, KEY_INFO},		/* OSD */
 	{ 0x1c, KEY_BACKSPACE},		/* LAST */
 
diff --git a/drivers/media/rc/keymaps/rc-genius-tvgo-a11mce.c b/drivers/media/rc/keymaps/rc-genius-tvgo-a11mce.c
index cc876a85cc31..c966c130b05d 100644
--- a/drivers/media/rc/keymaps/rc-genius-tvgo-a11mce.c
+++ b/drivers/media/rc/keymaps/rc-genius-tvgo-a11mce.c
@@ -15,16 +15,16 @@
 
 static struct rc_map_table genius_tvgo_a11mce[] = {
 	/* Keys 0 to 9 */
-	{ 0x48, KEY_0 },
-	{ 0x09, KEY_1 },
-	{ 0x1d, KEY_2 },
-	{ 0x1f, KEY_3 },
-	{ 0x19, KEY_4 },
-	{ 0x1b, KEY_5 },
-	{ 0x11, KEY_6 },
-	{ 0x17, KEY_7 },
-	{ 0x12, KEY_8 },
-	{ 0x16, KEY_9 },
+	{ 0x48, KEY_NUMERIC_0 },
+	{ 0x09, KEY_NUMERIC_1 },
+	{ 0x1d, KEY_NUMERIC_2 },
+	{ 0x1f, KEY_NUMERIC_3 },
+	{ 0x19, KEY_NUMERIC_4 },
+	{ 0x1b, KEY_NUMERIC_5 },
+	{ 0x11, KEY_NUMERIC_6 },
+	{ 0x17, KEY_NUMERIC_7 },
+	{ 0x12, KEY_NUMERIC_8 },
+	{ 0x16, KEY_NUMERIC_9 },
 
 	{ 0x54, KEY_RECORD },		/* recording */
 	{ 0x06, KEY_MUTE },		/* mute */
diff --git a/drivers/media/rc/keymaps/rc-gotview7135.c b/drivers/media/rc/keymaps/rc-gotview7135.c
index 6b94bd39d977..0dc4ef36d76f 100644
--- a/drivers/media/rc/keymaps/rc-gotview7135.c
+++ b/drivers/media/rc/keymaps/rc-gotview7135.c
@@ -14,16 +14,16 @@ static struct rc_map_table gotview7135[] = {
 
 	{ 0x11, KEY_POWER },
 	{ 0x35, KEY_TV },
-	{ 0x1b, KEY_0 },
-	{ 0x29, KEY_1 },
-	{ 0x19, KEY_2 },
-	{ 0x39, KEY_3 },
-	{ 0x1f, KEY_4 },
-	{ 0x2c, KEY_5 },
-	{ 0x21, KEY_6 },
-	{ 0x24, KEY_7 },
-	{ 0x18, KEY_8 },
-	{ 0x2b, KEY_9 },
+	{ 0x1b, KEY_NUMERIC_0 },
+	{ 0x29, KEY_NUMERIC_1 },
+	{ 0x19, KEY_NUMERIC_2 },
+	{ 0x39, KEY_NUMERIC_3 },
+	{ 0x1f, KEY_NUMERIC_4 },
+	{ 0x2c, KEY_NUMERIC_5 },
+	{ 0x21, KEY_NUMERIC_6 },
+	{ 0x24, KEY_NUMERIC_7 },
+	{ 0x18, KEY_NUMERIC_8 },
+	{ 0x2b, KEY_NUMERIC_9 },
 	{ 0x3b, KEY_AGAIN },	/* LOOP */
 	{ 0x06, KEY_AUDIO },
 	{ 0x31, KEY_PRINT },	/* PREVIEW */
diff --git a/drivers/media/rc/keymaps/rc-hauppauge.c b/drivers/media/rc/keymaps/rc-hauppauge.c
index 582aa9012443..5085c805f6e9 100644
--- a/drivers/media/rc/keymaps/rc-hauppauge.c
+++ b/drivers/media/rc/keymaps/rc-hauppauge.c
@@ -67,20 +67,20 @@ static struct rc_map_table rc5_hauppauge_new[] = {
 	{ 0x1e30, KEY_PAUSE },		/* pause */
 	{ 0x1e1e, KEY_NEXTSONG },	/* skip >| */
 
-	{ 0x1e01, KEY_1 },
-	{ 0x1e02, KEY_2 },
-	{ 0x1e03, KEY_3 },
+	{ 0x1e01, KEY_NUMERIC_1 },
+	{ 0x1e02, KEY_NUMERIC_2 },
+	{ 0x1e03, KEY_NUMERIC_3 },
 
-	{ 0x1e04, KEY_4 },
-	{ 0x1e05, KEY_5 },
-	{ 0x1e06, KEY_6 },
+	{ 0x1e04, KEY_NUMERIC_4 },
+	{ 0x1e05, KEY_NUMERIC_5 },
+	{ 0x1e06, KEY_NUMERIC_6 },
 
-	{ 0x1e07, KEY_7 },
-	{ 0x1e08, KEY_8 },
-	{ 0x1e09, KEY_9 },
+	{ 0x1e07, KEY_NUMERIC_7 },
+	{ 0x1e08, KEY_NUMERIC_8 },
+	{ 0x1e09, KEY_NUMERIC_9 },
 
 	{ 0x1e0a, KEY_TEXT },		/* keypad asterisk as well */
-	{ 0x1e00, KEY_0 },
+	{ 0x1e00, KEY_NUMERIC_0 },
 	{ 0x1e0e, KEY_SUBTITLE },	/* also the Pound key (#) */
 
 	{ 0x1e0b, KEY_RED },		/* red button */
@@ -96,16 +96,16 @@ static struct rc_map_table rc5_hauppauge_new[] = {
 	{ 0x1f3b, KEY_SELECT },		/* GO */
 
 	/* Keys 0 to 9 */
-	{ 0x1f00, KEY_0 },
-	{ 0x1f01, KEY_1 },
-	{ 0x1f02, KEY_2 },
-	{ 0x1f03, KEY_3 },
-	{ 0x1f04, KEY_4 },
-	{ 0x1f05, KEY_5 },
-	{ 0x1f06, KEY_6 },
-	{ 0x1f07, KEY_7 },
-	{ 0x1f08, KEY_8 },
-	{ 0x1f09, KEY_9 },
+	{ 0x1f00, KEY_NUMERIC_0 },
+	{ 0x1f01, KEY_NUMERIC_1 },
+	{ 0x1f02, KEY_NUMERIC_2 },
+	{ 0x1f03, KEY_NUMERIC_3 },
+	{ 0x1f04, KEY_NUMERIC_4 },
+	{ 0x1f05, KEY_NUMERIC_5 },
+	{ 0x1f06, KEY_NUMERIC_6 },
+	{ 0x1f07, KEY_NUMERIC_7 },
+	{ 0x1f08, KEY_NUMERIC_8 },
+	{ 0x1f09, KEY_NUMERIC_9 },
 
 	{ 0x1f1f, KEY_EXIT },		/* back/exit */
 	{ 0x1f0d, KEY_MENU },
@@ -140,16 +140,16 @@ static struct rc_map_table rc5_hauppauge_new[] = {
 	 * Keycodes for DSR-0112 remote bundled with Haupauge MiniStick
 	 * Keycodes start with address = 0x1d
 	 */
-	{ 0x1d00, KEY_0 },
-	{ 0x1d01, KEY_1 },
-	{ 0x1d02, KEY_2 },
-	{ 0x1d03, KEY_3 },
-	{ 0x1d04, KEY_4 },
-	{ 0x1d05, KEY_5 },
-	{ 0x1d06, KEY_6 },
-	{ 0x1d07, KEY_7 },
-	{ 0x1d08, KEY_8 },
-	{ 0x1d09, KEY_9 },
+	{ 0x1d00, KEY_NUMERIC_0 },
+	{ 0x1d01, KEY_NUMERIC_1 },
+	{ 0x1d02, KEY_NUMERIC_2 },
+	{ 0x1d03, KEY_NUMERIC_3 },
+	{ 0x1d04, KEY_NUMERIC_4 },
+	{ 0x1d05, KEY_NUMERIC_5 },
+	{ 0x1d06, KEY_NUMERIC_6 },
+	{ 0x1d07, KEY_NUMERIC_7 },
+	{ 0x1d08, KEY_NUMERIC_8 },
+	{ 0x1d09, KEY_NUMERIC_9 },
 	{ 0x1d0a, KEY_TEXT },
 	{ 0x1d0d, KEY_MENU },
 	{ 0x1d0f, KEY_MUTE },
@@ -190,16 +190,16 @@ static struct rc_map_table rc5_hauppauge_new[] = {
 	{ 0x1c17, KEY_RIGHT },
 	{ 0x1c25, KEY_OK },
 
-	{ 0x1c00, KEY_0 },
-	{ 0x1c01, KEY_1 },
-	{ 0x1c02, KEY_2 },
-	{ 0x1c03, KEY_3 },
-	{ 0x1c04, KEY_4 },
-	{ 0x1c05, KEY_5 },
-	{ 0x1c06, KEY_6 },
-	{ 0x1c07, KEY_7 },
-	{ 0x1c08, KEY_8 },
-	{ 0x1c09, KEY_9 },
+	{ 0x1c00, KEY_NUMERIC_0 },
+	{ 0x1c01, KEY_NUMERIC_1 },
+	{ 0x1c02, KEY_NUMERIC_2 },
+	{ 0x1c03, KEY_NUMERIC_3 },
+	{ 0x1c04, KEY_NUMERIC_4 },
+	{ 0x1c05, KEY_NUMERIC_5 },
+	{ 0x1c06, KEY_NUMERIC_6 },
+	{ 0x1c07, KEY_NUMERIC_7 },
+	{ 0x1c08, KEY_NUMERIC_8 },
+	{ 0x1c09, KEY_NUMERIC_9 },
 
 	{ 0x1c1f, KEY_EXIT },	/* BACK */
 	{ 0x1c0d, KEY_MENU },
@@ -245,20 +245,20 @@ static struct rc_map_table rc5_hauppauge_new[] = {
 	{ 0x0021, KEY_CHANNELDOWN },
 	{ 0x0022, KEY_VIDEO },		/* source */
 
-	{ 0x0001, KEY_1 },
-	{ 0x0002, KEY_2 },
-	{ 0x0003, KEY_3 },
+	{ 0x0001, KEY_NUMERIC_1 },
+	{ 0x0002, KEY_NUMERIC_2 },
+	{ 0x0003, KEY_NUMERIC_3 },
 
-	{ 0x0004, KEY_4 },
-	{ 0x0005, KEY_5 },
-	{ 0x0006, KEY_6 },
+	{ 0x0004, KEY_NUMERIC_4 },
+	{ 0x0005, KEY_NUMERIC_5 },
+	{ 0x0006, KEY_NUMERIC_6 },
 
-	{ 0x0007, KEY_7 },
-	{ 0x0008, KEY_8 },
-	{ 0x0009, KEY_9 },
+	{ 0x0007, KEY_NUMERIC_7 },
+	{ 0x0008, KEY_NUMERIC_8 },
+	{ 0x0009, KEY_NUMERIC_9 },
 
 	{ 0x001e, KEY_RED },	/* Reserved */
-	{ 0x0000, KEY_0 },
+	{ 0x0000, KEY_NUMERIC_0 },
 	{ 0x0026, KEY_SLEEP },	/* Minimize */
 };
 
diff --git a/drivers/media/rc/keymaps/rc-hisi-poplar.c b/drivers/media/rc/keymaps/rc-hisi-poplar.c
index b4dbec6e70ce..49a18e916915 100644
--- a/drivers/media/rc/keymaps/rc-hisi-poplar.c
+++ b/drivers/media/rc/keymaps/rc-hisi-poplar.c
@@ -9,16 +9,16 @@
 #include <media/rc-map.h>
 
 static struct rc_map_table hisi_poplar_keymap[] = {
-	{ 0x0000b292, KEY_1},
-	{ 0x0000b293, KEY_2},
-	{ 0x0000b2cc, KEY_3},
-	{ 0x0000b28e, KEY_4},
-	{ 0x0000b28f, KEY_5},
-	{ 0x0000b2c8, KEY_6},
-	{ 0x0000b28a, KEY_7},
-	{ 0x0000b28b, KEY_8},
-	{ 0x0000b2c4, KEY_9},
-	{ 0x0000b287, KEY_0},
+	{ 0x0000b292, KEY_NUMERIC_1},
+	{ 0x0000b293, KEY_NUMERIC_2},
+	{ 0x0000b2cc, KEY_NUMERIC_3},
+	{ 0x0000b28e, KEY_NUMERIC_4},
+	{ 0x0000b28f, KEY_NUMERIC_5},
+	{ 0x0000b2c8, KEY_NUMERIC_6},
+	{ 0x0000b28a, KEY_NUMERIC_7},
+	{ 0x0000b28b, KEY_NUMERIC_8},
+	{ 0x0000b2c4, KEY_NUMERIC_9},
+	{ 0x0000b287, KEY_NUMERIC_0},
 	{ 0x0000b282, KEY_HOMEPAGE},
 	{ 0x0000b2ca, KEY_UP},
 	{ 0x0000b299, KEY_LEFT},
diff --git a/drivers/media/rc/keymaps/rc-hisi-tv-demo.c b/drivers/media/rc/keymaps/rc-hisi-tv-demo.c
index 8e25b40714f8..c73068b653f7 100644
--- a/drivers/media/rc/keymaps/rc-hisi-tv-demo.c
+++ b/drivers/media/rc/keymaps/rc-hisi-tv-demo.c
@@ -9,16 +9,16 @@
 #include <media/rc-map.h>
 
 static struct rc_map_table hisi_tv_demo_keymap[] = {
-	{ 0x00000092, KEY_1},
-	{ 0x00000093, KEY_2},
-	{ 0x000000cc, KEY_3},
-	{ 0x0000009f, KEY_4},
-	{ 0x0000008e, KEY_5},
-	{ 0x0000008f, KEY_6},
-	{ 0x000000c8, KEY_7},
-	{ 0x00000094, KEY_8},
-	{ 0x0000008a, KEY_9},
-	{ 0x0000008b, KEY_0},
+	{ 0x00000092, KEY_NUMERIC_1},
+	{ 0x00000093, KEY_NUMERIC_2},
+	{ 0x000000cc, KEY_NUMERIC_3},
+	{ 0x0000009f, KEY_NUMERIC_4},
+	{ 0x0000008e, KEY_NUMERIC_5},
+	{ 0x0000008f, KEY_NUMERIC_6},
+	{ 0x000000c8, KEY_NUMERIC_7},
+	{ 0x00000094, KEY_NUMERIC_8},
+	{ 0x0000008a, KEY_NUMERIC_9},
+	{ 0x0000008b, KEY_NUMERIC_0},
 	{ 0x000000ce, KEY_ENTER},
 	{ 0x000000ca, KEY_UP},
 	{ 0x00000099, KEY_LEFT},
diff --git a/drivers/media/rc/keymaps/rc-iodata-bctv7e.c b/drivers/media/rc/keymaps/rc-iodata-bctv7e.c
index 6ced43458f2a..9cc6ea0f4226 100644
--- a/drivers/media/rc/keymaps/rc-iodata-bctv7e.c
+++ b/drivers/media/rc/keymaps/rc-iodata-bctv7e.c
@@ -17,16 +17,16 @@ static struct rc_map_table iodata_bctv7e[] = {
 	{ 0x00, KEY_POWER },
 
 	/* Keys 0 to 9 */
-	{ 0x44, KEY_0 },		/* 10 */
-	{ 0x50, KEY_1 },
-	{ 0x30, KEY_2 },
-	{ 0x70, KEY_3 },
-	{ 0x48, KEY_4 },
-	{ 0x28, KEY_5 },
-	{ 0x68, KEY_6 },
-	{ 0x58, KEY_7 },
-	{ 0x38, KEY_8 },
-	{ 0x78, KEY_9 },
+	{ 0x44, KEY_NUMERIC_0 },		/* 10 */
+	{ 0x50, KEY_NUMERIC_1 },
+	{ 0x30, KEY_NUMERIC_2 },
+	{ 0x70, KEY_NUMERIC_3 },
+	{ 0x48, KEY_NUMERIC_4 },
+	{ 0x28, KEY_NUMERIC_5 },
+	{ 0x68, KEY_NUMERIC_6 },
+	{ 0x58, KEY_NUMERIC_7 },
+	{ 0x38, KEY_NUMERIC_8 },
+	{ 0x78, KEY_NUMERIC_9 },
 
 	{ 0x10, KEY_L },		/* Live */
 	{ 0x08, KEY_TIME },		/* Time Shift */
diff --git a/drivers/media/rc/keymaps/rc-it913x-v1.c b/drivers/media/rc/keymaps/rc-it913x-v1.c
index d8eaba9834c2..1e049f26a246 100644
--- a/drivers/media/rc/keymaps/rc-it913x-v1.c
+++ b/drivers/media/rc/keymaps/rc-it913x-v1.c
@@ -11,22 +11,22 @@
 static struct rc_map_table it913x_v1_rc[] = {
 	/* Type 1 */
 	{ 0x61d601, KEY_VIDEO },           /* Source */
-	{ 0x61d602, KEY_3 },
+	{ 0x61d602, KEY_NUMERIC_3 },
 	{ 0x61d603, KEY_POWER },           /* ShutDown */
-	{ 0x61d604, KEY_1 },
-	{ 0x61d605, KEY_5 },
-	{ 0x61d606, KEY_6 },
+	{ 0x61d604, KEY_NUMERIC_1 },
+	{ 0x61d605, KEY_NUMERIC_5 },
+	{ 0x61d606, KEY_NUMERIC_6 },
 	{ 0x61d607, KEY_CHANNELDOWN },     /* CH- */
-	{ 0x61d608, KEY_2 },
+	{ 0x61d608, KEY_NUMERIC_2 },
 	{ 0x61d609, KEY_CHANNELUP },       /* CH+ */
-	{ 0x61d60a, KEY_9 },
+	{ 0x61d60a, KEY_NUMERIC_9 },
 	{ 0x61d60b, KEY_ZOOM },            /* Zoom */
-	{ 0x61d60c, KEY_7 },
-	{ 0x61d60d, KEY_8 },
+	{ 0x61d60c, KEY_NUMERIC_7 },
+	{ 0x61d60d, KEY_NUMERIC_8 },
 	{ 0x61d60e, KEY_VOLUMEUP },        /* Vol+ */
-	{ 0x61d60f, KEY_4 },
+	{ 0x61d60f, KEY_NUMERIC_4 },
 	{ 0x61d610, KEY_ESC },             /* [back up arrow] */
-	{ 0x61d611, KEY_0 },
+	{ 0x61d611, KEY_NUMERIC_0 },
 	{ 0x61d612, KEY_OK },              /* [enter arrow] */
 	{ 0x61d613, KEY_VOLUMEDOWN },      /* Vol- */
 	{ 0x61d614, KEY_RECORD },          /* Rec */
@@ -43,16 +43,16 @@ static struct rc_map_table it913x_v1_rc[] = {
 	{ 0x61d61f, KEY_BLUE },
 	{ 0x61d643, KEY_POWER2 },          /* [red power button] */
 	/* Type 2 - 20 buttons */
-	{ 0x807f0d, KEY_0 },
-	{ 0x807f04, KEY_1 },
-	{ 0x807f05, KEY_2 },
-	{ 0x807f06, KEY_3 },
-	{ 0x807f07, KEY_4 },
-	{ 0x807f08, KEY_5 },
-	{ 0x807f09, KEY_6 },
-	{ 0x807f0a, KEY_7 },
-	{ 0x807f1b, KEY_8 },
-	{ 0x807f1f, KEY_9 },
+	{ 0x807f0d, KEY_NUMERIC_0 },
+	{ 0x807f04, KEY_NUMERIC_1 },
+	{ 0x807f05, KEY_NUMERIC_2 },
+	{ 0x807f06, KEY_NUMERIC_3 },
+	{ 0x807f07, KEY_NUMERIC_4 },
+	{ 0x807f08, KEY_NUMERIC_5 },
+	{ 0x807f09, KEY_NUMERIC_6 },
+	{ 0x807f0a, KEY_NUMERIC_7 },
+	{ 0x807f1b, KEY_NUMERIC_8 },
+	{ 0x807f1f, KEY_NUMERIC_9 },
 	{ 0x807f12, KEY_POWER },
 	{ 0x807f01, KEY_MEDIA_REPEAT}, /* Recall */
 	{ 0x807f19, KEY_PAUSE }, /* Timeshift */
diff --git a/drivers/media/rc/keymaps/rc-it913x-v2.c b/drivers/media/rc/keymaps/rc-it913x-v2.c
index 26747a327d91..369b72f9b732 100644
--- a/drivers/media/rc/keymaps/rc-it913x-v2.c
+++ b/drivers/media/rc/keymaps/rc-it913x-v2.c
@@ -20,31 +20,31 @@ static struct rc_map_table it913x_v2_rc[] = {
 	{ 0x807f04, KEY_VOLUMEUP },	/* Volume- */
 	{ 0x807f05, KEY_SCREEN },	/* FullScreen */
 	{ 0x807f06, KEY_VOLUMEDOWN },	/* Volume- */
-	{ 0x807f07, KEY_0 },		/* 0 */
+	{ 0x807f07, KEY_NUMERIC_0 },		/* 0 */
 	{ 0x807f08, KEY_CHANNELDOWN },	/* Channel- */
 	{ 0x807f09, KEY_PREVIOUS },	/* Recall */
-	{ 0x807f0a, KEY_1 },		/* 1 */
-	{ 0x807f1b, KEY_2 },		/* 2 */
-	{ 0x807f1f, KEY_3 },		/* 3 */
-	{ 0x807f0c, KEY_4 },		/* 4 */
-	{ 0x807f0d, KEY_5 },		/* 5 */
-	{ 0x807f0e, KEY_6 },		/* 6 */
-	{ 0x807f00, KEY_7 },		/* 7 */
-	{ 0x807f0f, KEY_8 },		/* 8 */
-	{ 0x807f19, KEY_9 },		/* 9 */
+	{ 0x807f0a, KEY_NUMERIC_1 },		/* 1 */
+	{ 0x807f1b, KEY_NUMERIC_2 },		/* 2 */
+	{ 0x807f1f, KEY_NUMERIC_3 },		/* 3 */
+	{ 0x807f0c, KEY_NUMERIC_4 },		/* 4 */
+	{ 0x807f0d, KEY_NUMERIC_5 },		/* 5 */
+	{ 0x807f0e, KEY_NUMERIC_6 },		/* 6 */
+	{ 0x807f00, KEY_NUMERIC_7 },		/* 7 */
+	{ 0x807f0f, KEY_NUMERIC_8 },		/* 8 */
+	{ 0x807f19, KEY_NUMERIC_9 },		/* 9 */
 
 	/* Type 2 */
 	/* keys stereo, snapshot unassigned */
-	{ 0x866b00, KEY_0 },
-	{ 0x866b01, KEY_1 },
-	{ 0x866b02, KEY_2 },
-	{ 0x866b03, KEY_3 },
-	{ 0x866b04, KEY_4 },
-	{ 0x866b05, KEY_5 },
-	{ 0x866b06, KEY_6 },
-	{ 0x866b07, KEY_7 },
-	{ 0x866b08, KEY_8 },
-	{ 0x866b09, KEY_9 },
+	{ 0x866b00, KEY_NUMERIC_0 },
+	{ 0x866b01, KEY_NUMERIC_1 },
+	{ 0x866b02, KEY_NUMERIC_2 },
+	{ 0x866b03, KEY_NUMERIC_3 },
+	{ 0x866b04, KEY_NUMERIC_4 },
+	{ 0x866b05, KEY_NUMERIC_5 },
+	{ 0x866b06, KEY_NUMERIC_6 },
+	{ 0x866b07, KEY_NUMERIC_7 },
+	{ 0x866b08, KEY_NUMERIC_8 },
+	{ 0x866b09, KEY_NUMERIC_9 },
 	{ 0x866b12, KEY_POWER },
 	{ 0x866b13, KEY_MUTE },
 	{ 0x866b0a, KEY_PREVIOUS }, /* Recall */
diff --git a/drivers/media/rc/keymaps/rc-kaiomy.c b/drivers/media/rc/keymaps/rc-kaiomy.c
index a00051339842..548760e86a2d 100644
--- a/drivers/media/rc/keymaps/rc-kaiomy.c
+++ b/drivers/media/rc/keymaps/rc-kaiomy.c
@@ -18,19 +18,19 @@ static struct rc_map_table kaiomy[] = {
 	{ 0x0b, KEY_ZOOM},
 	{ 0x03, KEY_POWER},
 
-	{ 0x04, KEY_1},
-	{ 0x08, KEY_2},
-	{ 0x02, KEY_3},
+	{ 0x04, KEY_NUMERIC_1},
+	{ 0x08, KEY_NUMERIC_2},
+	{ 0x02, KEY_NUMERIC_3},
 
-	{ 0x0f, KEY_4},
-	{ 0x05, KEY_5},
-	{ 0x06, KEY_6},
+	{ 0x0f, KEY_NUMERIC_4},
+	{ 0x05, KEY_NUMERIC_5},
+	{ 0x06, KEY_NUMERIC_6},
 
-	{ 0x0c, KEY_7},
-	{ 0x0d, KEY_8},
-	{ 0x0a, KEY_9},
+	{ 0x0c, KEY_NUMERIC_7},
+	{ 0x0d, KEY_NUMERIC_8},
+	{ 0x0a, KEY_NUMERIC_9},
 
-	{ 0x11, KEY_0},
+	{ 0x11, KEY_NUMERIC_0},
 
 	{ 0x09, KEY_CHANNELUP},
 	{ 0x07, KEY_CHANNELDOWN},
diff --git a/drivers/media/rc/keymaps/rc-kworld-315u.c b/drivers/media/rc/keymaps/rc-kworld-315u.c
index ed0e0586dea2..f5aed4b96019 100644
--- a/drivers/media/rc/keymaps/rc-kworld-315u.c
+++ b/drivers/media/rc/keymaps/rc-kworld-315u.c
@@ -17,23 +17,23 @@ static struct rc_map_table kworld_315u[] = {
 	{ 0x610b, KEY_ZOOM },
 	{ 0x6103, KEY_POWER2 },		/* shutdown */
 
-	{ 0x6104, KEY_1 },
-	{ 0x6108, KEY_2 },
-	{ 0x6102, KEY_3 },
+	{ 0x6104, KEY_NUMERIC_1 },
+	{ 0x6108, KEY_NUMERIC_2 },
+	{ 0x6102, KEY_NUMERIC_3 },
 	{ 0x6109, KEY_CHANNELUP },
 
-	{ 0x610f, KEY_4 },
-	{ 0x6105, KEY_5 },
-	{ 0x6106, KEY_6 },
+	{ 0x610f, KEY_NUMERIC_4 },
+	{ 0x6105, KEY_NUMERIC_5 },
+	{ 0x6106, KEY_NUMERIC_6 },
 	{ 0x6107, KEY_CHANNELDOWN },
 
-	{ 0x610c, KEY_7 },
-	{ 0x610d, KEY_8 },
-	{ 0x610a, KEY_9 },
+	{ 0x610c, KEY_NUMERIC_7 },
+	{ 0x610d, KEY_NUMERIC_8 },
+	{ 0x610a, KEY_NUMERIC_9 },
 	{ 0x610e, KEY_VOLUMEUP },
 
 	{ 0x6110, KEY_LAST },
-	{ 0x6111, KEY_0 },
+	{ 0x6111, KEY_NUMERIC_0 },
 	{ 0x6112, KEY_ENTER },
 	{ 0x6113, KEY_VOLUMEDOWN },
 
diff --git a/drivers/media/rc/keymaps/rc-kworld-pc150u.c b/drivers/media/rc/keymaps/rc-kworld-pc150u.c
index 9c60cf4f3bf2..7938761eb994 100644
--- a/drivers/media/rc/keymaps/rc-kworld-pc150u.c
+++ b/drivers/media/rc/keymaps/rc-kworld-pc150u.c
@@ -20,16 +20,16 @@ static struct rc_map_table kworld_pc150u[] = {
 	{ 0x16, KEY_EJECTCLOSECD },	/* -> ) */
 	{ 0x1d, KEY_POWER2 },
 
-	{ 0x00, KEY_1 },
-	{ 0x01, KEY_2 },
-	{ 0x02, KEY_3 },
-	{ 0x03, KEY_4 },
-	{ 0x04, KEY_5 },
-	{ 0x05, KEY_6 },
-	{ 0x06, KEY_7 },
-	{ 0x07, KEY_8 },
-	{ 0x08, KEY_9 },
-	{ 0x0a, KEY_0 },
+	{ 0x00, KEY_NUMERIC_1 },
+	{ 0x01, KEY_NUMERIC_2 },
+	{ 0x02, KEY_NUMERIC_3 },
+	{ 0x03, KEY_NUMERIC_4 },
+	{ 0x04, KEY_NUMERIC_5 },
+	{ 0x05, KEY_NUMERIC_6 },
+	{ 0x06, KEY_NUMERIC_7 },
+	{ 0x07, KEY_NUMERIC_8 },
+	{ 0x08, KEY_NUMERIC_9 },
+	{ 0x0a, KEY_NUMERIC_0 },
 
 	{ 0x09, KEY_AGAIN },
 	{ 0x14, KEY_MUTE },
diff --git a/drivers/media/rc/keymaps/rc-kworld-plus-tv-analog.c b/drivers/media/rc/keymaps/rc-kworld-plus-tv-analog.c
index db5edde3eeb1..6e24faa9c6e1 100644
--- a/drivers/media/rc/keymaps/rc-kworld-plus-tv-analog.c
+++ b/drivers/media/rc/keymaps/rc-kworld-plus-tv-analog.c
@@ -17,16 +17,16 @@ static struct rc_map_table kworld_plus_tv_analog[] = {
 	{ 0x16, KEY_CLOSECD },		/* -> ) */
 	{ 0x1d, KEY_POWER2 },
 
-	{ 0x00, KEY_1 },
-	{ 0x01, KEY_2 },
-	{ 0x02, KEY_3 },		/* Two keys have the same code: 3 and left */
-	{ 0x03, KEY_4 },		/* Two keys have the same code: 3 and right */
-	{ 0x04, KEY_5 },
-	{ 0x05, KEY_6 },
-	{ 0x06, KEY_7 },
-	{ 0x07, KEY_8 },
-	{ 0x08, KEY_9 },
-	{ 0x0a, KEY_0 },
+	{ 0x00, KEY_NUMERIC_1 },
+	{ 0x01, KEY_NUMERIC_2 },
+	{ 0x02, KEY_NUMERIC_3 },		/* Two keys have the same code: 3 and left */
+	{ 0x03, KEY_NUMERIC_4 },		/* Two keys have the same code: 3 and right */
+	{ 0x04, KEY_NUMERIC_5 },
+	{ 0x05, KEY_NUMERIC_6 },
+	{ 0x06, KEY_NUMERIC_7 },
+	{ 0x07, KEY_NUMERIC_8 },
+	{ 0x08, KEY_NUMERIC_9 },
+	{ 0x0a, KEY_NUMERIC_0 },
 
 	{ 0x09, KEY_AGAIN },
 	{ 0x14, KEY_MUTE },
diff --git a/drivers/media/rc/keymaps/rc-leadtek-y04g0051.c b/drivers/media/rc/keymaps/rc-leadtek-y04g0051.c
index afee942e0edf..2f2b981e1995 100644
--- a/drivers/media/rc/keymaps/rc-leadtek-y04g0051.c
+++ b/drivers/media/rc/keymaps/rc-leadtek-y04g0051.c
@@ -12,20 +12,20 @@ static struct rc_map_table leadtek_y04g0051[] = {
 	{ 0x0300, KEY_POWER2 },
 	{ 0x0303, KEY_SCREEN },
 	{ 0x0304, KEY_RIGHT },
-	{ 0x0305, KEY_1 },
-	{ 0x0306, KEY_2 },
-	{ 0x0307, KEY_3 },
+	{ 0x0305, KEY_NUMERIC_1 },
+	{ 0x0306, KEY_NUMERIC_2 },
+	{ 0x0307, KEY_NUMERIC_3 },
 	{ 0x0308, KEY_LEFT },
-	{ 0x0309, KEY_4 },
-	{ 0x030a, KEY_5 },
-	{ 0x030b, KEY_6 },
+	{ 0x0309, KEY_NUMERIC_4 },
+	{ 0x030a, KEY_NUMERIC_5 },
+	{ 0x030b, KEY_NUMERIC_6 },
 	{ 0x030c, KEY_UP },
-	{ 0x030d, KEY_7 },
-	{ 0x030e, KEY_8 },
-	{ 0x030f, KEY_9 },
+	{ 0x030d, KEY_NUMERIC_7 },
+	{ 0x030e, KEY_NUMERIC_8 },
+	{ 0x030f, KEY_NUMERIC_9 },
 	{ 0x0310, KEY_DOWN },
 	{ 0x0311, KEY_AGAIN },
-	{ 0x0312, KEY_0 },
+	{ 0x0312, KEY_NUMERIC_0 },
 	{ 0x0313, KEY_OK },              /* 1st ok */
 	{ 0x0314, KEY_MUTE },
 	{ 0x0316, KEY_OK },              /* 2nd ok */
diff --git a/drivers/media/rc/keymaps/rc-lme2510.c b/drivers/media/rc/keymaps/rc-lme2510.c
index b0901a8a72a6..181e48f0cb67 100644
--- a/drivers/media/rc/keymaps/rc-lme2510.c
+++ b/drivers/media/rc/keymaps/rc-lme2510.c
@@ -10,16 +10,16 @@
 
 static struct rc_map_table lme2510_rc[] = {
 	/* Type 1 - 26 buttons */
-	{ 0xef12ba45, KEY_0 },
-	{ 0xef12a05f, KEY_1 },
-	{ 0xef12af50, KEY_2 },
-	{ 0xef12a25d, KEY_3 },
-	{ 0xef12be41, KEY_4 },
-	{ 0xef12f50a, KEY_5 },
-	{ 0xef12bd42, KEY_6 },
-	{ 0xef12b847, KEY_7 },
-	{ 0xef12b649, KEY_8 },
-	{ 0xef12fa05, KEY_9 },
+	{ 0xef12ba45, KEY_NUMERIC_0 },
+	{ 0xef12a05f, KEY_NUMERIC_1 },
+	{ 0xef12af50, KEY_NUMERIC_2 },
+	{ 0xef12a25d, KEY_NUMERIC_3 },
+	{ 0xef12be41, KEY_NUMERIC_4 },
+	{ 0xef12f50a, KEY_NUMERIC_5 },
+	{ 0xef12bd42, KEY_NUMERIC_6 },
+	{ 0xef12b847, KEY_NUMERIC_7 },
+	{ 0xef12b649, KEY_NUMERIC_8 },
+	{ 0xef12fa05, KEY_NUMERIC_9 },
 	{ 0xef12bc43, KEY_POWER },
 	{ 0xef12b946, KEY_SUBTITLE },
 	{ 0xef12f906, KEY_PAUSE },
@@ -37,16 +37,16 @@ static struct rc_map_table lme2510_rc[] = {
 	{ 0xef12f807, KEY_EPG },
 	{ 0xef12fe01, KEY_STOP },
 	/* Type 2 - 20 buttons */
-	{ 0xff40ea15, KEY_0 },
-	{ 0xff40f708, KEY_1 },
-	{ 0xff40f609, KEY_2 },
-	{ 0xff40f50a, KEY_3 },
-	{ 0xff40f30c, KEY_4 },
-	{ 0xff40f20d, KEY_5 },
-	{ 0xff40f10e, KEY_6 },
-	{ 0xff40ef10, KEY_7 },
-	{ 0xff40ee11, KEY_8 },
-	{ 0xff40ed12, KEY_9 },
+	{ 0xff40ea15, KEY_NUMERIC_0 },
+	{ 0xff40f708, KEY_NUMERIC_1 },
+	{ 0xff40f609, KEY_NUMERIC_2 },
+	{ 0xff40f50a, KEY_NUMERIC_3 },
+	{ 0xff40f30c, KEY_NUMERIC_4 },
+	{ 0xff40f20d, KEY_NUMERIC_5 },
+	{ 0xff40f10e, KEY_NUMERIC_6 },
+	{ 0xff40ef10, KEY_NUMERIC_7 },
+	{ 0xff40ee11, KEY_NUMERIC_8 },
+	{ 0xff40ed12, KEY_NUMERIC_9 },
 	{ 0xff40ff00, KEY_POWER },
 	{ 0xff40fb04, KEY_MEDIA_REPEAT}, /* Recall */
 	{ 0xff40e51a, KEY_PAUSE }, /* Timeshift */
@@ -58,16 +58,16 @@ static struct rc_map_table lme2510_rc[] = {
 	{ 0xff40e718, KEY_RECORD },
 	{ 0xff40e916, KEY_STOP },
 	/* Type 3 - 20 buttons */
-	{ 0xff00e31c, KEY_0 },
-	{ 0xff00f807, KEY_1 },
-	{ 0xff00ea15, KEY_2 },
-	{ 0xff00f609, KEY_3 },
-	{ 0xff00e916, KEY_4 },
-	{ 0xff00e619, KEY_5 },
-	{ 0xff00f20d, KEY_6 },
-	{ 0xff00f30c, KEY_7 },
-	{ 0xff00e718, KEY_8 },
-	{ 0xff00a15e, KEY_9 },
+	{ 0xff00e31c, KEY_NUMERIC_0 },
+	{ 0xff00f807, KEY_NUMERIC_1 },
+	{ 0xff00ea15, KEY_NUMERIC_2 },
+	{ 0xff00f609, KEY_NUMERIC_3 },
+	{ 0xff00e916, KEY_NUMERIC_4 },
+	{ 0xff00e619, KEY_NUMERIC_5 },
+	{ 0xff00f20d, KEY_NUMERIC_6 },
+	{ 0xff00f30c, KEY_NUMERIC_7 },
+	{ 0xff00e718, KEY_NUMERIC_8 },
+	{ 0xff00a15e, KEY_NUMERIC_9 },
 	{ 0xff00ba45, KEY_POWER },
 	{ 0xff00bb44, KEY_MEDIA_REPEAT}, /* Recall */
 	{ 0xff00b54a, KEY_PAUSE }, /* Timeshift */
diff --git a/drivers/media/rc/keymaps/rc-manli.c b/drivers/media/rc/keymaps/rc-manli.c
index 5e9a49e2dd6a..e884aeb5c3d6 100644
--- a/drivers/media/rc/keymaps/rc-manli.c
+++ b/drivers/media/rc/keymaps/rc-manli.c
@@ -35,22 +35,22 @@ static struct rc_map_table manli[] = {
 	 *  0x07    0x08    0x09  *
 	 *   7       8       9    *
 	 *                        */
-	{ 0x01, KEY_1 },
-	{ 0x02, KEY_2 },
-	{ 0x03, KEY_3 },
-	{ 0x04, KEY_4 },
-	{ 0x05, KEY_5 },
-	{ 0x06, KEY_6 },
-	{ 0x07, KEY_7 },
-	{ 0x08, KEY_8 },
-	{ 0x09, KEY_9 },
+	{ 0x01, KEY_NUMERIC_1 },
+	{ 0x02, KEY_NUMERIC_2 },
+	{ 0x03, KEY_NUMERIC_3 },
+	{ 0x04, KEY_NUMERIC_4 },
+	{ 0x05, KEY_NUMERIC_5 },
+	{ 0x06, KEY_NUMERIC_6 },
+	{ 0x07, KEY_NUMERIC_7 },
+	{ 0x08, KEY_NUMERIC_8 },
+	{ 0x09, KEY_NUMERIC_9 },
 
 	/*  0x0a    0x00    0x17  *
 	 * RECALL    0      +100  *
 	 *                  PLUS  *
 	 *                        */
 	{ 0x0a, KEY_AGAIN },	/*XXX KEY_REWIND? */
-	{ 0x00, KEY_0 },
+	{ 0x00, KEY_NUMERIC_0 },
 	{ 0x17, KEY_DIGITS },	/*XXX*/
 
 	/*  0x14            0x10  *
diff --git a/drivers/media/rc/keymaps/rc-medion-x10-digitainer.c b/drivers/media/rc/keymaps/rc-medion-x10-digitainer.c
index 407706b246f2..bf74912859b3 100644
--- a/drivers/media/rc/keymaps/rc-medion-x10-digitainer.c
+++ b/drivers/media/rc/keymaps/rc-medion-x10-digitainer.c
@@ -63,16 +63,16 @@ static struct rc_map_table medion_x10_digitainer[] = {
 	{ 0x27, KEY_RECORD },
 	{ 0x26, KEY_FORWARD },
 
-	{ 0x0d, KEY_1 },
-	{ 0x0e, KEY_2 },
-	{ 0x0f, KEY_3 },
-	{ 0x10, KEY_4 },
-	{ 0x11, KEY_5 },
-	{ 0x12, KEY_6 },
-	{ 0x13, KEY_7 },
-	{ 0x14, KEY_8 },
-	{ 0x15, KEY_9 },
-	{ 0x17, KEY_0 },
+	{ 0x0d, KEY_NUMERIC_1 },
+	{ 0x0e, KEY_NUMERIC_2 },
+	{ 0x0f, KEY_NUMERIC_3 },
+	{ 0x10, KEY_NUMERIC_4 },
+	{ 0x11, KEY_NUMERIC_5 },
+	{ 0x12, KEY_NUMERIC_6 },
+	{ 0x13, KEY_NUMERIC_7 },
+	{ 0x14, KEY_NUMERIC_8 },
+	{ 0x15, KEY_NUMERIC_9 },
+	{ 0x17, KEY_NUMERIC_0 },
 
 	/* these do not actually exist on this remote, but these scancodes
 	 * exist on all other Medion X10 remotes and adding them here allows
diff --git a/drivers/media/rc/keymaps/rc-medion-x10-or2x.c b/drivers/media/rc/keymaps/rc-medion-x10-or2x.c
index 2ff5c454304d..293045c9aaa5 100644
--- a/drivers/media/rc/keymaps/rc-medion-x10-or2x.c
+++ b/drivers/media/rc/keymaps/rc-medion-x10-or2x.c
@@ -52,16 +52,16 @@ static struct rc_map_table medion_x10_or2x[] = {
 	{ 0x29, KEY_PAUSE },
 	{ 0x27, KEY_RECORD },
 
-	{ 0x0d, KEY_1 },
-	{ 0x0e, KEY_2 },
-	{ 0x0f, KEY_3 },
-	{ 0x10, KEY_4 },
-	{ 0x11, KEY_5 },
-	{ 0x12, KEY_6 },
-	{ 0x13, KEY_7 },
-	{ 0x14, KEY_8 },
-	{ 0x15, KEY_9 },
-	{ 0x17, KEY_0 },
+	{ 0x0d, KEY_NUMERIC_1 },
+	{ 0x0e, KEY_NUMERIC_2 },
+	{ 0x0f, KEY_NUMERIC_3 },
+	{ 0x10, KEY_NUMERIC_4 },
+	{ 0x11, KEY_NUMERIC_5 },
+	{ 0x12, KEY_NUMERIC_6 },
+	{ 0x13, KEY_NUMERIC_7 },
+	{ 0x14, KEY_NUMERIC_8 },
+	{ 0x15, KEY_NUMERIC_9 },
+	{ 0x17, KEY_NUMERIC_0 },
 	{ 0x30, KEY_CLEAR },
 	{ 0x36, KEY_ENTER },
 	{ 0x37, KEY_NUMERIC_STAR },
diff --git a/drivers/media/rc/keymaps/rc-medion-x10.c b/drivers/media/rc/keymaps/rc-medion-x10.c
index 66b962dc982b..843dba3bad73 100644
--- a/drivers/media/rc/keymaps/rc-medion-x10.c
+++ b/drivers/media/rc/keymaps/rc-medion-x10.c
@@ -37,16 +37,16 @@ static struct rc_map_table medion_x10[] = {
 	{ 0x35, KEY_BLUE }, /* blue */
 	{ 0x16, KEY_TEXT }, /* TXT */
 
-	{ 0x0d, KEY_1 },
-	{ 0x0e, KEY_2 },
-	{ 0x0f, KEY_3 },
-	{ 0x10, KEY_4 },
-	{ 0x11, KEY_5 },
-	{ 0x12, KEY_6 },
-	{ 0x13, KEY_7 },
-	{ 0x14, KEY_8 },
-	{ 0x15, KEY_9 },
-	{ 0x17, KEY_0 },
+	{ 0x0d, KEY_NUMERIC_1 },
+	{ 0x0e, KEY_NUMERIC_2 },
+	{ 0x0f, KEY_NUMERIC_3 },
+	{ 0x10, KEY_NUMERIC_4 },
+	{ 0x11, KEY_NUMERIC_5 },
+	{ 0x12, KEY_NUMERIC_6 },
+	{ 0x13, KEY_NUMERIC_7 },
+	{ 0x14, KEY_NUMERIC_8 },
+	{ 0x15, KEY_NUMERIC_9 },
+	{ 0x17, KEY_NUMERIC_0 },
 	{ 0x1c, KEY_SEARCH }, /* TV/RAD, CH SRC */
 	{ 0x20, KEY_DELETE }, /* DELETE */
 
diff --git a/drivers/media/rc/keymaps/rc-msi-digivox-ii.c b/drivers/media/rc/keymaps/rc-msi-digivox-ii.c
index d361554e8a2d..ab001d2dac67 100644
--- a/drivers/media/rc/keymaps/rc-msi-digivox-ii.c
+++ b/drivers/media/rc/keymaps/rc-msi-digivox-ii.c
@@ -9,23 +9,23 @@
 #include <linux/module.h>
 
 static struct rc_map_table msi_digivox_ii[] = {
-	{ 0x0302, KEY_2 },
+	{ 0x0302, KEY_NUMERIC_2 },
 	{ 0x0303, KEY_UP },              /* up */
-	{ 0x0304, KEY_3 },
+	{ 0x0304, KEY_NUMERIC_3 },
 	{ 0x0305, KEY_CHANNELDOWN },
-	{ 0x0308, KEY_5 },
-	{ 0x0309, KEY_0 },
-	{ 0x030b, KEY_8 },
+	{ 0x0308, KEY_NUMERIC_5 },
+	{ 0x0309, KEY_NUMERIC_0 },
+	{ 0x030b, KEY_NUMERIC_8 },
 	{ 0x030d, KEY_DOWN },            /* down */
-	{ 0x0310, KEY_9 },
-	{ 0x0311, KEY_7 },
+	{ 0x0310, KEY_NUMERIC_9 },
+	{ 0x0311, KEY_NUMERIC_7 },
 	{ 0x0314, KEY_VOLUMEUP },
 	{ 0x0315, KEY_CHANNELUP },
 	{ 0x0316, KEY_OK },
 	{ 0x0317, KEY_POWER2 },
-	{ 0x031a, KEY_1 },
-	{ 0x031c, KEY_4 },
-	{ 0x031d, KEY_6 },
+	{ 0x031a, KEY_NUMERIC_1 },
+	{ 0x031c, KEY_NUMERIC_4 },
+	{ 0x031d, KEY_NUMERIC_6 },
 	{ 0x031f, KEY_VOLUMEDOWN },
 };
 
diff --git a/drivers/media/rc/keymaps/rc-msi-digivox-iii.c b/drivers/media/rc/keymaps/rc-msi-digivox-iii.c
index 31d41564a438..6129d3e925e5 100644
--- a/drivers/media/rc/keymaps/rc-msi-digivox-iii.c
+++ b/drivers/media/rc/keymaps/rc-msi-digivox-iii.c
@@ -14,22 +14,22 @@
    since rc-kworld-315u.c lacks NEC extended address byte. */
 static struct rc_map_table msi_digivox_iii[] = {
 	{ 0x61d601, KEY_VIDEO },           /* Source */
-	{ 0x61d602, KEY_3 },
+	{ 0x61d602, KEY_NUMERIC_3 },
 	{ 0x61d603, KEY_POWER },           /* ShutDown */
-	{ 0x61d604, KEY_1 },
-	{ 0x61d605, KEY_5 },
-	{ 0x61d606, KEY_6 },
+	{ 0x61d604, KEY_NUMERIC_1 },
+	{ 0x61d605, KEY_NUMERIC_5 },
+	{ 0x61d606, KEY_NUMERIC_6 },
 	{ 0x61d607, KEY_CHANNELDOWN },     /* CH- */
-	{ 0x61d608, KEY_2 },
+	{ 0x61d608, KEY_NUMERIC_2 },
 	{ 0x61d609, KEY_CHANNELUP },       /* CH+ */
-	{ 0x61d60a, KEY_9 },
+	{ 0x61d60a, KEY_NUMERIC_9 },
 	{ 0x61d60b, KEY_ZOOM },            /* Zoom */
-	{ 0x61d60c, KEY_7 },
-	{ 0x61d60d, KEY_8 },
+	{ 0x61d60c, KEY_NUMERIC_7 },
+	{ 0x61d60d, KEY_NUMERIC_8 },
 	{ 0x61d60e, KEY_VOLUMEUP },        /* Vol+ */
-	{ 0x61d60f, KEY_4 },
+	{ 0x61d60f, KEY_NUMERIC_4 },
 	{ 0x61d610, KEY_ESC },             /* [back up arrow] */
-	{ 0x61d611, KEY_0 },
+	{ 0x61d611, KEY_NUMERIC_0 },
 	{ 0x61d612, KEY_OK },              /* [enter arrow] */
 	{ 0x61d613, KEY_VOLUMEDOWN },      /* Vol- */
 	{ 0x61d614, KEY_RECORD },          /* Rec */
diff --git a/drivers/media/rc/keymaps/rc-msi-tvanywhere-plus.c b/drivers/media/rc/keymaps/rc-msi-tvanywhere-plus.c
index 78cf2c286083..280df236691f 100644
--- a/drivers/media/rc/keymaps/rc-msi-tvanywhere-plus.c
+++ b/drivers/media/rc/keymaps/rc-msi-tvanywhere-plus.c
@@ -44,16 +44,16 @@ static struct rc_map_table msi_tvanywhere_plus[] = {
      <<      FUNC    >>     RESET
 */
 
-	{ 0x01, KEY_1 },		/* 1 */
-	{ 0x0b, KEY_2 },		/* 2 */
-	{ 0x1b, KEY_3 },		/* 3 */
-	{ 0x05, KEY_4 },		/* 4 */
-	{ 0x09, KEY_5 },		/* 5 */
-	{ 0x15, KEY_6 },		/* 6 */
-	{ 0x06, KEY_7 },		/* 7 */
-	{ 0x0a, KEY_8 },		/* 8 */
-	{ 0x12, KEY_9 },		/* 9 */
-	{ 0x02, KEY_0 },		/* 0 */
+	{ 0x01, KEY_NUMERIC_1 },		/* 1 */
+	{ 0x0b, KEY_NUMERIC_2 },		/* 2 */
+	{ 0x1b, KEY_NUMERIC_3 },		/* 3 */
+	{ 0x05, KEY_NUMERIC_4 },		/* 4 */
+	{ 0x09, KEY_NUMERIC_5 },		/* 5 */
+	{ 0x15, KEY_NUMERIC_6 },		/* 6 */
+	{ 0x06, KEY_NUMERIC_7 },		/* 7 */
+	{ 0x0a, KEY_NUMERIC_8 },		/* 8 */
+	{ 0x12, KEY_NUMERIC_9 },		/* 9 */
+	{ 0x02, KEY_NUMERIC_0 },		/* 0 */
 	{ 0x10, KEY_KPPLUS },		/* + */
 	{ 0x13, KEY_AGAIN },		/* Recall */
 
diff --git a/drivers/media/rc/keymaps/rc-msi-tvanywhere.c b/drivers/media/rc/keymaps/rc-msi-tvanywhere.c
index 359a57be3a66..45793c641009 100644
--- a/drivers/media/rc/keymaps/rc-msi-tvanywhere.c
+++ b/drivers/media/rc/keymaps/rc-msi-tvanywhere.c
@@ -12,16 +12,16 @@
 
 static struct rc_map_table msi_tvanywhere[] = {
 	/* Keys 0 to 9 */
-	{ 0x00, KEY_0 },
-	{ 0x01, KEY_1 },
-	{ 0x02, KEY_2 },
-	{ 0x03, KEY_3 },
-	{ 0x04, KEY_4 },
-	{ 0x05, KEY_5 },
-	{ 0x06, KEY_6 },
-	{ 0x07, KEY_7 },
-	{ 0x08, KEY_8 },
-	{ 0x09, KEY_9 },
+	{ 0x00, KEY_NUMERIC_0 },
+	{ 0x01, KEY_NUMERIC_1 },
+	{ 0x02, KEY_NUMERIC_2 },
+	{ 0x03, KEY_NUMERIC_3 },
+	{ 0x04, KEY_NUMERIC_4 },
+	{ 0x05, KEY_NUMERIC_5 },
+	{ 0x06, KEY_NUMERIC_6 },
+	{ 0x07, KEY_NUMERIC_7 },
+	{ 0x08, KEY_NUMERIC_8 },
+	{ 0x09, KEY_NUMERIC_9 },
 
 	{ 0x0c, KEY_MUTE },
 	{ 0x0f, KEY_SCREEN },		/* Full Screen */
diff --git a/drivers/media/rc/keymaps/rc-nebula.c b/drivers/media/rc/keymaps/rc-nebula.c
index 17d7c1b324da..2dc6061f69b3 100644
--- a/drivers/media/rc/keymaps/rc-nebula.c
+++ b/drivers/media/rc/keymaps/rc-nebula.c
@@ -9,16 +9,16 @@
 #include <linux/module.h>
 
 static struct rc_map_table nebula[] = {
-	{ 0x0000, KEY_0 },
-	{ 0x0001, KEY_1 },
-	{ 0x0002, KEY_2 },
-	{ 0x0003, KEY_3 },
-	{ 0x0004, KEY_4 },
-	{ 0x0005, KEY_5 },
-	{ 0x0006, KEY_6 },
-	{ 0x0007, KEY_7 },
-	{ 0x0008, KEY_8 },
-	{ 0x0009, KEY_9 },
+	{ 0x0000, KEY_NUMERIC_0 },
+	{ 0x0001, KEY_NUMERIC_1 },
+	{ 0x0002, KEY_NUMERIC_2 },
+	{ 0x0003, KEY_NUMERIC_3 },
+	{ 0x0004, KEY_NUMERIC_4 },
+	{ 0x0005, KEY_NUMERIC_5 },
+	{ 0x0006, KEY_NUMERIC_6 },
+	{ 0x0007, KEY_NUMERIC_7 },
+	{ 0x0008, KEY_NUMERIC_8 },
+	{ 0x0009, KEY_NUMERIC_9 },
 	{ 0x000a, KEY_TV },
 	{ 0x000b, KEY_AUX },
 	{ 0x000c, KEY_DVD },
diff --git a/drivers/media/rc/keymaps/rc-nec-terratec-cinergy-xs.c b/drivers/media/rc/keymaps/rc-nec-terratec-cinergy-xs.c
index 76beef44a8d7..b12c54d47db3 100644
--- a/drivers/media/rc/keymaps/rc-nec-terratec-cinergy-xs.c
+++ b/drivers/media/rc/keymaps/rc-nec-terratec-cinergy-xs.c
@@ -23,16 +23,16 @@ static struct rc_map_table nec_terratec_cinergy_xs[] = {
 	{ 0x1444, KEY_TEXT},		/* Teletext */
 	{ 0x1445, KEY_DELETE},
 
-	{ 0x1402, KEY_1},
-	{ 0x1403, KEY_2},
-	{ 0x1404, KEY_3},
-	{ 0x1405, KEY_4},
-	{ 0x1406, KEY_5},
-	{ 0x1407, KEY_6},
-	{ 0x1408, KEY_7},
-	{ 0x1409, KEY_8},
-	{ 0x140a, KEY_9},
-	{ 0x140c, KEY_0},
+	{ 0x1402, KEY_NUMERIC_1},
+	{ 0x1403, KEY_NUMERIC_2},
+	{ 0x1404, KEY_NUMERIC_3},
+	{ 0x1405, KEY_NUMERIC_4},
+	{ 0x1406, KEY_NUMERIC_5},
+	{ 0x1407, KEY_NUMERIC_6},
+	{ 0x1408, KEY_NUMERIC_7},
+	{ 0x1409, KEY_NUMERIC_8},
+	{ 0x140a, KEY_NUMERIC_9},
+	{ 0x140c, KEY_NUMERIC_0},
 
 	{ 0x140b, KEY_TUNER},		/* AV */
 	{ 0x140d, KEY_MODE},		/* A.B */
@@ -79,16 +79,16 @@ static struct rc_map_table nec_terratec_cinergy_xs[] = {
 	/* Terratec Black IR, with most keys in black */
 	{ 0x04eb01, KEY_POWER2},
 
-	{ 0x04eb02, KEY_1},
-	{ 0x04eb03, KEY_2},
-	{ 0x04eb04, KEY_3},
-	{ 0x04eb05, KEY_4},
-	{ 0x04eb06, KEY_5},
-	{ 0x04eb07, KEY_6},
-	{ 0x04eb08, KEY_7},
-	{ 0x04eb09, KEY_8},
-	{ 0x04eb0a, KEY_9},
-	{ 0x04eb0c, KEY_0},
+	{ 0x04eb02, KEY_NUMERIC_1},
+	{ 0x04eb03, KEY_NUMERIC_2},
+	{ 0x04eb04, KEY_NUMERIC_3},
+	{ 0x04eb05, KEY_NUMERIC_4},
+	{ 0x04eb06, KEY_NUMERIC_5},
+	{ 0x04eb07, KEY_NUMERIC_6},
+	{ 0x04eb08, KEY_NUMERIC_7},
+	{ 0x04eb09, KEY_NUMERIC_8},
+	{ 0x04eb0a, KEY_NUMERIC_9},
+	{ 0x04eb0c, KEY_NUMERIC_0},
 
 	{ 0x04eb0b, KEY_TEXT},		/* TXT */
 	{ 0x04eb0d, KEY_REFRESH},	/* Refresh */
diff --git a/drivers/media/rc/keymaps/rc-norwood.c b/drivers/media/rc/keymaps/rc-norwood.c
index 3765705c5549..acd5b1ccf8d0 100644
--- a/drivers/media/rc/keymaps/rc-norwood.c
+++ b/drivers/media/rc/keymaps/rc-norwood.c
@@ -14,16 +14,16 @@
 
 static struct rc_map_table norwood[] = {
 	/* Keys 0 to 9 */
-	{ 0x20, KEY_0 },
-	{ 0x21, KEY_1 },
-	{ 0x22, KEY_2 },
-	{ 0x23, KEY_3 },
-	{ 0x24, KEY_4 },
-	{ 0x25, KEY_5 },
-	{ 0x26, KEY_6 },
-	{ 0x27, KEY_7 },
-	{ 0x28, KEY_8 },
-	{ 0x29, KEY_9 },
+	{ 0x20, KEY_NUMERIC_0 },
+	{ 0x21, KEY_NUMERIC_1 },
+	{ 0x22, KEY_NUMERIC_2 },
+	{ 0x23, KEY_NUMERIC_3 },
+	{ 0x24, KEY_NUMERIC_4 },
+	{ 0x25, KEY_NUMERIC_5 },
+	{ 0x26, KEY_NUMERIC_6 },
+	{ 0x27, KEY_NUMERIC_7 },
+	{ 0x28, KEY_NUMERIC_8 },
+	{ 0x29, KEY_NUMERIC_9 },
 
 	{ 0x78, KEY_VIDEO },		/* Video Source        */
 	{ 0x2c, KEY_EXIT },		/* Open/Close software */
diff --git a/drivers/media/rc/keymaps/rc-npgtech.c b/drivers/media/rc/keymaps/rc-npgtech.c
index abaf7f6d4cb7..98a755e8bc18 100644
--- a/drivers/media/rc/keymaps/rc-npgtech.c
+++ b/drivers/media/rc/keymaps/rc-npgtech.c
@@ -12,16 +12,16 @@ static struct rc_map_table npgtech[] = {
 	{ 0x1d, KEY_SWITCHVIDEOMODE },	/* switch inputs */
 	{ 0x2a, KEY_FRONT },
 
-	{ 0x3e, KEY_1 },
-	{ 0x02, KEY_2 },
-	{ 0x06, KEY_3 },
-	{ 0x0a, KEY_4 },
-	{ 0x0e, KEY_5 },
-	{ 0x12, KEY_6 },
-	{ 0x16, KEY_7 },
-	{ 0x1a, KEY_8 },
-	{ 0x1e, KEY_9 },
-	{ 0x3a, KEY_0 },
+	{ 0x3e, KEY_NUMERIC_1 },
+	{ 0x02, KEY_NUMERIC_2 },
+	{ 0x06, KEY_NUMERIC_3 },
+	{ 0x0a, KEY_NUMERIC_4 },
+	{ 0x0e, KEY_NUMERIC_5 },
+	{ 0x12, KEY_NUMERIC_6 },
+	{ 0x16, KEY_NUMERIC_7 },
+	{ 0x1a, KEY_NUMERIC_8 },
+	{ 0x1e, KEY_NUMERIC_9 },
+	{ 0x3a, KEY_NUMERIC_0 },
 	{ 0x22, KEY_NUMLOCK },		/* -/-- */
 	{ 0x20, KEY_REFRESH },
 
diff --git a/drivers/media/rc/keymaps/rc-pctv-sedna.c b/drivers/media/rc/keymaps/rc-pctv-sedna.c
index e3462c5c8984..c3bb1ecdd0ca 100644
--- a/drivers/media/rc/keymaps/rc-pctv-sedna.c
+++ b/drivers/media/rc/keymaps/rc-pctv-sedna.c
@@ -14,16 +14,16 @@
    Also for the remote bundled with Kozumi KTV-01C card */
 
 static struct rc_map_table pctv_sedna[] = {
-	{ 0x00, KEY_0 },
-	{ 0x01, KEY_1 },
-	{ 0x02, KEY_2 },
-	{ 0x03, KEY_3 },
-	{ 0x04, KEY_4 },
-	{ 0x05, KEY_5 },
-	{ 0x06, KEY_6 },
-	{ 0x07, KEY_7 },
-	{ 0x08, KEY_8 },
-	{ 0x09, KEY_9 },
+	{ 0x00, KEY_NUMERIC_0 },
+	{ 0x01, KEY_NUMERIC_1 },
+	{ 0x02, KEY_NUMERIC_2 },
+	{ 0x03, KEY_NUMERIC_3 },
+	{ 0x04, KEY_NUMERIC_4 },
+	{ 0x05, KEY_NUMERIC_5 },
+	{ 0x06, KEY_NUMERIC_6 },
+	{ 0x07, KEY_NUMERIC_7 },
+	{ 0x08, KEY_NUMERIC_8 },
+	{ 0x09, KEY_NUMERIC_9 },
 
 	{ 0x0a, KEY_AGAIN },	/* Recall */
 	{ 0x0b, KEY_CHANNELUP },
diff --git a/drivers/media/rc/keymaps/rc-pinnacle-color.c b/drivers/media/rc/keymaps/rc-pinnacle-color.c
index 63c2851e9dfe..b862725635b9 100644
--- a/drivers/media/rc/keymaps/rc-pinnacle-color.c
+++ b/drivers/media/rc/keymaps/rc-pinnacle-color.c
@@ -49,16 +49,16 @@ static struct rc_map_table pinnacle_color[] = {
 	{ 0x4c, KEY_STOP },
 	{ 0x54, KEY_NEXT },
 
-	{ 0x69, KEY_0 },
-	{ 0x6a, KEY_1 },
-	{ 0x6b, KEY_2 },
-	{ 0x6c, KEY_3 },
-	{ 0x6d, KEY_4 },
-	{ 0x6e, KEY_5 },
-	{ 0x6f, KEY_6 },
-	{ 0x70, KEY_7 },
-	{ 0x71, KEY_8 },
-	{ 0x72, KEY_9 },
+	{ 0x69, KEY_NUMERIC_0 },
+	{ 0x6a, KEY_NUMERIC_1 },
+	{ 0x6b, KEY_NUMERIC_2 },
+	{ 0x6c, KEY_NUMERIC_3 },
+	{ 0x6d, KEY_NUMERIC_4 },
+	{ 0x6e, KEY_NUMERIC_5 },
+	{ 0x6f, KEY_NUMERIC_6 },
+	{ 0x70, KEY_NUMERIC_7 },
+	{ 0x71, KEY_NUMERIC_8 },
+	{ 0x72, KEY_NUMERIC_9 },
 
 	{ 0x74, KEY_CHANNEL },
 	{ 0x0a, KEY_BACKSPACE },
diff --git a/drivers/media/rc/keymaps/rc-pinnacle-grey.c b/drivers/media/rc/keymaps/rc-pinnacle-grey.c
index 31794d4180db..3853b653cee6 100644
--- a/drivers/media/rc/keymaps/rc-pinnacle-grey.c
+++ b/drivers/media/rc/keymaps/rc-pinnacle-grey.c
@@ -9,16 +9,16 @@
 #include <linux/module.h>
 
 static struct rc_map_table pinnacle_grey[] = {
-	{ 0x3a, KEY_0 },
-	{ 0x31, KEY_1 },
-	{ 0x32, KEY_2 },
-	{ 0x33, KEY_3 },
-	{ 0x34, KEY_4 },
-	{ 0x35, KEY_5 },
-	{ 0x36, KEY_6 },
-	{ 0x37, KEY_7 },
-	{ 0x38, KEY_8 },
-	{ 0x39, KEY_9 },
+	{ 0x3a, KEY_NUMERIC_0 },
+	{ 0x31, KEY_NUMERIC_1 },
+	{ 0x32, KEY_NUMERIC_2 },
+	{ 0x33, KEY_NUMERIC_3 },
+	{ 0x34, KEY_NUMERIC_4 },
+	{ 0x35, KEY_NUMERIC_5 },
+	{ 0x36, KEY_NUMERIC_6 },
+	{ 0x37, KEY_NUMERIC_7 },
+	{ 0x38, KEY_NUMERIC_8 },
+	{ 0x39, KEY_NUMERIC_9 },
 
 	{ 0x2f, KEY_POWER },
 
diff --git a/drivers/media/rc/keymaps/rc-pinnacle-pctv-hd.c b/drivers/media/rc/keymaps/rc-pinnacle-pctv-hd.c
index 876aeb6e1d9c..96d8112fb468 100644
--- a/drivers/media/rc/keymaps/rc-pinnacle-pctv-hd.c
+++ b/drivers/media/rc/keymaps/rc-pinnacle-pctv-hd.c
@@ -20,16 +20,16 @@ static struct rc_map_table pinnacle_pctv_hd[] = {
 	{ 0x0709, KEY_VOLUMEDOWN },
 	{ 0x0706, KEY_CHANNELUP },
 	{ 0x070c, KEY_CHANNELDOWN },
-	{ 0x070f, KEY_1 },
-	{ 0x0715, KEY_2 },
-	{ 0x0710, KEY_3 },
-	{ 0x0718, KEY_4 },
-	{ 0x071b, KEY_5 },
-	{ 0x071e, KEY_6 },
-	{ 0x0711, KEY_7 },
-	{ 0x0721, KEY_8 },
-	{ 0x0712, KEY_9 },
-	{ 0x0727, KEY_0 },
+	{ 0x070f, KEY_NUMERIC_1 },
+	{ 0x0715, KEY_NUMERIC_2 },
+	{ 0x0710, KEY_NUMERIC_3 },
+	{ 0x0718, KEY_NUMERIC_4 },
+	{ 0x071b, KEY_NUMERIC_5 },
+	{ 0x071e, KEY_NUMERIC_6 },
+	{ 0x0711, KEY_NUMERIC_7 },
+	{ 0x0721, KEY_NUMERIC_8 },
+	{ 0x0712, KEY_NUMERIC_9 },
+	{ 0x0727, KEY_NUMERIC_0 },
 	{ 0x0724, KEY_ZOOM }, /* 'Square' key */
 	{ 0x072a, KEY_SUBTITLE },   /* 'T' key */
 	{ 0x072d, KEY_REWIND },
diff --git a/drivers/media/rc/keymaps/rc-pixelview-002t.c b/drivers/media/rc/keymaps/rc-pixelview-002t.c
index c0550e09f255..c3439c46644c 100644
--- a/drivers/media/rc/keymaps/rc-pixelview-002t.c
+++ b/drivers/media/rc/keymaps/rc-pixelview-002t.c
@@ -16,16 +16,16 @@ static struct rc_map_table pixelview_002t[] = {
 	{ 0x866b13, KEY_MUTE },
 	{ 0x866b12, KEY_POWER2 },	/* power */
 
-	{ 0x866b01, KEY_1 },
-	{ 0x866b02, KEY_2 },
-	{ 0x866b03, KEY_3 },
-	{ 0x866b04, KEY_4 },
-	{ 0x866b05, KEY_5 },
-	{ 0x866b06, KEY_6 },
-	{ 0x866b07, KEY_7 },
-	{ 0x866b08, KEY_8 },
-	{ 0x866b09, KEY_9 },
-	{ 0x866b00, KEY_0 },
+	{ 0x866b01, KEY_NUMERIC_1 },
+	{ 0x866b02, KEY_NUMERIC_2 },
+	{ 0x866b03, KEY_NUMERIC_3 },
+	{ 0x866b04, KEY_NUMERIC_4 },
+	{ 0x866b05, KEY_NUMERIC_5 },
+	{ 0x866b06, KEY_NUMERIC_6 },
+	{ 0x866b07, KEY_NUMERIC_7 },
+	{ 0x866b08, KEY_NUMERIC_8 },
+	{ 0x866b09, KEY_NUMERIC_9 },
+	{ 0x866b00, KEY_NUMERIC_0 },
 
 	{ 0x866b0d, KEY_CHANNELUP },
 	{ 0x866b19, KEY_CHANNELDOWN },
diff --git a/drivers/media/rc/keymaps/rc-pixelview-mk12.c b/drivers/media/rc/keymaps/rc-pixelview-mk12.c
index 864c8ea5d8e3..ea11ccde8442 100644
--- a/drivers/media/rc/keymaps/rc-pixelview-mk12.c
+++ b/drivers/media/rc/keymaps/rc-pixelview-mk12.c
@@ -16,16 +16,16 @@ static struct rc_map_table pixelview_mk12[] = {
 	{ 0x866b03, KEY_TUNER },	/* Timeshift */
 	{ 0x866b1e, KEY_POWER2 },	/* power */
 
-	{ 0x866b01, KEY_1 },
-	{ 0x866b0b, KEY_2 },
-	{ 0x866b1b, KEY_3 },
-	{ 0x866b05, KEY_4 },
-	{ 0x866b09, KEY_5 },
-	{ 0x866b15, KEY_6 },
-	{ 0x866b06, KEY_7 },
-	{ 0x866b0a, KEY_8 },
-	{ 0x866b12, KEY_9 },
-	{ 0x866b02, KEY_0 },
+	{ 0x866b01, KEY_NUMERIC_1 },
+	{ 0x866b0b, KEY_NUMERIC_2 },
+	{ 0x866b1b, KEY_NUMERIC_3 },
+	{ 0x866b05, KEY_NUMERIC_4 },
+	{ 0x866b09, KEY_NUMERIC_5 },
+	{ 0x866b15, KEY_NUMERIC_6 },
+	{ 0x866b06, KEY_NUMERIC_7 },
+	{ 0x866b0a, KEY_NUMERIC_8 },
+	{ 0x866b12, KEY_NUMERIC_9 },
+	{ 0x866b02, KEY_NUMERIC_0 },
 
 	{ 0x866b13, KEY_AGAIN },	/* loop */
 	{ 0x866b10, KEY_DIGITS },	/* +100 */
diff --git a/drivers/media/rc/keymaps/rc-pixelview-new.c b/drivers/media/rc/keymaps/rc-pixelview-new.c
index e4e34f2ccf74..0259666831b0 100644
--- a/drivers/media/rc/keymaps/rc-pixelview-new.c
+++ b/drivers/media/rc/keymaps/rc-pixelview-new.c
@@ -17,16 +17,16 @@ static struct rc_map_table pixelview_new[] = {
 	{ 0x3c, KEY_TIME },		/* Timeshift */
 	{ 0x12, KEY_POWER },
 
-	{ 0x3d, KEY_1 },
-	{ 0x38, KEY_2 },
-	{ 0x18, KEY_3 },
-	{ 0x35, KEY_4 },
-	{ 0x39, KEY_5 },
-	{ 0x15, KEY_6 },
-	{ 0x36, KEY_7 },
-	{ 0x3a, KEY_8 },
-	{ 0x1e, KEY_9 },
-	{ 0x3e, KEY_0 },
+	{ 0x3d, KEY_NUMERIC_1 },
+	{ 0x38, KEY_NUMERIC_2 },
+	{ 0x18, KEY_NUMERIC_3 },
+	{ 0x35, KEY_NUMERIC_4 },
+	{ 0x39, KEY_NUMERIC_5 },
+	{ 0x15, KEY_NUMERIC_6 },
+	{ 0x36, KEY_NUMERIC_7 },
+	{ 0x3a, KEY_NUMERIC_8 },
+	{ 0x1e, KEY_NUMERIC_9 },
+	{ 0x3e, KEY_NUMERIC_0 },
 
 	{ 0x1c, KEY_AGAIN },		/* LOOP	*/
 	{ 0x3f, KEY_VIDEO },		/* Source */
diff --git a/drivers/media/rc/keymaps/rc-pixelview.c b/drivers/media/rc/keymaps/rc-pixelview.c
index 988919735165..29f6d2c013e4 100644
--- a/drivers/media/rc/keymaps/rc-pixelview.c
+++ b/drivers/media/rc/keymaps/rc-pixelview.c
@@ -25,16 +25,16 @@ static struct rc_map_table pixelview[] = {
 	{ 0x19, KEY_ZOOM },		/* zoom */
 	{ 0x0f, KEY_TEXT },		/* min */
 
-	{ 0x01, KEY_1 },
-	{ 0x0b, KEY_2 },
-	{ 0x1b, KEY_3 },
-	{ 0x05, KEY_4 },
-	{ 0x09, KEY_5 },
-	{ 0x15, KEY_6 },
-	{ 0x06, KEY_7 },
-	{ 0x0a, KEY_8 },
-	{ 0x12, KEY_9 },
-	{ 0x02, KEY_0 },
+	{ 0x01, KEY_NUMERIC_1 },
+	{ 0x0b, KEY_NUMERIC_2 },
+	{ 0x1b, KEY_NUMERIC_3 },
+	{ 0x05, KEY_NUMERIC_4 },
+	{ 0x09, KEY_NUMERIC_5 },
+	{ 0x15, KEY_NUMERIC_6 },
+	{ 0x06, KEY_NUMERIC_7 },
+	{ 0x0a, KEY_NUMERIC_8 },
+	{ 0x12, KEY_NUMERIC_9 },
+	{ 0x02, KEY_NUMERIC_0 },
 	{ 0x10, KEY_LAST },		/* +100 */
 	{ 0x13, KEY_LIST },		/* recall */
 
diff --git a/drivers/media/rc/keymaps/rc-powercolor-real-angel.c b/drivers/media/rc/keymaps/rc-powercolor-real-angel.c
index cf98cf8dc13c..66fe2e52e7c8 100644
--- a/drivers/media/rc/keymaps/rc-powercolor-real-angel.c
+++ b/drivers/media/rc/keymaps/rc-powercolor-real-angel.c
@@ -16,16 +16,16 @@
 static struct rc_map_table powercolor_real_angel[] = {
 	{ 0x38, KEY_SWITCHVIDEOMODE },	/* switch inputs */
 	{ 0x0c, KEY_MEDIA },		/* Turn ON/OFF App */
-	{ 0x00, KEY_0 },
-	{ 0x01, KEY_1 },
-	{ 0x02, KEY_2 },
-	{ 0x03, KEY_3 },
-	{ 0x04, KEY_4 },
-	{ 0x05, KEY_5 },
-	{ 0x06, KEY_6 },
-	{ 0x07, KEY_7 },
-	{ 0x08, KEY_8 },
-	{ 0x09, KEY_9 },
+	{ 0x00, KEY_NUMERIC_0 },
+	{ 0x01, KEY_NUMERIC_1 },
+	{ 0x02, KEY_NUMERIC_2 },
+	{ 0x03, KEY_NUMERIC_3 },
+	{ 0x04, KEY_NUMERIC_4 },
+	{ 0x05, KEY_NUMERIC_5 },
+	{ 0x06, KEY_NUMERIC_6 },
+	{ 0x07, KEY_NUMERIC_7 },
+	{ 0x08, KEY_NUMERIC_8 },
+	{ 0x09, KEY_NUMERIC_9 },
 	{ 0x0a, KEY_DIGITS },		/* single, double, triple digit */
 	{ 0x29, KEY_PREVIOUS },		/* previous channel */
 	{ 0x12, KEY_BRIGHTNESSUP },
diff --git a/drivers/media/rc/keymaps/rc-proteus-2309.c b/drivers/media/rc/keymaps/rc-proteus-2309.c
index d2c13d0e7bff..36eebefd975c 100644
--- a/drivers/media/rc/keymaps/rc-proteus-2309.c
+++ b/drivers/media/rc/keymaps/rc-proteus-2309.c
@@ -12,16 +12,16 @@
 
 static struct rc_map_table proteus_2309[] = {
 	/* numeric */
-	{ 0x00, KEY_0 },
-	{ 0x01, KEY_1 },
-	{ 0x02, KEY_2 },
-	{ 0x03, KEY_3 },
-	{ 0x04, KEY_4 },
-	{ 0x05, KEY_5 },
-	{ 0x06, KEY_6 },
-	{ 0x07, KEY_7 },
-	{ 0x08, KEY_8 },
-	{ 0x09, KEY_9 },
+	{ 0x00, KEY_NUMERIC_0 },
+	{ 0x01, KEY_NUMERIC_1 },
+	{ 0x02, KEY_NUMERIC_2 },
+	{ 0x03, KEY_NUMERIC_3 },
+	{ 0x04, KEY_NUMERIC_4 },
+	{ 0x05, KEY_NUMERIC_5 },
+	{ 0x06, KEY_NUMERIC_6 },
+	{ 0x07, KEY_NUMERIC_7 },
+	{ 0x08, KEY_NUMERIC_8 },
+	{ 0x09, KEY_NUMERIC_9 },
 
 	{ 0x5c, KEY_POWER },		/* power       */
 	{ 0x20, KEY_ZOOM },		/* full screen */
diff --git a/drivers/media/rc/keymaps/rc-purpletv.c b/drivers/media/rc/keymaps/rc-purpletv.c
index c8011f4d96ea..bf4543fecb6f 100644
--- a/drivers/media/rc/keymaps/rc-purpletv.c
+++ b/drivers/media/rc/keymaps/rc-purpletv.c
@@ -13,16 +13,16 @@ static struct rc_map_table purpletv[] = {
 	{ 0x6f, KEY_MUTE },
 	{ 0x10, KEY_BACKSPACE },	/* Recall */
 
-	{ 0x11, KEY_0 },
-	{ 0x04, KEY_1 },
-	{ 0x05, KEY_2 },
-	{ 0x06, KEY_3 },
-	{ 0x08, KEY_4 },
-	{ 0x09, KEY_5 },
-	{ 0x0a, KEY_6 },
-	{ 0x0c, KEY_7 },
-	{ 0x0d, KEY_8 },
-	{ 0x0e, KEY_9 },
+	{ 0x11, KEY_NUMERIC_0 },
+	{ 0x04, KEY_NUMERIC_1 },
+	{ 0x05, KEY_NUMERIC_2 },
+	{ 0x06, KEY_NUMERIC_3 },
+	{ 0x08, KEY_NUMERIC_4 },
+	{ 0x09, KEY_NUMERIC_5 },
+	{ 0x0a, KEY_NUMERIC_6 },
+	{ 0x0c, KEY_NUMERIC_7 },
+	{ 0x0d, KEY_NUMERIC_8 },
+	{ 0x0e, KEY_NUMERIC_9 },
 	{ 0x12, KEY_DOT },	/* 100+ */
 
 	{ 0x07, KEY_VOLUMEUP },
diff --git a/drivers/media/rc/keymaps/rc-pv951.c b/drivers/media/rc/keymaps/rc-pv951.c
index 5235ee899c30..69db55463000 100644
--- a/drivers/media/rc/keymaps/rc-pv951.c
+++ b/drivers/media/rc/keymaps/rc-pv951.c
@@ -11,16 +11,16 @@
 /* Mark Phalan <phalanm@o2.ie> */
 
 static struct rc_map_table pv951[] = {
-	{ 0x00, KEY_0 },
-	{ 0x01, KEY_1 },
-	{ 0x02, KEY_2 },
-	{ 0x03, KEY_3 },
-	{ 0x04, KEY_4 },
-	{ 0x05, KEY_5 },
-	{ 0x06, KEY_6 },
-	{ 0x07, KEY_7 },
-	{ 0x08, KEY_8 },
-	{ 0x09, KEY_9 },
+	{ 0x00, KEY_NUMERIC_0 },
+	{ 0x01, KEY_NUMERIC_1 },
+	{ 0x02, KEY_NUMERIC_2 },
+	{ 0x03, KEY_NUMERIC_3 },
+	{ 0x04, KEY_NUMERIC_4 },
+	{ 0x05, KEY_NUMERIC_5 },
+	{ 0x06, KEY_NUMERIC_6 },
+	{ 0x07, KEY_NUMERIC_7 },
+	{ 0x08, KEY_NUMERIC_8 },
+	{ 0x09, KEY_NUMERIC_9 },
 
 	{ 0x12, KEY_POWER },
 	{ 0x10, KEY_MUTE },
diff --git a/drivers/media/rc/keymaps/rc-real-audio-220-32-keys.c b/drivers/media/rc/keymaps/rc-real-audio-220-32-keys.c
index 1cf786649675..33bb458b81fd 100644
--- a/drivers/media/rc/keymaps/rc-real-audio-220-32-keys.c
+++ b/drivers/media/rc/keymaps/rc-real-audio-220-32-keys.c
@@ -14,16 +14,16 @@ static struct rc_map_table real_audio_220_32_keys[] = {
 	{ 0x1c, KEY_RADIO},
 	{ 0x12, KEY_POWER2},
 
-	{ 0x01, KEY_1},
-	{ 0x02, KEY_2},
-	{ 0x03, KEY_3},
-	{ 0x04, KEY_4},
-	{ 0x05, KEY_5},
-	{ 0x06, KEY_6},
-	{ 0x07, KEY_7},
-	{ 0x08, KEY_8},
-	{ 0x09, KEY_9},
-	{ 0x00, KEY_0},
+	{ 0x01, KEY_NUMERIC_1},
+	{ 0x02, KEY_NUMERIC_2},
+	{ 0x03, KEY_NUMERIC_3},
+	{ 0x04, KEY_NUMERIC_4},
+	{ 0x05, KEY_NUMERIC_5},
+	{ 0x06, KEY_NUMERIC_6},
+	{ 0x07, KEY_NUMERIC_7},
+	{ 0x08, KEY_NUMERIC_8},
+	{ 0x09, KEY_NUMERIC_9},
+	{ 0x00, KEY_NUMERIC_0},
 
 	{ 0x0c, KEY_VOLUMEUP},
 	{ 0x18, KEY_VOLUMEDOWN},
diff --git a/drivers/media/rc/keymaps/rc-reddo.c b/drivers/media/rc/keymaps/rc-reddo.c
index a68003381540..b70390d19e78 100644
--- a/drivers/media/rc/keymaps/rc-reddo.c
+++ b/drivers/media/rc/keymaps/rc-reddo.c
@@ -23,21 +23,21 @@
 
 static struct rc_map_table reddo[] = {
 	{ 0x61d601, KEY_EPG },             /* EPG */
-	{ 0x61d602, KEY_3 },
-	{ 0x61d604, KEY_1 },
-	{ 0x61d605, KEY_5 },
-	{ 0x61d606, KEY_6 },
+	{ 0x61d602, KEY_NUMERIC_3 },
+	{ 0x61d604, KEY_NUMERIC_1 },
+	{ 0x61d605, KEY_NUMERIC_5 },
+	{ 0x61d606, KEY_NUMERIC_6 },
 	{ 0x61d607, KEY_CHANNELDOWN },     /* CH- */
-	{ 0x61d608, KEY_2 },
+	{ 0x61d608, KEY_NUMERIC_2 },
 	{ 0x61d609, KEY_CHANNELUP },       /* CH+ */
-	{ 0x61d60a, KEY_9 },
+	{ 0x61d60a, KEY_NUMERIC_9 },
 	{ 0x61d60b, KEY_ZOOM },            /* Zoom */
-	{ 0x61d60c, KEY_7 },
-	{ 0x61d60d, KEY_8 },
+	{ 0x61d60c, KEY_NUMERIC_7 },
+	{ 0x61d60d, KEY_NUMERIC_8 },
 	{ 0x61d60e, KEY_VOLUMEUP },        /* Vol+ */
-	{ 0x61d60f, KEY_4 },
+	{ 0x61d60f, KEY_NUMERIC_4 },
 	{ 0x61d610, KEY_ESC },             /* [back up arrow] */
-	{ 0x61d611, KEY_0 },
+	{ 0x61d611, KEY_NUMERIC_0 },
 	{ 0x61d612, KEY_OK },              /* [enter arrow] */
 	{ 0x61d613, KEY_VOLUMEDOWN },      /* Vol- */
 	{ 0x61d614, KEY_RECORD },          /* Rec */
diff --git a/drivers/media/rc/keymaps/rc-snapstream-firefly.c b/drivers/media/rc/keymaps/rc-snapstream-firefly.c
index 8d55b4ccee83..e3d5bff3bd9e 100644
--- a/drivers/media/rc/keymaps/rc-snapstream-firefly.c
+++ b/drivers/media/rc/keymaps/rc-snapstream-firefly.c
@@ -12,16 +12,16 @@ static struct rc_map_table snapstream_firefly[] = {
 	{ 0x2c, KEY_ZOOM },       /* Maximize */
 	{ 0x02, KEY_CLOSE },
 
-	{ 0x0d, KEY_1 },
-	{ 0x0e, KEY_2 },
-	{ 0x0f, KEY_3 },
-	{ 0x10, KEY_4 },
-	{ 0x11, KEY_5 },
-	{ 0x12, KEY_6 },
-	{ 0x13, KEY_7 },
-	{ 0x14, KEY_8 },
-	{ 0x15, KEY_9 },
-	{ 0x17, KEY_0 },
+	{ 0x0d, KEY_NUMERIC_1 },
+	{ 0x0e, KEY_NUMERIC_2 },
+	{ 0x0f, KEY_NUMERIC_3 },
+	{ 0x10, KEY_NUMERIC_4 },
+	{ 0x11, KEY_NUMERIC_5 },
+	{ 0x12, KEY_NUMERIC_6 },
+	{ 0x13, KEY_NUMERIC_7 },
+	{ 0x14, KEY_NUMERIC_8 },
+	{ 0x15, KEY_NUMERIC_9 },
+	{ 0x17, KEY_NUMERIC_0 },
 	{ 0x16, KEY_BACK },
 	{ 0x18, KEY_KPENTER },    /* ent */
 
diff --git a/drivers/media/rc/keymaps/rc-su3000.c b/drivers/media/rc/keymaps/rc-su3000.c
index 1c82737e3999..64cfc01aa48f 100644
--- a/drivers/media/rc/keymaps/rc-su3000.c
+++ b/drivers/media/rc/keymaps/rc-su3000.c
@@ -10,16 +10,16 @@
 static struct rc_map_table su3000[] = {
 	{ 0x25, KEY_POWER },	/* right-bottom Red */
 	{ 0x0a, KEY_MUTE },	/* -/-- */
-	{ 0x01, KEY_1 },
-	{ 0x02, KEY_2 },
-	{ 0x03, KEY_3 },
-	{ 0x04, KEY_4 },
-	{ 0x05, KEY_5 },
-	{ 0x06, KEY_6 },
-	{ 0x07, KEY_7 },
-	{ 0x08, KEY_8 },
-	{ 0x09, KEY_9 },
-	{ 0x00, KEY_0 },
+	{ 0x01, KEY_NUMERIC_1 },
+	{ 0x02, KEY_NUMERIC_2 },
+	{ 0x03, KEY_NUMERIC_3 },
+	{ 0x04, KEY_NUMERIC_4 },
+	{ 0x05, KEY_NUMERIC_5 },
+	{ 0x06, KEY_NUMERIC_6 },
+	{ 0x07, KEY_NUMERIC_7 },
+	{ 0x08, KEY_NUMERIC_8 },
+	{ 0x09, KEY_NUMERIC_9 },
+	{ 0x00, KEY_NUMERIC_0 },
 	{ 0x20, KEY_UP },	/* CH+ */
 	{ 0x21, KEY_DOWN },	/* CH+ */
 	{ 0x12, KEY_VOLUMEUP },	/* Brightness Up */
diff --git a/drivers/media/rc/keymaps/rc-tango.c b/drivers/media/rc/keymaps/rc-tango.c
index 6f0fec6d3944..2b9cef6ef5b5 100644
--- a/drivers/media/rc/keymaps/rc-tango.c
+++ b/drivers/media/rc/keymaps/rc-tango.c
@@ -17,16 +17,16 @@ static struct rc_map_table tango_table[] = {
 	{ 0x4cb51, KEY_MUTE },
 	{ 0x4cb52, KEY_VOLUMEDOWN },
 
-	{ 0x4cb41, KEY_1 },
-	{ 0x4cb03, KEY_2 },
-	{ 0x4cb42, KEY_3 },
-	{ 0x4cb45, KEY_4 },
-	{ 0x4cb07, KEY_5 },
-	{ 0x4cb46, KEY_6 },
-	{ 0x4cb55, KEY_7 },
-	{ 0x4cb17, KEY_8 },
-	{ 0x4cb56, KEY_9 },
-	{ 0x4cb1b, KEY_0 },
+	{ 0x4cb41, KEY_NUMERIC_1 },
+	{ 0x4cb03, KEY_NUMERIC_2 },
+	{ 0x4cb42, KEY_NUMERIC_3 },
+	{ 0x4cb45, KEY_NUMERIC_4 },
+	{ 0x4cb07, KEY_NUMERIC_5 },
+	{ 0x4cb46, KEY_NUMERIC_6 },
+	{ 0x4cb55, KEY_NUMERIC_7 },
+	{ 0x4cb17, KEY_NUMERIC_8 },
+	{ 0x4cb56, KEY_NUMERIC_9 },
+	{ 0x4cb1b, KEY_NUMERIC_0 },
 	{ 0x4cb59, KEY_DELETE },
 	{ 0x4cb5a, KEY_CAPSLOCK },
 
diff --git a/drivers/media/rc/keymaps/rc-tbs-nec.c b/drivers/media/rc/keymaps/rc-tbs-nec.c
index 42766cb877c3..420980925f29 100644
--- a/drivers/media/rc/keymaps/rc-tbs-nec.c
+++ b/drivers/media/rc/keymaps/rc-tbs-nec.c
@@ -11,16 +11,16 @@
 static struct rc_map_table tbs_nec[] = {
 	{ 0x84, KEY_POWER2},		/* power */
 	{ 0x94, KEY_MUTE},		/* mute */
-	{ 0x87, KEY_1},
-	{ 0x86, KEY_2},
-	{ 0x85, KEY_3},
-	{ 0x8b, KEY_4},
-	{ 0x8a, KEY_5},
-	{ 0x89, KEY_6},
-	{ 0x8f, KEY_7},
-	{ 0x8e, KEY_8},
-	{ 0x8d, KEY_9},
-	{ 0x92, KEY_0},
+	{ 0x87, KEY_NUMERIC_1},
+	{ 0x86, KEY_NUMERIC_2},
+	{ 0x85, KEY_NUMERIC_3},
+	{ 0x8b, KEY_NUMERIC_4},
+	{ 0x8a, KEY_NUMERIC_5},
+	{ 0x89, KEY_NUMERIC_6},
+	{ 0x8f, KEY_NUMERIC_7},
+	{ 0x8e, KEY_NUMERIC_8},
+	{ 0x8d, KEY_NUMERIC_9},
+	{ 0x92, KEY_NUMERIC_0},
 	{ 0xc0, KEY_10CHANNELSUP},	/* 10+ */
 	{ 0xd0, KEY_10CHANNELSDOWN},	/* 10- */
 	{ 0x96, KEY_CHANNELUP},		/* ch+ */
diff --git a/drivers/media/rc/keymaps/rc-technisat-ts35.c b/drivers/media/rc/keymaps/rc-technisat-ts35.c
index 34bd04a75277..9a917ea0ceba 100644
--- a/drivers/media/rc/keymaps/rc-technisat-ts35.c
+++ b/drivers/media/rc/keymaps/rc-technisat-ts35.c
@@ -13,16 +13,16 @@ static struct rc_map_table technisat_ts35[] = {
 	{0x1c, KEY_AB},
 	{0x33, KEY_POWER},
 
-	{0x3e, KEY_1},
-	{0x3d, KEY_2},
-	{0x3c, KEY_3},
-	{0x3b, KEY_4},
-	{0x3a, KEY_5},
-	{0x39, KEY_6},
-	{0x38, KEY_7},
-	{0x37, KEY_8},
-	{0x36, KEY_9},
-	{0x3f, KEY_0},
+	{0x3e, KEY_NUMERIC_1},
+	{0x3d, KEY_NUMERIC_2},
+	{0x3c, KEY_NUMERIC_3},
+	{0x3b, KEY_NUMERIC_4},
+	{0x3a, KEY_NUMERIC_5},
+	{0x39, KEY_NUMERIC_6},
+	{0x38, KEY_NUMERIC_7},
+	{0x37, KEY_NUMERIC_8},
+	{0x36, KEY_NUMERIC_9},
+	{0x3f, KEY_NUMERIC_0},
 	{0x35, KEY_DIGITS},
 	{0x2c, KEY_TV},
 
diff --git a/drivers/media/rc/keymaps/rc-technisat-usb2.c b/drivers/media/rc/keymaps/rc-technisat-usb2.c
index 58b3baf5ee96..942100686c82 100644
--- a/drivers/media/rc/keymaps/rc-technisat-usb2.c
+++ b/drivers/media/rc/keymaps/rc-technisat-usb2.c
@@ -30,18 +30,18 @@
 
 static struct rc_map_table technisat_usb2[] = {
 	{0x0a0c, KEY_POWER},
-	{0x0a01, KEY_1},
-	{0x0a02, KEY_2},
-	{0x0a03, KEY_3},
+	{0x0a01, KEY_NUMERIC_1},
+	{0x0a02, KEY_NUMERIC_2},
+	{0x0a03, KEY_NUMERIC_3},
 	{0x0a0d, KEY_MUTE},
-	{0x0a04, KEY_4},
-	{0x0a05, KEY_5},
-	{0x0a06, KEY_6},
+	{0x0a04, KEY_NUMERIC_4},
+	{0x0a05, KEY_NUMERIC_5},
+	{0x0a06, KEY_NUMERIC_6},
 	{0x0a38, KEY_VIDEO}, /* EXT */
-	{0x0a07, KEY_7},
-	{0x0a08, KEY_8},
-	{0x0a09, KEY_9},
-	{0x0a00, KEY_0},
+	{0x0a07, KEY_NUMERIC_7},
+	{0x0a08, KEY_NUMERIC_8},
+	{0x0a09, KEY_NUMERIC_9},
+	{0x0a00, KEY_NUMERIC_0},
 	{0x0a4f, KEY_INFO},
 	{0x0a20, KEY_CHANNELUP},
 	{0x0a52, KEY_MENU},
diff --git a/drivers/media/rc/keymaps/rc-terratec-cinergy-c-pci.c b/drivers/media/rc/keymaps/rc-terratec-cinergy-c-pci.c
index 4b2741b158c4..da06f844d8fb 100644
--- a/drivers/media/rc/keymaps/rc-terratec-cinergy-c-pci.c
+++ b/drivers/media/rc/keymaps/rc-terratec-cinergy-c-pci.c
@@ -9,17 +9,17 @@
 
 static struct rc_map_table terratec_cinergy_c_pci[] = {
 	{ 0x3e, KEY_POWER},
-	{ 0x3d, KEY_1},
-	{ 0x3c, KEY_2},
-	{ 0x3b, KEY_3},
-	{ 0x3a, KEY_4},
-	{ 0x39, KEY_5},
-	{ 0x38, KEY_6},
-	{ 0x37, KEY_7},
-	{ 0x36, KEY_8},
-	{ 0x35, KEY_9},
+	{ 0x3d, KEY_NUMERIC_1},
+	{ 0x3c, KEY_NUMERIC_2},
+	{ 0x3b, KEY_NUMERIC_3},
+	{ 0x3a, KEY_NUMERIC_4},
+	{ 0x39, KEY_NUMERIC_5},
+	{ 0x38, KEY_NUMERIC_6},
+	{ 0x37, KEY_NUMERIC_7},
+	{ 0x36, KEY_NUMERIC_8},
+	{ 0x35, KEY_NUMERIC_9},
 	{ 0x34, KEY_VIDEO_NEXT}, /* AV */
-	{ 0x33, KEY_0},
+	{ 0x33, KEY_NUMERIC_0},
 	{ 0x32, KEY_REFRESH},
 	{ 0x30, KEY_EPG},
 	{ 0x2f, KEY_UP},
diff --git a/drivers/media/rc/keymaps/rc-terratec-cinergy-s2-hd.c b/drivers/media/rc/keymaps/rc-terratec-cinergy-s2-hd.c
index 631f86665206..a1844b531572 100644
--- a/drivers/media/rc/keymaps/rc-terratec-cinergy-s2-hd.c
+++ b/drivers/media/rc/keymaps/rc-terratec-cinergy-s2-hd.c
@@ -42,17 +42,17 @@ static struct rc_map_table terratec_cinergy_s2_hd[] = {
 	{ 0x2f, KEY_UP},
 	{ 0x30, KEY_EPG},
 	{ 0x32, KEY_VIDEO},              /* A<=>B */
-	{ 0x33, KEY_0},
+	{ 0x33, KEY_NUMERIC_0},
 	{ 0x34, KEY_VCR},                /* AV */
-	{ 0x35, KEY_9},
-	{ 0x36, KEY_8},
-	{ 0x37, KEY_7},
-	{ 0x38, KEY_6},
-	{ 0x39, KEY_5},
-	{ 0x3a, KEY_4},
-	{ 0x3b, KEY_3},
-	{ 0x3c, KEY_2},
-	{ 0x3d, KEY_1},
+	{ 0x35, KEY_NUMERIC_9},
+	{ 0x36, KEY_NUMERIC_8},
+	{ 0x37, KEY_NUMERIC_7},
+	{ 0x38, KEY_NUMERIC_6},
+	{ 0x39, KEY_NUMERIC_5},
+	{ 0x3a, KEY_NUMERIC_4},
+	{ 0x3b, KEY_NUMERIC_3},
+	{ 0x3c, KEY_NUMERIC_2},
+	{ 0x3d, KEY_NUMERIC_1},
 	{ 0x3e, KEY_POWER},
 
 };
diff --git a/drivers/media/rc/keymaps/rc-terratec-cinergy-xs.c b/drivers/media/rc/keymaps/rc-terratec-cinergy-xs.c
index 6cf53a56bce4..fe587e3f0240 100644
--- a/drivers/media/rc/keymaps/rc-terratec-cinergy-xs.c
+++ b/drivers/media/rc/keymaps/rc-terratec-cinergy-xs.c
@@ -16,20 +16,20 @@ static struct rc_map_table terratec_cinergy_xs[] = {
 	{ 0x41, KEY_HOME},
 	{ 0x01, KEY_POWER},
 	{ 0x42, KEY_MENU},
-	{ 0x02, KEY_1},
-	{ 0x03, KEY_2},
-	{ 0x04, KEY_3},
+	{ 0x02, KEY_NUMERIC_1},
+	{ 0x03, KEY_NUMERIC_2},
+	{ 0x04, KEY_NUMERIC_3},
 	{ 0x43, KEY_SUBTITLE},
-	{ 0x05, KEY_4},
-	{ 0x06, KEY_5},
-	{ 0x07, KEY_6},
+	{ 0x05, KEY_NUMERIC_4},
+	{ 0x06, KEY_NUMERIC_5},
+	{ 0x07, KEY_NUMERIC_6},
 	{ 0x44, KEY_TEXT},
-	{ 0x08, KEY_7},
-	{ 0x09, KEY_8},
-	{ 0x0a, KEY_9},
+	{ 0x08, KEY_NUMERIC_7},
+	{ 0x09, KEY_NUMERIC_8},
+	{ 0x0a, KEY_NUMERIC_9},
 	{ 0x45, KEY_DELETE},
 	{ 0x0b, KEY_TUNER},
-	{ 0x0c, KEY_0},
+	{ 0x0c, KEY_NUMERIC_0},
 	{ 0x0d, KEY_MODE},
 	{ 0x46, KEY_TV},
 	{ 0x47, KEY_DVD},
diff --git a/drivers/media/rc/keymaps/rc-terratec-slim-2.c b/drivers/media/rc/keymaps/rc-terratec-slim-2.c
index bd1c1761b550..a54a59f90313 100644
--- a/drivers/media/rc/keymaps/rc-terratec-slim-2.c
+++ b/drivers/media/rc/keymaps/rc-terratec-slim-2.c
@@ -17,21 +17,21 @@ static struct rc_map_table terratec_slim_2[] = {
 	{ 0x8001, KEY_MUTE },            /* MUTE */
 	{ 0x8002, KEY_VOLUMEDOWN },
 	{ 0x8003, KEY_CHANNELDOWN },
-	{ 0x8004, KEY_1 },
-	{ 0x8005, KEY_2 },
-	{ 0x8006, KEY_3 },
-	{ 0x8007, KEY_4 },
-	{ 0x8008, KEY_5 },
-	{ 0x8009, KEY_6 },
-	{ 0x800a, KEY_7 },
+	{ 0x8004, KEY_NUMERIC_1 },
+	{ 0x8005, KEY_NUMERIC_2 },
+	{ 0x8006, KEY_NUMERIC_3 },
+	{ 0x8007, KEY_NUMERIC_4 },
+	{ 0x8008, KEY_NUMERIC_5 },
+	{ 0x8009, KEY_NUMERIC_6 },
+	{ 0x800a, KEY_NUMERIC_7 },
 	{ 0x800c, KEY_ZOOM },            /* [fullscreen] */
-	{ 0x800d, KEY_0 },
+	{ 0x800d, KEY_NUMERIC_0 },
 	{ 0x800e, KEY_AGAIN },           /* [two arrows forming a circle] */
 	{ 0x8012, KEY_POWER2 },          /* [red power button] */
 	{ 0x801a, KEY_VOLUMEUP },
-	{ 0x801b, KEY_8 },
+	{ 0x801b, KEY_NUMERIC_8 },
 	{ 0x801e, KEY_CHANNELUP },
-	{ 0x801f, KEY_9 },
+	{ 0x801f, KEY_NUMERIC_9 },
 };
 
 static struct rc_map_list terratec_slim_2_map = {
diff --git a/drivers/media/rc/keymaps/rc-terratec-slim.c b/drivers/media/rc/keymaps/rc-terratec-slim.c
index b44942691388..146e3a3480dc 100644
--- a/drivers/media/rc/keymaps/rc-terratec-slim.c
+++ b/drivers/media/rc/keymaps/rc-terratec-slim.c
@@ -11,16 +11,16 @@
 /* TerraTec slim remote, 7 rows, 4 columns. */
 /* Uses NEC extended 0x02bd. */
 static struct rc_map_table terratec_slim[] = {
-	{ 0x02bd00, KEY_1 },
-	{ 0x02bd01, KEY_2 },
-	{ 0x02bd02, KEY_3 },
-	{ 0x02bd03, KEY_4 },
-	{ 0x02bd04, KEY_5 },
-	{ 0x02bd05, KEY_6 },
-	{ 0x02bd06, KEY_7 },
-	{ 0x02bd07, KEY_8 },
-	{ 0x02bd08, KEY_9 },
-	{ 0x02bd09, KEY_0 },
+	{ 0x02bd00, KEY_NUMERIC_1 },
+	{ 0x02bd01, KEY_NUMERIC_2 },
+	{ 0x02bd02, KEY_NUMERIC_3 },
+	{ 0x02bd03, KEY_NUMERIC_4 },
+	{ 0x02bd04, KEY_NUMERIC_5 },
+	{ 0x02bd05, KEY_NUMERIC_6 },
+	{ 0x02bd06, KEY_NUMERIC_7 },
+	{ 0x02bd07, KEY_NUMERIC_8 },
+	{ 0x02bd08, KEY_NUMERIC_9 },
+	{ 0x02bd09, KEY_NUMERIC_0 },
 	{ 0x02bd0a, KEY_MUTE },
 	{ 0x02bd0b, KEY_NEW },             /* symbol: PIP */
 	{ 0x02bd0e, KEY_VOLUMEDOWN },
diff --git a/drivers/media/rc/keymaps/rc-tevii-nec.c b/drivers/media/rc/keymaps/rc-tevii-nec.c
index 58fcc72f528e..5b96e9a38e9d 100644
--- a/drivers/media/rc/keymaps/rc-tevii-nec.c
+++ b/drivers/media/rc/keymaps/rc-tevii-nec.c
@@ -11,16 +11,16 @@
 static struct rc_map_table tevii_nec[] = {
 	{ 0x0a, KEY_POWER2},
 	{ 0x0c, KEY_MUTE},
-	{ 0x11, KEY_1},
-	{ 0x12, KEY_2},
-	{ 0x13, KEY_3},
-	{ 0x14, KEY_4},
-	{ 0x15, KEY_5},
-	{ 0x16, KEY_6},
-	{ 0x17, KEY_7},
-	{ 0x18, KEY_8},
-	{ 0x19, KEY_9},
-	{ 0x10, KEY_0},
+	{ 0x11, KEY_NUMERIC_1},
+	{ 0x12, KEY_NUMERIC_2},
+	{ 0x13, KEY_NUMERIC_3},
+	{ 0x14, KEY_NUMERIC_4},
+	{ 0x15, KEY_NUMERIC_5},
+	{ 0x16, KEY_NUMERIC_6},
+	{ 0x17, KEY_NUMERIC_7},
+	{ 0x18, KEY_NUMERIC_8},
+	{ 0x19, KEY_NUMERIC_9},
+	{ 0x10, KEY_NUMERIC_0},
 	{ 0x1c, KEY_MENU},
 	{ 0x0f, KEY_VOLUMEDOWN},
 	{ 0x1a, KEY_LAST},
diff --git a/drivers/media/rc/keymaps/rc-total-media-in-hand-02.c b/drivers/media/rc/keymaps/rc-total-media-in-hand-02.c
index 7dfaf05f4934..40b773ba45b9 100644
--- a/drivers/media/rc/keymaps/rc-total-media-in-hand-02.c
+++ b/drivers/media/rc/keymaps/rc-total-media-in-hand-02.c
@@ -10,16 +10,16 @@
 
 
 static struct rc_map_table total_media_in_hand_02[] = {
-	{ 0x0000, KEY_0 },
-	{ 0x0001, KEY_1 },
-	{ 0x0002, KEY_2 },
-	{ 0x0003, KEY_3 },
-	{ 0x0004, KEY_4 },
-	{ 0x0005, KEY_5 },
-	{ 0x0006, KEY_6 },
-	{ 0x0007, KEY_7 },
-	{ 0x0008, KEY_8 },
-	{ 0x0009, KEY_9 },
+	{ 0x0000, KEY_NUMERIC_0 },
+	{ 0x0001, KEY_NUMERIC_1 },
+	{ 0x0002, KEY_NUMERIC_2 },
+	{ 0x0003, KEY_NUMERIC_3 },
+	{ 0x0004, KEY_NUMERIC_4 },
+	{ 0x0005, KEY_NUMERIC_5 },
+	{ 0x0006, KEY_NUMERIC_6 },
+	{ 0x0007, KEY_NUMERIC_7 },
+	{ 0x0008, KEY_NUMERIC_8 },
+	{ 0x0009, KEY_NUMERIC_9 },
 	{ 0x000a, KEY_MUTE },
 	{ 0x000b, KEY_STOP },                   /* Stop */
 	{ 0x000c, KEY_POWER2 },                 /* Turn on/off application */
diff --git a/drivers/media/rc/keymaps/rc-total-media-in-hand.c b/drivers/media/rc/keymaps/rc-total-media-in-hand.c
index a12569425b8b..2144db485d83 100644
--- a/drivers/media/rc/keymaps/rc-total-media-in-hand.c
+++ b/drivers/media/rc/keymaps/rc-total-media-in-hand.c
@@ -10,16 +10,16 @@
 
 /* Uses NEC extended 0x02bd */
 static struct rc_map_table total_media_in_hand[] = {
-	{ 0x02bd00, KEY_1 },
-	{ 0x02bd01, KEY_2 },
-	{ 0x02bd02, KEY_3 },
-	{ 0x02bd03, KEY_4 },
-	{ 0x02bd04, KEY_5 },
-	{ 0x02bd05, KEY_6 },
-	{ 0x02bd06, KEY_7 },
-	{ 0x02bd07, KEY_8 },
-	{ 0x02bd08, KEY_9 },
-	{ 0x02bd09, KEY_0 },
+	{ 0x02bd00, KEY_NUMERIC_1 },
+	{ 0x02bd01, KEY_NUMERIC_2 },
+	{ 0x02bd02, KEY_NUMERIC_3 },
+	{ 0x02bd03, KEY_NUMERIC_4 },
+	{ 0x02bd04, KEY_NUMERIC_5 },
+	{ 0x02bd05, KEY_NUMERIC_6 },
+	{ 0x02bd06, KEY_NUMERIC_7 },
+	{ 0x02bd07, KEY_NUMERIC_8 },
+	{ 0x02bd08, KEY_NUMERIC_9 },
+	{ 0x02bd09, KEY_NUMERIC_0 },
 	{ 0x02bd0a, KEY_MUTE },
 	{ 0x02bd0b, KEY_CYCLEWINDOWS },    /* yellow, [min / max] */
 	{ 0x02bd0c, KEY_VIDEO },           /* TV / AV */
diff --git a/drivers/media/rc/keymaps/rc-trekstor.c b/drivers/media/rc/keymaps/rc-trekstor.c
index 8576831b20bd..e938e0da51a6 100644
--- a/drivers/media/rc/keymaps/rc-trekstor.c
+++ b/drivers/media/rc/keymaps/rc-trekstor.c
@@ -12,7 +12,7 @@
 /* Imported from af9015.h.
    Initial keytable was from Marc Schneider <macke@macke.org> */
 static struct rc_map_table trekstor[] = {
-	{ 0x0084, KEY_0 },
+	{ 0x0084, KEY_NUMERIC_0 },
 	{ 0x0085, KEY_MUTE },            /* Mute */
 	{ 0x0086, KEY_HOMEPAGE },        /* Home */
 	{ 0x0087, KEY_UP },              /* Up */
@@ -24,17 +24,17 @@ static struct rc_map_table trekstor[] = {
 	{ 0x008d, KEY_PLAY },            /* Play/Pause */
 	{ 0x008e, KEY_STOP },            /* Stop */
 	{ 0x008f, KEY_EPG },             /* Info/EPG */
-	{ 0x0090, KEY_7 },
-	{ 0x0091, KEY_4 },
-	{ 0x0092, KEY_1 },
+	{ 0x0090, KEY_NUMERIC_7 },
+	{ 0x0091, KEY_NUMERIC_4 },
+	{ 0x0092, KEY_NUMERIC_1 },
 	{ 0x0093, KEY_CHANNELDOWN },     /* Channel - */
-	{ 0x0094, KEY_8 },
-	{ 0x0095, KEY_5 },
-	{ 0x0096, KEY_2 },
+	{ 0x0094, KEY_NUMERIC_8 },
+	{ 0x0095, KEY_NUMERIC_5 },
+	{ 0x0096, KEY_NUMERIC_2 },
 	{ 0x0097, KEY_CHANNELUP },       /* Channel + */
-	{ 0x0098, KEY_9 },
-	{ 0x0099, KEY_6 },
-	{ 0x009a, KEY_3 },
+	{ 0x0098, KEY_NUMERIC_9 },
+	{ 0x0099, KEY_NUMERIC_6 },
+	{ 0x009a, KEY_NUMERIC_3 },
 	{ 0x009b, KEY_VOLUMEDOWN },      /* Volume - */
 	{ 0x009c, KEY_TV },              /* TV */
 	{ 0x009d, KEY_RECORD },          /* Record */
diff --git a/drivers/media/rc/keymaps/rc-tt-1500.c b/drivers/media/rc/keymaps/rc-tt-1500.c
index 52f239d2c025..ff70aab13b48 100644
--- a/drivers/media/rc/keymaps/rc-tt-1500.c
+++ b/drivers/media/rc/keymaps/rc-tt-1500.c
@@ -13,16 +13,16 @@
 static struct rc_map_table tt_1500[] = {
 	{ 0x1501, KEY_POWER },
 	{ 0x1502, KEY_SHUFFLE },		/* ? double-arrow key */
-	{ 0x1503, KEY_1 },
-	{ 0x1504, KEY_2 },
-	{ 0x1505, KEY_3 },
-	{ 0x1506, KEY_4 },
-	{ 0x1507, KEY_5 },
-	{ 0x1508, KEY_6 },
-	{ 0x1509, KEY_7 },
-	{ 0x150a, KEY_8 },
-	{ 0x150b, KEY_9 },
-	{ 0x150c, KEY_0 },
+	{ 0x1503, KEY_NUMERIC_1 },
+	{ 0x1504, KEY_NUMERIC_2 },
+	{ 0x1505, KEY_NUMERIC_3 },
+	{ 0x1506, KEY_NUMERIC_4 },
+	{ 0x1507, KEY_NUMERIC_5 },
+	{ 0x1508, KEY_NUMERIC_6 },
+	{ 0x1509, KEY_NUMERIC_7 },
+	{ 0x150a, KEY_NUMERIC_8 },
+	{ 0x150b, KEY_NUMERIC_9 },
+	{ 0x150c, KEY_NUMERIC_0 },
 	{ 0x150d, KEY_UP },
 	{ 0x150e, KEY_LEFT },
 	{ 0x150f, KEY_OK },
diff --git a/drivers/media/rc/keymaps/rc-twinhan-dtv-cab-ci.c b/drivers/media/rc/keymaps/rc-twinhan-dtv-cab-ci.c
index a72cb06a811e..5fc696d9e583 100644
--- a/drivers/media/rc/keymaps/rc-twinhan-dtv-cab-ci.c
+++ b/drivers/media/rc/keymaps/rc-twinhan-dtv-cab-ci.c
@@ -15,16 +15,16 @@ static struct rc_map_table twinhan_dtv_cab_ci[] = {
 	{ 0x23, KEY_EPG},
 	{ 0x3b, KEY_F22},               /* Record List */
 
-	{ 0x3c, KEY_1},
-	{ 0x3e, KEY_2},
-	{ 0x39, KEY_3},
-	{ 0x36, KEY_4},
-	{ 0x22, KEY_5},
-	{ 0x20, KEY_6},
-	{ 0x32, KEY_7},
-	{ 0x26, KEY_8},
-	{ 0x24, KEY_9},
-	{ 0x2a, KEY_0},
+	{ 0x3c, KEY_NUMERIC_1},
+	{ 0x3e, KEY_NUMERIC_2},
+	{ 0x39, KEY_NUMERIC_3},
+	{ 0x36, KEY_NUMERIC_4},
+	{ 0x22, KEY_NUMERIC_5},
+	{ 0x20, KEY_NUMERIC_6},
+	{ 0x32, KEY_NUMERIC_7},
+	{ 0x26, KEY_NUMERIC_8},
+	{ 0x24, KEY_NUMERIC_9},
+	{ 0x2a, KEY_NUMERIC_0},
 
 	{ 0x33, KEY_CANCEL},
 	{ 0x2c, KEY_BACK},
diff --git a/drivers/media/rc/keymaps/rc-twinhan1027.c b/drivers/media/rc/keymaps/rc-twinhan1027.c
index 3ee28bcf31dc..e1cdcfa792dc 100644
--- a/drivers/media/rc/keymaps/rc-twinhan1027.c
+++ b/drivers/media/rc/keymaps/rc-twinhan1027.c
@@ -10,16 +10,16 @@ static struct rc_map_table twinhan_vp1027[] = {
 	{ 0x1c, KEY_EPG },
 	{ 0x04, KEY_LIST },
 
-	{ 0x03, KEY_1 },
-	{ 0x01, KEY_2 },
-	{ 0x06, KEY_3 },
-	{ 0x09, KEY_4 },
-	{ 0x1d, KEY_5 },
-	{ 0x1f, KEY_6 },
-	{ 0x0d, KEY_7 },
-	{ 0x19, KEY_8 },
-	{ 0x1b, KEY_9 },
-	{ 0x15, KEY_0 },
+	{ 0x03, KEY_NUMERIC_1 },
+	{ 0x01, KEY_NUMERIC_2 },
+	{ 0x06, KEY_NUMERIC_3 },
+	{ 0x09, KEY_NUMERIC_4 },
+	{ 0x1d, KEY_NUMERIC_5 },
+	{ 0x1f, KEY_NUMERIC_6 },
+	{ 0x0d, KEY_NUMERIC_7 },
+	{ 0x19, KEY_NUMERIC_8 },
+	{ 0x1b, KEY_NUMERIC_9 },
+	{ 0x15, KEY_NUMERIC_0 },
 
 	{ 0x0c, KEY_CANCEL },
 	{ 0x4a, KEY_CLEAR },
diff --git a/drivers/media/rc/keymaps/rc-videomate-m1f.c b/drivers/media/rc/keymaps/rc-videomate-m1f.c
index d2d183759a03..e16b9b851c72 100644
--- a/drivers/media/rc/keymaps/rc-videomate-m1f.c
+++ b/drivers/media/rc/keymaps/rc-videomate-m1f.c
@@ -41,17 +41,17 @@ static struct rc_map_table videomate_k100[] = {
 	{ 0x10, KEY_PREVIOUS },
 	{ 0x0d, KEY_PAUSE },
 	{ 0x0f, KEY_NEXT },
-	{ 0x1e, KEY_1 },
-	{ 0x1f, KEY_2 },
-	{ 0x20, KEY_3 },
-	{ 0x21, KEY_4 },
-	{ 0x22, KEY_5 },
-	{ 0x23, KEY_6 },
-	{ 0x24, KEY_7 },
-	{ 0x25, KEY_8 },
-	{ 0x26, KEY_9 },
+	{ 0x1e, KEY_NUMERIC_1 },
+	{ 0x1f, KEY_NUMERIC_2 },
+	{ 0x20, KEY_NUMERIC_3 },
+	{ 0x21, KEY_NUMERIC_4 },
+	{ 0x22, KEY_NUMERIC_5 },
+	{ 0x23, KEY_NUMERIC_6 },
+	{ 0x24, KEY_NUMERIC_7 },
+	{ 0x25, KEY_NUMERIC_8 },
+	{ 0x26, KEY_NUMERIC_9 },
 	{ 0x2a, KEY_NUMERIC_STAR }, /* * key */
-	{ 0x1d, KEY_0 },
+	{ 0x1d, KEY_NUMERIC_0 },
 	{ 0x29, KEY_SUBTITLE }, /* # key */
 	{ 0x27, KEY_CLEAR },
 	{ 0x34, KEY_SCREEN },
diff --git a/drivers/media/rc/keymaps/rc-videomate-s350.c b/drivers/media/rc/keymaps/rc-videomate-s350.c
index e4d4dff06a24..a867d7a08055 100644
--- a/drivers/media/rc/keymaps/rc-videomate-s350.c
+++ b/drivers/media/rc/keymaps/rc-videomate-s350.c
@@ -22,16 +22,16 @@ static struct rc_map_table videomate_s350[] = {
 	{ 0x13, KEY_CHANNELDOWN},
 	{ 0x14, KEY_MUTE},
 	{ 0x15, KEY_VOLUMEDOWN},
-	{ 0x16, KEY_1},
-	{ 0x17, KEY_2},
-	{ 0x18, KEY_3},
-	{ 0x19, KEY_4},
-	{ 0x1a, KEY_5},
-	{ 0x1b, KEY_6},
-	{ 0x1c, KEY_7},
-	{ 0x1d, KEY_8},
-	{ 0x1e, KEY_9},
-	{ 0x1f, KEY_0},
+	{ 0x16, KEY_NUMERIC_1},
+	{ 0x17, KEY_NUMERIC_2},
+	{ 0x18, KEY_NUMERIC_3},
+	{ 0x19, KEY_NUMERIC_4},
+	{ 0x1a, KEY_NUMERIC_5},
+	{ 0x1b, KEY_NUMERIC_6},
+	{ 0x1c, KEY_NUMERIC_7},
+	{ 0x1d, KEY_NUMERIC_8},
+	{ 0x1e, KEY_NUMERIC_9},
+	{ 0x1f, KEY_NUMERIC_0},
 	{ 0x21, KEY_SLEEP},
 	{ 0x24, KEY_ZOOM},
 	{ 0x25, KEY_LAST},	/* Recall */
diff --git a/drivers/media/rc/keymaps/rc-videomate-tv-pvr.c b/drivers/media/rc/keymaps/rc-videomate-tv-pvr.c
index 7c4890944407..fdc3b0e1350f 100644
--- a/drivers/media/rc/keymaps/rc-videomate-tv-pvr.c
+++ b/drivers/media/rc/keymaps/rc-videomate-tv-pvr.c
@@ -42,16 +42,16 @@ static struct rc_map_table videomate_tv_pvr[] = {
 
 	{ 0x04, KEY_RECORD },
 
-	{ 0x16, KEY_1 },
-	{ 0x17, KEY_2 },
-	{ 0x18, KEY_3 },
-	{ 0x19, KEY_4 },
-	{ 0x1a, KEY_5 },
-	{ 0x1b, KEY_6 },
-	{ 0x1c, KEY_7 },
-	{ 0x1d, KEY_8 },
-	{ 0x1e, KEY_9 },
-	{ 0x1f, KEY_0 },
+	{ 0x16, KEY_NUMERIC_1 },
+	{ 0x17, KEY_NUMERIC_2 },
+	{ 0x18, KEY_NUMERIC_3 },
+	{ 0x19, KEY_NUMERIC_4 },
+	{ 0x1a, KEY_NUMERIC_5 },
+	{ 0x1b, KEY_NUMERIC_6 },
+	{ 0x1c, KEY_NUMERIC_7 },
+	{ 0x1d, KEY_NUMERIC_8 },
+	{ 0x1e, KEY_NUMERIC_9 },
+	{ 0x1f, KEY_NUMERIC_0 },
 
 	{ 0x20, KEY_LANGUAGE },
 	{ 0x21, KEY_SLEEP },
diff --git a/drivers/media/rc/keymaps/rc-winfast-usbii-deluxe.c b/drivers/media/rc/keymaps/rc-winfast-usbii-deluxe.c
index e443192dbe14..999ba4e084ae 100644
--- a/drivers/media/rc/keymaps/rc-winfast-usbii-deluxe.c
+++ b/drivers/media/rc/keymaps/rc-winfast-usbii-deluxe.c
@@ -13,16 +13,16 @@
  */
 
 static struct rc_map_table winfast_usbii_deluxe[] = {
-	{ 0x62, KEY_0},
-	{ 0x75, KEY_1},
-	{ 0x76, KEY_2},
-	{ 0x77, KEY_3},
-	{ 0x79, KEY_4},
-	{ 0x7a, KEY_5},
-	{ 0x7b, KEY_6},
-	{ 0x7d, KEY_7},
-	{ 0x7e, KEY_8},
-	{ 0x7f, KEY_9},
+	{ 0x62, KEY_NUMERIC_0},
+	{ 0x75, KEY_NUMERIC_1},
+	{ 0x76, KEY_NUMERIC_2},
+	{ 0x77, KEY_NUMERIC_3},
+	{ 0x79, KEY_NUMERIC_4},
+	{ 0x7a, KEY_NUMERIC_5},
+	{ 0x7b, KEY_NUMERIC_6},
+	{ 0x7d, KEY_NUMERIC_7},
+	{ 0x7e, KEY_NUMERIC_8},
+	{ 0x7f, KEY_NUMERIC_9},
 
 	{ 0x38, KEY_CAMERA},		/* SNAPSHOT */
 	{ 0x37, KEY_RECORD},		/* RECORD */
diff --git a/drivers/media/rc/keymaps/rc-winfast.c b/drivers/media/rc/keymaps/rc-winfast.c
index ee7f4c349fd6..be52a3e1f8ae 100644
--- a/drivers/media/rc/keymaps/rc-winfast.c
+++ b/drivers/media/rc/keymaps/rc-winfast.c
@@ -12,16 +12,16 @@
 
 static struct rc_map_table winfast[] = {
 	/* Keys 0 to 9 */
-	{ 0x12, KEY_0 },
-	{ 0x05, KEY_1 },
-	{ 0x06, KEY_2 },
-	{ 0x07, KEY_3 },
-	{ 0x09, KEY_4 },
-	{ 0x0a, KEY_5 },
-	{ 0x0b, KEY_6 },
-	{ 0x0d, KEY_7 },
-	{ 0x0e, KEY_8 },
-	{ 0x0f, KEY_9 },
+	{ 0x12, KEY_NUMERIC_0 },
+	{ 0x05, KEY_NUMERIC_1 },
+	{ 0x06, KEY_NUMERIC_2 },
+	{ 0x07, KEY_NUMERIC_3 },
+	{ 0x09, KEY_NUMERIC_4 },
+	{ 0x0a, KEY_NUMERIC_5 },
+	{ 0x0b, KEY_NUMERIC_6 },
+	{ 0x0d, KEY_NUMERIC_7 },
+	{ 0x0e, KEY_NUMERIC_8 },
+	{ 0x0f, KEY_NUMERIC_9 },
 
 	{ 0x00, KEY_POWER2 },
 	{ 0x1b, KEY_AUDIO },		/* Audio Source */
diff --git a/drivers/media/rc/keymaps/rc-xbox-dvd.c b/drivers/media/rc/keymaps/rc-xbox-dvd.c
index 42815ab57bff..9d656042a81f 100644
--- a/drivers/media/rc/keymaps/rc-xbox-dvd.c
+++ b/drivers/media/rc/keymaps/rc-xbox-dvd.c
@@ -14,16 +14,16 @@ static struct rc_map_table xbox_dvd[] = {
 	{0xaa9, KEY_LEFT},
 	{0xac3, KEY_INFO},
 
-	{0xac6, KEY_9},
-	{0xac7, KEY_8},
-	{0xac8, KEY_7},
-	{0xac9, KEY_6},
-	{0xaca, KEY_5},
-	{0xacb, KEY_4},
-	{0xacc, KEY_3},
-	{0xacd, KEY_2},
-	{0xace, KEY_1},
-	{0xacf, KEY_0},
+	{0xac6, KEY_NUMERIC_9},
+	{0xac7, KEY_NUMERIC_8},
+	{0xac8, KEY_NUMERIC_7},
+	{0xac9, KEY_NUMERIC_6},
+	{0xaca, KEY_NUMERIC_5},
+	{0xacb, KEY_NUMERIC_4},
+	{0xacc, KEY_NUMERIC_3},
+	{0xacd, KEY_NUMERIC_2},
+	{0xace, KEY_NUMERIC_1},
+	{0xacf, KEY_NUMERIC_0},
 
 	{0xad5, KEY_ANGLE},
 	{0xad8, KEY_BACK},
diff --git a/drivers/media/rc/keymaps/rc-zx-irdec.c b/drivers/media/rc/keymaps/rc-zx-irdec.c
index 84ca48966401..7bb0c05eb759 100644
--- a/drivers/media/rc/keymaps/rc-zx-irdec.c
+++ b/drivers/media/rc/keymaps/rc-zx-irdec.c
@@ -8,16 +8,16 @@
 #include <media/rc-map.h>
 
 static struct rc_map_table zx_irdec_table[] = {
-	{ 0x01, KEY_1 },
-	{ 0x02, KEY_2 },
-	{ 0x03, KEY_3 },
-	{ 0x04, KEY_4 },
-	{ 0x05, KEY_5 },
-	{ 0x06, KEY_6 },
-	{ 0x07, KEY_7 },
-	{ 0x08, KEY_8 },
-	{ 0x09, KEY_9 },
-	{ 0x31, KEY_0 },
+	{ 0x01, KEY_NUMERIC_1 },
+	{ 0x02, KEY_NUMERIC_2 },
+	{ 0x03, KEY_NUMERIC_3 },
+	{ 0x04, KEY_NUMERIC_4 },
+	{ 0x05, KEY_NUMERIC_5 },
+	{ 0x06, KEY_NUMERIC_6 },
+	{ 0x07, KEY_NUMERIC_7 },
+	{ 0x08, KEY_NUMERIC_8 },
+	{ 0x09, KEY_NUMERIC_9 },
+	{ 0x31, KEY_NUMERIC_0 },
 	{ 0x16, KEY_DELETE },
 	{ 0x0a, KEY_MODE },		/* Input method */
 	{ 0x0c, KEY_VOLUMEUP },

