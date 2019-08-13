Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5ABDC8B62B
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 13:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728665AbfHMLEN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 07:04:13 -0400
Received: from mail-vk1-f202.google.com ([209.85.221.202]:51851 "EHLO
        mail-vk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbfHMLEN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 07:04:13 -0400
Received: by mail-vk1-f202.google.com with SMTP id s145so45366507vke.18
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2019 04:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=7PGacRYXVFsNBUaK9AFFTq+0n3dK1YSXmAGYlruF6gc=;
        b=kmTjua/WpkiMq8nHLEd+LjG0YWASE8dJy8v8DnjnQqJTFv/ip1x0XgtkDMWpTTy6Vu
         JmjhuBtQZS0wboasCWyAFpMs/HYXk/5ypvK2xWr699mfV4KLxHyTTFpc5NLRaAUy9ZVb
         09xFUN1d6+7JVLTL3TNM61eV33vnagLykDXXqMYp5hZ9kAOIchcfYZrpWsOdlXhDuEQf
         c4h6mkc1dUIB5OGoj6KQwqsRvSIXlTHimed7bvYENAz0v8az7SbA0Cf6TN9dh+X6+99l
         BzUQPyJV3qYFSbIPsuKMoq2LWYrn0SlY+qhBTtKxpUmnPjjPdUEWi6cu5zm7ql1p9oEX
         AwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=7PGacRYXVFsNBUaK9AFFTq+0n3dK1YSXmAGYlruF6gc=;
        b=TR6/aLQ+8ZFuYR8vvqvVnKDYUmkGF9CX5JMFZ8Y6d5mbAikC1Smsrg0hS0tGujpdbm
         QdkLUykgUUtpinMXCaLUiD/QGzS3n+ZfhQ1zb2Tk+sI8VcI3krb8qRq90KS6F2E9uxfL
         D/osFK0dDirV07UYlyhtGoG2myFaSM3QVeG9cwGjmA4Gpmod0AP/8qJPtvHfi9RITuKX
         2/cMk90LNh13xcrTMFdqwVEFj1rtW8AzojQsrHrZQioIvn/DUlDhsjguCskJh9kvLlh2
         KT77YRz2T/3kwd6G54rOrAHFFgG08uQXG4ie/b1Ur8wySz6DGoQGuuvD9v+k6WF0y++Z
         aenQ==
X-Gm-Message-State: APjAAAUJl7obTxmRnXgdqWzW3FzDaiQIq3igaRuREPbP1ss4S65jo9XL
        hrFLLP5fiKVGs3SIuu366uvdgBSSgeo=
X-Google-Smtp-Source: APXvYqyeQaoLuHS4lwvUuncTOZ0+P8t2+0nXHV4RbzHYhLOmVe7Ku4FbTLBE7VGYoUn20Yyj7SW3SjzIXg0=
X-Received: by 2002:a9f:326e:: with SMTP id y43mr1637980uad.4.1565694251963;
 Tue, 13 Aug 2019 04:04:11 -0700 (PDT)
Date:   Tue, 13 Aug 2019 13:02:39 +0200
In-Reply-To: <20190813110300.83025-1-darekm@google.com>
Message-Id: <20190813110300.83025-8-darekm@google.com>
Mime-Version: 1.0
References: <20190813110300.83025-1-darekm@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v6 7/8] drm: dw-hdmi: use cec_notifier_conn_(un)register
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
        Douglas Anderson <dianders@chromium.org>,
        open list <linux-kernel@vger.kernel.org>
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
Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 36 ++++++++++++++---------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 83b94b66e464e..c00184700bb9d 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2194,6 +2194,8 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
 	struct dw_hdmi *hdmi = bridge->driver_private;
 	struct drm_encoder *encoder = bridge->encoder;
 	struct drm_connector *connector = &hdmi->connector;
+	struct cec_connector_info conn_info;
+	struct cec_notifier *notifier;
 
 	connector->interlace_allowed = 1;
 	connector->polled = DRM_CONNECTOR_POLL_HPD;
@@ -2207,6 +2209,18 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
 
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
 
@@ -2373,9 +2387,13 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
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
@@ -2693,12 +2711,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
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
@@ -2796,9 +2808,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
 		hdmi->ddc = NULL;
 	}
 
-	if (hdmi->cec_notifier)
-		cec_notifier_put(hdmi->cec_notifier);
-
 	clk_disable_unprepare(hdmi->iahb_clk);
 	if (hdmi->cec_clk)
 		clk_disable_unprepare(hdmi->cec_clk);
@@ -2820,8 +2829,7 @@ static void __dw_hdmi_remove(struct dw_hdmi *hdmi)
 	/* Disable all interrupts */
 	hdmi_writeb(hdmi, ~0, HDMI_IH_MUTE_PHY_STAT0);
 
-	if (hdmi->cec_notifier)
-		cec_notifier_put(hdmi->cec_notifier);
+	cec_notifier_conn_unregister(hdmi->cec_notifier);
 
 	clk_disable_unprepare(hdmi->iahb_clk);
 	clk_disable_unprepare(hdmi->isfr_clk);
-- 
2.23.0.rc1.153.gdeed80330f-goog

