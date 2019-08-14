Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 310958D12C
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 12:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727925AbfHNKqT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 06:46:19 -0400
Received: from mail-qk1-f201.google.com ([209.85.222.201]:46205 "EHLO
        mail-qk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727899AbfHNKqS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 06:46:18 -0400
Received: by mail-qk1-f201.google.com with SMTP id c79so99398027qkg.13
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2019 03:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Of6ed+SG6IaRF067LO6aebfGQ9pAYa64vgMYvUHNVMc=;
        b=Q4S02tkSwCa+AAL66y9IabaihDxTpB+CHn7R/Er11fsINdYMVHZwHUiT0c0BP5Fzhe
         cmdCxKM/Nnz/pGTTTOZKHNlTYyoefj0PNbkcziJqnndV6Xm1gEYrDQ4XF5SRuipUmaiY
         3vLR4+hMqyZS1eVZa6Uq0MFKVsT54qUcUYyofaaVwbyGmazjxICiUDxfelIp9z2ufBqL
         0xIbAjF0qwllvf9J7QANMWcv+l570obH0ZcOIETKnXcrjicphS4Fh5irJNnepNhVmXtX
         vBA4gOgRSZkgb0UUhQ7ZoWT1KnXxW1GUxDWFqLkdkoDkJUUpDQZf9GoSCR3ZH4NaS4QL
         Zlcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Of6ed+SG6IaRF067LO6aebfGQ9pAYa64vgMYvUHNVMc=;
        b=Fm7ZEiyw9vj7up207Y4K9Oh3OwyGwrkd6Ie0x85LYzsU6HC286fTbv6CGTur2LhDId
         yzPOg/KWIGpV2Gpzk6rHuRxgj9+pr77UZia5BX0sUdjw7RQEJ9Z8si20h41p/B/OX8ll
         IjNWZTCJhrHtSrKP2G5ECVI+Bny25cy0zAezusuNYYyU3xyOK5fw2sVvDRrfLcM6kkH0
         QumhSRtwbtvbKEqJRTvUkWvxeDpTpcAXL+0PI2n2JSUBWdgWhIfvk1AofexQpMTsT/qf
         o4dlp9lP9gBvIIQXOINRfwPLJuGs/181Wm8ZrS0KRya2ljrt0VQMc0kE7vEu2jzlwPoO
         sn7w==
X-Gm-Message-State: APjAAAWNnfdBjmtwSScEUCdfAuOW7Lugx4cIxj0fP6MpypGBXtkjakgA
        oDjX33+E5S1m0kydF6ejeYaEFo+k/Mg=
X-Google-Smtp-Source: APXvYqzRIDRZ2MlmouED+7HElSdB1DiQyMUAc5s2wc3KSNN39lyA3J65UQ3BVwSlBpRozPHTUNpk/Wsi8hk=
X-Received: by 2002:a37:9a0b:: with SMTP id c11mr38400400qke.204.1565779576568;
 Wed, 14 Aug 2019 03:46:16 -0700 (PDT)
Date:   Wed, 14 Aug 2019 12:45:06 +0200
In-Reply-To: <20190814104520.6001-1-darekm@google.com>
Message-Id: <20190814104520.6001-9-darekm@google.com>
Mime-Version: 1.0
References: <20190814104520.6001-1-darekm@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v7 8/9] drm: dw-hdmi: use cec_notifier_conn_(un)register
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sean Paul <seanpaul@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the new cec_notifier_conn_(un)register() functions to
(un)register the notifier for the HDMI connector, and fill in
the cec_connector_info.

Changes since v6:
        - move cec_notifier_conn_unregister to a bridge detach
	  function,
	- add a mutex protecting a CEC notifier.
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
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 45 +++++++++++++++--------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 83b94b66e464e..55162c9092f71 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -190,6 +190,7 @@ struct dw_hdmi {
 	void (*enable_audio)(struct dw_hdmi *hdmi);
 	void (*disable_audio)(struct dw_hdmi *hdmi);
 
+	struct mutex cec_notifier_mutex;
 	struct cec_notifier *cec_notifier;
 };
 
