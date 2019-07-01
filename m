Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 028D35B6F3
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 10:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbfGAIhF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 04:37:05 -0400
Received: from mail-qt1-f201.google.com ([209.85.160.201]:43763 "EHLO
        mail-qt1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727031AbfGAIhE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 04:37:04 -0400
Received: by mail-qt1-f201.google.com with SMTP id z16so12788899qto.10
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2019 01:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=+NPCQYXyX+SIDkQhRH+3sGnQSpnPhYdJ48dJe2/VttU=;
        b=F7WqmSJWdB6tT7UG8ODUFnCc7W1VgOgxk7g0KqkChKna+DiE4AgQ2mEzQIUhDrhq8f
         kO7L1wvcIx1+64gNc6M9VL1UCDiWUwEMpW4ATsg6U3A9NIoR46TxrGNa4zfEfi7sA5Tg
         2wgaepUHfXYV2MxaOK0Sre8Hb1SQcRLu2UcUiibMxN2pv7CYjUpCsaJFsrrtA5+ifJW4
         RjybCQ/OmuDGn4eCIlhAl/GH6u1e6yiI5gY323usRqdIzRJjITJD3NYOVZ10g7ReIEDD
         Wz6qfSg76mhYozw2phqgXFtRE9qvuakCvNsYLshbH5YweBdfYJnq4sMXAoOw3KzkZ78F
         epGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=+NPCQYXyX+SIDkQhRH+3sGnQSpnPhYdJ48dJe2/VttU=;
        b=ijJ8vLaDnFJ7Bu1Cp0P7DxK6OlKm9E1WvaNOj/CcKEfSzFiL2Djx7metueqGYxntWH
         y8hJmnLn0vHAD1qQ4yp2GLrl0pPpYjCC23npXgGaMW7lkA2/75JTrWE17aOFE0uezsqj
         yrS6dp2bogRddMEXJR2O1rAU3DT4v7xzjn4Ob+guitKMbE9tORL3I0w0mjA/el6kKQWC
         VC6+W4OnBIObbDwtqnGtk1LaD8wv8d3hL5A6DRVFujrzhQ3m6gEZlMbQvz/cGu9aHA3r
         82Jy/GBtAaggJR1jzdTW+LHdMO7WixrphX7G1Ny9Pm/G6x33HGgeddwZ8KXKts/ih/Tf
         wNZg==
X-Gm-Message-State: APjAAAUI2NGhhQm+M6t2rqxGHmEwkzpRQ+zTwwG80nwoqRoJk4EEedgn
        xxWhoET637hCMXy1Y5frENMkye/6757c65xW5N0ciPUL1dAjlwmlfw9xj9NIb3aYh4XnzrdqKIA
        cIOq9fMuvJCVKByuvs3Lfjd7lrG5lr1iDSMg+nyUkJXS0aJEZTa6+jKAhEvPvjwSINu3K
X-Google-Smtp-Source: APXvYqwY7Vy888BVjkrFo8TxVNF2MUgo3MwtdDxrGabXHeX201Rth5Yvsz1Ml6Qi77Wm/z9ro22xWb8d9Cs=
X-Received: by 2002:a37:9a96:: with SMTP id c144mr18404718qke.468.1561970223842;
 Mon, 01 Jul 2019 01:37:03 -0700 (PDT)
Date:   Mon,  1 Jul 2019 10:35:41 +0200
In-Reply-To: <20190701083545.74639-1-darekm@google.com>
Message-Id: <20190701083545.74639-2-darekm@google.com>
Mime-Version: 1.0
References: <20190701083545.74639-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH 1/5] drm: tda998x: use cec_notifier_conn_(un)register
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

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
---
 drivers/gpu/drm/i2c/tda998x_drv.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index 7f34601bb5155..d8d51c6a2d390 100644
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
@@ -1269,6 +1276,14 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
 	if (ret)
 		return ret;
 
+	cec_fill_conn_info_from_drm(&conn_info, connector);
+
+	notifier = cec_notifier_conn_register(priv->cec_glue.parent,
+					      NULL, &conn_info);
+	if (!notifier)
+		return -ENOMEM;
+	WRITE_ONCE(priv->cec_notify, notifier);
+
 	drm_connector_attach_encoder(&priv->connector,
 				     priv->bridge.encoder);
 
@@ -1651,7 +1666,7 @@ static void tda998x_destroy(struct device *dev)
 	i2c_unregister_device(priv->cec);
 
 	if (priv->cec_notify)
-		cec_notifier_put(priv->cec_notify);
+		cec_notifier_conn_unregister(priv->cec_notify);
 }
 
 static int tda998x_create(struct device *dev)
@@ -1776,12 +1791,6 @@ static int tda998x_create(struct device *dev)
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

