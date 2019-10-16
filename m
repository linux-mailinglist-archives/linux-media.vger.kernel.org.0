Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB245D92B2
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 15:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391988AbfJPNjY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 09:39:24 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:33555 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2391968AbfJPNjY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 09:39:24 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id KjWGiHz9CPduvKjWMirEna; Wed, 16 Oct 2019 15:39:23 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        Russell King <linux@armlinux.org.uk>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv8 1/2] drm: tda998x: use cec_notifier_conn_(un)register
Date:   Wed, 16 Oct 2019 15:39:15 +0200
Message-Id: <20191016133916.21475-2-hverkuil-cisco@xs4all.nl>
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

Use the new cec_notifier_conn_(un)register() functions to
(un)register the notifier for the HDMI connector.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/gpu/drm/i2c/tda998x_drv.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index 84c6d4c91c65..8262b44b776e 100644
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
-				cec_notifier_set_phys_addr(priv->cec_notify,
-						   CEC_PHYS_ADDR_INVALID);
+
+				mutex_lock(&priv->cec_notify_mutex);
+				cec_notifier_phys_addr_invalidate(
+						priv->cec_notify);
+				mutex_unlock(&priv->cec_notify_mutex);
 			}
 
 			handled = true;
@@ -1790,8 +1796,10 @@ static void tda998x_destroy(struct device *dev)
 
 	i2c_unregister_device(priv->cec);
 
-	if (priv->cec_notify)
-		cec_notifier_put(priv->cec_notify);
+	mutex_lock(&priv->cec_notify_mutex);
+	cec_notifier_conn_unregister(priv->cec_notify);
+	priv->cec_notify = NULL;
+	mutex_unlock(&priv->cec_notify_mutex);
 }
 
 static int tda998x_create(struct device *dev)
@@ -1812,6 +1820,7 @@ static int tda998x_create(struct device *dev)
 	mutex_init(&priv->mutex);	/* protect the page access */
 	mutex_init(&priv->audio_mutex); /* protect access from audio thread */
 	mutex_init(&priv->edid_mutex);
+	mutex_init(&priv->cec_notify_mutex);
 	INIT_LIST_HEAD(&priv->bridge.list);
 	init_waitqueue_head(&priv->edid_delay_waitq);
 	timer_setup(&priv->edid_delay_timer, tda998x_edid_delay_done, 0);
@@ -1916,7 +1925,9 @@ static int tda998x_create(struct device *dev)
 		cec_write(priv, REG_CEC_RXSHPDINTENA, CEC_RXSHPDLEV_HPD);
 	}
 
-	priv->cec_notify = cec_notifier_get(dev);
+	mutex_lock(&priv->cec_notify_mutex);
+	priv->cec_notify = cec_notifier_conn_register(dev, NULL, NULL);
+	mutex_unlock(&priv->cec_notify_mutex);
 	if (!priv->cec_notify) {
 		ret = -ENOMEM;
 		goto fail;
-- 
2.23.0

