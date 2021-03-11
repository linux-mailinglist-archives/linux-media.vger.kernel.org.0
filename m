Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27564336A44
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 03:54:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbhCKCxy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 21:53:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbhCKCxj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 21:53:39 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48F22C061574
        for <linux-media@vger.kernel.org>; Wed, 10 Mar 2021 18:53:39 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id v15so137652wrx.4
        for <linux-media@vger.kernel.org>; Wed, 10 Mar 2021 18:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FmMWNO8Pnqy8XLlkZScz1uwpd0++gQRTetNbHxwaHSc=;
        b=msMMddE0sWKnl7v/lSpuSgAJkQpl31RfsDbACMJuRgcmHWvquUTiJES1WLMlnCb4sK
         mfWDDvAwV4By83xJxFuloqNx5V4/WKF75+xRhH0nEKl9P5aAGxVZ6K+bzJ66RiH3fPgs
         MNYrgryjdxytvF54qCp8ox9jjRotmweWFEBj28FUyH4vnFaZaOxRnd2qwkf+om35XTW+
         cVuwEzKpH5Q9eh9Y5k/DJQl2SpVvBZqeLaQ7zmyHZku0BDbRfHKq/N/aNxVlxW+c5fsC
         rSBPyyH6t88o5NUIvmKvIjzkP0gI+7YpfRYHKhTNqjtLWRTqBmPbr3wuHORSyUhloq8F
         5NPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FmMWNO8Pnqy8XLlkZScz1uwpd0++gQRTetNbHxwaHSc=;
        b=PvaFI646wC5Go++JN59oa8YwGdHQQxlt4OJvWqykp/cuyCBTYNpWpFVUaqQw98kgeT
         Xil3jkQrEkdWyZYAbddmDWSLUiDkviwLbxrTYAerFivFn+t/+nMM8lzrCDKActiVV8D6
         65hipVCzghqp9rLfhpVt7u6l1I/4QnqwKRP4WC3Gkv6BVWg4cBaAl60IS9E2/q4m0Uxr
         J1ZKSeiPiy083EhpioMe0O6upBsTF3S99/pberPR+XBnerGb+HOb9P4Wk3EZY31ibh1U
         HQ2IhJeG1GNRhzxFaUq5ONSkwgl+XkYI3FQLAtBbQc+edSjmFX/eLNZvirW3vkUBKivK
         AVcA==
X-Gm-Message-State: AOAM531X7FqSZWkqUfO/gEwqlSw/Js1I720ZDvrptQAYQASTA7r6luaQ
        zOYxVia0vQi+vlnUW7xyN6Amjy5sQchnmg==
X-Google-Smtp-Source: ABdhPJxd5F4cu3wd9h+8XmyJt92pEfPlJOl1cewuasExRP4Nmu9rN32DhRSRJqvCHqFISc94kK7SYg==
X-Received: by 2002:a5d:5141:: with SMTP id u1mr6382057wrt.31.1615431217855;
        Wed, 10 Mar 2021 18:53:37 -0800 (PST)
Received: from localhost.localdomain ([2a02:14c:208a:4200:30f1:f540:440e:1009])
        by smtp.googlemail.com with ESMTPSA id h6sm1435671wmi.6.2021.03.10.18.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 18:53:37 -0800 (PST)
From:   Daniel Niv <danielniv3@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, mortonm@chromium.org,
        Daniel Niv <danielniv3@gmail.com>
Subject: [PATCH] media/saa7164: fix saa7164_encoder_register() memory leak bugs
Date:   Thu, 11 Mar 2021 04:53:00 +0200
Message-Id: <20210311025300.129525-1-danielniv3@gmail.com>
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

