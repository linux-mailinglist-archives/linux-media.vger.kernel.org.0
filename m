Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BBD75BEEB
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 17:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729976AbfGAPAG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 11:00:06 -0400
Received: from mail-ua1-f73.google.com ([209.85.222.73]:34257 "EHLO
        mail-ua1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729918AbfGAPAG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 11:00:06 -0400
Received: by mail-ua1-f73.google.com with SMTP id d16so477003uaq.1
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2019 08:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=IKkiC/lT0L1O6GfDiozfLquy2ieeWITZdP5/Q1/efTk=;
        b=ReAHtgdYdfvxDJIL1ITRMt5pswCTSi/5SJbhKvnPztuZInaD6pRrHBSAEV/NjIqVUn
         CzjPEfwizQsImtKLh7OjHLl3NaP6ThGEWi34WBjUCw+p23nparDlH9Ey9EmNrGg9c7hQ
         Apd18Pm4wwSULewQ7Pw6KM/22W9BEEfwFb5uursISzmXQ6KXs2sf1JF4VpYviCpX9iV9
         uJNBHXYPOPpch1nW45/1uiTl8ifRw51GGp8X6y+f7ACljzHWP7bDqiEurRTxbvxZJvhF
         bbK+JWj77Uel+FKCq99I9oZDNDBrX9+Wrs2AuM8EfYOxMgj14xXgiv2l9qzPhF20j+bz
         nFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=IKkiC/lT0L1O6GfDiozfLquy2ieeWITZdP5/Q1/efTk=;
        b=T+8zWJz8Q4oT8PBK0ixW1l9Lai0GoymWM6CsiHm2BDPTdJnoCwU6V6nwW1R8Fgjehd
         IawXA8XAn3zfe0/t9wEH5f73ELE/SVE5lk3zQlwKD9Yq6Lb00YOivLKFCluw+9U1JCxo
         o46Oye0qFdGMsU1Sxjy7jqb2yeFFFYvxqWdk0J/EZnrdns0Gpk/s4eJmR8IK6iUTh/uo
         O1G2wEZezh/GMrWGuM4LnV3zL91qD9nmf/7mHp9pgYzVE3iPWU0v4LqH+8pE5dGZxMwi
         pomV5LPR0TgswUOEAuLt4i6gm79OWSnSsr3NSD/SIqjwx9uo/NNCrmGkAC9v3en/OSnj
         hn1w==
X-Gm-Message-State: APjAAAXsaSZHXM0D5xVfDCaSKYeFlxXe4NgcWv22n75vdhwcgzQ3YgHa
        pdh40F+t4D8wEFmuQmQefeeX0yzgWIF2PO1+A9L+bGE4QlKtVFz9t95aCPMBwOqIw0z/tZJJhMS
        t/83ZiPH30HsI4JsBIt7ip7cbcAJXmbkkNskI7NbauWi1jHS+5eOR2N5I9PCH1knInbYa
X-Google-Smtp-Source: APXvYqwc/r9/xJTv5CL/wTOnfrs1a6Mo1/X7jTGSs25VIhm4UXWvzdfE2N357CUWt9FRZMdFDkQK2L+S6MI=
X-Received: by 2002:a1f:5945:: with SMTP id n66mr2797486vkb.58.1561993205068;
 Mon, 01 Jul 2019 08:00:05 -0700 (PDT)
Date:   Mon,  1 Jul 2019 16:59:42 +0200
In-Reply-To: <20190701145944.214098-1-darekm@google.com>
Message-Id: <20190701145944.214098-4-darekm@google.com>
Mime-Version: 1.0
References: <20190701145944.214098-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v2 3/5] drm: tegra: use cec_notifier_conn_(un)register
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

