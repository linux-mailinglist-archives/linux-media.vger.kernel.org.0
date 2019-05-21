Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6132824D3A
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2019 12:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727864AbfEUKw1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 May 2019 06:52:27 -0400
Received: from mail-ot1-f74.google.com ([209.85.210.74]:45558 "EHLO
        mail-ot1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727838AbfEUKw0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 May 2019 06:52:26 -0400
Received: by mail-ot1-f74.google.com with SMTP id g80so9434701otg.12
        for <linux-media@vger.kernel.org>; Tue, 21 May 2019 03:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=TH8finFZ9rq31I/M5cXpmkQoRMzgMDnUFgzNXfNCEyQ=;
        b=pbHheiZk/Wj6MCP9e/g1QWZ47lf+ngoj44c79PES9BKx0g8mRAHLIp/nubTozILJOZ
         vcbdrkXsn2rSiIyHPAJLzpj+tWemPmLvWs3quPzr7OxL6xuQ7GpZflaifXwlmkFidSXk
         tuVCyjx31cletj/YIKsnQf6mYq/QBl/MmA66SBglv1etRoJKoPXH5rAEsAe1KZerH1Ku
         9yuBI5Qc/o9Q1hh/cqxGGgrQS9zViY7HYpNiDETQSvdOBqD4PRgOhDcOawxhD4Gfdx1q
         eeSrDluEHywVS4g7wE0bK1cQF8I0XDFoTmRrGNqF76umxhWcDTowb1VwKDYNEiaD5odp
         DrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=TH8finFZ9rq31I/M5cXpmkQoRMzgMDnUFgzNXfNCEyQ=;
        b=c4UnLmwNXOz1Y4rQ50DwpZU/f7a+G5hDqrf4f7zPP/3LV+QRlNsw/gsHRRNpHHZT5O
         pGTtEiNfWPm4zrM1zouMaT8slZ1GE1TI6eSUdpeWr1fyvgcicaKBXDMY0jN5oOfYQOKJ
         zL8pWBOhYS4eqtp0nOuPwgqEH1+qga1izNUcb8C9RrMOM80Exajtz6klbnDtrnsVNtsr
         7ergyv4I77Hr5ipa5r9x5brbnjceHqbV9ky7aGyu1KCwnK57qQUBdnG6AZQCWvoI5xFc
         GiyOJ7kTZnaGPuNfYVoHLtGbUynheSzDjswOKrZRotvj67lGbwDbm8/m1JOOb/3AtwT+
         xqMg==
X-Gm-Message-State: APjAAAW/KEAyVr2c4qihA82ndTcmO53rsUOS4arcy4PGnf+qM60SfX04
        xCJkvzRlS1RhKNAQz6fzR8UbbQy5Me4sG3dLdzc7hj3gfbhYp0Ik3iwufzRujgttjpu+hR+wCsK
        wPT1uTea7FZRdsJvKhTxtmX//0N9EPYDYAF9ZI5gc0asRS8FCon6QiGRZXe+vxV1j4+Nt
X-Google-Smtp-Source: APXvYqxZ/cIXUO+8kXwKJXLwVtgtXhSJz2NpI0V6tMnvUjZmrRQVr82maCEWdr5+SfjlS5IpAVh/bSDj3cI=
X-Received: by 2002:a05:6830:1584:: with SMTP id i4mr22066172otr.109.1558435945621;
 Tue, 21 May 2019 03:52:25 -0700 (PDT)
Date:   Tue, 21 May 2019 12:52:03 +0200
In-Reply-To: <20190521105203.154043-1-darekm@google.com>
Message-Id: <20190521105203.154043-3-darekm@google.com>
Mime-Version: 1.0
References: <20190521105203.154043-1-darekm@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v7 3/3] drm/i2c: tda9950: pass HDMI connector info to CEC adapter
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
 drivers/gpu/drm/i2c/tda9950.c     | 13 +++++---
 drivers/gpu/drm/i2c/tda998x_drv.c | 55 ++++++++++++++++---------------
 2 files changed, 36 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/i2c/tda9950.c b/drivers/gpu/drm/i2c/tda9950.c
index b944dd9df85e1..61ec50a2ca275 100644
--- a/drivers/gpu/drm/i2c/tda9950.c
+++ b/drivers/gpu/drm/i2c/tda9950.c
@@ -382,6 +382,7 @@ static int tda9950_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
 	struct tda9950_glue *glue = client->dev.platform_data;
+	const struct cec_connector_info *conn_info;
 	struct device *dev = &client->dev;
 	struct tda9950_priv *priv;
 	unsigned long irqflags;
@@ -422,10 +423,16 @@ static int tda9950_probe(struct i2c_client *client,
 	if (glue && glue->parent)
 		priv->hdmi = glue->parent;
 
+	priv->notify = cec_notifier_get(priv->hdmi);
+	if (!priv->notify)
+		return -ENOMEM;
+
+	conn_info = cec_notifier_get_conn_info(priv->notify);
+
 	priv->adap = cec_allocate_adapter(&tda9950_cec_ops, priv, "tda9950",
 					  CEC_CAP_DEFAULTS,
 					  CEC_MAX_LOG_ADDRS,
-					  NULL);
+					  conn_info);
 	if (IS_ERR(priv->adap))
 		return PTR_ERR(priv->adap);
 
@@ -461,10 +468,6 @@ static int tda9950_probe(struct i2c_client *client,
 	if (ret < 0)
 		return ret;
 
-	priv->notify = cec_notifier_get(priv->hdmi);
-	if (!priv->notify)
-		return -ENOMEM;
-
 	ret = cec_register_adapter(priv->adap, priv->hdmi);
 	if (ret < 0) {
 		cec_notifier_put(priv->notify);
diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index 7f34601bb5155..b1d76e6561e30 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -1253,6 +1253,8 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
 				  struct drm_device *drm)
 {
 	struct drm_connector *connector = &priv->connector;
+	struct cec_connector_info conn_info;
+	struct i2c_board_info cec_info;
 	int ret;
 
 	connector->interlace_allowed = 1;
@@ -1269,6 +1271,32 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
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
+	cec_fill_connector_info(&conn_info, connector);
+
+	priv->cec_notify = cec_notifier_get_conn(priv->cec_glue.parent,
+						 NULL, &conn_info);
+	if (!priv->cec_notify)
+		return -ENOMEM;
+
+
 	drm_connector_attach_encoder(&priv->connector,
 				     priv->bridge.encoder);
 
@@ -1658,7 +1686,6 @@ static int tda998x_create(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct device_node *np = client->dev.of_node;
-	struct i2c_board_info cec_info;
 	struct tda998x_priv *priv;
 	u32 video;
 	int rev_lo, rev_hi, ret;
@@ -1776,12 +1803,6 @@ static int tda998x_create(struct device *dev)
 		cec_write(priv, REG_CEC_RXSHPDINTENA, CEC_RXSHPDLEV_HPD);
 	}
 
-	priv->cec_notify = cec_notifier_get(dev);
-	if (!priv->cec_notify) {
-		ret = -ENOMEM;
-		goto fail;
-	}
-
 	priv->cec_glue.parent = dev;
 	priv->cec_glue.data = priv;
 	priv->cec_glue.init = tda998x_cec_hook_init;
@@ -1789,26 +1810,6 @@ static int tda998x_create(struct device *dev)
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
 
-- 
2.18.1

