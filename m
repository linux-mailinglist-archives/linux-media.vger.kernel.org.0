Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B57BE208F0
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 16:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbfEPOAm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 10:00:42 -0400
Received: from mail-vk1-f201.google.com ([209.85.221.201]:55565 "EHLO
        mail-vk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727808AbfEPOAl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 10:00:41 -0400
Received: by mail-vk1-f201.google.com with SMTP id r11so1245322vkl.22
        for <linux-media@vger.kernel.org>; Thu, 16 May 2019 07:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=rlRVknlZU7qYpUcxId0/VutlDA2ELBhIWtuAFSYl26U=;
        b=W/tfpJ46pm6QwaEsnL+ks8gRef5r8nf2B7dUTibUg/joOKC1EXfGHPltFpIwbVPU9v
         TBi+fnSwOkLvw7FzES/V0KLSXqhV+MC58kUWaVGqWAtcz0p5qDde0U+iA9vX84D+2sjp
         OWFgPDghIPEHlYjiZrU58wH21GXVNplgPUMeZT1N9gV0WjtY8I1sqCEzlxKNWv/BeBUc
         C8EhUu7EN1/JirLH4YBUHjQ/9US8Gx/KphuXRUUbx24XcF6uPyvLsslL1+CrYu9e0b4y
         VmcgF1DroAo1yJD+zY+C634qxRbld2c6PNMYlHs/wZ4Oz0LHwtL2X8/DLImc2Vine3xZ
         nwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=rlRVknlZU7qYpUcxId0/VutlDA2ELBhIWtuAFSYl26U=;
        b=YJ/Xdku9oG7dMb+DO/VZYdGTvNEY3CpQgIE/AbSN2prmqBsup4MsOj5Au6lB+pHCql
         6ePxChKKySMP6/j3wl2UeskqvdSCtN8tNsAm8/zB8m+Syw2S2AwDPuD0gpb4+ivkkw/a
         Epdg0a3W7n2paLIvQsteSAoJEbqV7DU2Mm01d/opDK4JMHx+Bbng8py1auVnNBu2J4ZZ
         fFkiazCkjs5EK5F2yYp2Yto3LIivIVfz8n6LfzRUQ8FhyE+Mpfc6ObtxnudbmLQMKmwQ
         seXxOAQtBDqN/Qsz9dMH4HEP++j/49NUxNjQeqNJr3sB2RTMxRKb50NgRaM2rRREx6vQ
         wQug==
X-Gm-Message-State: APjAAAUih2zRIxFgSKwdphHSm7MEcx/D/+TEGjNgcn90qn2Nb+kh1nJO
        Evmd45K1gQult4U61cCB8h5LqjlimTCMGzbGxEUwS0j98EfE9thmmHZJ3suymqbKSb4Q1cgNuFU
        +gFHpbB1so5NslRykeZc2beNJU067ap5e7QsjKtU2aue49Uw+IZJlzoQv/Mkeuk0uCbi9
X-Google-Smtp-Source: APXvYqwBfop0sVMYzVgicTJbUQL+4IOtu+mUxtXvxjLYIa8tDZ5zzlW2t2aIKr249ZniIeEVl/xOiRgLgck=
X-Received: by 2002:a67:8042:: with SMTP id b63mr23047683vsd.202.1558015240438;
 Thu, 16 May 2019 07:00:40 -0700 (PDT)
Date:   Thu, 16 May 2019 16:00:19 +0200
In-Reply-To: <20190516140020.200105-1-darekm@google.com>
Message-Id: <20190516140020.200105-2-darekm@google.com>
Mime-Version: 1.0
References: <20190516140020.200105-1-darekm@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v5 2/3] drm/bridge: dw-hdmi: pass connector info to the CEC adapter
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
index db761329a1e3e..6aaf0a7db9818 100644
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
 
@@ -2105,6 +2108,29 @@ static const struct drm_connector_helper_funcs dw_hdmi_connector_helper_funcs =
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
@@ -2121,6 +2147,23 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
 
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
 
@@ -2390,29 +2433,6 @@ static int dw_hdmi_detect_phy(struct dw_hdmi *hdmi)
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
@@ -2435,7 +2455,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
 	struct device_node *np = dev->of_node;
 	struct platform_device_info pdevinfo;
 	struct device_node *ddc_node;
-	struct dw_hdmi_cec_data cec;
 	struct dw_hdmi *hdmi;
 	struct resource *iores = NULL;
 	int irq;
@@ -2585,6 +2604,7 @@ __dw_hdmi_probe(struct platform_device *pdev,
 		ret = irq;
 		goto err_iahb;
 	}
+	hdmi->irq = irq;
 
 	ret = devm_request_threaded_irq(dev, irq, dw_hdmi_hardirq,
 					dw_hdmi_irq, IRQF_SHARED,
@@ -2660,18 +2680,8 @@ __dw_hdmi_probe(struct platform_device *pdev,
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

