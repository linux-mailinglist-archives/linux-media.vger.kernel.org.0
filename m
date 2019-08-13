Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 253CB8B625
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 13:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728604AbfHMLD7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 07:03:59 -0400
Received: from mail-qk1-f201.google.com ([209.85.222.201]:43004 "EHLO
        mail-qk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728601AbfHMLD7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 07:03:59 -0400
Received: by mail-qk1-f201.google.com with SMTP id p18so22462849qke.9
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2019 04:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=6ulPqZWHu3buhcEJ9W+gaYDffj1X2raN/hmc1DXKRc0=;
        b=Ttc66cpbZ8f6IDLo5P+0wVxpvOL4SKVLSiOw7YHwSn/XuZU+OLaUtGoHRCorWkaat1
         wHSH5LO9HUkbMelvZJAXTbIIKxlRuRGofTbc+1J1foxEeRj2qI4qwLsJ+rvqQnKOUhlh
         esxHHm3r1yTSn5NKYWJdmluPi4/GbmoggxvsZJ7FmgW3kcTO4WzXH1zjYAljxfoSQqWJ
         0dwdWp+SksTGppNbhvwfEOHUPhbusR4sTcuYUCqyACzHhfGvzundOvP5iG7h3CHvfoWe
         C19TChEbFAxO0/uUA6NZOpJaJi5Dv54wbOd7YlTIWGPp/pAG/vYiwfnT1a1T5Oq173Mk
         v5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=6ulPqZWHu3buhcEJ9W+gaYDffj1X2raN/hmc1DXKRc0=;
        b=QLYBGwZ51/aRj5ZbhFnMezVNWM7WXwzL0yWC90o6/ebLwsPoHDn9u87Gl0+B/b6l5x
         5LJNQAFcUu3YPzFgRUebON9qfeXWKboH6x3lpIDYGmcwa3yIYqj87MGYCo7G0R0RM4cQ
         j3zfvFvSIfb48zdpChATbOWHUSbZ4HMr4VPdiImDeDNnAx9KRgPV7jpSLrl0yTSibjEn
         Wy+/jdLBo5YjKmoahDRKO6lbyxsY0Ahpy9XN8q4aBT947ISHhHPL/qXMfqyW25MxHoxU
         EBOkORJEctQEh6oo7vQ9mZRp/eFwjhd7yq49WW9Jr6iGGFM5C9/4pJuHja/1rY10Fich
         8u/w==
X-Gm-Message-State: APjAAAXWh66OxDnYptHb+TCfnvGFcpP5Em+TofHrQGbc3WGBWJvhzuNa
        ZXOYEHq5EXPAjAo2CYok53t+oInQqUY=
X-Google-Smtp-Source: APXvYqzOEdfJlhU1SPtyfEAHwdXZr+UgnOS/BqJFVj/N8D9Hp9/fP0qqBoTZWcRHPQw91l6QDOyw/B0nzXU=
X-Received: by 2002:ae9:df84:: with SMTP id t126mr30585905qkf.328.1565694238500;
 Tue, 13 Aug 2019 04:03:58 -0700 (PDT)
Date:   Tue, 13 Aug 2019 13:02:36 +0200
In-Reply-To: <20190813110300.83025-1-darekm@google.com>
Message-Id: <20190813110300.83025-5-darekm@google.com>
Mime-Version: 1.0
References: <20190813110300.83025-1-darekm@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v6 4/8] drm: tda998x: use cec_notifier_conn_(un)register
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        Russell King <linux@armlinux.org.uk>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
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
Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/gpu/drm/i2c/tda998x_drv.c | 33 +++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index 61e042918a7fc..19a63ee1b3f53 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -804,9 +804,14 @@ static irqreturn_t tda998x_irq_thread(int irq, void *data)
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
@@ -1331,6 +1336,8 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
 				  struct drm_device *drm)
 {
 	struct drm_connector *connector = &priv->connector;
+	struct cec_connector_info conn_info;
+	struct cec_notifier *notifier;
 	int ret;
 
 	connector->interlace_allowed = 1;
@@ -1347,6 +1354,19 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
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
 
@@ -1790,8 +1810,7 @@ static void tda998x_destroy(struct device *dev)
 
 	i2c_unregister_device(priv->cec);
 
-	if (priv->cec_notify)
-		cec_notifier_put(priv->cec_notify);
+	cec_notifier_conn_unregister(priv->cec_notify);
 }
 
 static int tda998x_create(struct device *dev)
@@ -1916,12 +1935,6 @@ static int tda998x_create(struct device *dev)
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
2.23.0.rc1.153.gdeed80330f-goog

