Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B16E21AE1
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2019 17:45:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729166AbfEQPoL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 May 2019 11:44:11 -0400
Received: from mail-yw1-f74.google.com ([209.85.161.74]:47511 "EHLO
        mail-yw1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729162AbfEQPoJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 May 2019 11:44:09 -0400
Received: by mail-yw1-f74.google.com with SMTP id y18so6689604ywy.14
        for <linux-media@vger.kernel.org>; Fri, 17 May 2019 08:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=wkNj8nrBQch0pgYjgNwrinmc9R2Vprq5Sm4EzqzLojI=;
        b=ZxnnF88DTyeCBMhnS/4TBJmRYTvIDlxa1DuoZEAB28Zzf4KyL86j4UISEuXENXXD7+
         TiUKcpyN0FpHEirOrg49eKZGagGgEvAYgJjuRV+RzDuMzOU+t58yW0D2Nl3BkPoJt6HX
         knQbKOF75D80bFm/Rsvh1Q/OxZxR1NzYeL9AwwfJ+oDxAER25+EmKGwUTaxTAElJhbz6
         PVHP2+S7HQGet23E+2OVwJ3PFYYE3pQ3BiXAoYvOCsrV3QOO6+cpCPckIpejZJqkUff4
         9LHzxtZTuT6cn1gUyNBtUgqsVgLcgKzUd9udIfYaVNVWuV8TfY7OyRjDsJH6vHUkTLb8
         ZrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=wkNj8nrBQch0pgYjgNwrinmc9R2Vprq5Sm4EzqzLojI=;
        b=QvMX5ztnmg8hhEkVrnhwuLpA2PGcVOsMVCvL5wlBFC9l+eCm9fQwsuxhM59KcDOfHF
         PMybQAwoiORiADWGwcff6n8LSvXX3xcBG6w0SrdQiFq6hO+SYwgWPMzU9lZRkUBwh+jJ
         L3AZMRzCzz4VHwAgpQuBcO6M97KJ3u5rZrI2qNMimi+7+vghmNQhlvTFHvGm4amSTO2n
         EPoFpEVjeFt+Uk4C4gDeuIJ3tEYQODIZOy/3Dqh1ppcJyAhow8WORrNzXAgyD2qzTgIe
         O6rtaFugBpURbfYwDs8Ck2tTsz+EYN3WGp/d2g97lWcUe3Q0PbWOFzr6EHtTmKiiuj/y
         yVKg==
X-Gm-Message-State: APjAAAVh7XfkUoAiK0fexDOvgk4AKOjV0Ety4kpOfNAkb3wIUZ5WMhEO
        udxLYyv/oCIALPV3iDJL62sodvqq6hwzMeZ1+qblgGT8oTEL9Tve0CGkclxzBePDUdF/gcyOPQg
        uZhtnLxOpbJTOBeGhG1wzE4842LvGn4HGKugIzT8QRlbW/lKUuB/YjciB7JqDwc4LmqpS
X-Google-Smtp-Source: APXvYqyPR9tF2kCeNakflYeBBMFHwrN3XeyXHsZpm48XxXJrVP849EaFPjAsl+da9EHvHHX8GIjyu8TseI8=
X-Received: by 2002:a0d:eac5:: with SMTP id t188mr26818433ywe.12.1558107848841;
 Fri, 17 May 2019 08:44:08 -0700 (PDT)
Date:   Fri, 17 May 2019 17:42:55 +0200
In-Reply-To: <20190517154256.255696-1-darekm@google.com>
Message-Id: <20190517154256.255696-2-darekm@google.com>
Mime-Version: 1.0
References: <20190517154256.255696-1-darekm@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v6 2/3] drm/bridge: dw-hdmi: pass connector info to the CEC adapter
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     linux-media@vger.kernel.org, hans.verkuil@cisco.com,
        hverkuil@xs4all.nl
Cc:     linux-kernel@vger.kernel.org,
        Dariusz Marcinkiewicz <darekm@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch makes dw-hdmi pass DRM connector info to a respective
