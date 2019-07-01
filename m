Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2E625BEED
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 17:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729980AbfGAPAN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 11:00:13 -0400
Received: from mail-qt1-f201.google.com ([209.85.160.201]:43515 "EHLO
        mail-qt1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729918AbfGAPAN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 11:00:13 -0400
Received: by mail-qt1-f201.google.com with SMTP id z16so13595865qto.10
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2019 08:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=buQLTpfF6p9rXhut4dFS9Vi4Inpy0Hljmi0yoKJO6eQ=;
        b=OnO8pTPr/Zn8PwdvlDhRBqQv50UZU32ZgljGzKXJ+zSp3FzLQGFn3YiINh/CkiI7NU
         ZMysOExljX6cjG0iOkD08yXZYy93qxQCLZy6U72AHVmR5hPVPp/QDTAFCA1D7fl9cRxT
         9FmPr4NtLr5/rYyNHFfhYLCuPTXeFYGp/9TQf3z+HM0hAu1//B9mnNoSGFVN8jkmCG/t
         WW9gC+3azMUf/Kx/dVbJU6/pXEB8u0NbPrFBoOkkMtKaSA5RU8d2F2FxqkyoCv5sLNhc
         V09s518Vm8yfYXV1QxZ7EBSF+hS6zjr6YVwC2I+GsJL2r4CQHYm0OOUOzKVpFnygvXzE
         v0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=buQLTpfF6p9rXhut4dFS9Vi4Inpy0Hljmi0yoKJO6eQ=;
        b=rmyHzdSZS4QsbPTv9rjm0PXbRyCEX8Y1V6jepTlC1neiMOhS+DYLu29WOCljVCJP4o
         0W2eN/eCitbyGDZZ5pOEklR/or9/7x7MJXWGtD/kGOBuXx92fqpbyT8wnphW/7Ll8IwF
         WL3XoEPh0lDIROkyot89fkOEcgHxjvrgI/H3bDaTRKol+as8p9ws9oMvBV+e2h+p8Tz+
         lmqdT86j7ZXZUq/SP5VpilVvKIbrs9QoXaOjo3My0Cy+5spSNKk6Gq2f1bmIgH5zfhIP
         dV1efNm/ueJUVUgJnlXiEtFhyxWIDQOEDUheOhFtwAHD8KTFO51bggQgRZui+HACWG15
         QRRw==
X-Gm-Message-State: APjAAAUKSUMYklUFVt/mcY7J58IWpK7tx6EA4gf8jfPy/GppA1rp9tOj
        djkT0xhZwgN7QMsj/QEq+xCL8BSTRzSqK9R/NQ68xLAe7eeMh2hJX3E2zeB9UX3e3BwWcn+AO9q
        nfu8GRNQLTFuP5JXXzj013bg5t2zs8I/8pmgv9t9g2gSPR0SlDytr+VWEmYBRtam0BurT
X-Google-Smtp-Source: APXvYqxH9lCO1A9LGuyelj5d3mQGTEGAUR7SNk7ojfxohFikT5en43p61dzjTTHuTau22sHrnUmqJ2P7qm0=
X-Received: by 2002:ae9:e80b:: with SMTP id a11mr20713779qkg.423.1561993212479;
 Mon, 01 Jul 2019 08:00:12 -0700 (PDT)
Date:   Mon,  1 Jul 2019 16:59:44 +0200
In-Reply-To: <20190701145944.214098-1-darekm@google.com>
Message-Id: <20190701145944.214098-6-darekm@google.com>
Mime-Version: 1.0
References: <20190701145944.214098-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v2 5/5] drm: exynos: exynos_hdmi: use cec_notifier_conn_(un)register
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
 drivers/gpu/drm/exynos/exynos_hdmi.c | 33 +++++++++++++++++-----------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 19c252f659dd0..dec4149435de1 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -858,6 +858,11 @@ static enum drm_connector_status hdmi_detect(struct drm_connector *connector,
 
 static void hdmi_connector_destroy(struct drm_connector *connector)
 {
+	struct hdmi_context *hdata = connector_to_hdmi(connector);
+
+	cec_notifier_set_phys_addr(hdata->notifier, CEC_PHYS_ADDR_INVALID);
+	cec_notifier_conn_unregister(hdata->notifier);
+
 	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
 }
@@ -941,6 +946,7 @@ static int hdmi_create_connector(struct drm_encoder *encoder)
 {
 	struct hdmi_context *hdata = encoder_to_hdmi(encoder);
 	struct drm_connector *connector = &hdata->connector;
+	struct cec_connector_info conn_info;
 	int ret;
 
 	connector->interlace_allowed = true;
@@ -963,6 +969,15 @@ static int hdmi_create_connector(struct drm_encoder *encoder)
 			DRM_DEV_ERROR(hdata->dev, "Failed to attach bridge\n");
 	}
 
+	cec_fill_conn_info_from_drm(&conn_info, connector);
+
+	hdata->notifier = cec_notifier_conn_register(hdata->dev, NULL,
+						     &conn_info);
+	if (hdata->notifier == NULL) {
+		ret = -ENOMEM;
+		DRM_DEV_ERROR(hdata->dev, "Failed to allocate CEC notifier\n");
+	}
+
 	return ret;
 }
 
@@ -1534,8 +1549,9 @@ static void hdmi_disable(struct drm_encoder *encoder)
 		 */
 		mutex_unlock(&hdata->mutex);
 		cancel_delayed_work(&hdata->hotplug_work);
-		cec_notifier_set_phys_addr(hdata->notifier,
-					   CEC_PHYS_ADDR_INVALID);
+		if (hdata->notifier)
+			cec_notifier_set_phys_addr(hdata->notifier,
+						   CEC_PHYS_ADDR_INVALID);
 		return;
 	}
 
@@ -2012,12 +2028,6 @@ static int hdmi_probe(struct platform_device *pdev)
 		}
 	}
 
-	hdata->notifier = cec_notifier_get(&pdev->dev);
-	if (hdata->notifier == NULL) {
-		ret = -ENOMEM;
-		goto err_hdmiphy;
-	}
-
 	pm_runtime_enable(dev);
 
 	audio_infoframe = &hdata->audio.infoframe;
@@ -2029,7 +2039,7 @@ static int hdmi_probe(struct platform_device *pdev)
 
 	ret = hdmi_register_audio_device(hdata);
 	if (ret)
-		goto err_notifier_put;
+		goto err_runtime_disable;
 
 	ret = component_add(&pdev->dev, &hdmi_component_ops);
 	if (ret)
@@ -2040,8 +2050,7 @@ static int hdmi_probe(struct platform_device *pdev)
 err_unregister_audio:
 	platform_device_unregister(hdata->audio.pdev);
 
-err_notifier_put:
-	cec_notifier_put(hdata->notifier);
+err_runtime_disable:
 	pm_runtime_disable(dev);
 
 err_hdmiphy:
@@ -2060,12 +2069,10 @@ static int hdmi_remove(struct platform_device *pdev)
 	struct hdmi_context *hdata = platform_get_drvdata(pdev);
 
 	cancel_delayed_work_sync(&hdata->hotplug_work);
-	cec_notifier_set_phys_addr(hdata->notifier, CEC_PHYS_ADDR_INVALID);
 
 	component_del(&pdev->dev, &hdmi_component_ops);
 	platform_device_unregister(hdata->audio.pdev);
 
-	cec_notifier_put(hdata->notifier);
 	pm_runtime_disable(&pdev->dev);
 
 	if (!IS_ERR(hdata->reg_hdmi_en))
-- 
2.22.0.410.gd8fdbe21b5-goog

