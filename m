Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB9335BEEA
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 17:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729974AbfGAPAC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 11:00:02 -0400
Received: from mail-vk1-f202.google.com ([209.85.221.202]:41338 "EHLO
        mail-vk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729918AbfGAPAC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 11:00:02 -0400
Received: by mail-vk1-f202.google.com with SMTP id r4so475141vkr.8
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2019 08:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=EfMlx6GMADkFklKqS7hiXAa2QgRT6SlWNKz+Nt5DciY=;
        b=KhCHMthuAa3Ad0fC5RQYAfqO4vZFXU+p9Evc2/ZXVYRwG+4VVDzwwQ8XjhOJAMNtvq
         jF49XK+Lj+cXtqLnpwieSOLPGFFOtUYiAVlgXFgNKIQd/5JUDci0BLUr0KXtJD4panui
         VWhIYBy0PpIiSV8gBgVB+Sh4SCHKdjIhhUvbE3Frj0gZ6cwaBc3I01hqOJDQYU+w6eY6
         nG9G3DJsDlGgsmXYq2VeF6zSNqUeXTDPlNemREzMJ4n0XP2+tXDVt+GkjRSQbFpueHaL
         i7beyOfCoeI80W9xfTe26GpWigyDzLPQf/P+19dwLMMNbr4uQiy1wZj4xSQd8vFxdCAm
         u8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=EfMlx6GMADkFklKqS7hiXAa2QgRT6SlWNKz+Nt5DciY=;
        b=N8JL9LzU7fdoL7DVZkRswKiaHoYOOCW176PeFKohTMhLOK+F3pSr9iRkbYOYk51QHy
         zLPLh7koySkt5R3wfLW1Wui+njhRig0EYQORE+bIwaVrTzvF/S5OT+GoDJU3qHKp8u5S
         q3LX0tGRKEZGQiAkTd7ZT2YArA6uYd4KlDukOg8vn0mnGcQxz1ivD0lwgTymPShU80HO
         9MsQ3RfKvw6LuwvdhlXuhLvMohujFD0b+7Cq0xaC3XA0EA0FbbW87X8i9QfLgH9gTke6
         bClXY0vNl1O2EN2+6WWoPSFlDnsAfVWn1HGR7UVzRyoTCUEcM81laNOCl/9d+KQNBvVM
         f/4g==
X-Gm-Message-State: APjAAAWTugKUGFh9airtKySN2WKnSx1S/AASCOdmxtWIdU8Sor5+Vl8i
        c910z7P7jBvhLp18WhLmnaYo4hIKrLojMdBBvl6Hf3WgM4Zhe3mlAwX9JpEQWC5ej738Lyd3ikw
        5/BRwxkchd2BwQ4KphF/uZPn3+Br076J5JAe4K5/SLSbf159KqhikFMqCu6XWhUFXE4Qr
X-Google-Smtp-Source: APXvYqyXNaDe0/ET/f8d2c9rBsu/yyjYgVpZOO626VVBWZjLJak9WCPtJTYaLg6qCJzp+WnOpdMcSU+zcKk=
X-Received: by 2002:a05:6102:105a:: with SMTP id h26mr15726249vsq.185.1561993201513;
 Mon, 01 Jul 2019 08:00:01 -0700 (PDT)
Date:   Mon,  1 Jul 2019 16:59:41 +0200
In-Reply-To: <20190701145944.214098-1-darekm@google.com>
Message-Id: <20190701145944.214098-3-darekm@google.com>
Mime-Version: 1.0
References: <20190701145944.214098-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v2 2/5] drm: sti: use cec_notifier_conn_(un)register
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

