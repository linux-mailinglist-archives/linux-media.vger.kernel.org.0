Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC4E842C92A
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 20:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238941AbhJMTAa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 15:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238857AbhJMTA1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 15:00:27 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68C74C061746
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 11:58:23 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id k7so11467541wrd.13
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 11:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ELk8Jyv+Yvx0DwrHEtL89Oc6XY41/fo94AiaGWW9U0w=;
        b=EVH7U6Z9LkpI3eE+lRTNuFrqDbL8lWRbOL/R4GR7J/N0dgkjb1A6Oye9jnbGnO06eu
         QwVe1tD4tSyFskuRDj6pQpJn9RHZJt0oUR1H8OZiA1WxE5rUdZEeMWW+4QSjNm+RC2+0
         XYXyiu4yZ8hkDUBn7E+/OPn4OU6/Xsc8My+zZarcgR8uCREaKyPYneg6AaUd/CW3gvmh
         AN8C5eMWCFCIZJ0jeupZRkqX9OVasEJBjXT2nyHCHwA2nKaECUWs2kmNHNpKyY73G4Kk
         M4ndbh4BnzzLrzxYgtBAZd3rwU/1aeeqjSZjMljumbUulrswe+viStMYeBfDqQCZayQ+
         ZV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ELk8Jyv+Yvx0DwrHEtL89Oc6XY41/fo94AiaGWW9U0w=;
        b=brEPPHNJj5ybWLhoWrkrP8g8Bi6fYGK+xN1ln5ci9N7TWUDElGEheWE/5gaC1o9Gq2
         PFTpMsuSaHfZ/HszEFXgT0TOgypwduGI9n9JIqVcXQ1qRphbT1imL9p5FvLs7JfU6AUd
         g/RtMQQIgZEKcc2p30I2kWundY/K/iJ8ov7iN6SV3eJjVqnKNtR9lJrnat5G7XwLNVv6
         lg8Y6I1XjgKWFbTfiYSHClxwhpHdrW7YPAOcn+C3jjeKj9U6tykUK9g2blr0Yhn+357z
         bUSGab/DXn/FAcWi4O0gh/oHQOsv085tMtmECFnLczT6vyXXsJJ4ofFClxhWWX8Je6h0
         httA==
X-Gm-Message-State: AOAM533SUOe8GYvT/as0owKMVc53AV1bFGd5EzB23ACuGbmwfdnA3pT+
        ecnv6/ozT69cS9DFN3go4vjlHg==
X-Google-Smtp-Source: ABdhPJzDaKEkEylS59izkUimuU98H83HrS11JIc+zNKA2hGaJXYYBk4riHX+WOON1WOrNixeIC4o3w==
X-Received: by 2002:adf:ec4f:: with SMTP id w15mr983691wrn.219.1634151501994;
        Wed, 13 Oct 2021 11:58:21 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id e8sm573059wrg.48.2021.10.13.11.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 11:58:21 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 06/10] staging: media: zoran: fusion all modules
Date:   Wed, 13 Oct 2021 18:58:08 +0000
Message-Id: <20211013185812.590931-7-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013185812.590931-1-clabbe@baylibre.com>
References: <20211013185812.590931-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The zoran driver is split in many modules, but this lead to some
problems.
One of them is that load order is incorrect when everything is built-in.

Having more than one module is useless, so fusion all zoran modules in
one.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/Kconfig      | 14 +++----
 drivers/staging/media/zoran/Makefile     |  8 ++--
 drivers/staging/media/zoran/videocodec.c | 36 +-----------------
 drivers/staging/media/zoran/videocodec.h |  1 -
 drivers/staging/media/zoran/zoran_card.c | 48 +++++++++++++++++++++---
 drivers/staging/media/zoran/zr36016.c    | 12 +-----
 drivers/staging/media/zoran/zr36016.h    |  2 +
 drivers/staging/media/zoran/zr36050.c    | 13 +------
 drivers/staging/media/zoran/zr36050.h    |  2 +
 drivers/staging/media/zoran/zr36060.c    | 12 +-----
 drivers/staging/media/zoran/zr36060.h    |  2 +
 11 files changed, 67 insertions(+), 83 deletions(-)

diff --git a/drivers/staging/media/zoran/Kconfig b/drivers/staging/media/zoran/Kconfig
index 06f79b91cda7..b5a3fc6e98f6 100644
--- a/drivers/staging/media/zoran/Kconfig
+++ b/drivers/staging/media/zoran/Kconfig
@@ -14,7 +14,7 @@ config VIDEO_ZORAN
 	  module will be called zr36067.
 
 config VIDEO_ZORAN_DC30
