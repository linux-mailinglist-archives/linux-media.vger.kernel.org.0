Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F1486A367
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 09:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731015AbfGPH7D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 03:59:03 -0400
Received: from mail-pg1-f202.google.com ([209.85.215.202]:38848 "EHLO
        mail-pg1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726465AbfGPH7D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 03:59:03 -0400
Received: by mail-pg1-f202.google.com with SMTP id w5so12146714pgs.5
        for <linux-media@vger.kernel.org>; Tue, 16 Jul 2019 00:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=2DumyVCzzaB3MQwtkeoHKm9gyaJLAkkzi+6ishqFPeg=;
        b=jI4HizKkZApNt1a1QrTk8EYDhTm4SE6CjAmLk1TxlUMaBVu4zrtgptF6HIrnK6AyKI
         m+g7qv256lwJLNijaGXJfe0dtW/E0NPmHHLjVgCnQ9WNhZCMeZR/+Khig/gnm8ywzUls
         mGN55SWM+Vf9mG38cjwXXiBddDxWqEg5Pjy5BxI+ROlmM0e9Ux4w1NSypQi/f+kQjUsZ
         F5JmfPR/2tuOqTdtC3g2J5qIm0M8810mWTaQrHjbr1epwXm8rubxfFe0yqGEe8/Tj8AJ
         Jc4DP2wvdJEAckdndrebXUn+6R3MUjcwGis1ho29vLDqaNUX2AWDIk9c7wSaTIvZYmef
         PSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=2DumyVCzzaB3MQwtkeoHKm9gyaJLAkkzi+6ishqFPeg=;
        b=WKi30//TDs+o4oOa0O32cPA8wq+N/nisjzQwnsPhe0UDZR8Avty560lV8DN6hK6zru
         wgdhx+cAWSodu+a5VqakRZLsRgm3O7YcB3c69PDgeX74YqhQUFhZw2nQR+IJPSnyNNdo
         GpAR8coRjLrNupg/mFuMUO0oxqNCJZeqevGwvdgN6xssk4W70Drx+X6duEbjbouqrBU9
         UIQVlMZ19eDaYY8uy9yANibas2Xq+30sz8k2gnsTuCE65ajzJtsT8OJVI6WxWlQvbZ5A
         U/8oQXytVptdYX3HHRZpXKjnKD6yhEGAOPU7KA3ZjlJvqSegRT4Kwqh1+TlPPmC7UB09
         nGmA==
X-Gm-Message-State: APjAAAXsMYy8vDduHKmck9f/gNW9AykucLTrA8ZxGDuzCeBU78Z8VLZ2
        8sJVRTGX+ziEopDI3+SB9togZKo70l0bktMsobY6OcF3lOgtOMV9XQmBRVx7j+c9ceMCsPP2ewT
        Bj+sym4gHRvbZtf0joaP8hJMY9Ljts/wzIgsMsvNY74Ln7g32hIAnl6KUkF1yevfkG/01
X-Google-Smtp-Source: APXvYqwCFgeyixuS84GW1P9B1yOuSmUklCviq8TMo9Qo3o+bRXoghai4bpiSv0iA5NCF2BHzW0ARJRtR4Bw=
X-Received: by 2002:a63:a1a:: with SMTP id 26mr31449662pgk.265.1563263942350;
 Tue, 16 Jul 2019 00:59:02 -0700 (PDT)
Date:   Tue, 16 Jul 2019 09:58:18 +0200
In-Reply-To: <20190716075820.260202-1-darekm@google.com>
Message-Id: <20190716075820.260202-8-darekm@google.com>
Mime-Version: 1.0
References: <20190716075820.260202-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
Subject: [PATCH v3 7/9] drm: tegra: use cec_notifier_conn_(un)register
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
 drivers/gpu/drm/tegra/output.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index 9c2b9dad55c30..ea92e72280868 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -80,6 +80,9 @@ tegra_output_connector_detect(struct drm_connector *connector, bool force)
 
 void tegra_output_connector_destroy(struct drm_connector *connector)
 {
+	struct tegra_output *output = connector_to_output(connector);
+
+	cec_notifier_conn_unregister(output->cec);
 	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
 }
@@ -174,18 +177,11 @@ int tegra_output_probe(struct tegra_output *output)
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
@@ -197,6 +193,7 @@ void tegra_output_remove(struct tegra_output *output)
 
 int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
 {
+	struct cec_connector_info conn_info;
 	int err;
 
 	if (output->panel) {
@@ -212,6 +209,13 @@ int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
 	if (gpio_is_valid(output->hpd_gpio))
 		enable_irq(output->hpd_irq);
 
+	cec_fill_conn_info_from_drm(&conn_info, &output->connector);
+
+	output->cec = cec_notifier_conn_register(output->dev, NULL, &conn_info);
+	if (!output->cec)
+		return -ENOMEM;
+
+
 	return 0;
 }
 
-- 
2.22.0.510.g264f2c817a-goog

