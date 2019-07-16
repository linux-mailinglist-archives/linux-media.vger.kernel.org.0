Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 670EE6A369
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 09:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbfGPH7L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 03:59:11 -0400
Received: from mail-qt1-f202.google.com ([209.85.160.202]:56375 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727862AbfGPH7L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 03:59:11 -0400
Received: by mail-qt1-f202.google.com with SMTP id x11so12909524qto.23
        for <linux-media@vger.kernel.org>; Tue, 16 Jul 2019 00:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=LcyxD0jadNcdSb7X2PuAiJWDefUY+UWHf/7pqMNmvYo=;
        b=U77iCosxrsg3OgIkMic+Uau0MQaXSCb+1ncJPy1T/AX7fvlYvJnKs9xyuu+etzhOtJ
         KCcGE3XqEWllx7UX3tm/aV09a9YXPOIygZIPnUq5JtTRTcQ3qxLcBt0bT1PAqoHF+4t8
         ALC6lIrVe/TthFXDpW265auBuSPaP2ytNCplhcsjyEP6g76GOEsWogtMvepYo7+S85s9
         r6LHwBzukjOFXxAw2AV6gxfSJyxAN6MWkWfA95VHe3OXl+9u0UM9YVUNqnpza7q7NyKA
         pGFIfvM5g/4byANLaUioTN6jSuXYLDoc2JlRxSEeUKleWooEy/ASLH4jM6HU74TfC1R2
         vRJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=LcyxD0jadNcdSb7X2PuAiJWDefUY+UWHf/7pqMNmvYo=;
        b=UsrUvF5ttE1/4+SJIF4o7BUdEau0hr4bRCn55sk0GcEYlMJdxL/HUkYu62Toawzz6+
         leWhnvS2XItdNl8bMtGCxkMFp4p4TyS5a5Hit3gGOCCvTCaUbcW0usUuveTB6w71MzEM
         jTmY9Wte59sVVqke6wmUOdZJ8sSt4e7PL3XQqw9OuyMiin7KpMw64en+/d/40rohNyZy
         /V4mpXU1keVUWAUiYb9JwXWFZbsqGHs8/MBySTfsFYQzvQtjFdNWYCjVFCS/XUagerLn
         WujX0twm1QnN/uEX/gMurXqiHnrkdEUFkMneEX39YsY8Y3hd/eL7CZjJFuj4qYYdwGWo
         MULA==
X-Gm-Message-State: APjAAAU5IpRZSFTVYaYOMiFdKV1KAjPjEzCIQWY1MHJOIGXtcJQ8ST/i
        xEPeSSkQy5gkEGyN4rlIWhsgES3Agqi95LrYgDWsfIhPtceRElj1Ijz0nEyKy+N6gx/hK/ZNuav
        +4lse15y9sO8Umycb6HMDNq92M0NKoS2NjY2EZCvlOmF4lLRpDD7QaekaCTNhz+FSUsar
X-Google-Smtp-Source: APXvYqywgok42NUsewsRN+aIkY28P0KnyOf1vx4L3J7Jbx4kJXo6QY8bwUWKPeJnIuh2dy1zHvJ9qLxH2Cc=
X-Received: by 2002:a37:9944:: with SMTP id b65mr20950749qke.105.1563263949957;
 Tue, 16 Jul 2019 00:59:09 -0700 (PDT)
Date:   Tue, 16 Jul 2019 09:58:20 +0200
In-Reply-To: <20190716075820.260202-1-darekm@google.com>
Message-Id: <20190716075820.260202-10-darekm@google.com>
Mime-Version: 1.0
References: <20190716075820.260202-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
Subject: [PATCH v3 9/9] drm: exynos: exynos_hdmi: use cec_notifier_conn_(un)register
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
	- removed unnecessary call to invalidate phys address before
	deregistering the notifier,
	- use cec_notifier_phys_addr_invalidate instead of setting
	invalid address on a notifier.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 31 ++++++++++++++++------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 19c252f659dd0..5fd2551a93567 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -858,6 +858,10 @@ static enum drm_connector_status hdmi_detect(struct drm_connector *connector,
 
 static void hdmi_connector_destroy(struct drm_connector *connector)
 {
+	struct hdmi_context *hdata = connector_to_hdmi(connector);
+
+	cec_notifier_conn_unregister(hdata->notifier);
+
 	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
 }
@@ -941,6 +945,7 @@ static int hdmi_create_connector(struct drm_encoder *encoder)
 {
 	struct hdmi_context *hdata = encoder_to_hdmi(encoder);
 	struct drm_connector *connector = &hdata->connector;
+	struct cec_connector_info conn_info;
 	int ret;
 
 	connector->interlace_allowed = true;
@@ -963,6 +968,15 @@ static int hdmi_create_connector(struct drm_encoder *encoder)
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
 
@@ -1534,8 +1548,8 @@ static void hdmi_disable(struct drm_encoder *encoder)
 		 */
 		mutex_unlock(&hdata->mutex);
 		cancel_delayed_work(&hdata->hotplug_work);
-		cec_notifier_set_phys_addr(hdata->notifier,
-					   CEC_PHYS_ADDR_INVALID);
+		if (hdata->notifier)
+			cec_notifier_phys_addr_invalidate(hdata->notifier);
 		return;
 	}
 
@@ -2012,12 +2026,6 @@ static int hdmi_probe(struct platform_device *pdev)
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
@@ -2029,7 +2037,7 @@ static int hdmi_probe(struct platform_device *pdev)
 
 	ret = hdmi_register_audio_device(hdata);
 	if (ret)
-		goto err_notifier_put;
+		goto err_runtime_disable;
 
 	ret = component_add(&pdev->dev, &hdmi_component_ops);
 	if (ret)
@@ -2040,8 +2048,7 @@ static int hdmi_probe(struct platform_device *pdev)
 err_unregister_audio:
 	platform_device_unregister(hdata->audio.pdev);
 
-err_notifier_put:
-	cec_notifier_put(hdata->notifier);
+err_runtime_disable:
 	pm_runtime_disable(dev);
 
 err_hdmiphy:
@@ -2060,12 +2067,10 @@ static int hdmi_remove(struct platform_device *pdev)
 	struct hdmi_context *hdata = platform_get_drvdata(pdev);
 
 	cancel_delayed_work_sync(&hdata->hotplug_work);
-	cec_notifier_set_phys_addr(hdata->notifier, CEC_PHYS_ADDR_INVALID);
 
 	component_del(&pdev->dev, &hdmi_component_ops);
 	platform_device_unregister(hdata->audio.pdev);
 
-	cec_notifier_put(hdata->notifier);
 	pm_runtime_disable(&pdev->dev);
 
 	if (!IS_ERR(hdata->reg_hdmi_en))
-- 
2.22.0.510.g264f2c817a-goog

