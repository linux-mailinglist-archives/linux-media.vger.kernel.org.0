Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5ECCD84840
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2019 10:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727522AbfHGIyx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Aug 2019 04:54:53 -0400
Received: from mail-vk1-f202.google.com ([209.85.221.202]:34667 "EHLO
        mail-vk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbfHGIyx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Aug 2019 04:54:53 -0400
Received: by mail-vk1-f202.google.com with SMTP id g68so35695070vkb.1
        for <linux-media@vger.kernel.org>; Wed, 07 Aug 2019 01:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=WKoE5Si3IbQGZAiEkMWSeCHd8THwHQPY0EBsGX+tSRY=;
        b=ZbQYfTisi+DVLG5aBLx0lCfIDtJNRFGMqQRJbWFPEgoOzUjS1GV8YvgfP91QWYo0I4
         ILfmw+2WNWRmZgLLN+7OyR9mnMyheYng0jvvu/0sjlmAIrpqk+5ebRGhwSQhrzoytw3I
         CgUZ//rsKD0ALmgpQlVzeSEXJ5GxlYQWXGzw0na000NVOboxocscggcXVZDSzvIW6Pkc
         BCvei55p9qHO09mJl49ZF6ubo4EHjj3nu+Nr/kdTrWJ2GIFlZoJcrNj0e62slF1baexH
         vjPoh5HpBoPgb4PZvjpLqe6YPTvBi0jkXgOhXzFgaoU8zite5asaYYU6tQm7bFYZeRo0
         pjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=WKoE5Si3IbQGZAiEkMWSeCHd8THwHQPY0EBsGX+tSRY=;
        b=ZJTgqtYhkvzx9GIW8pNyl8c3L2NzpXgq3KA/pNB5G7Cvkp837qfs4ht+SO8nKZlmiT
         JJ+VidILCKdk3rr9/a8FD8k1BJAnXJJhPDO9wIkQu0bcgNVxTGWKQsL3V6QSNwx0AXh/
         0UgVHU66iQf9hjv03kePDhOC+7splBuVK/99rf1838P8gVblvjBaMtLpaSKTYeEfiM87
         yESGXEPbmhO6kjWdWsKP3Rra3Xd0w155+PKF5Kox6DMWqg3YmutHEmtw0ItS75fjQPqC
         6SFVu4aKn0uQg6rSvGaBEOPNIeMBHsxhgWwLZtJ4VJ3H6S2pUpr4NAxy0XE1EPQ//lDF
         Mxhw==
X-Gm-Message-State: APjAAAXO68Y5G5r1KiDGBclHk9C1Vk0O9CrRQq/zOfab5nuXr3ox7Hen
        eNgmG7Q8KT2DxReFG/12tggifLwB0jA1HGRdn49afc+auV6gFmNgehe5+hws6OEhKWzx3am5Jxw
        q5eBht0Nc6qQD4nv2ISm2lm8t+wGf0Iww7AFdJ0Tnwt2lV6uR7Zq9+CGG4L+P5BUsdVQd
X-Google-Smtp-Source: APXvYqx7A9OoyolLBYHv9lxwrnZw6OVvjBR+UWxqxP729c/3SFjSRojJOQnRq+EL+/Sj7t55uUfgs9JDTFE=
X-Received: by 2002:a1f:5945:: with SMTP id n66mr2941678vkb.58.1565168092095;
 Wed, 07 Aug 2019 01:54:52 -0700 (PDT)
Date:   Wed,  7 Aug 2019 10:52:28 +0200
In-Reply-To: <20190807085232.151260-1-darekm@google.com>
Message-Id: <20190807085232.151260-6-darekm@google.com>
Mime-Version: 1.0
References: <20190807085232.151260-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
Subject: [PATCH v5 5/9] drm: tda998x: use cec_notifier_conn_(un)register
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
2.22.0.770.g0f2c4a37fd-goog