CEC adapter. In order to be able to do that it delays creation of
the dw-hdmi-cec platform device until DRM connector is initialized.

Requires testing.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c |  5 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.h |  2 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 82 +++++++++++--------
 3 files changed, 52 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
index 84fb7b6a0a5e0..cf879629e0726 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
@@ -232,6 +232,7 @@ static void dw_hdmi_cec_del(void *data)
 static int dw_hdmi_cec_probe(struct platform_device *pdev)
 {
 	struct dw_hdmi_cec_data *data = dev_get_platdata(&pdev->dev);
+	struct cec_connector_info conn_info;
 	struct dw_hdmi_cec *cec;
 	int ret;
 
@@ -258,10 +259,12 @@ static int dw_hdmi_cec_probe(struct platform_device *pdev)
 	dw_hdmi_write(cec, ~0, HDMI_IH_MUTE_CEC_STAT0);
 	dw_hdmi_write(cec, 0, HDMI_CEC_POLARITY);
 
+	cec_fill_connector_info(&conn_info, data->connector);
+
 	cec->adap = cec_allocate_adapter(&dw_hdmi_cec_ops, cec, "dw_hdmi",
 					 CEC_CAP_LOG_ADDRS | CEC_CAP_TRANSMIT |
 					 CEC_CAP_RC | CEC_CAP_PASSTHROUGH,
-					 CEC_MAX_LOG_ADDRS, NULL);
+					 CEC_MAX_LOG_ADDRS, &conn_info);
 	if (IS_ERR(cec->adap))
 		return PTR_ERR(cec->adap);
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.h
index cf4dc121a2c43..a2ac91ec845ed 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.h
@@ -1,6 +1,7 @@
 #ifndef DW_HDMI_CEC_H
 #define DW_HDMI_CEC_H
 
+struct drm_connector;
 struct dw_hdmi;
 
 struct dw_hdmi_cec_ops {
@@ -13,6 +14,7 @@ struct dw_hdmi_cec_ops {
 struct dw_hdmi_cec_data {
 	struct dw_hdmi *hdmi;
 	const struct dw_hdmi_cec_ops *ops;
+	const struct drm_connector *connector;
 	int irq;
 };
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index ab7968c8f6a29..1275cb74299a8 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -138,6 +138,8 @@ struct dw_hdmi {
 	struct drm_connector connector;
 	struct drm_bridge bridge;
 
+	int irq;
+
 	unsigned int version;
 
 	struct platform_device *audio;
@@ -189,6 +191,7 @@ struct dw_hdmi {
 	void (*enable_audio)(struct dw_hdmi *hdmi);
 	void (*disable_audio)(struct dw_hdmi *hdmi);
 
+	bool cec_configured;
 	struct cec_notifier *cec_notifier;
 };
 
@@ -2113,6 +2116,29 @@ static const struct drm_connector_helper_funcs dw_hdmi_connector_helper_funcs =
 	.get_modes = dw_hdmi_connector_get_modes,
 };
 
+static void dw_hdmi_cec_enable(struct dw_hdmi *hdmi)
+{
+	mutex_lock(&hdmi->mutex);
+	hdmi->mc_clkdis &= ~HDMI_MC_CLKDIS_CECCLK_DISABLE;
+	hdmi_writeb(hdmi, hdmi->mc_clkdis, HDMI_MC_CLKDIS);
+	mutex_unlock(&hdmi->mutex);
+}
+
+static void dw_hdmi_cec_disable(struct dw_hdmi *hdmi)
+{
+	mutex_lock(&hdmi->mutex);
+	hdmi->mc_clkdis |= HDMI_MC_CLKDIS_CECCLK_DISABLE;
+	hdmi_writeb(hdmi, hdmi->mc_clkdis, HDMI_MC_CLKDIS);
+	mutex_unlock(&hdmi->mutex);
+}
+
+static const struct dw_hdmi_cec_ops dw_hdmi_cec_ops = {
+	.write = hdmi_writeb,
+	.read = hdmi_readb,
+	.enable = dw_hdmi_cec_enable,
+	.disable = dw_hdmi_cec_disable,
+};
+
 static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
@@ -2129,6 +2155,23 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
 
 	drm_connector_attach_encoder(connector, encoder);
 
+	if (hdmi->cec_configured) {
+		struct platform_device_info pdevinfo;
+		struct dw_hdmi_cec_data cec;
+
+		cec.hdmi = hdmi;
+		cec.ops = &dw_hdmi_cec_ops;
+		cec.irq = hdmi->irq;
+		cec.connector = connector;
+
+		pdevinfo.name = "dw-hdmi-cec";
+		pdevinfo.data = &cec;
+		pdevinfo.size_data = sizeof(cec);
+		pdevinfo.dma_mask = 0;
+
+		hdmi->cec = platform_device_register_full(&pdevinfo);
+	}
+
 	return 0;
 }
 
@@ -2398,29 +2441,6 @@ static int dw_hdmi_detect_phy(struct dw_hdmi *hdmi)
 	return -ENODEV;
 }
 