@@ -2194,6 +2195,8 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
 	struct dw_hdmi *hdmi = bridge->driver_private;
 	struct drm_encoder *encoder = bridge->encoder;
 	struct drm_connector *connector = &hdmi->connector;
+	struct cec_connector_info conn_info;
+	struct cec_notifier *notifier;
 
 	connector->interlace_allowed = 1;
 	connector->polled = DRM_CONNECTOR_POLL_HPD;
@@ -2207,9 +2210,29 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
 
 	drm_connector_attach_encoder(connector, encoder);
 
+	cec_fill_conn_info_from_drm(&conn_info, connector);
+
+	notifier = cec_notifier_conn_register(hdmi->dev, NULL, &conn_info);
+	if (!notifier)
+		return -ENOMEM;
+
+	mutex_lock(&hdmi->cec_notifier_mutex);
+	hdmi->cec_notifier = notifier;
+	mutex_unlock(&hdmi->cec_notifier_mutex);
+
 	return 0;
 }
 
+static void dw_hdmi_bridge_detach(struct drm_bridge *bridge)
+{
+	struct dw_hdmi *hdmi = bridge->driver_private;
+
+	mutex_lock(&hdmi->cec_notifier_mutex);
+	cec_notifier_conn_unregister(hdmi->cec_notifier);
+	hdmi->cec_notifier = NULL;
+	mutex_unlock(&hdmi->cec_notifier_mutex);
+}
+
 static enum drm_mode_status
 dw_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 			  const struct drm_display_mode *mode)
@@ -2266,6 +2289,7 @@ static void dw_hdmi_bridge_enable(struct drm_bridge *bridge)
 
 static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
 	.attach = dw_hdmi_bridge_attach,
+	.detach = dw_hdmi_bridge_detach,
 	.enable = dw_hdmi_bridge_enable,
 	.disable = dw_hdmi_bridge_disable,
 	.mode_set = dw_hdmi_bridge_mode_set,
@@ -2373,9 +2397,11 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 				       phy_stat & HDMI_PHY_HPD,
 				       phy_stat & HDMI_PHY_RX_SENSE);
 
-		if ((phy_stat & (HDMI_PHY_RX_SENSE | HDMI_PHY_HPD)) == 0)
-			cec_notifier_set_phys_addr(hdmi->cec_notifier,
-						   CEC_PHYS_ADDR_INVALID);
+		if ((phy_stat & (HDMI_PHY_RX_SENSE | HDMI_PHY_HPD)) == 0) {
+			mutex_lock(&hdmi->cec_notifier_mutex);
+			cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
+			mutex_unlock(&hdmi->cec_notifier_mutex);
+		}
 	}
 
 	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
@@ -2561,6 +2587,7 @@ __dw_hdmi_probe(struct platform_device *pdev,
 
 	mutex_init(&hdmi->mutex);
 	mutex_init(&hdmi->audio_mutex);
+	mutex_init(&hdmi->cec_notifier_mutex);
 	spin_lock_init(&hdmi->audio_lock);
 
 	ddc_node = of_parse_phandle(np, "ddc-i2c-bus", 0);
@@ -2693,12 +2720,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
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
@@ -2796,9 +2817,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
 		hdmi->ddc = NULL;
 	}
 
-	if (hdmi->cec_notifier)
-		cec_notifier_put(hdmi->cec_notifier);
-
 	clk_disable_unprepare(hdmi->iahb_clk);
 	if (hdmi->cec_clk)
 		clk_disable_unprepare(hdmi->cec_clk);
@@ -2820,9 +2838,6 @@ static void __dw_hdmi_remove(struct dw_hdmi *hdmi)
 	/* Disable all interrupts */
 	hdmi_writeb(hdmi, ~0, HDMI_IH_MUTE_PHY_STAT0);
 
-	if (hdmi->cec_notifier)
-		cec_notifier_put(hdmi->cec_notifier);
-
 	clk_disable_unprepare(hdmi->iahb_clk);
 	clk_disable_unprepare(hdmi->isfr_clk);
 	if (hdmi->cec_clk)
-- 
2.23.0.rc1.153.gdeed80330f-goog

