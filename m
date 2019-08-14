Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C71F8D12A
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 12:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbfHNKqI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 06:46:08 -0400
Received: from mail-vk1-f201.google.com ([209.85.221.201]:43902 "EHLO
        mail-vk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727466AbfHNKqH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 06:46:07 -0400
Received: by mail-vk1-f201.google.com with SMTP id s17so218155vkm.10
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2019 03:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ip9lF/U/ATkDBCN52xa8MDYElKkFg+n6UubAPvcwdoQ=;
        b=F2Wq7/qUI6063Ggfg3uy2V3WIYVkgW+HoapIrUNMvS/Au5Ol/B3SFcoj9sFM+0KgCc
         gQE4un4mzyXTwEQwzAcnUBqN9C+SR18fqVsQngsR7F4KNXrZvBjhZTdhpkxLn/izafXm
         BhC5HxllnxCQutzM3IO0JMWrPSAIlFmQslLTovcX2NXXe1wqmkL6r6wdgsBlpQILWXHo
         2ViQHXy2254GlWPNkq8h0euVbw3X1Y1tQ8euOn7iCvdz76QpJ24vR+Z94ANGtN9E/uwi
         W3fA0elafMMJGCcfZANHXF+xR8IoeRlkM0tMATTs0LOmj482BenDoUea4hWpgQ9uM/GA
         iH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ip9lF/U/ATkDBCN52xa8MDYElKkFg+n6UubAPvcwdoQ=;
        b=HNUbgn0I7VxZw81xf/Nwk25ewFaK7B232cIbkS0k47KE+l4oG49/2KCakavNtc/JG3
         +FI7MKvwGXF5x8+qzTeKdcpx7u57BzQQs6+2+SF/pck5Q+S8BADvoCahX4RjFVrCX5Ht
         CkFS2rwbP44uIbbn3QbLg+6TVzF6ja3vZB0V17+GFjjPYZ8AGmPnp2WswVdJppOz50Ge
         YWuiqAD4eZCvIaec8TzeT6zBn5NIoOu+c90Y/Jn+PdC+wO5ufgmwjNXkF4bDf0fyFy3r
         aFy6hsvVod/EDvan3FNke0Gi/QKhpYYzJszWC6ussMHWD+JohMmZ1qvLGgehw0gPFqOd
         EsjQ==
X-Gm-Message-State: APjAAAX7fZty1QdLGjAeYR+QL4WZOTVbv583TxI+EW5ZyYjDBmDu6V02
        FeCMZZ3ZFpIiW9xKaolmWgG8KuKfCUY=
X-Google-Smtp-Source: APXvYqwGg7hw59XwQ3AoqIYTskYl0MYRgXJ3/2BQi9vOdN3sJqPR7IXY8Z+n4jhAc2KsrudW5ux/QIYpifE=
X-Received: by 2002:a9f:31cb:: with SMTP id w11mr1312328uad.40.1565779566021;
 Wed, 14 Aug 2019 03:46:06 -0700 (PDT)
Date:   Wed, 14 Aug 2019 12:45:04 +0200
In-Reply-To: <20190814104520.6001-1-darekm@google.com>
Message-Id: <20190814104520.6001-7-darekm@google.com>
Mime-Version: 1.0
References: <20190814104520.6001-1-darekm@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v7 6/9] drm: sti: use cec_notifier_conn_(un)register
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Vincent Abriou <vincent.abriou@st.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
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
index 9862c322f0c4a..bd15902b825ad 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -1256,6 +1256,7 @@ static int sti_hdmi_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm_dev = data;
 	struct drm_encoder *encoder;
 	struct sti_hdmi_connector *connector;
+	struct cec_connector_info conn_info;
 	struct drm_connector *drm_connector;
 	struct drm_bridge *bridge;
 	int err;
@@ -1318,6 +1319,14 @@ static int sti_hdmi_bind(struct device *dev, struct device *master, void *data)
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
 
@@ -1331,6 +1340,9 @@ static int sti_hdmi_bind(struct device *dev, struct device *master, void *data)
 static void sti_hdmi_unbind(struct device *dev,
 		struct device *master, void *data)
 {
+	struct sti_hdmi *hdmi = dev_get_drvdata(dev);
+
+	cec_notifier_conn_unregister(hdmi->notifier);
 }
 
 static const struct component_ops sti_hdmi_ops = {
@@ -1436,10 +1448,6 @@ static int sti_hdmi_probe(struct platform_device *pdev)
 		goto release_adapter;
 	}
 
-	hdmi->notifier = cec_notifier_get(&pdev->dev);
-	if (!hdmi->notifier)
-		goto release_adapter;
-
 	hdmi->reset = devm_reset_control_get(dev, "hdmi");
 	/* Take hdmi out of reset */
 	if (!IS_ERR(hdmi->reset))
@@ -1459,14 +1467,11 @@ static int sti_hdmi_remove(struct platform_device *pdev)
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
2.23.0.rc1.153.gdeed80330f-goog

