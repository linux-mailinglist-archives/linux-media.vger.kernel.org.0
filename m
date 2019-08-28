Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F0ED9FB47
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2019 09:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbfH1HPp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Aug 2019 03:15:45 -0400
Received: from mail-yw1-f74.google.com ([209.85.161.74]:48354 "EHLO
        mail-yw1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726273AbfH1HPp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Aug 2019 03:15:45 -0400
Received: by mail-yw1-f74.google.com with SMTP id h22so1248113ywk.15
        for <linux-media@vger.kernel.org>; Wed, 28 Aug 2019 00:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=pO6G2tJIWIc79GlfXyD7tYRlgpCJ3Wp5sfmQpLmODHQ=;
        b=haoiuUv6FwAVdeyp7BVc3pDAqvPC/ds02yPDw/Lpq4KFYSLid/2T8oP3DA7sI/XnNp
         bjngcL7mnMQro96+ZwOb1Gt25bxq37G4z/Ow3o6U0dzdJZjKslbNsk+zC9g7Qce0tV0u
         BzgU5+IQ3ZGQGPfxagkcalDyaPCw7MxZ8hC62nXstPdNeOEigWogCgbHn1F5PP0d8gi+
         b+oWiiRZHQW/ZFtAcJrlup+jI6vXsdVAs6VYfOH/lNmSeWyt3ukutR8MA5ibwX/IlN4L
         9woWplT7Z01+fxXDw2GJRh4M3TQcaFmmsCLk5z9SrkRBcCglOyOyo78zPoRN6fq5d04T
         Aaxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=pO6G2tJIWIc79GlfXyD7tYRlgpCJ3Wp5sfmQpLmODHQ=;
        b=RUThhg+MYkqUNvv5npsto5GmbKoJfbs532zJwLC0+Rafa3qIZsizdryDR627oIaNnE
         YYhN8woKK773bnWOAml8RTPvK23guZC3TdRpxK2CfdW3ozNO06M4NmnZTlHfBGGrhrqm
         BuvOoXrhsa1fg26qObhpB57mQctzeLPTLXSqb+7VlhCMDEd4WI1QbCBAflJnQ8lBoziZ
         sfBcK7OjUUdfivKjHAieS0+cvcAPc62wgWFKq6EpJvzDPGXMk+bosav0ehAtDJPB9BVN
         N904lBeexbg7HEJIUMn6gmCz/FaxbKAccrg5p1AimRlM87rAkdKHanMbZ6HzQOuQsQQL
         iaJw==
X-Gm-Message-State: APjAAAWV0G322AkkPkCjRCmfn/okoXx3eOph00jgZra9KprnbjZxLyeV
        fMgMV2oGS34eRUOjBO9c4DVIeziPdL8=
X-Google-Smtp-Source: APXvYqzctMiFQlYF+UvzuyviUGwwek3BnAXSR8uVLG9IR+PqW/ao+bgQWKhtNMFcd7Hc/sZBH20B8YFhEug=
X-Received: by 2002:a81:a68d:: with SMTP id d135mr2009010ywh.38.1566976544368;
 Wed, 28 Aug 2019 00:15:44 -0700 (PDT)
Date:   Wed, 28 Aug 2019 09:15:36 +0200
In-Reply-To: <20190819112207.57166-1-darekm@google.com>
Message-Id: <20190828071536.56533-1-darekm@google.com>
Mime-Version: 1.0
References: <20190819112207.57166-1-darekm@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v7.2 5/9] drm: tda998x: use cec_notifier_conn_(un)register
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        Russell King <linux@armlinux.org.uk>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the new cec_notifier_conn_(un)register() functions to
(un)register the notifier for the HDMI connector, and fill
in the cec_connector_info.

Changes since v7.1:
	- re-added if (!notifier)..
Changes since v7:
	- typo fix
Changes since v6:
        - move cec_notifier_conn_unregister to tda998x_bridge_detach,
	- add a mutex protecting accesses to a CEC notifier.
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
 drivers/gpu/drm/i2c/tda998x_drv.c | 37 ++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index 61e042918a7fc..2bc4f50458137 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -82,6 +82,8 @@ struct tda998x_priv {
 	u8 audio_port_enable[AUDIO_ROUTE_NUM];
 	struct tda9950_glue cec_glue;
 	struct gpio_desc *calib;
+
+	struct mutex cec_notify_mutex;
 	struct cec_notifier *cec_notify;
 };
 
@@ -805,8 +807,11 @@ static irqreturn_t tda998x_irq_thread(int irq, void *data)
 				tda998x_edid_delay_start(priv);
 			} else {
 				schedule_work(&priv->detect_work);
-				cec_notifier_set_phys_addr(priv->cec_notify,
-						   CEC_PHYS_ADDR_INVALID);
+
+				mutex_lock(&priv->cec_notify_mutex);
+				cec_notifier_phys_addr_invalidate(
+						priv->cec_notify);
+				mutex_unlock(&priv->cec_notify_mutex);
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
@@ -1347,6 +1354,17 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
 	if (ret)
 		return ret;
 
+	cec_fill_conn_info_from_drm(&conn_info, connector);
+
+	notifier = cec_notifier_conn_register(priv->cec_glue.parent,
+					      NULL, &conn_info);
+	if (!notifier)
+		return -ENOMEM;
+
+	mutex_lock(&priv->cec_notify_mutex);
+	priv->cec_notify = notifier;
+	mutex_unlock(&priv->cec_notify_mutex);
+
 	drm_connector_attach_encoder(&priv->connector,
 				     priv->bridge.encoder);
 
@@ -1366,6 +1384,11 @@ static void tda998x_bridge_detach(struct drm_bridge *bridge)
 {
 	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
 
+	mutex_lock(&priv->cec_notify_mutex);
+	cec_notifier_conn_unregister(priv->cec_notify);
+	priv->cec_notify = NULL;
+	mutex_unlock(&priv->cec_notify_mutex);
+
 	drm_connector_cleanup(&priv->connector);
 }
 
@@ -1789,9 +1812,6 @@ static void tda998x_destroy(struct device *dev)
 	cancel_work_sync(&priv->detect_work);
 
 	i2c_unregister_device(priv->cec);
-
-	if (priv->cec_notify)
-		cec_notifier_put(priv->cec_notify);
 }
 
 static int tda998x_create(struct device *dev)
@@ -1812,6 +1832,7 @@ static int tda998x_create(struct device *dev)
 	mutex_init(&priv->mutex);	/* protect the page access */
 	mutex_init(&priv->audio_mutex); /* protect access from audio thread */
 	mutex_init(&priv->edid_mutex);
+	mutex_init(&priv->cec_notify_mutex);
 	INIT_LIST_HEAD(&priv->bridge.list);
 	init_waitqueue_head(&priv->edid_delay_waitq);
 	timer_setup(&priv->edid_delay_timer, tda998x_edid_delay_done, 0);
@@ -1916,12 +1937,6 @@ static int tda998x_create(struct device *dev)
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
2.23.0.187.g17f5b7556c-goog