-	tristate "Pinnacle/Miro DC30(+) support"
+	bool "Pinnacle/Miro DC30(+) support"
 	depends on VIDEO_ZORAN
 	select VIDEO_ADV7175 if MEDIA_SUBDRV_AUTOSELECT
 	select VIDEO_VPX3220 if MEDIA_SUBDRV_AUTOSELECT
@@ -24,7 +24,7 @@ config VIDEO_ZORAN_DC30
 	  zr36050 MJPEG codec and zr36016 VFE.
 
 config VIDEO_ZORAN_ZR36060
-	tristate "Zoran ZR36060"
+	bool "Zoran ZR36060"
 	depends on VIDEO_ZORAN
 	help
 	  Say Y to support Zoran boards based on 36060 chips.
@@ -32,7 +32,7 @@ config VIDEO_ZORAN_ZR36060
 	  and 33 R10 and AverMedia 6 boards.
 
 config VIDEO_ZORAN_BUZ
-	tristate "Iomega Buz support"
+	bool "Iomega Buz support"
 	depends on VIDEO_ZORAN_ZR36060
 	select VIDEO_SAA711X if MEDIA_SUBDRV_AUTOSELECT
 	select VIDEO_SAA7185 if MEDIA_SUBDRV_AUTOSELECT
@@ -40,7 +40,7 @@ config VIDEO_ZORAN_BUZ
 	  Support for the Iomega Buz MJPEG capture/playback card.
 
 config VIDEO_ZORAN_DC10
-	tristate "Pinnacle/Miro DC10(+) support"
+	bool "Pinnacle/Miro DC10(+) support"
 	depends on VIDEO_ZORAN_ZR36060
 	select VIDEO_SAA7110 if MEDIA_SUBDRV_AUTOSELECT
 	select VIDEO_ADV7175 if MEDIA_SUBDRV_AUTOSELECT
@@ -49,7 +49,7 @@ config VIDEO_ZORAN_DC10
 	  card.
 
 config VIDEO_ZORAN_LML33
-	tristate "Linux Media Labs LML33 support"
+	bool "Linux Media Labs LML33 support"
 	depends on VIDEO_ZORAN_ZR36060
 	select VIDEO_BT819 if MEDIA_SUBDRV_AUTOSELECT
 	select VIDEO_BT856 if MEDIA_SUBDRV_AUTOSELECT
@@ -58,7 +58,7 @@ config VIDEO_ZORAN_LML33
 	  card.
 
 config VIDEO_ZORAN_LML33R10
-	tristate "Linux Media Labs LML33R10 support"
+	bool "Linux Media Labs LML33R10 support"
 	depends on VIDEO_ZORAN_ZR36060
 	select VIDEO_SAA711X if MEDIA_SUBDRV_AUTOSELECT
 	select VIDEO_ADV7170 if MEDIA_SUBDRV_AUTOSELECT
@@ -67,7 +67,7 @@ config VIDEO_ZORAN_LML33R10
 	  card.
 
 config VIDEO_ZORAN_AVS6EYES
-	tristate "AverMedia 6 Eyes support"
+	bool "AverMedia 6 Eyes support"
 	depends on VIDEO_ZORAN_ZR36060
 	select VIDEO_BT856 if MEDIA_SUBDRV_AUTOSELECT
 	select VIDEO_BT866 if MEDIA_SUBDRV_AUTOSELECT
diff --git a/drivers/staging/media/zoran/Makefile b/drivers/staging/media/zoran/Makefile
index 7023158e3892..9603bac0195c 100644
--- a/drivers/staging/media/zoran/Makefile
+++ b/drivers/staging/media/zoran/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 zr36067-objs	:=	zoran_device.o \
-			zoran_driver.o zoran_card.o
+			zoran_driver.o zoran_card.o videocodec.o
 
-obj-$(CONFIG_VIDEO_ZORAN) += zr36067.o videocodec.o
-obj-$(CONFIG_VIDEO_ZORAN_DC30) += zr36050.o zr36016.o
-obj-$(CONFIG_VIDEO_ZORAN_ZR36060) += zr36060.o
+obj-$(CONFIG_VIDEO_ZORAN) += zr36067.o
+zr36067-$(CONFIG_VIDEO_ZORAN_DC30) += zr36050.o zr36016.o
+zr36067-$(CONFIG_VIDEO_ZORAN_ZR36060) += zr36060.o
diff --git a/drivers/staging/media/zoran/videocodec.c b/drivers/staging/media/zoran/videocodec.c
index 3d5a83a07e07..7390fddd0279 100644
--- a/drivers/staging/media/zoran/videocodec.c
+++ b/drivers/staging/media/zoran/videocodec.c
@@ -8,8 +8,6 @@
  * (c) 2002 Wolfgang Scherr <scherr@net4you.at>
  */
 
