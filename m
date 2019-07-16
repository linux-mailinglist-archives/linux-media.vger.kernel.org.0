Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99EE66A366
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 09:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731014AbfGPH67 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 03:58:59 -0400
Received: from mail-qk1-f202.google.com ([209.85.222.202]:50016 "EHLO
        mail-qk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbfGPH67 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 03:58:59 -0400
Received: by mail-qk1-f202.google.com with SMTP id l14so16099916qke.16
        for <linux-media@vger.kernel.org>; Tue, 16 Jul 2019 00:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=zLnKA9KgudLK8KUe2S3pT9CbPlyxYTLlfzuTx+kcCmI=;
        b=NkwKYQmX1X+EopVFbUS55AdzPtX+5yG2sH4L9Y9DnaOT0QMkejdR6qtLozWfB9EV++
         CIqgBr/JvnK4WsZc3SzVNXdvucZ+PSuJz4oY0D1Lc1LE4sLfl8Qe5pkxiacEE5FiSreq
         fLtcnOoliy4BbEUdIH6ceBJ1SHtbqyIUNoKwNXg2txVF9v7JBQ5NVJNZCeZKjFV2spyi
         eWcJyq0ZLTmYvj78alKvAHYPdkTz52E1LL8rBo1XViSPD2CgyHIKvJaEV4iA7kMkT+uY
         E9W17XLqhbbTMQ1RpF6iNdkgiGACW/ZMOEQdqV3LDSTvniUgQ3aW1pNEwECMlLobbylF
         mDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=zLnKA9KgudLK8KUe2S3pT9CbPlyxYTLlfzuTx+kcCmI=;
        b=sbkVWfr7gMbeqzhI0IwUeqR66gRNAKNIcYdX/NopbshJ08u7JpFUUQBAY6xiyreeuF
         +ExiJCzb8yIfLP0OFQgjsyfYMLthPAqcQOxyB2aJIRLkFGzsPFNrb/UTt36sy+jWJJnt
         +Mn+KS9hIX8NetombBfF6TTfzpB6UgsjeiYN69S046xmRMjkf+lxQZ2rhWL2dYBnEf7b
         xk6//0AZ6OgOio8qhfGJKdNVtYDsQMdC6ryi/xfzL50JMYBe4Ck4jIJ+75vZZX17PGvc
         SIYxdRedq+0MSFPgjFBVxQcYnYfM0Ay7JM4YRenlcjzybZXgRgG3vE7dJqMBn23eDa/8
         Mg1Q==
X-Gm-Message-State: APjAAAVsv00wut/AmbpyXwOvYADncIfjc2j7jTz2ZOIR6YGG8Wx7VO38
        HyyZGjmwGo98eiVnjVvZn4sySiZ4ASZl83FZGDW4nt+CqiBaUHAOkYrLQsay498MiyXu7DXKo8T
        h69pM/6UgwioL6bDKRILznnxfIuCQHaO+LbB/tQsmIxQoErPhmTtIbyOW7xAlFiiZKOCp
X-Google-Smtp-Source: APXvYqzwa7CqZQxo831nIATBLLVP9T7qh3/h1f2pyHuxQTcFnxEkp2uyaIsN3UMzNVBhjyfXEZ6isE0rU+Y=
X-Received: by 2002:a37:4d06:: with SMTP id a6mr20684878qkb.298.1563263938545;
 Tue, 16 Jul 2019 00:58:58 -0700 (PDT)
Date:   Tue, 16 Jul 2019 09:58:17 +0200
In-Reply-To: <20190716075820.260202-1-darekm@google.com>
Message-Id: <20190716075820.260202-7-darekm@google.com>
Mime-Version: 1.0
References: <20190716075820.260202-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
Subject: [PATCH v3 6/9] drm: sti: use cec_notifier_conn_(un)register
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

