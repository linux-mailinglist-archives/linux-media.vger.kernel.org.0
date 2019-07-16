Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3250F6A8BD
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 14:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732681AbfGPM2O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 08:28:14 -0400
Received: from mail-vk1-f202.google.com ([209.85.221.202]:52286 "EHLO
        mail-vk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728470AbfGPM2O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 08:28:14 -0400
Received: by mail-vk1-f202.google.com with SMTP id l186so9782553vke.19
        for <linux-media@vger.kernel.org>; Tue, 16 Jul 2019 05:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=zLnKA9KgudLK8KUe2S3pT9CbPlyxYTLlfzuTx+kcCmI=;
        b=KJsbh2orK2LyYfclvK88UN+T6aUxG6wJYt10S1aWn3SMhejuXvW+cXibV9OcPt0kjS
         kELCplEaZGqTJqLS5Ub20dR0XGLo/t0SQhPr0gVBmtB/7jkPxpV8at+35drC5KblHujY
         CSBLitwNekM779T/PBIpcDZ5waKRfEO+UkFiFIfukhfm1zWQNqjAj2UInjZq9S1/nw9b
         vwh07A/Z0YppA33762QpoWjpvj6bvGJgmKAgWwfPFVx23hibSV9B3ZKoV5Q68hfB4dYS
         Xh1Xceh/FRFdnznClVI8ZeHImcVFi4Tdzob7WfKNrOkOM50A000pdR0ONmaNQNQriroh
         o+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=zLnKA9KgudLK8KUe2S3pT9CbPlyxYTLlfzuTx+kcCmI=;
        b=ID1+OQ6WrEB0OZrEwch3aack+kiNQPWBSqO/T0lKHGHNgK74o0R8gK2gS9bIuTMFxn
         Zh267WP8RC5LdQQd8tmwQjpv4RzJ5B/fyJ0DR6LbL0xKGTM/J5PM9c6cDkf/nz0UAwLq
         MeYrNNLRTaK120rtF/49J63E21GDNl2DL6hjz6BW4rkIlQEIawN568tC/umfYI2gbHxV
         KgCZE1K+ainAOC7EbIQexwTw4i/+eu2zEzIk5aqoUl/E5mqZp1xsqA9Z2tgN604vnTF7
         q5g4uoG4hANPCRVUBz5ctLtIlW+R8X0BmTe/styFwgaBR4BY5sZHCE1aUpsgpU+7d3ms
         6Gng==
X-Gm-Message-State: APjAAAUNnNMcaL5cfVc2nvzqRJO87sKpokgpoHPoeo/LySzr5RG41vuc
        P2rH6024/W3oBi7RpfAzLvJXKukOawsjpbLrev7cdi/L4oQKYc965lAB9tQceJ0h67Eac5v1EFv
        Ct3sQ/RYiGgelfxp8UTIBFAwc37zm2lDpMPEKtFnQGrp5HBBRPPEA3xFdet0jkOVJAoK8
X-Google-Smtp-Source: APXvYqz6JqCoH2euzJ6VhbYChbVlJpeSQTkC74CH4EJZ63p28zn6y+zQfmwQGZCeMBIkbALCxpSpX9yCjDM=
X-Received: by 2002:a1f:3692:: with SMTP id d140mr11969357vka.88.1563280093037;
 Tue, 16 Jul 2019 05:28:13 -0700 (PDT)
Date:   Tue, 16 Jul 2019 14:27:15 +0200
In-Reply-To: <20190716122718.125993-1-darekm@google.com>
Message-Id: <20190716122718.125993-7-darekm@google.com>
Mime-Version: 1.0
References: <20190716122718.125993-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
Subject: [PATCH v4 6/9] drm: sti: use cec_notifier_conn_(un)register
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
2.22.0.510.g264f2c817a-goog