-#define VIDEOCODEC_VERSION "v0.2"
-
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -72,12 +70,9 @@ struct videocodec *videocodec_attach(struct videocodec_master *master)
 		if ((master->flags & h->codec->flags) == master->flags) {
 			dprintk(4, "%s: try '%s'\n", __func__, h->codec->name);
 
-			if (!try_module_get(h->codec->owner))
-				return NULL;
-
 			codec = kmemdup(h->codec, sizeof(struct videocodec), GFP_KERNEL);
 			if (!codec)
-				goto out_module_put;
+				goto out_kfree;
 
 			res = strlen(codec->name);
 			snprintf(codec->name + res, sizeof(codec->name) - res, "[%d]", h->attached);
@@ -113,13 +108,10 @@ struct videocodec *videocodec_attach(struct videocodec_master *master)
 	pr_err("%s: no codec found!\n", __func__);
 	return NULL;
 
- out_module_put:
-	module_put(h->codec->owner);
  out_kfree:
 	kfree(codec);
 	return NULL;
 }
-EXPORT_SYMBOL(videocodec_attach);
 
 int videocodec_detach(struct videocodec *codec)
 {
@@ -160,7 +152,6 @@ int videocodec_detach(struct videocodec *codec)
 					prev->next = a->next;
 					dprintk(4, "videocodec: delete middle\n");
 				}
-				module_put(a->codec->owner);
 				kfree(a->codec);
 				kfree(a);
 				h->attached -= 1;
@@ -175,7 +166,6 @@ int videocodec_detach(struct videocodec *codec)
 	pr_err("%s: given codec not found!\n", __func__);
 	return -EINVAL;
 }
-EXPORT_SYMBOL(videocodec_detach);
 
 int videocodec_register(const struct videocodec *codec)
 {
@@ -208,7 +198,6 @@ int videocodec_register(const struct videocodec *codec)
 
 	return 0;
 }
-EXPORT_SYMBOL(videocodec_register);
 
 int videocodec_unregister(const struct videocodec *codec)
 {
@@ -255,7 +244,6 @@ int videocodec_unregister(const struct videocodec *codec)
 	pr_err("%s: given codec not found!\n", __func__);
 	return -EINVAL;
 }
-EXPORT_SYMBOL(videocodec_unregister);
 
 #ifdef CONFIG_VIDEO_ZORAN_DEBUG
 int videocodec_debugfs_show(struct seq_file *m)
@@ -286,25 +274,3 @@ int videocodec_debugfs_show(struct seq_file *m)
 	return 0;
 }
 #endif
-
-/* ===================== */
-/* hook in driver module */
-/* ===================== */
-static int __init videocodec_init(void)
-{
-	pr_info("Linux video codec intermediate layer: %s\n", VIDEOCODEC_VERSION);
-
-	return 0;
-}
-
-static void __exit videocodec_exit(void)
-{
-}
-
-module_init(videocodec_init);
-module_exit(videocodec_exit);
-
-MODULE_AUTHOR("Wolfgang Scherr <scherr@net4you.at>");
-MODULE_DESCRIPTION("Intermediate API module for video codecs "
-		   VIDEOCODEC_VERSION);
-MODULE_LICENSE("GPL");
diff --git a/drivers/staging/media/zoran/videocodec.h b/drivers/staging/media/zoran/videocodec.h
index f2e17566795e..7d0575554cca 100644
--- a/drivers/staging/media/zoran/videocodec.h
+++ b/drivers/staging/media/zoran/videocodec.h
@@ -234,7 +234,6 @@ struct jpeg_app_marker {
 };
 
 struct videocodec {
-	struct module *owner;
 	/* -- filled in by slave device during register -- */
 	char name[32];
 	unsigned long magic;	/* may be used for client<->master attaching */
diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index 6f29986a3fc2..a0739d3462bb 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -29,6 +29,9 @@
 #include "zoran.h"
 #include "zoran_card.h"
 #include "zoran_device.h"
+#include "zr36016.h"
+#include "zr36050.h"
+#include "zr36060.h"
 
 extern const struct zoran_format zoran_formats[];
 
@@ -266,6 +269,39 @@ static const char *codecid_to_modulename(u16 codecid)
 	return name;
 }
 
