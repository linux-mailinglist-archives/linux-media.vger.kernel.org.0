Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0962C2424
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:28:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732863AbgKXL2f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:28:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732849AbgKXL2e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:28:34 -0500
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53D4FC0613D6
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 03:28:34 -0800 (PST)
Received: by mail-qv1-xf41.google.com with SMTP id n9so4117005qvp.5
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 03:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=8i2w/gUSUCotE/o5R8JrbwbZnNpUCxG77GxL7XiCprs=;
        b=Zl4mZrvLKB/Skw7MZ5pK8ZpmJ3FSWP+ZfKGljRTPQjRrCl+4E6GTE/VnCsMi5NM5uH
         kEiD7HueR874161AA1du941eaVnqkJVzt5Y2XZ49Vy7p1KNL9JLopRZub4ylci3Wdpyh
         CgZgj7cmY2FpggOZLI+DGyJ/bfTMzQmzTMYn6CPMYTLZXiXCFmt6m9EV8vONmaAAOpur
         HLrH4rJxwFzL1Cocex3I6ryovdzdEzu/Gob0uV/13eDRMZU9pLVW0rCWEv7yMzAcXS4N
         k8/4VtAqD4643QlwdGL9qFQn4NxRVS55sR3ROxh6SpOxWk87W8xSeeht8RY02rHUR1vl
         D7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8i2w/gUSUCotE/o5R8JrbwbZnNpUCxG77GxL7XiCprs=;
        b=cj0TfsIVwC6Y3eRgDRkq6/YCRv4GKB0aPmbb7Alyxb/jzt7H2SxT6PbKbF/Fwm8KiT
         76HUczZi6mj7wEeHWnjXmKq15DW8cSKbIejtepQRN2DmJZSUPEegwB7RX36x4LIC6DWY
         hFyoYR8wu1+SYMCyVl62QUeggEQfJORwUckmI7KzuDjkmvDAKYMc4WzPAwrXFwHzy+42
         TK5szRHSaFkSuKRTm5S7v1ZMlG1H5lT+Nifr2DImijeuWdjPpJgv4WpwfFqFgVscuqnt
         2bINtol8zsOynRHG445nRXDHbJD1nMgBSrKVghAhpA4U6G8d7Ya8gbK1jlCvpluyUHmx
         aUFA==
X-Gm-Message-State: AOAM531pQXx/PhC3/Hod1dzvXc8tl+9DhCGU6yzkx2oijm7QyrTP5uV6
        A4YVxB2S4XsAOLKu1aYY5tQ=
X-Google-Smtp-Source: ABdhPJzNOnjlcFMrCBOfF2kJKYuba/PVR948DKvkkFJ50YK8En4XNvYLm8uT3xAL30GGo0uJaj1PIw==
X-Received: by 2002:a05:6214:924:: with SMTP id dk4mr4158140qvb.19.1606217313495;
        Tue, 24 Nov 2020 03:28:33 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:c91:9ce8:56e7:5368:ece8])
        by smtp.gmail.com with ESMTPSA id x4sm14405943qtm.48.2020.11.24.03.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 03:28:32 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     p.zabel@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
        linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] media: coda: Convert the driver to DT-only
Date:   Tue, 24 Nov 2020 08:28:22 -0300
Message-Id: <20201124112822.29414-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since 5.10-rc1 i.MX is a devicetree-only platform, so simplify the code
by removing the unused non-DT support.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/media/platform/coda/coda-common.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index d30eafea701d..b1b29c13dba3 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -3102,13 +3102,6 @@ static const struct coda_devtype coda_devdata[] = {
 	},
 };
 
-static const struct platform_device_id coda_platform_ids[] = {
-	{ .name = "coda-imx27", .driver_data = CODA_IMX27 },
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(platform, coda_platform_ids);
-
-#ifdef CONFIG_OF
 static const struct of_device_id coda_dt_ids[] = {
 	{ .compatible = "fsl,imx27-vpu", .data = &coda_devdata[CODA_IMX27] },
 	{ .compatible = "fsl,imx51-vpu", .data = &coda_devdata[CODA_IMX51] },
@@ -3118,13 +3111,9 @@ static const struct of_device_id coda_dt_ids[] = {
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, coda_dt_ids);
-#endif
 
 static int coda_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *of_id =
-			of_match_device(of_match_ptr(coda_dt_ids), &pdev->dev);
-	const struct platform_device_id *pdev_id;
 	struct coda_platform_data *pdata = pdev->dev.platform_data;
 	struct device_node *np = pdev->dev.of_node;
 	struct gen_pool *pool;
@@ -3135,14 +3124,7 @@ static int coda_probe(struct platform_device *pdev)
 	if (!dev)
 		return -ENOMEM;
 
-	pdev_id = of_id ? of_id->data : platform_get_device_id(pdev);
-
-	if (of_id)
-		dev->devtype = of_id->data;
-	else if (pdev_id)
-		dev->devtype = &coda_devdata[pdev_id->driver_data];
-	else
-		return -EINVAL;
+	dev->devtype = of_device_get_match_data(&pdev->dev);
 
 	dev->dev = &pdev->dev;
 	dev->clk_per = devm_clk_get(&pdev->dev, "per");
@@ -3342,7 +3324,6 @@ static struct platform_driver coda_driver = {
 		.of_match_table = of_match_ptr(coda_dt_ids),
 		.pm	= &coda_pm_ops,
 	},
-	.id_table = coda_platform_ids,
 };
 
 module_platform_driver(coda_driver);
-- 
2.17.1

