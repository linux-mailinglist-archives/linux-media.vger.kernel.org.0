Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43B7A327A5
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 06:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbfFCEdp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 00:33:45 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:39687 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbfFCEdp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 00:33:45 -0400
Received: by mail-pg1-f196.google.com with SMTP id 196so7521610pgc.6
        for <linux-media@vger.kernel.org>; Sun, 02 Jun 2019 21:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MaZJTXi3Kb+zP1LdC2+ckQjoA/4H+fjgGV1LvJAeRMw=;
        b=kedjugWkJGjbZv4u3cVdp4XDkL/2UujV324hi4xDMTOTYbHYPbUnOtVV/E696ygI4t
         cYwfGz01X+eBCKlr5xigVC+q17FBxGkqMRIQmN2Tb9LkEM0x9vaOqC8GKJiYJv2aslY2
         TItexnk2xcMcs/1c/Ex771hoN5UH0dq13eh48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MaZJTXi3Kb+zP1LdC2+ckQjoA/4H+fjgGV1LvJAeRMw=;
        b=q6B4v5YatE73l+LOIVA/SgKTZxTLU2Hgw/8HFqz+gQ1O+axebDRNtYINeWdSUAJnPB
         LqxJtVl6LSYOefUwOaxteP014JCauCNtKqZhnDGb8/mr+EE4/PsssVwkyaKDRdo44fzQ
         HbWs04tBGWdU2EFmHBgTsy4IWaPL6wKX5ArQuAB8Fy1EnZ93BSQfmaNOqYc0gUtTXYIA
         T3AXC7RHi7D0Fm7rr0koiKXcfTNAlx7vCQmKdp5IUjlKyzV6/KO6P7z5RkYpPfyk0G5k
         8g7Hv5BUwarohTD4lDPTMkl/xDcws0abBgIAPesdzeMOho4U/YyZsSHvqEuEtsYzNV2I
         /4FA==
X-Gm-Message-State: APjAAAX8R+l3iJShLorbE61vAD0Og0JhoJRExCdK6t1tialcviWZTcHW
        PKd+gCbspH1UGHNIvJi4SPDt3A==
X-Google-Smtp-Source: APXvYqwQPHtm3t6nVseAhWV9BUbWtxWUQBMFPxBiyn3rh2KIclbVwhWbmFhQyEfEQ9mmHbprMFiaUg==
X-Received: by 2002:a17:90a:a789:: with SMTP id f9mr27039120pjq.20.1559536424466;
        Sun, 02 Jun 2019 21:33:44 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
        by smtp.gmail.com with ESMTPSA id m11sm10827627pjv.21.2019.06.02.21.33.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Jun 2019 21:33:43 -0700 (PDT)
From:   Cheng-Yi Chiang <cychiang@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, dianders@chromium.org,
        dgreid@chromium.org, tzungbi@chromium.org,
        linux-media@vger.kernel.org, alsa-devel@alsa-project.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [PATCH 3/7] drm/bridge/synopsys: dw-hdmi: Add HDMI notifier support
Date:   Mon,  3 Jun 2019 12:32:47 +0800
Message-Id: <20190603043251.226549-4-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190603043251.226549-1-cychiang@chromium.org>
References: <20190603043251.226549-1-cychiang@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use hdmi-notifier to notify codec driver that there is HDMI plug/unplug
event.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 drivers/gpu/drm/bridge/synopsys/Kconfig   |  1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 28 +++++++++++++++++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/Kconfig b/drivers/gpu/drm/bridge/synopsys/Kconfig
index 3cc53b44186e..43192d9d7357 100644
--- a/drivers/gpu/drm/bridge/synopsys/Kconfig
+++ b/drivers/gpu/drm/bridge/synopsys/Kconfig
@@ -3,6 +3,7 @@ config DRM_DW_HDMI
 	select DRM_KMS_HELPER
 	select REGMAP_MMIO
 	select CEC_CORE if CEC_NOTIFIER
+	select HDMI_NOTIFIERS
 
 config DRM_DW_HDMI_AHB_AUDIO
 	tristate "Synopsys Designware AHB Audio interface"
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index ab7968c8f6a2..53701921eb1f 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -17,6 +17,7 @@
 #include <linux/err.h>
 #include <linux/clk.h>
 #include <linux/hdmi.h>
+#include <linux/hdmi-notifier.h>
 #include <linux/mutex.h>
 #include <linux/of_device.h>
 #include <linux/regmap.h>
@@ -190,6 +191,7 @@ struct dw_hdmi {
 	void (*disable_audio)(struct dw_hdmi *hdmi);
 
 	struct cec_notifier *cec_notifier;
+	struct hdmi_notifier *hdmi_notifier;
 };
 
 #define HDMI_IH_PHY_STAT0_RX_SENSE \
@@ -2301,8 +2303,15 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 	}
 
 	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
-		dev_dbg(hdmi->dev, "EVENT=%s\n",
-			phy_int_pol & HDMI_PHY_HPD ? "plugin" : "plugout");
+		if (phy_int_pol & HDMI_PHY_HPD) {
+			dev_dbg(hdmi->dev, "EVENT=plugin\n");
+			if (hdmi->hdmi_notifier)
+				hdmi_event_connect(hdmi->hdmi_notifier);
+		} else {
+			dev_dbg(hdmi->dev, "EVENT=plugout\n");
+			if (hdmi->hdmi_notifier)
+				hdmi_event_disconnect(hdmi->hdmi_notifier);
+		}
 		if (hdmi->bridge.dev)
 			drm_helper_hpd_irq_event(hdmi->bridge.dev);
 	}
@@ -2606,6 +2615,12 @@ __dw_hdmi_probe(struct platform_device *pdev,
 		goto err_iahb;
 	}
 
+	hdmi->hdmi_notifier = hdmi_notifier_get(dev);
+	if (!hdmi->hdmi_notifier) {
+		ret = -ENOMEM;
+		goto err_iahb;
+	}
+
 	/*
 	 * To prevent overflows in HDMI_IH_FC_STAT2, set the clk regenerator
 	 * N and cts values before enabling phy
@@ -2696,6 +2711,9 @@ __dw_hdmi_probe(struct platform_device *pdev,
 	if (hdmi->cec_notifier)
 		cec_notifier_put(hdmi->cec_notifier);
 
+	if (hdmi->hdmi_notifier)
+		hdmi_notifier_put(hdmi->hdmi_notifier);
+
 	clk_disable_unprepare(hdmi->iahb_clk);
 	if (hdmi->cec_clk)
 		clk_disable_unprepare(hdmi->cec_clk);
@@ -2709,6 +2727,9 @@ __dw_hdmi_probe(struct platform_device *pdev,
 
 static void __dw_hdmi_remove(struct dw_hdmi *hdmi)
 {
+	if (hdmi->hdmi_notifier)
+		hdmi_event_disconnect(hdmi->hdmi_notifier);
+
 	if (hdmi->audio && !IS_ERR(hdmi->audio))
 		platform_device_unregister(hdmi->audio);
 	if (!IS_ERR(hdmi->cec))
@@ -2720,6 +2741,9 @@ static void __dw_hdmi_remove(struct dw_hdmi *hdmi)
 	if (hdmi->cec_notifier)
 		cec_notifier_put(hdmi->cec_notifier);
 
+	if (hdmi->hdmi_notifier)
+		hdmi_notifier_put(hdmi->hdmi_notifier);
+
 	clk_disable_unprepare(hdmi->iahb_clk);
 	clk_disable_unprepare(hdmi->isfr_clk);
 	if (hdmi->cec_clk)
-- 
2.22.0.rc1.257.g3120a18244-goog

