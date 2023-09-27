Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11EEB7B0531
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 15:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231903AbjI0NUZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 09:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231895AbjI0NUV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 09:20:21 -0400
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2405136
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 06:20:15 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id E25941000B2; Wed, 27 Sep 2023 14:20:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1695820813; bh=EGUEoTyNvfI3ygcIX2kuyI16lv7PKSheb6h7n/g6ztY=;
        h=Date:From:To:Cc:Subject:From;
        b=Zg3BVE47RCktLmiYhiWN1t/9IPNTosLd9IO+k0fAuHYk8AYoodPcobHgfPjZpxHtw
         Oe6E6pVyUSnOSbyip2+r/Tu4pmaggIxV6Wy63jTmqXGVHjmlmg6PiJxFD1ZV4kdyTV
         oJwGRwZ7VQwdCO/J3CDZGeEPbILxBSBFaYWZCmIeOvzQF9897hFpwmDCFbCaMijrpV
         4O9pFSEG49Bjfsk6sOrmR3SaTReJVkya18ZrIDsNVuV6Ua4QE/u0BUvGsCu8RMrmyK
         IA9PRqtqyxkw4c3Jzrcy4vlGRuwFuUbmBMsnEiENxcWPFsPXEbAku4oUlfhntT3zCP
         loVvxY9nshNFQ==
Date:   Wed, 27 Sep 2023 14:20:13 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2] media/rc/keymaps: add missing MODULE_DESCRIPTION to
 keymaps
Message-ID: <ZRQsDTX+iU57tkFd@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When building the modules 'modpost' warns about missing MODULE_DESCRIPTION.

Since almost none of the rc keymap modules have this, it produces a lot of warnings.

As a first step to fixing all media modules, add this line to all keymaps.
The description should be a human-readable string describing the remote
or the remote controller that the keymap can be used with.

Note that keymaps/rc-cec.c is actually compiled into the rc-core, so that is the
sole keymap source that didn't need this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/keymaps/rc-adstech-dvb-t-pci.c       | 1 +
 drivers/media/rc/keymaps/rc-alink-dtu-m.c             | 1 +
 drivers/media/rc/keymaps/rc-anysee.c                  | 1 +
 drivers/media/rc/keymaps/rc-apac-viewcomp.c           | 1 +
 drivers/media/rc/keymaps/rc-astrometa-t2hybrid.c      | 1 +
 drivers/media/rc/keymaps/rc-asus-pc39.c               | 1 +
 drivers/media/rc/keymaps/rc-asus-ps3-100.c            | 1 +
 drivers/media/rc/keymaps/rc-ati-tv-wonder-hd-600.c    | 1 +
 drivers/media/rc/keymaps/rc-ati-x10.c                 | 1 +
 drivers/media/rc/keymaps/rc-avermedia-a16d.c          | 1 +
 drivers/media/rc/keymaps/rc-avermedia-cardbus.c       | 1 +
 drivers/media/rc/keymaps/rc-avermedia-dvbt.c          | 1 +
 drivers/media/rc/keymaps/rc-avermedia-m135a.c         | 1 +
 drivers/media/rc/keymaps/rc-avermedia-m733a-rm-k6.c   | 1 +
 drivers/media/rc/keymaps/rc-avermedia-rm-ks.c         | 1 +
 drivers/media/rc/keymaps/rc-avermedia.c               | 1 +
 drivers/media/rc/keymaps/rc-avertv-303.c              | 1 +
 drivers/media/rc/keymaps/rc-azurewave-ad-tu700.c      | 1 +
 drivers/media/rc/keymaps/rc-beelink-gs1.c             | 1 +
 drivers/media/rc/keymaps/rc-beelink-mxiii.c           | 1 +
 drivers/media/rc/keymaps/rc-behold-columbus.c         | 1 +
 drivers/media/rc/keymaps/rc-behold.c                  | 1 +
 drivers/media/rc/keymaps/rc-budget-ci-old.c           | 1 +
 drivers/media/rc/keymaps/rc-cinergy-1400.c            | 1 +
 drivers/media/rc/keymaps/rc-cinergy.c                 | 1 +
 drivers/media/rc/keymaps/rc-ct-90405.c                | 1 +
 drivers/media/rc/keymaps/rc-d680-dmb.c                | 1 +
 drivers/media/rc/keymaps/rc-dib0700-nec.c             | 1 +
 drivers/media/rc/keymaps/rc-dib0700-rc5.c             | 1 +
 drivers/media/rc/keymaps/rc-digitalnow-tinytwin.c     | 1 +
 drivers/media/rc/keymaps/rc-digittrade.c              | 1 +
 drivers/media/rc/keymaps/rc-dm1105-nec.c              | 1 +
 drivers/media/rc/keymaps/rc-dntv-live-dvb-t.c         | 1 +
 drivers/media/rc/keymaps/rc-dntv-live-dvbt-pro.c      | 1 +
 drivers/media/rc/keymaps/rc-dreambox.c                | 1 +
 drivers/media/rc/keymaps/rc-dtt200u.c                 | 1 +
 drivers/media/rc/keymaps/rc-dvbsky.c                  | 1 +
 drivers/media/rc/keymaps/rc-dvico-mce.c               | 1 +
 drivers/media/rc/keymaps/rc-dvico-portable.c          | 1 +
 drivers/media/rc/keymaps/rc-em-terratec.c             | 1 +
 drivers/media/rc/keymaps/rc-encore-enltv-fm53.c       | 1 +
 drivers/media/rc/keymaps/rc-encore-enltv.c            | 1 +
 drivers/media/rc/keymaps/rc-encore-enltv2.c           | 1 +
 drivers/media/rc/keymaps/rc-evga-indtube.c            | 1 +
 drivers/media/rc/keymaps/rc-eztv.c                    | 1 +
 drivers/media/rc/keymaps/rc-flydvb.c                  | 1 +
 drivers/media/rc/keymaps/rc-flyvideo.c                | 1 +
 drivers/media/rc/keymaps/rc-fusionhdtv-mce.c          | 1 +
 drivers/media/rc/keymaps/rc-gadmei-rm008z.c           | 1 +
 drivers/media/rc/keymaps/rc-geekbox.c                 | 1 +
 drivers/media/rc/keymaps/rc-genius-tvgo-a11mce.c      | 1 +
 drivers/media/rc/keymaps/rc-gotview7135.c             | 1 +
 drivers/media/rc/keymaps/rc-hauppauge.c               | 1 +
 drivers/media/rc/keymaps/rc-hisi-poplar.c             | 1 +
 drivers/media/rc/keymaps/rc-hisi-tv-demo.c            | 1 +
 drivers/media/rc/keymaps/rc-imon-mce.c                | 1 +
 drivers/media/rc/keymaps/rc-imon-pad.c                | 1 +
 drivers/media/rc/keymaps/rc-imon-rsc.c                | 1 +
 drivers/media/rc/keymaps/rc-iodata-bctv7e.c           | 1 +
 drivers/media/rc/keymaps/rc-it913x-v1.c               | 1 +
 drivers/media/rc/keymaps/rc-it913x-v2.c               | 1 +
 drivers/media/rc/keymaps/rc-kaiomy.c                  | 1 +
 drivers/media/rc/keymaps/rc-khadas.c                  | 1 +
 drivers/media/rc/keymaps/rc-khamsin.c                 | 1 +
 drivers/media/rc/keymaps/rc-kworld-315u.c             | 1 +
 drivers/media/rc/keymaps/rc-kworld-pc150u.c           | 1 +
 drivers/media/rc/keymaps/rc-kworld-plus-tv-analog.c   | 1 +
 drivers/media/rc/keymaps/rc-leadtek-y04g0051.c        | 1 +
 drivers/media/rc/keymaps/rc-lme2510.c                 | 1 +
 drivers/media/rc/keymaps/rc-manli.c                   | 1 +
 drivers/media/rc/keymaps/rc-mecool-kii-pro.c          | 1 +
 drivers/media/rc/keymaps/rc-mecool-kiii-pro.c         | 1 +
 drivers/media/rc/keymaps/rc-medion-x10.c              | 1 +
 drivers/media/rc/keymaps/rc-minix-neo.c               | 3 ++-
 drivers/media/rc/keymaps/rc-msi-digivox-ii.c          | 1 +
 drivers/media/rc/keymaps/rc-msi-digivox-iii.c         | 1 +
 drivers/media/rc/keymaps/rc-msi-tvanywhere-plus.c     | 1 +
 drivers/media/rc/keymaps/rc-msi-tvanywhere.c          | 1 +
 drivers/media/rc/keymaps/rc-nebula.c                  | 1 +
 drivers/media/rc/keymaps/rc-nec-terratec-cinergy-xs.c | 1 +
 drivers/media/rc/keymaps/rc-norwood.c                 | 1 +
 drivers/media/rc/keymaps/rc-npgtech.c                 | 1 +
 drivers/media/rc/keymaps/rc-odroid.c                  | 1 +
 drivers/media/rc/keymaps/rc-pctv-sedna.c              | 1 +
 drivers/media/rc/keymaps/rc-pine64.c                  | 1 +
 drivers/media/rc/keymaps/rc-pinnacle-color.c          | 1 +
 drivers/media/rc/keymaps/rc-pinnacle-grey.c           | 1 +
 drivers/media/rc/keymaps/rc-pinnacle-pctv-hd.c        | 1 +
 drivers/media/rc/keymaps/rc-pixelview-002t.c          | 1 +
 drivers/media/rc/keymaps/rc-pixelview-mk12.c          | 1 +
 drivers/media/rc/keymaps/rc-pixelview-new.c           | 1 +
 drivers/media/rc/keymaps/rc-pixelview.c               | 1 +
 drivers/media/rc/keymaps/rc-powercolor-real-angel.c   | 1 +
 drivers/media/rc/keymaps/rc-proteus-2309.c            | 1 +
 drivers/media/rc/keymaps/rc-purpletv.c                | 1 +
 drivers/media/rc/keymaps/rc-pv951.c                   | 1 +
 drivers/media/rc/keymaps/rc-rc6-mce.c                 | 1 +
 drivers/media/rc/keymaps/rc-real-audio-220-32-keys.c  | 1 +
 drivers/media/rc/keymaps/rc-reddo.c                   | 1 +
 drivers/media/rc/keymaps/rc-snapstream-firefly.c      | 1 +
 drivers/media/rc/keymaps/rc-streamzap.c               | 1 +
 drivers/media/rc/keymaps/rc-su3000.c                  | 1 +
 drivers/media/rc/keymaps/rc-tanix-tx3mini.c           | 1 +
 drivers/media/rc/keymaps/rc-tanix-tx5max.c            | 1 +
 drivers/media/rc/keymaps/rc-tbs-nec.c                 | 1 +
 drivers/media/rc/keymaps/rc-technisat-ts35.c          | 1 +
 drivers/media/rc/keymaps/rc-technisat-usb2.c          | 1 +
 drivers/media/rc/keymaps/rc-terratec-cinergy-c-pci.c  | 1 +
 drivers/media/rc/keymaps/rc-terratec-cinergy-s2-hd.c  | 1 +
 drivers/media/rc/keymaps/rc-terratec-cinergy-xs.c     | 1 +
 drivers/media/rc/keymaps/rc-terratec-slim-2.c         | 1 +
 drivers/media/rc/keymaps/rc-terratec-slim.c           | 1 +
 drivers/media/rc/keymaps/rc-tevii-nec.c               | 1 +
 drivers/media/rc/keymaps/rc-tivo.c                    | 1 +
 drivers/media/rc/keymaps/rc-total-media-in-hand-02.c  | 1 +
 drivers/media/rc/keymaps/rc-total-media-in-hand.c     | 1 +
 drivers/media/rc/keymaps/rc-trekstor.c                | 1 +
 drivers/media/rc/keymaps/rc-tt-1500.c                 | 1 +
 drivers/media/rc/keymaps/rc-twinhan-dtv-cab-ci.c      | 1 +
 drivers/media/rc/keymaps/rc-twinhan1027.c             | 1 +
 drivers/media/rc/keymaps/rc-vega-s9x.c                | 1 +
 drivers/media/rc/keymaps/rc-videomate-m1f.c           | 1 +
 drivers/media/rc/keymaps/rc-videomate-s350.c          | 1 +
 drivers/media/rc/keymaps/rc-videomate-tv-pvr.c        | 1 +
 drivers/media/rc/keymaps/rc-videostrong-kii-pro.c     | 1 +
 drivers/media/rc/keymaps/rc-wetek-hub.c               | 1 +
 drivers/media/rc/keymaps/rc-wetek-play2.c             | 1 +
 drivers/media/rc/keymaps/rc-winfast-usbii-deluxe.c    | 1 +
 drivers/media/rc/keymaps/rc-winfast.c                 | 1 +
 drivers/media/rc/keymaps/rc-x96max.c                  | 1 +
 drivers/media/rc/keymaps/rc-xbox-360.c                | 1 +
 drivers/media/rc/keymaps/rc-xbox-dvd.c                | 1 +
 drivers/media/rc/keymaps/rc-zx-irdec.c                | 1 +
 133 files changed, 134 insertions(+), 1 deletion(-)

