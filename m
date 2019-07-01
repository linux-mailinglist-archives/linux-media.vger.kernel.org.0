Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92DD55B6F7
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 10:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbfGAIhc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 04:37:32 -0400
Received: from mail-qk1-f202.google.com ([209.85.222.202]:53307 "EHLO
        mail-qk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727031AbfGAIhb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 04:37:31 -0400
Received: by mail-qk1-f202.google.com with SMTP id i196so12944960qke.20
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2019 01:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=buQLTpfF6p9rXhut4dFS9Vi4Inpy0Hljmi0yoKJO6eQ=;
        b=NQ/AuxfstC0A82BCO2emJVQSwRXWqwfvpMreMCJOSj3orWyy2Q6A/zIwHXkXtmB41u
         v5RjV/SxNbyk5qK3WgEqhcZqFRZdyxdRAR8dhgGQW1xMwW8xFaMCstsBtJOZ5u1s/wDL
         TMrfEQzENoj1TEbx972Ozm7OFcZzDZsmANgAWq1TPxzendtXk2X9oDTB1HmcoibasWHL
         /vagxE93EarQpEAn3Odbuc/l6to25P9rJFWf/ecVmviQCj86sFZLCL2ofFRPXtM+47Ka
         EkWFSadLIceuKOBxUKiRLdtsCAwE/2XG2TD8yvboGlfvn6vC1wZdChxTRqBrdl66CE/+
         BLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=buQLTpfF6p9rXhut4dFS9Vi4Inpy0Hljmi0yoKJO6eQ=;
        b=MhH2RAyAcHV6S7xNkYnymAk6ggIa2jUIhpoU/sOrp+M+HxDJLKlP/7BJMYeagJXdKx
         TqE3XlHejbCi3uplaDZ5z4d8lX3NRaCSOvYh+GYRFMCnM8TA/jf9imOcQAhCeJEKC1P6
         igrG6nDlbJQ/vMuWW9ipieQUm/9Kda0IHcD0JWxpyJyFm/hgtaCcHNKMtL7AlXh7WxGm
         g5WBDSicRpwzUDIjcVTgDkiqfZvTQrWDaitjnJlxhDo0ooVuck0aoeBOmrR92OdjAvml
         ME3AJfVDbCw3bxn7uB37O+7PVts9RcbLL5B+VRnho7HTXZsZbRZRsevQB9i1Je1FGMr5
         DTSA==
X-Gm-Message-State: APjAAAUmfsoKA1y0nXGMsl88xzY2hYKgXmjzNngPwPmE4jeri/ZNY+Sc
        Z1J8877DNAg/FTrzy2BqpbWWGIvxfzDnxuOEaEGIXGwTSdCAq3Kqg6w+WXbed3Z2bjOaPYdUJlS
        ma3qOEiJ3w3lviW7OBdmdFLAgYyyRBnZjouz/R5Kt1oKVNR67Hv35xy8UdVQxw1PM3qxl
X-Google-Smtp-Source: APXvYqzere3vueEqM0TOKn/++P8thrKZ/BjLh9lcmChFLtNB302e5u0pd72TF272D3H6YjqzVEJsqq1ezZ8=
X-Received: by 2002:a37:9a96:: with SMTP id c144mr18405712qke.468.1561970250955;
 Mon, 01 Jul 2019 01:37:30 -0700 (PDT)
Date:   Mon,  1 Jul 2019 10:35:45 +0200
In-Reply-To: <20190701083545.74639-1-darekm@google.com>
Message-Id: <20190701083545.74639-6-darekm@google.com>
Mime-Version: 1.0
References: <20190701083545.74639-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH 5/5] drm: exynos: exynos_hdmi: use cec_notifier_conn_(un)register
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

