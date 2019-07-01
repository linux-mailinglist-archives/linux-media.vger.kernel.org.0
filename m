Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1346F5BEE9
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 17:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729973AbfGAO77 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 10:59:59 -0400
Received: from mail-ua1-f73.google.com ([209.85.222.73]:57261 "EHLO
        mail-ua1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729918AbfGAO76 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 10:59:58 -0400
Received: by mail-ua1-f73.google.com with SMTP id d1so2264761uak.23
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2019 07:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=P4HveiLKctdBQuCO+kjf4sdHuIl2rhKUDgR6gBJU5iI=;
        b=uPL/L2ewQRYRDU9yrwi3ZoMMsjcoJ305yzZWc81kI+NpFgDbtHRzdBIOHxIsGaTl49
         jHAiB51DLtl91xapus6WzuG/qcnY7gj3Kr2+egnXHDRrAdxO5UIUErOvH8peEpDzpnnq
         jqDkPgd5gVKxYUOJSQCrR1g1fwmCKK9/aMvvC2cmKc+oA1GeRjgh1kIwEzPLk2aD/M6b
         3CabqM6yGLx4MVwapu7KCMFs1wu3W8ZJv0srUtZTQeI8/CIB1eqbrIK1ne2QQkc9OE1O
         7CFeH5huISzUrAmjEm0htdVysHoGfLbt5WIEuOtraQGxSFwTXZACWPwIqzMd7z4c7dd7
         dJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=P4HveiLKctdBQuCO+kjf4sdHuIl2rhKUDgR6gBJU5iI=;
        b=EOF1vdq/K1UyEiBQFl4VSRxe0qNIQvDCd/CIFNoOamoUF7MovZLQ/W8EAyovfRatkN
         WhjjNd4JIIORgwlORuEwfa4SuFJqKAdj44j6npK+SEkszxD8wlkh1MYAgPT3Y1BlrElo
         ykE96/7zLMVmyRJDfbech0TYTRck1o3+YXd8jt47ejioCd4wgL862TIjqytGsxntWVbk
         OyJdMmX1eRS1CFnEVr9j1UnVu+gIx5XMancB5Bs7Bj4kvfhBHQ/T5K4gArycEBkGlrsP
         sw8DCg05iis8SpGmFXS/NA6p6mE7nBakT/Yh+w0CzDzmXY7/cyfKyue6diZW7Z31p6fF
         K7/g==
X-Gm-Message-State: APjAAAU647jseItkET3VmleHNa4zuXWK12iEMUvSzB669rlfuzws+1BV
        34O/9ghdyoCykpA9tcodgM4taOnEh7lS95biZVZ2NV3fbXEDQYeJwzO2fPBvooKtn9S/5Pv7DIO
        stPwCVmifcMkeoT3W29wltxS+1bEg4ZeeEJ79eeendVAqx8upV0c7qU/m1guFlRafr6R4
X-Google-Smtp-Source: APXvYqzVqKJe1XRBnRCSMYBG4ygTV51J0Bsiw6f1xmWlhOE0yQG9MbdPo/3GPRsShWFpyTs1FrtQ1r6wIA8=
X-Received: by 2002:a67:2c50:: with SMTP id s77mr15069249vss.50.1561993197957;
 Mon, 01 Jul 2019 07:59:57 -0700 (PDT)
Date:   Mon,  1 Jul 2019 16:59:40 +0200
In-Reply-To: <20190701145944.214098-1-darekm@google.com>
Message-Id: <20190701145944.214098-2-darekm@google.com>
Mime-Version: 1.0
References: <20190701145944.214098-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v2 1/5] drm: tda998x: use cec_notifier_conn_(un)register
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        hverkuil@xs4all.nl
Cc:     Dariusz Marcinkiewicz <darekm@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the new cec_notifier_conn_(un)register() functions to
(un)register the notifier for the HDMI connector, and fill
in the cec_connector_info.

Changes since v1:
	Add memory barrier to make sure that the notifier
	becomes visible to the irq thread once it is
	fully constructed.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
---
 drivers/gpu/drm/i2c/tda998x_drv.c | 32 ++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index 7f34601bb5155..7844f4113a839 100644
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
+					cec_notifier_set_phys_addr(notify,
+							CEC_PHYS_ADDR_INVALID);
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
 
@@ -1651,7 +1671,7 @@ static void tda998x_destroy(struct device *dev)
 	i2c_unregister_device(priv->cec);
 
 	if (priv->cec_notify)
-		cec_notifier_put(priv->cec_notify);
+		cec_notifier_conn_unregister(priv->cec_notify);
 }
 
 static int tda998x_create(struct device *dev)
@@ -1776,12 +1796,6 @@ static int tda998x_create(struct device *dev)
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
2.22.0.410.gd8fdbe21b5-goog

