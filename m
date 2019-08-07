Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9792984845
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2019 10:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727581AbfHGIzE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Aug 2019 04:55:04 -0400
Received: from mail-qk1-f201.google.com ([209.85.222.201]:37483 "EHLO
        mail-qk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbfHGIzE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Aug 2019 04:55:04 -0400
Received: by mail-qk1-f201.google.com with SMTP id d203so213737qke.4
        for <linux-media@vger.kernel.org>; Wed, 07 Aug 2019 01:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=rSoN9hjSxRIhqadFC45zbU01lHdfo22WQmk7pgd6Hws=;
        b=IObPTHV1GMvAaA7pSRb8i2dsFoveilicBcUFokI3xCuQbAYVPmJ0vhmCC3aXQHgWmb
         ZBsevIDh78sKNRXv0mioBFR9611/rs8+QNaqrjwx/zcdHc2BIckojSK5hy9XcEgKKSle
         //wdkD/B76/HyyW2i5GUJ7dYdkGGCFSg+u00842o2YIxyL6JbxzWGA+zS/E2iKuj26UH
         Yi4jxXYblqw//DVvc0rlp7Q6cinmI1kQyvk43cVgQmiyvp07U09t/gXzbkSmeKNWTu+c
         CRWKlZ78qHMGXe4J8zzEGZMM56dqBaIwQwbBrJccw61MQXCTsJQgNYlZ2ZhOiNxAS61F
         DqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=rSoN9hjSxRIhqadFC45zbU01lHdfo22WQmk7pgd6Hws=;
        b=l4Q9YNC+S49HgZ1wWtFsXHMjxUZPaQf22+qSHjk+yOOnjeH8SprF6U1Og8XEGFW/ET
         DWcNSOfFTZn3rKFQz7JXPG73M0RLRskLxFkuLJSNIbDelppte5g4KR3aJL5/WwTwK+Y+
         mNpC6e1kxrx6yw1hUEohFVmYaAVWIsXCpx/51RkKILHybDBwLQX03CUmwf+okEkrkgnv
         yZbxk0HCbz3MUSzy3JWSWkWSt23zICMuegUsnw2yDnC5yJO96PI/rCuJQ+g4S2EBG7WB
         nXr1jbVPYeUH8A1C7eZWteoheZ/JdgVtiR33K+lIrJzMWDChvNVoAliXDkOwwheU35x3
         AW7g==
X-Gm-Message-State: APjAAAXTfSJYUCciTca2zjO849PaTT9LEY8GINlPvsdKz1BEObSrbpUI
        B2CsJsW680WrWqpPmvpNPXepTmJVB4heJb2pXgAzMJXg6qHmJ+eYqQd5EsAx7AwIu9NfZZDPN/q
        ggDqix2tuz60WET6kW6plt8jrFMBxh86J5L+fLl92F2D5aDprS+kYdD+gZYsNZrDnKWU1
X-Google-Smtp-Source: APXvYqxk4KFT1/urykdUwXAUUrIOrOJ90FOZxCw0eG0M2t35QVYKP4uYumZj8QJToJlNkFrHMkA4MQ2byL8=
X-Received: by 2002:ae9:de87:: with SMTP id s129mr6887829qkf.485.1565168103384;
 Wed, 07 Aug 2019 01:55:03 -0700 (PDT)
Date:   Wed,  7 Aug 2019 10:52:31 +0200
In-Reply-To: <20190807085232.151260-1-darekm@google.com>
Message-Id: <20190807085232.151260-9-darekm@google.com>
Mime-Version: 1.0
References: <20190807085232.151260-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
Subject: [PATCH v5 8/9] drm: dw-hdmi: use cec_notifier_conn_(un)register
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Cc:     Dariusz Marcinkiewicz <darekm@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the new cec_notifier_conn_(un)register() functions to
(un)register the notifier for the HDMI connector, and fill in
the cec_connector_info.

Changes since v4:
	- typo fix
Changes since v2:
	- removed unnecessary NULL check before a call to
	cec_notifier_conn_unregister,
	- use cec_notifier_phys_addr_invalidate to invalidate physical
	address.
Changes since v1:
	Add memory barrier to make sure that the notifier
	becomes visible to the irq thread once it is fully
	constructed.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 36 ++++++++++++++---------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index ab7968c8f6a29..b7d0d9ad5f2f7 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2118,6 +2118,8 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
 	struct dw_hdmi *hdmi = bridge->driver_private;
 	struct drm_encoder *encoder = bridge->encoder;
 	struct drm_connector *connector = &hdmi->connector;
+	struct cec_connector_info conn_info;
+	struct cec_notifier *notifier;
 
 	connector->interlace_allowed = 1;
 	connector->polled = DRM_CONNECTOR_POLL_HPD;
@@ -2129,6 +2131,18 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
 
 	drm_connector_attach_encoder(connector, encoder);
 
+	cec_fill_conn_info_from_drm(&conn_info, connector);
+
+	notifier = cec_notifier_conn_register(hdmi->dev, NULL, &conn_info);
+	if (!notifier)
+		return -ENOMEM;
+	/*
+	 * Make sure that dw_hdmi_irq thread does see the notifier
+	 * when it fully constructed.
+	 */
+	smp_wmb();
+	hdmi->cec_notifier = notifier;
+
 	return 0;
 }
 
@@ -2295,9 +2309,13 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 				       phy_stat & HDMI_PHY_HPD,
 				       phy_stat & HDMI_PHY_RX_SENSE);
 
-		if ((phy_stat & (HDMI_PHY_RX_SENSE | HDMI_PHY_HPD)) == 0)
-			cec_notifier_set_phys_addr(hdmi->cec_notifier,
-						   CEC_PHYS_ADDR_INVALID);
+		if ((phy_stat & (HDMI_PHY_RX_SENSE | HDMI_PHY_HPD)) == 0) {
+			struct cec_notifier *notifier;
+
+			notifier = READ_ONCE(hdmi->cec_notifier);
+			if (notifier)
+				cec_notifier_phys_addr_invalidate(notifier);
+		}
 	}
 
 	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
@@ -2600,12 +2618,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
 	if (ret)
 		goto err_iahb;
 
-	hdmi->cec_notifier = cec_notifier_get(dev);
-	if (!hdmi->cec_notifier) {
-		ret = -ENOMEM;
-		goto err_iahb;
-	}
-
 	/*
 	 * To prevent overflows in HDMI_IH_FC_STAT2, set the clk regenerator
 	 * N and cts values before enabling phy
@@ -2693,9 +2705,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
 		hdmi->ddc = NULL;
 	}
 
-	if (hdmi->cec_notifier)
-		cec_notifier_put(hdmi->cec_notifier);
-
 	clk_disable_unprepare(hdmi->iahb_clk);
 	if (hdmi->cec_clk)
 		clk_disable_unprepare(hdmi->cec_clk);
@@ -2717,8 +2726,7 @@ static void __dw_hdmi_remove(struct dw_hdmi *hdmi)
 	/* Disable all interrupts */
 	hdmi_writeb(hdmi, ~0, HDMI_IH_MUTE_PHY_STAT0);
 
-	if (hdmi->cec_notifier)
-		cec_notifier_put(hdmi->cec_notifier);
+	cec_notifier_conn_unregister(hdmi->cec_notifier);
 
 	clk_disable_unprepare(hdmi->iahb_clk);
 	clk_disable_unprepare(hdmi->isfr_clk);
-- 
2.22.0.770.g0f2c4a37fd-goog

