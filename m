Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3014D6A365
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 09:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730984AbfGPH64 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 03:58:56 -0400
Received: from mail-qt1-f201.google.com ([209.85.160.201]:33648 "EHLO
        mail-qt1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbfGPH6z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 03:58:55 -0400
Received: by mail-qt1-f201.google.com with SMTP id y19so17314589qtm.0
        for <linux-media@vger.kernel.org>; Tue, 16 Jul 2019 00:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=GwvVXcfKTOvYlFNdrEjQ339Xk5gaHQ5QylqpM0QMSLE=;
        b=NnfIyEiDxbCbFLJUyFns1MQ9/TtSKDvaZbjQ6WjtPo7TIFugMPq3H7KviiflJSGj7Y
         n6KSYrpOFn6dD5Buz9fSx+IOQLS5pGzdAA07xcCB+wAMG3X2vWXdkeEA4YYnUxZA/KgN
         pYKUQ86vsyfqedFrHeKcMkjBZklLnkfLo75TmB9oUd03PS1wlVeR2K+3UT6q0p7ulAKa
         Wn8dsnHV0TozBTsm0AS/gM4+H7+02W1avZP6zd9HnKOPeZc6sCjW04Fwc6DIM6AHVHfV
         oSMEafphzaiM0mhGfKZLLkvSIUnC113ytAphCW4A/9kE4dr++V5GwvZMzpEVrwoCrGLf
         wlhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=GwvVXcfKTOvYlFNdrEjQ339Xk5gaHQ5QylqpM0QMSLE=;
        b=Gk78ipBZTuC8XxMhhJxkhjatfRuRzTW2cDGunDiqJVhN2y6O7wVdPbSOONT/xST4SQ
         ZGSQJrAjUDN0bJ+rlkS8Ct8/ipdFyOmN+nYEAc7MgWx7Pdyr8rKlQjh8GjaMmoV2OF/w
         FgS3QsMaq+dFkaE0f0E9dkz1lkouxwJ2ENlkhGMrgKKSzhLrY63Sl19XQVkP7u0S0QEx
         +oWSeHHxYxxuypg4AcFkM62U/WriCkkXV7iSIA3c1kcs6qfek8uBCgrUvIUsSKLadWQE
         plVlUvxI66K6Br7J4XCsn26y4SsmSRqcV+D2YVfskduOYX3KKQ/JLKIZWz+Jtb2ERh2L
         Tyrg==
X-Gm-Message-State: APjAAAW04S9TTVpx999IPBwf6B3kgfya1bbHR4Sm0dNxQnyaaTATbDyU
        yee2MRcFMJA3IWciUS/CyWUg9VhwjMSpj+MueRbv6wm1k6eqN8hjnlIYeT8FfIqOe1LXwSWNdrp
        8FWdZBzO2CaQQpAW1aKbpnfvzLD87vUPechW2k9IYYqvSRj3u8hfgMnYsB0gJgqtSfSDC
X-Google-Smtp-Source: APXvYqwZ65B/dh+nOfIGihTfbVKvHXJ65MNNFA3VCkqxftworN0kG9abk562GupeG+EvIE64WLPSz6RLsU4=
X-Received: by 2002:ac8:290c:: with SMTP id y12mr20960166qty.141.1563263934829;
 Tue, 16 Jul 2019 00:58:54 -0700 (PDT)
Date:   Tue, 16 Jul 2019 09:58:16 +0200
In-Reply-To: <20190716075820.260202-1-darekm@google.com>
Message-Id: <20190716075820.260202-6-darekm@google.com>
Mime-Version: 1.0
References: <20190716075820.260202-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
Subject: [PATCH v3 5/9] drm: tda998x: use cec_notifier_conn_(un)register
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

