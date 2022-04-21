Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6662509470
	for <lists+linux-media@lfdr.de>; Thu, 21 Apr 2022 02:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383410AbiDUA0n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Apr 2022 20:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232084AbiDUA0l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Apr 2022 20:26:41 -0400
Received: from beige.elm.relay.mailchannels.net (beige.elm.relay.mailchannels.net [23.83.212.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E954A1C120
        for <linux-media@vger.kernel.org>; Wed, 20 Apr 2022 17:23:51 -0700 (PDT)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id 0A7BF6C0D2A;
        Thu, 21 Apr 2022 00:23:51 +0000 (UTC)
Received: from pdx1-sub0-mail-a217.dreamhost.com (unknown [127.0.0.6])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id 3197A6C0778;
        Thu, 21 Apr 2022 00:23:50 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1650500630; a=rsa-sha256;
        cv=none;
        b=ld5JPFPHdz9yWMInqpc+Ua8KcYozVKJsNFLSAEtqkszz/ZOQDnBETH3UElDqSnQ3FVVEi4
        hm4qg7Xy03GMWFOjqvPP/CjPdsoD4Q0zVnFW1VOpm9ercTDdgRx94ULBI/VTmQ8Z5SD3fa
        g+rYkivG+3klSDH5ki0qBSN9H0TB3OCs0dJEdSJybOaofy3YGrfDhz64Sh3g928yzmcEXx
        GwuTZ14BP0wjoaPOFoGL40HthI8F8fsusfFVKuZrJMss3X2a103ndKKj1jg3ORunnpkmrX
        ENcEbVUu3p4dGpKl9BolZ6cn2G0+iqWilJakoe7oKOrG8T49VMZm62X03+EkAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
        s=arc-2022; t=1650500630;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:dkim-signature;
        bh=Kpjdg3rwv3bGBYFCEnz5aEfZSyJbhNhi1wgDW6D4C7g=;
        b=a7kzGpStlL76ODRRrlpbsCFUySVJNsD1GvbpD9oXRRgWMrgN2Td7cwGRJlDiFLwp9GmczA
        HqKB27ESAL5ajGEFiT0hEq+vFd3Bw/E1jfmXpwEvOmu5od0/0YQZW4ON+oLHRRaC1ALr3Z
        sZCD+xRvHQVbWOz9D26PkrSEjaQ3l2LUqIdsPx2rPrsEs0ZKUU/B5GLjm90GTDYUYRd6fW
        lXVvdIIDD/rLdHajYSD1j6iwK/IUgRdYrzb3UJvIocdfaUPwknLOXoOH9ypwVXTXoBmtiK
        /BeB0HZU9hzHqYpWCrmiKCrYjOeQs1Am4gmWbO29MN7PDAFXIcx5Ip1lso3j4Q==
ARC-Authentication-Results: i=1;
        rspamd-58ff8d7479-4crpt;
        auth=pass smtp.auth=dreamhost smtp.mailfrom=ian@linux.cowan.aero
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|ian@linux.cowan.aero
X-MailChannels-Auth-Id: dreamhost
X-Name-Unite: 0d598abd1544a86d_1650500630532_1595879619
X-MC-Loop-Signature: 1650500630532:1453684775
X-MC-Ingress-Time: 1650500630531
Received: from pdx1-sub0-mail-a217.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
        by 100.127.95.114 (trex/6.7.1);
        Thu, 21 Apr 2022 00:23:50 +0000
Received: from localhost.localdomain (unknown [69.12.38.97])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ian@linux.cowan.aero)
        by pdx1-sub0-mail-a217.dreamhost.com (Postfix) with ESMTPSA id 4KkJDj0n1kzZN;
        Wed, 20 Apr 2022 17:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.cowan.aero;
        s=dreamhost; t=1650500629;
        bh=Kpjdg3rwv3bGBYFCEnz5aEfZSyJbhNhi1wgDW6D4C7g=;
        h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
        b=Wcw+HiAzpAaxEidKVHD7Spbp4KOoRrll0hOmb2WOQQrGJEEwy+MrA1ZsHLNelEvqL
         oJ1b6y6Eb9z1nuuL2cF6F24Y2QPP115GxpeydH5ZOh2jpl3B3wD1/d4hEsmAjQJw/u
         wsUhIMu4cIUgvEJ81Fx1qS2so+Kk/+Cki5kzA05apkY6UInmVWrdRj+RFojuoj+FD8
         TfaYPkVxBgETKutBMuLExnKoS1EzkZiM9xWuUzYml+UfRr6uvG6cgYY3zmQXduj58z
         UrR1GZ5VLj+yNMoevUrd3YFxLDHLxOqPm5eEUPnw1n24EDqDIBgA9Cdz5p2QtsO+u6
         cmCFTNpAxUNEw==
From:   Ian Cowan <ian@linux.cowan.aero>
To:     clabbe@baylibre.com
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        mjpeg-users@lists.sourceforge.net, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, ian@linux.cowan.aero
Subject: [PATCH] media: staging: zoran: refactor printk debugging function
Date:   Wed, 20 Apr 2022 20:23:16 -0400
Message-Id: <20220421002316.873109-1-ian@linux.cowan.aero>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a patch to refactor the zoran debugging function. This function
existed in all of the changed files and they also all import the
videocodec header file. This patch moves the dprintk function into the
videocodec header file and out of each of the individual files.

Signed-off-by: Ian Cowan <ian@linux.cowan.aero>
---
 drivers/staging/media/zoran/videocodec.c | 67 +++++++++++++--------
 drivers/staging/media/zoran/videocodec.h |  7 +++
 drivers/staging/media/zoran/zr36016.c    | 48 ++++++++-------
 drivers/staging/media/zoran/zr36050.c    | 77 ++++++++++++------------
 drivers/staging/media/zoran/zr36060.c    | 54 ++++++++---------
 5 files changed, 141 insertions(+), 112 deletions(-)

diff --git a/drivers/staging/media/zoran/videocodec.c b/drivers/staging/media/zoran/videocodec.c
index 3af7d02bd910..e35d1f54d9b8 100644
--- a/drivers/staging/media/zoran/videocodec.c
+++ b/drivers/staging/media/zoran/videocodec.c
@@ -20,12 +20,6 @@ static int videocodec_debug;
 module_param(videocodec_debug, int, 0);
 MODULE_PARM_DESC(videocodec_debug, "Debug level (0-4)");
 
-#define dprintk(num, format, args...) \
-	do { \
-		if (videocodec_debug >= num) \
-			printk(format, ##args); \
-	} while (0)
-
 struct attached_list {
 	struct videocodec *codec;
 	struct attached_list *next;
@@ -56,8 +50,8 @@ struct videocodec *videocodec_attach(struct videocodec_master *master)
 		return NULL;
 	}
 
-	dprintk(2, "%s: '%s', flags %lx, magic %lx\n", __func__,
-		master->name, master->flags, master->magic);
+	dprintk(videocodec_debug, 2, "%s: '%s', flags %lx, magic %lx\n",
+		__func__, master->name, master->flags, master->magic);
 
 	if (!h) {
 		pr_err("%s: no device available\n", __func__);
@@ -68,7 +62,8 @@ struct videocodec *videocodec_attach(struct videocodec_master *master)
 		// attach only if the slave has at least the flags
 		// expected by the master
 		if ((master->flags & h->codec->flags) == master->flags) {
-			dprintk(4, "%s: try '%s'\n", __func__, h->codec->name);
+			dprintk(videocodec_debug, 4,
+				"%s: try '%s'\n", __func__, h->codec->name);
 
 			codec = kmemdup(h->codec, sizeof(struct videocodec), GFP_KERNEL);
 			if (!codec)
@@ -79,7 +74,8 @@ struct videocodec *videocodec_attach(struct videocodec_master *master)
 			codec->master_data = master;
 			res = codec->setup(codec);
 			if (res == 0) {
-				dprintk(3, "%s: '%s'\n", __func__, codec->name);
+				dprintk(videocodec_debug, 3,
+					"%s: '%s'\n", __func__, codec->name);
 				ptr = kzalloc(sizeof(*ptr), GFP_KERNEL);
 				if (!ptr)
 					goto out_kfree;
@@ -88,12 +84,16 @@ struct videocodec *videocodec_attach(struct videocodec_master *master)
 				a = h->list;
 				if (!a) {
 					h->list = ptr;
-					dprintk(4, "videocodec: first element\n");
+					dprintk(videocodec_debug, 4,
+						"videocodec: first element\n");
 				} else {
 					while (a->next)
 						a = a->next;	// find end
 					a->next = ptr;
-					dprintk(4, "videocodec: in after '%s'\n", h->codec->name);
+					dprintk(videocodec_debug,
+						4,
+						"videocodec: in after '%s'\n",
+						h->codec->name);
 				}
 
 				h->attached += 1;
@@ -124,8 +124,14 @@ int videocodec_detach(struct videocodec *codec)
 		return -EINVAL;
 	}
 
-	dprintk(2, "%s: '%s', type: %x, flags %lx, magic %lx\n", __func__,
-		codec->name, codec->type, codec->flags, codec->magic);
+	dprintk(videocodec_debug,
+		2,
+		"%s: '%s', type: %x, flags %lx, magic %lx\n",
+		__func__,
+		codec->name,
+		codec->type,
+		codec->flags,
+		codec->magic);
 
 	if (!h) {
 		pr_err("%s: no device left...\n", __func__);
@@ -139,7 +145,11 @@ int videocodec_detach(struct videocodec *codec)
 			if (codec == a->codec) {
 				res = a->codec->unset(a->codec);
 				if (res >= 0) {
-					dprintk(3, "%s: '%s'\n", __func__, a->codec->name);
+					dprintk(videocodec_debug,
+						3,
+						"%s: '%s'\n",
+						__func__,
+						a->codec->name);
 					a->codec->master_data = NULL;
 				} else {
 					pr_err("%s: '%s'\n", __func__, a->codec->name);
@@ -147,10 +157,14 @@ int videocodec_detach(struct videocodec *codec)
 				}
 				if (!prev) {
 					h->list = a->next;
-					dprintk(4, "videocodec: delete first\n");
+					dprintk(videocodec_debug,
+						4,
+						"videocodec: delete first\n");
 				} else {
 					prev->next = a->next;
-					dprintk(4, "videocodec: delete middle\n");
+					dprintk(videocodec_debug,
+						4,
+						"videocodec: delete middle\n");
 				}
 				kfree(a->codec);
 				kfree(a);
@@ -176,7 +190,7 @@ int videocodec_register(const struct videocodec *codec)
 		return -EINVAL;
 	}
 
-	dprintk(2,
+	dprintk(videocodec_debug, 2,
 		"videocodec: register '%s', type: %x, flags %lx, magic %lx\n",
 		codec->name, codec->type, codec->flags, codec->magic);
 
@@ -187,12 +201,15 @@ int videocodec_register(const struct videocodec *codec)
 
 	if (!h) {
 		codeclist_top = ptr;
-		dprintk(4, "videocodec: hooked in as first element\n");
+		dprintk(videocodec_debug,
+			4, "videocodec: hooked in as first element\n");
 	} else {
 		while (h->next)
 			h = h->next;	// find the end
 		h->next = ptr;
-		dprintk(4, "videocodec: hooked in after '%s'\n",
+		dprintk(videocodec_debug,
+			4,
+			"videocodec: hooked in after '%s'\n",
 			h->codec->name);
 	}
 
@@ -208,7 +225,7 @@ int videocodec_unregister(const struct videocodec *codec)
 		return -EINVAL;
 	}
 
-	dprintk(2,
+	dprintk(videocodec_debug, 2,
 		"videocodec: unregister '%s', type: %x, flags %lx, magic %lx\n",
 		codec->name, codec->type, codec->flags, codec->magic);
 
@@ -223,15 +240,17 @@ int videocodec_unregister(const struct videocodec *codec)
 				pr_err("videocodec: '%s' is used\n", h->codec->name);
 				return -EBUSY;
 			}
-			dprintk(3, "videocodec: unregister '%s' is ok.\n",
+			dprintk(videocodec_debug,
+				3,
+				"videocodec: unregister '%s' is ok.\n",
 				h->codec->name);
 			if (!prev) {
 				codeclist_top = h->next;
-				dprintk(4,
+				dprintk(videocodec_debug, 4,
 					"videocodec: delete first element\n");
 			} else {
 				prev->next = h->next;
-				dprintk(4,
+				dprintk(videocodec_debug, 4,
 					"videocodec: delete middle element\n");
 			}
 			kfree(h);
diff --git a/drivers/staging/media/zoran/videocodec.h b/drivers/staging/media/zoran/videocodec.h
index 9dea348fee40..857d0ef2847a 100644
--- a/drivers/staging/media/zoran/videocodec.h
+++ b/drivers/staging/media/zoran/videocodec.h
@@ -307,4 +307,11 @@ extern int videocodec_unregister(const struct videocodec *);
 
 int videocodec_debugfs_show(struct seq_file *m);
 
+/* Print debug information based on the specified level of debugging */
+#define dprintk(debug, num, format, args...) \
+do { \
+	if (debug > num) \
+		printk(format, ##args); \
+} while (0)
+
 #endif				/*ifndef __LINUX_VIDEOCODEC_H */
diff --git a/drivers/staging/media/zoran/zr36016.c b/drivers/staging/media/zoran/zr36016.c
index 26c7c32b6bc0..8c51235f504e 100644
--- a/drivers/staging/media/zoran/zr36016.c
+++ b/drivers/staging/media/zoran/zr36016.c
@@ -26,13 +26,6 @@ static int zr36016_debug;
 module_param(zr36016_debug, int, 0);
 MODULE_PARM_DESC(zr36016_debug, "Debug level (0-4)");
 
-
-#define dprintk(num, format, args...) \
-	do { \
-		if (zr36016_debug >= num) \
-			printk(format, ##args); \
-	} while (0)
-
 /* =========================================================================
    Local hardware I/O functions:
 
@@ -50,14 +43,16 @@ static u8 zr36016_read(struct zr36016 *ptr, u16 reg)
 	else
 		pr_err("%s: invalid I/O setup, nothing read!\n", ptr->name);
 
-	dprintk(4, "%s: reading from 0x%04x: %02x\n", ptr->name, reg, value);
+	dprintk(zr36016_debug, 4, "%s: reading from 0x%04x: %02x\n",
+		ptr->name, reg, value);
 
 	return value;
 }
 
 static void zr36016_write(struct zr36016 *ptr, u16 reg, u8 value)
 {
-	dprintk(4, "%s: writing 0x%02x to 0x%04x\n", ptr->name, value, reg);
+	dprintk(zr36016_debug, 4, "%s: writing 0x%02x to 0x%04x\n",
+		ptr->name, value, reg);
 
 	// just in case something is wrong...
 	if (ptr->codec->master_data->writereg)
@@ -81,14 +76,15 @@ static u8 zr36016_readi(struct zr36016 *ptr, u16 reg)
 		pr_err("%s: invalid I/O setup, nothing read (i)!\n", ptr->name);
 	}
 
-	dprintk(4, "%s: reading indirect from 0x%04x: %02x\n", ptr->name, reg, value);
+	dprintk(zr36016_debug, 4, "%s: reading indirect from 0x%04x: %02x\n",
+		ptr->name, reg, value);
 	return value;
 }
 
 static void zr36016_writei(struct zr36016 *ptr, u16 reg, u8 value)
 {
-	dprintk(4, "%s: writing indirect 0x%02x to 0x%04x\n", ptr->name,
-		value, reg);
+	dprintk(zr36016_debug, 4, "%s: writing indirect 0x%02x to 0x%04x\n",
+		ptr->name, value, reg);
 
 	/* just in case something is wrong... */
 	if (ptr->codec->master_data->writereg) {
@@ -124,10 +120,10 @@ static int zr36016_basic_test(struct zr36016 *ptr)
 		int i;
 
 		zr36016_writei(ptr, ZR016I_PAX_LO, 0x55);
-		dprintk(1, KERN_INFO "%s: registers: ", ptr->name);
+		dprintk(zr36016_debug, 1, KERN_INFO "%s: registers: ", ptr->name);
 		for (i = 0; i <= 0x0b; i++)
-			dprintk(1, "%02x ", zr36016_readi(ptr, i));
-		dprintk(1, "\n");
+			dprintk(zr36016_debug, 1, "%02x ", zr36016_readi(ptr, i));
+		dprintk(zr36016_debug, 1, "\n");
 	}
 	// for testing just write 0, then the default value to a register and read
 	// it back in both cases
@@ -166,7 +162,7 @@ static int zr36016_pushit(struct zr36016 *ptr,
 {
 	int i = 0;
 
-	dprintk(4, "%s: write data block to 0x%04x (len=%d)\n",
+	dprintk(zr36016_debug, 4, "%s: write data block to 0x%04x (len=%d)\n",
 		ptr->name, startreg, len);
 	while (i < len) {
 		zr36016_writei(ptr, startreg++,  data[i++]);
@@ -226,7 +222,7 @@ static int zr36016_set_mode(struct videocodec *codec, int mode)
 {
 	struct zr36016 *ptr = (struct zr36016 *)codec->data;
 
-	dprintk(2, "%s: set_mode %d call\n", ptr->name, mode);
+	dprintk(zr36016_debug, 2, "%s: set_mode %d call\n", ptr->name, mode);
 
 	if ((mode != CODEC_DO_EXPANSION) && (mode != CODEC_DO_COMPRESSION))
 		return -EINVAL;
@@ -243,7 +239,8 @@ static int zr36016_set_video(struct videocodec *codec, const struct tvnorm *norm
 {
 	struct zr36016 *ptr = (struct zr36016 *)codec->data;
 
-	dprintk(2, "%s: set_video %d.%d, %d/%d-%dx%d (0x%x) call\n",
+	dprintk(zr36016_debug, 2,
+		"%s: set_video %d.%d, %d/%d-%dx%d (0x%x) call\n",
 		ptr->name, norm->h_start, norm->v_start,
 		cap->x, cap->y, cap->width, cap->height,
 		cap->decimation);
@@ -278,7 +275,8 @@ static int zr36016_control(struct videocodec *codec, int type, int size, void *d
 	struct zr36016 *ptr = (struct zr36016 *)codec->data;
 	int *ival = (int *)data;
 
-	dprintk(2, "%s: control %d call with %d byte\n", ptr->name, type, size);
+	dprintk(zr36016_debug, 2, "%s: control %d call with %d byte\n",
+		ptr->name, type, size);
 
 	switch (type) {
 	case CODEC_G_STATUS:	/* get last status - we don't know it ... */
@@ -329,7 +327,8 @@ static int zr36016_unset(struct videocodec *codec)
 	if (ptr) {
 		/* do wee need some codec deinit here, too ???? */
 
-		dprintk(1, "%s: finished codec #%d\n", ptr->name, ptr->num);
+		dprintk(zr36016_debug, 1, "%s: finished codec #%d\n",
+			ptr->name, ptr->num);
 		kfree(ptr);
 		codec->data = NULL;
 
@@ -354,7 +353,8 @@ static int zr36016_setup(struct videocodec *codec)
 	struct zr36016 *ptr;
 	int res;
 
-	dprintk(2, "zr36016: initializing VFE subsystem #%d.\n", zr36016_codecs);
+	dprintk(zr36016_debug, 2, "zr36016: initializing VFE subsystem #%d.\n",
+		zr36016_codecs);
 
 	if (zr36016_codecs == MAX_CODECS) {
 		pr_err("zr36016: Can't attach more codecs!\n");
@@ -384,7 +384,9 @@ static int zr36016_setup(struct videocodec *codec)
 	ptr->ydec = 0;
 	zr36016_init(ptr);
 
-	dprintk(1, KERN_INFO "%s: codec v%d attached and running\n", ptr->name, ptr->version);
+	dprintk(zr36016_debug, 1,
+		KERN_INFO "%s: codec v%d attached and running\n",
+		ptr->name, ptr->version);
 
 	return 0;
 }
@@ -417,7 +419,7 @@ int zr36016_init_module(void)
 void zr36016_cleanup_module(void)
 {
 	if (zr36016_codecs) {
-		dprintk(1,
+		dprintk(zr36016_debug, 1,
 			"zr36016: something's wrong - %d codecs left somehow.\n",
 			zr36016_codecs);
 	}
diff --git a/drivers/staging/media/zoran/zr36050.c b/drivers/staging/media/zoran/zr36050.c
index 38f7021e7b06..af30e9794ba8 100644
--- a/drivers/staging/media/zoran/zr36050.c
+++ b/drivers/staging/media/zoran/zr36050.c
@@ -34,12 +34,6 @@ static int zr36050_debug;
 module_param(zr36050_debug, int, 0);
 MODULE_PARM_DESC(zr36050_debug, "Debug level (0-4)");
 
-#define dprintk(num, format, args...) \
-	do { \
-		if (zr36050_debug >= num) \
-			printk(format, ##args); \
-	} while (0)
-
 /* =========================================================================
    Local hardware I/O functions:
 
@@ -55,23 +49,26 @@ static u8 zr36050_read(struct zr36050 *ptr, u16 reg)
 	if (ptr->codec->master_data->readreg)
 		value = (ptr->codec->master_data->readreg(ptr->codec, reg)) & 0xFF;
 	else
-		dprintk(1,
-			KERN_ERR "%s: invalid I/O setup, nothing read!\n", ptr->name);
+		dprintk(zr36050_debug, 1,
+			KERN_ERR "%s: invalid I/O setup, nothing read!\n",
+			ptr->name);
 
-	dprintk(4, "%s: reading from 0x%04x: %02x\n", ptr->name, reg, value);
+	dprintk(zr36050_debug, 4, "%s: reading from 0x%04x: %02x\n",
+		ptr->name, reg, value);
 
 	return value;
 }
 
 static void zr36050_write(struct zr36050 *ptr, u16 reg, u8 value)
 {
-	dprintk(4, "%s: writing 0x%02x to 0x%04x\n", ptr->name, value, reg);
+	dprintk(zr36050_debug, 4, "%s: writing 0x%02x to 0x%04x\n",
+		ptr->name, value, reg);
 
 	/* just in case something is wrong... */
 	if (ptr->codec->master_data->writereg)
 		ptr->codec->master_data->writereg(ptr->codec, reg, value);
 	else
-		dprintk(1,
+		dprintk(zr36050_debug, 1,
 			KERN_ERR
 			"%s: invalid I/O setup, nothing written!\n",
 			ptr->name);
@@ -122,7 +119,7 @@ static void zr36050_wait_end(struct zr36050 *ptr)
 	while (!(zr36050_read_status1(ptr) & 0x4)) {
 		udelay(1);
 		if (i++ > 200000) {	// 200ms, there is for sure something wrong!!!
-			dprintk(1,
+			dprintk(zr36050_debug, 1,
 				"%s: timeout at wait_end (last status: 0x%02x)\n",
 				ptr->name, ptr->status1);
 			break;
@@ -142,7 +139,7 @@ static int zr36050_basic_test(struct zr36050 *ptr)
 	zr36050_write(ptr, ZR050_SOF_IDX + 1, 0x00);
 	if ((zr36050_read(ptr, ZR050_SOF_IDX) |
 	     zr36050_read(ptr, ZR050_SOF_IDX + 1)) != 0x0000) {
-		dprintk(1,
+		dprintk(zr36050_debug, 1,
 			KERN_ERR
 			"%s: attach failed, can't connect to jpeg processor!\n",
 			ptr->name);
@@ -152,7 +149,7 @@ static int zr36050_basic_test(struct zr36050 *ptr)
 	zr36050_write(ptr, ZR050_SOF_IDX + 1, 0xc0);
 	if (((zr36050_read(ptr, ZR050_SOF_IDX) << 8) |
 	     zr36050_read(ptr, ZR050_SOF_IDX + 1)) != 0xffc0) {
-		dprintk(1,
+		dprintk(zr36050_debug, 1,
 			KERN_ERR
 			"%s: attach failed, can't connect to jpeg processor!\n",
 			ptr->name);
@@ -161,7 +158,7 @@ static int zr36050_basic_test(struct zr36050 *ptr)
 
 	zr36050_wait_end(ptr);
 	if ((ptr->status1 & 0x4) == 0) {
-		dprintk(1,
+		dprintk(zr36050_debug, 1,
 			KERN_ERR
 			"%s: attach failed, jpeg processor failed (end flag)!\n",
 			ptr->name);
@@ -181,8 +178,8 @@ static int zr36050_pushit(struct zr36050 *ptr, u16 startreg, u16 len, const char
 {
 	int i = 0;
 
-	dprintk(4, "%s: write data block to 0x%04x (len=%d)\n", ptr->name,
-		startreg, len);
+	dprintk(zr36050_debug, 4, "%s: write data block to 0x%04x (len=%d)\n",
+		ptr->name, startreg, len);
 	while (i < len)
 		zr36050_write(ptr, startreg++, data[i++]);
 
@@ -308,8 +305,8 @@ static int zr36050_set_sof(struct zr36050 *ptr)
 	char sof_data[34];	// max. size of register set
 	int i;
 
-	dprintk(3, "%s: write SOF (%dx%d, %d components)\n", ptr->name,
-		ptr->width, ptr->height, NO_OF_COMPONENTS);
+	dprintk(zr36050_debug, 3, "%s: write SOF (%dx%d, %d components)\n",
+		ptr->name, ptr->width, ptr->height, NO_OF_COMPONENTS);
 	sof_data[0] = 0xff;
 	sof_data[1] = 0xc0;
 	sof_data[2] = 0x00;
@@ -339,7 +336,7 @@ static int zr36050_set_sos(struct zr36050 *ptr)
 	char sos_data[16];	// max. size of register set
 	int i;
 
-	dprintk(3, "%s: write SOS\n", ptr->name);
+	dprintk(zr36050_debug, 3, "%s: write SOS\n", ptr->name);
 	sos_data[0] = 0xff;
 	sos_data[1] = 0xda;
 	sos_data[2] = 0x00;
@@ -365,7 +362,7 @@ static int zr36050_set_dri(struct zr36050 *ptr)
 {
 	char dri_data[6];	// max. size of register set
 
-	dprintk(3, "%s: write DRI\n", ptr->name);
+	dprintk(zr36050_debug, 3, "%s: write DRI\n", ptr->name);
 	dri_data[0] = 0xff;
 	dri_data[1] = 0xdd;
 	dri_data[2] = 0x00;
@@ -389,7 +386,7 @@ static void zr36050_init(struct zr36050 *ptr)
 	long bitcnt, tmp;
 
 	if (ptr->mode == CODEC_DO_COMPRESSION) {
-		dprintk(2, "%s: COMPRESSION SETUP\n", ptr->name);
+		dprintk(zr36050_debug, 2, "%s: COMPRESSION SETUP\n", ptr->name);
 
 		/* 050 communicates with 057 in master mode */
 		zr36050_write(ptr, ZR050_HARDWARE, ZR050_HW_MSTR);
@@ -419,7 +416,7 @@ static void zr36050_init(struct zr36050 *ptr)
 
 		/* setup the fixed jpeg tables - maybe variable, though -
 		 * (see table init section above) */
-		dprintk(3, "%s: write DQT, DHT, APP\n", ptr->name);
+		dprintk(zr36050_debug, 3, "%s: write DQT, DHT, APP\n", ptr->name);
 		sum += zr36050_pushit(ptr, ZR050_DQT_IDX,
 				      sizeof(zr36050_dqt), zr36050_dqt);
 		sum += zr36050_pushit(ptr, ZR050_DHT_IDX,
@@ -442,7 +439,8 @@ static void zr36050_init(struct zr36050 *ptr)
 
 		zr36050_write(ptr, ZR050_GO, 1);	// launch codec
 		zr36050_wait_end(ptr);
-		dprintk(2, "%s: Status after table preload: 0x%02x\n",
+		dprintk(zr36050_debug, 2,
+			"%s: Status after table preload: 0x%02x\n",
 			ptr->name, ptr->status1);
 
 		if ((ptr->status1 & 0x4) == 0) {
@@ -457,7 +455,7 @@ static void zr36050_init(struct zr36050 *ptr)
 		bitcnt = sum << 3;	/* need the size in bits */
 
 		tmp = bitcnt >> 16;
-		dprintk(3,
+		dprintk(zr36050_debug, 3,
 			"%s: code: csize=%d, tot=%d, bit=%ld, highbits=%ld\n",
 			ptr->name, sum, ptr->real_code_vol, bitcnt, tmp);
 		zr36050_write(ptr, ZR050_TCV_NET_HI, tmp >> 8);
@@ -470,7 +468,8 @@ static void zr36050_init(struct zr36050 *ptr)
 		bitcnt -= ((bitcnt * 5) >> 6);	// bits without eob
 
 		tmp = bitcnt >> 16;
-		dprintk(3, "%s: code: nettobit=%ld, highnettobits=%ld\n",
+		dprintk(zr36050_debug, 3,
+			"%s: code: nettobit=%ld, highnettobits=%ld\n",
 			ptr->name, bitcnt, tmp);
 		zr36050_write(ptr, ZR050_TCV_DATA_HI, tmp >> 8);
 		zr36050_write(ptr, ZR050_TCV_DATA_MH, tmp & 0xff);
@@ -489,7 +488,7 @@ static void zr36050_init(struct zr36050 *ptr)
 			      ((ptr->app.len > 0) ? ZR050_ME_APP : 0) |
 			      ((ptr->com.len > 0) ? ZR050_ME_COM : 0));
 	} else {
-		dprintk(2, "%s: EXPANSION SETUP\n", ptr->name);
+		dprintk(zr36050_debug, 2, "%s: EXPANSION SETUP\n", ptr->name);
 
 		/* 050 communicates with 055 in master mode */
 		zr36050_write(ptr, ZR050_HARDWARE,
@@ -502,7 +501,7 @@ static void zr36050_init(struct zr36050 *ptr)
 		zr36050_write(ptr, ZR050_INT_REQ_0, 0);
 		zr36050_write(ptr, ZR050_INT_REQ_1, 3);	// low 2 bits always 1
 
-		dprintk(3, "%s: write DHT\n", ptr->name);
+		dprintk(zr36050_debug, 3, "%s: write DHT\n", ptr->name);
 		zr36050_pushit(ptr, ZR050_DHT_IDX, sizeof(zr36050_dht),
 			       zr36050_dht);
 
@@ -511,7 +510,8 @@ static void zr36050_init(struct zr36050 *ptr)
 
 		zr36050_write(ptr, ZR050_GO, 1);	// launch codec
 		zr36050_wait_end(ptr);
-		dprintk(2, "%s: Status after table preload: 0x%02x\n",
+		dprintk(zr36050_debug, 2,
+			"%s: Status after table preload: 0x%02x\n",
 			ptr->name, ptr->status1);
 
 		if ((ptr->status1 & 0x4) == 0) {
@@ -540,7 +540,7 @@ static int zr36050_set_mode(struct videocodec *codec, int mode)
 {
 	struct zr36050 *ptr = (struct zr36050 *)codec->data;
 
-	dprintk(2, "%s: set_mode %d call\n", ptr->name, mode);
+	dprintk(zr36050_debug, 2, "%s: set_mode %d call\n", ptr->name, mode);
 
 	if ((mode != CODEC_DO_EXPANSION) && (mode != CODEC_DO_COMPRESSION))
 		return -EINVAL;
@@ -558,7 +558,8 @@ static int zr36050_set_video(struct videocodec *codec, const struct tvnorm *norm
 	struct zr36050 *ptr = (struct zr36050 *)codec->data;
 	int size;
 
-	dprintk(2, "%s: set_video %d.%d, %d/%d-%dx%d (0x%x) q%d call\n",
+	dprintk(zr36050_debug, 2,
+		"%s: set_video %d.%d, %d/%d-%dx%d (0x%x) q%d call\n",
 		ptr->name, norm->h_start, norm->v_start,
 		cap->x, cap->y, cap->width, cap->height,
 		cap->decimation, cap->quality);
@@ -596,8 +597,8 @@ static int zr36050_control(struct videocodec *codec, int type, int size, void *d
 	struct zr36050 *ptr = (struct zr36050 *)codec->data;
 	int *ival = (int *)data;
 
-	dprintk(2, "%s: control %d call with %d byte\n", ptr->name, type,
-		size);
+	dprintk(zr36050_debug, 2, "%s: control %d call with %d byte\n",
+		ptr->name, type, size);
 
 	switch (type) {
 	case CODEC_G_STATUS:	/* get last status */
@@ -717,7 +718,7 @@ static int zr36050_unset(struct videocodec *codec)
 	if (ptr) {
 		/* do wee need some codec deinit here, too ???? */
 
-		dprintk(1, "%s: finished codec #%d\n", ptr->name,
+		dprintk(zr36050_debug, 1, "%s: finished codec #%d\n", ptr->name,
 			ptr->num);
 		kfree(ptr);
 		codec->data = NULL;
@@ -743,11 +744,11 @@ static int zr36050_setup(struct videocodec *codec)
 	struct zr36050 *ptr;
 	int res;
 
-	dprintk(2, "zr36050: initializing MJPEG subsystem #%d.\n",
+	dprintk(zr36050_debug, 2, "zr36050: initializing MJPEG subsystem #%d.\n",
 		zr36050_codecs);
 
 	if (zr36050_codecs == MAX_CODECS) {
-		dprintk(1,
+		dprintk(zr36050_debug, 1,
 			KERN_ERR "zr36050: Can't attach more codecs!\n");
 		return -ENOSPC;
 	}
@@ -789,7 +790,7 @@ static int zr36050_setup(struct videocodec *codec)
 
 	zr36050_init(ptr);
 
-	dprintk(1, KERN_INFO "%s: codec attached and running\n",
+	dprintk(zr36050_debug, 1, KERN_INFO "%s: codec attached and running\n",
 		ptr->name);
 
 	return 0;
@@ -823,7 +824,7 @@ int zr36050_init_module(void)
 void zr36050_cleanup_module(void)
 {
 	if (zr36050_codecs) {
-		dprintk(1,
+		dprintk(zr36050_debug, 1,
 			"zr36050: something's wrong - %d codecs left somehow.\n",
 			zr36050_codecs);
 	}
diff --git a/drivers/staging/media/zoran/zr36060.c b/drivers/staging/media/zoran/zr36060.c
index d0c369e31c81..a49af1b3a07f 100644
--- a/drivers/staging/media/zoran/zr36060.c
+++ b/drivers/staging/media/zoran/zr36060.c
@@ -36,12 +36,6 @@ static int zr36060_debug;
 module_param(zr36060_debug, int, 0);
 MODULE_PARM_DESC(zr36060_debug, "Debug level (0-4)");
 
-#define dprintk(num, format, args...) \
-	do { \
-		if (zr36060_debug >= num) \
-			printk(format, ##args); \
-	} while (0)
-
 /* =========================================================================
  * Local hardware I/O functions:
  * read/write via codec layer (registers are located in the master device)
@@ -63,7 +57,7 @@ static u8 zr36060_read(struct zr36060 *ptr, u16 reg)
 
 static void zr36060_write(struct zr36060 *ptr, u16 reg, u8 value)
 {
-	dprintk(4, "0x%02x @0x%04x\n", value, reg);
+	dprintk(zr36060_debug, 4, "0x%02x @0x%04x\n", value, reg);
 
 	// just in case something is wrong...
 	if (ptr->codec->master_data->writereg)
@@ -106,7 +100,7 @@ static void zr36060_wait_end(struct zr36060 *ptr)
 	while (zr36060_read_status(ptr) & ZR060_CFSR_BUSY) {
 		udelay(1);
 		if (i++ > 200000) {	// 200ms, there is for sure something wrong!!!
-			dprintk(1,
+			dprintk(zr36060_debug, 1,
 				"%s: timeout at wait_end (last status: 0x%02x)\n",
 				ptr->name, ptr->status);
 			break;
@@ -137,7 +131,7 @@ static int zr36060_pushit(struct zr36060 *ptr, u16 startreg, u16 len, const char
 {
 	int i = 0;
 
-	dprintk(4, "%s: write data block to 0x%04x (len=%d)\n", ptr->name,
+	dprintk(zr36060_debug, 4, "%s: write data block to 0x%04x (len=%d)\n", ptr->name,
 		startreg, len);
 	while (i < len)
 		zr36060_write(ptr, startreg++, data[i++]);
@@ -252,8 +246,8 @@ static int zr36060_set_sof(struct zr36060 *ptr)
 	char sof_data[34];	// max. size of register set
 	int i;
 
-	dprintk(3, "%s: write SOF (%dx%d, %d components)\n", ptr->name,
-		ptr->width, ptr->height, NO_OF_COMPONENTS);
+	dprintk(zr36060_debug, 3, "%s: write SOF (%dx%d, %d components)\n",
+		ptr->name, ptr->width, ptr->height, NO_OF_COMPONENTS);
 	sof_data[0] = 0xff;
 	sof_data[1] = 0xc0;
 	sof_data[2] = 0x00;
@@ -280,7 +274,7 @@ static int zr36060_set_sos(struct zr36060 *ptr)
 	char sos_data[16];	// max. size of register set
 	int i;
 
-	dprintk(3, "%s: write SOS\n", ptr->name);
+	dprintk(zr36060_debug, 3, "%s: write SOS\n", ptr->name);
 	sos_data[0] = 0xff;
 	sos_data[1] = 0xda;
 	sos_data[2] = 0x00;
@@ -304,7 +298,7 @@ static int zr36060_set_dri(struct zr36060 *ptr)
 {
 	char dri_data[6];	// max. size of register set
 
-	dprintk(3, "%s: write DRI\n", ptr->name);
+	dprintk(zr36060_debug, 3, "%s: write DRI\n", ptr->name);
 	dri_data[0] = 0xff;
 	dri_data[1] = 0xdd;
 	dri_data[2] = 0x00;
@@ -323,7 +317,7 @@ static void zr36060_init(struct zr36060 *ptr)
 	long bitcnt, tmp;
 
 	if (ptr->mode == CODEC_DO_COMPRESSION) {
-		dprintk(2, "%s: COMPRESSION SETUP\n", ptr->name);
+		dprintk(zr36060_debug, 2, "%s: COMPRESSION SETUP\n", ptr->name);
 
 		zr36060_write(ptr, ZR060_LOAD, ZR060_LOAD_SYNC_RST);
 
@@ -376,7 +370,7 @@ static void zr36060_init(struct zr36060 *ptr)
 		bitcnt = sum << 3;	/* need the size in bits */
 
 		tmp = bitcnt >> 16;
-		dprintk(3,
+		dprintk(zr36060_debug, 3,
 			"%s: code: csize=%d, tot=%d, bit=%ld, highbits=%ld\n",
 			ptr->name, sum, ptr->real_code_vol, bitcnt, tmp);
 		zr36060_write(ptr, ZR060_TCV_NET_HI, tmp >> 8);
@@ -389,7 +383,8 @@ static void zr36060_init(struct zr36060 *ptr)
 		bitcnt -= ((bitcnt * 5) >> 6);	// bits without eob
 
 		tmp = bitcnt >> 16;
-		dprintk(3, "%s: code: nettobit=%ld, highnettobits=%ld\n",
+		dprintk(zr36060_debug, 3,
+			"%s: code: nettobit=%ld, highnettobits=%ld\n",
 			ptr->name, bitcnt, tmp);
 		zr36060_write(ptr, ZR060_TCV_DATA_HI, tmp >> 8);
 		zr36060_write(ptr, ZR060_TCV_DATA_MH, tmp & 0xff);
@@ -408,7 +403,7 @@ static void zr36060_init(struct zr36060 *ptr)
 		zr36060_write(ptr, ZR060_VCR, ZR060_VCR_RANGE);
 
 	} else {
-		dprintk(2, "%s: EXPANSION SETUP\n", ptr->name);
+		dprintk(zr36060_debug, 2, "%s: EXPANSION SETUP\n", ptr->name);
 
 		zr36060_write(ptr, ZR060_LOAD, ZR060_LOAD_SYNC_RST);
 
@@ -441,7 +436,8 @@ static void zr36060_init(struct zr36060 *ptr)
 	/* Load the tables */
 	zr36060_write(ptr, ZR060_LOAD, ZR060_LOAD_SYNC_RST | ZR060_LOAD_LOAD);
 	zr36060_wait_end(ptr);
-	dprintk(2, "%s: Status after table preload: 0x%02x\n", ptr->name, ptr->status);
+	dprintk(zr36060_debug, 2, "%s: Status after table preload: 0x%02x\n",
+		ptr->name, ptr->status);
 
 	if (ptr->status & ZR060_CFSR_BUSY) {
 		pr_err("%s: init aborted!\n", ptr->name);
@@ -462,7 +458,7 @@ static int zr36060_set_mode(struct videocodec *codec, int mode)
 {
 	struct zr36060 *ptr = (struct zr36060 *)codec->data;
 
-	dprintk(2, "%s: set_mode %d call\n", ptr->name, mode);
+	dprintk(zr36060_debug, 2, "%s: set_mode %d call\n", ptr->name, mode);
 
 	if (mode != CODEC_DO_EXPANSION && mode != CODEC_DO_COMPRESSION)
 		return -EINVAL;
@@ -481,8 +477,9 @@ static int zr36060_set_video(struct videocodec *codec, const struct tvnorm *norm
 	u32 reg;
 	int size;
 
-	dprintk(2, "%s: set_video %d/%d-%dx%d (%%%d) call\n", ptr->name,
-		cap->x, cap->y, cap->width, cap->height, cap->decimation);
+	dprintk(zr36060_debug, 2, "%s: set_video %d/%d-%dx%d (%%%d) call\n",
+		ptr->name, cap->x, cap->y, cap->width,
+		cap->height, cap->decimation);
 
 	/* if () return -EINVAL;
 	 * trust the master driver that it knows what it does - so
@@ -639,8 +636,8 @@ static int zr36060_control(struct videocodec *codec, int type, int size, void *d
 	struct zr36060 *ptr = (struct zr36060 *)codec->data;
 	int *ival = (int *)data;
 
-	dprintk(2, "%s: control %d call with %d byte\n", ptr->name, type,
-		size);
+	dprintk(zr36060_debug, 2, "%s: control %d call with %d byte\n",
+		ptr->name, type, size);
 
 	switch (type) {
 	case CODEC_G_STATUS:	/* get last status */
@@ -757,7 +754,8 @@ static int zr36060_unset(struct videocodec *codec)
 	if (ptr) {
 		/* do wee need some codec deinit here, too ???? */
 
-		dprintk(1, "%s: finished codec #%d\n", ptr->name, ptr->num);
+		dprintk(zr36060_debug, 1, "%s: finished codec #%d\n",
+			ptr->name, ptr->num);
 		kfree(ptr);
 		codec->data = NULL;
 
@@ -780,7 +778,8 @@ static int zr36060_setup(struct videocodec *codec)
 	struct zr36060 *ptr;
 	int res;
 
-	dprintk(2, "zr36060: initializing MJPEG subsystem #%d.\n", zr36060_codecs);
+	dprintk(zr36060_debug, 2, "zr36060: initializing MJPEG subsystem #%d.\n",
+		zr36060_codecs);
 
 	if (zr36060_codecs == MAX_CODECS) {
 		pr_err("zr36060: Can't attach more codecs!\n");
@@ -823,7 +822,8 @@ static int zr36060_setup(struct videocodec *codec)
 
 	zr36060_init(ptr);
 
-	dprintk(1, KERN_INFO "%s: codec attached and running\n", ptr->name);
+	dprintk(zr36060_debug, 1, KERN_INFO "%s: codec attached and running\n",
+		ptr->name);
 
 	return 0;
 }
@@ -852,7 +852,7 @@ int zr36060_init_module(void)
 void zr36060_cleanup_module(void)
 {
 	if (zr36060_codecs) {
-		dprintk(1,
+		dprintk(zr36060_debug, 1,
 			"zr36060: something's wrong - %d codecs left somehow.\n",
 			zr36060_codecs);
 	}
-- 
2.32.0

