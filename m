Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4557F517EF
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2019 18:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731505AbfFXQDq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jun 2019 12:03:46 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:41047 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731482AbfFXQDm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jun 2019 12:03:42 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id fRRKhHRxHF85OfRRUhZace; Mon, 24 Jun 2019 18:03:41 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org,
        Cheng-yi Chiang <cychiang@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv8 12/13] tda998x: use cec_notifier_conn_(un)register
Date:   Mon, 24 Jun 2019 18:03:29 +0200
Message-Id: <20190624160330.38048-13-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl>
References: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfOIEYMngRDIwgK74lnlvOXIt+9xy5ZfdkyY50fEwdUfHLW3a6HQUX9qOjaoewFZqmrrw97CMmILYvYcruHFXffRTdMS8h1EKdAXjyCM+KJiPP3i3kA/l
 qbLIqY3uC0qPtLV/o7kL0awPNFc9OKys1ntf6O23b4W7fj04WjYHw2DGvGepT6Wik/vmWq4BwiW315yaB2gGUOKXRc8N0MHw9k57P8wa91Rnj6J8J37y2RfB
 SONLuSvtwaGLT4XJDRjRQQmP0X9/oh3fYjonz8QEg5cTYANXwxJc9mU2sj2fXQYYNde+ac6na/uTLAwU7nBVKiVT2g5DREcVczC7BpIllgQ=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dariusz Marcinkiewicz <darekm@google.com>

Use the new cec_notifier_conn_(un)register() functions to
(un)register the notifier for the HDMI connector, and fill in
the cec_connector_info.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/gpu/drm/i2c/tda998x_drv.c | 56 +++++++++++++++----------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index 7f34601bb515..019e1f2f008c 100644
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
@@ -1269,6 +1271,31 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
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
+	cec_fill_conn_info_from_drm(&conn_info, connector);
+
+	priv->cec_notify = cec_notifier_conn_register(priv->cec_glue.parent,
+						      NULL, &conn_info);
+	if (!priv->cec_notify)
+		return -ENOMEM;
+
 	drm_connector_attach_encoder(&priv->connector,
 				     priv->bridge.encoder);
 
@@ -1651,14 +1678,13 @@ static void tda998x_destroy(struct device *dev)
 	i2c_unregister_device(priv->cec);
 
 	if (priv->cec_notify)
-		cec_notifier_put(priv->cec_notify);
+		cec_notifier_conn_unregister(priv->cec_notify);
 }
 
 static int tda998x_create(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct device_node *np = client->dev.of_node;
-	struct i2c_board_info cec_info;
 	struct tda998x_priv *priv;
 	u32 video;
 	int rev_lo, rev_hi, ret;
@@ -1776,12 +1802,6 @@ static int tda998x_create(struct device *dev)
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
@@ -1789,26 +1809,6 @@ static int tda998x_create(struct device *dev)
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
2.20.1

