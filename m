Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A97821AE3
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2019 17:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729257AbfEQPoO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 May 2019 11:44:14 -0400
Received: from mail-qk1-f202.google.com ([209.85.222.202]:48076 "EHLO
        mail-qk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729198AbfEQPoN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 May 2019 11:44:13 -0400
Received: by mail-qk1-f202.google.com with SMTP id l185so1116608qkd.14
        for <linux-media@vger.kernel.org>; Fri, 17 May 2019 08:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=0W2BzNydBRd7QhaGcoJcvGTU7rmnrCYSV56xvl6bzSI=;
        b=VzuwqHnyhwwSh7/JMul3SVZ8caXL/TH9El2SzuXFThh6jO5XmNORH4+oHP0HC8yVS/
         ZaRl4P6ZG3HLzt7W+0ba0e/45IBR2l4PBqSaJ2rBhqJ2Ed+HJoB7DMkUbyfH+QiMi3HO
         pEnqjCxh+/zxH8TxBZ2FeGWtVwvMEmjp2iUrH7PqWSjoW5we2M/yRuWCcr0LcZzGrNf+
         jbAI8To41LLrMP2YH1ySyea4QCKmH7Yus+12CnfLno8jHGZZlBjH8xHh8hn8+FS/b+wj
         JCPMd6osp3t/wPV36eOX7v/iXqxRvfMIpiDWgZWjSnaqegfF+gdghxRs0QcAR5GdCRYa
         BObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=0W2BzNydBRd7QhaGcoJcvGTU7rmnrCYSV56xvl6bzSI=;
        b=P37sSi/8TUqXqHABQQcuNPnbuiWsCp79QoogYYckKr1t8gMOXlpCaQGlA+ObmsrMfa
         I2o/MrLt+GZwC+mDERgCTd/LF0JPZEgo9BU6U3Qf8JSKJTIWPTgaEClIV9vWIbhKsrW8
         FR/pnr3Ns1dJaCyhVXO3+kH6DxFMxGeSE7GXEurodgBAT8QvM9LoI0u1+IAAtFLHNtr+
         lmmK7zHnADWdpWMwL/jpdJJ0EJD6vSNQY1PjESd1aviiRr+irPIjkq8c/WeC1zypT8ym
         Scg/eycvqY+9XQT2cA93ecOFyG985hiW+C0NF0tagg0J6TSuy3DfEsR9j1hcLNbx0QIR
         Y9LQ==
X-Gm-Message-State: APjAAAXveOuMH/uIEfKYBe8PkHc7i7qRY4VfS4XDjoD/VeyKTb05EBq+
        S8RFBkBsnsOeGivCSBDCDOatppOBnjHSIgLz/GjE+rXt5bPe/6+Th7yzjuHu9yq2y90oeVzjwf2
        Y97+WMYDvJE4E1Z0hldq5thSEeVtd/4z7+FAdbUTkYKr8vrX2xrW57NMRVQZMjN/rOxPA
X-Google-Smtp-Source: APXvYqxfsLsSi1T3SCHbc/3F5oUnVOLDZWEbyI5pwVphBnxn8AsNINa/u63D6x1yjynuxcQQGpC1OzdqLYg=
X-Received: by 2002:ac8:ff6:: with SMTP id f51mr47715018qtk.116.1558107852566;
 Fri, 17 May 2019 08:44:12 -0700 (PDT)
Date:   Fri, 17 May 2019 17:42:56 +0200
In-Reply-To: <20190517154256.255696-1-darekm@google.com>
Message-Id: <20190517154256.255696-3-darekm@google.com>
Mime-Version: 1.0
References: <20190517154256.255696-1-darekm@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v6 3/3] drm/i2c: tda9950: pass HDMI connector info to CEC adapter
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     linux-media@vger.kernel.org, hans.verkuil@cisco.com,
        hverkuil@xs4all.nl
Cc:     linux-kernel@vger.kernel.org,
        Dariusz Marcinkiewicz <darekm@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With that change tda998x provides a connector info to the CEC
adapter. In order to be able to that it delays creation of
respective CEC device until the DRM connector is initialized.

Requires testing.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
---
 drivers/gpu/drm/i2c/tda9950.c         |  7 ++++-
 drivers/gpu/drm/i2c/tda998x_drv.c     | 41 +++++++++++++--------------
 include/linux/platform_data/tda9950.h |  2 ++
 3 files changed, 28 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i2c/tda9950.c b/drivers/gpu/drm/i2c/tda9950.c
index b944dd9df85e1..2778a0015cc31 100644
--- a/drivers/gpu/drm/i2c/tda9950.c
+++ b/drivers/gpu/drm/i2c/tda9950.c
@@ -382,6 +382,7 @@ static int tda9950_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
 	struct tda9950_glue *glue = client->dev.platform_data;
