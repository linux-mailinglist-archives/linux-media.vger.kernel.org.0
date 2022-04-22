Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F2FD50ACD0
	for <lists+linux-media@lfdr.de>; Fri, 22 Apr 2022 02:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442946AbiDVAgw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 20:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbiDVAgv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 20:36:51 -0400
Received: from bee.birch.relay.mailchannels.net (bee.birch.relay.mailchannels.net [23.83.209.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94CBB43EC5
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 17:33:58 -0700 (PDT)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id DD2458219D4;
        Fri, 22 Apr 2022 00:33:57 +0000 (UTC)
Received: from pdx1-sub0-mail-a217.dreamhost.com (unknown [127.0.0.6])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id 2F2E48219D3;
        Fri, 22 Apr 2022 00:33:57 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1650587637; a=rsa-sha256;
        cv=none;
        b=STzAKCEgQvt6Txm9T3du3i9fdgi9UlBpfCO/Ew+QNIajq/SB6IiQT2llS1qRfjX3m3KlD6
        hhyrVN8vpIn4ka1ixO1l5J1RvArlRd2EGUL7G9bEWwBkYEeycYJUM5CUbMD9CilDHi/trM
        dGlpvt8NwsWpXuLsrxNMVdOmV1iRrFAehhcwM9vIFMhOBaswuvl9qa93Z8MVlwFQ/IJq7+
        rP7pool70Z4JWi0emopbKAc4KQy8RlED0V+zqwKV729YgIiJI03JGO4eupin7sycOQtIuX
        FEgeVPlaM2NrEVXk1Jc7LFFMhXFQBqgpmq6+7wo7Sl07v11WHa4ok86/y1r+Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
        s=arc-2022; t=1650587637;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:dkim-signature;
        bh=7rmgAGidBXNPyMlrSnWLxv8N6gOrRYX1OeWPTSrUt6U=;
        b=vCGXRs/OuvocRZdhJqSX8Z2bUCq/hZ2JbWkug7ox0aL09EqgQ8sRvwhar5XSUsI6WF9TzK
        xLB1E59muZUfWPGtK0MCDW3YNs/izMkx+tdvqMDlOmt9MGCqYC36hr7DZXUL0Z1lSh4HPp
        6l5Zyz64j8og1C+ZULKuuhlHkvBphAahFfHgev+ZGbR3ISjsyrVDzNaFwbEIBU4UY6WLqV
        7XzbTMI8BwkpI/Hk1cES5WIC9vaWC1htLrC3B3AnCvEhQKDDtG6c1wLBlnXlgavykXmhDe
        o7O8hoIJ65W5YYQgn8s+0fERakAR25ZZCxJn7B8neNJsUQ/9kNFggiTZgj1ZNQ==
ARC-Authentication-Results: i=1;
        rspamd-58ff8d7479-x7t22;
        auth=pass smtp.auth=dreamhost smtp.mailfrom=ian@linux.cowan.aero
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|ian@linux.cowan.aero
X-MailChannels-Auth-Id: dreamhost
X-Broad-Supply: 77a21f7739de3669_1650587637566_2325064995
X-MC-Loop-Signature: 1650587637566:2568388663
X-MC-Ingress-Time: 1650587637565
Received: from pdx1-sub0-mail-a217.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
        by 100.101.255.132 (trex/6.7.1);
        Fri, 22 Apr 2022 00:33:57 +0000
Received: from localhost.localdomain (unknown [69.12.38.97])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ian@linux.cowan.aero)
        by pdx1-sub0-mail-a217.dreamhost.com (Postfix) with ESMTPSA id 4KkwPw0JtFzZX;
        Thu, 21 Apr 2022 17:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.cowan.aero;
        s=dreamhost; t=1650587636;
        bh=7rmgAGidBXNPyMlrSnWLxv8N6gOrRYX1OeWPTSrUt6U=;
        h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
        b=Xkc/O7HG2DQF8eBcZwRt7RGNYUP6zKR1H8WFMAgagx9ejBaJEmNU7bnPui1jqpchq
         Xy1XBX1q5+z7eRA1qTGK+/Q8+kt0wh9PezSsB/XubdBRTM+ovfa4sBEy9pnVbj5i0C
         Ahl/pORB14Y8R/DTXeC03xCN549FtWd4VpoGHc8H65DVGlFqy5OcajJMyePo0FYUOE
         UGPNgnBvO3AwPjDrO825QHtxFIPsHai1xDaKSxRasNzdrf6zge3cA0lXS8qMM2JroY
         tNUOXufQjH1V1BbglrrzmYHTd6rHVmYx/+RgT6FAuOe2xT5/+0jbvP7aD4PIIBjkh4
         hCalyxshwqzBw==
From:   Ian Cowan <ian@linux.cowan.aero>
To:     clabbe@baylibre.com
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        dan.carpenter@oracle.com, mjpeg-users@lists.sourceforge.net,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        ian@linux.cowan.aero
Subject: [PATCH] staging: media: zoran: modify kernel debugging function
Date:   Thu, 21 Apr 2022 20:33:44 -0400
Message-Id: <20220422003344.1129120-1-ian@linux.cowan.aero>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This removed the dprintk() function which used the printk() function for
kernel debug printing. These have all been replaced with the appropriate
pr_X() functions. Where the log level is necessary, this has been replace
by using CONSOLE_LOGLEVEL_DEFAULT.

Signed-off-by: Ian Cowan <ian@linux.cowan.aero>
---
 drivers/staging/media/zoran/videocodec.c |  66 ++++++--------
 drivers/staging/media/zoran/zr36016.c    |  59 +++++-------
 drivers/staging/media/zoran/zr36050.c    | 109 +++++++++--------------
 drivers/staging/media/zoran/zr36060.c    |  70 ++++++---------
 4 files changed, 120 insertions(+), 184 deletions(-)

diff --git a/drivers/staging/media/zoran/videocodec.c b/drivers/staging/media/zoran/videocodec.c
index 3af7d02bd910..16760f259c35 100644
--- a/drivers/staging/media/zoran/videocodec.c
+++ b/drivers/staging/media/zoran/videocodec.c
@@ -16,16 +16,6 @@
 
 #include "videocodec.h"
 
-static int videocodec_debug;
-module_param(videocodec_debug, int, 0);
-MODULE_PARM_DESC(videocodec_debug, "Debug level (0-4)");
-
-#define dprintk(num, format, args...) \
-	do { \
-		if (videocodec_debug >= num) \
-			printk(format, ##args); \
-	} while (0)
-
 struct attached_list {
 	struct videocodec *codec;
 	struct attached_list *next;
@@ -56,8 +46,8 @@ struct videocodec *videocodec_attach(struct videocodec_master *master)
 		return NULL;
 	}
 
-	dprintk(2, "%s: '%s', flags %lx, magic %lx\n", __func__,
-		master->name, master->flags, master->magic);
+	pr_debug("%s: '%s', flags %lx, magic %lx\n", __func__,
+		 master->name, master->flags, master->magic);
 
 	if (!h) {
 		pr_err("%s: no device available\n", __func__);
@@ -68,7 +58,7 @@ struct videocodec *videocodec_attach(struct videocodec_master *master)
 		// attach only if the slave has at least the flags
 		// expected by the master
 		if ((master->flags & h->codec->flags) == master->flags) {
-			dprintk(4, "%s: try '%s'\n", __func__, h->codec->name);
+			pr_debug("%s: try '%s'\n", __func__, h->codec->name);
 
 			codec = kmemdup(h->codec, sizeof(struct videocodec), GFP_KERNEL);
 			if (!codec)
@@ -79,7 +69,7 @@ struct videocodec *videocodec_attach(struct videocodec_master *master)
 			codec->master_data = master;
 			res = codec->setup(codec);
 			if (res == 0) {
-				dprintk(3, "%s: '%s'\n", __func__, codec->name);
+				pr_debug("%s: '%s'\n", __func__, codec->name);
 				ptr = kzalloc(sizeof(*ptr), GFP_KERNEL);
 				if (!ptr)
 					goto out_kfree;
@@ -88,12 +78,13 @@ struct videocodec *videocodec_attach(struct videocodec_master *master)
 				a = h->list;
 				if (!a) {
 					h->list = ptr;
-					dprintk(4, "videocodec: first element\n");
+					pr_debug("videocodec: first element\n");
 				} else {
 					while (a->next)
 						a = a->next;	// find end
 					a->next = ptr;
-					dprintk(4, "videocodec: in after '%s'\n", h->codec->name);
+					pr_debug("videocodec: in after '%s'\n",
+						 h->codec->name);
 				}
 
 				h->attached += 1;
@@ -124,8 +115,8 @@ int videocodec_detach(struct videocodec *codec)
 		return -EINVAL;
 	}
 
-	dprintk(2, "%s: '%s', type: %x, flags %lx, magic %lx\n", __func__,
-		codec->name, codec->type, codec->flags, codec->magic);
+	pr_debug("%s: '%s', type: %x, flags %lx, magic %lx\n", __func__,
+		 codec->name, codec->type, codec->flags, codec->magic);
 
 	if (!h) {
 		pr_err("%s: no device left...\n", __func__);
@@ -139,18 +130,20 @@ int videocodec_detach(struct videocodec *codec)
 			if (codec == a->codec) {
 				res = a->codec->unset(a->codec);
 				if (res >= 0) {
-					dprintk(3, "%s: '%s'\n", __func__, a->codec->name);
+					pr_debug("%s: '%s'\n", __func__,
+						 a->codec->name);
 					a->codec->master_data = NULL;
 				} else {
-					pr_err("%s: '%s'\n", __func__, a->codec->name);
+					pr_err("%s: '%s'\n", __func__,
+					       a->codec->name);
 					a->codec->master_data = NULL;
 				}
 				if (!prev) {
 					h->list = a->next;
-					dprintk(4, "videocodec: delete first\n");
+					pr_debug("videocodec: delete first\n");
 				} else {
 					prev->next = a->next;
-					dprintk(4, "videocodec: delete middle\n");
+					pr_debug("videocodec: delete middle\n");
 				}
 				kfree(a->codec);
 				kfree(a);
@@ -176,9 +169,8 @@ int videocodec_register(const struct videocodec *codec)
 		return -EINVAL;
 	}
 
-	dprintk(2,
-		"videocodec: register '%s', type: %x, flags %lx, magic %lx\n",
-		codec->name, codec->type, codec->flags, codec->magic);
+	pr_debug("videocodec: register '%s', type: %x, flags %lx, magic %lx\n",
+		 codec->name, codec->type, codec->flags, codec->magic);
 
 	ptr = kzalloc(sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
@@ -187,13 +179,13 @@ int videocodec_register(const struct videocodec *codec)
 
 	if (!h) {
 		codeclist_top = ptr;
-		dprintk(4, "videocodec: hooked in as first element\n");
+		pr_debug("videocodec: hooked in as first element\n");
 	} else {
 		while (h->next)
 			h = h->next;	// find the end
 		h->next = ptr;
-		dprintk(4, "videocodec: hooked in after '%s'\n",
-			h->codec->name);
+		pr_debug("videocodec: hooked in after '%s'\n",
+			 h->codec->name);
 	}
 
 	return 0;
@@ -208,9 +200,8 @@ int videocodec_unregister(const struct videocodec *codec)
 		return -EINVAL;
 	}
 
-	dprintk(2,
-		"videocodec: unregister '%s', type: %x, flags %lx, magic %lx\n",
-		codec->name, codec->type, codec->flags, codec->magic);
+	pr_debug("videocodec: unregister '%s', type: %x, flags %lx, magic %lx\n",
+		 codec->name, codec->type, codec->flags, codec->magic);
 
 	if (!h) {
 		pr_err("%s: no device left...\n", __func__);
@@ -220,19 +211,18 @@ int videocodec_unregister(const struct videocodec *codec)
 	while (h) {
 		if (codec == h->codec) {
 			if (h->attached) {
-				pr_err("videocodec: '%s' is used\n", h->codec->name);
+				pr_err("videocodec: '%s' is used\n",
+				       h->codec->name);
 				return -EBUSY;
 			}
-			dprintk(3, "videocodec: unregister '%s' is ok.\n",
-				h->codec->name);
+			pr_debug("videocodec: unregister '%s' is ok.\n",
+				 h->codec->name);
 			if (!prev) {
 				codeclist_top = h->next;
-				dprintk(4,
-					"videocodec: delete first element\n");
+				pr_debug("videocodec: delete first element\n");
 			} else {
 				prev->next = h->next;
-				dprintk(4,
-					"videocodec: delete middle element\n");
+				pr_debug("videocodec: delete middle element\n");
 			}
 			kfree(h);
 			return 0;
diff --git a/drivers/staging/media/zoran/zr36016.c b/drivers/staging/media/zoran/zr36016.c
index 26c7c32b6bc0..81b7677f43dc 100644
--- a/drivers/staging/media/zoran/zr36016.c
+++ b/drivers/staging/media/zoran/zr36016.c
@@ -22,17 +22,6 @@
 /* amount of chips attached via this driver */
 static int zr36016_codecs;
 
-static int zr36016_debug;
-module_param(zr36016_debug, int, 0);
-MODULE_PARM_DESC(zr36016_debug, "Debug level (0-4)");
-
-
-#define dprintk(num, format, args...) \
-	do { \
-		if (zr36016_debug >= num) \
-			printk(format, ##args); \
-	} while (0)
-
 /* =========================================================================
    Local hardware I/O functions:
 
@@ -50,14 +39,14 @@ static u8 zr36016_read(struct zr36016 *ptr, u16 reg)
 	else
 		pr_err("%s: invalid I/O setup, nothing read!\n", ptr->name);
 
-	dprintk(4, "%s: reading from 0x%04x: %02x\n", ptr->name, reg, value);
+	pr_debug("%s: reading from 0x%04x: %02x\n", ptr->name, reg, value);
 
 	return value;
 }
 
 static void zr36016_write(struct zr36016 *ptr, u16 reg, u8 value)
 {
-	dprintk(4, "%s: writing 0x%02x to 0x%04x\n", ptr->name, value, reg);
+	pr_debug("%s: writing 0x%02x to 0x%04x\n", ptr->name, value, reg);
 
 	// just in case something is wrong...
 	if (ptr->codec->master_data->writereg)
@@ -81,14 +70,14 @@ static u8 zr36016_readi(struct zr36016 *ptr, u16 reg)
 		pr_err("%s: invalid I/O setup, nothing read (i)!\n", ptr->name);
 	}
 
-	dprintk(4, "%s: reading indirect from 0x%04x: %02x\n", ptr->name, reg, value);
+	pr_debug("%s: reading indirect from 0x%04x: %02x\n", ptr->name, reg, value);
 	return value;
 }
 
 static void zr36016_writei(struct zr36016 *ptr, u16 reg, u8 value)
 {
-	dprintk(4, "%s: writing indirect 0x%02x to 0x%04x\n", ptr->name,
-		value, reg);
+	pr_debug("%s: writing indirect 0x%02x to 0x%04x\n", ptr->name,
+		 value, reg);
 
 	/* just in case something is wrong... */
 	if (ptr->codec->master_data->writereg) {
@@ -120,14 +109,14 @@ static u8 zr36016_read_version(struct zr36016 *ptr)
 
 static int zr36016_basic_test(struct zr36016 *ptr)
 {
-	if (zr36016_debug) {
+	if (*KERN_INFO <= CONSOLE_LOGLEVEL_DEFAULT) {
 		int i;
 
 		zr36016_writei(ptr, ZR016I_PAX_LO, 0x55);
-		dprintk(1, KERN_INFO "%s: registers: ", ptr->name);
+		pr_info("%s: registers: ", ptr->name);
 		for (i = 0; i <= 0x0b; i++)
-			dprintk(1, "%02x ", zr36016_readi(ptr, i));
-		dprintk(1, "\n");
+			pr_info("%02x ", zr36016_readi(ptr, i));
+		pr_info("\n");
 	}
 	// for testing just write 0, then the default value to a register and read
 	// it back in both cases
@@ -144,8 +133,8 @@ static int zr36016_basic_test(struct zr36016 *ptr)
 	// we allow version numbers from 0-3, should be enough, though
 	zr36016_read_version(ptr);
 	if (ptr->version & 0x0c) {
-		pr_err("%s: attach failed, suspicious version %d found...\n", ptr->name,
-		       ptr->version);
+		pr_err("%s: attach failed, suspicious version %d found...\n",
+		       ptr->name, ptr->version);
 		return -ENXIO;
 	}
 
@@ -166,8 +155,8 @@ static int zr36016_pushit(struct zr36016 *ptr,
 {
 	int i = 0;
 
-	dprintk(4, "%s: write data block to 0x%04x (len=%d)\n",
-		ptr->name, startreg, len);
+	pr_debug("%s: write data block to 0x%04x (len=%d)\n",
+		 ptr->name, startreg, len);
 	while (i < len) {
 		zr36016_writei(ptr, startreg++,  data[i++]);
 	}
@@ -226,7 +215,7 @@ static int zr36016_set_mode(struct videocodec *codec, int mode)
 {
 	struct zr36016 *ptr = (struct zr36016 *)codec->data;
 
-	dprintk(2, "%s: set_mode %d call\n", ptr->name, mode);
+	pr_debug("%s: set_mode %d call\n", ptr->name, mode);
 
 	if ((mode != CODEC_DO_EXPANSION) && (mode != CODEC_DO_COMPRESSION))
 		return -EINVAL;
@@ -243,10 +232,9 @@ static int zr36016_set_video(struct videocodec *codec, const struct tvnorm *norm
 {
 	struct zr36016 *ptr = (struct zr36016 *)codec->data;
 
-	dprintk(2, "%s: set_video %d.%d, %d/%d-%dx%d (0x%x) call\n",
-		ptr->name, norm->h_start, norm->v_start,
-		cap->x, cap->y, cap->width, cap->height,
-		cap->decimation);
+	pr_debug("%s: set_video %d.%d, %d/%d-%dx%d (0x%x) call\n",
+		 ptr->name, norm->h_start, norm->v_start,
+		 cap->x, cap->y, cap->width, cap->height, cap->decimation);
 
 	/* if () return -EINVAL;
 	 * trust the master driver that it knows what it does - so
@@ -278,7 +266,7 @@ static int zr36016_control(struct videocodec *codec, int type, int size, void *d
 	struct zr36016 *ptr = (struct zr36016 *)codec->data;
 	int *ival = (int *)data;
 
-	dprintk(2, "%s: control %d call with %d byte\n", ptr->name, type, size);
+	pr_debug("%s: control %d call with %d byte\n", ptr->name, type, size);
 
 	switch (type) {
 	case CODEC_G_STATUS:	/* get last status - we don't know it ... */
@@ -329,7 +317,7 @@ static int zr36016_unset(struct videocodec *codec)
 	if (ptr) {
 		/* do wee need some codec deinit here, too ???? */
 
-		dprintk(1, "%s: finished codec #%d\n", ptr->name, ptr->num);
+		pr_debug("%s: finished codec #%d\n", ptr->name, ptr->num);
 		kfree(ptr);
 		codec->data = NULL;
 
@@ -354,7 +342,7 @@ static int zr36016_setup(struct videocodec *codec)
 	struct zr36016 *ptr;
 	int res;
 
-	dprintk(2, "zr36016: initializing VFE subsystem #%d.\n", zr36016_codecs);
+	pr_debug("zr36016: initializing VFE subsystem #%d.\n", zr36016_codecs);
 
 	if (zr36016_codecs == MAX_CODECS) {
 		pr_err("zr36016: Can't attach more codecs!\n");
@@ -384,7 +372,7 @@ static int zr36016_setup(struct videocodec *codec)
 	ptr->ydec = 0;
 	zr36016_init(ptr);
 
-	dprintk(1, KERN_INFO "%s: codec v%d attached and running\n", ptr->name, ptr->version);
+	pr_info("%s: codec v%d attached and running\n", ptr->name, ptr->version);
 
 	return 0;
 }
@@ -417,9 +405,8 @@ int zr36016_init_module(void)
 void zr36016_cleanup_module(void)
 {
 	if (zr36016_codecs) {
-		dprintk(1,
-			"zr36016: something's wrong - %d codecs left somehow.\n",
-			zr36016_codecs);
+		pr_err("zr36016: something's wrong - %d codecs left somehow.\n",
+		       zr36016_codecs);
 	}
 	videocodec_unregister(&zr36016_codec);
 }
diff --git a/drivers/staging/media/zoran/zr36050.c b/drivers/staging/media/zoran/zr36050.c
index 38f7021e7b06..b4efa735ad4d 100644
--- a/drivers/staging/media/zoran/zr36050.c
+++ b/drivers/staging/media/zoran/zr36050.c
@@ -29,17 +29,6 @@
 /* amount of chips attached via this driver */
 static int zr36050_codecs;
 
-/* debugging is available via module parameter */
-static int zr36050_debug;
-module_param(zr36050_debug, int, 0);
-MODULE_PARM_DESC(zr36050_debug, "Debug level (0-4)");
-
-#define dprintk(num, format, args...) \
-	do { \
-		if (zr36050_debug >= num) \
-			printk(format, ##args); \
-	} while (0)
-
 /* =========================================================================
    Local hardware I/O functions:
 
@@ -55,26 +44,22 @@ static u8 zr36050_read(struct zr36050 *ptr, u16 reg)
 	if (ptr->codec->master_data->readreg)
 		value = (ptr->codec->master_data->readreg(ptr->codec, reg)) & 0xFF;
 	else
-		dprintk(1,
-			KERN_ERR "%s: invalid I/O setup, nothing read!\n", ptr->name);
+		pr_err("%s: invalid I/O setup, nothing read!\n", ptr->name);
 
-	dprintk(4, "%s: reading from 0x%04x: %02x\n", ptr->name, reg, value);
+	pr_debug("%s: reading from 0x%04x: %02x\n", ptr->name, reg, value);
 
 	return value;
 }
 
 static void zr36050_write(struct zr36050 *ptr, u16 reg, u8 value)
 {
-	dprintk(4, "%s: writing 0x%02x to 0x%04x\n", ptr->name, value, reg);
+	pr_debug("%s: writing 0x%02x to 0x%04x\n", ptr->name, value, reg);
 
 	/* just in case something is wrong... */
 	if (ptr->codec->master_data->writereg)
 		ptr->codec->master_data->writereg(ptr->codec, reg, value);
 	else
-		dprintk(1,
-			KERN_ERR
-			"%s: invalid I/O setup, nothing written!\n",
-			ptr->name);
+		pr_err("%s: invalid I/O setup, nothing written!\n", ptr->name);
 }
 
 /* =========================================================================
@@ -122,9 +107,8 @@ static void zr36050_wait_end(struct zr36050 *ptr)
 	while (!(zr36050_read_status1(ptr) & 0x4)) {
 		udelay(1);
 		if (i++ > 200000) {	// 200ms, there is for sure something wrong!!!
-			dprintk(1,
-				"%s: timeout at wait_end (last status: 0x%02x)\n",
-				ptr->name, ptr->status1);
+			pr_err("%s: timeout at wait_end (last status: 0x%02x)\n",
+			       ptr->name, ptr->status1);
 			break;
 		}
 	}
@@ -142,29 +126,23 @@ static int zr36050_basic_test(struct zr36050 *ptr)
 	zr36050_write(ptr, ZR050_SOF_IDX + 1, 0x00);
 	if ((zr36050_read(ptr, ZR050_SOF_IDX) |
 	     zr36050_read(ptr, ZR050_SOF_IDX + 1)) != 0x0000) {
-		dprintk(1,
-			KERN_ERR
-			"%s: attach failed, can't connect to jpeg processor!\n",
-			ptr->name);
+		pr_err("%s: attach failed, can't connect to jpeg processor!\n",
+		       ptr->name);
 		return -ENXIO;
 	}
 	zr36050_write(ptr, ZR050_SOF_IDX, 0xff);
 	zr36050_write(ptr, ZR050_SOF_IDX + 1, 0xc0);
 	if (((zr36050_read(ptr, ZR050_SOF_IDX) << 8) |
 	     zr36050_read(ptr, ZR050_SOF_IDX + 1)) != 0xffc0) {
-		dprintk(1,
-			KERN_ERR
-			"%s: attach failed, can't connect to jpeg processor!\n",
-			ptr->name);
+		pr_err("%s: attach failed, can't connect to jpeg processor!\n",
+		       ptr->name);
 		return -ENXIO;
 	}
 
 	zr36050_wait_end(ptr);
 	if ((ptr->status1 & 0x4) == 0) {
-		dprintk(1,
-			KERN_ERR
-			"%s: attach failed, jpeg processor failed (end flag)!\n",
-			ptr->name);
+		pr_err("%s: attach failed, jpeg processor failed (end flag)!\n",
+		       ptr->name);
 		return -EBUSY;
 	}
 
@@ -181,8 +159,8 @@ static int zr36050_pushit(struct zr36050 *ptr, u16 startreg, u16 len, const char
 {
 	int i = 0;
 
-	dprintk(4, "%s: write data block to 0x%04x (len=%d)\n", ptr->name,
-		startreg, len);
+	pr_debug("%s: write data block to 0x%04x (len=%d)\n", ptr->name,
+		 startreg, len);
 	while (i < len)
 		zr36050_write(ptr, startreg++, data[i++]);
 
@@ -308,8 +286,8 @@ static int zr36050_set_sof(struct zr36050 *ptr)
 	char sof_data[34];	// max. size of register set
 	int i;
 
-	dprintk(3, "%s: write SOF (%dx%d, %d components)\n", ptr->name,
-		ptr->width, ptr->height, NO_OF_COMPONENTS);
+	pr_debug("%s: write SOF (%dx%d, %d components)\n", ptr->name,
+		 ptr->width, ptr->height, NO_OF_COMPONENTS);
 	sof_data[0] = 0xff;
 	sof_data[1] = 0xc0;
 	sof_data[2] = 0x00;
@@ -339,7 +317,7 @@ static int zr36050_set_sos(struct zr36050 *ptr)
 	char sos_data[16];	// max. size of register set
 	int i;
 
-	dprintk(3, "%s: write SOS\n", ptr->name);
+	pr_debug("%s: write SOS\n", ptr->name);
 	sos_data[0] = 0xff;
 	sos_data[1] = 0xda;
 	sos_data[2] = 0x00;
@@ -365,7 +343,7 @@ static int zr36050_set_dri(struct zr36050 *ptr)
 {
 	char dri_data[6];	// max. size of register set
 
-	dprintk(3, "%s: write DRI\n", ptr->name);
+	pr_debug("%s: write DRI\n", ptr->name);
 	dri_data[0] = 0xff;
 	dri_data[1] = 0xdd;
 	dri_data[2] = 0x00;
@@ -389,7 +367,7 @@ static void zr36050_init(struct zr36050 *ptr)
 	long bitcnt, tmp;
 
 	if (ptr->mode == CODEC_DO_COMPRESSION) {
-		dprintk(2, "%s: COMPRESSION SETUP\n", ptr->name);
+		pr_debug("%s: COMPRESSION SETUP\n", ptr->name);
 
 		/* 050 communicates with 057 in master mode */
 		zr36050_write(ptr, ZR050_HARDWARE, ZR050_HW_MSTR);
@@ -419,7 +397,7 @@ static void zr36050_init(struct zr36050 *ptr)
 
 		/* setup the fixed jpeg tables - maybe variable, though -
 		 * (see table init section above) */
-		dprintk(3, "%s: write DQT, DHT, APP\n", ptr->name);
+		pr_debug("%s: write DQT, DHT, APP\n", ptr->name);
 		sum += zr36050_pushit(ptr, ZR050_DQT_IDX,
 				      sizeof(zr36050_dqt), zr36050_dqt);
 		sum += zr36050_pushit(ptr, ZR050_DHT_IDX,
@@ -442,8 +420,8 @@ static void zr36050_init(struct zr36050 *ptr)
 
 		zr36050_write(ptr, ZR050_GO, 1);	// launch codec
 		zr36050_wait_end(ptr);
-		dprintk(2, "%s: Status after table preload: 0x%02x\n",
-			ptr->name, ptr->status1);
+		pr_debug("%s: Status after table preload: 0x%02x\n",
+			 ptr->name, ptr->status1);
 
 		if ((ptr->status1 & 0x4) == 0) {
 			pr_err("%s: init aborted!\n", ptr->name);
@@ -457,9 +435,8 @@ static void zr36050_init(struct zr36050 *ptr)
 		bitcnt = sum << 3;	/* need the size in bits */
 
 		tmp = bitcnt >> 16;
-		dprintk(3,
-			"%s: code: csize=%d, tot=%d, bit=%ld, highbits=%ld\n",
-			ptr->name, sum, ptr->real_code_vol, bitcnt, tmp);
+		pr_debug("%s: code: csize=%d, tot=%d, bit=%ld, highbits=%ld\n",
+			 ptr->name, sum, ptr->real_code_vol, bitcnt, tmp);
 		zr36050_write(ptr, ZR050_TCV_NET_HI, tmp >> 8);
 		zr36050_write(ptr, ZR050_TCV_NET_MH, tmp & 0xff);
 		tmp = bitcnt & 0xffff;
@@ -470,8 +447,8 @@ static void zr36050_init(struct zr36050 *ptr)
 		bitcnt -= ((bitcnt * 5) >> 6);	// bits without eob
 
 		tmp = bitcnt >> 16;
-		dprintk(3, "%s: code: nettobit=%ld, highnettobits=%ld\n",
-			ptr->name, bitcnt, tmp);
+		pr_debug("%s: code: nettobit=%ld, highnettobits=%ld\n",
+			 ptr->name, bitcnt, tmp);
 		zr36050_write(ptr, ZR050_TCV_DATA_HI, tmp >> 8);
 		zr36050_write(ptr, ZR050_TCV_DATA_MH, tmp & 0xff);
 		tmp = bitcnt & 0xffff;
@@ -489,7 +466,7 @@ static void zr36050_init(struct zr36050 *ptr)
 			      ((ptr->app.len > 0) ? ZR050_ME_APP : 0) |
 			      ((ptr->com.len > 0) ? ZR050_ME_COM : 0));
 	} else {
-		dprintk(2, "%s: EXPANSION SETUP\n", ptr->name);
+		pr_debug("%s: EXPANSION SETUP\n", ptr->name);
 
 		/* 050 communicates with 055 in master mode */
 		zr36050_write(ptr, ZR050_HARDWARE,
@@ -502,7 +479,7 @@ static void zr36050_init(struct zr36050 *ptr)
 		zr36050_write(ptr, ZR050_INT_REQ_0, 0);
 		zr36050_write(ptr, ZR050_INT_REQ_1, 3);	// low 2 bits always 1
 
-		dprintk(3, "%s: write DHT\n", ptr->name);
+		pr_debug("%s: write DHT\n", ptr->name);
 		zr36050_pushit(ptr, ZR050_DHT_IDX, sizeof(zr36050_dht),
 			       zr36050_dht);
 
@@ -511,8 +488,8 @@ static void zr36050_init(struct zr36050 *ptr)
 
 		zr36050_write(ptr, ZR050_GO, 1);	// launch codec
 		zr36050_wait_end(ptr);
-		dprintk(2, "%s: Status after table preload: 0x%02x\n",
-			ptr->name, ptr->status1);
+		pr_debug("%s: Status after table preload: 0x%02x\n",
+			 ptr->name, ptr->status1);
 
 		if ((ptr->status1 & 0x4) == 0) {
 			pr_err("%s: init aborted!\n", ptr->name);
@@ -540,7 +517,7 @@ static int zr36050_set_mode(struct videocodec *codec, int mode)
 {
 	struct zr36050 *ptr = (struct zr36050 *)codec->data;
 
-	dprintk(2, "%s: set_mode %d call\n", ptr->name, mode);
+	pr_debug("%s: set_mode %d call\n", ptr->name, mode);
 
 	if ((mode != CODEC_DO_EXPANSION) && (mode != CODEC_DO_COMPRESSION))
 		return -EINVAL;
@@ -558,8 +535,8 @@ static int zr36050_set_video(struct videocodec *codec, const struct tvnorm *norm
 	struct zr36050 *ptr = (struct zr36050 *)codec->data;
 	int size;
 
-	dprintk(2, "%s: set_video %d.%d, %d/%d-%dx%d (0x%x) q%d call\n",
-		ptr->name, norm->h_start, norm->v_start,
+	pr_debug("%s: set_video %d.%d, %d/%d-%dx%d (0x%x) q%d call\n",
+		 ptr->name, norm->h_start, norm->v_start,
 		cap->x, cap->y, cap->width, cap->height,
 		cap->decimation, cap->quality);
 	/* if () return -EINVAL;
@@ -596,8 +573,7 @@ static int zr36050_control(struct videocodec *codec, int type, int size, void *d
 	struct zr36050 *ptr = (struct zr36050 *)codec->data;
 	int *ival = (int *)data;
 
-	dprintk(2, "%s: control %d call with %d byte\n", ptr->name, type,
-		size);
+	pr_debug("%s: control %d call with %d byte\n", ptr->name, type, size);
 
 	switch (type) {
 	case CODEC_G_STATUS:	/* get last status */
@@ -717,8 +693,7 @@ static int zr36050_unset(struct videocodec *codec)
 	if (ptr) {
 		/* do wee need some codec deinit here, too ???? */
 
-		dprintk(1, "%s: finished codec #%d\n", ptr->name,
-			ptr->num);
+		pr_debug("%s: finished codec #%d\n", ptr->name, ptr->num);
 		kfree(ptr);
 		codec->data = NULL;
 
@@ -743,12 +718,10 @@ static int zr36050_setup(struct videocodec *codec)
 	struct zr36050 *ptr;
 	int res;
 
-	dprintk(2, "zr36050: initializing MJPEG subsystem #%d.\n",
-		zr36050_codecs);
+	pr_debug("zr36050: initializing MJPEG subsystem #%d.\n", zr36050_codecs);
 
 	if (zr36050_codecs == MAX_CODECS) {
-		dprintk(1,
-			KERN_ERR "zr36050: Can't attach more codecs!\n");
+		pr_err("zr36050: Can't attach more codecs!\n");
 		return -ENOSPC;
 	}
 	//mem structure init
@@ -789,8 +762,7 @@ static int zr36050_setup(struct videocodec *codec)
 
 	zr36050_init(ptr);
 
-	dprintk(1, KERN_INFO "%s: codec attached and running\n",
-		ptr->name);
+	pr_info("%s: codec attached and running\n", ptr->name);
 
 	return 0;
 }
@@ -823,9 +795,8 @@ int zr36050_init_module(void)
 void zr36050_cleanup_module(void)
 {
 	if (zr36050_codecs) {
-		dprintk(1,
-			"zr36050: something's wrong - %d codecs left somehow.\n",
-			zr36050_codecs);
+		pr_err("zr36050: something's wrong - %d codecs left somehow.\n",
+		       zr36050_codecs);
 	}
 	videocodec_unregister(&zr36050_codec);
 }
diff --git a/drivers/staging/media/zoran/zr36060.c b/drivers/staging/media/zoran/zr36060.c
index d0c369e31c81..950b0c34cde9 100644
--- a/drivers/staging/media/zoran/zr36060.c
+++ b/drivers/staging/media/zoran/zr36060.c
@@ -32,16 +32,6 @@ static bool low_bitrate;
 module_param(low_bitrate, bool, 0);
 MODULE_PARM_DESC(low_bitrate, "Buz compatibility option, halves bitrate");
 
-static int zr36060_debug;
-module_param(zr36060_debug, int, 0);
-MODULE_PARM_DESC(zr36060_debug, "Debug level (0-4)");
-
-#define dprintk(num, format, args...) \
-	do { \
-		if (zr36060_debug >= num) \
-			printk(format, ##args); \
-	} while (0)
-
 /* =========================================================================
  * Local hardware I/O functions:
  * read/write via codec layer (registers are located in the master device)
@@ -63,7 +53,7 @@ static u8 zr36060_read(struct zr36060 *ptr, u16 reg)
 
 static void zr36060_write(struct zr36060 *ptr, u16 reg, u8 value)
 {
-	dprintk(4, "0x%02x @0x%04x\n", value, reg);
+	pr_debug("0x%02x @0x%04x\n", value, reg);
 
 	// just in case something is wrong...
 	if (ptr->codec->master_data->writereg)
@@ -106,9 +96,8 @@ static void zr36060_wait_end(struct zr36060 *ptr)
 	while (zr36060_read_status(ptr) & ZR060_CFSR_BUSY) {
 		udelay(1);
 		if (i++ > 200000) {	// 200ms, there is for sure something wrong!!!
-			dprintk(1,
-				"%s: timeout at wait_end (last status: 0x%02x)\n",
-				ptr->name, ptr->status);
+			pr_err("%s: timeout at wait_end (last status: 0x%02x)\n",
+			       ptr->name, ptr->status);
 			break;
 		}
 	}
@@ -119,13 +108,15 @@ static int zr36060_basic_test(struct zr36060 *ptr)
 {
 	if ((zr36060_read(ptr, ZR060_IDR_DEV) != 0x33) &&
 	    (zr36060_read(ptr, ZR060_IDR_REV) != 0x01)) {
-		pr_err("%s: attach failed, can't connect to jpeg processor!\n", ptr->name);
+		pr_err("%s: attach failed, can't connect to jpeg processor!\n",
+		       ptr->name);
 		return -ENXIO;
 	}
 
 	zr36060_wait_end(ptr);
 	if (ptr->status & ZR060_CFSR_BUSY) {
-		pr_err("%s: attach failed, jpeg processor failed (end flag)!\n", ptr->name);
+		pr_err("%s: attach failed, jpeg processor failed (end flag)!\n",
+		       ptr->name);
 		return -EBUSY;
 	}
 
@@ -137,8 +128,8 @@ static int zr36060_pushit(struct zr36060 *ptr, u16 startreg, u16 len, const char
 {
 	int i = 0;
 
-	dprintk(4, "%s: write data block to 0x%04x (len=%d)\n", ptr->name,
-		startreg, len);
+	pr_debug("%s: write data block to 0x%04x (len=%d)\n", ptr->name,
+		 startreg, len);
 	while (i < len)
 		zr36060_write(ptr, startreg++, data[i++]);
 
@@ -252,8 +243,8 @@ static int zr36060_set_sof(struct zr36060 *ptr)
 	char sof_data[34];	// max. size of register set
 	int i;
 
-	dprintk(3, "%s: write SOF (%dx%d, %d components)\n", ptr->name,
-		ptr->width, ptr->height, NO_OF_COMPONENTS);
+	pr_debug("%s: write SOF (%dx%d, %d components)\n", ptr->name,
+		 ptr->width, ptr->height, NO_OF_COMPONENTS);
 	sof_data[0] = 0xff;
 	sof_data[1] = 0xc0;
 	sof_data[2] = 0x00;
@@ -280,7 +271,7 @@ static int zr36060_set_sos(struct zr36060 *ptr)
 	char sos_data[16];	// max. size of register set
 	int i;
 
-	dprintk(3, "%s: write SOS\n", ptr->name);
+	pr_debug("%s: write SOS\n", ptr->name);
 	sos_data[0] = 0xff;
 	sos_data[1] = 0xda;
 	sos_data[2] = 0x00;
@@ -304,7 +295,7 @@ static int zr36060_set_dri(struct zr36060 *ptr)
 {
 	char dri_data[6];	// max. size of register set
 
-	dprintk(3, "%s: write DRI\n", ptr->name);
+	pr_debug("%s: write DRI\n", ptr->name);
 	dri_data[0] = 0xff;
 	dri_data[1] = 0xdd;
 	dri_data[2] = 0x00;
@@ -323,7 +314,7 @@ static void zr36060_init(struct zr36060 *ptr)
 	long bitcnt, tmp;
 
 	if (ptr->mode == CODEC_DO_COMPRESSION) {
-		dprintk(2, "%s: COMPRESSION SETUP\n", ptr->name);
+		pr_debug("%s: COMPRESSION SETUP\n", ptr->name);
 
 		zr36060_write(ptr, ZR060_LOAD, ZR060_LOAD_SYNC_RST);
 
@@ -376,9 +367,8 @@ static void zr36060_init(struct zr36060 *ptr)
 		bitcnt = sum << 3;	/* need the size in bits */
 
 		tmp = bitcnt >> 16;
-		dprintk(3,
-			"%s: code: csize=%d, tot=%d, bit=%ld, highbits=%ld\n",
-			ptr->name, sum, ptr->real_code_vol, bitcnt, tmp);
+		pr_debug("%s: code: csize=%d, tot=%d, bit=%ld, highbits=%ld\n",
+			 ptr->name, sum, ptr->real_code_vol, bitcnt, tmp);
 		zr36060_write(ptr, ZR060_TCV_NET_HI, tmp >> 8);
 		zr36060_write(ptr, ZR060_TCV_NET_MH, tmp & 0xff);
 		tmp = bitcnt & 0xffff;
@@ -389,8 +379,8 @@ static void zr36060_init(struct zr36060 *ptr)
 		bitcnt -= ((bitcnt * 5) >> 6);	// bits without eob
 
 		tmp = bitcnt >> 16;
-		dprintk(3, "%s: code: nettobit=%ld, highnettobits=%ld\n",
-			ptr->name, bitcnt, tmp);
+		pr_debug("%s: code: nettobit=%ld, highnettobits=%ld\n",
+			 ptr->name, bitcnt, tmp);
 		zr36060_write(ptr, ZR060_TCV_DATA_HI, tmp >> 8);
 		zr36060_write(ptr, ZR060_TCV_DATA_MH, tmp & 0xff);
 		tmp = bitcnt & 0xffff;
@@ -408,7 +398,7 @@ static void zr36060_init(struct zr36060 *ptr)
 		zr36060_write(ptr, ZR060_VCR, ZR060_VCR_RANGE);
 
 	} else {
-		dprintk(2, "%s: EXPANSION SETUP\n", ptr->name);
+		pr_debug("%s: EXPANSION SETUP\n", ptr->name);
 
 		zr36060_write(ptr, ZR060_LOAD, ZR060_LOAD_SYNC_RST);
 
@@ -441,7 +431,7 @@ static void zr36060_init(struct zr36060 *ptr)
 	/* Load the tables */
 	zr36060_write(ptr, ZR060_LOAD, ZR060_LOAD_SYNC_RST | ZR060_LOAD_LOAD);
 	zr36060_wait_end(ptr);
-	dprintk(2, "%s: Status after table preload: 0x%02x\n", ptr->name, ptr->status);
+	pr_debug("%s: Status after table preload: 0x%02x\n", ptr->name, ptr->status);
 
 	if (ptr->status & ZR060_CFSR_BUSY) {
 		pr_err("%s: init aborted!\n", ptr->name);
@@ -462,7 +452,7 @@ static int zr36060_set_mode(struct videocodec *codec, int mode)
 {
 	struct zr36060 *ptr = (struct zr36060 *)codec->data;
 
-	dprintk(2, "%s: set_mode %d call\n", ptr->name, mode);
+	pr_debug("%s: set_mode %d call\n", ptr->name, mode);
 
 	if (mode != CODEC_DO_EXPANSION && mode != CODEC_DO_COMPRESSION)
 		return -EINVAL;
@@ -481,8 +471,8 @@ static int zr36060_set_video(struct videocodec *codec, const struct tvnorm *norm
 	u32 reg;
 	int size;
 
-	dprintk(2, "%s: set_video %d/%d-%dx%d (%%%d) call\n", ptr->name,
-		cap->x, cap->y, cap->width, cap->height, cap->decimation);
+	pr_debug("%s: set_video %d/%d-%dx%d (%%%d) call\n", ptr->name,
+		 cap->x, cap->y, cap->width, cap->height, cap->decimation);
 
 	/* if () return -EINVAL;
 	 * trust the master driver that it knows what it does - so
@@ -639,8 +629,7 @@ static int zr36060_control(struct videocodec *codec, int type, int size, void *d
 	struct zr36060 *ptr = (struct zr36060 *)codec->data;
 	int *ival = (int *)data;
 
-	dprintk(2, "%s: control %d call with %d byte\n", ptr->name, type,
-		size);
+	pr_debug("%s: control %d call with %d byte\n", ptr->name, type, size);
 
 	switch (type) {
 	case CODEC_G_STATUS:	/* get last status */
@@ -757,7 +746,7 @@ static int zr36060_unset(struct videocodec *codec)
 	if (ptr) {
 		/* do wee need some codec deinit here, too ???? */
 
-		dprintk(1, "%s: finished codec #%d\n", ptr->name, ptr->num);
+		pr_debug("%s: finished codec #%d\n", ptr->name, ptr->num);
 		kfree(ptr);
 		codec->data = NULL;
 
@@ -780,7 +769,7 @@ static int zr36060_setup(struct videocodec *codec)
 	struct zr36060 *ptr;
 	int res;
 
-	dprintk(2, "zr36060: initializing MJPEG subsystem #%d.\n", zr36060_codecs);
+	pr_debug("zr36060: initializing MJPEG subsystem #%d.\n", zr36060_codecs);
 
 	if (zr36060_codecs == MAX_CODECS) {
 		pr_err("zr36060: Can't attach more codecs!\n");
@@ -823,7 +812,7 @@ static int zr36060_setup(struct videocodec *codec)
 
 	zr36060_init(ptr);
 
-	dprintk(1, KERN_INFO "%s: codec attached and running\n", ptr->name);
+	pr_info("%s: codec attached and running\n", ptr->name);
 
 	return 0;
 }
@@ -852,9 +841,8 @@ int zr36060_init_module(void)
 void zr36060_cleanup_module(void)
 {
 	if (zr36060_codecs) {
-		dprintk(1,
-			"zr36060: something's wrong - %d codecs left somehow.\n",
-			zr36060_codecs);
+		pr_err("zr36060: something's wrong - %d codecs left somehow.\n",
+		       zr36060_codecs);
 	}
 
 	/* however, we can't just stay alive */
-- 
2.32.0

