Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD139DA66F
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 09:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387947AbfJQH2v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 03:28:51 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:36811 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728553AbfJQH2u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 03:28:50 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id L0DCiNIhkPduvL0DHitUWA; Thu, 17 Oct 2019 09:28:47 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        Dariusz Marcinkiewicz <darekm@google.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Russell King <linux@armlinux.org.uk>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv9 2/2] drm: tda998x: set the connector info
Date:   Thu, 17 Oct 2019 09:28:42 +0200
Message-Id: <20191017072842.16793-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017072842.16793-1-hverkuil-cisco@xs4all.nl>
References: <20191017072842.16793-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfMjm2H/NJK8bIu3deYv4BfEyuT2RBShEcA4goJ14CgKowZA7idHLU2gZ9TjmNh7D+VtZHaudgIfx+Pfc6D/EwnOHqwpuaFXaR9raXVLhDqHGw5oBrO0u
 uAkCvNVq4B8+pGdWrdTbHgYrWLaeyk3v5jm98mFX9ecNHemKl8oGMp1ZohGRkrCHjj4zln/o00Qyi0ycNDOXkWWOfCVs8TgxHPWwpTlNhYFN2AGYI1G6MkmF
 M4nsXOY1plXJ2PKhomsWIRSSLMmoeWFtHTcqNy9EqRMeNEtkxe2ZluuNO6qICuBhPQczNWDCGW5li819D+AEQa5bTmpXSybdWBNP9CdzcJAswO6hhfVMqWH9
 9x85uXtPTTQhtAICc55ednqcF7WyKWARFJPzKDEfVkI7BimHPIU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dariusz Marcinkiewicz <darekm@google.com>

Fill in the cec_connector_info when calling cec_notifier_conn_register().

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/gpu/drm/i2c/tda998x_drv.c | 33 +++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index dde8decb52a6..b0620842fa3a 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -82,6 +82,9 @@ struct tda998x_priv {
 	u8 audio_port_enable[AUDIO_ROUTE_NUM];
 	struct tda9950_glue cec_glue;
 	struct gpio_desc *calib;
+
+	/* protect cec_notify */
+	struct mutex cec_notify_mutex;
 	struct cec_notifier *cec_notify;
 };
 
@@ -805,8 +808,11 @@ static irqreturn_t tda998x_irq_thread(int irq, void *data)
 				tda998x_edid_delay_start(priv);
 			} else {
 				schedule_work(&priv->detect_work);
+
+				mutex_lock(&priv->cec_notify_mutex);
 				cec_notifier_phys_addr_invalidate(
 						priv->cec_notify);
+				mutex_unlock(&priv->cec_notify_mutex);
 			}
 
 			handled = true;
@@ -1331,6 +1337,8 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
 				  struct drm_device *drm)
 {
 	struct drm_connector *connector = &priv->connector;
+	struct cec_connector_info conn_info;
+	struct cec_notifier *notifier;
 	int ret;
 
 	connector->interlace_allowed = 1;
@@ -1347,6 +1355,17 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
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
 
@@ -1366,6 +1385,11 @@ static void tda998x_bridge_detach(struct drm_bridge *bridge)
 {
 	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
 
+	mutex_lock(&priv->cec_notify_mutex);
+	cec_notifier_conn_unregister(priv->cec_notify);
+	priv->cec_notify = NULL;
+	mutex_unlock(&priv->cec_notify_mutex);
+
 	drm_connector_cleanup(&priv->connector);
 }
 
@@ -1789,8 +1813,6 @@ static void tda998x_destroy(struct device *dev)
 	cancel_work_sync(&priv->detect_work);
 
 	i2c_unregister_device(priv->cec);
-
-	cec_notifier_conn_unregister(priv->cec_notify);
 }
 
 static int tda998x_create(struct device *dev)
@@ -1811,6 +1833,7 @@ static int tda998x_create(struct device *dev)
 	mutex_init(&priv->mutex);	/* protect the page access */
 	mutex_init(&priv->audio_mutex); /* protect access from audio thread */
 	mutex_init(&priv->edid_mutex);
+	mutex_init(&priv->cec_notify_mutex);
 	INIT_LIST_HEAD(&priv->bridge.list);
 	init_waitqueue_head(&priv->edid_delay_waitq);
 	timer_setup(&priv->edid_delay_timer, tda998x_edid_delay_done, 0);
@@ -1915,12 +1938,6 @@ static int tda998x_create(struct device *dev)
 		cec_write(priv, REG_CEC_RXSHPDINTENA, CEC_RXSHPDLEV_HPD);
 	}
 
-	priv->cec_notify = cec_notifier_conn_register(dev, NULL, NULL);
-	if (!priv->cec_notify) {
-		ret = -ENOMEM;
-		goto fail;
-	}
-
 	priv->cec_glue.parent = dev;
 	priv->cec_glue.data = priv;
 	priv->cec_glue.init = tda998x_cec_hook_init;
-- 
2.23.0

