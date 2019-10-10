Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15B07D26AF
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2019 11:52:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387871AbfJJJvh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Oct 2019 05:51:37 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51220 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387791AbfJJJvh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Oct 2019 05:51:37 -0400
Received: by mail-wm1-f65.google.com with SMTP id 7so6218517wme.1;
        Thu, 10 Oct 2019 02:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jC8sod3IK3MEfPEVtwNiX6u+A/D3kZVyjuptbX8nh2k=;
        b=nmdsPV5Mjr9w0p/bozHVlWvJgjufvIdwfAXEVF6YGmdOa8XI1UEfG3jG6G7l+2GUJ7
         /XdgxIdG6jFbZZvHulVeJOumDkrzEfV8tmPOe1FN9YP8jcvflZpRgfJGRVz24fImYUuq
         LK85SgKS5I0ruMbfXizbcE0Y/PhPnpOOpwUhhyHgYLFppVmwjl0eW28ZBIK0y/KZmJNP
         wYeWi2e38bnFnTDZU9PkcwMtXPlQi3+caxjBz5zzB6AsP3LTYGcaTYcZif4OojcTpmGO
         /nZO2DGIVZZ95vYzfU2hEuJ61mQy2dROZcp0+7Soq6QAOx611R8Lh5TqKliZXG7SkmU0
         tXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jC8sod3IK3MEfPEVtwNiX6u+A/D3kZVyjuptbX8nh2k=;
        b=oQr0UDvFGYV2fkvzlkLNMgVpEOIaSjr8ushg6TN9zHy4ybHXLIi3RK50hvCQGOjRdZ
         n6IEi+6pnfU2tSvq7AYgy+Xg77F4kYW3MeVmAQ5/2sSdYn+VaQWqSHUHWxLwPPBOXLhc
         vdicwblp15b1dMGk6HA3Fl9MC6cFG5O5EcU1NrvO1k1yXgzcVxjOwn7Qt8nc3LHpkAaJ
         CBXq6p0pxZMwfzL6pqoO1kQ+IC/oru8SeeSWu7/S7p8TKlSg4IuxPmBs1x6bFXHAYwS/
         gRkVLbIO8v5eQNKrUwyHu9tMdKh3yrVbbZ2MsmJp2OckAx3xTOoOJDHSCqnJqz1W6wNV
         XwtA==
X-Gm-Message-State: APjAAAVmlO0CqgjeHkclUnCfjoNj5AJT/SG4YvKlaoijXWIYu2DyBCA0
        Aj+P7fCmd3o+sSedk+MIpEXJBJeo
X-Google-Smtp-Source: APXvYqxKLn7x0hopMV3fSEWhlTjEba4RBIu6XjvuvKFjvMKkDVqYJjzkcjmHBvgmafFOArnmsIGhRw==
X-Received: by 2002:a05:600c:2185:: with SMTP id e5mr7096154wme.78.1570701094206;
        Thu, 10 Oct 2019 02:51:34 -0700 (PDT)
Received: from localhost.localdomain ([46.114.37.24])
        by smtp.googlemail.com with ESMTPSA id o4sm11678251wre.91.2019.10.10.02.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 02:51:33 -0700 (PDT)
From:   Gon Solo <gonsolo@gmail.com>
To:     mchehab+samsung@kernel.org
Cc:     linux-media@vger.kernel.org, mchehab@infradead.org, jp@jpvw.nl,
        crope@iki.fi, sean@mess.org, linux-kernel@vger.kernel.org,
        Gon Solo <gonsolo@gmail.com>
Subject: [PATCH 2/4] si2157: Add option for not downloading firmware.
Date:   Thu, 10 Oct 2019 11:51:01 +0200
Message-Id: <20191010095103.3803-3-gonsolo@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191010091848.GA2898@Limone>
References: <20191010091848.GA2898@Limone>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While at it, convert to kernel-doc format and use bits instead of bools.

Signed-off-by: Gon Solo <gonsolo@gmail.com>
---
 drivers/media/tuners/si2157.c      |  6 ++++++
 drivers/media/tuners/si2157.h      | 33 +++++++++++++++++-------------
 drivers/media/tuners/si2157_priv.h |  5 +++--
 3 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
index e87040d6eca7..898e0f9f8b70 100644
--- a/drivers/media/tuners/si2157.c
+++ b/drivers/media/tuners/si2157.c
@@ -118,6 +118,11 @@ static int si2157_init(struct dvb_frontend *fe)
 			goto err;
 	}
 
+	if (dev->dont_load_firmware) {
+		dev_info(&client->dev, "device is buggy, skipping firmware download\n");
+		goto skip_fw_download;
+	}
+
 	/* query chip revision */
 	memcpy(cmd.args, "\x02", 1);
 	cmd.wlen = 1;
@@ -440,6 +445,7 @@ static int si2157_probe(struct i2c_client *client,
 	i2c_set_clientdata(client, dev);
 	dev->fe = cfg->fe;
 	dev->inversion = cfg->inversion;
+	dev->dont_load_firmware = cfg->dont_load_firmware;
 	dev->if_port = cfg->if_port;
 	dev->chiptype = (u8)id->driver_data;
 	dev->if_frequency = 5000000; /* default value of property 0x0706 */
diff --git a/drivers/media/tuners/si2157.h b/drivers/media/tuners/si2157.h
index c22ca784f43f..ffdece3c2eaa 100644
--- a/drivers/media/tuners/si2157.h
+++ b/drivers/media/tuners/si2157.h
@@ -11,29 +11,34 @@
 #include <media/media-device.h>
 #include <media/dvb_frontend.h>
 
-/*
- * I2C address
- * 0x60
+/**
+ * struct si2157_config - configuration parameters for si2157
+ *
+ * @fe:
+ *	frontend returned by driver
+ * @mdev:
+ *	media device returned by driver
+ * @inversion:
+ *	spectral inversion
+ * @dont_load_firmware:
+ *	Instead of uploading a new firmware, use the existing one
+ * @if_port:
+ *	Port selection
+ *	Select the RF interface to use (pins 9+11 or 12+13)
+ *
+ * Note:
+ *	The I2C address of this demod is 0x60.
  */
 struct si2157_config {
-	/*
-	 * frontend
-	 */
 	struct dvb_frontend *fe;
 
 #if defined(CONFIG_MEDIA_CONTROLLER)
 	struct media_device *mdev;
 #endif
 
-	/*
-	 * Spectral Inversion
-	 */
-	bool inversion;
+	unsigned int inversion:1;
+	unsigned int dont_load_firmware:1;
 
-	/*
-	 * Port selection
-	 * Select the RF interface to use (pins 9+11 or 12+13)
-	 */
 	u8 if_port;
 };
 
diff --git a/drivers/media/tuners/si2157_priv.h b/drivers/media/tuners/si2157_priv.h
index 2bda903358da..778f81b39996 100644
--- a/drivers/media/tuners/si2157_priv.h
+++ b/drivers/media/tuners/si2157_priv.h
@@ -23,8 +23,9 @@ enum si2157_pads {
 struct si2157_dev {
 	struct mutex i2c_mutex;
 	struct dvb_frontend *fe;
-	bool active;
-	bool inversion;
+	unsigned int active:1;
+	unsigned int inversion:1;
+	unsigned int dont_load_firmware:1;
 	u8 chiptype;
 	u8 if_port;
 	u32 if_frequency;
-- 
2.20.1

