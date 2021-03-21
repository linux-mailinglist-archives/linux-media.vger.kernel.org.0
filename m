Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A12B343417
	for <lists+linux-media@lfdr.de>; Sun, 21 Mar 2021 19:38:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbhCUShs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Mar 2021 14:37:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbhCUShi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Mar 2021 14:37:38 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E99F3C061574
        for <linux-media@vger.kernel.org>; Sun, 21 Mar 2021 11:37:37 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id l4so17702322ejc.10
        for <linux-media@vger.kernel.org>; Sun, 21 Mar 2021 11:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FmMWNO8Pnqy8XLlkZScz1uwpd0++gQRTetNbHxwaHSc=;
        b=RSzwYII4vBzkkdoUzPZL7v9Q7hsZLnUSob6fHAR5I8/ivP4Djaw1O8P4XZfeC0RCb8
         B0pm3QO/48BejUNpCidOMpFz6g8Y1la9Ybg/fLwNoplRt8RWcujEb5QUt5Y5n5Xm0cUq
         cDqkG/hGaj8W/AMitlvU0P8KQV6OPXeC4ik3fUpgDouOoZAeNWzRmMom9TuB0nxMqxC9
         be7LY0cskSG0vPtE3PVy47EWPFb2Vin+NinjHOl/s4CjxXp6YSvIFSBkoF9EwqgCfO/J
         cwafmT/4ArnjBB6XjQclTpQUuimmfuYpBWopWO/p0VfrgmIvr0MIk7IdWMOx4jOUzI/7
         vnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FmMWNO8Pnqy8XLlkZScz1uwpd0++gQRTetNbHxwaHSc=;
        b=iTL4DI+4pdeQrD/nmZg2eST61drBZPI6VPyaX0RSNKaMICQxyLhyAJD6Qg025//uzZ
         sDDacu+sjiYfHJVSbZogZVc6aqb2w0hQlyz74MU91x1y4iFlViU9ujljNIi4A3Gh85eI
         GQawsDRwy8py7nk/ODwkwnFU/j/ZxKD3z6FzNzki3DdbtB9aKK8Z6S0UI1UUfin1dgch
         tAJD31s7maWdUOAv/iK4Bq4qNBoWaSdjkc1f0qX37JRcSBiI6Ic6Lqei8B8WKQYLDuV8
         F47qKHUMD8KVekAoM0G2Gu8yNAUwl3gkR2C8TmOwq2XQqqIO9tPk9d4d36TQTb9YC/IJ
         vt9Q==
X-Gm-Message-State: AOAM533vCDHAF7f9dQd97OUo8Ljui3ARmgw0Ut/0/GmoBYCj4ekA/e4s
        OHYlA6tLDVJDoLjOv0lp9cmb6zpnPoiSAteh
X-Google-Smtp-Source: ABdhPJyqottEj6YYIPo9NlP8PrlPSIwA8vRdROCjCNaHHTEL7Rz91Tb1hh7XgVq48v+ABlWxTZ8FLw==
X-Received: by 2002:a17:906:c414:: with SMTP id u20mr15447777ejz.215.1616351856281;
        Sun, 21 Mar 2021 11:37:36 -0700 (PDT)
Received: from localhost.localdomain ([2001:4df4:3cc:1600:dd9:e6b9:8bfc:3c02])
        by smtp.googlemail.com with ESMTPSA id yk8sm7604754ejb.123.2021.03.21.11.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 11:37:35 -0700 (PDT)
From:   Daniel Niv <danielniv3@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, mortonm@chromium.org,
        Daniel Niv <danielniv3@gmail.com>
Subject: [PATCH] media/saa7164: fix saa7164_encoder_register() memory leak bugs
Date:   Sun, 21 Mar 2021 20:37:01 +0200
Message-Id: <20210321183701.61507-1-danielniv3@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a fix for the memory leak bugs that can occur when the
saa7164_encoder_register() function fails.
The function allocates memory without explicitly freeing
it when errors occur.
Add a better error handling that deallocate the unused buffers before the
function exits during a fail.

Signed-off-by: Daniel Niv <danielniv3@gmail.com>
---
 drivers/media/pci/saa7164/saa7164-encoder.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/media/pci/saa7164/saa7164-encoder.c b/drivers/media/pci/saa7164/saa7164-encoder.c
index 11e1eb6a6809..1d1d32e043f1 100644
--- a/drivers/media/pci/saa7164/saa7164-encoder.c
+++ b/drivers/media/pci/saa7164/saa7164-encoder.c
@@ -1008,7 +1008,7 @@ int saa7164_encoder_register(struct saa7164_port *port)
 		printk(KERN_ERR "%s() failed (errno = %d), NO PCI configuration\n",
 			__func__, result);
 		result = -ENOMEM;
-		goto failed;
+		goto fail_pci;
 	}
 
 	/* Establish encoder defaults here */
@@ -1062,7 +1062,7 @@ int saa7164_encoder_register(struct saa7164_port *port)
 			  100000, ENCODER_DEF_BITRATE);
 	if (hdl->error) {
 		result = hdl->error;
-		goto failed;
+		goto fail_hdl;
 	}
 
 	port->std = V4L2_STD_NTSC_M;
@@ -1080,7 +1080,7 @@ int saa7164_encoder_register(struct saa7164_port *port)
 		printk(KERN_INFO "%s: can't allocate mpeg device\n",
 			dev->name);
 		result = -ENOMEM;
-		goto failed;
+		goto fail_hdl;
 	}
 
 	port->v4l_device->ctrl_handler = hdl;
@@ -1091,10 +1091,7 @@ int saa7164_encoder_register(struct saa7164_port *port)
 	if (result < 0) {
 		printk(KERN_INFO "%s: can't register mpeg device\n",
 			dev->name);
-		/* TODO: We're going to leak here if we don't dealloc
-		 The buffers above. The unreg function can't deal wit it.
-		*/
-		goto failed;
+		goto fail_reg;
 	}
 
 	printk(KERN_INFO "%s: registered device video%d [mpeg]\n",
@@ -1116,9 +1113,14 @@ int saa7164_encoder_register(struct saa7164_port *port)
 
 	saa7164_api_set_encoder(port);
 	saa7164_api_get_encoder(port);
+	return 0;
 
-	result = 0;
-failed:
+fail_reg:
+	video_device_release(port->v4l_device);
+	port->v4l_device = NULL;
+fail_hdl:
+	v4l2_ctrl_handler_free(hdl);
+fail_pci:
 	return result;
 }
 
-- 
2.25.1