-static void dw_hdmi_cec_enable(struct dw_hdmi *hdmi)
-{
-	mutex_lock(&hdmi->mutex);
-	hdmi->mc_clkdis &= ~HDMI_MC_CLKDIS_CECCLK_DISABLE;
-	hdmi_writeb(hdmi, hdmi->mc_clkdis, HDMI_MC_CLKDIS);
-	mutex_unlock(&hdmi->mutex);
-}
-
-static void dw_hdmi_cec_disable(struct dw_hdmi *hdmi)
-{
-	mutex_lock(&hdmi->mutex);
-	hdmi->mc_clkdis |= HDMI_MC_CLKDIS_CECCLK_DISABLE;
-	hdmi_writeb(hdmi, hdmi->mc_clkdis, HDMI_MC_CLKDIS);
-	mutex_unlock(&hdmi->mutex);
-}
-
-static const struct dw_hdmi_cec_ops dw_hdmi_cec_ops = {
-	.write = hdmi_writeb,
-	.read = hdmi_readb,
-	.enable = dw_hdmi_cec_enable,
-	.disable = dw_hdmi_cec_disable,
-};
-
 static const struct regmap_config hdmi_regmap_8bit_config = {
 	.reg_bits	= 32,
 	.val_bits	= 8,
@@ -2443,7 +2463,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
 	struct device_node *np = dev->of_node;
 	struct platform_device_info pdevinfo;
 	struct device_node *ddc_node;
-	struct dw_hdmi_cec_data cec;
 	struct dw_hdmi *hdmi;
 	struct resource *iores = NULL;
 	int irq;
@@ -2593,6 +2612,7 @@ __dw_hdmi_probe(struct platform_device *pdev,
 		ret = irq;
 		goto err_iahb;
 	}
+	hdmi->irq = irq;
 
 	ret = devm_request_threaded_irq(dev, irq, dw_hdmi_hardirq,
 					dw_hdmi_irq, IRQF_SHARED,
@@ -2668,18 +2688,8 @@ __dw_hdmi_probe(struct platform_device *pdev,
 		hdmi->audio = platform_device_register_full(&pdevinfo);
 	}
 
-	if (config0 & HDMI_CONFIG0_CEC) {
-		cec.hdmi = hdmi;
-		cec.ops = &dw_hdmi_cec_ops;
-		cec.irq = irq;
-
-		pdevinfo.name = "dw-hdmi-cec";
-		pdevinfo.data = &cec;
-		pdevinfo.size_data = sizeof(cec);
-		pdevinfo.dma_mask = 0;
-
-		hdmi->cec = platform_device_register_full(&pdevinfo);
-	}
+	if (config0 & HDMI_CONFIG0_CEC)
+		hdmi->cec_configured = true;
 
 	/* Reset HDMI DDC I2C master controller and mute I2CM interrupts */
 	if (hdmi->i2c)
-- 
2.18.1

