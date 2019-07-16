Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE0E76A368
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 09:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731042AbfGPH7H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 03:59:07 -0400
Received: from mail-yw1-f74.google.com ([209.85.161.74]:43688 "EHLO
        mail-yw1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726465AbfGPH7H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 03:59:07 -0400
Received: by mail-yw1-f74.google.com with SMTP id b188so15480947ywb.10
        for <linux-media@vger.kernel.org>; Tue, 16 Jul 2019 00:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=T8TalvmLrtZ0fzDRhYayjujQxy4L4gy0LZKADKi+6tE=;
        b=GGytpziiJqb6dHQuAs1KJaAXycwvDOr87Z/yhd8DewdUAdfC50RsVsXf56sB5de0zK
         OBx359g7oU3CkWKe0DouhO4bKjagDjVdFk93YPrdvxx8nVdO894dsGQiD34gZrx7iDaC
         o9p57plXDC4xc8kb4owlBvDc0CkV6qX5AHuLM/6G22jp6/lHGDs/bkFisSNju6Av7Cv6
         sXaY1wjJ8UF0FLGvTOBOWzNboiXHl7KxwZNz03t5y5Vv9LmYm2laqTdWzafZQW84jwmU
         2QgytGqtAWyK3SbRwbkcEKkV49/bBBvai/7OuEq5v/pviA+RCa4/fpMO1c1quxAmJ2Az
         8x/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=T8TalvmLrtZ0fzDRhYayjujQxy4L4gy0LZKADKi+6tE=;
        b=W0uJGUJ2xOgIKxkIRPoDCdYMUwvoiYyLmS8bLXOu3I9RCj57J4Z6hvpxO6NHb9ePX7
         Sz9BBZ+GIMaVTAdpGnmf6iXLKGTK28CeJ3M+Hfgt3qVT4C8WB/P30v3fNyMK2U+VKiqQ
         vwseYNyq8cZ07oFyuoC2WfP2M3gFOTw2nam7nsrug1dUTXlGAn9i0FGMkQzs6x9KUX/v
         WLfQde+8qKJjEIRXmzQnuqh5UzlYwk/0shy36x49YMMv/cVDKTTc4H1NTeHSd6px3SGV
         /xCBTfm1WGL5SM1BC+Busatro21xSf7DEU6+VJx5qVjBJoF+w1615DrxwfdjbjSv3aIk
         KRXQ==
X-Gm-Message-State: APjAAAVntFiQbo9vNAP60kekLHR79PKCK1nFIaQag/n42L6Qo6XnmnfM
        4Zu9CTiQNw2t5OO+hlxxhWxkBZ6CdtTMCfE+JtIXdQGhxWwgKqHUgpOCgX1wplwP2PHljnPgeOp
        kIpBZrK3yBdFlMfSUdN1gFDblA9u1/R4o+q36DNedJmg3zgbKhFkXUYKLHtunuxDkYy2J
X-Google-Smtp-Source: APXvYqwK8aZhMf7FpkawYxaahFLBvjLt2oGwF/sHPu3k8FRm4aFxHel7UuSupek3WykwFkywcnrSvLMS0Co=
X-Received: by 2002:a0d:d410:: with SMTP id w16mr18242925ywd.125.1563263946379;
 Tue, 16 Jul 2019 00:59:06 -0700 (PDT)
Date:   Tue, 16 Jul 2019 09:58:19 +0200
In-Reply-To: <20190716075820.260202-1-darekm@google.com>
Message-Id: <20190716075820.260202-9-darekm@google.com>
Mime-Version: 1.0
References: <20190716075820.260202-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
Subject: [PATCH v3 8/9] drm: dw-hdmi: use cec_notifier_conn_(un)register
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
(un)register the notifier for the HDMI connector, and fill in
the cec_connector_info.

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
index ab7968c8f6a29..1e183af0e1ab1 100644
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
+			struct cec_notifier *notifer;
+
+			notifer = READ_ONCE(hdmi->cec_notifier);
+			if (notifer)
+				cec_notifier_phys_addr_invalidate(notifer);
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
2.22.0.510.g264f2c817a-goog

