Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 855E86A8C0
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 14:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733302AbfGPM2Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 08:28:25 -0400
Received: from mail-qt1-f202.google.com ([209.85.160.202]:51804 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728470AbfGPM2Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 08:28:25 -0400
Received: by mail-qt1-f202.google.com with SMTP id m25so17786256qtn.18
        for <linux-media@vger.kernel.org>; Tue, 16 Jul 2019 05:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=LcyxD0jadNcdSb7X2PuAiJWDefUY+UWHf/7pqMNmvYo=;
        b=kIm2tvyac+/+nfEGaoZdJDLH85wtK0/fbcRtZ8b56gPR97iANMn5zSS1ihyogj9AX0
         Kx1l3LBg4pNcDOyhhPl5aE8JYaob7nzUPj4FR0O+jUtCq4wrXCJoM0MiKzNfVNKAX/XE
         J1MqydqecxA9ZbW5Ga3vf5loetymzCbCiitX0OM4QEK9h8h4FrQ8v7fAOCVQTBInZ+08
         aMt3Bxfdt+4vVEaGaO67oTa6S3U0Tae/TEa7kxEvRyfuaIcmDyD/tHdnXyU7Ha8Wjs77
         2QBcZaIH2wl1dECWZSUrzgU4sublZnW/+Fcon41kziBwfDNViyk9QIlDSw6M8Ibdv/mW
         INKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=LcyxD0jadNcdSb7X2PuAiJWDefUY+UWHf/7pqMNmvYo=;
        b=iTLo20oLwRhhA8vKPYOi/0AVyTJB0j3BEsMOqhqvbAkqNJEPm5GfxVspO4dYUq0hz5
         NgLwy0DfX4vYkyQdQe9N++AZA3kgI5YEcwtJEVrfWvQvNVJjs7QKLrzUD5bFAs4+rmmd
         do60LH1PTIOFzrQuzKx7NlvmuoJKifxynrVr8JGMU9gW8Sar1IR7Cc8P5mfFUsT8sIQA
         TroMvcgLHfkcGoFvU8OTG0WcpRwth/OAtvRWCBleKzB8NMrO2H5oWrbfOGpCE5uR2quE
         81eiSV5l+XcAH7zEqFqy0V987jRNIRv3Et1ed71UntnMarx8/phucgDsutv2E3QQzlUn
         DPcg==
X-Gm-Message-State: APjAAAUp0OLc/enE9YrDkb3CSHdtXqUPDpRCpBsn3AnNLRAA/MfU0pXv
        emFhWasZqh30Gi6In6yI7h5ZS1cuOixCoTHmsNrIZGx4io1ngf0XanUi7Cn8qaIjcEY7Yo5hSJB
        v5+WMkmWUPjTM2ZN48ZsM0EAuJpgQN/o3DoptkHHSTJWWkMng9sDva8GMKCt0jVhAq17/
X-Google-Smtp-Source: APXvYqwjt1TdUC43jBRhxNtW+XlUFeUr48vYYrtzuNw5HwS65QX9Td90PPprvPYZ9QCX/i/lZZYWFC414+Y=
X-Received: by 2002:a05:6214:153:: with SMTP id x19mr2657968qvs.158.1563280104595;
 Tue, 16 Jul 2019 05:28:24 -0700 (PDT)
Date:   Tue, 16 Jul 2019 14:27:18 +0200
In-Reply-To: <20190716122718.125993-1-darekm@google.com>
Message-Id: <20190716122718.125993-10-darekm@google.com>
Mime-Version: 1.0
References: <20190716122718.125993-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
Subject: [PATCH v4 9/9] drm: exynos: exynos_hdmi: use cec_notifier_conn_(un)register
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

