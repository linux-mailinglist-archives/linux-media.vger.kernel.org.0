Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2125B6F4
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 10:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbfGAIhR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 04:37:17 -0400
Received: from mail-qk1-f201.google.com ([209.85.222.201]:49104 "EHLO
        mail-qk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727031AbfGAIhR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 04:37:17 -0400
Received: by mail-qk1-f201.google.com with SMTP id z13so12942746qka.15
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2019 01:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=EfMlx6GMADkFklKqS7hiXAa2QgRT6SlWNKz+Nt5DciY=;
        b=DeY+RKzH2vtJIGKcyhZhibKCPfSRMkc+2sL1VGV+m5lBGkHfvkKexsKIAqw+h7zXH6
         Yt+Re8nSQlVnxvdLBkVboGHQM0BSNP+eMHgz5w7rp0r/cx3HTDEY5MtdVNFKFsqfVkGV
         Gl+m9L4ewY99OsD70gZLxTApnDoIe7VvW7g9/2TB5RKN8lNnzz90oKRbWZjFIpTUg/Ti
         Jd7+KnduVNV7y6cSlAe5jR/ap9rgHqWTbh7yF7CzgQ6gC7e7IovZOjlBJcYpwO8AtijS
         obUsKab37+nLA9dy83DjFEtT3LLjvzkdRLJExSUr7XiALU4/WnsLAG1qyN+U9hPHGItb
         xp1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=EfMlx6GMADkFklKqS7hiXAa2QgRT6SlWNKz+Nt5DciY=;
        b=fkK0eWSHiIo29zgT7d/HYy0voOyB9BTjr3hoTpuE4F/j6khwHs2O4EJMZ2B94Y60Ja
         BMxBHgGpfD6Xvc0S6e3KdMAbdGbuvDRfJr2SNHkRAuWhkVWvfVdJade382Vm3bYe+BwW
         M2A2GOCSYTYpPZRmi2mhWnFzYm+OWbE2wHVHFGs0c+8pkqBiRxKwuXiD7qned2z8h0XT
         vBmLTOHbIouMl6JyCdr3jbSdUlMGE4grcylKqAdBmX7o3yeEl8igMklGWvpXvupQ4ZA9
         C6EeiQHsWj1eLxUslNqXp4kuiwshUHYnDAWcCV/vYaeiV/e7VOcbuA4iGTw+7KMpVIoE
         D4VA==
X-Gm-Message-State: APjAAAWDeu1X/lE3qyCX7uGFWVyZGmxUK+nzlqs4k/VWGrjzc68TnX1A
        GzCfqu2JTE4+rkV1OZ8KlX6XfbYNvXA0NRdlGs5BA2/fAshZKvLjqzIDYyoga/jTCCFJ+aDagnN
        /0IjA+KFuFbz86Hzub6/1mpHQri1xU3Vr7Okfg2akzKwtdGVukQ3nw8oHp63QCeqzudA3
X-Google-Smtp-Source: APXvYqzOzDQyBhSTTjZXsyqN1xrAwiJXXem3DPXOObC0dUtzCmYdLQDBVn5whKI73Hq86vMNsh9hFVnZ96w=
X-Received: by 2002:ac8:3f55:: with SMTP id w21mr19485782qtk.217.1561970236048;
 Mon, 01 Jul 2019 01:37:16 -0700 (PDT)
Date:   Mon,  1 Jul 2019 10:35:42 +0200
In-Reply-To: <20190701083545.74639-1-darekm@google.com>
Message-Id: <20190701083545.74639-3-darekm@google.com>
Mime-Version: 1.0
References: <20190701083545.74639-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH 2/5] drm: sti: use cec_notifier_conn_(un)register
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
(un)register the notifier for the HDMI connector, and fill
in the cec_connector_info.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
---
 drivers/gpu/drm/sti/sti_hdmi.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 6000df6249807..5519b0c397c72 100644
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
 
@@ -1323,6 +1332,10 @@ static int sti_hdmi_bind(struct device *dev, struct device *master, void *data)
 static void sti_hdmi_unbind(struct device *dev,
 		struct device *master, void *data)
 {
+	struct sti_hdmi *hdmi = dev_get_drvdata(dev);
+
+	cec_notifier_set_phys_addr(hdmi->notifier, CEC_PHYS_ADDR_INVALID);
+	cec_notifier_conn_unregister(hdmi->notifier);
 }
 
 static const struct component_ops sti_hdmi_ops = {
@@ -1428,10 +1441,6 @@ static int sti_hdmi_probe(struct platform_device *pdev)
 		goto release_adapter;
 	}
 
-	hdmi->notifier = cec_notifier_get(&pdev->dev);
-	if (!hdmi->notifier)
-		goto release_adapter;
-
 	hdmi->reset = devm_reset_control_get(dev, "hdmi");
 	/* Take hdmi out of reset */
 	if (!IS_ERR(hdmi->reset))
@@ -1451,14 +1460,11 @@ static int sti_hdmi_remove(struct platform_device *pdev)
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
2.22.0.410.gd8fdbe21b5-goog

