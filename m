Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B20776A8BC
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 14:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731015AbfGPM2K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 08:28:10 -0400
Received: from mail-pf1-f201.google.com ([209.85.210.201]:53049 "EHLO
        mail-pf1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728470AbfGPM2K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 08:28:10 -0400
Received: by mail-pf1-f201.google.com with SMTP id a20so12259719pfn.19
        for <linux-media@vger.kernel.org>; Tue, 16 Jul 2019 05:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=GwvVXcfKTOvYlFNdrEjQ339Xk5gaHQ5QylqpM0QMSLE=;
        b=u19izu2n4GJAj0kllXMbetVohajET/y06W6GJ12q/BguX1rclJl4Bh1YGEOjDh2qth
         9HiYbqYU+s1/I7NwAR5dqEjsNoK6FIth2xw1BA3ZPvJSlnAGyHFC1mBIknjwZ/qrEj2k
         KUkiZNbvfdTkb+e/jqcHyDcevdoijz01sePlp30B5Au2E/3kt+qFQTmYeBMrR+mJjjxa
         onJ33VF5OTZkE/jvEvD0kccLwUsu35vQkbN7guP96DFr+KqiYwSq//zABSIdp0hib7Vg
         314ityAzVyWteaRFimO/59kfscRKeY1Al12SiRYTOIXg/t22uh2GvHk95zLj6/q8VAhz
         WYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=GwvVXcfKTOvYlFNdrEjQ339Xk5gaHQ5QylqpM0QMSLE=;
        b=OV+BFB9Wd32KCp06MK607Qwb4oBEIWQRLSBScTr8UKhSz6SafiDjM/1AJ1aD7fuhUo
         NSZIMjUh1fAeQhsmLt64OJipslDD5ZVcVhjgaoVQDI6KF/rvYsDt9LvwOXez24fPHEg0
         eAKkLDsyVhzlE6p1qzGlN0rAz3HhPFJUPGtEBmxiCnTrMH7gQaD1H6FtNpVPCg3Qr19W
         BrByyc8jvSJfrQeuYDsDZhBZ3J41cM7eeNMt7+BxIzp4yeNXZwJQ73LPOdaeIBqPrTki
         GQ5vXMqbSkruJzzpSwZ1U4hACi09RzBA73UiyzRGFHnJER3eKjLmbLUN+cmWItpXobUN
         TZ3Q==
X-Gm-Message-State: APjAAAX5gNIs7eu5MDItmxJJwtO2CR8U4Wn3lZm0sAkDc569RTacf5FD
        w1MaReoKAzUR3UbRFtSTGCWg034oUSbpJdRsN3WXXVL7thW3IOIXGuDWSz/aGK84oo3nF1KqsH+
        yKbW/PJReSHbPH83dye6SviUZiHzuSSfZ3BbqgFfj+t9CXwHahpPr2QDSELGBkENb+wXA
X-Google-Smtp-Source: APXvYqzvJwWyZnasuI2XDySmj21QwF25P5xSsjwlFRQ1kE1iwB6CF9nxIesrPOlDatB7vDHdixLjiqnzGEc=
X-Received: by 2002:a63:ec03:: with SMTP id j3mr6020220pgh.325.1563280089054;
 Tue, 16 Jul 2019 05:28:09 -0700 (PDT)
Date:   Tue, 16 Jul 2019 14:27:14 +0200
In-Reply-To: <20190716122718.125993-1-darekm@google.com>
Message-Id: <20190716122718.125993-6-darekm@google.com>
Mime-Version: 1.0
References: <20190716122718.125993-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
Subject: [PATCH v4 5/9] drm: tda998x: use cec_notifier_conn_(un)register
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Cc:     Dariusz Marcinkiewicz <darekm@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the new cec_notifier_conn_(un)register() functions to
(un)register the notifier for the HDMI connector, and fill
in the cec_connector_info.

Changes since v2:
	- cec_notifier_phys_addr_invalidate where appropriate,
	- don't check for NULL notifier before calling
	cec_notifier_conn_unregister.
Changes since v1:
	Add memory barrier to make sure that the notifier
	becomes visible to the irq thread once it is
	fully constructed.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
---
 drivers/gpu/drm/i2c/tda998x_drv.c | 33 +++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index 7f34601bb5155..31214663d6fdd 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -794,9 +794,14 @@ static irqreturn_t tda998x_irq_thread(int irq, void *data)
 			if (lvl & CEC_RXSHPDLEV_HPD) {
 				tda998x_edid_delay_start(priv);
 			} else {
+				struct cec_notifier *notify;
+
 				schedule_work(&priv->detect_work);
-				cec_notifier_set_phys_addr(priv->cec_notify,
-						   CEC_PHYS_ADDR_INVALID);
+
+				notify = READ_ONCE(priv->cec_notify);
+				if (notify)
+					cec_notifier_phys_addr_invalidate(
+							notify);
 			}
 
 			handled = true;
@@ -1253,6 +1258,8 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
 				  struct drm_device *drm)
 {
 	struct drm_connector *connector = &priv->connector;
+	struct cec_connector_info conn_info;
+	struct cec_notifier *notifier;
 	int ret;
 
 	connector->interlace_allowed = 1;
@@ -1269,6 +1276,19 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
 	if (ret)
 		return ret;
 
+	cec_fill_conn_info_from_drm(&conn_info, connector);
+
+	notifier = cec_notifier_conn_register(priv->cec_glue.parent,
+					      NULL, &conn_info);
+	if (!notifier)
+		return -ENOMEM;
+	/*
+	 * Make sure that tda998x_irq_thread does see the notifier
+	 * when it fully constructed.
+	 */
+	smp_wmb();
+	priv->cec_notify = notifier;
+
 	drm_connector_attach_encoder(&priv->connector,
 				     priv->bridge.encoder);
 
@@ -1650,8 +1670,7 @@ static void tda998x_destroy(struct device *dev)
 
 	i2c_unregister_device(priv->cec);
 
-	if (priv->cec_notify)
-		cec_notifier_put(priv->cec_notify);
+	cec_notifier_conn_unregister(priv->cec_notify);
 }
 
 static int tda998x_create(struct device *dev)
@@ -1776,12 +1795,6 @@ static int tda998x_create(struct device *dev)
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
-- 
2.22.0.510.g264f2c817a-goog

