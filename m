Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A63BA6A8BE
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 14:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733300AbfGPM2S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 08:28:18 -0400
Received: from mail-qk1-f201.google.com ([209.85.222.201]:37535 "EHLO
        mail-qk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728470AbfGPM2S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 08:28:18 -0400
Received: by mail-qk1-f201.google.com with SMTP id k13so16740553qkj.4
        for <linux-media@vger.kernel.org>; Tue, 16 Jul 2019 05:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=2DumyVCzzaB3MQwtkeoHKm9gyaJLAkkzi+6ishqFPeg=;
        b=SJ++/Ti9PPFavM2ItLAtAvvcfstmOio46YDlE3SvqL+/BIX8fcyV0tnIcuHkEQEdQL
         OQmV6Ijg5Se54V2IJc/xhAr6bg+OadhWRI/LIo3uYBhNK21olpG/SHyNJ7MJmHzK62Lu
         /A5bmdFlzqbFg4mlwTZAUADBdqdT+CB1vnIWFIW8bp2CzPBwwtG990suE8hHXuEYDeKS
         IocHuHCDT64VP4lEckJixgVeNNNgsp5PtTkOsYGn7vnBUSFTFnd3/0OKyPeY43mYg3/T
         ajDT0tIlZtve/we8WWWmz6RzKTmEKYQ4tTqCpixS5VZXE488o3pKnJGzs+ezgdjasKjc
         aNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=2DumyVCzzaB3MQwtkeoHKm9gyaJLAkkzi+6ishqFPeg=;
        b=MvDlgxoyBnRfculPMToCO5+ky13hL8m6tyKnPCbcmM8tBHqCFVl7nyF0PnXMX+55W2
         L0fdZBeqwP3wq3di4ebw7DFDsPSngRjJvBRVbY4wksR9MxXgKQ+abR1vKWXrtNwfUBpb
         KSInYhP6ZIr+e7LWBHwwUDvwGpOpIowetnYkfVZFeEkvoD2WV4OretWHFQo67k4Qi5CS
         67dShEKJCxCzY1V5bpwLMJ6sGQLYbKoQrg9tqjy+eNt3Cb+u/ViZavvv3WNCcxWK2oJg
         BeOcf7tH9lj0WDY2KpnP2EZ1T7tv6db41LIpMtRMarYDeeWkoKns7KNf0GvZLWEjeNCj
         kxUQ==
X-Gm-Message-State: APjAAAXbvOtIJWOpOWjvitJfFG/7CUw9lER/SvQCFTlPezQwb6itjW8v
        VBlhQhimutOY0gN3c3YWcXVWLnnWOOx5Fl8ZiCuWSfhNTAfc2hWNNGpUeEK9Kk6eAm7lBye0xxr
        YHnnlD2djPdGRZZPgfY41s/GhDmxzd2qR6kBXJU5Uh6CzrUdjtX1rDnARYEk5YLuUDS8r
X-Google-Smtp-Source: APXvYqywKZKS1VDswZjPBXsCxkchpujcdbXfau/GHC2N6ts5XT54aCya3/XtyWNBX4Co6IP5bCr7a7wfr14=
X-Received: by 2002:a37:ef18:: with SMTP id j24mr10463517qkk.293.1563280096861;
 Tue, 16 Jul 2019 05:28:16 -0700 (PDT)
Date:   Tue, 16 Jul 2019 14:27:16 +0200
In-Reply-To: <20190716122718.125993-1-darekm@google.com>
Message-Id: <20190716122718.125993-8-darekm@google.com>
Mime-Version: 1.0
References: <20190716122718.125993-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
Subject: [PATCH v4 7/9] drm: tegra: use cec_notifier_conn_(un)register
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