+static int load_codec(struct zoran *zr, u16 codecid)
+{
+	switch (codecid) {
+	case CODEC_TYPE_ZR36060:
+#ifdef CONFIG_VIDEO_ZORAN_ZR36060
+		return zr36060_init_module();
+#else
+		pci_err(zr->pci_dev, "ZR36060 support is not enabled\n");
+		return -EINVAL;
+#endif
+		break;
+	case CODEC_TYPE_ZR36050:
+#ifdef CONFIG_VIDEO_ZORAN_DC30
+		return zr36050_init_module();
+#else
+		pci_err(zr->pci_dev, "ZR36050 support is not enabled\n");
+		return -EINVAL;
+#endif
+		break;
+	case CODEC_TYPE_ZR36016:
+#ifdef CONFIG_VIDEO_ZORAN_DC30
+		return zr36016_init_module();
+#else
+		pci_err(zr->pci_dev, "ZR36016 support is not enabled\n");
+		return -EINVAL;
+#endif
+		break;
+	}
+
+	pci_err(zr->pci_dev, "unknown codec id %x\n", codecid);
+	return -EINVAL;
+}
+
 // struct tvnorm {
 //      u16 wt, wa, h_start, h_sync_start, ht, ha, v_start;
 // };
@@ -1080,6 +1116,8 @@ static int zoran_debugfs_show(struct seq_file *seq, void *v)
 
 	seq_printf(seq, "Prepared %u\n", zr->prepared);
 	seq_printf(seq, "Queued %u\n", zr->queued);
+
+	videocodec_debugfs_show(seq);
 	return 0;
 }
 
@@ -1264,17 +1302,17 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (zr->card.video_codec) {
 		codec_name = codecid_to_modulename(zr->card.video_codec);
 		if (codec_name) {
-			result = request_module(codec_name);
-			if (result)
-				pci_err(pdev, "failed to load modules %s: %d\n", codec_name, result);
+			result = load_codec(zr, zr->card.video_codec);
+			if (result < 0)
+				pci_err(pdev, "failed to load codec %s: %d\n", codec_name, result);
 		}
 	}
 	if (zr->card.video_vfe) {
 		vfe_name = codecid_to_modulename(zr->card.video_vfe);
 		if (vfe_name) {
-			result = request_module(vfe_name);
+			result = load_codec(zr, zr->card.video_vfe);
 			if (result < 0)
-				pci_err(pdev, "failed to load modules %s: %d\n", vfe_name, result);
+				pci_err(pdev, "failed to load codec %s: %d\n", vfe_name, result);
 		}
 	}
 