diff --git a/drivers/media/rc/keymaps/rc-adstech-dvb-t-pci.c b/drivers/media/rc/keymaps/rc-adstech-dvb-t-pci.c
index 0a867ca90038..e24946c8fe20 100644
--- a/drivers/media/rc/keymaps/rc-adstech-dvb-t-pci.c
+++ b/drivers/media/rc/keymaps/rc-adstech-dvb-t-pci.c
@@ -83,3 +83,4 @@ module_exit(exit_rc_map_adstech_dvb_t_pci)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("ADS Tech Instant TV DVB-T PCI Remote");
diff --git a/drivers/media/rc/keymaps/rc-alink-dtu-m.c b/drivers/media/rc/keymaps/rc-alink-dtu-m.c
index 8a2ccaf3b817..9926259b43ee 100644
--- a/drivers/media/rc/keymaps/rc-alink-dtu-m.c
+++ b/drivers/media/rc/keymaps/rc-alink-dtu-m.c
@@ -54,3 +54,4 @@ module_exit(exit_rc_map_alink_dtu_m)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Antti Palosaari <crope@iki.fi>");
+MODULE_DESCRIPTION("A-Link DTU(m) slim remote, 6 rows, 3 columns.");
diff --git a/drivers/media/rc/keymaps/rc-anysee.c b/drivers/media/rc/keymaps/rc-anysee.c
index 34da03c46104..e4bcbf889fed 100644
--- a/drivers/media/rc/keymaps/rc-anysee.c
+++ b/drivers/media/rc/keymaps/rc-anysee.c
@@ -79,3 +79,4 @@ module_exit(exit_rc_map_anysee)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Antti Palosaari <crope@iki.fi>");
+MODULE_DESCRIPTION("Anysee remote keytable");
diff --git a/drivers/media/rc/keymaps/rc-apac-viewcomp.c b/drivers/media/rc/keymaps/rc-apac-viewcomp.c
index bdc47e25d46e..80b096f02e99 100644
--- a/drivers/media/rc/keymaps/rc-apac-viewcomp.c
+++ b/drivers/media/rc/keymaps/rc-apac-viewcomp.c
@@ -74,3 +74,4 @@ module_exit(exit_rc_map_apac_viewcomp)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("apac-viewcomp remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-astrometa-t2hybrid.c b/drivers/media/rc/keymaps/rc-astrometa-t2hybrid.c
index 1d322137898e..212b0d920901 100644
--- a/drivers/media/rc/keymaps/rc-astrometa-t2hybrid.c
+++ b/drivers/media/rc/keymaps/rc-astrometa-t2hybrid.c
@@ -62,3 +62,4 @@ module_exit(exit_rc_map_t2hybrid)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Oleh Kravchenko <oleg@kaa.org.ua>");
+MODULE_DESCRIPTION("Astrometa T2hybrid remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-asus-pc39.c b/drivers/media/rc/keymaps/rc-asus-pc39.c
index 7a4b3a6e3a49..bd55b7c6f82a 100644
--- a/drivers/media/rc/keymaps/rc-asus-pc39.c
+++ b/drivers/media/rc/keymaps/rc-asus-pc39.c
@@ -85,3 +85,4 @@ module_exit(exit_rc_map_asus_pc39)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("Model PC-39 keytable for asus-pc39 remote controller");
diff --git a/drivers/media/rc/keymaps/rc-asus-ps3-100.c b/drivers/media/rc/keymaps/rc-asus-ps3-100.c
index 09b60fa335e3..9d63c1e4a17a 100644
--- a/drivers/media/rc/keymaps/rc-asus-ps3-100.c
+++ b/drivers/media/rc/keymaps/rc-asus-ps3-100.c
@@ -84,3 +84,4 @@ module_exit(exit_rc_map_asus_ps3_100)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("Asus My Cinema PS3-100 remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-ati-tv-wonder-hd-600.c b/drivers/media/rc/keymaps/rc-ati-tv-wonder-hd-600.c
index b4b7932c0c5a..063237f0d2e2 100644
--- a/drivers/media/rc/keymaps/rc-ati-tv-wonder-hd-600.c
+++ b/drivers/media/rc/keymaps/rc-ati-tv-wonder-hd-600.c
@@ -63,3 +63,4 @@ module_exit(exit_rc_map_ati_tv_wonder_hd_600)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("ati-tv-wonder-hd-600 remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-ati-x10.c b/drivers/media/rc/keymaps/rc-ati-x10.c
index 31fe1106b708..9f7cbe9a1ac8 100644
--- a/drivers/media/rc/keymaps/rc-ati-x10.c
+++ b/drivers/media/rc/keymaps/rc-ati-x10.c
@@ -123,3 +123,4 @@ module_exit(exit_rc_map_ati_x10)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Anssi Hannula <anssi.hannula@iki.fi>");
+MODULE_DESCRIPTION("ATI X10 RF remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-avermedia-a16d.c b/drivers/media/rc/keymaps/rc-avermedia-a16d.c
index 6467ff6e48d7..98497f4f6f92 100644
--- a/drivers/media/rc/keymaps/rc-avermedia-a16d.c
+++ b/drivers/media/rc/keymaps/rc-avermedia-a16d.c
@@ -69,3 +69,4 @@ module_exit(exit_rc_map_avermedia_a16d)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("avermedia-a16d remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-avermedia-cardbus.c b/drivers/media/rc/keymaps/rc-avermedia-cardbus.c
index 54fc6d9022c2..5832c2f8ab3f 100644
--- a/drivers/media/rc/keymaps/rc-avermedia-cardbus.c
+++ b/drivers/media/rc/keymaps/rc-avermedia-cardbus.c
@@ -91,3 +91,4 @@ module_exit(exit_rc_map_avermedia_cardbus)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("avermedia-cardbus remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-avermedia-dvbt.c b/drivers/media/rc/keymaps/rc-avermedia-dvbt.c
index 92c6df3360b3..3157d0c1cee9 100644
--- a/drivers/media/rc/keymaps/rc-avermedia-dvbt.c
+++ b/drivers/media/rc/keymaps/rc-avermedia-dvbt.c
@@ -72,3 +72,4 @@ module_exit(exit_rc_map_avermedia_dvbt)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("avermedia-dvbt remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-avermedia-m135a.c b/drivers/media/rc/keymaps/rc-avermedia-m135a.c
index 311ddeb061ca..cc1318ad09d9 100644
--- a/drivers/media/rc/keymaps/rc-avermedia-m135a.c
+++ b/drivers/media/rc/keymaps/rc-avermedia-m135a.c
@@ -142,3 +142,4 @@ module_exit(exit_rc_map_avermedia_m135a)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("Avermedia M135A with RM-JX and RM-K6 remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-avermedia-m733a-rm-k6.c b/drivers/media/rc/keymaps/rc-avermedia-m733a-rm-k6.c
index a970ed5a090b..ec6c866c9f5d 100644
--- a/drivers/media/rc/keymaps/rc-avermedia-m733a-rm-k6.c
+++ b/drivers/media/rc/keymaps/rc-avermedia-m733a-rm-k6.c
@@ -90,3 +90,4 @@ module_exit(exit_rc_map_avermedia_m733a_rm_k6)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("Avermedia M733A with IR model RM-K6 remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-avermedia-rm-ks.c b/drivers/media/rc/keymaps/rc-avermedia-rm-ks.c
index cf8a4fd107f4..ee4fe5791add 100644
--- a/drivers/media/rc/keymaps/rc-avermedia-rm-ks.c
+++ b/drivers/media/rc/keymaps/rc-avermedia-rm-ks.c
@@ -65,3 +65,4 @@ module_exit(exit_rc_map_avermedia_rm_ks)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Antti Palosaari <crope@iki.fi>");
+MODULE_DESCRIPTION("AverMedia RM-KS remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-avermedia.c b/drivers/media/rc/keymaps/rc-avermedia.c
index f96f229b70bb..b827536a1f5f 100644
--- a/drivers/media/rc/keymaps/rc-avermedia.c
+++ b/drivers/media/rc/keymaps/rc-avermedia.c
@@ -80,3 +80,4 @@ module_exit(exit_rc_map_avermedia)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("avermedia remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-avertv-303.c b/drivers/media/rc/keymaps/rc-avertv-303.c
index a3e2e945c769..71d1da42528d 100644
--- a/drivers/media/rc/keymaps/rc-avertv-303.c
+++ b/drivers/media/rc/keymaps/rc-avertv-303.c
@@ -79,3 +79,4 @@ module_exit(exit_rc_map_avertv_303)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("AVERTV STUDIO 303 Remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-azurewave-ad-tu700.c b/drivers/media/rc/keymaps/rc-azurewave-ad-tu700.c
index 5fc8e4cd102e..56f8eb1f0d01 100644
--- a/drivers/media/rc/keymaps/rc-azurewave-ad-tu700.c
+++ b/drivers/media/rc/keymaps/rc-azurewave-ad-tu700.c
@@ -88,3 +88,4 @@ module_exit(exit_rc_map_azurewave_ad_tu700)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Antti Palosaari <crope@iki.fi>");
+MODULE_DESCRIPTION("TwinHan AzureWave AD-TU700(704J) remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-beelink-gs1.c b/drivers/media/rc/keymaps/rc-beelink-gs1.c
index cedbd5d20bc7..6e767d88c707 100644
--- a/drivers/media/rc/keymaps/rc-beelink-gs1.c
+++ b/drivers/media/rc/keymaps/rc-beelink-gs1.c
@@ -82,3 +82,4 @@ module_exit(exit_rc_map_beelink_gs1)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Clément Péron <peron.clem@gmail.com>");
+MODULE_DESCRIPTION("Beelink GS1 remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-beelink-mxiii.c b/drivers/media/rc/keymaps/rc-beelink-mxiii.c
index 01180cd92205..88fad9959a86 100644
--- a/drivers/media/rc/keymaps/rc-beelink-mxiii.c
+++ b/drivers/media/rc/keymaps/rc-beelink-mxiii.c
@@ -55,3 +55,4 @@ module_exit(exit_rc_map_beelink_mxiii)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Christian Hewitt <christianshewitt@gmail.com");
+MODULE_DESCRIPTION("Beelink Mini MXIII remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-behold-columbus.c b/drivers/media/rc/keymaps/rc-behold-columbus.c
index 8579b3d5128d..6bdc924ac3cf 100644
--- a/drivers/media/rc/keymaps/rc-behold-columbus.c
+++ b/drivers/media/rc/keymaps/rc-behold-columbus.c
@@ -102,3 +102,4 @@ module_exit(exit_rc_map_behold_columbus)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("BeholdTV Columbus remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-behold.c b/drivers/media/rc/keymaps/rc-behold.c
index 28397ce05a7f..0251ce835f79 100644
--- a/drivers/media/rc/keymaps/rc-behold.c
+++ b/drivers/media/rc/keymaps/rc-behold.c
@@ -135,3 +135,4 @@ module_exit(exit_rc_map_behold)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("BeholdTV 60x series remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-budget-ci-old.c b/drivers/media/rc/keymaps/rc-budget-ci-old.c
index 6ca822256862..8fda5d1e140b 100644
--- a/drivers/media/rc/keymaps/rc-budget-ci-old.c
+++ b/drivers/media/rc/keymaps/rc-budget-ci-old.c
@@ -87,3 +87,4 @@ module_exit(exit_rc_map_budget_ci_old)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("budget-ci-old remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-cinergy-1400.c b/drivers/media/rc/keymaps/rc-cinergy-1400.c
index 4433d28b219c..092c3533d712 100644
--- a/drivers/media/rc/keymaps/rc-cinergy-1400.c
+++ b/drivers/media/rc/keymaps/rc-cinergy-1400.c
@@ -78,3 +78,4 @@ module_exit(exit_rc_map_cinergy_1400)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("Cinergy 1400 DVB-T remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-cinergy.c b/drivers/media/rc/keymaps/rc-cinergy.c
index b34a37b8fe61..334a290a3b91 100644
--- a/drivers/media/rc/keymaps/rc-cinergy.c
+++ b/drivers/media/rc/keymaps/rc-cinergy.c
@@ -72,3 +72,4 @@ module_exit(exit_rc_map_cinergy)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("cinergy remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-ct-90405.c b/drivers/media/rc/keymaps/rc-ct-90405.c
index 8914c83c9d9f..d4638df37c53 100644
--- a/drivers/media/rc/keymaps/rc-ct-90405.c
+++ b/drivers/media/rc/keymaps/rc-ct-90405.c
@@ -84,3 +84,4 @@ module_exit(exit_rc_map_ct_90405)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Alexander Voronov <avv.0@ya.ru>");
+MODULE_DESCRIPTION("Toshiba CT-90405 remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-d680-dmb.c b/drivers/media/rc/keymaps/rc-d680-dmb.c
index d491a5e9750f..7870d36f2c69 100644
--- a/drivers/media/rc/keymaps/rc-d680-dmb.c
+++ b/drivers/media/rc/keymaps/rc-d680-dmb.c
@@ -70,3 +70,4 @@ module_exit(exit_rc_map_d680_dmb)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("d680-dmb remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-dib0700-nec.c b/drivers/media/rc/keymaps/rc-dib0700-nec.c
index f1fcdf16f485..0323049fd2b1 100644
--- a/drivers/media/rc/keymaps/rc-dib0700-nec.c
+++ b/drivers/media/rc/keymaps/rc-dib0700-nec.c
@@ -118,3 +118,4 @@ module_exit(exit_rc_map)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("dib0700-nec remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-dib0700-rc5.c b/drivers/media/rc/keymaps/rc-dib0700-rc5.c
index 002fffcba95d..d34e92eb92be 100644
--- a/drivers/media/rc/keymaps/rc-dib0700-rc5.c
+++ b/drivers/media/rc/keymaps/rc-dib0700-rc5.c
@@ -229,3 +229,4 @@ module_exit(exit_rc_map)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("dib0700-rc5 remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-digitalnow-tinytwin.c b/drivers/media/rc/keymaps/rc-digitalnow-tinytwin.c
index 2466d8c50226..d18b8f93a018 100644
--- a/drivers/media/rc/keymaps/rc-digitalnow-tinytwin.c
+++ b/drivers/media/rc/keymaps/rc-digitalnow-tinytwin.c
@@ -84,3 +84,4 @@ module_exit(exit_rc_map_digitalnow_tinytwin)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Antti Palosaari <crope@iki.fi>");
+MODULE_DESCRIPTION("DigitalNow TinyTwin remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-digittrade.c b/drivers/media/rc/keymaps/rc-digittrade.c
index 65bc8ad7e52c..129a81f59b4a 100644
--- a/drivers/media/rc/keymaps/rc-digittrade.c
+++ b/drivers/media/rc/keymaps/rc-digittrade.c
@@ -68,3 +68,4 @@ module_exit(exit_rc_map_digittrade)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Antti Palosaari <crope@iki.fi>");
+MODULE_DESCRIPTION("Digittrade DVB-T USB Stick remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-dm1105-nec.c b/drivers/media/rc/keymaps/rc-dm1105-nec.c
index cd0b985c994d..b82290ce925b 100644
--- a/drivers/media/rc/keymaps/rc-dm1105-nec.c
+++ b/drivers/media/rc/keymaps/rc-dm1105-nec.c
@@ -70,3 +70,4 @@ module_exit(exit_rc_map_dm1105_nec)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("dm1105-nec remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-dntv-live-dvb-t.c b/drivers/media/rc/keymaps/rc-dntv-live-dvb-t.c
index a82f64dc9411..4b23335615cf 100644
--- a/drivers/media/rc/keymaps/rc-dntv-live-dvb-t.c
+++ b/drivers/media/rc/keymaps/rc-dntv-live-dvb-t.c
@@ -72,3 +72,4 @@ module_exit(exit_rc_map_dntv_live_dvb_t)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("dntv-live-dvb-t remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-dntv-live-dvbt-pro.c b/drivers/media/rc/keymaps/rc-dntv-live-dvbt-pro.c
index d3f5048a0220..46d8ea1b49a3 100644
--- a/drivers/media/rc/keymaps/rc-dntv-live-dvbt-pro.c
+++ b/drivers/media/rc/keymaps/rc-dntv-live-dvbt-pro.c
@@ -91,3 +91,4 @@ module_exit(exit_rc_map_dntv_live_dvbt_pro)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("DigitalNow DNTV Live DVB-T Remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-dreambox.c b/drivers/media/rc/keymaps/rc-dreambox.c
index dea024fa3a22..e1ec99ce3105 100644
--- a/drivers/media/rc/keymaps/rc-dreambox.c
+++ b/drivers/media/rc/keymaps/rc-dreambox.c
@@ -149,3 +149,4 @@ module_exit(exit_rc_map_dreambox)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Emanuel Strobel <emanuel.strobel@yahoo.com>");
+MODULE_DESCRIPTION("Dreambox RC10/RC0 and RC20/RC-BT remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-dtt200u.c b/drivers/media/rc/keymaps/rc-dtt200u.c
index e7f87baa3212..eeb2f6e303d7 100644
--- a/drivers/media/rc/keymaps/rc-dtt200u.c
+++ b/drivers/media/rc/keymaps/rc-dtt200u.c
@@ -53,3 +53,4 @@ module_exit(exit_rc_map_dtt200u)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Jonathan McDowell <noodles@earth.li>");
+MODULE_DESCRIPTION("Wideview WT-220U remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-dvbsky.c b/drivers/media/rc/keymaps/rc-dvbsky.c
index f5063af2e5bc..1fcd47bd8595 100644
--- a/drivers/media/rc/keymaps/rc-dvbsky.c
+++ b/drivers/media/rc/keymaps/rc-dvbsky.c
@@ -71,3 +71,4 @@ module_exit(exit_rc_map_rc5_dvbsky)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Nibble Max <nibble.max@gmail.com>");
+MODULE_DESCRIPTION("DVBSky remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-dvico-mce.c b/drivers/media/rc/keymaps/rc-dvico-mce.c
index b1bb8cdb3705..4bb4222d259e 100644
--- a/drivers/media/rc/keymaps/rc-dvico-mce.c
+++ b/drivers/media/rc/keymaps/rc-dvico-mce.c
@@ -80,3 +80,4 @@ module_exit(exit_rc_map_dvico_mce)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("dvico-mce remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-dvico-portable.c b/drivers/media/rc/keymaps/rc-dvico-portable.c
index ec12ba6995dc..ba9ef9b75777 100644
--- a/drivers/media/rc/keymaps/rc-dvico-portable.c
+++ b/drivers/media/rc/keymaps/rc-dvico-portable.c
@@ -71,3 +71,4 @@ module_exit(exit_rc_map_dvico_portable)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("dvico-portable remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-em-terratec.c b/drivers/media/rc/keymaps/rc-em-terratec.c
index a1f59aa6ff23..8a51fe632840 100644
--- a/drivers/media/rc/keymaps/rc-em-terratec.c
+++ b/drivers/media/rc/keymaps/rc-em-terratec.c
@@ -63,3 +63,4 @@ module_exit(exit_rc_map_em_terratec)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("em-terratec remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-encore-enltv-fm53.c b/drivers/media/rc/keymaps/rc-encore-enltv-fm53.c
index 7a00471b6005..320e184f4298 100644
--- a/drivers/media/rc/keymaps/rc-encore-enltv-fm53.c
+++ b/drivers/media/rc/keymaps/rc-encore-enltv-fm53.c
@@ -75,3 +75,4 @@ module_exit(exit_rc_map_encore_enltv_fm53)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("Encore ENLTV-FM v5.3 remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-encore-enltv.c b/drivers/media/rc/keymaps/rc-encore-enltv.c
index 712210097b4d..0b235d72e57d 100644
--- a/drivers/media/rc/keymaps/rc-encore-enltv.c
+++ b/drivers/media/rc/keymaps/rc-encore-enltv.c
@@ -106,3 +106,4 @@ module_exit(exit_rc_map_encore_enltv)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("Encore ENLTV-FM remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-encore-enltv2.c b/drivers/media/rc/keymaps/rc-encore-enltv2.c
index a08470b4f187..d8057f41252d 100644
--- a/drivers/media/rc/keymaps/rc-encore-enltv2.c
+++ b/drivers/media/rc/keymaps/rc-encore-enltv2.c
@@ -84,3 +84,4 @@ module_exit(exit_rc_map_encore_enltv2)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("Encore ENLTV2-FM remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-evga-indtube.c b/drivers/media/rc/keymaps/rc-evga-indtube.c
index f4398444330b..95295f6882b1 100644
--- a/drivers/media/rc/keymaps/rc-evga-indtube.c
+++ b/drivers/media/rc/keymaps/rc-evga-indtube.c
@@ -55,3 +55,4 @@ module_exit(exit_rc_map_evga_indtube)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("EVGA inDtube remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-eztv.c b/drivers/media/rc/keymaps/rc-eztv.c
index 4e494d953e33..522e772f7c2b 100644
--- a/drivers/media/rc/keymaps/rc-eztv.c
+++ b/drivers/media/rc/keymaps/rc-eztv.c
@@ -90,3 +90,4 @@ module_exit(exit_rc_map_eztv)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("eztv remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-flydvb.c b/drivers/media/rc/keymaps/rc-flydvb.c
index 202a1fbd1935..fcb3bcadd82d 100644
--- a/drivers/media/rc/keymaps/rc-flydvb.c
+++ b/drivers/media/rc/keymaps/rc-flydvb.c
@@ -71,3 +71,4 @@ module_exit(exit_rc_map_flydvb)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("flydvb remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-flyvideo.c b/drivers/media/rc/keymaps/rc-flyvideo.c
index a44467fb15cb..fcb70c9507cf 100644
--- a/drivers/media/rc/keymaps/rc-flyvideo.c
+++ b/drivers/media/rc/keymaps/rc-flyvideo.c
@@ -64,3 +64,4 @@ module_exit(exit_rc_map_flyvideo)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("flyvideo remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-fusionhdtv-mce.c b/drivers/media/rc/keymaps/rc-fusionhdtv-mce.c
index 253199f5531a..43f73db91098 100644
--- a/drivers/media/rc/keymaps/rc-fusionhdtv-mce.c
+++ b/drivers/media/rc/keymaps/rc-fusionhdtv-mce.c
@@ -92,3 +92,4 @@ module_exit(exit_rc_map_fusionhdtv_mce)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("DViCO FUSION HDTV MCE remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-gadmei-rm008z.c b/drivers/media/rc/keymaps/rc-gadmei-rm008z.c
index c630ef306f11..8a446d125789 100644
--- a/drivers/media/rc/keymaps/rc-gadmei-rm008z.c
+++ b/drivers/media/rc/keymaps/rc-gadmei-rm008z.c
@@ -75,3 +75,4 @@ module_exit(exit_rc_map_gadmei_rm008z)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("GADMEI UTV330+ RM008Z remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-geekbox.c b/drivers/media/rc/keymaps/rc-geekbox.c
index 11735ad36c6a..d3f2e960c925 100644
--- a/drivers/media/rc/keymaps/rc-geekbox.c
+++ b/drivers/media/rc/keymaps/rc-geekbox.c
@@ -47,3 +47,4 @@ module_exit(exit_rc_map_geekbox)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Martin Blumenstingl <martin.blumenstingl@googlemail.com>");
+MODULE_DESCRIPTION("GeekBox remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-genius-tvgo-a11mce.c b/drivers/media/rc/keymaps/rc-genius-tvgo-a11mce.c
index c966c130b05d..e49828ea2b80 100644
--- a/drivers/media/rc/keymaps/rc-genius-tvgo-a11mce.c
+++ b/drivers/media/rc/keymaps/rc-genius-tvgo-a11mce.c
@@ -78,3 +78,4 @@ module_exit(exit_rc_map_genius_tvgo_a11mce)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("Genius TVGO A11MCE remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-gotview7135.c b/drivers/media/rc/keymaps/rc-gotview7135.c
index 0dc4ef36d76f..a044991e30ba 100644
--- a/drivers/media/rc/keymaps/rc-gotview7135.c
+++ b/drivers/media/rc/keymaps/rc-gotview7135.c
@@ -73,3 +73,4 @@ module_exit(exit_rc_map_gotview7135)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("gotview7135 remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-hauppauge.c b/drivers/media/rc/keymaps/rc-hauppauge.c
index 82552360c3c3..d7156774aa0e 100644
--- a/drivers/media/rc/keymaps/rc-hauppauge.c
+++ b/drivers/media/rc/keymaps/rc-hauppauge.c
@@ -287,3 +287,4 @@ module_exit(exit_rc_map_rc5_hauppauge_new)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("Hauppauge remote controllers keytable");
diff --git a/drivers/media/rc/keymaps/rc-hisi-poplar.c b/drivers/media/rc/keymaps/rc-hisi-poplar.c
index 49a18e916915..b10ad674c32a 100644
--- a/drivers/media/rc/keymaps/rc-hisi-poplar.c
+++ b/drivers/media/rc/keymaps/rc-hisi-poplar.c
@@ -63,3 +63,4 @@ module_init(init_rc_map_hisi_poplar)
 module_exit(exit_rc_map_hisi_poplar)
 
 MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("HiSilicon poplar remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-hisi-tv-demo.c b/drivers/media/rc/keymaps/rc-hisi-tv-demo.c
index c73068b653f7..24dcb38df27c 100644
--- a/drivers/media/rc/keymaps/rc-hisi-tv-demo.c
+++ b/drivers/media/rc/keymaps/rc-hisi-tv-demo.c
@@ -75,3 +75,4 @@ module_init(init_rc_map_hisi_tv_demo)
 module_exit(exit_rc_map_hisi_tv_demo)
 
 MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("HiSilicon tv demo remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-imon-mce.c b/drivers/media/rc/keymaps/rc-imon-mce.c
index b89e3569e76a..130f685ae30e 100644
--- a/drivers/media/rc/keymaps/rc-imon-mce.c
+++ b/drivers/media/rc/keymaps/rc-imon-mce.c
@@ -137,3 +137,4 @@ module_exit(exit_rc_map_imon_mce)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Jarod Wilson <jarod@redhat.com>");
+MODULE_DESCRIPTION("iMON MCE remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-imon-pad.c b/drivers/media/rc/keymaps/rc-imon-pad.c
index bceb4e7726b6..cd5ba44d033c 100644
--- a/drivers/media/rc/keymaps/rc-imon-pad.c
+++ b/drivers/media/rc/keymaps/rc-imon-pad.c
@@ -150,3 +150,4 @@ module_exit(exit_rc_map_imon_pad)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Jarod Wilson <jarod@redhat.com>");
+MODULE_DESCRIPTION("iMON PAD remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-imon-rsc.c b/drivers/media/rc/keymaps/rc-imon-rsc.c
index 38787dd0e4a0..e4124fadf705 100644
--- a/drivers/media/rc/keymaps/rc-imon-rsc.c
+++ b/drivers/media/rc/keymaps/rc-imon-rsc.c
@@ -80,3 +80,4 @@ module_exit(exit_rc_map_imon_rsc)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Sean Young <sean@mess.org>");
+MODULE_DESCRIPTION("iMON RSC remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-iodata-bctv7e.c b/drivers/media/rc/keymaps/rc-iodata-bctv7e.c
index 9cc6ea0f4226..95256e85458a 100644
--- a/drivers/media/rc/keymaps/rc-iodata-bctv7e.c
+++ b/drivers/media/rc/keymaps/rc-iodata-bctv7e.c
@@ -82,3 +82,4 @@ module_exit(exit_rc_map_iodata_bctv7e)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("IO-DATA BCTV7E remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-it913x-v1.c b/drivers/media/rc/keymaps/rc-it913x-v1.c
index 1e049f26a246..d80764c98f44 100644
--- a/drivers/media/rc/keymaps/rc-it913x-v1.c
+++ b/drivers/media/rc/keymaps/rc-it913x-v1.c
@@ -89,3 +89,4 @@ module_exit(exit_rc_it913x_v1_map)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Malcolm Priestley tvboxspy@gmail.com");
+MODULE_DESCRIPTION("it913x-v1 remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-it913x-v2.c b/drivers/media/rc/keymaps/rc-it913x-v2.c
index da3107da26b7..c37358cf8b86 100644
--- a/drivers/media/rc/keymaps/rc-it913x-v2.c
+++ b/drivers/media/rc/keymaps/rc-it913x-v2.c
@@ -88,3 +88,4 @@ module_exit(exit_rc_it913x_v2_map)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Malcolm Priestley tvboxspy@gmail.com");
+MODULE_DESCRIPTION("it913x-v2 remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-kaiomy.c b/drivers/media/rc/keymaps/rc-kaiomy.c
index 548760e86a2d..bea50c6f7e99 100644
--- a/drivers/media/rc/keymaps/rc-kaiomy.c
+++ b/drivers/media/rc/keymaps/rc-kaiomy.c
@@ -81,3 +81,4 @@ module_exit(exit_rc_map_kaiomy)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("Kaiomy TVnPC U2 remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-khadas.c b/drivers/media/rc/keymaps/rc-khadas.c
index ce4938444d90..2b7161e1bc3f 100644
--- a/drivers/media/rc/keymaps/rc-khadas.c
+++ b/drivers/media/rc/keymaps/rc-khadas.c
@@ -52,3 +52,4 @@ module_exit(exit_rc_map_khadas)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Christian Hewitt <christianshewitt@gmail.com>");
+MODULE_DESCRIPTION("Khadas VIM/EDGE SBC remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-khamsin.c b/drivers/media/rc/keymaps/rc-khamsin.c
index 0c98c2faacff..2121cad8d3df 100644
--- a/drivers/media/rc/keymaps/rc-khamsin.c
+++ b/drivers/media/rc/keymaps/rc-khamsin.c
@@ -73,3 +73,4 @@ module_exit(exit_rc_map_khamsin)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Christian Hewitt <christianshewitt@gmail.com>");
+MODULE_DESCRIPTION("KHAMSIN remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-kworld-315u.c b/drivers/media/rc/keymaps/rc-kworld-315u.c
index f5aed4b96019..f849dd6b7ef2 100644
--- a/drivers/media/rc/keymaps/rc-kworld-315u.c
+++ b/drivers/media/rc/keymaps/rc-kworld-315u.c
@@ -77,3 +77,4 @@ module_exit(exit_rc_map_kworld_315u)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("Kworld 315U remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-kworld-pc150u.c b/drivers/media/rc/keymaps/rc-kworld-pc150u.c
index 7938761eb994..630ef7c330d9 100644
--- a/drivers/media/rc/keymaps/rc-kworld-pc150u.c
+++ b/drivers/media/rc/keymaps/rc-kworld-pc150u.c
@@ -96,3 +96,4 @@ module_exit(exit_rc_map_kworld_pc150u)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Kyle Strickland <kyle@kyle.strickland.name>");
+MODULE_DESCRIPTION("Kworld PC150-U remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-kworld-plus-tv-analog.c b/drivers/media/rc/keymaps/rc-kworld-plus-tv-analog.c
index 75389b74e02d..1fb9dc434685 100644
--- a/drivers/media/rc/keymaps/rc-kworld-plus-tv-analog.c
+++ b/drivers/media/rc/keymaps/rc-kworld-plus-tv-analog.c
@@ -97,3 +97,4 @@ module_exit(exit_rc_map_kworld_plus_tv_analog)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("Kworld Plus TV Analog Lite PCI IR remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-leadtek-y04g0051.c b/drivers/media/rc/keymaps/rc-leadtek-y04g0051.c
index 2f2b981e1995..c637312643b7 100644
--- a/drivers/media/rc/keymaps/rc-leadtek-y04g0051.c
+++ b/drivers/media/rc/keymaps/rc-leadtek-y04g0051.c
@@ -85,3 +85,4 @@ module_exit(exit_rc_map_leadtek_y04g0051)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Antti Palosaari <crope@iki.fi>");
+MODULE_DESCRIPTION("LeadTek Y04G0051 remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-lme2510.c b/drivers/media/rc/keymaps/rc-lme2510.c
index 181e48f0cb67..575485655a85 100644
--- a/drivers/media/rc/keymaps/rc-lme2510.c
+++ b/drivers/media/rc/keymaps/rc-lme2510.c
@@ -104,3 +104,4 @@ module_exit(exit_rc_lme2510_map)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Malcolm Priestley tvboxspy@gmail.com");
+MODULE_DESCRIPTION("LME2510 remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-manli.c b/drivers/media/rc/keymaps/rc-manli.c
index e884aeb5c3d6..b81149a0dfd8 100644
--- a/drivers/media/rc/keymaps/rc-manli.c
+++ b/drivers/media/rc/keymaps/rc-manli.c
@@ -128,3 +128,4 @@ module_exit(exit_rc_map_manli)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("MANLI MTV00[0x0c] and BeholdTV 40[13] remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-mecool-kii-pro.c b/drivers/media/rc/keymaps/rc-mecool-kii-pro.c
index 77ca8a8fade8..273fe1a304f0 100644
--- a/drivers/media/rc/keymaps/rc-mecool-kii-pro.c
+++ b/drivers/media/rc/keymaps/rc-mecool-kii-pro.c
@@ -89,3 +89,4 @@ module_exit(exit_rc_map_mecool_kii_pro)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Christian Hewitt <christianshewitt@gmail.com");
+MODULE_DESCRIPTION("Mecool Kii Pro remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-mecool-kiii-pro.c b/drivers/media/rc/keymaps/rc-mecool-kiii-pro.c
index 8e99686fd6b1..53fd7c895ddc 100644
--- a/drivers/media/rc/keymaps/rc-mecool-kiii-pro.c
+++ b/drivers/media/rc/keymaps/rc-mecool-kiii-pro.c
@@ -86,3 +86,4 @@ module_exit(exit_rc_map_mecool_kiii_pro)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Christian Hewitt <christianshewitt@gmail.com");
+MODULE_DESCRIPTION("Mecool Kiii Pro remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-medion-x10.c b/drivers/media/rc/keymaps/rc-medion-x10.c
index 843dba3bad73..3ea8fdbaf18c 100644
--- a/drivers/media/rc/keymaps/rc-medion-x10.c
+++ b/drivers/media/rc/keymaps/rc-medion-x10.c
@@ -102,3 +102,4 @@ module_exit(exit_rc_map_medion_x10)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Anssi Hannula <anssi.hannula@iki.fi>");
+MODULE_DESCRIPTION("Medion X10 RF remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-minix-neo.c b/drivers/media/rc/keymaps/rc-minix-neo.c
index 9165af548ff1..1eb802a03192 100644
--- a/drivers/media/rc/keymaps/rc-minix-neo.c
+++ b/drivers/media/rc/keymaps/rc-minix-neo.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0+
+G
 //
 // Copyright (C) 2021 Christian Hewitt <christianshewitt@gmail.com>
 
@@ -53,3 +53,4 @@ module_exit(exit_rc_map_minix_neo)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Christian Hewitt <christianshewitt@gmail.com");
+MODULE_DESCRIPTION("Minix NEO remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-msi-digivox-ii.c b/drivers/media/rc/keymaps/rc-msi-digivox-ii.c
index ab001d2dac67..f152626fd802 100644
--- a/drivers/media/rc/keymaps/rc-msi-digivox-ii.c
+++ b/drivers/media/rc/keymaps/rc-msi-digivox-ii.c
@@ -53,3 +53,4 @@ module_exit(exit_rc_map_msi_digivox_ii)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Antti Palosaari <crope@iki.fi>");
+MODULE_DESCRIPTION("MSI DIGIVOX mini II remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-msi-digivox-iii.c b/drivers/media/rc/keymaps/rc-msi-digivox-iii.c
index 6129d3e925e5..1250cde3367d 100644
--- a/drivers/media/rc/keymaps/rc-msi-digivox-iii.c
+++ b/drivers/media/rc/keymaps/rc-msi-digivox-iii.c
@@ -71,3 +71,4 @@ module_exit(exit_rc_map_msi_digivox_iii)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Antti Palosaari <crope@iki.fi>");
+MODULE_DESCRIPTION("MSI DIGIVOX mini III remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-msi-tvanywhere-plus.c b/drivers/media/rc/keymaps/rc-msi-tvanywhere-plus.c
index 42270a7ef3ee..648bac448f29 100644
--- a/drivers/media/rc/keymaps/rc-msi-tvanywhere-plus.c
+++ b/drivers/media/rc/keymaps/rc-msi-tvanywhere-plus.c
@@ -117,3 +117,4 @@ module_exit(exit_rc_map_msi_tvanywhere_plus)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("MSI TV@nywhere Plus remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-msi-tvanywhere.c b/drivers/media/rc/keymaps/rc-msi-tvanywhere.c
index 45793c641009..b59af39ba005 100644
--- a/drivers/media/rc/keymaps/rc-msi-tvanywhere.c
+++ b/drivers/media/rc/keymaps/rc-msi-tvanywhere.c
@@ -63,3 +63,4 @@ module_exit(exit_rc_map_msi_tvanywhere)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("MSI TV@nywhere MASTER remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-nebula.c b/drivers/media/rc/keymaps/rc-nebula.c
index 2dc6061f69b3..23b75269d307 100644
--- a/drivers/media/rc/keymaps/rc-nebula.c
+++ b/drivers/media/rc/keymaps/rc-nebula.c
@@ -90,3 +90,4 @@ module_exit(exit_rc_map_nebula)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("nebula remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-nec-terratec-cinergy-xs.c b/drivers/media/rc/keymaps/rc-nec-terratec-cinergy-xs.c
index b12c54d47db3..94340a1864a0 100644
--- a/drivers/media/rc/keymaps/rc-nec-terratec-cinergy-xs.c
+++ b/drivers/media/rc/keymaps/rc-nec-terratec-cinergy-xs.c
@@ -151,3 +151,4 @@ module_exit(exit_rc_map_nec_terratec_cinergy_xs)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("Terratec Cinergy Hybrid T USB XS FM remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-norwood.c b/drivers/media/rc/keymaps/rc-norwood.c
index acd5b1ccf8d0..da00003a5e79 100644
--- a/drivers/media/rc/keymaps/rc-norwood.c
+++ b/drivers/media/rc/keymaps/rc-norwood.c
@@ -79,3 +79,4 @@ module_exit(exit_rc_map_norwood)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("Norwood Micro (non-Pro) TV Tuner remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-npgtech.c b/drivers/media/rc/keymaps/rc-npgtech.c
index 98a755e8bc18..6f4412922e0c 100644
--- a/drivers/media/rc/keymaps/rc-npgtech.c
+++ b/drivers/media/rc/keymaps/rc-npgtech.c
@@ -74,3 +74,4 @@ module_exit(exit_rc_map_npgtech)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("npgtech remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-odroid.c b/drivers/media/rc/keymaps/rc-odroid.c
index c6fbb64b5c41..0353229a4915 100644
--- a/drivers/media/rc/keymaps/rc-odroid.c
+++ b/drivers/media/rc/keymaps/rc-odroid.c
@@ -52,3 +52,4 @@ module_exit(exit_rc_map_odroid)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Christian Hewitt <christianshewitt@gmail.com");
+MODULE_DESCRIPTION("HardKernel ODROID remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-pctv-sedna.c b/drivers/media/rc/keymaps/rc-pctv-sedna.c
index c3bb1ecdd0ca..6583bf4fcb04 100644
--- a/drivers/media/rc/keymaps/rc-pctv-sedna.c
+++ b/drivers/media/rc/keymaps/rc-pctv-sedna.c
@@ -74,3 +74,4 @@ module_exit(exit_rc_map_pctv_sedna)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("pctv-sedna remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-pine64.c b/drivers/media/rc/keymaps/rc-pine64.c
index 9b2bdbbce04e..bcdb99997d4d 100644
--- a/drivers/media/rc/keymaps/rc-pine64.c
+++ b/drivers/media/rc/keymaps/rc-pine64.c
@@ -63,3 +63,4 @@ module_exit(exit_rc_map_pine64)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Jonas Karlman");
+MODULE_DESCRIPTION("Pine64 IR remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-pinnacle-color.c b/drivers/media/rc/keymaps/rc-pinnacle-color.c
index b862725635b9..f33c38644f83 100644
--- a/drivers/media/rc/keymaps/rc-pinnacle-color.c
+++ b/drivers/media/rc/keymaps/rc-pinnacle-color.c
@@ -88,3 +88,4 @@ module_exit(exit_rc_map_pinnacle_color)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("pinnacle-color remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-pinnacle-grey.c b/drivers/media/rc/keymaps/rc-pinnacle-grey.c
index 3853b653cee6..22ef3d4e2e71 100644
--- a/drivers/media/rc/keymaps/rc-pinnacle-grey.c
+++ b/drivers/media/rc/keymaps/rc-pinnacle-grey.c
@@ -83,3 +83,4 @@ module_exit(exit_rc_map_pinnacle_grey)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("pinnacle-grey remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-pinnacle-pctv-hd.c b/drivers/media/rc/keymaps/rc-pinnacle-pctv-hd.c
index 96d8112fb468..35f0c790cc0c 100644
--- a/drivers/media/rc/keymaps/rc-pinnacle-pctv-hd.c
+++ b/drivers/media/rc/keymaps/rc-pinnacle-pctv-hd.c
@@ -64,3 +64,4 @@ module_exit(exit_rc_map_pinnacle_pctv_hd)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("Pinnacle PCTV HD 800i mini remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-pixelview-002t.c b/drivers/media/rc/keymaps/rc-pixelview-002t.c
index c3439c46644c..0966ebf0903a 100644
--- a/drivers/media/rc/keymaps/rc-pixelview-002t.c
+++ b/drivers/media/rc/keymaps/rc-pixelview-002t.c
@@ -71,3 +71,4 @@ module_exit(exit_rc_map_pixelview)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("002-T IR remote keytable");
diff --git a/drivers/media/rc/keymaps/rc-pixelview-mk12.c b/drivers/media/rc/keymaps/rc-pixelview-mk12.c
index ea11ccde8442..e18774473809 100644
--- a/drivers/media/rc/keymaps/rc-pixelview-mk12.c
+++ b/drivers/media/rc/keymaps/rc-pixelview-mk12.c
@@ -77,3 +77,4 @@ module_exit(exit_rc_map_pixelview)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("MK-F12 IR remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-pixelview-new.c b/drivers/media/rc/keymaps/rc-pixelview-new.c
index 0259666831b0..cf7f1cf8c3b5 100644
--- a/drivers/media/rc/keymaps/rc-pixelview-new.c
+++ b/drivers/media/rc/keymaps/rc-pixelview-new.c
@@ -77,3 +77,4 @@ module_exit(exit_rc_map_pixelview_new)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("pixelview-new remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-pixelview.c b/drivers/media/rc/keymaps/rc-pixelview.c
index 29f6d2c013e4..567ad0a076fc 100644
--- a/drivers/media/rc/keymaps/rc-pixelview.c
+++ b/drivers/media/rc/keymaps/rc-pixelview.c
@@ -76,3 +76,4 @@ module_exit(exit_rc_map_pixelview)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("pixelview remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-powercolor-real-angel.c b/drivers/media/rc/keymaps/rc-powercolor-real-angel.c
index 66fe2e52e7c8..e7a6add1df26 100644
--- a/drivers/media/rc/keymaps/rc-powercolor-real-angel.c
+++ b/drivers/media/rc/keymaps/rc-powercolor-real-angel.c
@@ -75,3 +75,4 @@ module_exit(exit_rc_map_powercolor_real_angel)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("Powercolor Real Angel 330 remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-proteus-2309.c b/drivers/media/rc/keymaps/rc-proteus-2309.c
index 36eebefd975c..1300482a6119 100644
--- a/drivers/media/rc/keymaps/rc-proteus-2309.c
+++ b/drivers/media/rc/keymaps/rc-proteus-2309.c
@@ -63,3 +63,4 @@ module_exit(exit_rc_map_proteus_2309)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("proteus-2309 remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-purpletv.c b/drivers/media/rc/keymaps/rc-purpletv.c
index bf4543fecb6f..9f6ee0be1347 100644
--- a/drivers/media/rc/keymaps/rc-purpletv.c
+++ b/drivers/media/rc/keymaps/rc-purpletv.c
@@ -75,3 +75,4 @@ module_exit(exit_rc_map_purpletv)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("purpletv remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-pv951.c b/drivers/media/rc/keymaps/rc-pv951.c
index 69db55463000..539e8573eb19 100644
--- a/drivers/media/rc/keymaps/rc-pv951.c
+++ b/drivers/media/rc/keymaps/rc-pv951.c
@@ -72,3 +72,4 @@ module_exit(exit_rc_map_pv951)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("pv951 remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-rc6-mce.c b/drivers/media/rc/keymaps/rc-rc6-mce.c
index d491e0fa8605..ef1c61eb99b2 100644
--- a/drivers/media/rc/keymaps/rc-rc6-mce.c
+++ b/drivers/media/rc/keymaps/rc-rc6-mce.c
@@ -114,3 +114,4 @@ module_exit(exit_rc_map_rc6_mce)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Jarod Wilson <jarod@redhat.com>");
+MODULE_DESCRIPTION("rc6 MCE remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-real-audio-220-32-keys.c b/drivers/media/rc/keymaps/rc-real-audio-220-32-keys.c
index 33bb458b81fd..088ead8f736b 100644
--- a/drivers/media/rc/keymaps/rc-real-audio-220-32-keys.c
+++ b/drivers/media/rc/keymaps/rc-real-audio-220-32-keys.c
@@ -72,3 +72,4 @@ module_exit(exit_rc_map_real_audio_220_32_keys)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("Zogis Real Audio 220 - 32 keys remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-reddo.c b/drivers/media/rc/keymaps/rc-reddo.c
index b70390d19e78..af50d1ca4b15 100644
--- a/drivers/media/rc/keymaps/rc-reddo.c
+++ b/drivers/media/rc/keymaps/rc-reddo.c
@@ -71,3 +71,4 @@ module_exit(exit_rc_map_reddo)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Antti Palosaari <crope@iki.fi>");
+MODULE_DESCRIPTION("reddo remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-snapstream-firefly.c b/drivers/media/rc/keymaps/rc-snapstream-firefly.c
index e3d5bff3bd9e..826f44595e70 100644
--- a/drivers/media/rc/keymaps/rc-snapstream-firefly.c
+++ b/drivers/media/rc/keymaps/rc-snapstream-firefly.c
@@ -92,3 +92,4 @@ module_exit(exit_rc_map_snapstream_firefly)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Anssi Hannula <anssi.hannula@iki.fi>");
+MODULE_DESCRIPTION("SnapStream Firefly X10 RF remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-streamzap.c b/drivers/media/rc/keymaps/rc-streamzap.c
index 6684e2e86bc9..b82c3cdfca3b 100644
--- a/drivers/media/rc/keymaps/rc-streamzap.c
+++ b/drivers/media/rc/keymaps/rc-streamzap.c
@@ -75,3 +75,4 @@ module_exit(exit_rc_map_streamzap)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Jarod Wilson <jarod@redhat.com>");
+MODULE_DESCRIPTION("Streamzap remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-su3000.c b/drivers/media/rc/keymaps/rc-su3000.c
index 64cfc01aa48f..a333ade3b1d2 100644
--- a/drivers/media/rc/keymaps/rc-su3000.c
+++ b/drivers/media/rc/keymaps/rc-su3000.c
@@ -69,3 +69,4 @@ module_exit(exit_rc_map_su3000)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Evgeny Plehov <Evgeny Plehov@ukr.net>");
+MODULE_DESCRIPTION("Geniatech HDStar remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-tanix-tx3mini.c b/drivers/media/rc/keymaps/rc-tanix-tx3mini.c
index d486cd69afb2..b5d77a0c94ed 100644
--- a/drivers/media/rc/keymaps/rc-tanix-tx3mini.c
+++ b/drivers/media/rc/keymaps/rc-tanix-tx3mini.c
@@ -75,3 +75,4 @@ module_exit(exit_rc_map_tanix_tx3mini)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Christian Hewitt <christianshewitt@gmail.com>");
+MODULE_DESCRIPTION("Tanix TX3 mini STB remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-tanix-tx5max.c b/drivers/media/rc/keymaps/rc-tanix-tx5max.c
index 59aaabed80dd..91db9017845a 100644
--- a/drivers/media/rc/keymaps/rc-tanix-tx5max.c
+++ b/drivers/media/rc/keymaps/rc-tanix-tx5max.c
@@ -66,3 +66,4 @@ module_exit(exit_rc_map_tanix_tx5max)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Christian Hewitt <christianshewitt@gmail.com>");
+MODULE_DESCRIPTION("Tanix TX5 max STB remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-tbs-nec.c b/drivers/media/rc/keymaps/rc-tbs-nec.c
index 420980925f29..426c767c907f 100644
--- a/drivers/media/rc/keymaps/rc-tbs-nec.c
+++ b/drivers/media/rc/keymaps/rc-tbs-nec.c
@@ -69,3 +69,4 @@ module_exit(exit_rc_map_tbs_nec)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("tbs-nec remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-technisat-ts35.c b/drivers/media/rc/keymaps/rc-technisat-ts35.c
index 9a917ea0ceba..07d5e0884eb9 100644
--- a/drivers/media/rc/keymaps/rc-technisat-ts35.c
+++ b/drivers/media/rc/keymaps/rc-technisat-ts35.c
@@ -70,3 +70,4 @@ module_init(init_rc_map)
 module_exit(exit_rc_map)
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("TechniSat TS35 remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-technisat-usb2.c b/drivers/media/rc/keymaps/rc-technisat-usb2.c
index 942100686c82..74ac89d37966 100644
--- a/drivers/media/rc/keymaps/rc-technisat-usb2.c
+++ b/drivers/media/rc/keymaps/rc-technisat-usb2.c
@@ -88,3 +88,4 @@ module_exit(exit_rc_map)
 
 MODULE_AUTHOR("Patrick Boettcher <pboettcher@kernellabs.com>");
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("TechniSat TS35 remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-terratec-cinergy-c-pci.c b/drivers/media/rc/keymaps/rc-terratec-cinergy-c-pci.c
index da06f844d8fb..d44891308193 100644
--- a/drivers/media/rc/keymaps/rc-terratec-cinergy-c-pci.c
+++ b/drivers/media/rc/keymaps/rc-terratec-cinergy-c-pci.c
@@ -82,3 +82,4 @@ module_init(init_rc_map_terratec_cinergy_c_pci);
 module_exit(exit_rc_map_terratec_cinergy_c_pci);
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Terratec Cinergy C PCI remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-terratec-cinergy-s2-hd.c b/drivers/media/rc/keymaps/rc-terratec-cinergy-s2-hd.c
index a1844b531572..dbbb1ba0247b 100644
--- a/drivers/media/rc/keymaps/rc-terratec-cinergy-s2-hd.c
+++ b/drivers/media/rc/keymaps/rc-terratec-cinergy-s2-hd.c
@@ -80,3 +80,4 @@ module_init(init_rc_map_terratec_cinergy_s2_hd);
 module_exit(exit_rc_map_terratec_cinergy_s2_hd);
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Terratec Cinergy S2 HD remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-terratec-cinergy-xs.c b/drivers/media/rc/keymaps/rc-terratec-cinergy-xs.c
index fe587e3f0240..a9452d581339 100644
--- a/drivers/media/rc/keymaps/rc-terratec-cinergy-xs.c
+++ b/drivers/media/rc/keymaps/rc-terratec-cinergy-xs.c
@@ -86,3 +86,4 @@ module_exit(exit_rc_map_terratec_cinergy_xs)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("Terratec Cinergy Hybrid T USB XS remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-terratec-slim-2.c b/drivers/media/rc/keymaps/rc-terratec-slim-2.c
index a54a59f90313..ea259d88769b 100644
--- a/drivers/media/rc/keymaps/rc-terratec-slim-2.c
+++ b/drivers/media/rc/keymaps/rc-terratec-slim-2.c
@@ -58,3 +58,4 @@ module_exit(exit_rc_map_terratec_slim_2)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Antti Palosaari <crope@iki.fi>");
+MODULE_DESCRIPTION("TerraTec slim remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-terratec-slim.c b/drivers/media/rc/keymaps/rc-terratec-slim.c
index 146e3a3480dc..bb40cbd58ebe 100644
--- a/drivers/media/rc/keymaps/rc-terratec-slim.c
+++ b/drivers/media/rc/keymaps/rc-terratec-slim.c
@@ -65,3 +65,4 @@ module_exit(exit_rc_map_terratec_slim)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Antti Palosaari <crope@iki.fi>");
+MODULE_DESCRIPTION("TerraTec slim remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-tevii-nec.c b/drivers/media/rc/keymaps/rc-tevii-nec.c
index 5b96e9a38e9d..ee7f8014742b 100644
--- a/drivers/media/rc/keymaps/rc-tevii-nec.c
+++ b/drivers/media/rc/keymaps/rc-tevii-nec.c
@@ -82,3 +82,4 @@ module_exit(exit_rc_map_tevii_nec)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("tevii-nec remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-tivo.c b/drivers/media/rc/keymaps/rc-tivo.c
index c51606a3be68..c02b8c8abd5c 100644
--- a/drivers/media/rc/keymaps/rc-tivo.c
+++ b/drivers/media/rc/keymaps/rc-tivo.c
@@ -93,3 +93,4 @@ module_exit(exit_rc_map_tivo)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Jarod Wilson <jarod@redhat.com>");
+MODULE_DESCRIPTION("TiVo remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-total-media-in-hand-02.c b/drivers/media/rc/keymaps/rc-total-media-in-hand-02.c
index 40b773ba45b9..290d1cc8577c 100644
--- a/drivers/media/rc/keymaps/rc-total-media-in-hand-02.c
+++ b/drivers/media/rc/keymaps/rc-total-media-in-hand-02.c
@@ -71,3 +71,4 @@ module_exit(exit_rc_map_total_media_in_hand_02)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR(" Alfredo J. Delaiti <alfredodelaiti@netscape.net>");
+MODULE_DESCRIPTION("Total Media In Hand_02 remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-total-media-in-hand.c b/drivers/media/rc/keymaps/rc-total-media-in-hand.c
index 2144db485d83..7f4b31b98f35 100644
--- a/drivers/media/rc/keymaps/rc-total-media-in-hand.c
+++ b/drivers/media/rc/keymaps/rc-total-media-in-hand.c
@@ -71,3 +71,4 @@ module_exit(exit_rc_map_total_media_in_hand)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Antti Palosaari <crope@iki.fi>");
+MODULE_DESCRIPTION("Total Media In Hand remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-trekstor.c b/drivers/media/rc/keymaps/rc-trekstor.c
index e938e0da51a6..ff01de550904 100644
--- a/drivers/media/rc/keymaps/rc-trekstor.c
+++ b/drivers/media/rc/keymaps/rc-trekstor.c
@@ -66,3 +66,4 @@ module_exit(exit_rc_map_trekstor)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Antti Palosaari <crope@iki.fi>");
+MODULE_DESCRIPTION("TrekStor remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-tt-1500.c b/drivers/media/rc/keymaps/rc-tt-1500.c
index ff70aab13b48..eb8d7fc5061a 100644
--- a/drivers/media/rc/keymaps/rc-tt-1500.c
+++ b/drivers/media/rc/keymaps/rc-tt-1500.c
@@ -76,3 +76,4 @@ module_exit(exit_rc_map_tt_1500)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("Technotrend 1500 remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-twinhan-dtv-cab-ci.c b/drivers/media/rc/keymaps/rc-twinhan-dtv-cab-ci.c
index 5fc696d9e583..8e5cf8eb0db9 100644
--- a/drivers/media/rc/keymaps/rc-twinhan-dtv-cab-ci.c
+++ b/drivers/media/rc/keymaps/rc-twinhan-dtv-cab-ci.c
@@ -92,3 +92,4 @@ module_init(init_rc_map_twinhan_dtv_cab_ci);
 module_exit(exit_rc_map_twinhan_dtv_cab_ci);
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Twinhan DTV CAB CI remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-twinhan1027.c b/drivers/media/rc/keymaps/rc-twinhan1027.c
index e1cdcfa792dc..411ce3c8cbd0 100644
--- a/drivers/media/rc/keymaps/rc-twinhan1027.c
+++ b/drivers/media/rc/keymaps/rc-twinhan1027.c
@@ -87,3 +87,4 @@ module_exit(exit_rc_map_twinhan_vp1027)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Sergey Ivanov <123kash@gmail.com>");
+MODULE_DESCRIPTION("twinhan1027 remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-vega-s9x.c b/drivers/media/rc/keymaps/rc-vega-s9x.c
index bf210c4dc535..40fbf408bf65 100644
--- a/drivers/media/rc/keymaps/rc-vega-s9x.c
+++ b/drivers/media/rc/keymaps/rc-vega-s9x.c
@@ -52,3 +52,4 @@ module_exit(exit_rc_map_vega_s9x)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Christian Hewitt <christianshewitt@gmail.com");
+MODULE_DESCRIPTION("Tronsmart Vega S9x remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-videomate-m1f.c b/drivers/media/rc/keymaps/rc-videomate-m1f.c
index e16b9b851c72..1f9be84ff27b 100644
--- a/drivers/media/rc/keymaps/rc-videomate-m1f.c
+++ b/drivers/media/rc/keymaps/rc-videomate-m1f.c
@@ -87,3 +87,4 @@ module_exit(exit_rc_map_videomate_k100)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Pavel Osnova <pvosnova@gmail.com>");
+MODULE_DESCRIPTION("videomate-m1f remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-videomate-s350.c b/drivers/media/rc/keymaps/rc-videomate-s350.c
index a867d7a08055..281cc747229f 100644
--- a/drivers/media/rc/keymaps/rc-videomate-s350.c
+++ b/drivers/media/rc/keymaps/rc-videomate-s350.c
@@ -79,3 +79,4 @@ module_exit(exit_rc_map_videomate_s350)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("videomate-s350 remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-videomate-tv-pvr.c b/drivers/media/rc/keymaps/rc-videomate-tv-pvr.c
index fdc3b0e1350f..829842425fae 100644
--- a/drivers/media/rc/keymaps/rc-videomate-tv-pvr.c
+++ b/drivers/media/rc/keymaps/rc-videomate-tv-pvr.c
@@ -81,3 +81,4 @@ module_exit(exit_rc_map_videomate_tv_pvr)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("videomate-tv-pvr remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-videostrong-kii-pro.c b/drivers/media/rc/keymaps/rc-videostrong-kii-pro.c
index 414d4d231e7e..10cbc2c781d2 100644
--- a/drivers/media/rc/keymaps/rc-videostrong-kii-pro.c
+++ b/drivers/media/rc/keymaps/rc-videostrong-kii-pro.c
@@ -81,3 +81,4 @@ module_exit(exit_rc_map_kii_pro)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mohammad Rasim <mohammad.rasim96@gmail.com>");
+MODULE_DESCRIPTION("Videostrong KII Pro STB remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-wetek-hub.c b/drivers/media/rc/keymaps/rc-wetek-hub.c
index b5a21aff45f5..591ec20399f4 100644
--- a/drivers/media/rc/keymaps/rc-wetek-hub.c
+++ b/drivers/media/rc/keymaps/rc-wetek-hub.c
@@ -51,3 +51,4 @@ module_exit(exit_rc_map_wetek_hub)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Christian Hewitt <christianshewitt@gmail.com>");
+MODULE_DESCRIPTION("WeTek Hub STB remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-wetek-play2.c b/drivers/media/rc/keymaps/rc-wetek-play2.c
index bbbb11fa3c11..ce3b1029df23 100644
--- a/drivers/media/rc/keymaps/rc-wetek-play2.c
+++ b/drivers/media/rc/keymaps/rc-wetek-play2.c
@@ -91,3 +91,4 @@ module_exit(exit_rc_map_wetek_play2)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Christian Hewitt <christianshewitt@gmail.com");
+MODULE_DESCRIPTION("WeTek Play 2 STB remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-winfast-usbii-deluxe.c b/drivers/media/rc/keymaps/rc-winfast-usbii-deluxe.c
index 999ba4e084ae..edfba31f9ae6 100644
--- a/drivers/media/rc/keymaps/rc-winfast-usbii-deluxe.c
+++ b/drivers/media/rc/keymaps/rc-winfast-usbii-deluxe.c
@@ -76,3 +76,4 @@ module_exit(exit_rc_map_winfast_usbii_deluxe)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("Leadtek Winfast TV USB II Deluxe remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-winfast.c b/drivers/media/rc/keymaps/rc-winfast.c
index be52a3e1f8ae..89649c8cdee5 100644
--- a/drivers/media/rc/keymaps/rc-winfast.c
+++ b/drivers/media/rc/keymaps/rc-winfast.c
@@ -96,3 +96,4 @@ module_exit(exit_rc_map_winfast)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
+MODULE_DESCRIPTION("Leadtek Winfast remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-x96max.c b/drivers/media/rc/keymaps/rc-x96max.c
index 0998ec3320e4..a22fcbbfa383 100644
--- a/drivers/media/rc/keymaps/rc-x96max.c
+++ b/drivers/media/rc/keymaps/rc-x96max.c
@@ -81,3 +81,4 @@ module_exit(exit_rc_map_x96max)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Christian Hewitt <christianshewitt@gmail.com");
+MODULE_DESCRIPTION("X96-max STB remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-xbox-360.c b/drivers/media/rc/keymaps/rc-xbox-360.c
index 231aa00514af..1364daf3ae6f 100644
--- a/drivers/media/rc/keymaps/rc-xbox-360.c
+++ b/drivers/media/rc/keymaps/rc-xbox-360.c
@@ -81,3 +81,4 @@ module_init(init_rc_map)
 module_exit(exit_rc_map)
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Xbox 360 Universal Media remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-xbox-dvd.c b/drivers/media/rc/keymaps/rc-xbox-dvd.c
index 9d656042a81f..11ab134b05b5 100644
--- a/drivers/media/rc/keymaps/rc-xbox-dvd.c
+++ b/drivers/media/rc/keymaps/rc-xbox-dvd.c
@@ -61,3 +61,4 @@ module_init(init_rc_map)
 module_exit(exit_rc_map)
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Xbox DVD remote controller keytable");
diff --git a/drivers/media/rc/keymaps/rc-zx-irdec.c b/drivers/media/rc/keymaps/rc-zx-irdec.c
index 7bb0c05eb759..e4bea7b39fd1 100644
--- a/drivers/media/rc/keymaps/rc-zx-irdec.c
+++ b/drivers/media/rc/keymaps/rc-zx-irdec.c
@@ -74,3 +74,4 @@ module_exit(exit_rc_map_zx_irdec)
 
 MODULE_AUTHOR("Shawn Guo <shawn.guo@linaro.org>");
 MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("zx-irdec remote controller keytable");
-- 
2.42.0

