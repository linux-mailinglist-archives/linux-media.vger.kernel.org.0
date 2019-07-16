Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7626A8BF
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 14:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733192AbfGPM2W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 08:28:22 -0400
Received: from mail-yw1-f73.google.com ([209.85.161.73]:44625 "EHLO
        mail-yw1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728470AbfGPM2V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 08:28:21 -0400
Received: by mail-yw1-f73.google.com with SMTP id l141so15953398ywc.11
        for <linux-media@vger.kernel.org>; Tue, 16 Jul 2019 05:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=T8TalvmLrtZ0fzDRhYayjujQxy4L4gy0LZKADKi+6tE=;
        b=KpZO6vnxGsix12qC5GYG5ya2j4U2BeieC1jfTivdYeK9V2Pf5TkgSycnmH2fvhXmPJ
         w5SR4xYA6quFbbuFVifOHHUnBN4rXznbpgde1TN4UOymiYvyViaGvxPMXF1moo8uB1X9
         ZGwOJnIAz+ef5P+ruxgib7JBmsw3L2IJ6LR6G/nB5nPF0cqEX8TnQw+WVNnI5upPITP6
         9VT8gRE58M+vMFztaewfAGnVOe1BiHTiXRQ6Yp8P90a2HuooR1T50E1vklNGyHk5y9Qb
         KyKwm9qQfHbj7f30/X9L2CYGqQnceEQRZYTfwqMJmUktrGyp2oQtrt9I3G6qbuEhleG2
         XrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=T8TalvmLrtZ0fzDRhYayjujQxy4L4gy0LZKADKi+6tE=;
        b=fr+1hAzujGPDy/OMp0Cor1HimVT8PeT8ZnimyeMuzOeYF8/HFPdTa+oqqum6MLLFCT
         GY3GCYeUXDM7WYWqWPY02Wu4sI84Nd7gbioRFBl9eK425nMc4wb3atfa2jtesPytOXkW
         LiX71EdbDkVtigfC4h+rJphEnEePXeRMCK73ImdRfYqHfOxSbq+rUJgxkvZ8+ssI0JIX
         4b8uq4sR6kEW9bkWO94an2cx37U627b4sbkd028dy2CTU4jUbV+UpzjiI9LndfsueGsP
         UzMlTmuS5+vNRWUgFpS2ddTILXnvVfEPt/i/PpPNLj2ewtEWllRCWnqjrX7mmlzr+XwI
         VIyA==
X-Gm-Message-State: APjAAAV0dKdM8KWtIsB8adJWzZ97C9bREzAwPJTyPrfmi+P0hSCfPwDa
        c/jxZ/soEkhY4zyYSdaA3ZSLK45fTIWWFVmT88Toomzk6gsej77OKDry9DGY14cGPI+WcGXYZOB
        MewRR9O7y6KFEhtHNx+AVN3DkNTmeSztbmwmt6xRmo8lqhrOWf1wpxTAt9CPYd6iHROqH
X-Google-Smtp-Source: APXvYqxKUE2RRCjqJx2Qsq4nX9XfQrlE674+nMl3rlp/olwFA//6Ff6OVECyOuO9RFtEPzgmBwM9TLSm/vE=
X-Received: by 2002:a25:5744:: with SMTP id l65mr14608470ybb.467.1563280100734;
 Tue, 16 Jul 2019 05:28:20 -0700 (PDT)
Date:   Tue, 16 Jul 2019 14:27:17 +0200
In-Reply-To: <20190716122718.125993-1-darekm@google.com>
Message-Id: <20190716122718.125993-9-darekm@google.com>
Mime-Version: 1.0
References: <20190716122718.125993-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
Subject: [PATCH v4 8/9] drm: dw-hdmi: use cec_notifier_conn_(un)register
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

