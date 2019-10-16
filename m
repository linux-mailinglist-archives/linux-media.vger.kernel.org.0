Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4E00D92B3
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 15:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393630AbfJPNjZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 09:39:25 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:44691 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2391969AbfJPNjZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 09:39:25 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id KjWGiHz9CPduvKjWNirEnk; Wed, 16 Oct 2019 15:39:23 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        Russell King <linux@armlinux.org.uk>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv8 2/2] drm: tda998x: set the connector info
Date:   Wed, 16 Oct 2019 15:39:16 +0200
Message-Id: <20191016133916.21475-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016133916.21475-1-hverkuil-cisco@xs4all.nl>
References: <20191016133916.21475-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfE63RpatVNiP/wxLBJC2GI+zoFGNU+l1lAI0J2w6ie79cdeBEjT3kisyrsNGzYX5DItStGV/wgP2/QR2Rq58o7n/npWh0H2gEpAE+1NHfP1yaHhxZQiG
 S1bMMYZC8qxqMVMFUAHPT1t67frOM6RUcJyDDlXUeyTvfQ9uRLi2CtleGYs2OGym+wFCOfKxRxoIHAmIO4N2OF/MfZYIQJ64b109SINHALReqz4Ms0zhpgf2
 Xmg+nPLKjvtMkPNylmsqfXQ0MC9skopGtubrjvOILxPxiqbYgD0n/fEtgykhEthx5bjcNhH95hloKRODvxRA/vPJgR+IL9x35nM0GBAqHLBOkFv3pySF0iKw
 ycitNz7UvSCHYC6CgBvLlC9o3txowTG+j3ouLXL3FPpuev3dcaI=
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
 drivers/gpu/drm/i2c/tda998x_drv.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index 8262b44b776e..b0620842fa3a 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -1337,6 +1337,8 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
 				  struct drm_device *drm)
 {
 	struct drm_connector *connector = &priv->connector;
+	struct cec_connector_info conn_info;
+	struct cec_notifier *notifier;
 	int ret;
 
 	connector->interlace_allowed = 1;
@@ -1353,6 +1355,17 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
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
 
@@ -1372,6 +1385,11 @@ static void tda998x_bridge_detach(struct drm_bridge *bridge)
 {
 	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
 
+	mutex_lock(&priv->cec_notify_mutex);
+	cec_notifier_conn_unregister(priv->cec_notify);
+	priv->cec_notify = NULL;
+	mutex_unlock(&priv->cec_notify_mutex);
+
 	drm_connector_cleanup(&priv->connector);
 }
 
@@ -1795,11 +1813,6 @@ static void tda998x_destroy(struct device *dev)
 	cancel_work_sync(&priv->detect_work);
 
 	i2c_unregister_device(priv->cec);
-
-	mutex_lock(&priv->cec_notify_mutex);
-	cec_notifier_conn_unregister(priv->cec_notify);
-	priv->cec_notify = NULL;
-	mutex_unlock(&priv->cec_notify_mutex);
 }
 
 static int tda998x_create(struct device *dev)
@@ -1925,14 +1938,6 @@ static int tda998x_create(struct device *dev)
 		cec_write(priv, REG_CEC_RXSHPDINTENA, CEC_RXSHPDLEV_HPD);
 	}
 
-	mutex_lock(&priv->cec_notify_mutex);
-	priv->cec_notify = cec_notifier_conn_register(dev, NULL, NULL);
-	mutex_unlock(&priv->cec_notify_mutex);
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

