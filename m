Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46CA45BEEC
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 17:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729978AbfGAPAK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 11:00:10 -0400
Received: from mail-qt1-f201.google.com ([209.85.160.201]:52318 "EHLO
        mail-qt1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729918AbfGAPAJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 11:00:09 -0400
Received: by mail-qt1-f201.google.com with SMTP id d26so13605285qte.19
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2019 08:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=uSUpR5giPZ6f5Vog0+z8MCafn1RCLfEFGsWo/9Tl+YI=;
        b=QwWdlXgXEviYk3DXV0LQ5p/Fy3sKoCtjFNzOjh+2Ylz05hYkWbhvM0rEZyA0Lo7Q0y
         vwCVElpQo6nbEdrUM0BnlblBHWPN4OGukxMsPeU8dklk1qZy8gltF6ps0skyt6oN9+D6
         3/10Mc9f6jBHahKdg9J22QkWx8qLFHdR/geGtbGP2QeWOcU36E8ZBfFc4XRQ9rCc45v9
         mjciGBEjK7zUi14/0Jxjobg9YPrX+6J2LHRz1x3PY/E32/4NlmOE6bVQEhw11kqi9l0J
         kDusvqtOhGCKr0GUH/roQKYXxfN6C2NDRhqVXaVv82+D/vkNHKgCz2L7B2hcQ8bGmFCf
         JF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=uSUpR5giPZ6f5Vog0+z8MCafn1RCLfEFGsWo/9Tl+YI=;
        b=Rz1UMDAH6+pXE/wGhBYvtegNscsjQzHx4Pn45sAPVl5cM7TzTY6dEQslxZ1+4JQ2PM
         foGUCtKmAcARR6UN3VcYUa5XnPpRykiCs+ztxSQRxoaE+4mG8JQTx4etwIyYwj0gfFt0
         4soJS5Wd2H6CS/hEDO1HPvMsDPh6uwS1uj0sEyU2GJk120ZqG3IAQMWnlxHz/NfeHt/l
         wOc88RT4OIiygrEvqXLScbfVigbi5VrzkNrBt0v2cQKILFyKcTfTW5p31Z+2kuJwmSqv
         hZQLKpLrcvmSJy2lD9hT3LPx1gV+rAvoshl7B2kHols2I8HJmE0b4Awf6JdF2jHBzzwm
         J7rA==
X-Gm-Message-State: APjAAAWNeJ+AZwXNnojiNo+4Q2A/xZh4qYrbljHPt1Ns3cXwksQ50+Fm
        WVyRBcfW9s3btoWH1knyoioOIrQOiV/g3EE8XMDWOVKORp+i9SPxTkeFZwAT9mVdtR6J4fqcnvx
        tOn/x9SFy2b+v03n7lCIdtXsoWngUWpr663ylxTZKxBaAZFYIsj1tCdcflefzhDSSKcIg
X-Google-Smtp-Source: APXvYqxqDSgXqa/OdYMF2XAU99C4jaM4bVOHsEoDb21fFjKUrMof+5xp6ZyY9bJdDXL7276V1P5eeZ4z1EQ=
X-Received: by 2002:ac8:3f55:: with SMTP id w21mr20982780qtk.217.1561993208808;
 Mon, 01 Jul 2019 08:00:08 -0700 (PDT)
Date:   Mon,  1 Jul 2019 16:59:43 +0200
In-Reply-To: <20190701145944.214098-1-darekm@google.com>
Message-Id: <20190701145944.214098-5-darekm@google.com>
Mime-Version: 1.0
References: <20190701145944.214098-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v2 4/5] drm: dw-hdmi: use cec_notifier_conn_(un)register
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

Changes since v1:
	Add memory barrier to make sure that the notifier
	becomes visible to the irq thread once it is fully
	constructed.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 37 +++++++++++++++--------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index ab7968c8f6a29..c0f4eb3c12b18 100644
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
 
@@ -2295,9 +2309,15 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
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
+				cec_notifier_set_phys_addr(
+						notifer,
+						CEC_PHYS_ADDR_INVALID);
+		}
 	}
 
 	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
@@ -2600,12 +2620,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
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
@@ -2693,9 +2707,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
 		hdmi->ddc = NULL;
 	}
 
-	if (hdmi->cec_notifier)
-		cec_notifier_put(hdmi->cec_notifier);
-
 	clk_disable_unprepare(hdmi->iahb_clk);
 	if (hdmi->cec_clk)
 		clk_disable_unprepare(hdmi->cec_clk);
@@ -2718,7 +2729,7 @@ static void __dw_hdmi_remove(struct dw_hdmi *hdmi)
 	hdmi_writeb(hdmi, ~0, HDMI_IH_MUTE_PHY_STAT0);
 
 	if (hdmi->cec_notifier)
-		cec_notifier_put(hdmi->cec_notifier);
+		cec_notifier_conn_unregister(hdmi->cec_notifier);
 
 	clk_disable_unprepare(hdmi->iahb_clk);
 	clk_disable_unprepare(hdmi->isfr_clk);
-- 
2.22.0.410.gd8fdbe21b5-goog