diff --git a/drivers/staging/media/zoran/zr36016.c b/drivers/staging/media/zoran/zr36016.c
index 50605460a44b..e3fda82fa479 100644
--- a/drivers/staging/media/zoran/zr36016.c
+++ b/drivers/staging/media/zoran/zr36016.c
@@ -390,7 +390,6 @@ static int zr36016_setup(struct videocodec *codec)
 }
 
 static const struct videocodec zr36016_codec = {
-	.owner = THIS_MODULE,
 	.name = "zr36016",
 	.magic = 0L,		/* magic not used */
 	.flags =
@@ -409,14 +408,14 @@ static const struct videocodec zr36016_codec = {
    HOOK IN DRIVER AS KERNEL MODULE
    ========================================================================= */
 
-static int __init zr36016_init_module(void)
+int zr36016_init_module(void)
 {
 	//dprintk(1, "ZR36016 driver %s\n",ZR016_VERSION);
 	zr36016_codecs = 0;
 	return videocodec_register(&zr36016_codec);
 }
 
-static void __exit zr36016_cleanup_module(void)
+void zr36016_cleanup_module(void)
 {
 	if (zr36016_codecs) {
 		dprintk(1,
@@ -425,10 +424,3 @@ static void __exit zr36016_cleanup_module(void)
 	}
 	videocodec_unregister(&zr36016_codec);
 }
-
-module_init(zr36016_init_module);
-module_exit(zr36016_cleanup_module);
-
-MODULE_AUTHOR("Wolfgang Scherr <scherr@net4you.at>");
-MODULE_DESCRIPTION("Driver module for ZR36016 video frontends");
-MODULE_LICENSE("GPL");
diff --git a/drivers/staging/media/zoran/zr36016.h b/drivers/staging/media/zoran/zr36016.h
index 1475f971cc24..04afba35669d 100644
--- a/drivers/staging/media/zoran/zr36016.h
+++ b/drivers/staging/media/zoran/zr36016.h
@@ -89,4 +89,6 @@ struct zr36016 {
 #define ZR016_SIGN           0x02
 #define ZR016_YMCS           0x01
 
+int zr36016_init_module(void);
+void zr36016_cleanup_module(void);
 #endif				/*fndef ZR36016_H */
diff --git a/drivers/staging/media/zoran/zr36050.c b/drivers/staging/media/zoran/zr36050.c
index 4dc7927fefc3..45d0eda69c7f 100644
--- a/drivers/staging/media/zoran/zr36050.c
+++ b/drivers/staging/media/zoran/zr36050.c
@@ -798,7 +798,6 @@ static int zr36050_setup(struct videocodec *codec)
 }
 
 static const struct videocodec zr36050_codec = {
-	.owner = THIS_MODULE,
 	.name = "zr36050",
 	.magic = 0L,		// magic not used
 	.flags =
@@ -817,14 +816,14 @@ static const struct videocodec zr36050_codec = {
    HOOK IN DRIVER AS KERNEL MODULE
    ========================================================================= */
 
-static int __init zr36050_init_module(void)
+int zr36050_init_module(void)
 {
 	//dprintk(1, "ZR36050 driver %s\n",ZR050_VERSION);
 	zr36050_codecs = 0;
 	return videocodec_register(&zr36050_codec);
 }
 
-static void __exit zr36050_cleanup_module(void)
+void zr36050_cleanup_module(void)
 {
 	if (zr36050_codecs) {
 		dprintk(1,
@@ -833,11 +832,3 @@ static void __exit zr36050_cleanup_module(void)
 	}
 	videocodec_unregister(&zr36050_codec);
 }
-
-module_init(zr36050_init_module);
-module_exit(zr36050_cleanup_module);
-
-MODULE_AUTHOR("Wolfgang Scherr <scherr@net4you.at>");
-MODULE_DESCRIPTION("Driver module for ZR36050 jpeg processors "
-		   ZR050_VERSION);
-MODULE_LICENSE("GPL");
diff --git a/drivers/staging/media/zoran/zr36050.h b/drivers/staging/media/zoran/zr36050.h
index 8f972d045b58..f9b58f4c77b9 100644
--- a/drivers/staging/media/zoran/zr36050.h
+++ b/drivers/staging/media/zoran/zr36050.h
@@ -160,4 +160,6 @@ struct zr36050 {
 #define ZR050_U_COMPONENT         1
 #define ZR050_V_COMPONENT         2
 
+int zr36050_init_module(void);
+void zr36050_cleanup_module(void);
 #endif				/*fndef ZR36050_H */
diff --git a/drivers/staging/media/zoran/zr36060.c b/drivers/staging/media/zoran/zr36060.c
index 7904d5b1f402..afbb5624e98f 100644
--- a/drivers/staging/media/zoran/zr36060.c
+++ b/drivers/staging/media/zoran/zr36060.c
@@ -831,7 +831,6 @@ static int zr36060_setup(struct videocodec *codec)
 }
 
 static const struct videocodec zr36060_codec = {
-	.owner = THIS_MODULE,
 	.name = "zr36060",
 	.magic = 0L,		// magic not used
 	.flags =
@@ -846,13 +845,13 @@ static const struct videocodec zr36060_codec = {
 	// others are not used
 };
 
-static int __init zr36060_init_module(void)
+int zr36060_init_module(void)
 {
 	zr36060_codecs = 0;
 	return videocodec_register(&zr36060_codec);
 }
 
-static void __exit zr36060_cleanup_module(void)
+void zr36060_cleanup_module(void)
 {
 	if (zr36060_codecs) {
 		dprintk(1,
@@ -863,10 +862,3 @@ static void __exit zr36060_cleanup_module(void)
 	/* however, we can't just stay alive */
 	videocodec_unregister(&zr36060_codec);
 }
-
-module_init(zr36060_init_module);
-module_exit(zr36060_cleanup_module);
-
-MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@skynet.be>");
-MODULE_DESCRIPTION("Driver module for ZR36060 jpeg processors " ZR060_VERSION);
-MODULE_LICENSE("GPL");
diff --git a/drivers/staging/media/zoran/zr36060.h b/drivers/staging/media/zoran/zr36060.h
index d2cdc26bf625..fbf5429534ac 100644
--- a/drivers/staging/media/zoran/zr36060.h
+++ b/drivers/staging/media/zoran/zr36060.h
@@ -198,4 +198,6 @@ struct zr36060 {
 #define ZR060_SR_H_SCALE2		 BIT(0)
 #define ZR060_SR_H_SCALE4		(2 << 0)
 
+int zr36060_init_module(void);
+void zr36060_cleanup_module(void);
 #endif				/*fndef ZR36060_H */
-- 
2.32.0

