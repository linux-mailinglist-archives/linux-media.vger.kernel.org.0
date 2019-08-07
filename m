Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3BBD84843
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2019 10:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727642AbfHGIy5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Aug 2019 04:54:57 -0400
Received: from mail-qt1-f201.google.com ([209.85.160.201]:52287 "EHLO
        mail-qt1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbfHGIy5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Aug 2019 04:54:57 -0400
Received: by mail-qt1-f201.google.com with SMTP id d26so81695425qte.19
        for <linux-media@vger.kernel.org>; Wed, 07 Aug 2019 01:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=vs1a12otLFeV2MsjfkbwfxhNwOmJxVaDVrzJ3ex9GN0=;
        b=g6Jwa6gHxXTCrhx5mS6zWncGX1kP7YS0XEx/yW+U+9BahAt2ud9xQVxED8DgDE9Ohh
         MLh18AL3kQavBe3z+1eZekCF+7+5KPmf1c+EAmufagg5HThKb3k9bZt2CdQQJ6oxwL0A
         agGrlYFjTOqXXIHFyf7p+0i5J2THuYuXhQZ5GGar4DEpq7MFlaYBx17fNDUjAwAogmuk
         sXf+EZxRjkbfWeYZkVm2OxOJuJlmJAtVRpq6UpFW2MLzPii3CrApMQhdYoGEjSdaf8aD
         N7qDYW0celAc2s/s+7VnLjkv2S3qsmQwt9J4j4ttnDyIpwfNQT2T+YKAozIj6oqUpvZA
         gEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=vs1a12otLFeV2MsjfkbwfxhNwOmJxVaDVrzJ3ex9GN0=;
        b=puqHbbba7R2vB9ggrGeEqPLgadHcGCynPP4n43iPb6rcEe8+KW0S5cIm0r2Fh98p2W
         AAYkjwMfkuHZeUIb67cSJPAro652dwDFCc2AotZuG9iVoFHdv0VBFJMR9T4sLDJhV+pW
         L0aRTxL+GJxwjjoGFoQ+d0tL4SDqXX7AaN3fIBpGfYW8H+MwY4Y+V5vULw8JIikajbfH
         rcFlzWPR5sbrdMC4mrPPixBU0Hk6tp8oP9EGaY9heqZpH4eoebAz3xbiPxyMnx5kPzMo
         I1Wv1E3RrkcyF1S3HCn8f17/m4ZMJUNws0Xbyua3bKYwGeyJlUguIclRVdrhpSkMDFtz
         +BoQ==
X-Gm-Message-State: APjAAAUJUPxrzodirREKAUaxYPuyKe0mUbDVCh9gWQI21lmeceoy9QRY
        8ZuRKerKG+g+WYr4A/LXH3cKNxTpKGpH1KmXDyVuyTtKib1i+2+KHiMSh1K05+EBpj4zyfoFr4p
        ltlnOx61EbZhPw0sNFQhu1JTRDSVV7cAqtETUhPDTX8J4x2RTiGT/MWl9ZGfRtRLkYaof
X-Google-Smtp-Source: APXvYqwblvd9hqb20nELJN9NFJxuBq3p2Cf/2BRhMH1j1/EL/smobQJS0J7yADNJ52S3Un9PhhTaE113zOI=
X-Received: by 2002:a37:474b:: with SMTP id u72mr7378611qka.470.1565168095947;
 Wed, 07 Aug 2019 01:54:55 -0700 (PDT)
Date:   Wed,  7 Aug 2019 10:52:29 +0200
In-Reply-To: <20190807085232.151260-1-darekm@google.com>
Message-Id: <20190807085232.151260-7-darekm@google.com>
Mime-Version: 1.0
References: <20190807085232.151260-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
Subject: [PATCH v5 6/9] drm: sti: use cec_notifier_conn_(un)register
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Cc:     Dariusz Marcinkiewicz <darekm@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the new cec_notifier_conn_(un)register() functions to
(un)register the notifier for the HDMI connector, and fill
in the cec_connector_info.

Changes since v2:
	Don't invalidate physical address before unregistering the
	notifier.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
---
 drivers/gpu/drm/sti/sti_hdmi.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 6000df6249807..6de30c0eee9e1 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -1250,6 +1250,7 @@ static int sti_hdmi_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm_dev = data;
 	struct drm_encoder *encoder;
 	struct sti_hdmi_connector *connector;
+	struct cec_connector_info conn_info;
 	struct drm_connector *drm_connector;
 	struct drm_bridge *bridge;
 	int err;
@@ -1310,6 +1311,14 @@ static int sti_hdmi_bind(struct device *dev, struct device *master, void *data)
 		goto err_sysfs;
 	}
 
+	cec_fill_conn_info_from_drm(&conn_info, drm_connector);
+	hdmi->notifier = cec_notifier_conn_register(&hdmi->dev, NULL,
+						    &conn_info);
+	if (!hdmi->notifier) {
+		hdmi->drm_connector = NULL;
+		return -ENOMEM;
+	}
+
 	/* Enable default interrupts */
 	hdmi_write(hdmi, HDMI_DEFAULT_INT, HDMI_INT_EN);
 
@@ -1323,6 +1332,9 @@ static int sti_hdmi_bind(struct device *dev, struct device *master, void *data)
 static void sti_hdmi_unbind(struct device *dev,
 		struct device *master, void *data)
 {
+	struct sti_hdmi *hdmi = dev_get_drvdata(dev);
+
+	cec_notifier_conn_unregister(hdmi->notifier);
 }
 
 static const struct component_ops sti_hdmi_ops = {
@@ -1428,10 +1440,6 @@ static int sti_hdmi_probe(struct platform_device *pdev)
 		goto release_adapter;
 	}
 
-	hdmi->notifier = cec_notifier_get(&pdev->dev);
-	if (!hdmi->notifier)
-		goto release_adapter;
-
 	hdmi->reset = devm_reset_control_get(dev, "hdmi");
 	/* Take hdmi out of reset */
 	if (!IS_ERR(hdmi->reset))
@@ -1451,14 +1459,11 @@ static int sti_hdmi_remove(struct platform_device *pdev)
 {
 	struct sti_hdmi *hdmi = dev_get_drvdata(&pdev->dev);
 
-	cec_notifier_set_phys_addr(hdmi->notifier, CEC_PHYS_ADDR_INVALID);
-
 	i2c_put_adapter(hdmi->ddc_adapt);
 	if (hdmi->audio_pdev)
 		platform_device_unregister(hdmi->audio_pdev);
 	component_del(&pdev->dev, &sti_hdmi_ops);
 
-	cec_notifier_put(hdmi->notifier);
 	return 0;
 }
 
-- 
2.22.0.770.g0f2c4a37fd-goog

