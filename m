Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E29E55B6F5
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 10:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727900AbfGAIhW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 04:37:22 -0400
Received: from mail-vs1-f73.google.com ([209.85.217.73]:38963 "EHLO
        mail-vs1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727031AbfGAIhW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 04:37:22 -0400
Received: by mail-vs1-f73.google.com with SMTP id p62so4225024vsd.6
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2019 01:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=IKkiC/lT0L1O6GfDiozfLquy2ieeWITZdP5/Q1/efTk=;
        b=DfRTQpsqHirjiENNwp7zCuVFuFyo17ymofsoCTurwlV9hrWIrD0iatN9bOojCunM4y
         zZuatM9pFIuNrMzRoCGSxMf3SRfgj+IGKMLwQ+2OOHzxTKDIC80Eo5cdnYaj5fka5qPu
         sHmGwiuPdYT5X0a0xqZPD9CQNKbLyxlq98GMZjzyGyBZEpS4P2N66Acng9tn2//wM+qI
         qWefnprAZIwGv3pRjnLlWSK6ISAkEgSUJvg8JWEoD012t41vExNLeC9RPqjdNXSmsgQW
         SL9M91oQiOIcqGxF31wmRMK2wRnRxMQvDK1X1UWkn+cuX1jH9yQfGiCx2jRGX969PAeB
         pHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=IKkiC/lT0L1O6GfDiozfLquy2ieeWITZdP5/Q1/efTk=;
        b=sOtytW84d/a8H/kCQjGYBaPT7dOwVjCeJXz1/j8dVHFL26sYDbWwMunbCY9GXdJJVM
         FbTflfXvVPutRRdbbPzY2JXjPcA9I1LVpNnKvzfiEH7nMSACB0E9pffgCfBBHx0XjV1T
         iIxH8UiebnuhFYC7d+Xbf6/tTKfXn0a0UWa6ux+C5rIL/b7RTJb483CMcA7FCaVavi/7
         u+Jt4t4q9nvNLcotjECTPbgfkm5yxe/reJBcgdPvVBDk5yKnstOG9HrRxTylwhKtUhcL
         U/SyGt9hdQ8DuUutUFy+dsNN61pr2alz/tWXrfsQ8E61uV6Jzn/LTJxG3Osi6+BgUuw1
         vjMw==
X-Gm-Message-State: APjAAAXoHnxynznyNdUEeHZxBeSw0tA5g0DKJA74XmAlrWxE0I1S7DmI
        G6upM+9lkDpUsRAooLeK3ca5fpn2YpMg2e7tQebLVuBL1/Hmowt/fhldAjEuiQiaYTLAGOO+RtE
        lt9NSEYC4RnSa9uGlhaRx7ogs9lHrNa8j/4/E9uGw1a6ffEEN/C+/FL/v12uhbwh4EO2f
X-Google-Smtp-Source: APXvYqyK6HCs1one223evEEzkK3W0L8EAF4yJfFCjt4kJwVCfi4+wA7Rhd6vEScNUHMnSpbON51PU1R4fp4=
X-Received: by 2002:a05:6102:85:: with SMTP id t5mr14361241vsp.221.1561970241280;
 Mon, 01 Jul 2019 01:37:21 -0700 (PDT)
Date:   Mon,  1 Jul 2019 10:35:43 +0200
In-Reply-To: <20190701083545.74639-1-darekm@google.com>
Message-Id: <20190701083545.74639-4-darekm@google.com>
Mime-Version: 1.0
References: <20190701083545.74639-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH 3/5] drm: tegra: use cec_notifier_conn_(un)register
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
2.22.0.410.gd8fdbe21b5-goog

