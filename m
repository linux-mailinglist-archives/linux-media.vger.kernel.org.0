Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E04A5B6F6
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 10:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727913AbfGAIh1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 04:37:27 -0400
Received: from mail-qt1-f202.google.com ([209.85.160.202]:41446 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727031AbfGAIh1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 04:37:27 -0400
Received: by mail-qt1-f202.google.com with SMTP id e39so12766190qte.8
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2019 01:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=sLiPV1AVOgpgwctHm1KTevJg7+3hjqAHbwazx2lwr48=;
        b=GifNunia0TSUmFxUwwzlyEGs/KRdTCqBiO+Sq/cA5SPO/1mphdyAQ9p9cxNkYBi7Mu
         VoSq2ji/Y97I0YK5vwQWwlxzF9tmB1/OGVBzotB9rIS7g+pSJGk2SoFabdkc6Y4GsDLH
         9u/pc6CwF6QDTuZ9i91BK66CYA/+WHDNGJbxVLz4KSUSm7H1KcfchBXMGgpP4boKqmTT
         5DPMC452rkxDFYAfaHSqf++S4ysHmdliPpJQhCO0MS6nKRm7qbKaLKUIIMXyE+pl1Hek
         TkZcPswlq46wdB+39PEFjXLHRDO0VrfIzcYtDFuMOktM3aHY6UrF4xFs8gQa62YnrJsL
         l6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=sLiPV1AVOgpgwctHm1KTevJg7+3hjqAHbwazx2lwr48=;
        b=qmDHWiy1BKJoI/VpbLVg7E8hRdWuIu+oyw8+Yl7MtQ9Vfy6iIUU/mu29h2vtRZJ/vD
         9llyKVCvyxHWZA1gKs3fewIRezVXGWJQjMvYwnG/RqKZwcnVtEhk+MTZEiyo8RX6/nce
         sLD7yXkKbu3djSpiL0WYczYrpIiGC4ElcXD9QF1sRsu0QPrDHCOyosKTGZSKddrlCe7u
         U0XNfuuVRZvO5rjp//YdnST3q1X162TLJmI7BosHmlwXLTXEPdW9QEv4G/opp8Pbxlvr
         2Z8Txm+yQWT1K1SowdYMv38ujJEhI5TLRQoz1yhUZ3IRKyXKthHEuFijKn+uDotrC6Hq
         9D9g==
X-Gm-Message-State: APjAAAUCNgpSI8b4zMP6cnQQsKrEeSrsHrM548YglsZPBdrMThtkqFUM
        NJq+fY7kMI7p/RWMs904ggyQT8kYixP46jNnwVk/GhJ2fuJB4GgrjFrw5XHxm6D6rzFxTlM4OPK
        ZcKiEG1BgJgdOeePtUzIrWWCFQLH0KxORgqkHY6gn7OqA2xnjQOi0B25SzY2JgTjvrEz7
X-Google-Smtp-Source: APXvYqxabj7GcdYXcIA/cpib4fX4GuZTZtoLeoiF1YD5xz95rP6z/czYTkwkq02X1gJv7w/BoRkyD+AdCmI=
X-Received: by 2002:a0c:d7c7:: with SMTP id g7mr20272656qvj.171.1561970246389;
 Mon, 01 Jul 2019 01:37:26 -0700 (PDT)
Date:   Mon,  1 Jul 2019 10:35:44 +0200
In-Reply-To: <20190701083545.74639-1-darekm@google.com>
Message-Id: <20190701083545.74639-5-darekm@google.com>
Mime-Version: 1.0
References: <20190701083545.74639-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH 4/5] drm: dw-hdmi: use cec_notifier_conn_(un)register
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

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 32 ++++++++++++++---------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index ab7968c8f6a29..b0308ee08f2a1 100644
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
@@ -2129,6 +2131,13 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
 
 	drm_connector_attach_encoder(connector, encoder);
 
+	cec_fill_conn_info_from_drm(&conn_info, connector);
+
+	notifier = cec_notifier_conn_register(hdmi->dev, NULL, &conn_info);
+	if (!notifier)
+		return -ENOMEM;
+	WRITE_ONCE(hdmi->cec_notifier, notifier);
+
 	return 0;
 }
 
@@ -2295,9 +2304,15 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
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
@@ -2600,12 +2615,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
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
@@ -2693,9 +2702,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
 		hdmi->ddc = NULL;
 	}
 
-	if (hdmi->cec_notifier)
-		cec_notifier_put(hdmi->cec_notifier);
-
 	clk_disable_unprepare(hdmi->iahb_clk);
 	if (hdmi->cec_clk)
 		clk_disable_unprepare(hdmi->cec_clk);
@@ -2718,7 +2724,7 @@ static void __dw_hdmi_remove(struct dw_hdmi *hdmi)
 	hdmi_writeb(hdmi, ~0, HDMI_IH_MUTE_PHY_STAT0);
 
 	if (hdmi->cec_notifier)
-		cec_notifier_put(hdmi->cec_notifier);
+		cec_notifier_conn_unregister(hdmi->cec_notifier);
 
 	clk_disable_unprepare(hdmi->iahb_clk);
 	clk_disable_unprepare(hdmi->isfr_clk);
-- 
2.22.0.410.gd8fdbe21b5-goog

