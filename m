Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E32A984844
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2019 10:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbfHGIzB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Aug 2019 04:55:01 -0400
Received: from mail-vk1-f201.google.com ([209.85.221.201]:35237 "EHLO
        mail-vk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbfHGIzA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Aug 2019 04:55:00 -0400
Received: by mail-vk1-f201.google.com with SMTP id g2so38986997vkl.2
        for <linux-media@vger.kernel.org>; Wed, 07 Aug 2019 01:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=r8K6LICfmoR0+5wTOuaiOzjtq+oGKszmcNUI42hpcms=;
        b=SLyqef9Q3HeDC0I6b77tXI/tMPRaoZY6/+vVU8rHuNnquqX1qvcqt+O9h0riXRmEYf
         Ym/yJrocjgp4DVP5EAlLfajZZG5r/vP+YtVWUOoRczRYXw6zHBl/5ujFsVk7nSvfIqch
         5vx9SDKc9D5Gd79LHWH6iW3T7Dp/TfxgPUiF5+k3dIMiKvFl/kNgpNk0iS0J4pCiAzky
         zuimAMrTrVe2JQFriccx2Kmi+R5YtsSeb+jrNpoLXmm+RvOUgA+Ne818ENqTGwuFQvPR
         VE06BfMvDWbxg7LvbEE3Z0n8aqj04tYdNkVWE4Ow1ieDUpq7YlFFnh5ivtkz68E8+xJc
         +Mfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=r8K6LICfmoR0+5wTOuaiOzjtq+oGKszmcNUI42hpcms=;
        b=berMpRshwFHOa6sPPiT6xBL4PZucqqdFMokxSaFnZtKiW9YWXtTRGnjaaH0ttLosBh
         TUuSdJOct1OEn70RZ7snaLE/RYNDQqKetMel6G6Ynce5JYDw0ldk1XTeACyBPimHuQUF
         pbL9Wp2H85cl3/ZRj9RhLQBHxBg1wO2DEL91m0PSddO8NjNscQF4FqyEdKm4GtDQ8LzA
         to4ebcV6MD9PSkqFAY4PA4BxHEhfKB24tfKpCTjqhg4R7JYHc4RauXl49+9IdAKGYxwO
         fcxlCpyKiKKJ5mwJbfSdwBZXbCXBN/4m2btF5VwNnMse011bHVp7naOpHjWzYN4OWPv6
         2CCw==
X-Gm-Message-State: APjAAAUMcR41qaD/7LvqywdfmX37rknqggaaFicUT1T1lV/mef04cOKJ
        ccWQDG/YBdkxYaltf9C8GGzJPC4Z9aSDRh9FV+EIpuTeKebic3rtDbUUgPqkC1osMFNvC+CF33n
        w7St1Fmns8SLIOlrFyXtPydK+87EZdvmdyGyXqcp+LBRtZJOqZpazjSKS9zncaI+2tId4
X-Google-Smtp-Source: APXvYqxlP0IUMjoX9jiPFMZh5NPu/yL62dH2jCIAouMNN2gM1HehFX84DS2w0i9udD+jxxvurNWrAJM1AOo=
X-Received: by 2002:a1f:8513:: with SMTP id h19mr2931500vkd.92.1565168099538;
 Wed, 07 Aug 2019 01:54:59 -0700 (PDT)
Date:   Wed,  7 Aug 2019 10:52:30 +0200
In-Reply-To: <20190807085232.151260-1-darekm@google.com>
Message-Id: <20190807085232.151260-8-darekm@google.com>
Mime-Version: 1.0
References: <20190807085232.151260-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
Subject: [PATCH v5 7/9] drm: tegra: use cec_notifier_conn_(un)register
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

Changes since v4:
	- only create a CEC notifier for HDMI connectors

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
---
 drivers/gpu/drm/tegra/output.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index 9c2b9dad55c30..13153b93626fd 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -80,6 +80,11 @@ tegra_output_connector_detect(struct drm_connector *connector, bool force)
 
 void tegra_output_connector_destroy(struct drm_connector *connector)
 {
+	struct tegra_output *output = connector_to_output(connector);
+
+	if (output->cec)
+		cec_notifier_conn_unregister(output->cec);
+
 	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
 }
@@ -174,18 +179,11 @@ int tegra_output_probe(struct tegra_output *output)
 		disable_irq(output->hpd_irq);
 	}
 
-	output->cec = cec_notifier_get(output->dev);
-	if (!output->cec)
-		return -ENOMEM;
-
 	return 0;
 }
 
 void tegra_output_remove(struct tegra_output *output)
 {
-	if (output->cec)
-		cec_notifier_put(output->cec);
-
 	if (gpio_is_valid(output->hpd_gpio)) {
 		free_irq(output->hpd_irq, output);
 		gpio_free(output->hpd_gpio);
@@ -197,6 +195,7 @@ void tegra_output_remove(struct tegra_output *output)
 
 int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
 {
+	int connector_type;
 	int err;
 
 	if (output->panel) {
@@ -212,6 +211,21 @@ int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
 	if (gpio_is_valid(output->hpd_gpio))
 		enable_irq(output->hpd_irq);
 
+	connector_type = output->connector.connector_type;
+	/*
+	 * Create a CEC notifier for HDMI connector.
+	 */
+	if (connector_type == DRM_MODE_CONNECTOR_HDMIA ||
+	    connector_type == DRM_MODE_CONNECTOR_HDMIB) {
+		struct cec_connector_info conn_info;
+
+		cec_fill_conn_info_from_drm(&conn_info, &output->connector);
+		output->cec = cec_notifier_conn_register(output->dev, NULL,
+							 &conn_info);
+		if (!output->cec)
+			return -ENOMEM;
+	}
+
 	return 0;
 }
 
-- 
2.22.0.770.g0f2c4a37fd-goog

