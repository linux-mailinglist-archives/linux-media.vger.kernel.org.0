Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAEA45F910
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 15:24:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbfGDNYP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jul 2019 09:24:15 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:33537 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbfGDNYO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jul 2019 09:24:14 -0400
X-Originating-IP: 83.155.44.161
Received: from classic.redhat.com (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 62A8EE0003
        for <linux-media@vger.kernel.org>; Thu,  4 Jul 2019 13:23:57 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-media@vger.kernel.org
Subject: [PATCH v3] keymaps
Date:   Thu,  4 Jul 2019 15:23:56 +0200
Message-Id: <20190704132356.10420-1-hadess@hadess.net>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

---
 .../rc_keymaps/adstech_dvb_t_pci.toml         |  24 ++--
 utils/keytable/rc_keymaps/af9005.toml         |   4 +
 utils/keytable/rc_keymaps/alink_dtu_m.toml    |  24 ++--
 utils/keytable/rc_keymaps/anysee.toml         |  24 ++--
 utils/keytable/rc_keymaps/apac_viewcomp.toml  |  24 ++--
 .../rc_keymaps/astrometa_t2hybrid.toml        |  24 ++--
 utils/keytable/rc_keymaps/asus_pc39.toml      |  24 ++--
 utils/keytable/rc_keymaps/asus_ps3_100.toml   |  24 ++--
 .../rc_keymaps/ati_tv_wonder_hd_600.toml      |   4 +
 utils/keytable/rc_keymaps/ati_x10.toml        |  24 ++--
 utils/keytable/rc_keymaps/avermedia.toml      |  24 ++--
 utils/keytable/rc_keymaps/avermedia_a16d.toml |  24 ++--
 .../rc_keymaps/avermedia_cardbus.toml         |  24 ++--
 utils/keytable/rc_keymaps/avermedia_dvbt.toml |  24 ++--
 .../keytable/rc_keymaps/avermedia_m135a.toml  |  44 ++++----
 .../rc_keymaps/avermedia_m733a_rm_k6.toml     |  24 ++--
 .../keytable/rc_keymaps/avermedia_rm_ks.toml  |  24 ++--
 utils/keytable/rc_keymaps/avertv_303.toml     |  24 ++--
 utils/keytable/rc_keymaps/az6027.toml         |   4 +
 .../rc_keymaps/azurewave_ad_tu700.toml        |  24 ++--
 utils/keytable/rc_keymaps/behold.toml         |  24 ++--
 .../keytable/rc_keymaps/behold_columbus.toml  |  24 ++--
 utils/keytable/rc_keymaps/budget_ci_old.toml  |  24 ++--
 utils/keytable/rc_keymaps/cec.toml            |   4 +
 utils/keytable/rc_keymaps/cinergy.toml        |  24 ++--
 utils/keytable/rc_keymaps/cinergy_1400.toml   |  24 ++--
 utils/keytable/rc_keymaps/cinergyt2.toml      |   4 +
 utils/keytable/rc_keymaps/d680_dmb.toml       |  24 ++--
 utils/keytable/rc_keymaps/delock_61959.toml   |  24 ++--
 utils/keytable/rc_keymaps/dib0700_nec.toml    |  44 ++++----
 utils/keytable/rc_keymaps/dib0700_rc5.toml    | 104 +++++++++---------
 utils/keytable/rc_keymaps/dibusb.toml         |   4 +
 .../rc_keymaps/digitalnow_tinytwin.toml       |  24 ++--
 utils/keytable/rc_keymaps/digittrade.toml     |  24 ++--
 utils/keytable/rc_keymaps/digitv.toml         |   4 +
 utils/keytable/rc_keymaps/dm1105_nec.toml     |  24 ++--
 .../keytable/rc_keymaps/dntv_live_dvb_t.toml  |  24 ++--
 .../rc_keymaps/dntv_live_dvbt_pro.toml        |  24 ++--
 utils/keytable/rc_keymaps/dtt200u.toml        |  24 ++--
 utils/keytable/rc_keymaps/dvbsky.toml         |  24 ++--
 utils/keytable/rc_keymaps/dvico_mce.toml      |  24 ++--
 utils/keytable/rc_keymaps/dvico_portable.toml |  24 ++--
 utils/keytable/rc_keymaps/em_terratec.toml    |  24 ++--
 utils/keytable/rc_keymaps/encore_enltv.toml   |  24 ++--
 utils/keytable/rc_keymaps/encore_enltv2.toml  |  24 ++--
 .../rc_keymaps/encore_enltv_fm53.toml         |  24 ++--
 utils/keytable/rc_keymaps/evga_indtube.toml   |   4 +
 utils/keytable/rc_keymaps/eztv.toml           |  24 ++--
 utils/keytable/rc_keymaps/flydvb.toml         |  24 ++--
 utils/keytable/rc_keymaps/flyvideo.toml       |  24 ++--
 utils/keytable/rc_keymaps/fusionhdtv_mce.toml |  24 ++--
 utils/keytable/rc_keymaps/gadmei_rm008z.toml  |  24 ++--
 utils/keytable/rc_keymaps/geekbox.toml        |   4 +
 .../rc_keymaps/genius_tvgo_a11mce.toml        |  24 ++--
 utils/keytable/rc_keymaps/gotview7135.toml    |  24 ++--
 utils/keytable/rc_keymaps/haupp.toml          |   4 +
 utils/keytable/rc_keymaps/hauppauge.toml      | 104 +++++++++---------
 utils/keytable/rc_keymaps/hisi_poplar.toml    |  24 ++--
 utils/keytable/rc_keymaps/hisi_tv_demo.toml   |  24 ++--
 utils/keytable/rc_keymaps/imon_mce.toml       |   7 +-
 utils/keytable/rc_keymaps/imon_pad.toml       |   4 +
 utils/keytable/rc_keymaps/imon_rsc.toml       |   6 +-
 utils/keytable/rc_keymaps/iodata_bctv7e.toml  |  24 ++--
 utils/keytable/rc_keymaps/it913x_v1.toml      |  44 ++++----
 utils/keytable/rc_keymaps/it913x_v2.toml      |  44 ++++----
 utils/keytable/rc_keymaps/kaiomy.toml         |  24 ++--
 utils/keytable/rc_keymaps/kworld_315u.toml    |  24 ++--
 utils/keytable/rc_keymaps/kworld_pc150u.toml  |  24 ++--
 .../rc_keymaps/kworld_plus_tv_analog.toml     |  24 ++--
 .../keytable/rc_keymaps/leadtek_y04g0051.toml |  24 ++--
 utils/keytable/rc_keymaps/lme2510.toml        |  64 ++++++-----
 utils/keytable/rc_keymaps/manli.toml          |  24 ++--
 utils/keytable/rc_keymaps/medion_x10.toml     |  24 ++--
 .../rc_keymaps/medion_x10_digitainer.toml     |  24 ++--
 .../keytable/rc_keymaps/medion_x10_or2x.toml  |  24 ++--
 utils/keytable/rc_keymaps/megasky.toml        |   4 +
 utils/keytable/rc_keymaps/msi_digivox_ii.toml |  24 ++--
 .../keytable/rc_keymaps/msi_digivox_iii.toml  |  24 ++--
 utils/keytable/rc_keymaps/msi_tvanywhere.toml |  24 ++--
 .../rc_keymaps/msi_tvanywhere_plus.toml       |  24 ++--
 utils/keytable/rc_keymaps/nebula.toml         |  24 ++--
 .../rc_keymaps/nec_terratec_cinergy_xs.toml   |  44 ++++----
 utils/keytable/rc_keymaps/norwood.toml        |  24 ++--
 utils/keytable/rc_keymaps/npgtech.toml        |  24 ++--
 utils/keytable/rc_keymaps/opera1.toml         |   4 +
 utils/keytable/rc_keymaps/pctv_sedna.toml     |  24 ++--
 utils/keytable/rc_keymaps/pinnacle310e.toml   |   6 +-
 utils/keytable/rc_keymaps/pinnacle_color.toml |  24 ++--
 utils/keytable/rc_keymaps/pinnacle_grey.toml  |  24 ++--
 .../keytable/rc_keymaps/pinnacle_pctv_hd.toml |  24 ++--
 utils/keytable/rc_keymaps/pixelview.toml      |  24 ++--
 utils/keytable/rc_keymaps/pixelview_002t.toml |  24 ++--
 utils/keytable/rc_keymaps/pixelview_mk12.toml |  24 ++--
 utils/keytable/rc_keymaps/pixelview_new.toml  |  24 ++--
 .../rc_keymaps/powercolor_real_angel.toml     |  24 ++--
 utils/keytable/rc_keymaps/proteus_2309.toml   |  24 ++--
 utils/keytable/rc_keymaps/purpletv.toml       |  24 ++--
 utils/keytable/rc_keymaps/pv951.toml          |  24 ++--
 utils/keytable/rc_keymaps/rc6_mce.toml        |   4 +
 .../rc_keymaps/real_audio_220_32_keys.toml    |  24 ++--
 utils/keytable/rc_keymaps/reddo.toml          |  24 ++--
 .../rc_keymaps/snapstream_firefly.toml        |  24 ++--
 utils/keytable/rc_keymaps/streamzap.toml      |   4 +
 utils/keytable/rc_keymaps/su3000.toml         |  24 ++--
 utils/keytable/rc_keymaps/tango.toml          |  24 ++--
 utils/keytable/rc_keymaps/tbs_nec.toml        |  24 ++--
 utils/keytable/rc_keymaps/technisat_ts35.toml |  24 ++--
 utils/keytable/rc_keymaps/technisat_usb2.toml |  24 ++--
 .../rc_keymaps/terratec_cinergy_c_pci.toml    |  24 ++--
 .../rc_keymaps/terratec_cinergy_s2_hd.toml    |  24 ++--
 .../rc_keymaps/terratec_cinergy_xs.toml       |  24 ++--
 utils/keytable/rc_keymaps/terratec_slim.toml  |  24 ++--
 .../keytable/rc_keymaps/terratec_slim_2.toml  |  24 ++--
 utils/keytable/rc_keymaps/tevii_nec.toml      |  24 ++--
 utils/keytable/rc_keymaps/tivo.toml           |   4 +
 .../rc_keymaps/total_media_in_hand.toml       |  24 ++--
 .../rc_keymaps/total_media_in_hand_02.toml    |  24 ++--
 utils/keytable/rc_keymaps/trekstor.toml       |  24 ++--
 utils/keytable/rc_keymaps/tt_1500.toml        |  24 ++--
 utils/keytable/rc_keymaps/tvwalkertwin.toml   |   4 +
 .../rc_keymaps/twinhan_dtv_cab_ci.toml        |  24 ++--
 .../rc_keymaps/twinhan_vp1027_dvbs.toml       |  24 ++--
 utils/keytable/rc_keymaps/videomate_k100.toml |  24 ++--
 utils/keytable/rc_keymaps/videomate_s350.toml |  24 ++--
 .../keytable/rc_keymaps/videomate_tv_pvr.toml |  24 ++--
 utils/keytable/rc_keymaps/vp702x.toml         |   4 +
 utils/keytable/rc_keymaps/winfast.toml        |  24 ++--
 .../rc_keymaps/winfast_usbii_deluxe.toml      |  24 ++--
 utils/keytable/rc_keymaps/xbox_dvd.toml       |  24 ++--
 utils/keytable/rc_keymaps/zx_irdec.toml       |  24 ++--
 130 files changed, 1760 insertions(+), 1247 deletions(-)

diff --git a/utils/keytable/rc_keymaps/adstech_dvb_t_pci.toml b/utils/keytable/rc_keymaps/adstech_dvb_t_pci.toml
index 280f5f86..b2359ad1 100644
--- a/utils/keytable/rc_keymaps/adstech_dvb_t_pci.toml
+++ b/utils/keytable/rc_keymaps/adstech_dvb_t_pci.toml
@@ -1,17 +1,21 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-adstech-dvb-t-pci.c as a source file
 [[protocols]]
 name = "adstech_dvb_t_pci"
 protocol = "unknown"
 [protocols.scancodes]
-0x4d = "KEY_0"
-0x57 = "KEY_1"
-0x4f = "KEY_2"
-0x53 = "KEY_3"
-0x56 = "KEY_4"
-0x4e = "KEY_5"
-0x5e = "KEY_6"
-0x54 = "KEY_7"
-0x4c = "KEY_8"
-0x5c = "KEY_9"
+0x4d = "KEY_NUMERIC_0"
+0x57 = "KEY_NUMERIC_1"
+0x4f = "KEY_NUMERIC_2"
+0x53 = "KEY_NUMERIC_3"
+0x56 = "KEY_NUMERIC_4"
+0x4e = "KEY_NUMERIC_5"
+0x5e = "KEY_NUMERIC_6"
+0x54 = "KEY_NUMERIC_7"
+0x4c = "KEY_NUMERIC_8"
+0x5c = "KEY_NUMERIC_9"
 0x5b = "KEY_POWER"
 0x5f = "KEY_MUTE"
 0x55 = "KEY_GOTO"
diff --git a/utils/keytable/rc_keymaps/af9005.toml b/utils/keytable/rc_keymaps/af9005.toml
index f3152031..9965f370 100644
--- a/utils/keytable/rc_keymaps/af9005.toml
+++ b/utils/keytable/rc_keymaps/af9005.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/usb/dvb-usb/af9005-remote.c as a source file
 [[protocols]]
 name = "af9005"
 protocol = "unknown"
diff --git a/utils/keytable/rc_keymaps/alink_dtu_m.toml b/utils/keytable/rc_keymaps/alink_dtu_m.toml
index fcdb07f4..3751df82 100644
--- a/utils/keytable/rc_keymaps/alink_dtu_m.toml
+++ b/utils/keytable/rc_keymaps/alink_dtu_m.toml
@@ -1,23 +1,27 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-alink-dtu-m.c as a source file
 [[protocols]]
 name = "alink_dtu_m"
 protocol = "nec"
 variant = "nec"
 [protocols.scancodes]
 0x0800 = "KEY_VOLUMEUP"
-0x0801 = "KEY_1"
-0x0802 = "KEY_3"
-0x0803 = "KEY_7"
-0x0804 = "KEY_9"
+0x0801 = "KEY_NUMERIC_1"
+0x0802 = "KEY_NUMERIC_3"
+0x0803 = "KEY_NUMERIC_7"
+0x0804 = "KEY_NUMERIC_9"
 0x0805 = "KEY_NEW"
-0x0806 = "KEY_0"
+0x0806 = "KEY_NUMERIC_0"
 0x0807 = "KEY_CHANNEL"
-0x080d = "KEY_5"
-0x080f = "KEY_2"
+0x080d = "KEY_NUMERIC_5"
+0x080f = "KEY_NUMERIC_2"
 0x0812 = "KEY_POWER2"
 0x0814 = "KEY_CHANNELUP"
 0x0816 = "KEY_VOLUMEDOWN"
-0x0818 = "KEY_6"
+0x0818 = "KEY_NUMERIC_6"
 0x081a = "KEY_MUTE"
-0x081b = "KEY_8"
-0x081c = "KEY_4"
+0x081b = "KEY_NUMERIC_8"
+0x081c = "KEY_NUMERIC_4"
 0x081d = "KEY_CHANNELDOWN"
diff --git a/utils/keytable/rc_keymaps/anysee.toml b/utils/keytable/rc_keymaps/anysee.toml
index 2f7d14fe..1c2bf25a 100644
--- a/utils/keytable/rc_keymaps/anysee.toml
+++ b/utils/keytable/rc_keymaps/anysee.toml
@@ -1,18 +1,22 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-anysee.c as a source file
 [[protocols]]
 name = "anysee"
 protocol = "nec"
 variant = "nec"
 [protocols.scancodes]
-0x0800 = "KEY_0"
-0x0801 = "KEY_1"
-0x0802 = "KEY_2"
-0x0803 = "KEY_3"
-0x0804 = "KEY_4"
-0x0805 = "KEY_5"
-0x0806 = "KEY_6"
-0x0807 = "KEY_7"
-0x0808 = "KEY_8"
-0x0809 = "KEY_9"
+0x0800 = "KEY_NUMERIC_0"
+0x0801 = "KEY_NUMERIC_1"
+0x0802 = "KEY_NUMERIC_2"
+0x0803 = "KEY_NUMERIC_3"
+0x0804 = "KEY_NUMERIC_4"
+0x0805 = "KEY_NUMERIC_5"
+0x0806 = "KEY_NUMERIC_6"
+0x0807 = "KEY_NUMERIC_7"
+0x0808 = "KEY_NUMERIC_8"
+0x0809 = "KEY_NUMERIC_9"
 0x080a = "KEY_POWER2"
 0x080b = "KEY_VIDEO"
 0x080c = "KEY_CHANNEL"
diff --git a/utils/keytable/rc_keymaps/apac_viewcomp.toml b/utils/keytable/rc_keymaps/apac_viewcomp.toml
index 17e5fd4a..52a1e7c7 100644
--- a/utils/keytable/rc_keymaps/apac_viewcomp.toml
+++ b/utils/keytable/rc_keymaps/apac_viewcomp.toml
@@ -1,17 +1,21 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-apac-viewcomp.c as a source file
 [[protocols]]
 name = "apac_viewcomp"
 protocol = "unknown"
 [protocols.scancodes]
-0x01 = "KEY_1"
-0x02 = "KEY_2"
-0x03 = "KEY_3"
-0x04 = "KEY_4"
-0x05 = "KEY_5"
-0x06 = "KEY_6"
-0x07 = "KEY_7"
-0x08 = "KEY_8"
-0x09 = "KEY_9"
-0x00 = "KEY_0"
+0x01 = "KEY_NUMERIC_1"
+0x02 = "KEY_NUMERIC_2"
+0x03 = "KEY_NUMERIC_3"
+0x04 = "KEY_NUMERIC_4"
+0x05 = "KEY_NUMERIC_5"
+0x06 = "KEY_NUMERIC_6"
+0x07 = "KEY_NUMERIC_7"
+0x08 = "KEY_NUMERIC_8"
+0x09 = "KEY_NUMERIC_9"
+0x00 = "KEY_NUMERIC_0"
 0x17 = "KEY_LAST"
 0x0a = "KEY_LIST"
 0x1c = "KEY_TUNER"
diff --git a/utils/keytable/rc_keymaps/astrometa_t2hybrid.toml b/utils/keytable/rc_keymaps/astrometa_t2hybrid.toml
index 34cdbb15..3f630043 100644
--- a/utils/keytable/rc_keymaps/astrometa_t2hybrid.toml
+++ b/utils/keytable/rc_keymaps/astrometa_t2hybrid.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-astrometa-t2hybrid.c as a source file
 [[protocols]]
 name = "astrometa_t2hybrid"
 protocol = "nec"
@@ -12,15 +16,15 @@ variant = "nec"
 0x0a = "KEY_VOLUMEDOWN"
 0x40 = "KEY_ZOOM"
 0x1e = "KEY_VOLUMEUP"
-0x12 = "KEY_0"
+0x12 = "KEY_NUMERIC_0"
 0x02 = "KEY_CHANNELDOWN"
 0x1c = "KEY_AGAIN"
-0x09 = "KEY_1"
-0x1d = "KEY_2"
-0x1f = "KEY_3"
-0x0d = "KEY_4"
-0x19 = "KEY_5"
-0x1b = "KEY_6"
-0x11 = "KEY_7"
-0x15 = "KEY_8"
-0x17 = "KEY_9"
+0x09 = "KEY_NUMERIC_1"
+0x1d = "KEY_NUMERIC_2"
+0x1f = "KEY_NUMERIC_3"
+0x0d = "KEY_NUMERIC_4"
+0x19 = "KEY_NUMERIC_5"
+0x1b = "KEY_NUMERIC_6"
+0x11 = "KEY_NUMERIC_7"
+0x15 = "KEY_NUMERIC_8"
+0x17 = "KEY_NUMERIC_9"
diff --git a/utils/keytable/rc_keymaps/asus_pc39.toml b/utils/keytable/rc_keymaps/asus_pc39.toml
index 6922ade6..89a3e3e4 100644
--- a/utils/keytable/rc_keymaps/asus_pc39.toml
+++ b/utils/keytable/rc_keymaps/asus_pc39.toml
@@ -1,18 +1,22 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-asus-pc39.c as a source file
 [[protocols]]
 name = "asus_pc39"
 protocol = "rc5"
 variant = "rc5"
 [protocols.scancodes]
-0x082a = "KEY_0"
-0x0816 = "KEY_1"
-0x0812 = "KEY_2"
-0x0814 = "KEY_3"
-0x0836 = "KEY_4"
-0x0832 = "KEY_5"
-0x0834 = "KEY_6"
-0x080e = "KEY_7"
-0x080a = "KEY_8"
-0x080c = "KEY_9"
+0x082a = "KEY_NUMERIC_0"
+0x0816 = "KEY_NUMERIC_1"
+0x0812 = "KEY_NUMERIC_2"
+0x0814 = "KEY_NUMERIC_3"
+0x0836 = "KEY_NUMERIC_4"
+0x0832 = "KEY_NUMERIC_5"
+0x0834 = "KEY_NUMERIC_6"
+0x080e = "KEY_NUMERIC_7"
+0x080a = "KEY_NUMERIC_8"
+0x080c = "KEY_NUMERIC_9"
 0x0801 = "KEY_RADIO"
 0x083c = "KEY_MENU"
 0x0815 = "KEY_VOLUMEUP"
diff --git a/utils/keytable/rc_keymaps/asus_ps3_100.toml b/utils/keytable/rc_keymaps/asus_ps3_100.toml
index 500deeb6..1f232f54 100644
--- a/utils/keytable/rc_keymaps/asus_ps3_100.toml
+++ b/utils/keytable/rc_keymaps/asus_ps3_100.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-asus-ps3-100.c as a source file
 [[protocols]]
 name = "asus_ps3_100"
 protocol = "rc5"
@@ -11,16 +15,16 @@ variant = "rc5"
 0x080d = "KEY_YELLOW"
 0x0806 = "KEY_BLUE"
 0x0807 = "KEY_GREEN"
-0x082a = "KEY_0"
-0x0816 = "KEY_1"
-0x0812 = "KEY_2"
-0x0814 = "KEY_3"
-0x0836 = "KEY_4"
-0x0832 = "KEY_5"
-0x0834 = "KEY_6"
-0x080e = "KEY_7"
-0x080a = "KEY_8"
-0x080c = "KEY_9"
+0x082a = "KEY_NUMERIC_0"
+0x0816 = "KEY_NUMERIC_1"
+0x0812 = "KEY_NUMERIC_2"
+0x0814 = "KEY_NUMERIC_3"
+0x0836 = "KEY_NUMERIC_4"
+0x0832 = "KEY_NUMERIC_5"
+0x0834 = "KEY_NUMERIC_6"
+0x080e = "KEY_NUMERIC_7"
+0x080a = "KEY_NUMERIC_8"
+0x080c = "KEY_NUMERIC_9"
 0x0815 = "KEY_VOLUMEUP"
 0x0826 = "KEY_VOLUMEDOWN"
 0x0835 = "KEY_CHANNELUP"
diff --git a/utils/keytable/rc_keymaps/ati_tv_wonder_hd_600.toml b/utils/keytable/rc_keymaps/ati_tv_wonder_hd_600.toml
index 2ddc0378..d63331fa 100644
--- a/utils/keytable/rc_keymaps/ati_tv_wonder_hd_600.toml
+++ b/utils/keytable/rc_keymaps/ati_tv_wonder_hd_600.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-ati-tv-wonder-hd-600.c as a source file
 [[protocols]]
 name = "ati_tv_wonder_hd_600"
 protocol = "unknown"
diff --git a/utils/keytable/rc_keymaps/ati_x10.toml b/utils/keytable/rc_keymaps/ati_x10.toml
index eb81813f..3bf65682 100644
--- a/utils/keytable/rc_keymaps/ati_x10.toml
+++ b/utils/keytable/rc_keymaps/ati_x10.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-ati-x10.c as a source file
 [[protocols]]
 name = "ati_x10"
 protocol = "other"
@@ -15,17 +19,17 @@ protocol = "other"
 0x0a = "KEY_MUTE"
 0x0b = "KEY_CHANNELUP"
 0x0c = "KEY_CHANNELDOWN"
-0x0d = "KEY_1"
-0x0e = "KEY_2"
-0x0f = "KEY_3"
-0x10 = "KEY_4"
-0x11 = "KEY_5"
-0x12 = "KEY_6"
-0x13 = "KEY_7"
-0x14 = "KEY_8"
-0x15 = "KEY_9"
+0x0d = "KEY_NUMERIC_1"
+0x0e = "KEY_NUMERIC_2"
+0x0f = "KEY_NUMERIC_3"
+0x10 = "KEY_NUMERIC_4"
+0x11 = "KEY_NUMERIC_5"
+0x12 = "KEY_NUMERIC_6"
+0x13 = "KEY_NUMERIC_7"
+0x14 = "KEY_NUMERIC_8"
+0x15 = "KEY_NUMERIC_9"
 0x16 = "KEY_MENU"
-0x17 = "KEY_0"
+0x17 = "KEY_NUMERIC_0"
 0x18 = "KEY_SETUP"
 0x19 = "KEY_C"
 0x1a = "KEY_UP"
diff --git a/utils/keytable/rc_keymaps/avermedia.toml b/utils/keytable/rc_keymaps/avermedia.toml
index 6a8b5d49..ca8c83fd 100644
--- a/utils/keytable/rc_keymaps/avermedia.toml
+++ b/utils/keytable/rc_keymaps/avermedia.toml
@@ -1,17 +1,21 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-avermedia.c as a source file
 [[protocols]]
 name = "avermedia"
 protocol = "unknown"
 [protocols.scancodes]
-0x28 = "KEY_1"
-0x18 = "KEY_2"
-0x38 = "KEY_3"
-0x24 = "KEY_4"
-0x14 = "KEY_5"
-0x34 = "KEY_6"
-0x2c = "KEY_7"
-0x1c = "KEY_8"
-0x3c = "KEY_9"
-0x22 = "KEY_0"
+0x28 = "KEY_NUMERIC_1"
+0x18 = "KEY_NUMERIC_2"
+0x38 = "KEY_NUMERIC_3"
+0x24 = "KEY_NUMERIC_4"
+0x14 = "KEY_NUMERIC_5"
+0x34 = "KEY_NUMERIC_6"
+0x2c = "KEY_NUMERIC_7"
+0x1c = "KEY_NUMERIC_8"
+0x3c = "KEY_NUMERIC_9"
+0x22 = "KEY_NUMERIC_0"
 0x20 = "KEY_TV"
 0x10 = "KEY_CD"
 0x30 = "KEY_TEXT"
diff --git a/utils/keytable/rc_keymaps/avermedia_a16d.toml b/utils/keytable/rc_keymaps/avermedia_a16d.toml
index f9d92db4..ae57f985 100644
--- a/utils/keytable/rc_keymaps/avermedia_a16d.toml
+++ b/utils/keytable/rc_keymaps/avermedia_a16d.toml
@@ -1,20 +1,24 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-avermedia-a16d.c as a source file
 [[protocols]]
 name = "avermedia_a16d"
 protocol = "unknown"
 [protocols.scancodes]
 0x20 = "KEY_LIST"
 0x00 = "KEY_POWER"
-0x28 = "KEY_1"
-0x18 = "KEY_2"
-0x38 = "KEY_3"
-0x24 = "KEY_4"
-0x14 = "KEY_5"
-0x34 = "KEY_6"
-0x2c = "KEY_7"
-0x1c = "KEY_8"
-0x3c = "KEY_9"
+0x28 = "KEY_NUMERIC_1"
+0x18 = "KEY_NUMERIC_2"
+0x38 = "KEY_NUMERIC_3"
+0x24 = "KEY_NUMERIC_4"
+0x14 = "KEY_NUMERIC_5"
+0x34 = "KEY_NUMERIC_6"
+0x2c = "KEY_NUMERIC_7"
+0x1c = "KEY_NUMERIC_8"
+0x3c = "KEY_NUMERIC_9"
 0x12 = "KEY_SUBTITLE"
-0x22 = "KEY_0"
+0x22 = "KEY_NUMERIC_0"
 0x32 = "KEY_REWIND"
 0x3a = "KEY_SHUFFLE"
 0x02 = "KEY_PRINT"
diff --git a/utils/keytable/rc_keymaps/avermedia_cardbus.toml b/utils/keytable/rc_keymaps/avermedia_cardbus.toml
index bd0ae5c2..9d6a0966 100644
--- a/utils/keytable/rc_keymaps/avermedia_cardbus.toml
+++ b/utils/keytable/rc_keymaps/avermedia_cardbus.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-avermedia-cardbus.c as a source file
 [[protocols]]
 name = "avermedia_cardbus"
 protocol = "unknown"
@@ -6,19 +10,19 @@ protocol = "unknown"
 0x01 = "KEY_TUNER"
 0x03 = "KEY_TEXT"
 0x04 = "KEY_EPG"
-0x05 = "KEY_1"
-0x06 = "KEY_2"
-0x07 = "KEY_3"
+0x05 = "KEY_NUMERIC_1"
+0x06 = "KEY_NUMERIC_2"
+0x07 = "KEY_NUMERIC_3"
 0x08 = "KEY_AUDIO"
-0x09 = "KEY_4"
-0x0a = "KEY_5"
-0x0b = "KEY_6"
+0x09 = "KEY_NUMERIC_4"
+0x0a = "KEY_NUMERIC_5"
+0x0b = "KEY_NUMERIC_6"
 0x0c = "KEY_ZOOM"
-0x0d = "KEY_7"
-0x0e = "KEY_8"
-0x0f = "KEY_9"
+0x0d = "KEY_NUMERIC_7"
+0x0e = "KEY_NUMERIC_8"
+0x0f = "KEY_NUMERIC_9"
 0x10 = "KEY_PAGEUP"
-0x11 = "KEY_0"
+0x11 = "KEY_NUMERIC_0"
 0x12 = "KEY_INFO"
 0x13 = "KEY_AGAIN"
 0x14 = "KEY_MUTE"
diff --git a/utils/keytable/rc_keymaps/avermedia_dvbt.toml b/utils/keytable/rc_keymaps/avermedia_dvbt.toml
index 9eb3ffe5..54100e15 100644
--- a/utils/keytable/rc_keymaps/avermedia_dvbt.toml
+++ b/utils/keytable/rc_keymaps/avermedia_dvbt.toml
@@ -1,17 +1,21 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-avermedia-dvbt.c as a source file
 [[protocols]]
 name = "avermedia_dvbt"
 protocol = "unknown"
 [protocols.scancodes]
-0x28 = "KEY_0"
-0x22 = "KEY_1"
-0x12 = "KEY_2"
-0x32 = "KEY_3"
-0x24 = "KEY_4"
-0x14 = "KEY_5"
-0x34 = "KEY_6"
-0x26 = "KEY_7"
-0x16 = "KEY_8"
-0x36 = "KEY_9"
+0x28 = "KEY_NUMERIC_0"
+0x22 = "KEY_NUMERIC_1"
+0x12 = "KEY_NUMERIC_2"
+0x32 = "KEY_NUMERIC_3"
+0x24 = "KEY_NUMERIC_4"
+0x14 = "KEY_NUMERIC_5"
+0x34 = "KEY_NUMERIC_6"
+0x26 = "KEY_NUMERIC_7"
+0x16 = "KEY_NUMERIC_8"
+0x36 = "KEY_NUMERIC_9"
 0x20 = "KEY_VIDEO"
 0x10 = "KEY_TEXT"
 0x00 = "KEY_POWER"
diff --git a/utils/keytable/rc_keymaps/avermedia_m135a.toml b/utils/keytable/rc_keymaps/avermedia_m135a.toml
index 5202ca0f..f1f26e59 100644
--- a/utils/keytable/rc_keymaps/avermedia_m135a.toml
+++ b/utils/keytable/rc_keymaps/avermedia_m135a.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-avermedia-m135a.c as a source file
 [[protocols]]
 name = "avermedia_m135a"
 protocol = "nec"
@@ -6,16 +10,16 @@ variant = "nec"
 0x0200 = "KEY_POWER2"
 0x022e = "KEY_DOT"
 0x0201 = "KEY_MODE"
-0x0205 = "KEY_1"
-0x0206 = "KEY_2"
-0x0207 = "KEY_3"
-0x0209 = "KEY_4"
-0x020a = "KEY_5"
-0x020b = "KEY_6"
-0x020d = "KEY_7"
-0x020e = "KEY_8"
-0x020f = "KEY_9"
-0x0211 = "KEY_0"
+0x0205 = "KEY_NUMERIC_1"
+0x0206 = "KEY_NUMERIC_2"
+0x0207 = "KEY_NUMERIC_3"
+0x0209 = "KEY_NUMERIC_4"
+0x020a = "KEY_NUMERIC_5"
+0x020b = "KEY_NUMERIC_6"
+0x020d = "KEY_NUMERIC_7"
+0x020e = "KEY_NUMERIC_8"
+0x020f = "KEY_NUMERIC_9"
+0x0211 = "KEY_NUMERIC_0"
 0x0213 = "KEY_RIGHT"
 0x0212 = "KEY_LEFT"
 0x0215 = "KEY_MENU"
@@ -42,17 +46,17 @@ variant = "nec"
 0x0401 = "KEY_POWER2"
 0x0406 = "KEY_MUTE"
 0x0408 = "KEY_MODE"
-0x0409 = "KEY_1"
-0x040a = "KEY_2"
-0x040b = "KEY_3"
-0x040c = "KEY_4"
-0x040d = "KEY_5"
-0x040e = "KEY_6"
-0x040f = "KEY_7"
-0x0410 = "KEY_8"
-0x0411 = "KEY_9"
+0x0409 = "KEY_NUMERIC_1"
+0x040a = "KEY_NUMERIC_2"
+0x040b = "KEY_NUMERIC_3"
+0x040c = "KEY_NUMERIC_4"
+0x040d = "KEY_NUMERIC_5"
+0x040e = "KEY_NUMERIC_6"
+0x040f = "KEY_NUMERIC_7"
+0x0410 = "KEY_NUMERIC_8"
+0x0411 = "KEY_NUMERIC_9"
 0x044c = "KEY_DOT"
-0x0412 = "KEY_0"
+0x0412 = "KEY_NUMERIC_0"
 0x0407 = "KEY_REFRESH"
 0x0413 = "KEY_AUDIO"
 0x0440 = "KEY_SCREEN"
diff --git a/utils/keytable/rc_keymaps/avermedia_m733a_rm_k6.toml b/utils/keytable/rc_keymaps/avermedia_m733a_rm_k6.toml
index 1260fe18..f3324e63 100644
--- a/utils/keytable/rc_keymaps/avermedia_m733a_rm_k6.toml
+++ b/utils/keytable/rc_keymaps/avermedia_m733a_rm_k6.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-avermedia-m733a-rm-k6.c as a source file
 [[protocols]]
 name = "avermedia_m733a_rm_k6"
 protocol = "nec"
@@ -6,17 +10,17 @@ variant = "nec"
 0x0401 = "KEY_POWER2"
 0x0406 = "KEY_MUTE"
 0x0408 = "KEY_MODE"
-0x0409 = "KEY_1"
-0x040a = "KEY_2"
-0x040b = "KEY_3"
-0x040c = "KEY_4"
-0x040d = "KEY_5"
-0x040e = "KEY_6"
-0x040f = "KEY_7"
-0x0410 = "KEY_8"
-0x0411 = "KEY_9"
+0x0409 = "KEY_NUMERIC_1"
+0x040a = "KEY_NUMERIC_2"
+0x040b = "KEY_NUMERIC_3"
+0x040c = "KEY_NUMERIC_4"
+0x040d = "KEY_NUMERIC_5"
+0x040e = "KEY_NUMERIC_6"
+0x040f = "KEY_NUMERIC_7"
+0x0410 = "KEY_NUMERIC_8"
+0x0411 = "KEY_NUMERIC_9"
 0x044c = "KEY_DOT"
-0x0412 = "KEY_0"
+0x0412 = "KEY_NUMERIC_0"
 0x0407 = "KEY_REFRESH"
 0x0413 = "KEY_AUDIO"
 0x0440 = "KEY_SCREEN"
diff --git a/utils/keytable/rc_keymaps/avermedia_rm_ks.toml b/utils/keytable/rc_keymaps/avermedia_rm_ks.toml
index e00a8429..289182ca 100644
--- a/utils/keytable/rc_keymaps/avermedia_rm_ks.toml
+++ b/utils/keytable/rc_keymaps/avermedia_rm_ks.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-avermedia-rm-ks.c as a source file
 [[protocols]]
 name = "avermedia_rm_ks"
 protocol = "nec"
@@ -11,16 +15,16 @@ variant = "nec"
 0x0506 = "KEY_MUTE"
 0x0507 = "KEY_AGAIN"
 0x0508 = "KEY_VIDEO"
-0x0509 = "KEY_1"
-0x050a = "KEY_2"
-0x050b = "KEY_3"
-0x050c = "KEY_4"
-0x050d = "KEY_5"
-0x050e = "KEY_6"
-0x050f = "KEY_7"
-0x0510 = "KEY_8"
-0x0511 = "KEY_9"
-0x0512 = "KEY_0"
+0x0509 = "KEY_NUMERIC_1"
+0x050a = "KEY_NUMERIC_2"
+0x050b = "KEY_NUMERIC_3"
+0x050c = "KEY_NUMERIC_4"
+0x050d = "KEY_NUMERIC_5"
+0x050e = "KEY_NUMERIC_6"
+0x050f = "KEY_NUMERIC_7"
+0x0510 = "KEY_NUMERIC_8"
+0x0511 = "KEY_NUMERIC_9"
+0x0512 = "KEY_NUMERIC_0"
 0x0513 = "KEY_AUDIO"
 0x0515 = "KEY_EPG"
 0x0516 = "KEY_PLAYPAUSE"
diff --git a/utils/keytable/rc_keymaps/avertv_303.toml b/utils/keytable/rc_keymaps/avertv_303.toml
index 20a200c3..68ca98fb 100644
--- a/utils/keytable/rc_keymaps/avertv_303.toml
+++ b/utils/keytable/rc_keymaps/avertv_303.toml
@@ -1,17 +1,21 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-avertv-303.c as a source file
 [[protocols]]
 name = "avertv_303"
 protocol = "unknown"
 [protocols.scancodes]
-0x2a = "KEY_1"
-0x32 = "KEY_2"
-0x3a = "KEY_3"
-0x4a = "KEY_4"
-0x52 = "KEY_5"
-0x5a = "KEY_6"
-0x6a = "KEY_7"
-0x72 = "KEY_8"
-0x7a = "KEY_9"
-0x0e = "KEY_0"
+0x2a = "KEY_NUMERIC_1"
+0x32 = "KEY_NUMERIC_2"
+0x3a = "KEY_NUMERIC_3"
+0x4a = "KEY_NUMERIC_4"
+0x52 = "KEY_NUMERIC_5"
+0x5a = "KEY_NUMERIC_6"
+0x6a = "KEY_NUMERIC_7"
+0x72 = "KEY_NUMERIC_8"
+0x7a = "KEY_NUMERIC_9"
+0x0e = "KEY_NUMERIC_0"
 0x02 = "KEY_POWER"
 0x22 = "KEY_VIDEO"
 0x42 = "KEY_AUDIO"
diff --git a/utils/keytable/rc_keymaps/az6027.toml b/utils/keytable/rc_keymaps/az6027.toml
index 95c558f9..4952709c 100644
--- a/utils/keytable/rc_keymaps/az6027.toml
+++ b/utils/keytable/rc_keymaps/az6027.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/usb/dvb-usb/az6027.c as a source file
 [[protocols]]
 name = "az6027"
 protocol = "unknown"
diff --git a/utils/keytable/rc_keymaps/azurewave_ad_tu700.toml b/utils/keytable/rc_keymaps/azurewave_ad_tu700.toml
index effea748..dafdccf7 100644
--- a/utils/keytable/rc_keymaps/azurewave_ad_tu700.toml
+++ b/utils/keytable/rc_keymaps/azurewave_ad_tu700.toml
@@ -1,21 +1,25 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-azurewave-ad-tu700.c as a source file
 [[protocols]]
 name = "azurewave_ad_tu700"
 protocol = "nec"
 variant = "nec"
 [protocols.scancodes]
 0x0000 = "KEY_TAB"
-0x0001 = "KEY_2"
+0x0001 = "KEY_NUMERIC_2"
 0x0002 = "KEY_CHANNELDOWN"
-0x0003 = "KEY_1"
+0x0003 = "KEY_NUMERIC_1"
 0x0004 = "KEY_MENU"
 0x0005 = "KEY_CHANNELUP"
-0x0006 = "KEY_3"
+0x0006 = "KEY_NUMERIC_3"
 0x0007 = "KEY_SLEEP"
 0x0008 = "KEY_VIDEO"
-0x0009 = "KEY_4"
+0x0009 = "KEY_NUMERIC_4"
 0x000a = "KEY_VOLUMEDOWN"
 0x000c = "KEY_CANCEL"
-0x000d = "KEY_7"
+0x000d = "KEY_NUMERIC_7"
 0x000e = "KEY_AGAIN"
 0x000f = "KEY_TEXT"
 0x0010 = "KEY_MUTE"
@@ -23,17 +27,17 @@ variant = "nec"
 0x0012 = "KEY_FASTFORWARD"
 0x0013 = "KEY_BACK"
 0x0014 = "KEY_PLAY"
-0x0015 = "KEY_0"
+0x0015 = "KEY_NUMERIC_0"
 0x0016 = "KEY_POWER2"
 0x0017 = "KEY_FAVORITES"
 0x0018 = "KEY_RED"
-0x0019 = "KEY_8"
+0x0019 = "KEY_NUMERIC_8"
 0x001a = "KEY_STOP"
-0x001b = "KEY_9"
+0x001b = "KEY_NUMERIC_9"
 0x001c = "KEY_EPG"
-0x001d = "KEY_5"
+0x001d = "KEY_NUMERIC_5"
 0x001e = "KEY_VOLUMEUP"
-0x001f = "KEY_6"
+0x001f = "KEY_NUMERIC_6"
 0x0040 = "KEY_REWIND"
 0x0041 = "KEY_PREVIOUS"
 0x0042 = "KEY_NEXT"
diff --git a/utils/keytable/rc_keymaps/behold.toml b/utils/keytable/rc_keymaps/behold.toml
index 4c31e64a..61c0ce2c 100644
--- a/utils/keytable/rc_keymaps/behold.toml
+++ b/utils/keytable/rc_keymaps/behold.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-behold.c as a source file
 [[protocols]]
 name = "behold"
 protocol = "nec"
@@ -5,17 +9,17 @@ variant = "necx"
 [protocols.scancodes]
 0x866b1c = "KEY_TUNER"
 0x866b12 = "KEY_POWER"
-0x866b01 = "KEY_1"
-0x866b02 = "KEY_2"
-0x866b03 = "KEY_3"
-0x866b04 = "KEY_4"
-0x866b05 = "KEY_5"
-0x866b06 = "KEY_6"
-0x866b07 = "KEY_7"
-0x866b08 = "KEY_8"
-0x866b09 = "KEY_9"
+0x866b01 = "KEY_NUMERIC_1"
+0x866b02 = "KEY_NUMERIC_2"
+0x866b03 = "KEY_NUMERIC_3"
+0x866b04 = "KEY_NUMERIC_4"
+0x866b05 = "KEY_NUMERIC_5"
+0x866b06 = "KEY_NUMERIC_6"
+0x866b07 = "KEY_NUMERIC_7"
+0x866b08 = "KEY_NUMERIC_8"
+0x866b09 = "KEY_NUMERIC_9"
 0x866b0a = "KEY_AGAIN"
-0x866b00 = "KEY_0"
+0x866b00 = "KEY_NUMERIC_0"
 0x866b17 = "KEY_MODE"
 0x866b14 = "KEY_SCREEN"
 0x866b10 = "KEY_ZOOM"
diff --git a/utils/keytable/rc_keymaps/behold_columbus.toml b/utils/keytable/rc_keymaps/behold_columbus.toml
index 31100065..9c2858ec 100644
--- a/utils/keytable/rc_keymaps/behold_columbus.toml
+++ b/utils/keytable/rc_keymaps/behold_columbus.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-behold-columbus.c as a source file
 [[protocols]]
 name = "behold_columbus"
 protocol = "unknown"
@@ -6,20 +10,20 @@ protocol = "unknown"
 0x11 = "KEY_VIDEO"
 0x1C = "KEY_TUNER"
 0x12 = "KEY_POWER"
-0x01 = "KEY_1"
-0x02 = "KEY_2"
-0x03 = "KEY_3"
+0x01 = "KEY_NUMERIC_1"
+0x02 = "KEY_NUMERIC_2"
+0x03 = "KEY_NUMERIC_3"
 0x0D = "KEY_SETUP"
-0x04 = "KEY_4"
-0x05 = "KEY_5"
-0x06 = "KEY_6"
+0x04 = "KEY_NUMERIC_4"
+0x05 = "KEY_NUMERIC_5"
+0x06 = "KEY_NUMERIC_6"
 0x19 = "KEY_CAMERA"
-0x07 = "KEY_7"
-0x08 = "KEY_8"
-0x09 = "KEY_9"
+0x07 = "KEY_NUMERIC_7"
+0x08 = "KEY_NUMERIC_8"
+0x09 = "KEY_NUMERIC_9"
 0x10 = "KEY_ZOOM"
 0x0A = "KEY_AGAIN"
-0x00 = "KEY_0"
+0x00 = "KEY_NUMERIC_0"
 0x0B = "KEY_CHANNELUP"
 0x0C = "KEY_VOLUMEUP"
 0x1B = "KEY_TIME"
diff --git a/utils/keytable/rc_keymaps/budget_ci_old.toml b/utils/keytable/rc_keymaps/budget_ci_old.toml
index 77ae50bd..b560988d 100644
--- a/utils/keytable/rc_keymaps/budget_ci_old.toml
+++ b/utils/keytable/rc_keymaps/budget_ci_old.toml
@@ -1,17 +1,21 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-budget-ci-old.c as a source file
 [[protocols]]
 name = "budget_ci_old"
 protocol = "unknown"
 [protocols.scancodes]
-0x00 = "KEY_0"
-0x01 = "KEY_1"
-0x02 = "KEY_2"
-0x03 = "KEY_3"
-0x04 = "KEY_4"
-0x05 = "KEY_5"
-0x06 = "KEY_6"
-0x07 = "KEY_7"
-0x08 = "KEY_8"
-0x09 = "KEY_9"
+0x00 = "KEY_NUMERIC_0"
+0x01 = "KEY_NUMERIC_1"
+0x02 = "KEY_NUMERIC_2"
+0x03 = "KEY_NUMERIC_3"
+0x04 = "KEY_NUMERIC_4"
+0x05 = "KEY_NUMERIC_5"
+0x06 = "KEY_NUMERIC_6"
+0x07 = "KEY_NUMERIC_7"
+0x08 = "KEY_NUMERIC_8"
+0x09 = "KEY_NUMERIC_9"
 0x0a = "KEY_ENTER"
 0x0b = "KEY_RED"
 0x0c = "KEY_POWER"
diff --git a/utils/keytable/rc_keymaps/cec.toml b/utils/keytable/rc_keymaps/cec.toml
index 1c86ec9d..91a59cf3 100644
--- a/utils/keytable/rc_keymaps/cec.toml
+++ b/utils/keytable/rc_keymaps/cec.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-cec.c as a source file
 [[protocols]]
 name = "cec"
 protocol = "cec"
diff --git a/utils/keytable/rc_keymaps/cinergy.toml b/utils/keytable/rc_keymaps/cinergy.toml
index e7fb4c4d..6bdf79e6 100644
--- a/utils/keytable/rc_keymaps/cinergy.toml
+++ b/utils/keytable/rc_keymaps/cinergy.toml
@@ -1,17 +1,21 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-cinergy.c as a source file
 [[protocols]]
 name = "cinergy"
 protocol = "unknown"
 [protocols.scancodes]
-0x00 = "KEY_0"
-0x01 = "KEY_1"
-0x02 = "KEY_2"
-0x03 = "KEY_3"
-0x04 = "KEY_4"
-0x05 = "KEY_5"
-0x06 = "KEY_6"
-0x07 = "KEY_7"
-0x08 = "KEY_8"
-0x09 = "KEY_9"
+0x00 = "KEY_NUMERIC_0"
+0x01 = "KEY_NUMERIC_1"
+0x02 = "KEY_NUMERIC_2"
+0x03 = "KEY_NUMERIC_3"
+0x04 = "KEY_NUMERIC_4"
+0x05 = "KEY_NUMERIC_5"
+0x06 = "KEY_NUMERIC_6"
+0x07 = "KEY_NUMERIC_7"
+0x08 = "KEY_NUMERIC_8"
+0x09 = "KEY_NUMERIC_9"
 0x0a = "KEY_POWER"
 0x0b = "KEY_MEDIA"
 0x0c = "KEY_ZOOM"
diff --git a/utils/keytable/rc_keymaps/cinergy_1400.toml b/utils/keytable/rc_keymaps/cinergy_1400.toml
index f8cd791b..db03f198 100644
--- a/utils/keytable/rc_keymaps/cinergy_1400.toml
+++ b/utils/keytable/rc_keymaps/cinergy_1400.toml
@@ -1,18 +1,22 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-cinergy-1400.c as a source file
 [[protocols]]
 name = "cinergy_1400"
 protocol = "unknown"
 [protocols.scancodes]
 0x01 = "KEY_POWER"
-0x02 = "KEY_1"
-0x03 = "KEY_2"
-0x04 = "KEY_3"
-0x05 = "KEY_4"
-0x06 = "KEY_5"
-0x07 = "KEY_6"
-0x08 = "KEY_7"
-0x09 = "KEY_8"
-0x0a = "KEY_9"
-0x0c = "KEY_0"
+0x02 = "KEY_NUMERIC_1"
+0x03 = "KEY_NUMERIC_2"
+0x04 = "KEY_NUMERIC_3"
+0x05 = "KEY_NUMERIC_4"
+0x06 = "KEY_NUMERIC_5"
+0x07 = "KEY_NUMERIC_6"
+0x08 = "KEY_NUMERIC_7"
+0x09 = "KEY_NUMERIC_8"
+0x0a = "KEY_NUMERIC_9"
+0x0c = "KEY_NUMERIC_0"
 0x0b = "KEY_VIDEO"
 0x0d = "KEY_REFRESH"
 0x0e = "KEY_SELECT"
diff --git a/utils/keytable/rc_keymaps/cinergyt2.toml b/utils/keytable/rc_keymaps/cinergyt2.toml
index e8339672..caa5fb10 100644
--- a/utils/keytable/rc_keymaps/cinergyt2.toml
+++ b/utils/keytable/rc_keymaps/cinergyt2.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/usb/dvb-usb/cinergyT2-core.c as a source file
 [[protocols]]
 name = "cinergyt2"
 protocol = "unknown"
diff --git a/utils/keytable/rc_keymaps/d680_dmb.toml b/utils/keytable/rc_keymaps/d680_dmb.toml
index ab8a05b5..41a624b1 100644
--- a/utils/keytable/rc_keymaps/d680_dmb.toml
+++ b/utils/keytable/rc_keymaps/d680_dmb.toml
@@ -1,19 +1,23 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-d680-dmb.c as a source file
 [[protocols]]
 name = "d680_dmb"
 protocol = "unknown"
 [protocols.scancodes]
 0x0038 = "KEY_SWITCHVIDEOMODE"
 0x080c = "KEY_ZOOM"
-0x0800 = "KEY_0"
-0x0001 = "KEY_1"
-0x0802 = "KEY_2"
-0x0003 = "KEY_3"
-0x0804 = "KEY_4"
-0x0005 = "KEY_5"
-0x0806 = "KEY_6"
-0x0007 = "KEY_7"
-0x0808 = "KEY_8"
-0x0009 = "KEY_9"
+0x0800 = "KEY_NUMERIC_0"
+0x0001 = "KEY_NUMERIC_1"
+0x0802 = "KEY_NUMERIC_2"
+0x0003 = "KEY_NUMERIC_3"
+0x0804 = "KEY_NUMERIC_4"
+0x0005 = "KEY_NUMERIC_5"
+0x0806 = "KEY_NUMERIC_6"
+0x0007 = "KEY_NUMERIC_7"
+0x0808 = "KEY_NUMERIC_8"
+0x0009 = "KEY_NUMERIC_9"
 0x000a = "KEY_MUTE"
 0x0829 = "KEY_BACK"
 0x0012 = "KEY_CHANNELUP"
diff --git a/utils/keytable/rc_keymaps/delock_61959.toml b/utils/keytable/rc_keymaps/delock_61959.toml
index 674ba5ba..56d382ab 100644
--- a/utils/keytable/rc_keymaps/delock_61959.toml
+++ b/utils/keytable/rc_keymaps/delock_61959.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-delock-61959.c as a source file
 [[protocols]]
 name = "delock_61959"
 protocol = "nec"
@@ -5,16 +9,16 @@ variant = "necx"
 [protocols.scancodes]
 0x866b16 = "KEY_POWER2"
 0x866b0c = "KEY_POWER"
-0x866b00 = "KEY_1"
-0x866b01 = "KEY_2"
-0x866b02 = "KEY_3"
-0x866b03 = "KEY_4"
-0x866b04 = "KEY_5"
-0x866b05 = "KEY_6"
-0x866b06 = "KEY_7"
-0x866b07 = "KEY_8"
-0x866b08 = "KEY_9"
-0x866b14 = "KEY_0"
+0x866b00 = "KEY_NUMERIC_1"
+0x866b01 = "KEY_NUMERIC_2"
+0x866b02 = "KEY_NUMERIC_3"
+0x866b03 = "KEY_NUMERIC_4"
+0x866b04 = "KEY_NUMERIC_5"
+0x866b05 = "KEY_NUMERIC_6"
+0x866b06 = "KEY_NUMERIC_7"
+0x866b07 = "KEY_NUMERIC_8"
+0x866b08 = "KEY_NUMERIC_9"
+0x866b14 = "KEY_NUMERIC_0"
 0x866b0a = "KEY_ZOOM"
 0x866b10 = "KEY_CAMERA"
 0x866b0e = "KEY_CHANNEL"
diff --git a/utils/keytable/rc_keymaps/dib0700_nec.toml b/utils/keytable/rc_keymaps/dib0700_nec.toml
index e37dd279..45e70859 100644
--- a/utils/keytable/rc_keymaps/dib0700_nec.toml
+++ b/utils/keytable/rc_keymaps/dib0700_nec.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-dib0700-nec.c as a source file
 [[protocols]]
 name = "dib0700_nec"
 protocol = "nec"
@@ -5,16 +9,16 @@ variant = "nec"
 [protocols.scancodes]
 0x866b13 = "KEY_MUTE"
 0x866b12 = "KEY_POWER"
-0x866b01 = "KEY_1"
-0x866b02 = "KEY_2"
-0x866b03 = "KEY_3"
-0x866b04 = "KEY_4"
-0x866b05 = "KEY_5"
-0x866b06 = "KEY_6"
-0x866b07 = "KEY_7"
-0x866b08 = "KEY_8"
-0x866b09 = "KEY_9"
-0x866b00 = "KEY_0"
+0x866b01 = "KEY_NUMERIC_1"
+0x866b02 = "KEY_NUMERIC_2"
+0x866b03 = "KEY_NUMERIC_3"
+0x866b04 = "KEY_NUMERIC_4"
+0x866b05 = "KEY_NUMERIC_5"
+0x866b06 = "KEY_NUMERIC_6"
+0x866b07 = "KEY_NUMERIC_7"
+0x866b08 = "KEY_NUMERIC_8"
+0x866b09 = "KEY_NUMERIC_9"
+0x866b00 = "KEY_NUMERIC_0"
 0x866b0d = "KEY_CHANNELUP"
 0x866b19 = "KEY_CHANNELDOWN"
 0x866b10 = "KEY_VOLUMEUP"
@@ -41,17 +45,17 @@ variant = "nec"
 0x7a41 = "KEY_MUTE"
 0x4501 = "KEY_POWER"
 0x4502 = "KEY_MUTE"
-0x4503 = "KEY_1"
-0x4504 = "KEY_2"
-0x4505 = "KEY_3"
-0x4506 = "KEY_4"
-0x4507 = "KEY_5"
-0x4508 = "KEY_6"
-0x4509 = "KEY_7"
-0x450a = "KEY_8"
-0x450b = "KEY_9"
+0x4503 = "KEY_NUMERIC_1"
+0x4504 = "KEY_NUMERIC_2"
+0x4505 = "KEY_NUMERIC_3"
+0x4506 = "KEY_NUMERIC_4"
+0x4507 = "KEY_NUMERIC_5"
+0x4508 = "KEY_NUMERIC_6"
+0x4509 = "KEY_NUMERIC_7"
+0x450a = "KEY_NUMERIC_8"
+0x450b = "KEY_NUMERIC_9"
 0x450c = "KEY_LAST"
-0x450d = "KEY_0"
+0x450d = "KEY_NUMERIC_0"
 0x450e = "KEY_ENTER"
 0x450f = "KEY_RED"
 0x4510 = "KEY_CHANNELUP"
diff --git a/utils/keytable/rc_keymaps/dib0700_rc5.toml b/utils/keytable/rc_keymaps/dib0700_rc5.toml
index eb84f79d..e8686803 100644
--- a/utils/keytable/rc_keymaps/dib0700_rc5.toml
+++ b/utils/keytable/rc_keymaps/dib0700_rc5.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-dib0700-rc5.c as a source file
 [[protocols]]
 name = "dib0700_rc5"
 protocol = "rc5"
@@ -10,16 +14,16 @@ variant = "rc5"
 0x0709 = "KEY_VOLUMEDOWN"
 0x0706 = "KEY_CHANNELUP"
 0x070c = "KEY_CHANNELDOWN"
-0x070f = "KEY_1"
-0x0715 = "KEY_2"
-0x0710 = "KEY_3"
-0x0718 = "KEY_4"
-0x071b = "KEY_5"
-0x071e = "KEY_6"
-0x0711 = "KEY_7"
-0x0721 = "KEY_8"
-0x0712 = "KEY_9"
-0x0727 = "KEY_0"
+0x070f = "KEY_NUMERIC_1"
+0x0715 = "KEY_NUMERIC_2"
+0x0710 = "KEY_NUMERIC_3"
+0x0718 = "KEY_NUMERIC_4"
+0x071b = "KEY_NUMERIC_5"
+0x071e = "KEY_NUMERIC_6"
+0x0711 = "KEY_NUMERIC_7"
+0x0721 = "KEY_NUMERIC_8"
+0x0712 = "KEY_NUMERIC_9"
+0x0727 = "KEY_NUMERIC_0"
 0x0724 = "KEY_SCREEN"
 0x072a = "KEY_TEXT"
 0x072d = "KEY_REWIND"
@@ -29,17 +33,17 @@ variant = "rc5"
 0x073c = "KEY_STOP"
 0x073f = "KEY_CANCEL"
 0xeb01 = "KEY_POWER"
-0xeb02 = "KEY_1"
-0xeb03 = "KEY_2"
-0xeb04 = "KEY_3"
-0xeb05 = "KEY_4"
-0xeb06 = "KEY_5"
-0xeb07 = "KEY_6"
-0xeb08 = "KEY_7"
-0xeb09 = "KEY_8"
-0xeb0a = "KEY_9"
+0xeb02 = "KEY_NUMERIC_1"
+0xeb03 = "KEY_NUMERIC_2"
+0xeb04 = "KEY_NUMERIC_3"
+0xeb05 = "KEY_NUMERIC_4"
+0xeb06 = "KEY_NUMERIC_5"
+0xeb07 = "KEY_NUMERIC_6"
+0xeb08 = "KEY_NUMERIC_7"
+0xeb09 = "KEY_NUMERIC_8"
+0xeb0a = "KEY_NUMERIC_9"
 0xeb0b = "KEY_VIDEO"
-0xeb0c = "KEY_0"
+0xeb0c = "KEY_NUMERIC_0"
 0xeb0d = "KEY_REFRESH"
 0xeb0f = "KEY_EPG"
 0xeb10 = "KEY_UP"
@@ -76,16 +80,16 @@ variant = "rc5"
 0xeb54 = "KEY_PREVIOUS"
 0xeb58 = "KEY_RECORD"
 0xeb5c = "KEY_NEXT"
-0x1e00 = "KEY_0"
-0x1e01 = "KEY_1"
-0x1e02 = "KEY_2"
-0x1e03 = "KEY_3"
-0x1e04 = "KEY_4"
-0x1e05 = "KEY_5"
-0x1e06 = "KEY_6"
-0x1e07 = "KEY_7"
-0x1e08 = "KEY_8"
-0x1e09 = "KEY_9"
+0x1e00 = "KEY_NUMERIC_0"
+0x1e01 = "KEY_NUMERIC_1"
+0x1e02 = "KEY_NUMERIC_2"
+0x1e03 = "KEY_NUMERIC_3"
+0x1e04 = "KEY_NUMERIC_4"
+0x1e05 = "KEY_NUMERIC_5"
+0x1e06 = "KEY_NUMERIC_6"
+0x1e07 = "KEY_NUMERIC_7"
+0x1e08 = "KEY_NUMERIC_8"
+0x1e09 = "KEY_NUMERIC_9"
 0x1e0a = "KEY_KPASTERISK"
 0x1e0b = "KEY_RED"
 0x1e0c = "KEY_RADIO"
@@ -126,16 +130,16 @@ variant = "rc5"
 0x0f4e = "KEY_PRINT"
 0x0840 = "KEY_SCREEN"
 0x0f71 = "KEY_DOT"
-0x0743 = "KEY_0"
-0x0c41 = "KEY_1"
-0x0443 = "KEY_2"
-0x0b7f = "KEY_3"
-0x0e41 = "KEY_4"
-0x0643 = "KEY_5"
-0x097f = "KEY_6"
-0x0d7e = "KEY_7"
-0x057c = "KEY_8"
-0x0a40 = "KEY_9"
+0x0743 = "KEY_NUMERIC_0"
+0x0c41 = "KEY_NUMERIC_1"
+0x0443 = "KEY_NUMERIC_2"
+0x0b7f = "KEY_NUMERIC_3"
+0x0e41 = "KEY_NUMERIC_4"
+0x0643 = "KEY_NUMERIC_5"
+0x097f = "KEY_NUMERIC_6"
+0x0d7e = "KEY_NUMERIC_7"
+0x057c = "KEY_NUMERIC_8"
+0x0a40 = "KEY_NUMERIC_9"
 0x0e4e = "KEY_CLEAR"
 0x047c = "KEY_CHANNEL"
 0x0f41 = "KEY_LAST"
@@ -148,16 +152,16 @@ variant = "rc5"
 0x017d = "KEY_VOLUMEDOWN"
 0x0242 = "KEY_CHANNELUP"
 0x007d = "KEY_CHANNELDOWN"
-0x1d00 = "KEY_0"
-0x1d01 = "KEY_1"
-0x1d02 = "KEY_2"
-0x1d03 = "KEY_3"
-0x1d04 = "KEY_4"
-0x1d05 = "KEY_5"
-0x1d06 = "KEY_6"
-0x1d07 = "KEY_7"
-0x1d08 = "KEY_8"
-0x1d09 = "KEY_9"
+0x1d00 = "KEY_NUMERIC_0"
+0x1d01 = "KEY_NUMERIC_1"
+0x1d02 = "KEY_NUMERIC_2"
+0x1d03 = "KEY_NUMERIC_3"
+0x1d04 = "KEY_NUMERIC_4"
+0x1d05 = "KEY_NUMERIC_5"
+0x1d06 = "KEY_NUMERIC_6"
+0x1d07 = "KEY_NUMERIC_7"
+0x1d08 = "KEY_NUMERIC_8"
+0x1d09 = "KEY_NUMERIC_9"
 0x1d0a = "KEY_TEXT"
 0x1d0d = "KEY_MENU"
 0x1d0f = "KEY_MUTE"
diff --git a/utils/keytable/rc_keymaps/dibusb.toml b/utils/keytable/rc_keymaps/dibusb.toml
index 2e18b68f..cce286ca 100644
--- a/utils/keytable/rc_keymaps/dibusb.toml
+++ b/utils/keytable/rc_keymaps/dibusb.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/usb/dvb-usb/dibusb-common.c as a source file
 [[protocols]]
 name = "dibusb"
 protocol = "unknown"
diff --git a/utils/keytable/rc_keymaps/digitalnow_tinytwin.toml b/utils/keytable/rc_keymaps/digitalnow_tinytwin.toml
index 0e9153c0..55538cfc 100644
--- a/utils/keytable/rc_keymaps/digitalnow_tinytwin.toml
+++ b/utils/keytable/rc_keymaps/digitalnow_tinytwin.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-digitalnow-tinytwin.c as a source file
 [[protocols]]
 name = "digitalnow_tinytwin"
 protocol = "nec"
@@ -6,14 +10,14 @@ variant = "nec"
 0x0000 = "KEY_MUTE"
 0x0001 = "KEY_VOLUMEUP"
 0x0002 = "KEY_POWER2"
-0x0003 = "KEY_2"
-0x0004 = "KEY_3"
-0x0005 = "KEY_4"
-0x0006 = "KEY_6"
-0x0007 = "KEY_7"
-0x0008 = "KEY_8"
+0x0003 = "KEY_NUMERIC_2"
+0x0004 = "KEY_NUMERIC_3"
+0x0005 = "KEY_NUMERIC_4"
+0x0006 = "KEY_NUMERIC_6"
+0x0007 = "KEY_NUMERIC_7"
+0x0008 = "KEY_NUMERIC_8"
 0x0009 = "KEY_NUMERIC_STAR"
-0x000a = "KEY_0"
+0x000a = "KEY_NUMERIC_0"
 0x000b = "KEY_NUMERIC_POUND"
 0x000c = "KEY_RIGHT"
 0x000d = "KEY_HOMEPAGE"
@@ -30,10 +34,10 @@ variant = "nec"
 0x0019 = "KEY_BLUE"
 0x001a = "KEY_REWIND"
 0x001b = "KEY_PLAY"
-0x001c = "KEY_5"
-0x001d = "KEY_9"
+0x001c = "KEY_NUMERIC_5"
+0x001d = "KEY_NUMERIC_9"
 0x001e = "KEY_VOLUMEDOWN"
-0x001f = "KEY_1"
+0x001f = "KEY_NUMERIC_1"
 0x0040 = "KEY_STOP"
 0x0042 = "KEY_PAUSE"
 0x0043 = "KEY_SCREEN"
diff --git a/utils/keytable/rc_keymaps/digittrade.toml b/utils/keytable/rc_keymaps/digittrade.toml
index 4a549d09..83e612f7 100644
--- a/utils/keytable/rc_keymaps/digittrade.toml
+++ b/utils/keytable/rc_keymaps/digittrade.toml
@@ -1,13 +1,17 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-digittrade.c as a source file
 [[protocols]]
 name = "digittrade"
 protocol = "nec"
 variant = "nec"
 [protocols.scancodes]
-0x0000 = "KEY_9"
+0x0000 = "KEY_NUMERIC_9"
 0x0001 = "KEY_EPG"
 0x0002 = "KEY_VOLUMEDOWN"
 0x0003 = "KEY_TEXT"
-0x0004 = "KEY_8"
+0x0004 = "KEY_NUMERIC_8"
 0x0005 = "KEY_MUTE"
 0x0006 = "KEY_POWER2"
 0x0009 = "KEY_ZOOM"
@@ -15,19 +19,19 @@ variant = "nec"
 0x000d = "KEY_SUBTITLE"
 0x000e = "KEY_STOP"
 0x0010 = "KEY_OK"
-0x0011 = "KEY_2"
-0x0012 = "KEY_4"
-0x0015 = "KEY_3"
-0x0016 = "KEY_5"
+0x0011 = "KEY_NUMERIC_2"
+0x0012 = "KEY_NUMERIC_4"
+0x0015 = "KEY_NUMERIC_3"
+0x0016 = "KEY_NUMERIC_5"
 0x0017 = "KEY_CHANNELDOWN"
 0x0019 = "KEY_CHANNELUP"
 0x001a = "KEY_PAUSE"
-0x001b = "KEY_1"
+0x001b = "KEY_NUMERIC_1"
 0x001d = "KEY_AUDIO"
 0x001e = "KEY_PLAY"
 0x001f = "KEY_CAMERA"
 0x0040 = "KEY_VOLUMEUP"
-0x0048 = "KEY_7"
-0x004c = "KEY_6"
+0x0048 = "KEY_NUMERIC_7"
+0x004c = "KEY_NUMERIC_6"
 0x004d = "KEY_PLAYPAUSE"
-0x0054 = "KEY_0"
+0x0054 = "KEY_NUMERIC_0"
diff --git a/utils/keytable/rc_keymaps/digitv.toml b/utils/keytable/rc_keymaps/digitv.toml
index 0f350e3c..eef9ec02 100644
--- a/utils/keytable/rc_keymaps/digitv.toml
+++ b/utils/keytable/rc_keymaps/digitv.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/usb/dvb-usb/digitv.c as a source file
 [[protocols]]
 name = "digitv"
 protocol = "unknown"
diff --git a/utils/keytable/rc_keymaps/dm1105_nec.toml b/utils/keytable/rc_keymaps/dm1105_nec.toml
index bd299032..5e16a4de 100644
--- a/utils/keytable/rc_keymaps/dm1105_nec.toml
+++ b/utils/keytable/rc_keymaps/dm1105_nec.toml
@@ -1,19 +1,23 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-dm1105-nec.c as a source file
 [[protocols]]
 name = "dm1105_nec"
 protocol = "unknown"
 [protocols.scancodes]
 0x0a = "KEY_POWER2"
 0x0c = "KEY_MUTE"
-0x11 = "KEY_1"
-0x12 = "KEY_2"
-0x13 = "KEY_3"
-0x14 = "KEY_4"
-0x15 = "KEY_5"
-0x16 = "KEY_6"
-0x17 = "KEY_7"
-0x18 = "KEY_8"
-0x19 = "KEY_9"
-0x10 = "KEY_0"
+0x11 = "KEY_NUMERIC_1"
+0x12 = "KEY_NUMERIC_2"
+0x13 = "KEY_NUMERIC_3"
+0x14 = "KEY_NUMERIC_4"
+0x15 = "KEY_NUMERIC_5"
+0x16 = "KEY_NUMERIC_6"
+0x17 = "KEY_NUMERIC_7"
+0x18 = "KEY_NUMERIC_8"
+0x19 = "KEY_NUMERIC_9"
+0x10 = "KEY_NUMERIC_0"
 0x1c = "KEY_CHANNELUP"
 0x0f = "KEY_CHANNELDOWN"
 0x1a = "KEY_VOLUMEUP"
diff --git a/utils/keytable/rc_keymaps/dntv_live_dvb_t.toml b/utils/keytable/rc_keymaps/dntv_live_dvb_t.toml
index e8bea794..ad730ebe 100644
--- a/utils/keytable/rc_keymaps/dntv_live_dvb_t.toml
+++ b/utils/keytable/rc_keymaps/dntv_live_dvb_t.toml
@@ -1,18 +1,22 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-dntv-live-dvb-t.c as a source file
 [[protocols]]
 name = "dntv_live_dvb_t"
 protocol = "unknown"
 [protocols.scancodes]
 0x00 = "KEY_ESC"
-0x0a = "KEY_0"
-0x01 = "KEY_1"
-0x02 = "KEY_2"
-0x03 = "KEY_3"
-0x04 = "KEY_4"
-0x05 = "KEY_5"
-0x06 = "KEY_6"
-0x07 = "KEY_7"
-0x08 = "KEY_8"
-0x09 = "KEY_9"
+0x0a = "KEY_NUMERIC_0"
+0x01 = "KEY_NUMERIC_1"
+0x02 = "KEY_NUMERIC_2"
+0x03 = "KEY_NUMERIC_3"
+0x04 = "KEY_NUMERIC_4"
+0x05 = "KEY_NUMERIC_5"
+0x06 = "KEY_NUMERIC_6"
+0x07 = "KEY_NUMERIC_7"
+0x08 = "KEY_NUMERIC_8"
+0x09 = "KEY_NUMERIC_9"
 0x0b = "KEY_TUNER"
 0x0c = "KEY_SEARCH"
 0x0d = "KEY_STOP"
diff --git a/utils/keytable/rc_keymaps/dntv_live_dvbt_pro.toml b/utils/keytable/rc_keymaps/dntv_live_dvbt_pro.toml
index 2dfee5e6..d33017b2 100644
--- a/utils/keytable/rc_keymaps/dntv_live_dvbt_pro.toml
+++ b/utils/keytable/rc_keymaps/dntv_live_dvbt_pro.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-dntv-live-dvbt-pro.c as a source file
 [[protocols]]
 name = "dntv_live_dvbt_pro"
 protocol = "unknown"
@@ -8,17 +12,17 @@ protocol = "unknown"
 0x58 = "KEY_TUNER"
 0x5a = "KEY_RADIO"
 0x59 = "KEY_DVD"
-0x03 = "KEY_1"
-0x01 = "KEY_2"
-0x06 = "KEY_3"
-0x09 = "KEY_4"
-0x1d = "KEY_5"
-0x1f = "KEY_6"
-0x0d = "KEY_7"
-0x19 = "KEY_8"
-0x1b = "KEY_9"
+0x03 = "KEY_NUMERIC_1"
+0x01 = "KEY_NUMERIC_2"
+0x06 = "KEY_NUMERIC_3"
+0x09 = "KEY_NUMERIC_4"
+0x1d = "KEY_NUMERIC_5"
+0x1f = "KEY_NUMERIC_6"
+0x0d = "KEY_NUMERIC_7"
+0x19 = "KEY_NUMERIC_8"
+0x1b = "KEY_NUMERIC_9"
 0x0c = "KEY_CANCEL"
-0x15 = "KEY_0"
+0x15 = "KEY_NUMERIC_0"
 0x4a = "KEY_CLEAR"
 0x13 = "KEY_BACK"
 0x00 = "KEY_TAB"
diff --git a/utils/keytable/rc_keymaps/dtt200u.toml b/utils/keytable/rc_keymaps/dtt200u.toml
index 7a7b119c..86ffc4e1 100644
--- a/utils/keytable/rc_keymaps/dtt200u.toml
+++ b/utils/keytable/rc_keymaps/dtt200u.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-dtt200u.c as a source file
 [[protocols]]
 name = "dtt200u"
 protocol = "nec"
@@ -6,18 +10,18 @@ variant = "nec"
 0x8001 = "KEY_MUTE"
 0x8002 = "KEY_CHANNELDOWN"
 0x8003 = "KEY_VOLUMEDOWN"
-0x8004 = "KEY_1"
-0x8005 = "KEY_2"
-0x8006 = "KEY_3"
-0x8007 = "KEY_4"
-0x8008 = "KEY_5"
-0x8009 = "KEY_6"
-0x800a = "KEY_7"
+0x8004 = "KEY_NUMERIC_1"
+0x8005 = "KEY_NUMERIC_2"
+0x8006 = "KEY_NUMERIC_3"
+0x8007 = "KEY_NUMERIC_4"
+0x8008 = "KEY_NUMERIC_5"
+0x8009 = "KEY_NUMERIC_6"
+0x800a = "KEY_NUMERIC_7"
 0x800c = "KEY_ZOOM"
-0x800d = "KEY_0"
+0x800d = "KEY_NUMERIC_0"
 0x800e = "KEY_SELECT"
 0x8012 = "KEY_POWER"
 0x801a = "KEY_CHANNELUP"
-0x801b = "KEY_8"
+0x801b = "KEY_NUMERIC_8"
 0x801e = "KEY_VOLUMEUP"
-0x801f = "KEY_9"
+0x801f = "KEY_NUMERIC_9"
diff --git a/utils/keytable/rc_keymaps/dvbsky.toml b/utils/keytable/rc_keymaps/dvbsky.toml
index 7762cf35..7399afa2 100644
--- a/utils/keytable/rc_keymaps/dvbsky.toml
+++ b/utils/keytable/rc_keymaps/dvbsky.toml
@@ -1,18 +1,22 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-dvbsky.c as a source file
 [[protocols]]
 name = "dvbsky"
 protocol = "rc5"
 variant = "rc5"
 [protocols.scancodes]
-0x0000 = "KEY_0"
-0x0001 = "KEY_1"
-0x0002 = "KEY_2"
-0x0003 = "KEY_3"
-0x0004 = "KEY_4"
-0x0005 = "KEY_5"
-0x0006 = "KEY_6"
-0x0007 = "KEY_7"
-0x0008 = "KEY_8"
-0x0009 = "KEY_9"
+0x0000 = "KEY_NUMERIC_0"
+0x0001 = "KEY_NUMERIC_1"
+0x0002 = "KEY_NUMERIC_2"
+0x0003 = "KEY_NUMERIC_3"
+0x0004 = "KEY_NUMERIC_4"
+0x0005 = "KEY_NUMERIC_5"
+0x0006 = "KEY_NUMERIC_6"
+0x0007 = "KEY_NUMERIC_7"
+0x0008 = "KEY_NUMERIC_8"
+0x0009 = "KEY_NUMERIC_9"
 0x000a = "KEY_MUTE"
 0x000d = "KEY_OK"
 0x000b = "KEY_STOP"
diff --git a/utils/keytable/rc_keymaps/dvico_mce.toml b/utils/keytable/rc_keymaps/dvico_mce.toml
index 94ca0e1a..68b90168 100644
--- a/utils/keytable/rc_keymaps/dvico_mce.toml
+++ b/utils/keytable/rc_keymaps/dvico_mce.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-dvico-mce.c as a source file
 [[protocols]]
 name = "dvico_mce"
 protocol = "nec"
@@ -29,17 +33,17 @@ variant = "nec"
 0x0152 = "KEY_CAMERA"
 0x015a = "KEY_TUNER"
 0x0119 = "KEY_OPEN"
-0x010b = "KEY_1"
-0x0117 = "KEY_2"
-0x011b = "KEY_3"
-0x0107 = "KEY_4"
-0x0150 = "KEY_5"
-0x0154 = "KEY_6"
-0x0148 = "KEY_7"
-0x014c = "KEY_8"
-0x0158 = "KEY_9"
+0x010b = "KEY_NUMERIC_1"
+0x0117 = "KEY_NUMERIC_2"
+0x011b = "KEY_NUMERIC_3"
+0x0107 = "KEY_NUMERIC_4"
+0x0150 = "KEY_NUMERIC_5"
+0x0154 = "KEY_NUMERIC_6"
+0x0148 = "KEY_NUMERIC_7"
+0x014c = "KEY_NUMERIC_8"
+0x0158 = "KEY_NUMERIC_9"
 0x0113 = "KEY_ANGLE"
-0x0103 = "KEY_0"
+0x0103 = "KEY_NUMERIC_0"
 0x011f = "KEY_ZOOM"
 0x0143 = "KEY_REWIND"
 0x0147 = "KEY_PLAYPAUSE"
diff --git a/utils/keytable/rc_keymaps/dvico_portable.toml b/utils/keytable/rc_keymaps/dvico_portable.toml
index 7d6ce62f..de1d1152 100644
--- a/utils/keytable/rc_keymaps/dvico_portable.toml
+++ b/utils/keytable/rc_keymaps/dvico_portable.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-dvico-portable.c as a source file
 [[protocols]]
 name = "dvico_portable"
 protocol = "nec"
@@ -18,17 +22,17 @@ variant = "nec"
 0x0316 = "KEY_CAMERA"
 0x0340 = "KEY_TUNER"
 0x0345 = "KEY_OPEN"
-0x0319 = "KEY_1"
-0x0318 = "KEY_2"
-0x031b = "KEY_3"
-0x031a = "KEY_4"
-0x0358 = "KEY_5"
-0x0359 = "KEY_6"
-0x0315 = "KEY_7"
-0x0314 = "KEY_8"
-0x0317 = "KEY_9"
+0x0319 = "KEY_NUMERIC_1"
+0x0318 = "KEY_NUMERIC_2"
+0x031b = "KEY_NUMERIC_3"
+0x031a = "KEY_NUMERIC_4"
+0x0358 = "KEY_NUMERIC_5"
+0x0359 = "KEY_NUMERIC_6"
+0x0315 = "KEY_NUMERIC_7"
+0x0314 = "KEY_NUMERIC_8"
+0x0317 = "KEY_NUMERIC_9"
 0x0344 = "KEY_ANGLE"
-0x0355 = "KEY_0"
+0x0355 = "KEY_NUMERIC_0"
 0x0307 = "KEY_ZOOM"
 0x030a = "KEY_REWIND"
 0x0308 = "KEY_PLAYPAUSE"
diff --git a/utils/keytable/rc_keymaps/em_terratec.toml b/utils/keytable/rc_keymaps/em_terratec.toml
index 66500bd7..129fca93 100644
--- a/utils/keytable/rc_keymaps/em_terratec.toml
+++ b/utils/keytable/rc_keymaps/em_terratec.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-em-terratec.c as a source file
 [[protocols]]
 name = "em_terratec"
 protocol = "unknown"
@@ -6,19 +10,19 @@ protocol = "unknown"
 0x02 = "KEY_SELECT"
 0x03 = "KEY_MUTE"
 0x04 = "KEY_POWER"
-0x05 = "KEY_1"
-0x06 = "KEY_2"
-0x07 = "KEY_3"
+0x05 = "KEY_NUMERIC_1"
+0x06 = "KEY_NUMERIC_2"
+0x07 = "KEY_NUMERIC_3"
 0x08 = "KEY_CHANNELUP"
-0x09 = "KEY_4"
-0x0a = "KEY_5"
-0x0b = "KEY_6"
+0x09 = "KEY_NUMERIC_4"
+0x0a = "KEY_NUMERIC_5"
+0x0b = "KEY_NUMERIC_6"
 0x0c = "KEY_CHANNELDOWN"
-0x0d = "KEY_7"
-0x0e = "KEY_8"
-0x0f = "KEY_9"
+0x0d = "KEY_NUMERIC_7"
+0x0e = "KEY_NUMERIC_8"
+0x0f = "KEY_NUMERIC_9"
 0x10 = "KEY_VOLUMEUP"
-0x11 = "KEY_0"
+0x11 = "KEY_NUMERIC_0"
 0x12 = "KEY_MENU"
 0x13 = "KEY_PRINT"
 0x14 = "KEY_VOLUMEDOWN"
diff --git a/utils/keytable/rc_keymaps/encore_enltv.toml b/utils/keytable/rc_keymaps/encore_enltv.toml
index a81bdbe7..c82c17f3 100644
--- a/utils/keytable/rc_keymaps/encore_enltv.toml
+++ b/utils/keytable/rc_keymaps/encore_enltv.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-encore-enltv.c as a source file
 [[protocols]]
 name = "encore_enltv"
 protocol = "unknown"
@@ -7,16 +11,16 @@ protocol = "unknown"
 0x00 = "KEY_VIDEO"
 0x01 = "KEY_AUDIO"
 0x02 = "KEY_CAMERA"
-0x1f = "KEY_1"
-0x03 = "KEY_2"
-0x04 = "KEY_3"
-0x05 = "KEY_4"
-0x1c = "KEY_5"
-0x06 = "KEY_6"
-0x07 = "KEY_7"
-0x08 = "KEY_8"
-0x1d = "KEY_9"
-0x0a = "KEY_0"
+0x1f = "KEY_NUMERIC_1"
+0x03 = "KEY_NUMERIC_2"
+0x04 = "KEY_NUMERIC_3"
+0x05 = "KEY_NUMERIC_4"
+0x1c = "KEY_NUMERIC_5"
+0x06 = "KEY_NUMERIC_6"
+0x07 = "KEY_NUMERIC_7"
+0x08 = "KEY_NUMERIC_8"
+0x1d = "KEY_NUMERIC_9"
+0x0a = "KEY_NUMERIC_0"
 0x09 = "KEY_LIST"
 0x0b = "KEY_LAST"
 0x14 = "KEY_HOME"
diff --git a/utils/keytable/rc_keymaps/encore_enltv2.toml b/utils/keytable/rc_keymaps/encore_enltv2.toml
index 99454b6e..b5ad1605 100644
--- a/utils/keytable/rc_keymaps/encore_enltv2.toml
+++ b/utils/keytable/rc_keymaps/encore_enltv2.toml
@@ -1,19 +1,23 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-encore-enltv2.c as a source file
 [[protocols]]
 name = "encore_enltv2"
 protocol = "unknown"
 [protocols.scancodes]
 0x4c = "KEY_POWER2"
 0x4a = "KEY_TUNER"
-0x40 = "KEY_1"
-0x60 = "KEY_2"
-0x50 = "KEY_3"
-0x70 = "KEY_4"
-0x48 = "KEY_5"
-0x68 = "KEY_6"
-0x58 = "KEY_7"
-0x78 = "KEY_8"
-0x44 = "KEY_9"
-0x54 = "KEY_0"
+0x40 = "KEY_NUMERIC_1"
+0x60 = "KEY_NUMERIC_2"
+0x50 = "KEY_NUMERIC_3"
+0x70 = "KEY_NUMERIC_4"
+0x48 = "KEY_NUMERIC_5"
+0x68 = "KEY_NUMERIC_6"
+0x58 = "KEY_NUMERIC_7"
+0x78 = "KEY_NUMERIC_8"
+0x44 = "KEY_NUMERIC_9"
+0x54 = "KEY_NUMERIC_0"
 0x64 = "KEY_LAST"
 0x4e = "KEY_AGAIN"
 0x6c = "KEY_VIDEO"
diff --git a/utils/keytable/rc_keymaps/encore_enltv_fm53.toml b/utils/keytable/rc_keymaps/encore_enltv_fm53.toml
index 5c246a69..4b4c30bf 100644
--- a/utils/keytable/rc_keymaps/encore_enltv_fm53.toml
+++ b/utils/keytable/rc_keymaps/encore_enltv_fm53.toml
@@ -1,19 +1,23 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-encore-enltv-fm53.c as a source file
 [[protocols]]
 name = "encore_enltv_fm53"
 protocol = "unknown"
 [protocols.scancodes]
 0x10 = "KEY_POWER2"
 0x06 = "KEY_MUTE"
-0x09 = "KEY_1"
-0x1d = "KEY_2"
-0x1f = "KEY_3"
-0x19 = "KEY_4"
-0x1b = "KEY_5"
-0x11 = "KEY_6"
-0x17 = "KEY_7"
-0x12 = "KEY_8"
-0x16 = "KEY_9"
-0x48 = "KEY_0"
+0x09 = "KEY_NUMERIC_1"
+0x1d = "KEY_NUMERIC_2"
+0x1f = "KEY_NUMERIC_3"
+0x19 = "KEY_NUMERIC_4"
+0x1b = "KEY_NUMERIC_5"
+0x11 = "KEY_NUMERIC_6"
+0x17 = "KEY_NUMERIC_7"
+0x12 = "KEY_NUMERIC_8"
+0x16 = "KEY_NUMERIC_9"
+0x48 = "KEY_NUMERIC_0"
 0x04 = "KEY_LIST"
 0x40 = "KEY_LAST"
 0x02 = "KEY_MODE"
diff --git a/utils/keytable/rc_keymaps/evga_indtube.toml b/utils/keytable/rc_keymaps/evga_indtube.toml
index cf639278..217be4d3 100644
--- a/utils/keytable/rc_keymaps/evga_indtube.toml
+++ b/utils/keytable/rc_keymaps/evga_indtube.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-evga-indtube.c as a source file
 [[protocols]]
 name = "evga_indtube"
 protocol = "unknown"
diff --git a/utils/keytable/rc_keymaps/eztv.toml b/utils/keytable/rc_keymaps/eztv.toml
index 2bda0fb5..e2cb3789 100644
--- a/utils/keytable/rc_keymaps/eztv.toml
+++ b/utils/keytable/rc_keymaps/eztv.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-eztv.c as a source file
 [[protocols]]
 name = "eztv"
 protocol = "unknown"
@@ -30,16 +34,16 @@ protocol = "unknown"
 0x2c = "KEY_STOP"
 0x2d = "KEY_PLAY"
 0x2e = "KEY_CAMERA"
-0x00 = "KEY_0"
-0x05 = "KEY_1"
-0x06 = "KEY_2"
-0x07 = "KEY_3"
-0x09 = "KEY_4"
-0x0a = "KEY_5"
-0x0b = "KEY_6"
-0x0d = "KEY_7"
-0x0e = "KEY_8"
-0x0f = "KEY_9"
+0x00 = "KEY_NUMERIC_0"
+0x05 = "KEY_NUMERIC_1"
+0x06 = "KEY_NUMERIC_2"
+0x07 = "KEY_NUMERIC_3"
+0x09 = "KEY_NUMERIC_4"
+0x0a = "KEY_NUMERIC_5"
+0x0b = "KEY_NUMERIC_6"
+0x0d = "KEY_NUMERIC_7"
+0x0e = "KEY_NUMERIC_8"
+0x0f = "KEY_NUMERIC_9"
 0x2a = "KEY_VOLUMEUP"
 0x11 = "KEY_VOLUMEDOWN"
 0x18 = "KEY_CHANNELUP"
diff --git a/utils/keytable/rc_keymaps/flydvb.toml b/utils/keytable/rc_keymaps/flydvb.toml
index 3a22fb62..ad031c00 100644
--- a/utils/keytable/rc_keymaps/flydvb.toml
+++ b/utils/keytable/rc_keymaps/flydvb.toml
@@ -1,20 +1,24 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-flydvb.c as a source file
 [[protocols]]
 name = "flydvb"
 protocol = "unknown"
 [protocols.scancodes]
 0x01 = "KEY_ZOOM"
 0x00 = "KEY_POWER"
-0x03 = "KEY_1"
-0x04 = "KEY_2"
-0x05 = "KEY_3"
-0x07 = "KEY_4"
-0x08 = "KEY_5"
-0x09 = "KEY_6"
-0x0b = "KEY_7"
-0x0c = "KEY_8"
-0x0d = "KEY_9"
+0x03 = "KEY_NUMERIC_1"
+0x04 = "KEY_NUMERIC_2"
+0x05 = "KEY_NUMERIC_3"
+0x07 = "KEY_NUMERIC_4"
+0x08 = "KEY_NUMERIC_5"
+0x09 = "KEY_NUMERIC_6"
+0x0b = "KEY_NUMERIC_7"
+0x0c = "KEY_NUMERIC_8"
+0x0d = "KEY_NUMERIC_9"
 0x06 = "KEY_AGAIN"
-0x0f = "KEY_0"
+0x0f = "KEY_NUMERIC_0"
 0x10 = "KEY_MUTE"
 0x02 = "KEY_RADIO"
 0x1b = "KEY_LANGUAGE"
diff --git a/utils/keytable/rc_keymaps/flyvideo.toml b/utils/keytable/rc_keymaps/flyvideo.toml
index 56fe688d..8648f5fa 100644
--- a/utils/keytable/rc_keymaps/flyvideo.toml
+++ b/utils/keytable/rc_keymaps/flyvideo.toml
@@ -1,17 +1,21 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-flyvideo.c as a source file
 [[protocols]]
 name = "flyvideo"
 protocol = "unknown"
 [protocols.scancodes]
-0x0f = "KEY_0"
-0x03 = "KEY_1"
-0x04 = "KEY_2"
-0x05 = "KEY_3"
-0x07 = "KEY_4"
-0x08 = "KEY_5"
-0x09 = "KEY_6"
-0x0b = "KEY_7"
-0x0c = "KEY_8"
-0x0d = "KEY_9"
+0x0f = "KEY_NUMERIC_0"
+0x03 = "KEY_NUMERIC_1"
+0x04 = "KEY_NUMERIC_2"
+0x05 = "KEY_NUMERIC_3"
+0x07 = "KEY_NUMERIC_4"
+0x08 = "KEY_NUMERIC_5"
+0x09 = "KEY_NUMERIC_6"
+0x0b = "KEY_NUMERIC_7"
+0x0c = "KEY_NUMERIC_8"
+0x0d = "KEY_NUMERIC_9"
 0x0e = "KEY_MODE"
 0x11 = "KEY_VIDEO"
 0x15 = "KEY_AUDIO"
diff --git a/utils/keytable/rc_keymaps/fusionhdtv_mce.toml b/utils/keytable/rc_keymaps/fusionhdtv_mce.toml
index 5187aeb5..f75123fd 100644
--- a/utils/keytable/rc_keymaps/fusionhdtv_mce.toml
+++ b/utils/keytable/rc_keymaps/fusionhdtv_mce.toml
@@ -1,17 +1,21 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-fusionhdtv-mce.c as a source file
 [[protocols]]
 name = "fusionhdtv_mce"
 protocol = "unknown"
 [protocols.scancodes]
-0x0b = "KEY_1"
-0x17 = "KEY_2"
-0x1b = "KEY_3"
-0x07 = "KEY_4"
-0x50 = "KEY_5"
-0x54 = "KEY_6"
-0x48 = "KEY_7"
-0x4c = "KEY_8"
-0x58 = "KEY_9"
-0x03 = "KEY_0"
+0x0b = "KEY_NUMERIC_1"
+0x17 = "KEY_NUMERIC_2"
+0x1b = "KEY_NUMERIC_3"
+0x07 = "KEY_NUMERIC_4"
+0x50 = "KEY_NUMERIC_5"
+0x54 = "KEY_NUMERIC_6"
+0x48 = "KEY_NUMERIC_7"
+0x4c = "KEY_NUMERIC_8"
+0x58 = "KEY_NUMERIC_9"
+0x03 = "KEY_NUMERIC_0"
 0x5e = "KEY_OK"
 0x51 = "KEY_UP"
 0x53 = "KEY_DOWN"
diff --git a/utils/keytable/rc_keymaps/gadmei_rm008z.toml b/utils/keytable/rc_keymaps/gadmei_rm008z.toml
index a485e8fd..cd366864 100644
--- a/utils/keytable/rc_keymaps/gadmei_rm008z.toml
+++ b/utils/keytable/rc_keymaps/gadmei_rm008z.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-gadmei-rm008z.c as a source file
 [[protocols]]
 name = "gadmei_rm008z"
 protocol = "unknown"
@@ -8,16 +12,16 @@ protocol = "unknown"
 0x0e = "KEY_VIDEO"
 0x0b = "KEY_AUDIO"
 0x0f = "KEY_RADIO"
-0x00 = "KEY_1"
-0x01 = "KEY_2"
-0x02 = "KEY_3"
-0x03 = "KEY_4"
-0x04 = "KEY_5"
-0x05 = "KEY_6"
-0x06 = "KEY_7"
-0x07 = "KEY_8"
-0x08 = "KEY_9"
-0x09 = "KEY_0"
+0x00 = "KEY_NUMERIC_1"
+0x01 = "KEY_NUMERIC_2"
+0x02 = "KEY_NUMERIC_3"
+0x03 = "KEY_NUMERIC_4"
+0x04 = "KEY_NUMERIC_5"
+0x05 = "KEY_NUMERIC_6"
+0x06 = "KEY_NUMERIC_7"
+0x07 = "KEY_NUMERIC_8"
+0x08 = "KEY_NUMERIC_9"
+0x09 = "KEY_NUMERIC_0"
 0x0a = "KEY_INFO"
 0x1c = "KEY_BACKSPACE"
 0x0d = "KEY_PLAY"
diff --git a/utils/keytable/rc_keymaps/geekbox.toml b/utils/keytable/rc_keymaps/geekbox.toml
index 5fb5b877..98866919 100644
--- a/utils/keytable/rc_keymaps/geekbox.toml
+++ b/utils/keytable/rc_keymaps/geekbox.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-geekbox.c as a source file
 [[protocols]]
 name = "geekbox"
 protocol = "nec"
diff --git a/utils/keytable/rc_keymaps/genius_tvgo_a11mce.toml b/utils/keytable/rc_keymaps/genius_tvgo_a11mce.toml
index 1c9fc5e9..020d3b88 100644
--- a/utils/keytable/rc_keymaps/genius_tvgo_a11mce.toml
+++ b/utils/keytable/rc_keymaps/genius_tvgo_a11mce.toml
@@ -1,17 +1,21 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-genius-tvgo-a11mce.c as a source file
 [[protocols]]
 name = "genius_tvgo_a11mce"
 protocol = "unknown"
 [protocols.scancodes]
-0x48 = "KEY_0"
-0x09 = "KEY_1"
-0x1d = "KEY_2"
-0x1f = "KEY_3"
-0x19 = "KEY_4"
-0x1b = "KEY_5"
-0x11 = "KEY_6"
-0x17 = "KEY_7"
-0x12 = "KEY_8"
-0x16 = "KEY_9"
+0x48 = "KEY_NUMERIC_0"
+0x09 = "KEY_NUMERIC_1"
+0x1d = "KEY_NUMERIC_2"
+0x1f = "KEY_NUMERIC_3"
+0x19 = "KEY_NUMERIC_4"
+0x1b = "KEY_NUMERIC_5"
+0x11 = "KEY_NUMERIC_6"
+0x17 = "KEY_NUMERIC_7"
+0x12 = "KEY_NUMERIC_8"
+0x16 = "KEY_NUMERIC_9"
 0x54 = "KEY_RECORD"
 0x06 = "KEY_MUTE"
 0x10 = "KEY_POWER"
diff --git a/utils/keytable/rc_keymaps/gotview7135.toml b/utils/keytable/rc_keymaps/gotview7135.toml
index 4a309af6..a8e31190 100644
--- a/utils/keytable/rc_keymaps/gotview7135.toml
+++ b/utils/keytable/rc_keymaps/gotview7135.toml
@@ -1,19 +1,23 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-gotview7135.c as a source file
 [[protocols]]
 name = "gotview7135"
 protocol = "unknown"
 [protocols.scancodes]
 0x11 = "KEY_POWER"
 0x35 = "KEY_TV"
-0x1b = "KEY_0"
-0x29 = "KEY_1"
-0x19 = "KEY_2"
-0x39 = "KEY_3"
-0x1f = "KEY_4"
-0x2c = "KEY_5"
-0x21 = "KEY_6"
-0x24 = "KEY_7"
-0x18 = "KEY_8"
-0x2b = "KEY_9"
+0x1b = "KEY_NUMERIC_0"
+0x29 = "KEY_NUMERIC_1"
+0x19 = "KEY_NUMERIC_2"
+0x39 = "KEY_NUMERIC_3"
+0x1f = "KEY_NUMERIC_4"
+0x2c = "KEY_NUMERIC_5"
+0x21 = "KEY_NUMERIC_6"
+0x24 = "KEY_NUMERIC_7"
+0x18 = "KEY_NUMERIC_8"
+0x2b = "KEY_NUMERIC_9"
 0x3b = "KEY_AGAIN"
 0x06 = "KEY_AUDIO"
 0x31 = "KEY_PRINT"
diff --git a/utils/keytable/rc_keymaps/haupp.toml b/utils/keytable/rc_keymaps/haupp.toml
index 318277a6..1c49cb99 100644
--- a/utils/keytable/rc_keymaps/haupp.toml
+++ b/utils/keytable/rc_keymaps/haupp.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/usb/dvb-usb/nova-t-usb2.c as a source file
 [[protocols]]
 name = "haupp"
 protocol = "unknown"
diff --git a/utils/keytable/rc_keymaps/hauppauge.toml b/utils/keytable/rc_keymaps/hauppauge.toml
index e6d28df6..13dfd799 100644
--- a/utils/keytable/rc_keymaps/hauppauge.toml
+++ b/utils/keytable/rc_keymaps/hauppauge.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-hauppauge.c as a source file
 [[protocols]]
 name = "hauppauge"
 protocol = "rc5"
@@ -32,17 +36,17 @@ variant = "rc5"
 0x1e24 = "KEY_PREVIOUSSONG"
 0x1e30 = "KEY_PAUSE"
 0x1e1e = "KEY_NEXTSONG"
-0x1e01 = "KEY_1"
-0x1e02 = "KEY_2"
-0x1e03 = "KEY_3"
-0x1e04 = "KEY_4"
-0x1e05 = "KEY_5"
-0x1e06 = "KEY_6"
-0x1e07 = "KEY_7"
-0x1e08 = "KEY_8"
-0x1e09 = "KEY_9"
+0x1e01 = "KEY_NUMERIC_1"
+0x1e02 = "KEY_NUMERIC_2"
+0x1e03 = "KEY_NUMERIC_3"
+0x1e04 = "KEY_NUMERIC_4"
+0x1e05 = "KEY_NUMERIC_5"
+0x1e06 = "KEY_NUMERIC_6"
+0x1e07 = "KEY_NUMERIC_7"
+0x1e08 = "KEY_NUMERIC_8"
+0x1e09 = "KEY_NUMERIC_9"
 0x1e0a = "KEY_TEXT"
-0x1e00 = "KEY_0"
+0x1e00 = "KEY_NUMERIC_0"
 0x1e0e = "KEY_SUBTITLE"
 0x1e0b = "KEY_RED"
 0x1e2e = "KEY_GREEN"
@@ -50,16 +54,16 @@ variant = "rc5"
 0x1e29 = "KEY_BLUE"
 0x1f3d = "KEY_POWER2"
 0x1f3b = "KEY_SELECT"
-0x1f00 = "KEY_0"
-0x1f01 = "KEY_1"
-0x1f02 = "KEY_2"
-0x1f03 = "KEY_3"
-0x1f04 = "KEY_4"
-0x1f05 = "KEY_5"
-0x1f06 = "KEY_6"
-0x1f07 = "KEY_7"
-0x1f08 = "KEY_8"
-0x1f09 = "KEY_9"
+0x1f00 = "KEY_NUMERIC_0"
+0x1f01 = "KEY_NUMERIC_1"
+0x1f02 = "KEY_NUMERIC_2"
+0x1f03 = "KEY_NUMERIC_3"
+0x1f04 = "KEY_NUMERIC_4"
+0x1f05 = "KEY_NUMERIC_5"
+0x1f06 = "KEY_NUMERIC_6"
+0x1f07 = "KEY_NUMERIC_7"
+0x1f08 = "KEY_NUMERIC_8"
+0x1f09 = "KEY_NUMERIC_9"
 0x1f1f = "KEY_EXIT"
 0x1f0d = "KEY_MENU"
 0x1f10 = "KEY_VOLUMEUP"
@@ -82,16 +86,16 @@ variant = "rc5"
 0x1f30 = "KEY_PAUSE"
 0x1f24 = "KEY_PREVIOUSSONG"
 0x1f1e = "KEY_NEXTSONG"
-0x1d00 = "KEY_0"
-0x1d01 = "KEY_1"
-0x1d02 = "KEY_2"
-0x1d03 = "KEY_3"
-0x1d04 = "KEY_4"
-0x1d05 = "KEY_5"
-0x1d06 = "KEY_6"
-0x1d07 = "KEY_7"
-0x1d08 = "KEY_8"
-0x1d09 = "KEY_9"
+0x1d00 = "KEY_NUMERIC_0"
+0x1d01 = "KEY_NUMERIC_1"
+0x1d02 = "KEY_NUMERIC_2"
+0x1d03 = "KEY_NUMERIC_3"
+0x1d04 = "KEY_NUMERIC_4"
+0x1d05 = "KEY_NUMERIC_5"
+0x1d06 = "KEY_NUMERIC_6"
+0x1d07 = "KEY_NUMERIC_7"
+0x1d08 = "KEY_NUMERIC_8"
+0x1d09 = "KEY_NUMERIC_9"
 0x1d0a = "KEY_TEXT"
 0x1d0d = "KEY_MENU"
 0x1d0f = "KEY_MUTE"
@@ -125,16 +129,16 @@ variant = "rc5"
 0x1c16 = "KEY_LEFT"
 0x1c17 = "KEY_RIGHT"
 0x1c25 = "KEY_OK"
-0x1c00 = "KEY_0"
-0x1c01 = "KEY_1"
-0x1c02 = "KEY_2"
-0x1c03 = "KEY_3"
-0x1c04 = "KEY_4"
-0x1c05 = "KEY_5"
-0x1c06 = "KEY_6"
-0x1c07 = "KEY_7"
-0x1c08 = "KEY_8"
-0x1c09 = "KEY_9"
+0x1c00 = "KEY_NUMERIC_0"
+0x1c01 = "KEY_NUMERIC_1"
+0x1c02 = "KEY_NUMERIC_2"
+0x1c03 = "KEY_NUMERIC_3"
+0x1c04 = "KEY_NUMERIC_4"
+0x1c05 = "KEY_NUMERIC_5"
+0x1c06 = "KEY_NUMERIC_6"
+0x1c07 = "KEY_NUMERIC_7"
+0x1c08 = "KEY_NUMERIC_8"
+0x1c09 = "KEY_NUMERIC_9"
 0x1c1f = "KEY_EXIT"
 0x1c0d = "KEY_MENU"
 0x1c1c = "KEY_TV"
@@ -163,15 +167,15 @@ variant = "rc5"
 0x000d = "KEY_MUTE"
 0x0021 = "KEY_CHANNELDOWN"
 0x0022 = "KEY_VIDEO"
-0x0001 = "KEY_1"
-0x0002 = "KEY_2"
-0x0003 = "KEY_3"
-0x0004 = "KEY_4"
-0x0005 = "KEY_5"
-0x0006 = "KEY_6"
-0x0007 = "KEY_7"
-0x0008 = "KEY_8"
-0x0009 = "KEY_9"
+0x0001 = "KEY_NUMERIC_1"
+0x0002 = "KEY_NUMERIC_2"
+0x0003 = "KEY_NUMERIC_3"
+0x0004 = "KEY_NUMERIC_4"
+0x0005 = "KEY_NUMERIC_5"
+0x0006 = "KEY_NUMERIC_6"
+0x0007 = "KEY_NUMERIC_7"
+0x0008 = "KEY_NUMERIC_8"
+0x0009 = "KEY_NUMERIC_9"
 0x001e = "KEY_RED"
-0x0000 = "KEY_0"
+0x0000 = "KEY_NUMERIC_0"
 0x0026 = "KEY_SLEEP"
diff --git a/utils/keytable/rc_keymaps/hisi_poplar.toml b/utils/keytable/rc_keymaps/hisi_poplar.toml
index 7e540b21..228f07fc 100644
--- a/utils/keytable/rc_keymaps/hisi_poplar.toml
+++ b/utils/keytable/rc_keymaps/hisi_poplar.toml
@@ -1,18 +1,22 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-hisi-poplar.c as a source file
 [[protocols]]
 name = "hisi_poplar"
 protocol = "nec"
 variant = "nec"
 [protocols.scancodes]
-0x0000b292 = "KEY_1"
-0x0000b293 = "KEY_2"
-0x0000b2cc = "KEY_3"
-0x0000b28e = "KEY_4"
-0x0000b28f = "KEY_5"
-0x0000b2c8 = "KEY_6"
-0x0000b28a = "KEY_7"
-0x0000b28b = "KEY_8"
-0x0000b2c4 = "KEY_9"
-0x0000b287 = "KEY_0"
+0x0000b292 = "KEY_NUMERIC_1"
+0x0000b293 = "KEY_NUMERIC_2"
+0x0000b2cc = "KEY_NUMERIC_3"
+0x0000b28e = "KEY_NUMERIC_4"
+0x0000b28f = "KEY_NUMERIC_5"
+0x0000b2c8 = "KEY_NUMERIC_6"
+0x0000b28a = "KEY_NUMERIC_7"
+0x0000b28b = "KEY_NUMERIC_8"
+0x0000b2c4 = "KEY_NUMERIC_9"
+0x0000b287 = "KEY_NUMERIC_0"
 0x0000b282 = "KEY_HOMEPAGE"
 0x0000b2ca = "KEY_UP"
 0x0000b299 = "KEY_LEFT"
diff --git a/utils/keytable/rc_keymaps/hisi_tv_demo.toml b/utils/keytable/rc_keymaps/hisi_tv_demo.toml
index 198bc50c..a787b239 100644
--- a/utils/keytable/rc_keymaps/hisi_tv_demo.toml
+++ b/utils/keytable/rc_keymaps/hisi_tv_demo.toml
@@ -1,18 +1,22 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-hisi-tv-demo.c as a source file
 [[protocols]]
 name = "hisi_tv_demo"
 protocol = "nec"
 variant = "nec"
 [protocols.scancodes]
-0x00000092 = "KEY_1"
-0x00000093 = "KEY_2"
-0x000000cc = "KEY_3"
-0x0000009f = "KEY_4"
-0x0000008e = "KEY_5"
-0x0000008f = "KEY_6"
-0x000000c8 = "KEY_7"
-0x00000094 = "KEY_8"
-0x0000008a = "KEY_9"
-0x0000008b = "KEY_0"
+0x00000092 = "KEY_NUMERIC_1"
+0x00000093 = "KEY_NUMERIC_2"
+0x000000cc = "KEY_NUMERIC_3"
+0x0000009f = "KEY_NUMERIC_4"
+0x0000008e = "KEY_NUMERIC_5"
+0x0000008f = "KEY_NUMERIC_6"
+0x000000c8 = "KEY_NUMERIC_7"
+0x00000094 = "KEY_NUMERIC_8"
+0x0000008a = "KEY_NUMERIC_9"
+0x0000008b = "KEY_NUMERIC_0"
 0x000000ce = "KEY_ENTER"
 0x000000ca = "KEY_UP"
 0x00000099 = "KEY_LEFT"
diff --git a/utils/keytable/rc_keymaps/imon_mce.toml b/utils/keytable/rc_keymaps/imon_mce.toml
index 4f482ed5..8378d671 100644
--- a/utils/keytable/rc_keymaps/imon_mce.toml
+++ b/utils/keytable/rc_keymaps/imon_mce.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-imon-mce.c as a source file
 [[protocols]]
 name = "imon_mce"
 protocol = "rc6"
@@ -21,7 +25,6 @@ variant = "rc6_mce"
 0x800ff421 = "KEY_RIGHT"
 0x800ff40b = "KEY_ENTER"
 0x02000028 = "KEY_ENTER"
-0x02000028 = "KEY_OK"
 0x800ff422 = "KEY_OK"
 0x0200002a = "KEY_EXIT"
 0x800ff423 = "KEY_EXIT"
@@ -71,9 +74,7 @@ variant = "rc6_mce"
 0x800ff45d = "KEY_YELLOW"
 0x800ff45e = "KEY_BLUE"
 0x800ff466 = "KEY_RED"
-0x800ff425 = "KEY_GREEN"
 0x800ff468 = "KEY_YELLOW"
-0x800ff41d = "KEY_BLUE"
 0x800ff40f = "KEY_INFO"
 0x800ff426 = "KEY_EPG"
 0x800ff45a = "KEY_SUBTITLE"
diff --git a/utils/keytable/rc_keymaps/imon_pad.toml b/utils/keytable/rc_keymaps/imon_pad.toml
index e106754a..2c442026 100644
--- a/utils/keytable/rc_keymaps/imon_pad.toml
+++ b/utils/keytable/rc_keymaps/imon_pad.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-imon-pad.c as a source file
 [[protocols]]
 name = "imon_pad"
 protocol = "imon"
diff --git a/utils/keytable/rc_keymaps/imon_rsc.toml b/utils/keytable/rc_keymaps/imon_rsc.toml
index 4f20a54e..5a934cb1 100644
--- a/utils/keytable/rc_keymaps/imon_rsc.toml
+++ b/utils/keytable/rc_keymaps/imon_rsc.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-imon-rsc.c as a source file
 [[protocols]]
 name = "imon_rsc"
 protocol = "nec"
@@ -46,5 +50,3 @@ variant = "necx"
 0x801052 = "KEY_REWIND"
 0x801053 = "KEY_FASTFORWARD"
 0x801089 = "KEY_ZOOM"
-[[protocols]]
-protocol = "imon_rsc"
diff --git a/utils/keytable/rc_keymaps/iodata_bctv7e.toml b/utils/keytable/rc_keymaps/iodata_bctv7e.toml
index e95552f7..b6dc4544 100644
--- a/utils/keytable/rc_keymaps/iodata_bctv7e.toml
+++ b/utils/keytable/rc_keymaps/iodata_bctv7e.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-iodata-bctv7e.c as a source file
 [[protocols]]
 name = "iodata_bctv7e"
 protocol = "unknown"
@@ -6,16 +10,16 @@ protocol = "unknown"
 0x20 = "KEY_RADIO"
 0x60 = "KEY_EPG"
 0x00 = "KEY_POWER"
-0x44 = "KEY_0"
-0x50 = "KEY_1"
-0x30 = "KEY_2"
-0x70 = "KEY_3"
-0x48 = "KEY_4"
-0x28 = "KEY_5"
-0x68 = "KEY_6"
-0x58 = "KEY_7"
-0x38 = "KEY_8"
-0x78 = "KEY_9"
+0x44 = "KEY_NUMERIC_0"
+0x50 = "KEY_NUMERIC_1"
+0x30 = "KEY_NUMERIC_2"
+0x70 = "KEY_NUMERIC_3"
+0x48 = "KEY_NUMERIC_4"
+0x28 = "KEY_NUMERIC_5"
+0x68 = "KEY_NUMERIC_6"
+0x58 = "KEY_NUMERIC_7"
+0x38 = "KEY_NUMERIC_8"
+0x78 = "KEY_NUMERIC_9"
 0x10 = "KEY_L"
 0x08 = "KEY_TIME"
 0x18 = "KEY_PLAYPAUSE"
diff --git a/utils/keytable/rc_keymaps/it913x_v1.toml b/utils/keytable/rc_keymaps/it913x_v1.toml
index 0277710c..b7b70022 100644
--- a/utils/keytable/rc_keymaps/it913x_v1.toml
+++ b/utils/keytable/rc_keymaps/it913x_v1.toml
@@ -1,25 +1,29 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-it913x-v1.c as a source file
 [[protocols]]
 name = "it913x_v1"
 protocol = "nec"
 variant = "necx"
 [protocols.scancodes]
 0x61d601 = "KEY_VIDEO"
-0x61d602 = "KEY_3"
+0x61d602 = "KEY_NUMERIC_3"
 0x61d603 = "KEY_POWER"
-0x61d604 = "KEY_1"
-0x61d605 = "KEY_5"
-0x61d606 = "KEY_6"
+0x61d604 = "KEY_NUMERIC_1"
+0x61d605 = "KEY_NUMERIC_5"
+0x61d606 = "KEY_NUMERIC_6"
 0x61d607 = "KEY_CHANNELDOWN"
-0x61d608 = "KEY_2"
+0x61d608 = "KEY_NUMERIC_2"
 0x61d609 = "KEY_CHANNELUP"
-0x61d60a = "KEY_9"
+0x61d60a = "KEY_NUMERIC_9"
 0x61d60b = "KEY_ZOOM"
-0x61d60c = "KEY_7"
-0x61d60d = "KEY_8"
+0x61d60c = "KEY_NUMERIC_7"
+0x61d60d = "KEY_NUMERIC_8"
 0x61d60e = "KEY_VOLUMEUP"
-0x61d60f = "KEY_4"
+0x61d60f = "KEY_NUMERIC_4"
 0x61d610 = "KEY_ESC"
-0x61d611 = "KEY_0"
+0x61d611 = "KEY_NUMERIC_0"
 0x61d612 = "KEY_OK"
 0x61d613 = "KEY_VOLUMEDOWN"
 0x61d614 = "KEY_RECORD"
@@ -35,16 +39,16 @@ variant = "necx"
 0x61d61e = "KEY_YELLOW"
 0x61d61f = "KEY_BLUE"
 0x61d643 = "KEY_POWER2"
-0x807f0d = "KEY_0"
-0x807f04 = "KEY_1"
-0x807f05 = "KEY_2"
-0x807f06 = "KEY_3"
-0x807f07 = "KEY_4"
-0x807f08 = "KEY_5"
-0x807f09 = "KEY_6"
-0x807f0a = "KEY_7"
-0x807f1b = "KEY_8"
-0x807f1f = "KEY_9"
+0x807f0d = "KEY_NUMERIC_0"
+0x807f04 = "KEY_NUMERIC_1"
+0x807f05 = "KEY_NUMERIC_2"
+0x807f06 = "KEY_NUMERIC_3"
+0x807f07 = "KEY_NUMERIC_4"
+0x807f08 = "KEY_NUMERIC_5"
+0x807f09 = "KEY_NUMERIC_6"
+0x807f0a = "KEY_NUMERIC_7"
+0x807f1b = "KEY_NUMERIC_8"
+0x807f1f = "KEY_NUMERIC_9"
 0x807f12 = "KEY_POWER"
 0x807f01 = "KEY_MEDIA_REPEAT"
 0x807f19 = "KEY_PAUSE"
diff --git a/utils/keytable/rc_keymaps/it913x_v2.toml b/utils/keytable/rc_keymaps/it913x_v2.toml
index dcb6ab4b..b7022860 100644
--- a/utils/keytable/rc_keymaps/it913x_v2.toml
+++ b/utils/keytable/rc_keymaps/it913x_v2.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-it913x-v2.c as a source file
 [[protocols]]
 name = "it913x_v2"
 protocol = "nec"
@@ -12,28 +16,28 @@ variant = "necx"
 0x807f04 = "KEY_VOLUMEUP"
 0x807f05 = "KEY_SCREEN"
 0x807f06 = "KEY_VOLUMEDOWN"
-0x807f07 = "KEY_0"
+0x807f07 = "KEY_NUMERIC_0"
 0x807f08 = "KEY_CHANNELDOWN"
 0x807f09 = "KEY_PREVIOUS"
-0x807f0a = "KEY_1"
-0x807f1b = "KEY_2"
-0x807f1f = "KEY_3"
-0x807f0c = "KEY_4"
-0x807f0d = "KEY_5"
-0x807f0e = "KEY_6"
-0x807f00 = "KEY_7"
-0x807f0f = "KEY_8"
-0x807f19 = "KEY_9"
-0x866b00 = "KEY_0"
-0x866b01 = "KEY_1"
-0x866b02 = "KEY_2"
-0x866b03 = "KEY_3"
-0x866b04 = "KEY_4"
-0x866b05 = "KEY_5"
-0x866b06 = "KEY_6"
-0x866b07 = "KEY_7"
-0x866b08 = "KEY_8"
-0x866b09 = "KEY_9"
+0x807f0a = "KEY_NUMERIC_1"
+0x807f1b = "KEY_NUMERIC_2"
+0x807f1f = "KEY_NUMERIC_3"
+0x807f0c = "KEY_NUMERIC_4"
+0x807f0d = "KEY_NUMERIC_5"
+0x807f0e = "KEY_NUMERIC_6"
+0x807f00 = "KEY_NUMERIC_7"
+0x807f0f = "KEY_NUMERIC_8"
+0x807f19 = "KEY_NUMERIC_9"
+0x866b00 = "KEY_NUMERIC_0"
+0x866b01 = "KEY_NUMERIC_1"
+0x866b02 = "KEY_NUMERIC_2"
+0x866b03 = "KEY_NUMERIC_3"
+0x866b04 = "KEY_NUMERIC_4"
+0x866b05 = "KEY_NUMERIC_5"
+0x866b06 = "KEY_NUMERIC_6"
+0x866b07 = "KEY_NUMERIC_7"
+0x866b08 = "KEY_NUMERIC_8"
+0x866b09 = "KEY_NUMERIC_9"
 0x866b12 = "KEY_POWER"
 0x866b13 = "KEY_MUTE"
 0x866b0a = "KEY_PREVIOUS"
diff --git a/utils/keytable/rc_keymaps/kaiomy.toml b/utils/keytable/rc_keymaps/kaiomy.toml
index 755d9925..34908a11 100644
--- a/utils/keytable/rc_keymaps/kaiomy.toml
+++ b/utils/keytable/rc_keymaps/kaiomy.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-kaiomy.c as a source file
 [[protocols]]
 name = "kaiomy"
 protocol = "unknown"
@@ -6,16 +10,16 @@ protocol = "unknown"
 0x01 = "KEY_LIST"
 0x0b = "KEY_ZOOM"
 0x03 = "KEY_POWER"
-0x04 = "KEY_1"
-0x08 = "KEY_2"
-0x02 = "KEY_3"
-0x0f = "KEY_4"
-0x05 = "KEY_5"
-0x06 = "KEY_6"
-0x0c = "KEY_7"
-0x0d = "KEY_8"
-0x0a = "KEY_9"
-0x11 = "KEY_0"
+0x04 = "KEY_NUMERIC_1"
+0x08 = "KEY_NUMERIC_2"
+0x02 = "KEY_NUMERIC_3"
+0x0f = "KEY_NUMERIC_4"
+0x05 = "KEY_NUMERIC_5"
+0x06 = "KEY_NUMERIC_6"
+0x0c = "KEY_NUMERIC_7"
+0x0d = "KEY_NUMERIC_8"
+0x0a = "KEY_NUMERIC_9"
+0x11 = "KEY_NUMERIC_0"
 0x09 = "KEY_CHANNELUP"
 0x07 = "KEY_CHANNELDOWN"
 0x0e = "KEY_VOLUMEUP"
diff --git a/utils/keytable/rc_keymaps/kworld_315u.toml b/utils/keytable/rc_keymaps/kworld_315u.toml
index a94e40cc..0e9304ca 100644
--- a/utils/keytable/rc_keymaps/kworld_315u.toml
+++ b/utils/keytable/rc_keymaps/kworld_315u.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-kworld-315u.c as a source file
 [[protocols]]
 name = "kworld_315u"
 protocol = "nec"
@@ -7,20 +11,20 @@ variant = "nec"
 0x6101 = "KEY_VIDEO"
 0x610b = "KEY_ZOOM"
 0x6103 = "KEY_POWER2"
-0x6104 = "KEY_1"
-0x6108 = "KEY_2"
-0x6102 = "KEY_3"
+0x6104 = "KEY_NUMERIC_1"
+0x6108 = "KEY_NUMERIC_2"
+0x6102 = "KEY_NUMERIC_3"
 0x6109 = "KEY_CHANNELUP"
-0x610f = "KEY_4"
-0x6105 = "KEY_5"
-0x6106 = "KEY_6"
+0x610f = "KEY_NUMERIC_4"
+0x6105 = "KEY_NUMERIC_5"
+0x6106 = "KEY_NUMERIC_6"
 0x6107 = "KEY_CHANNELDOWN"
-0x610c = "KEY_7"
-0x610d = "KEY_8"
-0x610a = "KEY_9"
+0x610c = "KEY_NUMERIC_7"
+0x610d = "KEY_NUMERIC_8"
+0x610a = "KEY_NUMERIC_9"
 0x610e = "KEY_VOLUMEUP"
 0x6110 = "KEY_LAST"
-0x6111 = "KEY_0"
+0x6111 = "KEY_NUMERIC_0"
 0x6112 = "KEY_ENTER"
 0x6113 = "KEY_VOLUMEDOWN"
 0x6114 = "KEY_RECORD"
diff --git a/utils/keytable/rc_keymaps/kworld_pc150u.toml b/utils/keytable/rc_keymaps/kworld_pc150u.toml
index 78e98058..334fe28d 100644
--- a/utils/keytable/rc_keymaps/kworld_pc150u.toml
+++ b/utils/keytable/rc_keymaps/kworld_pc150u.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-kworld-pc150u.c as a source file
 [[protocols]]
 name = "kworld_pc150u"
 protocol = "unknown"
@@ -5,16 +9,16 @@ protocol = "unknown"
 0x0c = "KEY_MEDIA"
 0x16 = "KEY_EJECTCLOSECD"
 0x1d = "KEY_POWER2"
-0x00 = "KEY_1"
-0x01 = "KEY_2"
-0x02 = "KEY_3"
-0x03 = "KEY_4"
-0x04 = "KEY_5"
-0x05 = "KEY_6"
-0x06 = "KEY_7"
-0x07 = "KEY_8"
-0x08 = "KEY_9"
-0x0a = "KEY_0"
+0x00 = "KEY_NUMERIC_1"
+0x01 = "KEY_NUMERIC_2"
+0x02 = "KEY_NUMERIC_3"
+0x03 = "KEY_NUMERIC_4"
+0x04 = "KEY_NUMERIC_5"
+0x05 = "KEY_NUMERIC_6"
+0x06 = "KEY_NUMERIC_7"
+0x07 = "KEY_NUMERIC_8"
+0x08 = "KEY_NUMERIC_9"
+0x0a = "KEY_NUMERIC_0"
 0x09 = "KEY_AGAIN"
 0x14 = "KEY_MUTE"
 0x1e = "KEY_LAST"
diff --git a/utils/keytable/rc_keymaps/kworld_plus_tv_analog.toml b/utils/keytable/rc_keymaps/kworld_plus_tv_analog.toml
index 51699606..c4d394ba 100644
--- a/utils/keytable/rc_keymaps/kworld_plus_tv_analog.toml
+++ b/utils/keytable/rc_keymaps/kworld_plus_tv_analog.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-kworld-plus-tv-analog.c as a source file
 [[protocols]]
 name = "kworld_plus_tv_analog"
 protocol = "unknown"
@@ -5,16 +9,16 @@ protocol = "unknown"
 0x0c = "KEY_MEDIA"
 0x16 = "KEY_CLOSECD"
 0x1d = "KEY_POWER2"
-0x00 = "KEY_1"
-0x01 = "KEY_2"
-0x02 = "KEY_3"
-0x03 = "KEY_4"
-0x04 = "KEY_5"
-0x05 = "KEY_6"
-0x06 = "KEY_7"
-0x07 = "KEY_8"
-0x08 = "KEY_9"
-0x0a = "KEY_0"
+0x00 = "KEY_NUMERIC_1"
+0x01 = "KEY_NUMERIC_2"
+0x02 = "KEY_NUMERIC_3"
+0x03 = "KEY_NUMERIC_4"
+0x04 = "KEY_NUMERIC_5"
+0x05 = "KEY_NUMERIC_6"
+0x06 = "KEY_NUMERIC_7"
+0x07 = "KEY_NUMERIC_8"
+0x08 = "KEY_NUMERIC_9"
+0x0a = "KEY_NUMERIC_0"
 0x09 = "KEY_AGAIN"
 0x14 = "KEY_MUTE"
 0x20 = "KEY_UP"
diff --git a/utils/keytable/rc_keymaps/leadtek_y04g0051.toml b/utils/keytable/rc_keymaps/leadtek_y04g0051.toml
index 65ca1f34..2b488d0e 100644
--- a/utils/keytable/rc_keymaps/leadtek_y04g0051.toml
+++ b/utils/keytable/rc_keymaps/leadtek_y04g0051.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-leadtek-y04g0051.c as a source file
 [[protocols]]
 name = "leadtek_y04g0051"
 protocol = "nec"
@@ -6,20 +10,20 @@ variant = "nec"
 0x0300 = "KEY_POWER2"
 0x0303 = "KEY_SCREEN"
 0x0304 = "KEY_RIGHT"
-0x0305 = "KEY_1"
-0x0306 = "KEY_2"
-0x0307 = "KEY_3"
+0x0305 = "KEY_NUMERIC_1"
+0x0306 = "KEY_NUMERIC_2"
+0x0307 = "KEY_NUMERIC_3"
 0x0308 = "KEY_LEFT"
-0x0309 = "KEY_4"
-0x030a = "KEY_5"
-0x030b = "KEY_6"
+0x0309 = "KEY_NUMERIC_4"
+0x030a = "KEY_NUMERIC_5"
+0x030b = "KEY_NUMERIC_6"
 0x030c = "KEY_UP"
-0x030d = "KEY_7"
-0x030e = "KEY_8"
-0x030f = "KEY_9"
+0x030d = "KEY_NUMERIC_7"
+0x030e = "KEY_NUMERIC_8"
+0x030f = "KEY_NUMERIC_9"
 0x0310 = "KEY_DOWN"
 0x0311 = "KEY_AGAIN"
-0x0312 = "KEY_0"
+0x0312 = "KEY_NUMERIC_0"
 0x0313 = "KEY_OK"
 0x0314 = "KEY_MUTE"
 0x0316 = "KEY_OK"
diff --git a/utils/keytable/rc_keymaps/lme2510.toml b/utils/keytable/rc_keymaps/lme2510.toml
index ee805faa..04917694 100644
--- a/utils/keytable/rc_keymaps/lme2510.toml
+++ b/utils/keytable/rc_keymaps/lme2510.toml
@@ -1,18 +1,22 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-lme2510.c as a source file
 [[protocols]]
 name = "lme2510"
 protocol = "nec"
 variant = "nec"
 [protocols.scancodes]
-0xef12ba45 = "KEY_0"
-0xef12a05f = "KEY_1"
-0xef12af50 = "KEY_2"
-0xef12a25d = "KEY_3"
-0xef12be41 = "KEY_4"
-0xef12f50a = "KEY_5"
-0xef12bd42 = "KEY_6"
-0xef12b847 = "KEY_7"
-0xef12b649 = "KEY_8"
-0xef12fa05 = "KEY_9"
+0xef12ba45 = "KEY_NUMERIC_0"
+0xef12a05f = "KEY_NUMERIC_1"
+0xef12af50 = "KEY_NUMERIC_2"
+0xef12a25d = "KEY_NUMERIC_3"
+0xef12be41 = "KEY_NUMERIC_4"
+0xef12f50a = "KEY_NUMERIC_5"
+0xef12bd42 = "KEY_NUMERIC_6"
+0xef12b847 = "KEY_NUMERIC_7"
+0xef12b649 = "KEY_NUMERIC_8"
+0xef12fa05 = "KEY_NUMERIC_9"
 0xef12bc43 = "KEY_POWER"
 0xef12b946 = "KEY_SUBTITLE"
 0xef12f906 = "KEY_PAUSE"
@@ -29,16 +33,16 @@ variant = "nec"
 0xef12e718 = "KEY_RECORD"
 0xef12f807 = "KEY_EPG"
 0xef12fe01 = "KEY_STOP"
-0xff40ea15 = "KEY_0"
-0xff40f708 = "KEY_1"
-0xff40f609 = "KEY_2"
-0xff40f50a = "KEY_3"
-0xff40f30c = "KEY_4"
-0xff40f20d = "KEY_5"
-0xff40f10e = "KEY_6"
-0xff40ef10 = "KEY_7"
-0xff40ee11 = "KEY_8"
-0xff40ed12 = "KEY_9"
+0xff40ea15 = "KEY_NUMERIC_0"
+0xff40f708 = "KEY_NUMERIC_1"
+0xff40f609 = "KEY_NUMERIC_2"
+0xff40f50a = "KEY_NUMERIC_3"
+0xff40f30c = "KEY_NUMERIC_4"
+0xff40f20d = "KEY_NUMERIC_5"
+0xff40f10e = "KEY_NUMERIC_6"
+0xff40ef10 = "KEY_NUMERIC_7"
+0xff40ee11 = "KEY_NUMERIC_8"
+0xff40ed12 = "KEY_NUMERIC_9"
 0xff40ff00 = "KEY_POWER"
 0xff40fb04 = "KEY_MEDIA_REPEAT"
 0xff40e51a = "KEY_PAUSE"
@@ -49,16 +53,16 @@ variant = "nec"
 0xff40eb14 = "KEY_ZOOM"
 0xff40e718 = "KEY_RECORD"
 0xff40e916 = "KEY_STOP"
-0xff00e31c = "KEY_0"
-0xff00f807 = "KEY_1"
-0xff00ea15 = "KEY_2"
-0xff00f609 = "KEY_3"
-0xff00e916 = "KEY_4"
-0xff00e619 = "KEY_5"
-0xff00f20d = "KEY_6"
-0xff00f30c = "KEY_7"
-0xff00e718 = "KEY_8"
-0xff00a15e = "KEY_9"
+0xff00e31c = "KEY_NUMERIC_0"
+0xff00f807 = "KEY_NUMERIC_1"
+0xff00ea15 = "KEY_NUMERIC_2"
+0xff00f609 = "KEY_NUMERIC_3"
+0xff00e916 = "KEY_NUMERIC_4"
+0xff00e619 = "KEY_NUMERIC_5"
+0xff00f20d = "KEY_NUMERIC_6"
+0xff00f30c = "KEY_NUMERIC_7"
+0xff00e718 = "KEY_NUMERIC_8"
+0xff00a15e = "KEY_NUMERIC_9"
 0xff00ba45 = "KEY_POWER"
 0xff00bb44 = "KEY_MEDIA_REPEAT"
 0xff00b54a = "KEY_PAUSE"
diff --git a/utils/keytable/rc_keymaps/manli.toml b/utils/keytable/rc_keymaps/manli.toml
index 93f6bcaf..e8336de4 100644
--- a/utils/keytable/rc_keymaps/manli.toml
+++ b/utils/keytable/rc_keymaps/manli.toml
@@ -1,20 +1,24 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-manli.c as a source file
 [[protocols]]
 name = "manli"
 protocol = "unknown"
 [protocols.scancodes]
 0x1c = "KEY_RADIO"
 0x12 = "KEY_POWER"
-0x01 = "KEY_1"
-0x02 = "KEY_2"
-0x03 = "KEY_3"
-0x04 = "KEY_4"
-0x05 = "KEY_5"
-0x06 = "KEY_6"
-0x07 = "KEY_7"
-0x08 = "KEY_8"
-0x09 = "KEY_9"
+0x01 = "KEY_NUMERIC_1"
+0x02 = "KEY_NUMERIC_2"
+0x03 = "KEY_NUMERIC_3"
+0x04 = "KEY_NUMERIC_4"
+0x05 = "KEY_NUMERIC_5"
+0x06 = "KEY_NUMERIC_6"
+0x07 = "KEY_NUMERIC_7"
+0x08 = "KEY_NUMERIC_8"
+0x09 = "KEY_NUMERIC_9"
 0x0a = "KEY_AGAIN"
-0x00 = "KEY_0"
+0x00 = "KEY_NUMERIC_0"
 0x17 = "KEY_DIGITS"
 0x14 = "KEY_MENU"
 0x10 = "KEY_INFO"
diff --git a/utils/keytable/rc_keymaps/medion_x10.toml b/utils/keytable/rc_keymaps/medion_x10.toml
index 468162cf..3303942b 100644
--- a/utils/keytable/rc_keymaps/medion_x10.toml
+++ b/utils/keytable/rc_keymaps/medion_x10.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-medion-x10.c as a source file
 [[protocols]]
 name = "medion_x10"
 protocol = "other"
@@ -22,16 +26,16 @@ protocol = "other"
 0x34 = "KEY_YELLOW"
 0x35 = "KEY_BLUE"
 0x16 = "KEY_TEXT"
-0x0d = "KEY_1"
-0x0e = "KEY_2"
-0x0f = "KEY_3"
-0x10 = "KEY_4"
-0x11 = "KEY_5"
-0x12 = "KEY_6"
-0x13 = "KEY_7"
-0x14 = "KEY_8"
-0x15 = "KEY_9"
-0x17 = "KEY_0"
+0x0d = "KEY_NUMERIC_1"
+0x0e = "KEY_NUMERIC_2"
+0x0f = "KEY_NUMERIC_3"
+0x10 = "KEY_NUMERIC_4"
+0x11 = "KEY_NUMERIC_5"
+0x12 = "KEY_NUMERIC_6"
+0x13 = "KEY_NUMERIC_7"
+0x14 = "KEY_NUMERIC_8"
+0x15 = "KEY_NUMERIC_9"
+0x17 = "KEY_NUMERIC_0"
 0x1c = "KEY_SEARCH"
 0x20 = "KEY_DELETE"
 0x36 = "KEY_KEYBOARD"
diff --git a/utils/keytable/rc_keymaps/medion_x10_digitainer.toml b/utils/keytable/rc_keymaps/medion_x10_digitainer.toml
index 1b4c9326..e5cbaa9e 100644
--- a/utils/keytable/rc_keymaps/medion_x10_digitainer.toml
+++ b/utils/keytable/rc_keymaps/medion_x10_digitainer.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-medion-x10-digitainer.c as a source file
 [[protocols]]
 name = "medion_x10_digitainer"
 protocol = "other"
@@ -39,15 +43,15 @@ protocol = "other"
 0x24 = "KEY_REWIND"
 0x27 = "KEY_RECORD"
 0x26 = "KEY_FORWARD"
-0x0d = "KEY_1"
-0x0e = "KEY_2"
-0x0f = "KEY_3"
-0x10 = "KEY_4"
-0x11 = "KEY_5"
-0x12 = "KEY_6"
-0x13 = "KEY_7"
-0x14 = "KEY_8"
-0x15 = "KEY_9"
-0x17 = "KEY_0"
+0x0d = "KEY_NUMERIC_1"
+0x0e = "KEY_NUMERIC_2"
+0x0f = "KEY_NUMERIC_3"
+0x10 = "KEY_NUMERIC_4"
+0x11 = "KEY_NUMERIC_5"
+0x12 = "KEY_NUMERIC_6"
+0x13 = "KEY_NUMERIC_7"
+0x14 = "KEY_NUMERIC_8"
+0x15 = "KEY_NUMERIC_9"
+0x17 = "KEY_NUMERIC_0"
 0x1a = "KEY_UP"
 0x22 = "KEY_DOWN"
diff --git a/utils/keytable/rc_keymaps/medion_x10_or2x.toml b/utils/keytable/rc_keymaps/medion_x10_or2x.toml
index 2fccec12..85aae06f 100644
--- a/utils/keytable/rc_keymaps/medion_x10_or2x.toml
+++ b/utils/keytable/rc_keymaps/medion_x10_or2x.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-medion-x10-or2x.c as a source file
 [[protocols]]
 name = "medion_x10_or2x"
 protocol = "other"
@@ -33,16 +37,16 @@ protocol = "other"
 0x28 = "KEY_STOP"
 0x29 = "KEY_PAUSE"
 0x27 = "KEY_RECORD"
-0x0d = "KEY_1"
-0x0e = "KEY_2"
-0x0f = "KEY_3"
-0x10 = "KEY_4"
-0x11 = "KEY_5"
-0x12 = "KEY_6"
-0x13 = "KEY_7"
-0x14 = "KEY_8"
-0x15 = "KEY_9"
-0x17 = "KEY_0"
+0x0d = "KEY_NUMERIC_1"
+0x0e = "KEY_NUMERIC_2"
+0x0f = "KEY_NUMERIC_3"
+0x10 = "KEY_NUMERIC_4"
+0x11 = "KEY_NUMERIC_5"
+0x12 = "KEY_NUMERIC_6"
+0x13 = "KEY_NUMERIC_7"
+0x14 = "KEY_NUMERIC_8"
+0x15 = "KEY_NUMERIC_9"
+0x17 = "KEY_NUMERIC_0"
 0x30 = "KEY_CLEAR"
 0x36 = "KEY_ENTER"
 0x37 = "KEY_NUMERIC_STAR"
diff --git a/utils/keytable/rc_keymaps/megasky.toml b/utils/keytable/rc_keymaps/megasky.toml
index 8502fa7a..69a72284 100644
--- a/utils/keytable/rc_keymaps/megasky.toml
+++ b/utils/keytable/rc_keymaps/megasky.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/usb/dvb-usb/m920x.c as a source file
 [[protocols]]
 name = "megasky"
 protocol = "unknown"
diff --git a/utils/keytable/rc_keymaps/msi_digivox_ii.toml b/utils/keytable/rc_keymaps/msi_digivox_ii.toml
index b380f5e4..e313ccf1 100644
--- a/utils/keytable/rc_keymaps/msi_digivox_ii.toml
+++ b/utils/keytable/rc_keymaps/msi_digivox_ii.toml
@@ -1,23 +1,27 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-msi-digivox-ii.c as a source file
 [[protocols]]
 name = "msi_digivox_ii"
 protocol = "nec"
 variant = "nec"
 [protocols.scancodes]
-0x0302 = "KEY_2"
+0x0302 = "KEY_NUMERIC_2"
 0x0303 = "KEY_UP"
-0x0304 = "KEY_3"
+0x0304 = "KEY_NUMERIC_3"
 0x0305 = "KEY_CHANNELDOWN"
-0x0308 = "KEY_5"
-0x0309 = "KEY_0"
-0x030b = "KEY_8"
+0x0308 = "KEY_NUMERIC_5"
+0x0309 = "KEY_NUMERIC_0"
+0x030b = "KEY_NUMERIC_8"
 0x030d = "KEY_DOWN"
-0x0310 = "KEY_9"
-0x0311 = "KEY_7"
+0x0310 = "KEY_NUMERIC_9"
+0x0311 = "KEY_NUMERIC_7"
 0x0314 = "KEY_VOLUMEUP"
 0x0315 = "KEY_CHANNELUP"
 0x0316 = "KEY_OK"
 0x0317 = "KEY_POWER2"
-0x031a = "KEY_1"
-0x031c = "KEY_4"
-0x031d = "KEY_6"
+0x031a = "KEY_NUMERIC_1"
+0x031c = "KEY_NUMERIC_4"
+0x031d = "KEY_NUMERIC_6"
 0x031f = "KEY_VOLUMEDOWN"
diff --git a/utils/keytable/rc_keymaps/msi_digivox_iii.toml b/utils/keytable/rc_keymaps/msi_digivox_iii.toml
index 035d4d8b..ddfce685 100644
--- a/utils/keytable/rc_keymaps/msi_digivox_iii.toml
+++ b/utils/keytable/rc_keymaps/msi_digivox_iii.toml
@@ -1,25 +1,29 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-msi-digivox-iii.c as a source file
 [[protocols]]
 name = "msi_digivox_iii"
 protocol = "nec"
 variant = "necx"
 [protocols.scancodes]
 0x61d601 = "KEY_VIDEO"
-0x61d602 = "KEY_3"
+0x61d602 = "KEY_NUMERIC_3"
 0x61d603 = "KEY_POWER"
-0x61d604 = "KEY_1"
-0x61d605 = "KEY_5"
-0x61d606 = "KEY_6"
+0x61d604 = "KEY_NUMERIC_1"
+0x61d605 = "KEY_NUMERIC_5"
+0x61d606 = "KEY_NUMERIC_6"
 0x61d607 = "KEY_CHANNELDOWN"
-0x61d608 = "KEY_2"
+0x61d608 = "KEY_NUMERIC_2"
 0x61d609 = "KEY_CHANNELUP"
-0x61d60a = "KEY_9"
+0x61d60a = "KEY_NUMERIC_9"
 0x61d60b = "KEY_ZOOM"
-0x61d60c = "KEY_7"
-0x61d60d = "KEY_8"
+0x61d60c = "KEY_NUMERIC_7"
+0x61d60d = "KEY_NUMERIC_8"
 0x61d60e = "KEY_VOLUMEUP"
-0x61d60f = "KEY_4"
+0x61d60f = "KEY_NUMERIC_4"
 0x61d610 = "KEY_ESC"
-0x61d611 = "KEY_0"
+0x61d611 = "KEY_NUMERIC_0"
 0x61d612 = "KEY_OK"
 0x61d613 = "KEY_VOLUMEDOWN"
 0x61d614 = "KEY_RECORD"
diff --git a/utils/keytable/rc_keymaps/msi_tvanywhere.toml b/utils/keytable/rc_keymaps/msi_tvanywhere.toml
index 98dff8e6..f34eec03 100644
--- a/utils/keytable/rc_keymaps/msi_tvanywhere.toml
+++ b/utils/keytable/rc_keymaps/msi_tvanywhere.toml
@@ -1,17 +1,21 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-msi-tvanywhere.c as a source file
 [[protocols]]
 name = "msi_tvanywhere"
 protocol = "unknown"
 [protocols.scancodes]
-0x00 = "KEY_0"
-0x01 = "KEY_1"
-0x02 = "KEY_2"
-0x03 = "KEY_3"
-0x04 = "KEY_4"
-0x05 = "KEY_5"
-0x06 = "KEY_6"
-0x07 = "KEY_7"
-0x08 = "KEY_8"
-0x09 = "KEY_9"
+0x00 = "KEY_NUMERIC_0"
+0x01 = "KEY_NUMERIC_1"
+0x02 = "KEY_NUMERIC_2"
+0x03 = "KEY_NUMERIC_3"
+0x04 = "KEY_NUMERIC_4"
+0x05 = "KEY_NUMERIC_5"
+0x06 = "KEY_NUMERIC_6"
+0x07 = "KEY_NUMERIC_7"
+0x08 = "KEY_NUMERIC_8"
+0x09 = "KEY_NUMERIC_9"
 0x0c = "KEY_MUTE"
 0x0f = "KEY_SCREEN"
 0x10 = "KEY_FN"
diff --git a/utils/keytable/rc_keymaps/msi_tvanywhere_plus.toml b/utils/keytable/rc_keymaps/msi_tvanywhere_plus.toml
index 5e13cf76..965beec2 100644
--- a/utils/keytable/rc_keymaps/msi_tvanywhere_plus.toml
+++ b/utils/keytable/rc_keymaps/msi_tvanywhere_plus.toml
@@ -1,17 +1,21 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-msi-tvanywhere-plus.c as a source file
 [[protocols]]
 name = "msi_tvanywhere_plus"
 protocol = "unknown"
 [protocols.scancodes]
-0x01 = "KEY_1"
-0x0b = "KEY_2"
-0x1b = "KEY_3"
-0x05 = "KEY_4"
-0x09 = "KEY_5"
-0x15 = "KEY_6"
-0x06 = "KEY_7"
-0x0a = "KEY_8"
-0x12 = "KEY_9"
-0x02 = "KEY_0"
+0x01 = "KEY_NUMERIC_1"
+0x0b = "KEY_NUMERIC_2"
+0x1b = "KEY_NUMERIC_3"
+0x05 = "KEY_NUMERIC_4"
+0x09 = "KEY_NUMERIC_5"
+0x15 = "KEY_NUMERIC_6"
+0x06 = "KEY_NUMERIC_7"
+0x0a = "KEY_NUMERIC_8"
+0x12 = "KEY_NUMERIC_9"
+0x02 = "KEY_NUMERIC_0"
 0x10 = "KEY_KPPLUS"
 0x13 = "KEY_AGAIN"
 0x1e = "KEY_POWER"
diff --git a/utils/keytable/rc_keymaps/nebula.toml b/utils/keytable/rc_keymaps/nebula.toml
index 8de8ca7f..36264b1e 100644
--- a/utils/keytable/rc_keymaps/nebula.toml
+++ b/utils/keytable/rc_keymaps/nebula.toml
@@ -1,18 +1,22 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-nebula.c as a source file
 [[protocols]]
 name = "nebula"
 protocol = "rc5"
 variant = "rc5"
 [protocols.scancodes]
-0x0000 = "KEY_0"
-0x0001 = "KEY_1"
-0x0002 = "KEY_2"
-0x0003 = "KEY_3"
-0x0004 = "KEY_4"
-0x0005 = "KEY_5"
-0x0006 = "KEY_6"
-0x0007 = "KEY_7"
-0x0008 = "KEY_8"
-0x0009 = "KEY_9"
+0x0000 = "KEY_NUMERIC_0"
+0x0001 = "KEY_NUMERIC_1"
+0x0002 = "KEY_NUMERIC_2"
+0x0003 = "KEY_NUMERIC_3"
+0x0004 = "KEY_NUMERIC_4"
+0x0005 = "KEY_NUMERIC_5"
+0x0006 = "KEY_NUMERIC_6"
+0x0007 = "KEY_NUMERIC_7"
+0x0008 = "KEY_NUMERIC_8"
+0x0009 = "KEY_NUMERIC_9"
 0x000a = "KEY_TV"
 0x000b = "KEY_AUX"
 0x000c = "KEY_DVD"
diff --git a/utils/keytable/rc_keymaps/nec_terratec_cinergy_xs.toml b/utils/keytable/rc_keymaps/nec_terratec_cinergy_xs.toml
index 1011d1c3..ad9ea451 100644
--- a/utils/keytable/rc_keymaps/nec_terratec_cinergy_xs.toml
+++ b/utils/keytable/rc_keymaps/nec_terratec_cinergy_xs.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-nec-terratec-cinergy-xs.c as a source file
 [[protocols]]
 name = "nec_terratec_cinergy_xs"
 protocol = "nec"
@@ -9,16 +13,16 @@ variant = "nec"
 0x1443 = "KEY_SUBTITLE"
 0x1444 = "KEY_TEXT"
 0x1445 = "KEY_DELETE"
-0x1402 = "KEY_1"
-0x1403 = "KEY_2"
-0x1404 = "KEY_3"
-0x1405 = "KEY_4"
-0x1406 = "KEY_5"
-0x1407 = "KEY_6"
-0x1408 = "KEY_7"
-0x1409 = "KEY_8"
-0x140a = "KEY_9"
-0x140c = "KEY_0"
+0x1402 = "KEY_NUMERIC_1"
+0x1403 = "KEY_NUMERIC_2"
+0x1404 = "KEY_NUMERIC_3"
+0x1405 = "KEY_NUMERIC_4"
+0x1406 = "KEY_NUMERIC_5"
+0x1407 = "KEY_NUMERIC_6"
+0x1408 = "KEY_NUMERIC_7"
+0x1409 = "KEY_NUMERIC_8"
+0x140a = "KEY_NUMERIC_9"
+0x140c = "KEY_NUMERIC_0"
 0x140b = "KEY_TUNER"
 0x140d = "KEY_MODE"
 0x1446 = "KEY_TV"
@@ -52,16 +56,16 @@ variant = "nec"
 0x144f = "KEY_FASTFORWARD"
 0x145c = "KEY_NEXT"
 0x04eb01 = "KEY_POWER2"
-0x04eb02 = "KEY_1"
-0x04eb03 = "KEY_2"
-0x04eb04 = "KEY_3"
-0x04eb05 = "KEY_4"
-0x04eb06 = "KEY_5"
-0x04eb07 = "KEY_6"
-0x04eb08 = "KEY_7"
-0x04eb09 = "KEY_8"
-0x04eb0a = "KEY_9"
-0x04eb0c = "KEY_0"
+0x04eb02 = "KEY_NUMERIC_1"
+0x04eb03 = "KEY_NUMERIC_2"
+0x04eb04 = "KEY_NUMERIC_3"
+0x04eb05 = "KEY_NUMERIC_4"
+0x04eb06 = "KEY_NUMERIC_5"
+0x04eb07 = "KEY_NUMERIC_6"
+0x04eb08 = "KEY_NUMERIC_7"
+0x04eb09 = "KEY_NUMERIC_8"
+0x04eb0a = "KEY_NUMERIC_9"
+0x04eb0c = "KEY_NUMERIC_0"
 0x04eb0b = "KEY_TEXT"
 0x04eb0d = "KEY_REFRESH"
 0x04eb0e = "KEY_HOME"
diff --git a/utils/keytable/rc_keymaps/norwood.toml b/utils/keytable/rc_keymaps/norwood.toml
index f87dc936..624b9d14 100644
--- a/utils/keytable/rc_keymaps/norwood.toml
+++ b/utils/keytable/rc_keymaps/norwood.toml
@@ -1,17 +1,21 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-norwood.c as a source file
 [[protocols]]
 name = "norwood"
 protocol = "unknown"
 [protocols.scancodes]
-0x20 = "KEY_0"
-0x21 = "KEY_1"
-0x22 = "KEY_2"
-0x23 = "KEY_3"
-0x24 = "KEY_4"
-0x25 = "KEY_5"
-0x26 = "KEY_6"
-0x27 = "KEY_7"
-0x28 = "KEY_8"
-0x29 = "KEY_9"
+0x20 = "KEY_NUMERIC_0"
+0x21 = "KEY_NUMERIC_1"
+0x22 = "KEY_NUMERIC_2"
+0x23 = "KEY_NUMERIC_3"
+0x24 = "KEY_NUMERIC_4"
+0x25 = "KEY_NUMERIC_5"
+0x26 = "KEY_NUMERIC_6"
+0x27 = "KEY_NUMERIC_7"
+0x28 = "KEY_NUMERIC_8"
+0x29 = "KEY_NUMERIC_9"
 0x78 = "KEY_VIDEO"
 0x2c = "KEY_EXIT"
 0x2a = "KEY_SELECT"
diff --git a/utils/keytable/rc_keymaps/npgtech.toml b/utils/keytable/rc_keymaps/npgtech.toml
index 9a45c51e..6a88f4e6 100644
--- a/utils/keytable/rc_keymaps/npgtech.toml
+++ b/utils/keytable/rc_keymaps/npgtech.toml
@@ -1,19 +1,23 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-npgtech.c as a source file
 [[protocols]]
 name = "npgtech"
 protocol = "unknown"
 [protocols.scancodes]
 0x1d = "KEY_SWITCHVIDEOMODE"
 0x2a = "KEY_FRONT"
-0x3e = "KEY_1"
-0x02 = "KEY_2"
-0x06 = "KEY_3"
-0x0a = "KEY_4"
-0x0e = "KEY_5"
-0x12 = "KEY_6"
-0x16 = "KEY_7"
-0x1a = "KEY_8"
-0x1e = "KEY_9"
-0x3a = "KEY_0"
+0x3e = "KEY_NUMERIC_1"
+0x02 = "KEY_NUMERIC_2"
+0x06 = "KEY_NUMERIC_3"
+0x0a = "KEY_NUMERIC_4"
+0x0e = "KEY_NUMERIC_5"
+0x12 = "KEY_NUMERIC_6"
+0x16 = "KEY_NUMERIC_7"
+0x1a = "KEY_NUMERIC_8"
+0x1e = "KEY_NUMERIC_9"
+0x3a = "KEY_NUMERIC_0"
 0x22 = "KEY_NUMLOCK"
 0x20 = "KEY_REFRESH"
 0x03 = "KEY_BRIGHTNESSDOWN"
diff --git a/utils/keytable/rc_keymaps/opera1.toml b/utils/keytable/rc_keymaps/opera1.toml
index 5ce25b9e..783e6194 100644
--- a/utils/keytable/rc_keymaps/opera1.toml
+++ b/utils/keytable/rc_keymaps/opera1.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/usb/dvb-usb/opera1.c as a source file
 [[protocols]]
 name = "opera1"
 protocol = "unknown"
diff --git a/utils/keytable/rc_keymaps/pctv_sedna.toml b/utils/keytable/rc_keymaps/pctv_sedna.toml
index 30ff826d..e4f96374 100644
--- a/utils/keytable/rc_keymaps/pctv_sedna.toml
+++ b/utils/keytable/rc_keymaps/pctv_sedna.toml
@@ -1,17 +1,21 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-pctv-sedna.c as a source file
 [[protocols]]
 name = "pctv_sedna"
 protocol = "unknown"
 [protocols.scancodes]
-0x00 = "KEY_0"
-0x01 = "KEY_1"
-0x02 = "KEY_2"
-0x03 = "KEY_3"
-0x04 = "KEY_4"
-0x05 = "KEY_5"
-0x06 = "KEY_6"
-0x07 = "KEY_7"
-0x08 = "KEY_8"
-0x09 = "KEY_9"
+0x00 = "KEY_NUMERIC_0"
+0x01 = "KEY_NUMERIC_1"
+0x02 = "KEY_NUMERIC_2"
+0x03 = "KEY_NUMERIC_3"
+0x04 = "KEY_NUMERIC_4"
+0x05 = "KEY_NUMERIC_5"
+0x06 = "KEY_NUMERIC_6"
+0x07 = "KEY_NUMERIC_7"
+0x08 = "KEY_NUMERIC_8"
+0x09 = "KEY_NUMERIC_9"
 0x0a = "KEY_AGAIN"
 0x0b = "KEY_CHANNELUP"
 0x0c = "KEY_VOLUMEUP"
diff --git a/utils/keytable/rc_keymaps/pinnacle310e.toml b/utils/keytable/rc_keymaps/pinnacle310e.toml
index a67a3f21..f326e8eb 100644
--- a/utils/keytable/rc_keymaps/pinnacle310e.toml
+++ b/utils/keytable/rc_keymaps/pinnacle310e.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/usb/dvb-usb/m920x.c as a source file
 [[protocols]]
 name = "pinnacle310e"
 protocol = "unknown"
@@ -40,12 +44,10 @@ protocol = "unknown"
 0x41 = "KEY_PREVIOUSSONG"
 0x42 = "KEY_NEXTSONG"
 0x54 = "KEY_CAMERA"
-0x50 = "KEY_SAP"
 0x47 = "KEY_CYCLEWINDOWS"
 0x4d = "KEY_SCREEN"
 0x08 = "KEY_SUBTITLE"
 0x0e = "KEY_MUTE"
-0x49 = "KEY_LR"
 0x07 = "KEY_SLEEP"
 0x08 = "KEY_VIDEO"
 0x0e = "KEY_MENU"
diff --git a/utils/keytable/rc_keymaps/pinnacle_color.toml b/utils/keytable/rc_keymaps/pinnacle_color.toml
index c0e34e48..215e007b 100644
--- a/utils/keytable/rc_keymaps/pinnacle_color.toml
+++ b/utils/keytable/rc_keymaps/pinnacle_color.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-pinnacle-color.c as a source file
 [[protocols]]
 name = "pinnacle_color"
 protocol = "unknown"
@@ -32,15 +36,15 @@ protocol = "unknown"
 0x53 = "KEY_PREVIOUS"
 0x4c = "KEY_STOP"
 0x54 = "KEY_NEXT"
-0x69 = "KEY_0"
-0x6a = "KEY_1"
-0x6b = "KEY_2"
-0x6c = "KEY_3"
-0x6d = "KEY_4"
-0x6e = "KEY_5"
-0x6f = "KEY_6"
-0x70 = "KEY_7"
-0x71 = "KEY_8"
-0x72 = "KEY_9"
+0x69 = "KEY_NUMERIC_0"
+0x6a = "KEY_NUMERIC_1"
+0x6b = "KEY_NUMERIC_2"
+0x6c = "KEY_NUMERIC_3"
+0x6d = "KEY_NUMERIC_4"
+0x6e = "KEY_NUMERIC_5"
+0x6f = "KEY_NUMERIC_6"
+0x70 = "KEY_NUMERIC_7"
+0x71 = "KEY_NUMERIC_8"
+0x72 = "KEY_NUMERIC_9"
 0x74 = "KEY_CHANNEL"
 0x0a = "KEY_BACKSPACE"
diff --git a/utils/keytable/rc_keymaps/pinnacle_grey.toml b/utils/keytable/rc_keymaps/pinnacle_grey.toml
index 156f06e1..222d5df7 100644
--- a/utils/keytable/rc_keymaps/pinnacle_grey.toml
+++ b/utils/keytable/rc_keymaps/pinnacle_grey.toml
@@ -1,17 +1,21 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-pinnacle-grey.c as a source file
 [[protocols]]
 name = "pinnacle_grey"
 protocol = "unknown"
 [protocols.scancodes]
-0x3a = "KEY_0"
-0x31 = "KEY_1"
-0x32 = "KEY_2"
-0x33 = "KEY_3"
-0x34 = "KEY_4"
-0x35 = "KEY_5"
-0x36 = "KEY_6"
-0x37 = "KEY_7"
-0x38 = "KEY_8"
-0x39 = "KEY_9"
+0x3a = "KEY_NUMERIC_0"
+0x31 = "KEY_NUMERIC_1"
+0x32 = "KEY_NUMERIC_2"
+0x33 = "KEY_NUMERIC_3"
+0x34 = "KEY_NUMERIC_4"
+0x35 = "KEY_NUMERIC_5"
+0x36 = "KEY_NUMERIC_6"
+0x37 = "KEY_NUMERIC_7"
+0x38 = "KEY_NUMERIC_8"
+0x39 = "KEY_NUMERIC_9"
 0x2f = "KEY_POWER"
 0x2e = "KEY_P"
 0x1f = "KEY_L"
diff --git a/utils/keytable/rc_keymaps/pinnacle_pctv_hd.toml b/utils/keytable/rc_keymaps/pinnacle_pctv_hd.toml
index 1f66eab5..e80d7350 100644
--- a/utils/keytable/rc_keymaps/pinnacle_pctv_hd.toml
+++ b/utils/keytable/rc_keymaps/pinnacle_pctv_hd.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-pinnacle-pctv-hd.c as a source file
 [[protocols]]
 name = "pinnacle_pctv_hd"
 protocol = "rc5"
@@ -11,16 +15,16 @@ variant = "rc5"
 0x0709 = "KEY_VOLUMEDOWN"
 0x0706 = "KEY_CHANNELUP"
 0x070c = "KEY_CHANNELDOWN"
-0x070f = "KEY_1"
-0x0715 = "KEY_2"
-0x0710 = "KEY_3"
-0x0718 = "KEY_4"
-0x071b = "KEY_5"
-0x071e = "KEY_6"
-0x0711 = "KEY_7"
-0x0721 = "KEY_8"
-0x0712 = "KEY_9"
-0x0727 = "KEY_0"
+0x070f = "KEY_NUMERIC_1"
+0x0715 = "KEY_NUMERIC_2"
+0x0710 = "KEY_NUMERIC_3"
+0x0718 = "KEY_NUMERIC_4"
+0x071b = "KEY_NUMERIC_5"
+0x071e = "KEY_NUMERIC_6"
+0x0711 = "KEY_NUMERIC_7"
+0x0721 = "KEY_NUMERIC_8"
+0x0712 = "KEY_NUMERIC_9"
+0x0727 = "KEY_NUMERIC_0"
 0x0724 = "KEY_ZOOM"
 0x072a = "KEY_SUBTITLE"
 0x072d = "KEY_REWIND"
diff --git a/utils/keytable/rc_keymaps/pixelview.toml b/utils/keytable/rc_keymaps/pixelview.toml
index 344d12fc..be4011fe 100644
--- a/utils/keytable/rc_keymaps/pixelview.toml
+++ b/utils/keytable/rc_keymaps/pixelview.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-pixelview.c as a source file
 [[protocols]]
 name = "pixelview"
 protocol = "unknown"
@@ -12,16 +16,16 @@ protocol = "unknown"
 0x1a = "KEY_PLAYPAUSE"
 0x19 = "KEY_ZOOM"
 0x0f = "KEY_TEXT"
-0x01 = "KEY_1"
-0x0b = "KEY_2"
-0x1b = "KEY_3"
-0x05 = "KEY_4"
-0x09 = "KEY_5"
-0x15 = "KEY_6"
-0x06 = "KEY_7"
-0x0a = "KEY_8"
-0x12 = "KEY_9"
-0x02 = "KEY_0"
+0x01 = "KEY_NUMERIC_1"
+0x0b = "KEY_NUMERIC_2"
+0x1b = "KEY_NUMERIC_3"
+0x05 = "KEY_NUMERIC_4"
+0x09 = "KEY_NUMERIC_5"
+0x15 = "KEY_NUMERIC_6"
+0x06 = "KEY_NUMERIC_7"
+0x0a = "KEY_NUMERIC_8"
+0x12 = "KEY_NUMERIC_9"
+0x02 = "KEY_NUMERIC_0"
 0x10 = "KEY_LAST"
 0x13 = "KEY_LIST"
 0x1f = "KEY_CHANNELUP"
diff --git a/utils/keytable/rc_keymaps/pixelview_002t.toml b/utils/keytable/rc_keymaps/pixelview_002t.toml
index 1b781ae9..7375726d 100644
--- a/utils/keytable/rc_keymaps/pixelview_002t.toml
+++ b/utils/keytable/rc_keymaps/pixelview_002t.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-pixelview-002t.c as a source file
 [[protocols]]
 name = "pixelview_002t"
 protocol = "nec"
@@ -5,16 +9,16 @@ variant = "necx"
 [protocols.scancodes]
 0x866b13 = "KEY_MUTE"
 0x866b12 = "KEY_POWER2"
-0x866b01 = "KEY_1"
-0x866b02 = "KEY_2"
-0x866b03 = "KEY_3"
-0x866b04 = "KEY_4"
-0x866b05 = "KEY_5"
-0x866b06 = "KEY_6"
-0x866b07 = "KEY_7"
-0x866b08 = "KEY_8"
-0x866b09 = "KEY_9"
-0x866b00 = "KEY_0"
+0x866b01 = "KEY_NUMERIC_1"
+0x866b02 = "KEY_NUMERIC_2"
+0x866b03 = "KEY_NUMERIC_3"
+0x866b04 = "KEY_NUMERIC_4"
+0x866b05 = "KEY_NUMERIC_5"
+0x866b06 = "KEY_NUMERIC_6"
+0x866b07 = "KEY_NUMERIC_7"
+0x866b08 = "KEY_NUMERIC_8"
+0x866b09 = "KEY_NUMERIC_9"
+0x866b00 = "KEY_NUMERIC_0"
 0x866b0d = "KEY_CHANNELUP"
 0x866b19 = "KEY_CHANNELDOWN"
 0x866b10 = "KEY_VOLUMEUP"
diff --git a/utils/keytable/rc_keymaps/pixelview_mk12.toml b/utils/keytable/rc_keymaps/pixelview_mk12.toml
index 85ff5477..bc8ecfc9 100644
--- a/utils/keytable/rc_keymaps/pixelview_mk12.toml
+++ b/utils/keytable/rc_keymaps/pixelview_mk12.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-pixelview-mk12.c as a source file
 [[protocols]]
 name = "pixelview_mk12"
 protocol = "nec"
@@ -5,16 +9,16 @@ variant = "necx"
 [protocols.scancodes]
 0x866b03 = "KEY_TUNER"
 0x866b1e = "KEY_POWER2"
-0x866b01 = "KEY_1"
-0x866b0b = "KEY_2"
-0x866b1b = "KEY_3"
-0x866b05 = "KEY_4"
-0x866b09 = "KEY_5"
-0x866b15 = "KEY_6"
-0x866b06 = "KEY_7"
-0x866b0a = "KEY_8"
-0x866b12 = "KEY_9"
-0x866b02 = "KEY_0"
+0x866b01 = "KEY_NUMERIC_1"
+0x866b0b = "KEY_NUMERIC_2"
+0x866b1b = "KEY_NUMERIC_3"
+0x866b05 = "KEY_NUMERIC_4"
+0x866b09 = "KEY_NUMERIC_5"
+0x866b15 = "KEY_NUMERIC_6"
+0x866b06 = "KEY_NUMERIC_7"
+0x866b0a = "KEY_NUMERIC_8"
+0x866b12 = "KEY_NUMERIC_9"
+0x866b02 = "KEY_NUMERIC_0"
 0x866b13 = "KEY_AGAIN"
 0x866b10 = "KEY_DIGITS"
 0x866b00 = "KEY_VIDEO"
diff --git a/utils/keytable/rc_keymaps/pixelview_new.toml b/utils/keytable/rc_keymaps/pixelview_new.toml
index cf86cc87..11f37b9f 100644
--- a/utils/keytable/rc_keymaps/pixelview_new.toml
+++ b/utils/keytable/rc_keymaps/pixelview_new.toml
@@ -1,19 +1,23 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-pixelview-new.c as a source file
 [[protocols]]
 name = "pixelview_new"
 protocol = "unknown"
 [protocols.scancodes]
 0x3c = "KEY_TIME"
 0x12 = "KEY_POWER"
-0x3d = "KEY_1"
-0x38 = "KEY_2"
-0x18 = "KEY_3"
-0x35 = "KEY_4"
-0x39 = "KEY_5"
-0x15 = "KEY_6"
-0x36 = "KEY_7"
-0x3a = "KEY_8"
-0x1e = "KEY_9"
-0x3e = "KEY_0"
+0x3d = "KEY_NUMERIC_1"
+0x38 = "KEY_NUMERIC_2"
+0x18 = "KEY_NUMERIC_3"
+0x35 = "KEY_NUMERIC_4"
+0x39 = "KEY_NUMERIC_5"
+0x15 = "KEY_NUMERIC_6"
+0x36 = "KEY_NUMERIC_7"
+0x3a = "KEY_NUMERIC_8"
+0x1e = "KEY_NUMERIC_9"
+0x3e = "KEY_NUMERIC_0"
 0x1c = "KEY_AGAIN"
 0x3f = "KEY_VIDEO"
 0x1f = "KEY_LAST"
diff --git a/utils/keytable/rc_keymaps/powercolor_real_angel.toml b/utils/keytable/rc_keymaps/powercolor_real_angel.toml
index 900ae15c..499b37ea 100644
--- a/utils/keytable/rc_keymaps/powercolor_real_angel.toml
+++ b/utils/keytable/rc_keymaps/powercolor_real_angel.toml
@@ -1,19 +1,23 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-powercolor-real-angel.c as a source file
 [[protocols]]
 name = "powercolor_real_angel"
 protocol = "unknown"
 [protocols.scancodes]
 0x38 = "KEY_SWITCHVIDEOMODE"
 0x0c = "KEY_MEDIA"
-0x00 = "KEY_0"
-0x01 = "KEY_1"
-0x02 = "KEY_2"
-0x03 = "KEY_3"
-0x04 = "KEY_4"
-0x05 = "KEY_5"
-0x06 = "KEY_6"
-0x07 = "KEY_7"
-0x08 = "KEY_8"
-0x09 = "KEY_9"
+0x00 = "KEY_NUMERIC_0"
+0x01 = "KEY_NUMERIC_1"
+0x02 = "KEY_NUMERIC_2"
+0x03 = "KEY_NUMERIC_3"
+0x04 = "KEY_NUMERIC_4"
+0x05 = "KEY_NUMERIC_5"
+0x06 = "KEY_NUMERIC_6"
+0x07 = "KEY_NUMERIC_7"
+0x08 = "KEY_NUMERIC_8"
+0x09 = "KEY_NUMERIC_9"
 0x0a = "KEY_DIGITS"
 0x29 = "KEY_PREVIOUS"
 0x12 = "KEY_BRIGHTNESSUP"
diff --git a/utils/keytable/rc_keymaps/proteus_2309.toml b/utils/keytable/rc_keymaps/proteus_2309.toml
index eb47c794..c0795359 100644
--- a/utils/keytable/rc_keymaps/proteus_2309.toml
+++ b/utils/keytable/rc_keymaps/proteus_2309.toml
@@ -1,17 +1,21 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-proteus-2309.c as a source file
 [[protocols]]
 name = "proteus_2309"
 protocol = "unknown"
 [protocols.scancodes]
-0x00 = "KEY_0"
-0x01 = "KEY_1"
-0x02 = "KEY_2"
-0x03 = "KEY_3"
-0x04 = "KEY_4"
-0x05 = "KEY_5"
-0x06 = "KEY_6"
-0x07 = "KEY_7"
-0x08 = "KEY_8"
-0x09 = "KEY_9"
+0x00 = "KEY_NUMERIC_0"
+0x01 = "KEY_NUMERIC_1"
+0x02 = "KEY_NUMERIC_2"
+0x03 = "KEY_NUMERIC_3"
+0x04 = "KEY_NUMERIC_4"
+0x05 = "KEY_NUMERIC_5"
+0x06 = "KEY_NUMERIC_6"
+0x07 = "KEY_NUMERIC_7"
+0x08 = "KEY_NUMERIC_8"
+0x09 = "KEY_NUMERIC_9"
 0x5c = "KEY_POWER"
 0x20 = "KEY_ZOOM"
 0x0f = "KEY_BACKSPACE"
diff --git a/utils/keytable/rc_keymaps/purpletv.toml b/utils/keytable/rc_keymaps/purpletv.toml
index be03b915..7a81f287 100644
--- a/utils/keytable/rc_keymaps/purpletv.toml
+++ b/utils/keytable/rc_keymaps/purpletv.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-purpletv.c as a source file
 [[protocols]]
 name = "purpletv"
 protocol = "unknown"
@@ -5,16 +9,16 @@ protocol = "unknown"
 0x03 = "KEY_POWER"
 0x6f = "KEY_MUTE"
 0x10 = "KEY_BACKSPACE"
-0x11 = "KEY_0"
-0x04 = "KEY_1"
-0x05 = "KEY_2"
-0x06 = "KEY_3"
-0x08 = "KEY_4"
-0x09 = "KEY_5"
-0x0a = "KEY_6"
-0x0c = "KEY_7"
-0x0d = "KEY_8"
-0x0e = "KEY_9"
+0x11 = "KEY_NUMERIC_0"
+0x04 = "KEY_NUMERIC_1"
+0x05 = "KEY_NUMERIC_2"
+0x06 = "KEY_NUMERIC_3"
+0x08 = "KEY_NUMERIC_4"
+0x09 = "KEY_NUMERIC_5"
+0x0a = "KEY_NUMERIC_6"
+0x0c = "KEY_NUMERIC_7"
+0x0d = "KEY_NUMERIC_8"
+0x0e = "KEY_NUMERIC_9"
 0x12 = "KEY_DOT"
 0x07 = "KEY_VOLUMEUP"
 0x0b = "KEY_VOLUMEDOWN"
diff --git a/utils/keytable/rc_keymaps/pv951.toml b/utils/keytable/rc_keymaps/pv951.toml
index 1a824452..98a893aa 100644
--- a/utils/keytable/rc_keymaps/pv951.toml
+++ b/utils/keytable/rc_keymaps/pv951.toml
@@ -1,17 +1,21 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-pv951.c as a source file
 [[protocols]]
 name = "pv951"
 protocol = "unknown"
 [protocols.scancodes]
-0x00 = "KEY_0"
-0x01 = "KEY_1"
-0x02 = "KEY_2"
-0x03 = "KEY_3"
-0x04 = "KEY_4"
-0x05 = "KEY_5"
-0x06 = "KEY_6"
-0x07 = "KEY_7"
-0x08 = "KEY_8"
-0x09 = "KEY_9"
+0x00 = "KEY_NUMERIC_0"
+0x01 = "KEY_NUMERIC_1"
+0x02 = "KEY_NUMERIC_2"
+0x03 = "KEY_NUMERIC_3"
+0x04 = "KEY_NUMERIC_4"
+0x05 = "KEY_NUMERIC_5"
+0x06 = "KEY_NUMERIC_6"
+0x07 = "KEY_NUMERIC_7"
+0x08 = "KEY_NUMERIC_8"
+0x09 = "KEY_NUMERIC_9"
 0x12 = "KEY_POWER"
 0x10 = "KEY_MUTE"
 0x1f = "KEY_VOLUMEDOWN"
diff --git a/utils/keytable/rc_keymaps/rc6_mce.toml b/utils/keytable/rc_keymaps/rc6_mce.toml
index 628292e3..7a2dd972 100644
--- a/utils/keytable/rc_keymaps/rc6_mce.toml
+++ b/utils/keytable/rc_keymaps/rc6_mce.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-rc6-mce.c as a source file
 [[protocols]]
 name = "rc6_mce"
 protocol = "rc6"
diff --git a/utils/keytable/rc_keymaps/real_audio_220_32_keys.toml b/utils/keytable/rc_keymaps/real_audio_220_32_keys.toml
index 6432df7c..e40c7970 100644
--- a/utils/keytable/rc_keymaps/real_audio_220_32_keys.toml
+++ b/utils/keytable/rc_keymaps/real_audio_220_32_keys.toml
@@ -1,19 +1,23 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-real-audio-220-32-keys.c as a source file
 [[protocols]]
 name = "real_audio_220_32_keys"
 protocol = "unknown"
 [protocols.scancodes]
 0x1c = "KEY_RADIO"
 0x12 = "KEY_POWER2"
-0x01 = "KEY_1"
-0x02 = "KEY_2"
-0x03 = "KEY_3"
-0x04 = "KEY_4"
-0x05 = "KEY_5"
-0x06 = "KEY_6"
-0x07 = "KEY_7"
-0x08 = "KEY_8"
-0x09 = "KEY_9"
-0x00 = "KEY_0"
+0x01 = "KEY_NUMERIC_1"
+0x02 = "KEY_NUMERIC_2"
+0x03 = "KEY_NUMERIC_3"
+0x04 = "KEY_NUMERIC_4"
+0x05 = "KEY_NUMERIC_5"
+0x06 = "KEY_NUMERIC_6"
+0x07 = "KEY_NUMERIC_7"
+0x08 = "KEY_NUMERIC_8"
+0x09 = "KEY_NUMERIC_9"
+0x00 = "KEY_NUMERIC_0"
 0x0c = "KEY_VOLUMEUP"
 0x18 = "KEY_VOLUMEDOWN"
 0x0b = "KEY_CHANNELUP"
diff --git a/utils/keytable/rc_keymaps/reddo.toml b/utils/keytable/rc_keymaps/reddo.toml
index 31e286e6..d20fbe80 100644
--- a/utils/keytable/rc_keymaps/reddo.toml
+++ b/utils/keytable/rc_keymaps/reddo.toml
@@ -1,24 +1,28 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-reddo.c as a source file
 [[protocols]]
 name = "reddo"
 protocol = "nec"
 variant = "necx"
 [protocols.scancodes]
 0x61d601 = "KEY_EPG"
-0x61d602 = "KEY_3"
-0x61d604 = "KEY_1"
-0x61d605 = "KEY_5"
-0x61d606 = "KEY_6"
+0x61d602 = "KEY_NUMERIC_3"
+0x61d604 = "KEY_NUMERIC_1"
+0x61d605 = "KEY_NUMERIC_5"
+0x61d606 = "KEY_NUMERIC_6"
 0x61d607 = "KEY_CHANNELDOWN"
-0x61d608 = "KEY_2"
+0x61d608 = "KEY_NUMERIC_2"
 0x61d609 = "KEY_CHANNELUP"
-0x61d60a = "KEY_9"
+0x61d60a = "KEY_NUMERIC_9"
 0x61d60b = "KEY_ZOOM"
-0x61d60c = "KEY_7"
-0x61d60d = "KEY_8"
+0x61d60c = "KEY_NUMERIC_7"
+0x61d60d = "KEY_NUMERIC_8"
 0x61d60e = "KEY_VOLUMEUP"
-0x61d60f = "KEY_4"
+0x61d60f = "KEY_NUMERIC_4"
 0x61d610 = "KEY_ESC"
-0x61d611 = "KEY_0"
+0x61d611 = "KEY_NUMERIC_0"
 0x61d612 = "KEY_OK"
 0x61d613 = "KEY_VOLUMEDOWN"
 0x61d614 = "KEY_RECORD"
diff --git a/utils/keytable/rc_keymaps/snapstream_firefly.toml b/utils/keytable/rc_keymaps/snapstream_firefly.toml
index 3b6782d5..3fbc4bf6 100644
--- a/utils/keytable/rc_keymaps/snapstream_firefly.toml
+++ b/utils/keytable/rc_keymaps/snapstream_firefly.toml
@@ -1,19 +1,23 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-snapstream-firefly.c as a source file
 [[protocols]]
 name = "snapstream_firefly"
 protocol = "other"
 [protocols.scancodes]
 0x2c = "KEY_ZOOM"
 0x02 = "KEY_CLOSE"
-0x0d = "KEY_1"
-0x0e = "KEY_2"
-0x0f = "KEY_3"
-0x10 = "KEY_4"
-0x11 = "KEY_5"
-0x12 = "KEY_6"
-0x13 = "KEY_7"
-0x14 = "KEY_8"
-0x15 = "KEY_9"
-0x17 = "KEY_0"
+0x0d = "KEY_NUMERIC_1"
+0x0e = "KEY_NUMERIC_2"
+0x0f = "KEY_NUMERIC_3"
+0x10 = "KEY_NUMERIC_4"
+0x11 = "KEY_NUMERIC_5"
+0x12 = "KEY_NUMERIC_6"
+0x13 = "KEY_NUMERIC_7"
+0x14 = "KEY_NUMERIC_8"
+0x15 = "KEY_NUMERIC_9"
+0x17 = "KEY_NUMERIC_0"
 0x16 = "KEY_BACK"
 0x18 = "KEY_KPENTER"
 0x09 = "KEY_VOLUMEUP"
diff --git a/utils/keytable/rc_keymaps/streamzap.toml b/utils/keytable/rc_keymaps/streamzap.toml
index a25f6632..09491c60 100644
--- a/utils/keytable/rc_keymaps/streamzap.toml
+++ b/utils/keytable/rc_keymaps/streamzap.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-streamzap.c as a source file
 [[protocols]]
 name = "streamzap"
 protocol = "rc-5-sz"
diff --git a/utils/keytable/rc_keymaps/su3000.toml b/utils/keytable/rc_keymaps/su3000.toml
index 14c72efd..c22be8e5 100644
--- a/utils/keytable/rc_keymaps/su3000.toml
+++ b/utils/keytable/rc_keymaps/su3000.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-su3000.c as a source file
 [[protocols]]
 name = "su3000"
 protocol = "rc5"
@@ -5,16 +9,16 @@ variant = "rc5"
 [protocols.scancodes]
 0x25 = "KEY_POWER"
 0x0a = "KEY_MUTE"
-0x01 = "KEY_1"
-0x02 = "KEY_2"
-0x03 = "KEY_3"
-0x04 = "KEY_4"
-0x05 = "KEY_5"
-0x06 = "KEY_6"
-0x07 = "KEY_7"
-0x08 = "KEY_8"
-0x09 = "KEY_9"
-0x00 = "KEY_0"
+0x01 = "KEY_NUMERIC_1"
+0x02 = "KEY_NUMERIC_2"
+0x03 = "KEY_NUMERIC_3"
+0x04 = "KEY_NUMERIC_4"
+0x05 = "KEY_NUMERIC_5"
+0x06 = "KEY_NUMERIC_6"
+0x07 = "KEY_NUMERIC_7"
+0x08 = "KEY_NUMERIC_8"
+0x09 = "KEY_NUMERIC_9"
+0x00 = "KEY_NUMERIC_0"
 0x20 = "KEY_UP"
 0x21 = "KEY_DOWN"
 0x12 = "KEY_VOLUMEUP"
diff --git a/utils/keytable/rc_keymaps/tango.toml b/utils/keytable/rc_keymaps/tango.toml
index 59bfd789..86d70b60 100644
--- a/utils/keytable/rc_keymaps/tango.toml
+++ b/utils/keytable/rc_keymaps/tango.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-tango.c as a source file
 [[protocols]]
 name = "tango"
 protocol = "nec"
@@ -12,16 +16,16 @@ variant = "necx"
 0x4cb13 = "KEY_TV"
 0x4cb51 = "KEY_MUTE"
 0x4cb52 = "KEY_VOLUMEDOWN"
-0x4cb41 = "KEY_1"
-0x4cb03 = "KEY_2"
-0x4cb42 = "KEY_3"
-0x4cb45 = "KEY_4"
-0x4cb07 = "KEY_5"
-0x4cb46 = "KEY_6"
-0x4cb55 = "KEY_7"
-0x4cb17 = "KEY_8"
-0x4cb56 = "KEY_9"
-0x4cb1b = "KEY_0"
+0x4cb41 = "KEY_NUMERIC_1"
+0x4cb03 = "KEY_NUMERIC_2"
+0x4cb42 = "KEY_NUMERIC_3"
+0x4cb45 = "KEY_NUMERIC_4"
+0x4cb07 = "KEY_NUMERIC_5"
+0x4cb46 = "KEY_NUMERIC_6"
+0x4cb55 = "KEY_NUMERIC_7"
+0x4cb17 = "KEY_NUMERIC_8"
+0x4cb56 = "KEY_NUMERIC_9"
+0x4cb1b = "KEY_NUMERIC_0"
 0x4cb59 = "KEY_DELETE"
 0x4cb5a = "KEY_CAPSLOCK"
 0x4cb47 = "KEY_BACK"
diff --git a/utils/keytable/rc_keymaps/tbs_nec.toml b/utils/keytable/rc_keymaps/tbs_nec.toml
index 26ee6c93..00569416 100644
--- a/utils/keytable/rc_keymaps/tbs_nec.toml
+++ b/utils/keytable/rc_keymaps/tbs_nec.toml
@@ -1,19 +1,23 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-tbs-nec.c as a source file
 [[protocols]]
 name = "tbs_nec"
 protocol = "unknown"
 [protocols.scancodes]
 0x84 = "KEY_POWER2"
 0x94 = "KEY_MUTE"
-0x87 = "KEY_1"
-0x86 = "KEY_2"
-0x85 = "KEY_3"
-0x8b = "KEY_4"
-0x8a = "KEY_5"
-0x89 = "KEY_6"
-0x8f = "KEY_7"
-0x8e = "KEY_8"
-0x8d = "KEY_9"
-0x92 = "KEY_0"
+0x87 = "KEY_NUMERIC_1"
+0x86 = "KEY_NUMERIC_2"
+0x85 = "KEY_NUMERIC_3"
+0x8b = "KEY_NUMERIC_4"
+0x8a = "KEY_NUMERIC_5"
+0x89 = "KEY_NUMERIC_6"
+0x8f = "KEY_NUMERIC_7"
+0x8e = "KEY_NUMERIC_8"
+0x8d = "KEY_NUMERIC_9"
+0x92 = "KEY_NUMERIC_0"
 0xc0 = "KEY_10CHANNELSUP"
 0xd0 = "KEY_10CHANNELSDOWN"
 0x96 = "KEY_CHANNELUP"
diff --git a/utils/keytable/rc_keymaps/technisat_ts35.toml b/utils/keytable/rc_keymaps/technisat_ts35.toml
index 1e0b8157..f6a2a41d 100644
--- a/utils/keytable/rc_keymaps/technisat_ts35.toml
+++ b/utils/keytable/rc_keymaps/technisat_ts35.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-technisat-ts35.c as a source file
 [[protocols]]
 name = "technisat_ts35"
 protocol = "unknown"
@@ -6,16 +10,16 @@ protocol = "unknown"
 0x07 = "KEY_MEDIA"
 0x1c = "KEY_AB"
 0x33 = "KEY_POWER"
-0x3e = "KEY_1"
-0x3d = "KEY_2"
-0x3c = "KEY_3"
-0x3b = "KEY_4"
-0x3a = "KEY_5"
-0x39 = "KEY_6"
-0x38 = "KEY_7"
-0x37 = "KEY_8"
-0x36 = "KEY_9"
-0x3f = "KEY_0"
+0x3e = "KEY_NUMERIC_1"
+0x3d = "KEY_NUMERIC_2"
+0x3c = "KEY_NUMERIC_3"
+0x3b = "KEY_NUMERIC_4"
+0x3a = "KEY_NUMERIC_5"
+0x39 = "KEY_NUMERIC_6"
+0x38 = "KEY_NUMERIC_7"
+0x37 = "KEY_NUMERIC_8"
+0x36 = "KEY_NUMERIC_9"
+0x3f = "KEY_NUMERIC_0"
 0x35 = "KEY_DIGITS"
 0x2c = "KEY_TV"
 0x20 = "KEY_INFO"
diff --git a/utils/keytable/rc_keymaps/technisat_usb2.toml b/utils/keytable/rc_keymaps/technisat_usb2.toml
index d9eed664..00e19614 100644
--- a/utils/keytable/rc_keymaps/technisat_usb2.toml
+++ b/utils/keytable/rc_keymaps/technisat_usb2.toml
@@ -1,21 +1,25 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-technisat-usb2.c as a source file
 [[protocols]]
 name = "technisat_usb2"
 protocol = "rc5"
 variant = "rc5"
 [protocols.scancodes]
 0x0a0c = "KEY_POWER"
-0x0a01 = "KEY_1"
-0x0a02 = "KEY_2"
-0x0a03 = "KEY_3"
+0x0a01 = "KEY_NUMERIC_1"
+0x0a02 = "KEY_NUMERIC_2"
+0x0a03 = "KEY_NUMERIC_3"
 0x0a0d = "KEY_MUTE"
-0x0a04 = "KEY_4"
-0x0a05 = "KEY_5"
-0x0a06 = "KEY_6"
+0x0a04 = "KEY_NUMERIC_4"
+0x0a05 = "KEY_NUMERIC_5"
+0x0a06 = "KEY_NUMERIC_6"
 0x0a38 = "KEY_VIDEO"
-0x0a07 = "KEY_7"
-0x0a08 = "KEY_8"
-0x0a09 = "KEY_9"
-0x0a00 = "KEY_0"
+0x0a07 = "KEY_NUMERIC_7"
+0x0a08 = "KEY_NUMERIC_8"
+0x0a09 = "KEY_NUMERIC_9"
+0x0a00 = "KEY_NUMERIC_0"
 0x0a4f = "KEY_INFO"
 0x0a20 = "KEY_CHANNELUP"
 0x0a52 = "KEY_MENU"
diff --git a/utils/keytable/rc_keymaps/terratec_cinergy_c_pci.toml b/utils/keytable/rc_keymaps/terratec_cinergy_c_pci.toml
index b296cd31..b4951141 100644
--- a/utils/keytable/rc_keymaps/terratec_cinergy_c_pci.toml
+++ b/utils/keytable/rc_keymaps/terratec_cinergy_c_pci.toml
@@ -1,19 +1,23 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-terratec-cinergy-c-pci.c as a source file
 [[protocols]]
 name = "terratec_cinergy_c_pci"
 protocol = "unknown"
 [protocols.scancodes]
 0x3e = "KEY_POWER"
-0x3d = "KEY_1"
-0x3c = "KEY_2"
-0x3b = "KEY_3"
-0x3a = "KEY_4"
-0x39 = "KEY_5"
-0x38 = "KEY_6"
-0x37 = "KEY_7"
-0x36 = "KEY_8"
-0x35 = "KEY_9"
+0x3d = "KEY_NUMERIC_1"
+0x3c = "KEY_NUMERIC_2"
+0x3b = "KEY_NUMERIC_3"
+0x3a = "KEY_NUMERIC_4"
+0x39 = "KEY_NUMERIC_5"
+0x38 = "KEY_NUMERIC_6"
+0x37 = "KEY_NUMERIC_7"
+0x36 = "KEY_NUMERIC_8"
+0x35 = "KEY_NUMERIC_9"
 0x34 = "KEY_VIDEO_NEXT"
-0x33 = "KEY_0"
+0x33 = "KEY_NUMERIC_0"
 0x32 = "KEY_REFRESH"
 0x30 = "KEY_EPG"
 0x2f = "KEY_UP"
diff --git a/utils/keytable/rc_keymaps/terratec_cinergy_s2_hd.toml b/utils/keytable/rc_keymaps/terratec_cinergy_s2_hd.toml
index 1ec0246a..59e524aa 100644
--- a/utils/keytable/rc_keymaps/terratec_cinergy_s2_hd.toml
+++ b/utils/keytable/rc_keymaps/terratec_cinergy_s2_hd.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-terratec-cinergy-s2-hd.c as a source file
 [[protocols]]
 name = "terratec_cinergy_s2_hd"
 protocol = "unknown"
@@ -38,15 +42,15 @@ protocol = "unknown"
 0x2f = "KEY_UP"
 0x30 = "KEY_EPG"
 0x32 = "KEY_VIDEO"
-0x33 = "KEY_0"
+0x33 = "KEY_NUMERIC_0"
 0x34 = "KEY_VCR"
-0x35 = "KEY_9"
-0x36 = "KEY_8"
-0x37 = "KEY_7"
-0x38 = "KEY_6"
-0x39 = "KEY_5"
-0x3a = "KEY_4"
-0x3b = "KEY_3"
-0x3c = "KEY_2"
-0x3d = "KEY_1"
+0x35 = "KEY_NUMERIC_9"
+0x36 = "KEY_NUMERIC_8"
+0x37 = "KEY_NUMERIC_7"
+0x38 = "KEY_NUMERIC_6"
+0x39 = "KEY_NUMERIC_5"
+0x3a = "KEY_NUMERIC_4"
+0x3b = "KEY_NUMERIC_3"
+0x3c = "KEY_NUMERIC_2"
+0x3d = "KEY_NUMERIC_1"
 0x3e = "KEY_POWER"
diff --git a/utils/keytable/rc_keymaps/terratec_cinergy_xs.toml b/utils/keytable/rc_keymaps/terratec_cinergy_xs.toml
index 99eb07c3..8ec41862 100644
--- a/utils/keytable/rc_keymaps/terratec_cinergy_xs.toml
+++ b/utils/keytable/rc_keymaps/terratec_cinergy_xs.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-terratec-cinergy-xs.c as a source file
 [[protocols]]
 name = "terratec_cinergy_xs"
 protocol = "unknown"
@@ -5,20 +9,20 @@ protocol = "unknown"
 0x41 = "KEY_HOME"
 0x01 = "KEY_POWER"
 0x42 = "KEY_MENU"
-0x02 = "KEY_1"
-0x03 = "KEY_2"
-0x04 = "KEY_3"
+0x02 = "KEY_NUMERIC_1"
+0x03 = "KEY_NUMERIC_2"
+0x04 = "KEY_NUMERIC_3"
 0x43 = "KEY_SUBTITLE"
-0x05 = "KEY_4"
-0x06 = "KEY_5"
-0x07 = "KEY_6"
+0x05 = "KEY_NUMERIC_4"
+0x06 = "KEY_NUMERIC_5"
+0x07 = "KEY_NUMERIC_6"
 0x44 = "KEY_TEXT"
-0x08 = "KEY_7"
-0x09 = "KEY_8"
-0x0a = "KEY_9"
+0x08 = "KEY_NUMERIC_7"
+0x09 = "KEY_NUMERIC_8"
+0x0a = "KEY_NUMERIC_9"
 0x45 = "KEY_DELETE"
 0x0b = "KEY_TUNER"
-0x0c = "KEY_0"
+0x0c = "KEY_NUMERIC_0"
 0x0d = "KEY_MODE"
 0x46 = "KEY_TV"
 0x47 = "KEY_DVD"
diff --git a/utils/keytable/rc_keymaps/terratec_slim.toml b/utils/keytable/rc_keymaps/terratec_slim.toml
index fa1459e7..09a07254 100644
--- a/utils/keytable/rc_keymaps/terratec_slim.toml
+++ b/utils/keytable/rc_keymaps/terratec_slim.toml
@@ -1,18 +1,22 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-terratec-slim.c as a source file
 [[protocols]]
 name = "terratec_slim"
 protocol = "nec"
 variant = "necx"
 [protocols.scancodes]
-0x02bd00 = "KEY_1"
-0x02bd01 = "KEY_2"
-0x02bd02 = "KEY_3"
-0x02bd03 = "KEY_4"
-0x02bd04 = "KEY_5"
-0x02bd05 = "KEY_6"
-0x02bd06 = "KEY_7"
-0x02bd07 = "KEY_8"
-0x02bd08 = "KEY_9"
-0x02bd09 = "KEY_0"
+0x02bd00 = "KEY_NUMERIC_1"
+0x02bd01 = "KEY_NUMERIC_2"
+0x02bd02 = "KEY_NUMERIC_3"
+0x02bd03 = "KEY_NUMERIC_4"
+0x02bd04 = "KEY_NUMERIC_5"
+0x02bd05 = "KEY_NUMERIC_6"
+0x02bd06 = "KEY_NUMERIC_7"
+0x02bd07 = "KEY_NUMERIC_8"
+0x02bd08 = "KEY_NUMERIC_9"
+0x02bd09 = "KEY_NUMERIC_0"
 0x02bd0a = "KEY_MUTE"
 0x02bd0b = "KEY_NEW"
 0x02bd0e = "KEY_VOLUMEDOWN"
diff --git a/utils/keytable/rc_keymaps/terratec_slim_2.toml b/utils/keytable/rc_keymaps/terratec_slim_2.toml
index a5c900c0..0242f65d 100644
--- a/utils/keytable/rc_keymaps/terratec_slim_2.toml
+++ b/utils/keytable/rc_keymaps/terratec_slim_2.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-terratec-slim-2.c as a source file
 [[protocols]]
 name = "terratec_slim_2"
 protocol = "nec"
@@ -6,18 +10,18 @@ variant = "nec"
 0x8001 = "KEY_MUTE"
 0x8002 = "KEY_VOLUMEDOWN"
 0x8003 = "KEY_CHANNELDOWN"
-0x8004 = "KEY_1"
-0x8005 = "KEY_2"
-0x8006 = "KEY_3"
-0x8007 = "KEY_4"
-0x8008 = "KEY_5"
-0x8009 = "KEY_6"
-0x800a = "KEY_7"
+0x8004 = "KEY_NUMERIC_1"
+0x8005 = "KEY_NUMERIC_2"
+0x8006 = "KEY_NUMERIC_3"
+0x8007 = "KEY_NUMERIC_4"
+0x8008 = "KEY_NUMERIC_5"
+0x8009 = "KEY_NUMERIC_6"
+0x800a = "KEY_NUMERIC_7"
 0x800c = "KEY_ZOOM"
-0x800d = "KEY_0"
+0x800d = "KEY_NUMERIC_0"
 0x800e = "KEY_AGAIN"
 0x8012 = "KEY_POWER2"
 0x801a = "KEY_VOLUMEUP"
-0x801b = "KEY_8"
+0x801b = "KEY_NUMERIC_8"
 0x801e = "KEY_CHANNELUP"
-0x801f = "KEY_9"
+0x801f = "KEY_NUMERIC_9"
diff --git a/utils/keytable/rc_keymaps/tevii_nec.toml b/utils/keytable/rc_keymaps/tevii_nec.toml
index ee033478..5b69fd5b 100644
--- a/utils/keytable/rc_keymaps/tevii_nec.toml
+++ b/utils/keytable/rc_keymaps/tevii_nec.toml
@@ -1,19 +1,23 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-tevii-nec.c as a source file
 [[protocols]]
 name = "tevii_nec"
 protocol = "unknown"
 [protocols.scancodes]
 0x0a = "KEY_POWER2"
 0x0c = "KEY_MUTE"
-0x11 = "KEY_1"
-0x12 = "KEY_2"
-0x13 = "KEY_3"
-0x14 = "KEY_4"
-0x15 = "KEY_5"
-0x16 = "KEY_6"
-0x17 = "KEY_7"
-0x18 = "KEY_8"
-0x19 = "KEY_9"
-0x10 = "KEY_0"
+0x11 = "KEY_NUMERIC_1"
+0x12 = "KEY_NUMERIC_2"
+0x13 = "KEY_NUMERIC_3"
+0x14 = "KEY_NUMERIC_4"
+0x15 = "KEY_NUMERIC_5"
+0x16 = "KEY_NUMERIC_6"
+0x17 = "KEY_NUMERIC_7"
+0x18 = "KEY_NUMERIC_8"
+0x19 = "KEY_NUMERIC_9"
+0x10 = "KEY_NUMERIC_0"
 0x1c = "KEY_MENU"
 0x0f = "KEY_VOLUMEDOWN"
 0x1a = "KEY_LAST"
diff --git a/utils/keytable/rc_keymaps/tivo.toml b/utils/keytable/rc_keymaps/tivo.toml
index 0c7ef81a..443fcd06 100644
--- a/utils/keytable/rc_keymaps/tivo.toml
+++ b/utils/keytable/rc_keymaps/tivo.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-tivo.c as a source file
 [[protocols]]
 name = "tivo"
 protocol = "nec"
diff --git a/utils/keytable/rc_keymaps/total_media_in_hand.toml b/utils/keytable/rc_keymaps/total_media_in_hand.toml
index 6d05e43b..3db36965 100644
--- a/utils/keytable/rc_keymaps/total_media_in_hand.toml
+++ b/utils/keytable/rc_keymaps/total_media_in_hand.toml
@@ -1,18 +1,22 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-total-media-in-hand.c as a source file
 [[protocols]]
 name = "total_media_in_hand"
 protocol = "nec"
 variant = "necx"
 [protocols.scancodes]
-0x02bd00 = "KEY_1"
-0x02bd01 = "KEY_2"
-0x02bd02 = "KEY_3"
-0x02bd03 = "KEY_4"
-0x02bd04 = "KEY_5"
-0x02bd05 = "KEY_6"
-0x02bd06 = "KEY_7"
-0x02bd07 = "KEY_8"
-0x02bd08 = "KEY_9"
-0x02bd09 = "KEY_0"
+0x02bd00 = "KEY_NUMERIC_1"
+0x02bd01 = "KEY_NUMERIC_2"
+0x02bd02 = "KEY_NUMERIC_3"
+0x02bd03 = "KEY_NUMERIC_4"
+0x02bd04 = "KEY_NUMERIC_5"
+0x02bd05 = "KEY_NUMERIC_6"
+0x02bd06 = "KEY_NUMERIC_7"
+0x02bd07 = "KEY_NUMERIC_8"
+0x02bd08 = "KEY_NUMERIC_9"
+0x02bd09 = "KEY_NUMERIC_0"
 0x02bd0a = "KEY_MUTE"
 0x02bd0b = "KEY_CYCLEWINDOWS"
 0x02bd0c = "KEY_VIDEO"
diff --git a/utils/keytable/rc_keymaps/total_media_in_hand_02.toml b/utils/keytable/rc_keymaps/total_media_in_hand_02.toml
index aa68cb8a..895e7d1f 100644
--- a/utils/keytable/rc_keymaps/total_media_in_hand_02.toml
+++ b/utils/keytable/rc_keymaps/total_media_in_hand_02.toml
@@ -1,18 +1,22 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-total-media-in-hand-02.c as a source file
 [[protocols]]
 name = "total_media_in_hand_02"
 protocol = "rc5"
 variant = "rc5"
 [protocols.scancodes]
-0x0000 = "KEY_0"
-0x0001 = "KEY_1"
-0x0002 = "KEY_2"
-0x0003 = "KEY_3"
-0x0004 = "KEY_4"
-0x0005 = "KEY_5"
-0x0006 = "KEY_6"
-0x0007 = "KEY_7"
-0x0008 = "KEY_8"
-0x0009 = "KEY_9"
+0x0000 = "KEY_NUMERIC_0"
+0x0001 = "KEY_NUMERIC_1"
+0x0002 = "KEY_NUMERIC_2"
+0x0003 = "KEY_NUMERIC_3"
+0x0004 = "KEY_NUMERIC_4"
+0x0005 = "KEY_NUMERIC_5"
+0x0006 = "KEY_NUMERIC_6"
+0x0007 = "KEY_NUMERIC_7"
+0x0008 = "KEY_NUMERIC_8"
+0x0009 = "KEY_NUMERIC_9"
 0x000a = "KEY_MUTE"
 0x000b = "KEY_STOP"
 0x000c = "KEY_POWER2"
diff --git a/utils/keytable/rc_keymaps/trekstor.toml b/utils/keytable/rc_keymaps/trekstor.toml
index b9badeec..79819d06 100644
--- a/utils/keytable/rc_keymaps/trekstor.toml
+++ b/utils/keytable/rc_keymaps/trekstor.toml
@@ -1,9 +1,13 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-trekstor.c as a source file
 [[protocols]]
 name = "trekstor"
 protocol = "nec"
 variant = "nec"
 [protocols.scancodes]
-0x0084 = "KEY_0"
+0x0084 = "KEY_NUMERIC_0"
 0x0085 = "KEY_MUTE"
 0x0086 = "KEY_HOMEPAGE"
 0x0087 = "KEY_UP"
@@ -15,17 +19,17 @@ variant = "nec"
 0x008d = "KEY_PLAY"
 0x008e = "KEY_STOP"
 0x008f = "KEY_EPG"
-0x0090 = "KEY_7"
-0x0091 = "KEY_4"
-0x0092 = "KEY_1"
+0x0090 = "KEY_NUMERIC_7"
+0x0091 = "KEY_NUMERIC_4"
+0x0092 = "KEY_NUMERIC_1"
 0x0093 = "KEY_CHANNELDOWN"
-0x0094 = "KEY_8"
-0x0095 = "KEY_5"
-0x0096 = "KEY_2"
+0x0094 = "KEY_NUMERIC_8"
+0x0095 = "KEY_NUMERIC_5"
+0x0096 = "KEY_NUMERIC_2"
 0x0097 = "KEY_CHANNELUP"
-0x0098 = "KEY_9"
-0x0099 = "KEY_6"
-0x009a = "KEY_3"
+0x0098 = "KEY_NUMERIC_9"
+0x0099 = "KEY_NUMERIC_6"
+0x009a = "KEY_NUMERIC_3"
 0x009b = "KEY_VOLUMEDOWN"
 0x009c = "KEY_TV"
 0x009d = "KEY_RECORD"
diff --git a/utils/keytable/rc_keymaps/tt_1500.toml b/utils/keytable/rc_keymaps/tt_1500.toml
index 22ffe1f2..0c721fe9 100644
--- a/utils/keytable/rc_keymaps/tt_1500.toml
+++ b/utils/keytable/rc_keymaps/tt_1500.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-tt-1500.c as a source file
 [[protocols]]
 name = "tt_1500"
 protocol = "rc5"
@@ -5,16 +9,16 @@ variant = "rc5"
 [protocols.scancodes]
 0x1501 = "KEY_POWER"
 0x1502 = "KEY_SHUFFLE"
-0x1503 = "KEY_1"
-0x1504 = "KEY_2"
-0x1505 = "KEY_3"
-0x1506 = "KEY_4"
-0x1507 = "KEY_5"
-0x1508 = "KEY_6"
-0x1509 = "KEY_7"
-0x150a = "KEY_8"
-0x150b = "KEY_9"
-0x150c = "KEY_0"
+0x1503 = "KEY_NUMERIC_1"
+0x1504 = "KEY_NUMERIC_2"
+0x1505 = "KEY_NUMERIC_3"
+0x1506 = "KEY_NUMERIC_4"
+0x1507 = "KEY_NUMERIC_5"
+0x1508 = "KEY_NUMERIC_6"
+0x1509 = "KEY_NUMERIC_7"
+0x150a = "KEY_NUMERIC_8"
+0x150b = "KEY_NUMERIC_9"
+0x150c = "KEY_NUMERIC_0"
 0x150d = "KEY_UP"
 0x150e = "KEY_LEFT"
 0x150f = "KEY_OK"
diff --git a/utils/keytable/rc_keymaps/tvwalkertwin.toml b/utils/keytable/rc_keymaps/tvwalkertwin.toml
index 2efa62d3..e84dbf48 100644
--- a/utils/keytable/rc_keymaps/tvwalkertwin.toml
+++ b/utils/keytable/rc_keymaps/tvwalkertwin.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/usb/dvb-usb/m920x.c as a source file
 [[protocols]]
 name = "tvwalkertwin"
 protocol = "unknown"
diff --git a/utils/keytable/rc_keymaps/twinhan_dtv_cab_ci.toml b/utils/keytable/rc_keymaps/twinhan_dtv_cab_ci.toml
index 72b5c559..c03df163 100644
--- a/utils/keytable/rc_keymaps/twinhan_dtv_cab_ci.toml
+++ b/utils/keytable/rc_keymaps/twinhan_dtv_cab_ci.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-twinhan-dtv-cab-ci.c as a source file
 [[protocols]]
 name = "twinhan_dtv_cab_ci"
 protocol = "unknown"
@@ -8,16 +12,16 @@ protocol = "unknown"
 0x17 = "KEY_INFO"
 0x23 = "KEY_EPG"
 0x3b = "KEY_F22"
-0x3c = "KEY_1"
-0x3e = "KEY_2"
-0x39 = "KEY_3"
-0x36 = "KEY_4"
-0x22 = "KEY_5"
-0x20 = "KEY_6"
-0x32 = "KEY_7"
-0x26 = "KEY_8"
-0x24 = "KEY_9"
-0x2a = "KEY_0"
+0x3c = "KEY_NUMERIC_1"
+0x3e = "KEY_NUMERIC_2"
+0x39 = "KEY_NUMERIC_3"
+0x36 = "KEY_NUMERIC_4"
+0x22 = "KEY_NUMERIC_5"
+0x20 = "KEY_NUMERIC_6"
+0x32 = "KEY_NUMERIC_7"
+0x26 = "KEY_NUMERIC_8"
+0x24 = "KEY_NUMERIC_9"
+0x2a = "KEY_NUMERIC_0"
 0x33 = "KEY_CANCEL"
 0x2c = "KEY_BACK"
 0x15 = "KEY_CLEAR"
diff --git a/utils/keytable/rc_keymaps/twinhan_vp1027_dvbs.toml b/utils/keytable/rc_keymaps/twinhan_vp1027_dvbs.toml
index 90d3331d..8717a3f1 100644
--- a/utils/keytable/rc_keymaps/twinhan_vp1027_dvbs.toml
+++ b/utils/keytable/rc_keymaps/twinhan_vp1027_dvbs.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-twinhan1027.c as a source file
 [[protocols]]
 name = "twinhan_vp1027_dvbs"
 protocol = "nec"
@@ -9,16 +13,16 @@ variant = "nec"
 0x48 = "KEY_INFO"
 0x1c = "KEY_EPG"
 0x04 = "KEY_LIST"
-0x03 = "KEY_1"
-0x01 = "KEY_2"
-0x06 = "KEY_3"
-0x09 = "KEY_4"
-0x1d = "KEY_5"
-0x1f = "KEY_6"
-0x0d = "KEY_7"
-0x19 = "KEY_8"
-0x1b = "KEY_9"
-0x15 = "KEY_0"
+0x03 = "KEY_NUMERIC_1"
+0x01 = "KEY_NUMERIC_2"
+0x06 = "KEY_NUMERIC_3"
+0x09 = "KEY_NUMERIC_4"
+0x1d = "KEY_NUMERIC_5"
+0x1f = "KEY_NUMERIC_6"
+0x0d = "KEY_NUMERIC_7"
+0x19 = "KEY_NUMERIC_8"
+0x1b = "KEY_NUMERIC_9"
+0x15 = "KEY_NUMERIC_0"
 0x0c = "KEY_CANCEL"
 0x4a = "KEY_CLEAR"
 0x13 = "KEY_BACKSPACE"
diff --git a/utils/keytable/rc_keymaps/videomate_k100.toml b/utils/keytable/rc_keymaps/videomate_k100.toml
index 6a36d983..44a6c773 100644
--- a/utils/keytable/rc_keymaps/videomate_k100.toml
+++ b/utils/keytable/rc_keymaps/videomate_k100.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-videomate-m1f.c as a source file
 [[protocols]]
 name = "videomate_k100"
 protocol = "unknown"
@@ -33,17 +37,17 @@ protocol = "unknown"
 0x10 = "KEY_PREVIOUS"
 0x0d = "KEY_PAUSE"
 0x0f = "KEY_NEXT"
-0x1e = "KEY_1"
-0x1f = "KEY_2"
-0x20 = "KEY_3"
-0x21 = "KEY_4"
-0x22 = "KEY_5"
-0x23 = "KEY_6"
-0x24 = "KEY_7"
-0x25 = "KEY_8"
-0x26 = "KEY_9"
+0x1e = "KEY_NUMERIC_1"
+0x1f = "KEY_NUMERIC_2"
+0x20 = "KEY_NUMERIC_3"
+0x21 = "KEY_NUMERIC_4"
+0x22 = "KEY_NUMERIC_5"
+0x23 = "KEY_NUMERIC_6"
+0x24 = "KEY_NUMERIC_7"
+0x25 = "KEY_NUMERIC_8"
+0x26 = "KEY_NUMERIC_9"
 0x2a = "KEY_NUMERIC_STAR"
-0x1d = "KEY_0"
+0x1d = "KEY_NUMERIC_0"
 0x29 = "KEY_SUBTITLE"
 0x27 = "KEY_CLEAR"
 0x34 = "KEY_SCREEN"
diff --git a/utils/keytable/rc_keymaps/videomate_s350.toml b/utils/keytable/rc_keymaps/videomate_s350.toml
index 07286cb3..561eda63 100644
--- a/utils/keytable/rc_keymaps/videomate_s350.toml
+++ b/utils/keytable/rc_keymaps/videomate_s350.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-videomate-s350.c as a source file
 [[protocols]]
 name = "videomate_s350"
 protocol = "unknown"
@@ -15,16 +19,16 @@ protocol = "unknown"
 0x13 = "KEY_CHANNELDOWN"
 0x14 = "KEY_MUTE"
 0x15 = "KEY_VOLUMEDOWN"
-0x16 = "KEY_1"
-0x17 = "KEY_2"
-0x18 = "KEY_3"
-0x19 = "KEY_4"
-0x1a = "KEY_5"
-0x1b = "KEY_6"
-0x1c = "KEY_7"
-0x1d = "KEY_8"
-0x1e = "KEY_9"
-0x1f = "KEY_0"
+0x16 = "KEY_NUMERIC_1"
+0x17 = "KEY_NUMERIC_2"
+0x18 = "KEY_NUMERIC_3"
+0x19 = "KEY_NUMERIC_4"
+0x1a = "KEY_NUMERIC_5"
+0x1b = "KEY_NUMERIC_6"
+0x1c = "KEY_NUMERIC_7"
+0x1d = "KEY_NUMERIC_8"
+0x1e = "KEY_NUMERIC_9"
+0x1f = "KEY_NUMERIC_0"
 0x21 = "KEY_SLEEP"
 0x24 = "KEY_ZOOM"
 0x25 = "KEY_LAST"
diff --git a/utils/keytable/rc_keymaps/videomate_tv_pvr.toml b/utils/keytable/rc_keymaps/videomate_tv_pvr.toml
index 2c2344df..a3712806 100644
--- a/utils/keytable/rc_keymaps/videomate_tv_pvr.toml
+++ b/utils/keytable/rc_keymaps/videomate_tv_pvr.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-videomate-tv-pvr.c as a source file
 [[protocols]]
 name = "videomate_tv_pvr"
 protocol = "unknown"
@@ -27,15 +31,15 @@ protocol = "unknown"
 0x10 = "KEY_CHANNELUP"
 0x13 = "KEY_CHANNELDOWN"
 0x04 = "KEY_RECORD"
-0x16 = "KEY_1"
-0x17 = "KEY_2"
-0x18 = "KEY_3"
-0x19 = "KEY_4"
-0x1a = "KEY_5"
-0x1b = "KEY_6"
-0x1c = "KEY_7"
-0x1d = "KEY_8"
-0x1e = "KEY_9"
-0x1f = "KEY_0"
+0x16 = "KEY_NUMERIC_1"
+0x17 = "KEY_NUMERIC_2"
+0x18 = "KEY_NUMERIC_3"
+0x19 = "KEY_NUMERIC_4"
+0x1a = "KEY_NUMERIC_5"
+0x1b = "KEY_NUMERIC_6"
+0x1c = "KEY_NUMERIC_7"
+0x1d = "KEY_NUMERIC_8"
+0x1e = "KEY_NUMERIC_9"
+0x1f = "KEY_NUMERIC_0"
 0x20 = "KEY_LANGUAGE"
 0x21 = "KEY_SLEEP"
diff --git a/utils/keytable/rc_keymaps/vp702x.toml b/utils/keytable/rc_keymaps/vp702x.toml
index 0a0a7d30..5d4789c3 100644
--- a/utils/keytable/rc_keymaps/vp702x.toml
+++ b/utils/keytable/rc_keymaps/vp702x.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/usb/dvb-usb/vp702x.c as a source file
 [[protocols]]
 name = "vp702x"
 protocol = "unknown"
diff --git a/utils/keytable/rc_keymaps/winfast.toml b/utils/keytable/rc_keymaps/winfast.toml
index ca581ab5..974eb1d6 100644
--- a/utils/keytable/rc_keymaps/winfast.toml
+++ b/utils/keytable/rc_keymaps/winfast.toml
@@ -1,17 +1,21 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-winfast.c as a source file
 [[protocols]]
 name = "winfast"
 protocol = "unknown"
 [protocols.scancodes]
-0x12 = "KEY_0"
-0x05 = "KEY_1"
-0x06 = "KEY_2"
-0x07 = "KEY_3"
-0x09 = "KEY_4"
-0x0a = "KEY_5"
-0x0b = "KEY_6"
-0x0d = "KEY_7"
-0x0e = "KEY_8"
-0x0f = "KEY_9"
+0x12 = "KEY_NUMERIC_0"
+0x05 = "KEY_NUMERIC_1"
+0x06 = "KEY_NUMERIC_2"
+0x07 = "KEY_NUMERIC_3"
+0x09 = "KEY_NUMERIC_4"
+0x0a = "KEY_NUMERIC_5"
+0x0b = "KEY_NUMERIC_6"
+0x0d = "KEY_NUMERIC_7"
+0x0e = "KEY_NUMERIC_8"
+0x0f = "KEY_NUMERIC_9"
 0x00 = "KEY_POWER2"
 0x1b = "KEY_AUDIO"
 0x02 = "KEY_TUNER"
diff --git a/utils/keytable/rc_keymaps/winfast_usbii_deluxe.toml b/utils/keytable/rc_keymaps/winfast_usbii_deluxe.toml
index 371312b6..c00c0ef4 100644
--- a/utils/keytable/rc_keymaps/winfast_usbii_deluxe.toml
+++ b/utils/keytable/rc_keymaps/winfast_usbii_deluxe.toml
@@ -1,17 +1,21 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-winfast-usbii-deluxe.c as a source file
 [[protocols]]
 name = "winfast_usbii_deluxe"
 protocol = "unknown"
 [protocols.scancodes]
-0x62 = "KEY_0"
-0x75 = "KEY_1"
-0x76 = "KEY_2"
-0x77 = "KEY_3"
-0x79 = "KEY_4"
-0x7a = "KEY_5"
-0x7b = "KEY_6"
-0x7d = "KEY_7"
-0x7e = "KEY_8"
-0x7f = "KEY_9"
+0x62 = "KEY_NUMERIC_0"
+0x75 = "KEY_NUMERIC_1"
+0x76 = "KEY_NUMERIC_2"
+0x77 = "KEY_NUMERIC_3"
+0x79 = "KEY_NUMERIC_4"
+0x7a = "KEY_NUMERIC_5"
+0x7b = "KEY_NUMERIC_6"
+0x7d = "KEY_NUMERIC_7"
+0x7e = "KEY_NUMERIC_8"
+0x7f = "KEY_NUMERIC_9"
 0x38 = "KEY_CAMERA"
 0x37 = "KEY_RECORD"
 0x35 = "KEY_TIME"
diff --git a/utils/keytable/rc_keymaps/xbox_dvd.toml b/utils/keytable/rc_keymaps/xbox_dvd.toml
index 16f7bdd5..71dbe465 100644
--- a/utils/keytable/rc_keymaps/xbox_dvd.toml
+++ b/utils/keytable/rc_keymaps/xbox_dvd.toml
@@ -1,3 +1,7 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-xbox-dvd.c as a source file
 [[protocols]]
 name = "xbox_dvd"
 protocol = "xbox_dvd"
@@ -8,16 +12,16 @@ protocol = "xbox_dvd"
 0xaa8 = "KEY_RIGHT"
 0xaa9 = "KEY_LEFT"
 0xac3 = "KEY_INFO"
-0xac6 = "KEY_9"
-0xac7 = "KEY_8"
-0xac8 = "KEY_7"
-0xac9 = "KEY_6"
-0xaca = "KEY_5"
-0xacb = "KEY_4"
-0xacc = "KEY_3"
-0xacd = "KEY_2"
-0xace = "KEY_1"
-0xacf = "KEY_0"
+0xac6 = "KEY_NUMERIC_9"
+0xac7 = "KEY_NUMERIC_8"
+0xac8 = "KEY_NUMERIC_7"
+0xac9 = "KEY_NUMERIC_6"
+0xaca = "KEY_NUMERIC_5"
+0xacb = "KEY_NUMERIC_4"
+0xacc = "KEY_NUMERIC_3"
+0xacd = "KEY_NUMERIC_2"
+0xace = "KEY_NUMERIC_1"
+0xacf = "KEY_NUMERIC_0"
 0xad5 = "KEY_ANGLE"
 0xad8 = "KEY_BACK"
 0xadd = "KEY_PREVIOUSSONG"
diff --git a/utils/keytable/rc_keymaps/zx_irdec.toml b/utils/keytable/rc_keymaps/zx_irdec.toml
index ec1b6c12..96290048 100644
--- a/utils/keytable/rc_keymaps/zx_irdec.toml
+++ b/utils/keytable/rc_keymaps/zx_irdec.toml
@@ -1,18 +1,22 @@
+# This file is a generated data file, do not modify manually
+#
+# Generated with gen_keytables.pl in v4l-utils
+# using drivers/media/rc/keymaps/rc-zx-irdec.c as a source file
 [[protocols]]
 name = "zx_irdec"
 protocol = "nec"
 variant = "nec"
 [protocols.scancodes]
-0x01 = "KEY_1"
-0x02 = "KEY_2"
-0x03 = "KEY_3"
-0x04 = "KEY_4"
-0x05 = "KEY_5"
-0x06 = "KEY_6"
-0x07 = "KEY_7"
-0x08 = "KEY_8"
-0x09 = "KEY_9"
-0x31 = "KEY_0"
+0x01 = "KEY_NUMERIC_1"
+0x02 = "KEY_NUMERIC_2"
+0x03 = "KEY_NUMERIC_3"
+0x04 = "KEY_NUMERIC_4"
+0x05 = "KEY_NUMERIC_5"
+0x06 = "KEY_NUMERIC_6"
+0x07 = "KEY_NUMERIC_7"
+0x08 = "KEY_NUMERIC_8"
+0x09 = "KEY_NUMERIC_9"
+0x31 = "KEY_NUMERIC_0"
 0x16 = "KEY_DELETE"
 0x0a = "KEY_MODE"
 0x0c = "KEY_VOLUMEUP"
-- 
2.21.0