+	struct cec_connector_info conn_info;
 	struct device *dev = &client->dev;
 	struct tda9950_priv *priv;
 	unsigned long irqflags;
@@ -422,10 +423,14 @@ static int tda9950_probe(struct i2c_client *client,
 	if (glue && glue->parent)
 		priv->hdmi = glue->parent;
 
+	memset(&conn_info, 0, sizeof(conn_info));
+	if (glue)
+		cec_fill_connector_info(&conn_info, glue->connector);
+
 	priv->adap = cec_allocate_adapter(&tda9950_cec_ops, priv, "tda9950",
 					  CEC_CAP_DEFAULTS,
 					  CEC_MAX_LOG_ADDRS,
-					  NULL);
+					  &conn_info);
 	if (IS_ERR(priv->adap))
 		return PTR_ERR(priv->adap);
 
diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index 7f34601bb5155..ef2aa3134b387 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -1253,6 +1253,7 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
 				  struct drm_device *drm)
 {
 	struct drm_connector *connector = &priv->connector;
+	struct i2c_board_info cec_info;
 	int ret;
 
 	connector->interlace_allowed = 1;
@@ -1269,6 +1270,24 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
 	if (ret)
 		return ret;
 
+	/*
+	 * Some TDA998x are actually two I2C devices merged onto one piece
+	 * of silicon: TDA9989 and TDA19989 combine the HDMI transmitter
+	 * with a slightly modified TDA9950 CEC device.  The CEC device
+	 * is at the TDA9950 address, with the address pins strapped across
+	 * to the TDA998x address pins.  Hence, it always has the same
+	 * offset.
+	 */
+	memset(&cec_info, 0, sizeof(cec_info));
+	strlcpy(cec_info.type, "tda9950", sizeof(cec_info.type));
+	cec_info.addr = priv->cec_addr;
+	cec_info.platform_data = &priv->cec_glue;
+	cec_info.irq = priv->hdmi->irq;
+
+	priv->cec = i2c_new_device(priv->hdmi->adapter, &cec_info);
+	if (!priv->cec)
+		return -ENODEV;
+
 	drm_connector_attach_encoder(&priv->connector,
 				     priv->bridge.encoder);
 
@@ -1658,7 +1677,6 @@ static int tda998x_create(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct device_node *np = client->dev.of_node;
-	struct i2c_board_info cec_info;
 	struct tda998x_priv *priv;
 	u32 video;
 	int rev_lo, rev_hi, ret;
@@ -1783,32 +1801,13 @@ static int tda998x_create(struct device *dev)
 	}
 
 	priv->cec_glue.parent = dev;
+	priv->cec_glue.connector = &priv->connector;
 	priv->cec_glue.data = priv;
 	priv->cec_glue.init = tda998x_cec_hook_init;
 	priv->cec_glue.exit = tda998x_cec_hook_exit;
 	priv->cec_glue.open = tda998x_cec_hook_open;
 	priv->cec_glue.release = tda998x_cec_hook_release;
 
-	/*
-	 * Some TDA998x are actually two I2C devices merged onto one piece
-	 * of silicon: TDA9989 and TDA19989 combine the HDMI transmitter
-	 * with a slightly modified TDA9950 CEC device.  The CEC device
-	 * is at the TDA9950 address, with the address pins strapped across
-	 * to the TDA998x address pins.  Hence, it always has the same
-	 * offset.
-	 */
-	memset(&cec_info, 0, sizeof(cec_info));
-	strlcpy(cec_info.type, "tda9950", sizeof(cec_info.type));
-	cec_info.addr = priv->cec_addr;
-	cec_info.platform_data = &priv->cec_glue;
-	cec_info.irq = client->irq;
-
-	priv->cec = i2c_new_device(client->adapter, &cec_info);
-	if (!priv->cec) {
-		ret = -ENODEV;
-		goto fail;
-	}
-
 	/* enable EDID read irq: */
 	reg_set(priv, REG_INT_FLAGS_2, INT_FLAGS_2_EDID_BLK_RD);
 
diff --git a/include/linux/platform_data/tda9950.h b/include/linux/platform_data/tda9950.h
index c65efd461102e..7e6893bad03a2 100644
--- a/include/linux/platform_data/tda9950.h
+++ b/include/linux/platform_data/tda9950.h
@@ -2,10 +2,12 @@
 #define LINUX_PLATFORM_DATA_TDA9950_H
 
 struct device;
+struct drm_connector;
 
 struct tda9950_glue {
 	struct device *parent;
 	unsigned long irq_flags;
+	const struct drm_connector *connector;
 	void *data;
 	int (*init)(void *);
 	void (*exit)(void *);
-- 
2.18.1

