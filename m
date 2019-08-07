Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B35A84846
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2019 10:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727727AbfHGIzI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Aug 2019 04:55:08 -0400
Received: from mail-vk1-f201.google.com ([209.85.221.201]:45345 "EHLO
        mail-vk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbfHGIzI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Aug 2019 04:55:08 -0400
Received: by mail-vk1-f201.google.com with SMTP id x83so38718173vkx.12
        for <linux-media@vger.kernel.org>; Wed, 07 Aug 2019 01:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=sT+6pc8yUdcgTGiP+s2HOeG1S7Q+0p5kuGHMT4qkvoY=;
        b=WKBf8ELbpGN9QA2Ux13ffiBX2ScZzfVlOxMq7xICtXIVMXzVs+cQ9U0JmIjqnUoktv
         ilRqBWv9exXEJrlE1ssJ5B5rxLkT1t3ynSxlIl0a2WsMMeJv88h8di+yH79Np83NUjir
         6NUDc0+kn0XVU7nemrmSXnlQq4OyYR0YoLhyPjUsEDEqiy9Ym2quU/1ztQLdqW8OcyOj
         aO4A/D0esSxEZjCFIr0/b9DGIvHVrOWiLq3W3QfIfbKL7/SwS2l/DyaHzBJENLbZ5MlG
         5hqeM3OeAIr/1400eXjSAS97DG/XzTl/4eKjzvfAF66SOYJGr4d5QTArh9NH4Kd00w8p
         BLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=sT+6pc8yUdcgTGiP+s2HOeG1S7Q+0p5kuGHMT4qkvoY=;
        b=AqlggOHpHivNnefJMU4MUFM4ARgpoO4p0KHyXbT7FXnOIp7XZP5d/WYjJF1vlyMKQf
         C8BQRZ8i6S8FW9F1z6pzdZnWZxjcKSCGYxLkWTOhOPiI13fpGnmN88XUwqdL2l2x3BRM
         tJmrAcEhxnogUCoCamGx9ee0uOqNjEoAwBSGSZHfOM3SNORNai+Lrp2UZSgyFjLmZ69A
         c8o202fGPSeJrHo60cJCdJnFyAo1zipImUv3NGUafoHRjU5C1MHhmsGGcioHaF6G9HPw
         HvAwRUAPgYlrNOmq9F9crmOSfz4Bl2nJoVplumoVFctaJ6CcgX43p4DBzS8WLCmoZI2i
         GBVw==
X-Gm-Message-State: APjAAAXSPME28kx+hVfsxxxVOUFPaiabgznloZ3vs1Kn2x8QzRKtqMzO
        79jDhR7raCtLWodZ+hG+iPyfW3+0gy9WLzMrbnox0tMho9j8lHkCoPYDbMLZafufh5xsX4WBFTF
        f9pknA5Rsmcg7KFbI25oCVmOpy90EneqPUr/sYr4sbl/iiBbXZQst+EqF7nJDKUp+zaxp
X-Google-Smtp-Source: APXvYqx9bmqCZ205X2vBtH8OCRXXfDuYkDDVaGrk8UwvZI16qhNyJ636Giur/4hr/yWJBNSDe3Xtn5BLdPM=
X-Received: by 2002:a1f:9f06:: with SMTP id i6mr794223vke.52.1565168107003;
 Wed, 07 Aug 2019 01:55:07 -0700 (PDT)
Date:   Wed,  7 Aug 2019 10:52:32 +0200
In-Reply-To: <20190807085232.151260-1-darekm@google.com>
Message-Id: <20190807085232.151260-10-darekm@google.com>
Mime-Version: 1.0
References: <20190807085232.151260-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
Subject: [PATCH v5 9/9] drm: exynos: exynos_hdmi: use cec_notifier_conn_(un)register
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
2.22.0.770.g0f2c4a37fd-goog

